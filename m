Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD2E3210
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 20:19:54 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 129so8853825wmz.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 May 2022 13:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t1rWH8EkKjzUi0sXb9Nmfb9EEjMe/oHCHN553F8hg/c=;
        b=geTCmE966V0DrhuP8tTXMustJYvfUWc3czrOC+YV/4Ssk0f1y8xCaqSnOhkZ3Yh69Z
         e1fKIN45m5P517yxphjZ1YQap0K3pc4cr6YXMXJw9j+KAJ9v96LHOW378FQwwZKyl2/4
         kp2A3bAPYE8D5Jd4m6Z5aoyuSE4nMsaL7g95ZHJO8qnbUlRaYf/E4RacHV+m4l1rcRcw
         bQ7AMc/f41wp7FEhAsbck6gIhaF/cSZN1omsgVkXe80EpyiAn8FrIoOe5t+4guGeaFRt
         BAYAXltjxVVVZi20abbw+0sdwzd5bRUbCKzkx8SuNDPkZvYoMVx0cbhqsHB8XXs3itj8
         5qdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t1rWH8EkKjzUi0sXb9Nmfb9EEjMe/oHCHN553F8hg/c=;
        b=1kL0HxcIvWQsdezCkQXTU1B4UVFI0mHHXdeypzA2qBWipudzb7AbMmNfom7T9a9W9b
         XyQDfAahceCE3ANT4fPQgMWQn+ZywkB7ExzD1tEz92Iuqirwr03wu9ObV7013BWEdOZU
         p6fuvissJ3wVDdHVGPP07OqsyoJoMX/JJN4UVAUWI1jyQ9H4RurcNaSEQ5zl1IPpvjrn
         qEG07+3Mt+kfHBbDFXELLK2qjoUUpLv0MY8Sb/9wKbC9TfaTysFgKoxXQuSiocGmK/x/
         OryH3QLkkbTHtqw7tK5aBElzZSM8+12cLeVNg9bFVswt8YprMTuH5theF3Ydc2qo7Cou
         GRgA==
X-Gm-Message-State: AOAM533jMIXjqqA/n07PRxXdJdjrxCcuAzPbBPi24ZnDbE1SgyJ/0PA5
	eJ1w/5u2k7x0kBCXIcAwQVxOpg==
X-Google-Smtp-Source: ABdhPJwK6U8fhYmWssHvBV6f3I3j+KBkxOhVy/4UJ2KDacD8HYPRTMRA0THUVJWZyJaVnck4yboDXQ==
X-Received: by 2002:a7b:c74f:0:b0:394:1ce3:cc42 with SMTP id w15-20020a7bc74f000000b003941ce3cc42mr546136wmk.153.1651522792494;
        Mon, 02 May 2022 13:19:52 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id l2-20020adfb102000000b0020c547f75easm7238183wra.101.2022.05.02.13.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 13:19:52 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: herbert@gondor.apana.org.au,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	wens@csie.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 12/19] crypto: sun8i-ss: rework debugging
Date: Mon,  2 May 2022 20:19:22 +0000
Message-Id: <20220502201929.843194-13-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502201929.843194-1-clabbe@baylibre.com>
References: <20220502201929.843194-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "Fallback for xxx" message is annoying, remove it and store the
information in the debugfs.
In the same time, reports more fallback statistics.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 .../allwinner/sun8i-ss/sun8i-ss-cipher.c      | 41 ++++++++++++++-----
 .../crypto/allwinner/sun8i-ss/sun8i-ss-core.c | 21 ++++++++++
 .../crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 36 ++++++++++++----
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h  |  7 +++-
 4 files changed, 83 insertions(+), 22 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
