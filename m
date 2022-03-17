Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1BF4AA4
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 20:56:15 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id u16so8017840wru.4
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 13:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uQfQxPxFJ18OHZiKr+H6x2uvjjAUEJks7M+mZV0XyDU=;
        b=vG79jgjz2mIirC6HPtq1s1Z17iIEdF3ci/7aS4GV58jGP9hG035vpPr81rTsZG4zUl
         lExQElszLy6zRDOjmm84y/a4OuEfCPJq8Eu6lz+Cx00JeuEfl5d0IP3S2xLvvz+Btmds
         DPloiAqhLpE03FkG6DsvaZ5smvWIwkZql2u7Wuw7yByS+js/pG0pi97M3qrIufqWCVB1
         jf7DRWIxHSfXZNnhfRx8yO3U+XFuJQ5G0VQgN2JRB1bBYXj3YY+Gptgo9318fCN/ydZ9
         RXt6OWIk8wZOOtl3SdkhpZam507q45p8HG9cg0OYPdYA33CatA1WTHEQ5xXAB0oua+x8
         N+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uQfQxPxFJ18OHZiKr+H6x2uvjjAUEJks7M+mZV0XyDU=;
        b=pJ1Ttq2oO5YEXd9LVqlUlOXW3HPOsiDXLwCE50TV5tNY6V0I5jJcPjgQ9UmVgzPY5g
         pZ3tD639JNUp+pvOSyiBL2LSOhok5G20rNDeckwQBV16Q7vsDcDuMWuny7i0pmyo5HzL
         UaPQQuz1rmdScuGs2yoDTbbbZXTKlpD+d771Rmc0n4YSNGsSP/mRbfj7lQDytfwdWb6m
         RHQZX9wJGJqn1Mh/tArvTFeJ5jQWk/sLTHi0n0nvgcCG4D/oQYc63tkzYBAXNOvCI2mc
         ya3Ceg1X6AAAslgaRRrp8FjHVL4d2n1WfXiQFEf8wZwJflsOFxpn2EDfP45FA+XZMc7L
         RdXQ==
X-Gm-Message-State: AOAM533l3SgXOADj5K8TRXp7djEsgDQDSNDtZ+JXVLqYZq4I3Hs5H4Gd
	UwzeFgONMJayuxykYh7tazVYeQ==
X-Google-Smtp-Source: ABdhPJw7YOXJcIKRbued1C1ZvMkge1ozlzN2bcoy2shhG4zS05af8Rk3mdUOdWCHfPuxovzsCgViFw==
X-Received: by 2002:a5d:6d8c:0:b0:203:d18a:89b6 with SMTP id l12-20020a5d6d8c000000b00203d18a89b6mr5550627wrs.163.1647550573613;
        Thu, 17 Mar 2022 13:56:13 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id r4-20020a05600c35c400b00389f368cf1esm3695424wmq.40.2022.03.17.13.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 13:56:13 -0700 (PDT)
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
Subject: [PATCH 03/19] crypto: sun4i-ss: do not allocate backup IV on requests
Date: Thu, 17 Mar 2022 20:55:49 +0000
Message-Id: <20220317205605.3924836-4-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317205605.3924836-1-clabbe@baylibre.com>
References: <20220317205605.3924836-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of allocate memory on each requests, it is easier to
pre-allocate buffer for backup IV.
This made error path easier.
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 .../allwinner/sun4i-ss/sun4i-ss-cipher.c      | 22 +++++++------------
 drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h  |  1 +
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c
index 8dc2a475c601..a8c784acce13 100644
--- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c
+++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss-cipher.c
@@ -20,7 +20,6 @@ static int noinline_for_stack sun4i_ss_opti_poll(struct skcipher_request *areq)
 	unsigned int ivsize = crypto_skcipher_ivsize(tfm);
 	struct sun4i_cipher_req_ctx *ctx = skcipher_request_ctx(areq);
 	u32 mode = ctx->mode;
