Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45A0A20
	for <linux-sunxi@lists.linux.dev>; Sun, 29 Oct 2023 04:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWnydzym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16786C433C8;
	Sun, 29 Oct 2023 04:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698555420;
	bh=sHgfFAYO70c894DjN0E352MLi6hviuWFMljb+EHZVmM=;
	h=From:To:Cc:Subject:Date:From;
	b=DWnydzymxvMlcWr5tK4thYFwaXIpUi26FV93o9PBElsxTVsHvPfBpatvqL3mRm68X
	 mDnkSbjAaNsjm/T5N5K5sjLtABEi/GrFvT6JryzyQfxIracpGxDDOL5psGAgeJ8sXK
	 LxJjyBfxKHv0CihXRs0IXVHGGwLe+k0QtKwUPhx05Tj46w67dXvkRm1/Qt3sdUrGsD
	 bNw5+1Sbym9gkdNpl+FY9TR9QsspaNXYB9Zv9lLgB+E9ujP23EfeI+rMABek0i7LMy
	 TvmA+ouXXWELmuaANvBDrUrFvWfEHdVAA2et0J6ziFFdEvwAuisXJDJ1kzho7t6YDR
	 2HSmVa6mXtu3g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev,
	Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH] crypto: sun8i-ss - use crypto_shash_tfm_digest() in sun8i_ss_hashkey()
Date: Sat, 28 Oct 2023 21:56:13 -0700
Message-ID: <20231029045613.153689-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Simplify sun8i_ss_hashkey() by using crypto_shash_tfm_digest() instead
of an alloc+init+update+final sequence.  This should also improve
performance.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 .../crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 25 +++----------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index d70b105dcfa1..753f67a36dc5 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -23,47 +23,30 @@
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include "sun8i-ss.h"
 
 static int sun8i_ss_hashkey(struct sun8i_ss_hash_tfm_ctx *tfmctx, const u8 *key,
 			    unsigned int keylen)
 {
 	struct crypto_shash *xtfm;
-	struct shash_desc *sdesc;
-	size_t len;
-	int ret = 0;
+	int ret;
 
 	xtfm = crypto_alloc_shash("sha1", 0, CRYPTO_ALG_NEED_FALLBACK);
 	if (IS_ERR(xtfm))
 		return PTR_ERR(xtfm);
 
-	len = sizeof(*sdesc) + crypto_shash_descsize(xtfm);
-	sdesc = kmalloc(len, GFP_KERNEL);
-	if (!sdesc) {
-		ret = -ENOMEM;
-		goto err_hashkey_sdesc;
-	}
-	sdesc->tfm = xtfm;
-
-	ret = crypto_shash_init(sdesc);
-	if (ret) {
-		dev_err(tfmctx->ss->dev, "shash init error ret=%d\n", ret);
-		goto err_hashkey;
-	}
-	ret = crypto_shash_finup(sdesc, key, keylen, tfmctx->key);
+	ret = crypto_shash_tfm_digest(xtfm, key, keylen, tfmctx->key);
 	if (ret)
-		dev_err(tfmctx->ss->dev, "shash finup error\n");
-err_hashkey:
-	kfree(sdesc);
-err_hashkey_sdesc:
+		dev_err(tfmctx->ss->dev, "shash digest error ret=%d\n", ret);
+
 	crypto_free_shash(xtfm);
 	return ret;
 }
 
 int sun8i_ss_hmac_setkey(struct crypto_ahash *ahash, const u8 *key,
 			 unsigned int keylen)
 {
 	struct sun8i_ss_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(ahash);
 	int digestsize, i;
 	int bs = crypto_ahash_blocksize(ahash);

base-commit: 2af9b20dbb39f6ebf9b9b6c090271594627d818e
-- 
2.42.0