index c4cb1ab1eeaa..7f1940c6cc41 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
@@ -22,35 +22,54 @@
 
 static bool sun8i_ss_need_fallback(struct skcipher_request *areq)
 {
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
+	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
+	struct sun8i_ss_alg_template *algt = container_of(alg, struct sun8i_ss_alg_template, alg.skcipher);
 	struct scatterlist *in_sg = areq->src;
 	struct scatterlist *out_sg = areq->dst;
 	struct scatterlist *sg;
 
-	if (areq->cryptlen == 0 || areq->cryptlen % 16)
+	if (areq->cryptlen == 0 || areq->cryptlen % 16) {
+		algt->stat_fb_len++;
 		return true;
+	}
 
 	if (sg_nents_for_len(areq->src, areq->cryptlen) > 8 ||
-		sg_nents_for_len(areq->dst, areq->cryptlen) > 8)
+		sg_nents_for_len(areq->dst, areq->cryptlen) > 8) {
+		algt->stat_fb_sgnum++;
 		return true;
+	}
 
 	sg = areq->src;
 	while (sg) {
-		if ((sg->length % 16) != 0)
+		if ((sg->length % 16) != 0) {
+			algt->stat_fb_sglen++;
 			return true;
-		if ((sg_dma_len(sg) % 16) != 0)
+		}
+		if ((sg_dma_len(sg) % 16) != 0) {
+			algt->stat_fb_sglen++;
 			return true;
-		if (!IS_ALIGNED(sg->offset, 16))
+		}
+		if (!IS_ALIGNED(sg->offset, 16)) {
+			algt->stat_fb_align++;
 			return true;
+		}
 		sg = sg_next(sg);
 	}
 	sg = areq->dst;
 	while (sg) {
-		if ((sg->length % 16) != 0)
+		if ((sg->length % 16) != 0) {
+			algt->stat_fb_sglen++;
 			return true;
-		if ((sg_dma_len(sg) % 16) != 0)
+		}
+		if ((sg_dma_len(sg) % 16) != 0) {
+			algt->stat_fb_sglen++;
 			return true;
-		if (!IS_ALIGNED(sg->offset, 16))
+		}
+		if (!IS_ALIGNED(sg->offset, 16)) {
+			algt->stat_fb_align++;
 			return true;
+		}
 		sg = sg_next(sg);
 	}
 
@@ -385,9 +404,9 @@ int sun8i_ss_cipher_init(struct crypto_tfm *tfm)
 			 crypto_skcipher_reqsize(op->fallback_tfm);
 
 
-	dev_info(op->ss->dev, "Fallback for %s is %s\n",
-		 crypto_tfm_alg_driver_name(&sktfm->base),
-		 crypto_tfm_alg_driver_name(crypto_skcipher_tfm(op->fallback_tfm)));
+	memcpy(algt->fbname,
+	       crypto_tfm_alg_driver_name(crypto_skcipher_tfm(op->fallback_tfm)),
+	       CRYPTO_MAX_ALG_NAME);
 
 	op->enginectx.op.do_one_request = sun8i_ss_handle_cipher_request;
 	op->enginectx.op.prepare_request = NULL;
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
index 8d31fd4968f3..f09de5737e8b 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
@@ -430,6 +430,17 @@ static int sun8i_ss_debugfs_show(struct seq_file *seq, void *v)
 				   ss_algs[i].alg.skcipher.base.cra_driver_name,
 				   ss_algs[i].alg.skcipher.base.cra_name,
 				   ss_algs[i].stat_req, ss_algs[i].stat_fb);
+
+			seq_printf(seq, "\tLast fallback is: %s\n",
+				   ss_algs[i].fbname);
+			seq_printf(seq, "\tFallback due to length: %lu\n",
+				   ss_algs[i].stat_fb_len);
+			seq_printf(seq, "\tFallback due to SG length: %lu\n",
+				   ss_algs[i].stat_fb_sglen);
+			seq_printf(seq, "\tFallback due to alignment: %lu\n",
+				   ss_algs[i].stat_fb_align);
+			seq_printf(seq, "\tFallback due to SG numbers: %lu\n",
+				   ss_algs[i].stat_fb_sgnum);
 			break;
 		case CRYPTO_ALG_TYPE_RNG:
 			seq_printf(seq, "%s %s reqs=%lu tsize=%lu\n",
@@ -442,6 +453,16 @@ static int sun8i_ss_debugfs_show(struct seq_file *seq, void *v)
 				   ss_algs[i].alg.hash.halg.base.cra_driver_name,
 				   ss_algs[i].alg.hash.halg.base.cra_name,
 				   ss_algs[i].stat_req, ss_algs[i].stat_fb);
