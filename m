Received: from qq.com (smtpbg476.qq.com [59.36.132.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7B8168
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Jul 2021 13:32:53 +0000 (UTC)
X-QQ-mid: bizesmtp43t1625145759tidyuqpf
Received: from localhost.localdomain (unknown [182.148.13.55])
	by esmtp6.qq.com (ESMTP) with 
	id ; Thu, 01 Jul 2021 21:22:38 +0800 (CST)
X-QQ-SSF: 0100000000800030B000C00A0000000
X-QQ-FEAT: wBH9KxarUr7L4E45ckeNFtCb4eKB/U0CoWgf/3ipYZXktK2UHOiFmCHsWHfya
	/gs+fPThY1CwHRcJVCXI4I8O7kzW2DAbpFH3tQ0OTGMCR659PN7Wo4tVCRcyN3CnOK9PWqc
	WU7z4mhXbrgnYBLc9OjvoAuszHilEE3DOyjjZzYUl07j540UIT5TGvEXBWUu5SpV0IUJPgU
	Ps/6O16AQHUe+w2Z7UXQAeh+KWf+OzSHdErcPh/YeIVzDFN1FfJZQz5cYw816eU70RdvN6E
	KcZ24GsusLRaXxT+/NzuRLHDw3Nre7z653r/k+j7Y0w5tdNM7etHKSR5S/FARze3LR5facd
	VitnvFGbWMooip6u7jdLzVepOAxlg==
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: herbert@gondor.apana.org.au
Cc: clabbe.montjoie@gmail.com,
	davem@davemloft.net,
	mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	colin.king@canonical.com,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jason Wang <wangborong@cdjrlc.com>
Subject: [PATCH] crypto: sun8i-ss - Use kfree_sensitive
Date: Thu,  1 Jul 2021 21:22:00 +0800
Message-Id: <20210701132200.31583-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgweb:qybgweb14

The kfree_sensitive is a kernel API to clear sensitive information
that should not be leaked to other future users of the same memory
objects and free the memory. Its function is the same as the
combination of memzero_explicit and kfree. Thus, we can replace the
combination APIs with the single kfree_sensitive API.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c
index 3191527928e4..246a6782674c 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c
@@ -20,8 +20,7 @@ int sun8i_ss_prng_seed(struct crypto_rng *tfm, const u8 *seed,
 	struct sun8i_ss_rng_tfm_ctx *ctx = crypto_rng_ctx(tfm);
 
 	if (ctx->seed && ctx->slen != slen) {
-		memzero_explicit(ctx->seed, ctx->slen);
-		kfree(ctx->seed);
+		kfree_sensitive(ctx->seed);
 		ctx->slen = 0;
 		ctx->seed = NULL;
 	}
@@ -48,8 +47,7 @@ void sun8i_ss_prng_exit(struct crypto_tfm *tfm)
 {
 	struct sun8i_ss_rng_tfm_ctx *ctx = crypto_tfm_ctx(tfm);
 
-	memzero_explicit(ctx->seed, ctx->slen);
-	kfree(ctx->seed);
+	kfree_sensitive(ctx->seed);
 	ctx->seed = NULL;
 	ctx->slen = 0;
 }
@@ -167,9 +165,8 @@ int sun8i_ss_prng_generate(struct crypto_rng *tfm, const u8 *src,
 		/* Update seed */
 		memcpy(ctx->seed, d + dlen, ctx->slen);
 	}
-	memzero_explicit(d, todo);
 err_free:
-	kfree(d);
+	kfree_sensitive(d);
 
 	return err;
 }
-- 
2.32.0

