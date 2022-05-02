Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6A73210
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 20:20:00 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id o12-20020a1c4d0c000000b00393fbe2973dso208768wmh.2
        for <linux-sunxi@lists.linux.dev>; Mon, 02 May 2022 13:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hnLf6ANTLXHz5g8yhdCYklAPeG3EJL9SIZ6fc2YpRWI=;
        b=DKp2KbM39QMvNXnqZ3EXGT7jJ7H8w7steQrt1bk/OPISgycRunSgieduAuwUD7WIsv
         4NA9MbthKp8v4CiEWmwTUuuaJ8OXJnl9qgVgMg5OUnl8hkyfBt4eQrf784S25g7VqDSg
         9Kh+qT3y6JNf9MRF1XyRC2pw6rapvo3EDQNaLpm8w9KTE1kR8BCH6Y/YcxGss1pDuH8L
         jD1dDCZIRtH4j6nX62T5LPU39ugBpO0VnhNrBzuDtopUtByOnNqQTebgX3ogxip4f4b7
         mPOs62GI23QDSmK22huBptJfligJwskiYnARNobNTNwtEuCcKfwEwRJLfAGOMGVlIs0J
         Ohpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hnLf6ANTLXHz5g8yhdCYklAPeG3EJL9SIZ6fc2YpRWI=;
        b=E7lmzvCYwNgROZBEpGksJb3tucPDYY2O+UDh0PKVkvRhX1haq9e2dmx+u2s3bhoD81
         WP7h6hN9WADIN1QbXTWk6muOxn95W+qCYprLxdOKV8u6mlHmw8Vun1FuCfd2A3PiZtws
         iBZzTCFrW8DeEiF7zzd/BU25icQSVRfqvz5gIp4PnOPGRB+LGLIVkBYacUiLR4wERDJk
         lK/3jm3sZqDE/6SV7j4+5DrA0SoUVZrvy04DboLWpeB7o0HQAwuCvm7N20XKqBEQXsFn
         //3mbzo1JM0YSuWQPDAMhUmldVqd4cBGHTnElTcgV31eXsr7I4OkD3fUvZSPdssIgzGf
         kNkQ==
X-Gm-Message-State: AOAM5323obFwpn9l7yQGkv9zsFvaE+j7y5BZIB3Oa3JazYPSc0T4CBXj
	nNtiwwljVFjdiIGI5mUb+PYqGQ==
X-Google-Smtp-Source: ABdhPJxmb/JGlcoytmPL4qI1E4edM4eoAg0E9wAOZ45V7R2hhGyKm5HKAPaJ8l3Mt8muAdVLc0z2dA==
X-Received: by 2002:a05:600c:502a:b0:394:4d62:f0d3 with SMTP id n42-20020a05600c502a00b003944d62f0d3mr196004wmr.102.1651522799190;
        Mon, 02 May 2022 13:19:59 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id l2-20020adfb102000000b0020c547f75easm7238183wra.101.2022.05.02.13.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 13:19:58 -0700 (PDT)
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
Subject: [PATCH v2 18/19] crypto: sun8i-ce: rework debugging
Date: Mon,  2 May 2022 20:19:28 +0000
Message-Id: <20220502201929.843194-19-clabbe@baylibre.com>
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
Let's add more precise fallback stats and display it better.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 43 +++++++++++++++----
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c | 34 +++++++++++++--
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 27 +++++++++---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  | 11 ++++-
 4 files changed, 96 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 35ab71d3a82d..315a62e424d6 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -25,27 +25,54 @@ static int sun8i_ce_cipher_need_fallback(struct skcipher_request *areq)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(areq);
 	struct scatterlist *sg;
+	struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
+	struct sun8i_ce_alg_template *algt;
+
+	algt = container_of(alg, struct sun8i_ce_alg_template, alg.skcipher);
 
 	if (sg_nents_for_len(areq->src, areq->cryptlen) > MAX_SG ||
-	    sg_nents_for_len(areq->dst, areq->cryptlen) > MAX_SG)
+	    sg_nents_for_len(areq->dst, areq->cryptlen) > MAX_SG) {
+		algt->stat_fb_maxsg++;
 		return true;
+	}
+
+	if (areq->cryptlen < crypto_skcipher_ivsize(tfm)) {
+		algt->stat_fb_leniv++;
+		return true;
+	}
 