+			seq_printf(seq, "\tLast fallback is: %s\n",
+				   ss_algs[i].fbname);
+			seq_printf(seq, "\tFallback due to length: %lu\n",
+				   ss_algs[i].stat_fb_len);
+			seq_printf(seq, "\tFallback due to SG length: %lu\n",
+				   ss_algs[i].stat_fb_sglen);
+			seq_printf(seq, "\tFallback due to alignment: %lu\n",
+				   ss_algs[i].stat_fb_align);
+			seq_printf(seq, "\tFallback due to SG numbers: %lu\n",
+				   ss_algs[i].stat_fb_sgnum);
 			break;
 		}
 	}
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index 1b44c1a115d6..cb510ec21ec4 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -51,9 +51,8 @@ int sun8i_ss_hash_crainit(struct crypto_tfm *tfm)
 				 sizeof(struct sun8i_ss_hash_reqctx) +
 				 crypto_ahash_reqsize(op->fallback_tfm));
 
-	dev_info(op->ss->dev, "Fallback for %s is %s\n",
-		 crypto_tfm_alg_driver_name(tfm),
-		 crypto_tfm_alg_driver_name(&op->fallback_tfm->base));
+	memcpy(algt->fbname, crypto_tfm_alg_driver_name(&op->fallback_tfm->base), CRYPTO_MAX_ALG_NAME);
+
 	err = pm_runtime_get_sync(op->ss->dev);
 	if (err < 0)
 		goto error_pm;
@@ -259,16 +258,29 @@ static int sun8i_ss_run_hash_task(struct sun8i_ss_dev *ss,
 
 static bool sun8i_ss_hash_need_fallback(struct ahash_request *areq)
 {
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
+	struct ahash_alg *alg = __crypto_ahash_alg(tfm->base.__crt_alg);
+	struct sun8i_ss_alg_template *algt;
 	struct scatterlist *sg;
 
-	if (areq->nbytes == 0)
+	algt = container_of(alg, struct sun8i_ss_alg_template, alg.hash);
+
+	if (areq->nbytes == 0) {
+		algt->stat_fb_len++;
 		return true;
-	if (areq->nbytes >= MAX_PAD_SIZE - 64)
+	}
+
+	if (areq->nbytes >= MAX_PAD_SIZE - 64) {
+		algt->stat_fb_len++;
 		return true;
+	}
 
 	/* we need to reserve one SG for the padding one */
-	if (sg_nents(areq->src) > MAX_SG - 1)
+	if (sg_nents(areq->src) > MAX_SG - 1) {
+		algt->stat_fb_sgnum++;
 		return true;
+	}
+
 	sg = areq->src;
 	while (sg) {
 		/* SS can operate hash only on full block size
@@ -276,12 +288,18 @@ static bool sun8i_ss_hash_need_fallback(struct ahash_request *areq)
 		 * is always 64
 		 */
 		/* Only the last block could be bounced to the pad buffer */
-		if (sg->length % 64 && sg_next(sg))
+		if (sg->length % 64 && sg_next(sg)) {
+			algt->stat_fb_sglen++;
 			return true;
-		if (!IS_ALIGNED(sg->offset, sizeof(u32)))
+		}
+		if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
+			algt->stat_fb_align++;
 			return true;
-		if (sg->length % 4)
+		}
+		if (sg->length % 4) {
+			algt->stat_fb_sglen++;
 			return true;
+		}
 		sg = sg_next(sg);
 	}
 	return false;
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
index 2e3524654aca..b56038de333b 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
@@ -279,11 +279,14 @@ struct sun8i_ss_alg_template {
 		struct rng_alg rng;
 		struct ahash_alg hash;
 	} alg;
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_SS_DEBUG
 	unsigned long stat_req;
 	unsigned long stat_fb;
 	unsigned long stat_bytes;
-#endif
+	unsigned long stat_fb_len;
+	unsigned long stat_fb_sglen;
+	unsigned long stat_fb_align;
+	unsigned long stat_fb_sgnum;
+	char fbname[CRYPTO_MAX_ALG_NAME];
 };
 
 int sun8i_ss_enqueue(struct crypto_async_request *areq, u32 type);
-- 
2.35.1

