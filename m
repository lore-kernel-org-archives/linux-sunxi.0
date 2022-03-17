Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661B44A9F
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 20:56:19 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id m42-20020a05600c3b2a00b00382ab337e14so5608904wms.3
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 13:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cEN4kD5iud+RYuNT0xOQxbNQtw985uxcHSf9Cri2Ip0=;
        b=gAtbFf7FCOmYEZtNI/dE0P2rv1wjfJhPfregdOIzC0nRFymnEqijSxnp+uNW76JSBR
         hewH7hDEKvfVFG1t3POzGNgbXTx51AXOL8zWmDa5NeKvWMVN+etapYjK9cKYh1zCWzGO
         3DObh35lescVqbeyl3lN6kyg+8lA5bsBZ+HykGIVUpXnU0rSrIPufwFMKCJW1APaQtjo
         KtMfw4tXPo6wXfgstVomFBrII3/O4Dmu5eP3gLKp8gQHInecQffHZ7aI8arabjY8mMW0
         F38rVKpZRmtEP3yj5dOAjn1iBqKmQivkMtev5Tg6XkKXFauVfWyVcZ0F3i5dOu+GG2AV
         AAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cEN4kD5iud+RYuNT0xOQxbNQtw985uxcHSf9Cri2Ip0=;
        b=qZJDwXnpngejHERKF+AoFhch/IKa0pXb3b2lWE75qCARkD35jqJNE9rmiIfOZAh5+m
         0nNBSupv/nl6NOBJv02GlDrLr3AdJcv7b21ZKKg6tqWj/5U/5ckdRd6tG9rY3JRsSXFb
         IAWAPCRLPAju7NNC+MJJsAnJFl+SvdTnb9lUTL19O5o53el6PUTRtc06UWilyYIA2RI/
         +GmRpuJ6GCDkWFMlZlBympJgpmO/7k10AknjcQ38UVZGE84byHXDXS8+sVYW1QsmTbEO
         i5H1F4mptDfMWEivpr2OR9OvomdW6AFq1v/A8gjcovqxaDXxf8K9qExAedwCy1TY+nGq
         Kr0Q==
X-Gm-Message-State: AOAM532o1e0uvEQPHRVAdJY5UKif3kl7GTtKZraelu6CFkYQjwfHOQyT
	ZslyJoZ+fvkj8GDSUZ5gWWsKvg==
X-Google-Smtp-Source: ABdhPJyqL3UqIRJcvsXmhevcUEGwr0tQV7LROcYgL8D61jl1yccDkDWJP9Dltpii/XAtxkVhcwD8Ag==
X-Received: by 2002:a05:600c:35cc:b0:38c:6d25:f4ad with SMTP id r12-20020a05600c35cc00b0038c6d25f4admr5538604wmq.127.1647550577711;
        Thu, 17 Mar 2022 13:56:17 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id r4-20020a05600c35c400b00389f368cf1esm3695424wmq.40.2022.03.17.13.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 13:56:17 -0700 (PDT)
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
Subject: [PATCH 09/19] crypto: sun8i-ss: do not allocate memory when handling hash requests
Date: Thu, 17 Mar 2022 20:55:55 +0000
Message-Id: <20220317205605.3924836-10-clabbe@baylibre.com>
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
pre-allocate buffers.
This made error path easier.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c | 10 ++++++++++
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 15 +++------------
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h      |  4 ++++
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
index 657530578643..786b6f5cf300 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
@@ -486,6 +486,16 @@ static int allocate_flows(struct sun8i_ss_dev *ss)
 				goto error_engine;
 		}
 
+		/* the padding could be up to two block. */
+		ss->flows[i].pad = devm_kmalloc(ss->dev, SHA256_BLOCK_SIZE * 2,
+						GFP_KERNEL | GFP_DMA);
+		if (!ss->flows[i].pad)
+			goto error_engine;
+		ss->flows[i].result = devm_kmalloc(ss->dev, SHA256_DIGEST_SIZE,
+						   GFP_KERNEL | GFP_DMA);
+		if (!ss->flows[i].result)
+			goto error_engine;
+
 		ss->flows[i].engine = crypto_engine_alloc_init(ss->dev, true);
 		if (!ss->flows[i].engine) {
 			dev_err(ss->dev, "Cannot allocate engine\n");
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index 49e2e947b36b..9582ac450d08 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -332,18 +332,11 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
 	if (digestsize == SHA224_DIGEST_SIZE)
 		digestsize = SHA256_DIGEST_SIZE;
 
-	/* the padding could be up to two block. */
-	pad = kzalloc(algt->alg.hash.halg.base.cra_blocksize * 2, GFP_KERNEL | GFP_DMA);
-	if (!pad)
-		return -ENOMEM;
+	result = ss->flows[rctx->flow].result;
+	pad = ss->flows[rctx->flow].pad;
+	memset(pad, 0, algt->alg.hash.halg.base.cra_blocksize * 2);
 	bf = (__le32 *)pad;
 
-	result = kzalloc(digestsize, GFP_KERNEL | GFP_DMA);
-	if (!result) {
-		kfree(pad);
-		return -ENOMEM;
-	}
-
 	for (i = 0; i < MAX_SG; i++) {
 		rctx->t_dst[i].addr = 0;
 		rctx->t_dst[i].len = 0;
@@ -439,8 +432,6 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
 
 	memcpy(areq->result, result, algt->alg.hash.halg.digestsize);
 theend:
-	kfree(pad);
-	kfree(result);
 	local_bh_disable();
 	crypto_finalize_hash_request(engine, breq, err);
 	local_bh_enable();
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
index 57ada8653855..eb82ee5345ae 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
@@ -123,6 +123,8 @@ struct sginfo {
  * @stat_req:	number of request done by this flow
  * @iv:		list of IV to use for each step
  * @biv:	buffer which contain the backuped IV
+ * @pad:	padding buffer for hash operations
+ * @result:	buffer for storing the result of hash operations
  */
 struct sun8i_ss_flow {
 	struct crypto_engine *engine;
@@ -130,6 +132,8 @@ struct sun8i_ss_flow {
 	int status;
 	u8 *iv[MAX_SG];
 	u8 *biv;
+	void *pad;
+	void *result;
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_SS_DEBUG
 	unsigned long stat_req;
 #endif
-- 
2.34.1

