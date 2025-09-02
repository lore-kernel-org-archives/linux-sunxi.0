Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CC230E0F2
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Sep 2025 13:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819390; cv=none; b=FncQAF+5I37LNSkU1rWWz7c72VM5v4eOY7MUnxoEDi+ah9M4yUmjmcvVQ1dkjpDcREGX6wysRQAwa8Rzm0HUKAK7AM5vDoI/X/YLJVM4PTkjJB8STQNX93u7/ZqrKj169YaZ6j64LkNoSaeLV7o+X7Ffxj87NB+QfzeZeb0za8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819390; c=relaxed/simple;
	bh=pi1l7opJu00vs6MD7nSWkMq1KZSzvh++I4qQ67bTi2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X8kB91O/s09dbkxNxRg7rqeSSeHWUqEWqqhDE/+vTYduWi1wDw+T0bAZa4N9UY9EmqaXWIxQozMI5BjOzP9jQn25TS9VjE/OF7TBkm+LIDLkSMofCpeo3zWecmRPnrC6fTQ30xyx6Ds2RzX368k7N4DaIz9V6cP1qNmwlcok8d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MjifqFq6; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MjifqFq6"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3d0b6008a8bso2111015f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Sep 2025 06:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819386; x=1757424186; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+zU65F7Gerz/ADwaQ8W/yEAgtxRKhLtaag+pELJ150=;
        b=MjifqFq6ijINrKQiwRF+LP1CAlvrN3efJND/9w5Qd1VduWekcSbi+94fuXJaZ3zTJE
         rlQ52VbVch6Hw6dye3l5tsoDiuNPMxBSbNNNWZaUniBTluywMCp2eZRGXPPl0kZSrMCS
         mkLPsNVJrUKaF4ngrM7/2JT2FYeZfI3jZL2ZFwR0n0FYX61DLS0stUHOv8QcrJCTHVFK
         z5IpFa4ilFZ2QWXYMtVe6LlnZKugAJ4CU1N22URVeFbSk2yomY8HfTGP4cCNdIkR6ZZv
         Z94J49sdQFUrTUxIrPqNFbkE1iXT4Btk5x7o7zeqKvtnSRf7h1JAQM8YciqeQ3JBtana
         F1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819386; x=1757424186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+zU65F7Gerz/ADwaQ8W/yEAgtxRKhLtaag+pELJ150=;
        b=lJ8LvZdCX/Rpm59kklkj3t20ZzjiR01eXxVHk1uH7AcULdQRC+yprF0oY/C9DwZbGi
         otaF2lEbw9YFNOAGi/1uaNicfxIgubjuri57QLDqMzY5/2RbSFDeeWNTz83IPj2Mcvg7
         d/EvHn2bgC04e3L/BY8pjOPomDi/crITj+amrr/cTGLmbz/Yid2Ynpsjg90y/++CxILZ
         jF+MqEAABJ8JZdcr20uxGQFJeFqsEre26G/vI1a9iFttnM2740MhwRDT2JcWq9jfxyjf
         qunSOvbB/x1YBZjLT4se+LEg/Ef7YxKDQnYG4Pz/XqR+nPDb1QseaAshO9mr6wDMAh/3
         ArrA==
X-Forwarded-Encrypted: i=1; AJvYcCXYUp1fMU9w2yTezbN2VnjWOWZOgQG2SDtMEAczBSUs3bbVyms639qgPw5k4DA9umzypea1OEi66W/qQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVZMrzn+aPjGbWKpRUzPD8ALw8x3zQbCWEV4CUKKjl9PR625H+
	hPEosOgE2hcHUcB9NnQPkKzy6PS929eu0yESB0hXS6hUzycAENY3qKXY
X-Gm-Gg: ASbGncsPl5EDTZlEnt3IT7N+7fuyxxY5O5QODsQ5TPp73+gRahlTgnraeb/0GX5R39r
	Mvi52pR9u4+ZieUG/buXhEbOvE28NH8WguRVqrLwxYyZS5t3wirWGmDrZi/PCxstiDoLH6SKScK
	5E4kYUfMPgI8L71vFsXoVIMcSCifW3X17P6et815CQp/Y0dOVZP8pL5MqRwz3mcpWVDD1M2B8Kz
	G2uHEHnq6H3vKZAeSLWfdw4UQM7JeHByNnHxktMRt/Tk8sQgGo1AXlWliMp9nAGmcHmpdqdQOzR
	IBQmgTpZoZgFyUY1R/rxCR5Kuhl+MWE8mCzIEo8StzLva1DLZXRDMh0ofiH3jHmvyJYa9JFIBgI
	7xtXVU8pa97LkG9J/E8W9/Yu8CFge4MZpKkMcBNYPD5ni
X-Google-Smtp-Source: AGHT+IGEIroq02nSpRHx0vFtxRxr9TNdfsRxwLjDOb7ndAqqFPycS5qCf/jnA7MepquM0G+zsISS8Q==
X-Received: by 2002:a05:6000:2281:b0:3ca:83e2:6339 with SMTP id ffacd0b85a97d-3d1e02cb35fmr8305578f8f.49.1756819386400;
        Tue, 02 Sep 2025 06:23:06 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:23:06 -0700 (PDT)
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
Subject: [PATCH v3 9/9] crytpo: sun8i-ce - factor out prepare/unprepare from sun8i_ce_hash_run()
Date: Tue,  2 Sep 2025 16:21:34 +0300
Message-ID: <20250902132134.3287515-10-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
References: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to make the ahash code more clear and modular, split the
monolithic sun8i_ce_hash_run() callback into two parts, prepare and
unprepare (therefore aligning it with the sun8i-ce skcipher code).

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 62 ++++++++++++++-----
 1 file changed, 46 insertions(+), 16 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 6573c566bd0d..d01594353d9a 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -313,18 +313,15 @@ static u64 hash_pad(__le32 *buf, unsigned int bufsize, u64 padi, u64 byte_count,
 	return j;
 }
 
-int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
+static int sun8i_ce_hash_prepare(struct ahash_request *areq, struct ce_task *cet)
 {
-	struct ahash_request *areq = container_of(breq, struct ahash_request, base);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct ahash_alg *alg = __crypto_ahash_alg(tfm->base.__crt_alg);
 	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
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
@@ -345,18 +342,14 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 
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
@@ -434,22 +427,59 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
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
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
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
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
+	struct sun8i_ce_dev *ce = ctx->ce;
+	struct sun8i_ce_flow *chan;
+	int err;
+
+	chan = &ce->chanlist[rctx->flow];
+
+	err = sun8i_ce_hash_prepare(areq, chan->tl);
+	if (err)
+		return err;
+
+	err = sun8i_ce_run_task(ce, rctx->flow, crypto_ahash_alg_name(tfm));
+
+	sun8i_ce_hash_unprepare(areq, chan->tl);
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
2.50.0

