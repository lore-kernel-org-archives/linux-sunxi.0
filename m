Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F8A376
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Aug 2023 03:15:03 +0000 (UTC)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RLFTc369Hz1hwMC;
	Wed,  9 Aug 2023 11:12:04 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 9 Aug
 2023 11:14:53 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <clabbe.montjoie@gmail.com>, <herbert@gondor.apana.org.au>,
	<davem@davemloft.net>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <yuehaibing@huawei.com>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>
Subject: [PATCH -next] crypto: allwinner - Remove unused function declarations
Date: Wed, 9 Aug 2023 11:14:43 +0800
Message-ID: <20230809031443.39312-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected

Commit 06f751b61329 ("crypto: allwinner - Add sun8i-ce Crypto Engine")
declared but never implemented sun8i_ce_enqueue().
Commit 56f6d5aee88d ("crypto: sun8i-ce - support hash algorithms")
declared but never implemented sun8i_ce_hash().
Commit f08fcced6d00 ("crypto: allwinner - Add sun8i-ss cryptographic offloader")
declared but never implemented sun8i_ss_enqueue().

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h | 3 ---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index 27029fb77e29..4742b48ef52e 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -347,8 +347,6 @@ struct sun8i_ce_alg_template {
 	char fbname[CRYPTO_MAX_ALG_NAME];
 };
 
-int sun8i_ce_enqueue(struct crypto_async_request *areq, u32 type);
-
 int sun8i_ce_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 			unsigned int keylen);
 int sun8i_ce_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
@@ -367,7 +365,6 @@ void sun8i_ce_hash_craexit(struct crypto_tfm *tfm);
 int sun8i_ce_hash_init(struct ahash_request *areq);
 int sun8i_ce_hash_export(struct ahash_request *areq, void *out);
 int sun8i_ce_hash_import(struct ahash_request *areq, const void *in);
-int sun8i_ce_hash(struct ahash_request *areq);
 int sun8i_ce_hash_final(struct ahash_request *areq);
 int sun8i_ce_hash_update(struct ahash_request *areq);
 int sun8i_ce_hash_finup(struct ahash_request *areq);
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
index df6f08f6092f..bfe305261e9a 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
@@ -293,8 +293,6 @@ struct sun8i_ss_alg_template {
 	char fbname[CRYPTO_MAX_ALG_NAME];
 };
 
-int sun8i_ss_enqueue(struct crypto_async_request *areq, u32 type);
-
 int sun8i_ss_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 			unsigned int keylen);
 int sun8i_ss_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
-- 
2.34.1

