Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FEF3204
	for <linux-sunxi@lists.linux.dev>; Mon,  2 May 2022 20:19:50 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id x18so20927837wrc.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 May 2022 13:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L6ojxrJ3JCDmwxgYcuW8Z/fCHj7C/NmFL+u5RXlbqHM=;
        b=2FMw48hoq0iT1baIfYW3+6fIqjJC8ILqaei+4p/aWkOmUC6pxdgGS/UxezQKrGwpu5
         JwVxOFwImw3lTFUamfirSvwyvKtxdNr41V5jV8SijHt24Kxd113u5eRrL1i4z+dKu5+l
         YCXOJkIVtSjnO4/b9OH+kWMVcG2s5W1vU8YOQvSDPk2OZiRGR4MykMYQV9yIbT1KrAfY
         Mth6Wcucdp/DrhUyd6QVl9HrbIHKvymqvJ7ubgyScll5XzcOCDR1mExqEijO99DjJyue
         Z0/KExvA/HUj6OzgeHznlHDsYBr2Si9JUFxqXy1l1rZg+TDMKRhdoNddMiN/tAla9W1w
         43IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L6ojxrJ3JCDmwxgYcuW8Z/fCHj7C/NmFL+u5RXlbqHM=;
        b=KsRAFdZQ1dJ7joD72dQbTxZ+Q1OFtx0JmUWQXnyUPhpgKcN23PRvgzyabxIWKTNeR6
         skfqpofoBku8TVcYndmU9Rwlt+8+GqjGx6WYOPkJhlp8e8QvEyiNMY3ejs9f24CBSJjV
         QPbi8KTy7H1os3ckoYdRsQ1FeF3JR4bh4gWFgoGwYGtruvyzLsjDpt00Jvr1ngW8NmaW
         cX1uvWioHSnP+eVOXL1OgRj/Hn83KGe/EucCJ8AqhKw0uOPbV+TBP3Gu3rpyIC7n84zr
         M/yOox3wLS/Sc4WEiwWjCxyzovxjaF2sqQTMGG47ULlRPC+Cax+4iIYqaI/W8ZU1vvGr
         NhDA==
X-Gm-Message-State: AOAM530DiaoX/dWVlfJvCz/TUp5iThp233HoSvhynPUmO8kZdyjKUM3F
	zOj2Dd7K9wJaE37YDSesg26vYA==
X-Google-Smtp-Source: ABdhPJxbumqnLOpEvOC4qOx+9lGvPoJ59aLRGJaRDccVXsB9zQ/0pYEU5eQJGSeVtgZ3fUVJ7fonIg==
X-Received: by 2002:adf:e112:0:b0:206:d12:9c3a with SMTP id t18-20020adfe112000000b002060d129c3amr10160404wrz.391.1651522789323;
        Mon, 02 May 2022 13:19:49 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id l2-20020adfb102000000b0020c547f75easm7238183wra.101.2022.05.02.13.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 13:19:48 -0700 (PDT)
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
Subject: [PATCH v2 09/19] crypto: sun8i-ss: do not allocate memory when handling hash requests
Date: Mon,  2 May 2022 20:19:19 +0000
Message-Id: <20220502201929.843194-10-clabbe@baylibre.com>
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
2.35.1