-	void *backup_iv = NULL;
 	/* when activating SS, the default FIFO space is SS_RX_DEFAULT(32) */
 	u32 rx_cnt = SS_RX_DEFAULT;
 	u32 tx_cnt = 0;
@@ -47,10 +46,8 @@ static int noinline_for_stack sun4i_ss_opti_poll(struct skcipher_request *areq)
 	}
 
 	if (areq->iv && ivsize > 0 && mode & SS_DECRYPTION) {
-		backup_iv = kzalloc(ivsize, GFP_KERNEL);
-		if (!backup_iv)
-			return -ENOMEM;
-		scatterwalk_map_and_copy(backup_iv, areq->src, areq->cryptlen - ivsize, ivsize, 0);
+		scatterwalk_map_and_copy(ctx->backup_iv, areq->src,
+					 areq->cryptlen - ivsize, ivsize, 0);
 	}
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN4I_SS_DEBUG)) {
@@ -133,8 +130,8 @@ static int noinline_for_stack sun4i_ss_opti_poll(struct skcipher_request *areq)
 
 	if (areq->iv) {
 		if (mode & SS_DECRYPTION) {
-			memcpy(areq->iv, backup_iv, ivsize);
-			kfree_sensitive(backup_iv);
+			memcpy(areq->iv, ctx->backup_iv, ivsize);
+			memzero_explicit(ctx->backup_iv, ivsize);
 		} else {
 			scatterwalk_map_and_copy(areq->iv, areq->dst, areq->cryptlen - ivsize,
 						 ivsize, 0);
@@ -198,7 +195,6 @@ static int sun4i_ss_cipher_poll(struct skcipher_request *areq)
 	unsigned int ileft = areq->cryptlen;
 	unsigned int oleft = areq->cryptlen;
 	unsigned int todo;
-	void *backup_iv = NULL;
 	struct sg_mapping_iter mi, mo;
 	unsigned long pi = 0, po = 0; /* progress for in and out */
 	bool miter_err;
@@ -242,10 +238,8 @@ static int sun4i_ss_cipher_poll(struct skcipher_request *areq)
 		return sun4i_ss_cipher_poll_fallback(areq);
 
 	if (areq->iv && ivsize > 0 && mode & SS_DECRYPTION) {
-		backup_iv = kzalloc(ivsize, GFP_KERNEL);
-		if (!backup_iv)
-			return -ENOMEM;
-		scatterwalk_map_and_copy(backup_iv, areq->src, areq->cryptlen - ivsize, ivsize, 0);
+		scatterwalk_map_and_copy(ctx->backup_iv, areq->src,
+					 areq->cryptlen - ivsize, ivsize, 0);
 	}
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN4I_SS_DEBUG)) {
@@ -382,8 +376,8 @@ static int sun4i_ss_cipher_poll(struct skcipher_request *areq)
 	}
 	if (areq->iv) {
 		if (mode & SS_DECRYPTION) {
-			memcpy(areq->iv, backup_iv, ivsize);
-			kfree_sensitive(backup_iv);
+			memcpy(areq->iv, ctx->backup_iv, ivsize);
+			memzero_explicit(ctx->backup_iv, ivsize);
 		} else {
 			scatterwalk_map_and_copy(areq->iv, areq->dst, areq->cryptlen - ivsize,
 						 ivsize, 0);
diff --git a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h
index 0fee6f4e2d90..ba59c7a48825 100644
--- a/drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h
+++ b/drivers/crypto/allwinner/sun4i-ss/sun4i-ss.h
@@ -183,6 +183,7 @@ struct sun4i_tfm_ctx {
 
 struct sun4i_cipher_req_ctx {
 	u32 mode;
+	u8 backup_iv[AES_BLOCK_SIZE];
 	struct skcipher_request fallback_req;   // keep at the end
 };
 
-- 
2.34.1