-	if (areq->cryptlen < crypto_skcipher_ivsize(tfm))
+	if (areq->cryptlen == 0) {
+		algt->stat_fb_len0++;
 		return true;
+	}
 
-	if (areq->cryptlen == 0 || areq->cryptlen % 16)
+	if (areq->cryptlen % 16) {
+		algt->stat_fb_mod16++;
 		return true;
+	}
 
 	sg = areq->src;
 	while (sg) {
-		if (sg->length % 4 || !IS_ALIGNED(sg->offset, sizeof(u32)))
+		if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
+			algt->stat_fb_srcali++;
+			return true;
+		}
+		if (sg->length % 4) {
+			algt->stat_fb_srclen++;
 			return true;
+		}
 		sg = sg_next(sg);
 	}
 	sg = areq->dst;
 	while (sg) {
-		if (sg->length % 4 || !IS_ALIGNED(sg->offset, sizeof(u32)))
+		if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
+			algt->stat_fb_dstali++;
+			return true;
+		}
+		if (sg->length % 4) {
+			algt->stat_fb_dstlen++;
 			return true;
+		}
 		sg = sg_next(sg);
 	}
 	return false;
@@ -384,9 +411,9 @@ int sun8i_ce_cipher_init(struct crypto_tfm *tfm)
 	sktfm->reqsize = sizeof(struct sun8i_cipher_req_ctx) +
 			 crypto_skcipher_reqsize(op->fallback_tfm);
 
