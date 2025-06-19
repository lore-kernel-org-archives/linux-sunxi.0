Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C1024E4BD
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Jun 2025 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335861; cv=none; b=d2XLddUFuBNuBPls3Ewqp3GCBRXbuEPr/N8zUSAruZkVxRSxmOEVAVURhRN7LUK3j279QT6T3T6fMYftq59Pi7FoQRP/Vi3QuUWFgFMt02ztRRHLz5ENNh0F77tsanr83q6vixqWVit7j3qAL6CRQkcjhy0LIB2tjLtu9fwuHQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335861; c=relaxed/simple;
	bh=ThK72kzM3/NAb5q4kYO3GzKkml/jXobH2nqcwRen8oE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g7JHyUcNcrXdX7GjKaDSXw605rrviOZTVD/cQn1yuCsyVE/Y8CqGsT+l4KnuyazN2iGvZFJPUBtBX0EdMyksyar1BOKTjepiYYZ908jCRlMCn60/fmtGpS+/bo2JMfVnIsFRdh4eqUkzC3MeV+Wf73IbalwWOUGMrpZhzMgHLU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jc7xSQpM; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jc7xSQpM"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-adb47e0644dso130615266b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Jun 2025 05:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335856; x=1750940656; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgIbzVPscBuyqUEBsClRFHHr0kmYa9s+xoX+40DNp18=;
        b=jc7xSQpMQS6uW80rdF7CtHe6GTK1ZbfB9XVJ38W9DqNTtR25GS7jjNSXno+Ut542QY
         BQxdUNfvZeKqXgmyLdbicCtYEVlit2JhL4h1X7GBLBLQzYxtrDaBZXCqt+qTkJsKMmo7
         nwD6GVv2ZyyY2z4ROJ5FKHJOwQ5Xkb7+MqVPHbVXLjLmMr8Z/pe3UWj2fsNHPVPBjRti
         LuCT6UYk5UiC1vHwKSsAFl7xTV2PfXIcI9YE0Hm1W8mBUTZEGfj0LjdkAWdS6A+BmCc/
         rRu4cJPwkJWGsYU1X2eG3aMHPzXthLVSCQbLKKctBgqvWf4HfriZDILbzSfVFlHNyoaV
         JHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335856; x=1750940656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rgIbzVPscBuyqUEBsClRFHHr0kmYa9s+xoX+40DNp18=;
        b=PY1T99zzBJh3EwGfhUmXjkeI9T4rEQktUUN+suiGiRDBovzK/B+M1W+/A6MaPT33UN
         pC7WPvcZgWO6T8b285mzAvbQiZgcWTVw3ea0OaAWizSTH+QwBSqs2gkxzKhlvA8fuGPK
         LO0PyPCDaZBc/8zgePisOsJqwiQs5AcMp2w2bT0WjJcKur57nOXivpEgLz1JcsonWmVw
         T4mvedsR2reOVHXnRziSTKd8G+r2w8dHtpjkcNmvVfap7e9FwvLS1qyblJSwBYA0Sb7/
         EMfa23uNWIZQzGQ6KokHQyGoxWAQ64325KPfMDPh2eLlndz0JeVBiWjlslbEKChRVdAC
         BUuw==
X-Forwarded-Encrypted: i=1; AJvYcCXaIEeZF5uyZgk+KsNrVX1/mRlkObkBtklK3YJOkA8+vhapqTUIanwRntLpBqdPcvzzJBbgI3NjoLU9yQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmQoFvP8qtAc8VDBP5lyykpHo+6KoIz+7EjI9flIVMI//nE+1K
	cECe69SU5rLTEyM+ekcCXVv6HdzWUsNmUMF0wibS2d0LpKTfTcMH/4vB
X-Gm-Gg: ASbGnctH40xGJnWYOl3MfaFzAKraDfHi6p8gVElaW9DqZgRG1+Z+NWs5kdW635ZwhOK
	EsRn6LdMmC3cRhCervJ7X1kpOdYFvSNe23oQoyaW37gO/mBXG9al6/RNbcOGGGY/UAIiUiwWrnT
	LNz0OQdcZvstWkRfzCV2eNPqz1/ZRLvB2D7iaQ6SDYr6t8ShJ8fzBpf60YHzcnFzPhmV+z9PZCi
	NEBubQ0mvgS7OaBqiBAPfaQcdeDrNcs5Wnfx/+gY5ewoDhYmt1yKvN+Ktka3LcUwQOYGBzW0Wsp
	oHXbru+yWsx9u5GpSJtpuJLkkyE1mpOaTeNr4+umggMkUY2ats8Lf5gywCE/07G0h1vHf4GinmN
	BXqZFe7mV6BV9Rg==
X-Google-Smtp-Source: AGHT+IGp2TBBgU3kBXSIIbngsVXxutaDLHe7ezjC9aFjh5AHU1t7NJo73l09wb2AvdA+UM11p80C2g==
X-Received: by 2002:a17:907:e897:b0:ade:31eb:66df with SMTP id a640c23a62f3a-ae035285491mr322808566b.11.1750335856287;
        Thu, 19 Jun 2025 05:24:16 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae000b02bd3sm504688066b.3.2025.06.19.05.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:24:16 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 05/10] crypto: sun8i-ce - factor out prepare/unprepare code from ahash do_one_request
