Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADE83FCF
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Jan 2022 21:04:55 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id f202-20020a1c1fd3000000b0034dd403f4fbso628185wmf.1
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Jan 2022 13:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ktDMlL8iZ2/3sijREuAuM+dmCDydSQ7poFBUP0oLczo=;
        b=Bcf1/J/JmjcL2kH4RMGo+wEKEkU7RNdbp/dUD/SMq9d16A9F3ZxfzpBe/WGhw5LKwS
         B6I6jCDxKuAFG7oNxPtidy5p6ovVXSM+zTRcs04Hexy+8sp8jnmz8Df85wRVf2nXlkNh
         I8NZhayNkaYAQLU9bI221UwNcKkcHWEinCsaaaAWls1eNTeepzoqs4/OcGce/YUURmpD
         qLAq+9Sq8rNNEvOToeVcmutc25KNOe5KXw0nwVWPkBylM4+pQeVvX0hYKBhWeB/ED1zf
         IDmVhmC0q4hdu7usPsN/FX5ds8q5c2IvJWhfoNoc4pE4ame8maYzvc47+fmkBUB2EdQ9
         +lJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ktDMlL8iZ2/3sijREuAuM+dmCDydSQ7poFBUP0oLczo=;
        b=p8HKbRYq3fwNHaXgrCrnxtrnJUXmrh10dSiY7QHsDsTQCjBPpEhLTDU/WCgC0q8eA8
         IveCTEDmoJ1wVKa4O/kICAWGP+vcyajfibaKU9CxqtJsSxJg7YTz+ruPoc7nl1S1+Sbk
         IZB3FfQDZPjmeN7KBEFDd+T9lzcBzpMLpm1sCq4Rrc1mBgoo+zUKxC1BRyG8j+j8b6h+
         Ui6Dapjsm8Pf8oVgYgqGx4GH0coetN+9+lipDilznkEdfkBeUJElxCNCUnQ61ayflJps
         LXk7LlrgH8DxPqPI1S/wIc6p11X9z7e6nN5nah5PSaafEUj6YPXqfq0GQF20fkU4VEjw
         Xu6w==
X-Gm-Message-State: AOAM532nFj3woclBJlne3wRNHkrNpa0tjySsK0P3S0kjxB0Neag6qgP9
	SiV/r4O1jKKvnhv9gMerA0ZIGA==
X-Google-Smtp-Source: ABdhPJxiNZGsixA/dP4HPSBuINQsxbgvdDaaxpjkQ5Ww1hZP2upy4QOmEl+72jz0ry9zZys6s8Wb5Q==
X-Received: by 2002:a7b:cb8c:: with SMTP id m12mr459302wmi.154.1643231093676;
        Wed, 26 Jan 2022 13:04:53 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id j19sm4948611wmq.17.2022.01.26.13.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 13:04:52 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: davem@davemloft.net,
	herbert@gondor.apana.org.au,
	jernej.skrabec@gmail.com,
	mripard@kernel.org,
	wens@csie.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-sunxi@googlegroups.com,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 4/8] crypto: sun8i-ss: do not allocate memory when handling hash requests
Date: Wed, 26 Jan 2022 21:04:37 +0000
Message-Id: <20220126210441.3661782-5-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126210441.3661782-1-clabbe@baylibre.com>
References: <20220126210441.3661782-1-clabbe@baylibre.com>
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
index 319fe3279a71..084261d7899c 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
@@ -474,6 +474,16 @@ static int allocate_flows(struct sun8i_ss_dev *ss)
 	for (i = 0; i < MAXFLOW; i++) {
 		init_completion(&ss->flows[i].complete);
 
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
index 2557bb3fe7aa..f7a9578e87f7 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -341,18 +341,11 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
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
@@ -448,8 +441,6 @@ int sun8i_ss_hash_run(struct crypto_engine *engine, void *breq)
 
 	memcpy(areq->result, result, algt->alg.hash.halg.digestsize);
 theend:
-	kfree(pad);
-	kfree(result);
 	crypto_finalize_hash_request(engine, breq, err);
 	return 0;
 }
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
index 28188685b910..f9f089ede934 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss.h
@@ -121,11 +121,15 @@ struct sginfo {
  * @complete:	completion for the current task on this flow
  * @status:	set to 1 by interrupt if task is done
  * @stat_req:	number of request done by this flow
+ * @pad:	padding buffer for hash operations
+ * @result:	buffer for storing the result of hash operations
  */
 struct sun8i_ss_flow {
 	struct crypto_engine *engine;
 	struct completion complete;
 	int status;
+	void *pad;
+	void *result;
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_SS_DEBUG
 	unsigned long stat_req;
 #endif
-- 
2.34.1