-	dev_info(op->ce->dev, "Fallback for %s is %s\n",
-		 crypto_tfm_alg_driver_name(&sktfm->base),
-		 crypto_tfm_alg_driver_name(crypto_skcipher_tfm(op->fallback_tfm)));
+	memcpy(algt->fbname,
+	       crypto_tfm_alg_driver_name(crypto_skcipher_tfm(op->fallback_tfm)),
+	       CRYPTO_MAX_ALG_NAME);
 
 	op->enginectx.op.do_one_request = sun8i_ce_cipher_run;
 	op->enginectx.op.prepare_request = sun8i_ce_cipher_prepare;
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index 8f902607af68..7f608e1e6bde 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -644,19 +644,47 @@ static int sun8i_ce_debugfs_show(struct seq_file *seq, void *v)
 			continue;
 		switch (ce_algs[i].type) {
 		case CRYPTO_ALG_TYPE_SKCIPHER:
-			seq_printf(seq, "%s %s %lu %lu\n",
+			seq_printf(seq, "%s %s reqs=%lu fallback=%lu\n",
 				   ce_algs[i].alg.skcipher.base.cra_driver_name,
 				   ce_algs[i].alg.skcipher.base.cra_name,
 				   ce_algs[i].stat_req, ce_algs[i].stat_fb);
+			seq_printf(seq, "\tLast fallback is: %s\n",
+				   ce_algs[i].fbname);
+			seq_printf(seq, "\tFallback due to 0 length: %lu\n",
+				   ce_algs[i].stat_fb_len0);
+			seq_printf(seq, "\tFallback due to length !mod16: %lu\n",
+				   ce_algs[i].stat_fb_mod16);
+			seq_printf(seq, "\tFallback due to length < IV: %lu\n",
+				   ce_algs[i].stat_fb_leniv);
+			seq_printf(seq, "\tFallback due to source alignment: %lu\n",
+				   ce_algs[i].stat_fb_srcali);
+			seq_printf(seq, "\tFallback due to dest alignment: %lu\n",
+				   ce_algs[i].stat_fb_dstali);
+			seq_printf(seq, "\tFallback due to source length: %lu\n",
+				   ce_algs[i].stat_fb_srclen);
+			seq_printf(seq, "\tFallback due to dest length: %lu\n",
+				   ce_algs[i].stat_fb_dstlen);
+			seq_printf(seq, "\tFallback due to SG numbers: %lu\n",
+				   ce_algs[i].stat_fb_maxsg);
 			break;
 		case CRYPTO_ALG_TYPE_AHASH:
-			seq_printf(seq, "%s %s %lu %lu\n",
+			seq_printf(seq, "%s %s reqs=%lu fallback=%lu\n",
 				   ce_algs[i].alg.hash.halg.base.cra_driver_name,
 				   ce_algs[i].alg.hash.halg.base.cra_name,
 				   ce_algs[i].stat_req, ce_algs[i].stat_fb);
+			seq_printf(seq, "\tLast fallback is: %s\n",
+				   ce_algs[i].fbname);
+			seq_printf(seq, "\tFallback due to 0 length: %lu\n",
+				   ce_algs[i].stat_fb_len0);
+			seq_printf(seq, "\tFallback due to length: %lu\n",
+				   ce_algs[i].stat_fb_srclen);
+			seq_printf(seq, "\tFallback due to alignment: %lu\n",
+				   ce_algs[i].stat_fb_srcali);
+			seq_printf(seq, "\tFallback due to SG numbers: %lu\n",
+				   ce_algs[i].stat_fb_maxsg);
 			break;
 		case CRYPTO_ALG_TYPE_RNG:
-			seq_printf(seq, "%s %s %lu %lu\n",
+			seq_printf(seq, "%s %s reqs=%lu bytes=%lu\n",
 				   ce_algs[i].alg.rng.base.cra_driver_name,
 				   ce_algs[i].alg.rng.base.cra_name,
 				   ce_algs[i].stat_req, ce_algs[i].stat_bytes);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 59e07eb5f058..8b5b9b9d04c3 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -50,9 +50,9 @@ int sun8i_ce_hash_crainit(struct crypto_tfm *tfm)
 				 sizeof(struct sun8i_ce_hash_reqctx) +
 				 crypto_ahash_reqsize(op->fallback_tfm));
 
-	dev_info(op->ce->dev, "Fallback for %s is %s\n",
-		 crypto_tfm_alg_driver_name(tfm),
-		 crypto_tfm_alg_driver_name(&op->fallback_tfm->base));
+	memcpy(algt->fbname, crypto_tfm_alg_driver_name(&op->fallback_tfm->base),
+	       CRYPTO_MAX_ALG_NAME);
+
 	err = pm_runtime_get_sync(op->ce->dev);
 	if (err < 0)
 		goto error_pm;
@@ -199,17 +199,32 @@ static int sun8i_ce_hash_digest_fb(struct ahash_request *areq)
 
 static bool sun8i_ce_hash_need_fallback(struct ahash_request *areq)
 {
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
+	struct ahash_alg *alg = __crypto_ahash_alg(tfm->base.__crt_alg);
+	struct sun8i_ce_alg_template *algt;
 	struct scatterlist *sg;
 
-	if (areq->nbytes == 0)
+	algt = container_of(alg, struct sun8i_ce_alg_template, alg.hash);
+
+	if (areq->nbytes == 0) {
+		algt->stat_fb_len0++;
 		return true;
+	}
 	/* we need to reserve one SG for padding one */
-	if (sg_nents_for_len(areq->src, areq->nbytes) > MAX_SG - 1)
+	if (sg_nents_for_len(areq->src, areq->nbytes) > MAX_SG - 1) {
+		algt->stat_fb_maxsg++;
 		return true;
+	}
 	sg = areq->src;
 	while (sg) {
-		if (sg->length % 4 || !IS_ALIGNED(sg->offset, sizeof(u32)))
+		if (sg->length % 4) {
+			algt->stat_fb_srclen++;
 			return true;
+		}
+		if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
+			algt->stat_fb_srcali++;
+			return true;
+		}
 		sg = sg_next(sg);
 	}
 	return false;
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index 229b696d5a2c..30a6405b2051 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -393,11 +393,18 @@ struct sun8i_ce_alg_template {
 		struct rng_alg rng;
 		struct akcipher_alg rsa;
 	} alg;
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
 	unsigned long stat_req;
 	unsigned long stat_fb;
 	unsigned long stat_bytes;
-#endif
+	unsigned long stat_fb_maxsg;
+	unsigned long stat_fb_leniv;
+	unsigned long stat_fb_len0;
+	unsigned long stat_fb_mod16;
+	unsigned long stat_fb_srcali;
+	unsigned long stat_fb_srclen;
+	unsigned long stat_fb_dstali;
+	unsigned long stat_fb_dstlen;
+	char fbname[CRYPTO_MAX_ALG_NAME];
 };
 
 int sun8i_ce_enqueue(struct crypto_async_request *areq, u32 type);
-- 
2.35.1