Date: Thu, 19 Jun 2025 15:23:11 +0300
Message-ID: <20250619122316.2587236-6-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
References: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The crypto engine workflow for batching requests requires the driver to
chain the requests in do_one_request() and then send the batch for
processing in do_batch_requests().

Split the monolithic ahash do_one_request() callback into two parts,
prepare and unprepare, so they can be used in batch processing.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 64 ++++++++++++++-----
 1 file changed, 48 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 3ee0c65ef600..7811fa17388c 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -312,18 +312,15 @@ static u64 hash_pad(__le32 *buf, unsigned int bufsize, u64 padi, u64 byte_count,
 	return j;
 }
 
-int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
+static int sun8i_ce_hash_prepare(struct ahash_request *areq, struct ce_task *cet)
 {
-	struct ahash_request *areq = container_of(breq, struct ahash_request, base);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct ahash_alg *alg = __crypto_ahash_alg(tfm->base.__crt_alg);
 	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
 	struct sun8i_ce_alg_template *algt;
 	struct sun8i_ce_dev *ce;
-	struct sun8i_ce_flow *chan;
-	struct ce_task *cet;
 	struct scatterlist *sg;
-	int nr_sgs, flow, err;
+	int nr_sgs, err;
 	unsigned int len;
 	u32 common;
 	u64 byte_count;
@@ -344,18 +341,14 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 
 	bf = (__le32 *)rctx->pad;
 
-	flow = rctx->flow;
-	chan = &ce->chanlist[flow];
-
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
 		algt->stat_req++;
 
 	dev_dbg(ce->dev, "%s %s len=%d\n", __func__, crypto_tfm_alg_name(areq->base.tfm), areq->nbytes);
 
-	cet = chan->tl;
 	memset(cet, 0, sizeof(struct ce_task));
 
-	cet->t_id = cpu_to_le32(flow);
+	cet->t_id = cpu_to_le32(rctx->flow);
 	common = ce->variant->alg_hash[algt->ce_algo_id];
 	common |= CE_COMM_INT;
 	cet->t_common_ctl = cpu_to_le32(common);
@@ -433,22 +426,61 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	else
 		cet->t_dlen = cpu_to_le32(areq->nbytes / 4 + j);
 
-	err = sun8i_ce_run_task(ce, flow, crypto_ahash_alg_name(tfm));
-
-	dma_unmap_single(ce->dev, rctx->addr_pad, rctx->pad_len, DMA_TO_DEVICE);
+	return 0;
 
 err_unmap_result:
 	dma_unmap_single(ce->dev, rctx->addr_res, rctx->result_len,
 			 DMA_FROM_DEVICE);
-	if (!err)
-		memcpy(areq->result, rctx->result, crypto_ahash_digestsize(tfm));
 
 err_unmap_src:
 	dma_unmap_sg(ce->dev, areq->src, rctx->nr_sgs, DMA_TO_DEVICE);
 
 err_out:
+	return err;
+}
+
+static void sun8i_ce_hash_unprepare(struct ahash_request *areq,
+				    struct ce_task *cet)
+{
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
+	struct sun8i_ce_hash_tfm_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct sun8i_ce_dev *ce = ctx->ce;
+
+	dma_unmap_single(ce->dev, rctx->addr_pad, rctx->pad_len, DMA_TO_DEVICE);
+	dma_unmap_single(ce->dev, rctx->addr_res, rctx->result_len,
+			 DMA_FROM_DEVICE);
+	dma_unmap_sg(ce->dev, areq->src, rctx->nr_sgs, DMA_TO_DEVICE);
+}
+
+int sun8i_ce_hash_run(struct crypto_engine *engine, void *async_req)
+{
+	struct ahash_request *areq = ahash_request_cast(async_req);
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
+	struct sun8i_ce_hash_tfm_ctx *ctx = crypto_ahash_ctx(tfm);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_dev *ce = ctx->ce;
+	struct sun8i_ce_flow *chan;
+	struct ce_task *cet;
+	int err;
+
+	chan = &ce->chanlist[rctx->flow];
+	cet = chan->tl;
+
+	err = sun8i_ce_hash_prepare(areq, cet);
+	if (err)
+		return err;
+
+	err = sun8i_ce_run_task(ce, rctx->flow, crypto_ahash_alg_name(tfm));
+
+	sun8i_ce_hash_unprepare(areq, cet);
+
+	if (!err)
+		memcpy(areq->result, rctx->result,
+		       crypto_ahash_digestsize(tfm));
+
 	local_bh_disable();
-	crypto_finalize_hash_request(engine, breq, err);
+	crypto_finalize_hash_request(engine, async_req, err);
 	local_bh_enable();
 
 	return 0;
-- 
2.49.0

