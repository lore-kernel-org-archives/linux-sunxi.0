Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977A2237163
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Jul 2025 06:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753682889; cv=none; b=YpWN+T5umgnogtZnT1ZtTxYqBFylDOihVBnD0R9EjbOz3LXO5NIYKlS5lI6+X1hbopiwx/upqu1AHoBCg8aME1qTkcWaZMY3ZKEFTfOXICOpHvZsYs4J8wnUsqQJOGJr9knuDSc2yPk9nemX9/q4w25dFOvaFklVI+EcAzDp/KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753682889; c=relaxed/simple;
	bh=J9ebtys+gOadsS+t9/vBdipuMTDeR7aQZjcVU3lSpuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=skxjnnguncRxbHusmA8Iev9rirY0+SOovoPu5N3hw0WU17y2lmrFdyPzdQ4EoW21WPiImqvBMO/4MLbJeb5TKuWAtZm/bPcVpBcnC2uIBQ4NQxXeStM8/uVif/SNyRbAr5ktFPNXdujVtJWgiHSr7BCjQ7y5ZnK7XvUzAEu2T+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bksU0j7G; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bksU0j7G"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b780bdda21so1607278f8f.3
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Jul 2025 23:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682886; x=1754287686; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OquH3bzsfHd+3HPbbgh3jCNSZfVC5bnpDs/2otunY4=;
        b=bksU0j7GU6tWA8eUa51sJHYPkin0Yq8/Iyg7xFThkH6pzAzXwNdXA7f0HBcnbhNHpo
         +OLgTH5QyNU63PXwgsQPtY3nfXwrvRbFu7Fh8XgNc1QjeQhYTiSgbZGQ5dQljdAC1NHY
         Egi+eR0gJgGvFZ0ughJvNFNdJjY1Phktr6WuEFGThFwAFV9rQ1z1/vZvP+ixt2PIJfiI
         77cGR3dDmcv63mpa/OaAnInstgUcLljLJm6UhMIvjcwyYslrhrcVNOreZd2IFvqHXBO8
         Tr3MVY6u1ZxKRtc1Gy0hbkZugeM1E6wA2krvT1UWpkEBnWaHsOsQ+SOILAuUv9KnOoJn
         IHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682886; x=1754287686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OquH3bzsfHd+3HPbbgh3jCNSZfVC5bnpDs/2otunY4=;
        b=ZjZH/4mITzMqvJ4tSw0N5KdaIy3WW6FBXHcRdBgMxtOMxBtdVBdeig4b61WK2GIsMu
         hiFdk0+5b6pc4jSRZ95zMBhBRDk1Qq7bim9B9wnPXNMHtGVtZWWcJhDRSbrXODRjBqe1
         HZ0yHUF7qXoTK8pZkSokVqTfp8qEy8o0m6X9dCG0NSF6cKUDqFFT6e4KaF7HfO7F48bl
         hZY7+CiKHiitLDkdRi+a2iwvJ9ShLkq/78Yw0BMO4rwsptpSC/ezwSEGnY+h4TO7iI3a
         MRQFuKJdNSdnQzKnH+aMo1OSd0AI7OcnhjeDd82eNwxpfK8jVkD18A2/ZshrEhGpHEp8
         Wp4g==
X-Forwarded-Encrypted: i=1; AJvYcCURnvsZzjVsQoc2lz/Dpd9VI3iyjpdV7MiIZhllaRAAseCptxdoRp7pjyXq8oDBagA1HCp/zFhtVXvCYg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu8Wx9mOkO4RxZhXMMT9NSxMUjg67bSOOp9p5F/ayZWi6Fo3tP
	zicVxwS0iKkFwCkmn4uEapoF588unu4gCFt1l9vUYnjDQ8bJTNbbMLoo
X-Gm-Gg: ASbGncsrBXhpSScCAIr1CD1B1qJgkREiUdiBTZoOePYNQSeWAOY4pqyWQOr4TvzokqF
	Sehe1zovWW/t8LNerfdtXVryDHNMkrrEbZnjKHKmi/u4a3fiprTjp1R7qF5DBwtemTg4k2jsySP
	4STuBcbM4nHnI+AesiGMkT63dO8wF94GjCg7nBp+rJwDFaUhqIZINQc61xP8/WQQCTehhtQ2VoS
	unVzWToGgeY+1FbQ4JOc+37E0KJFAMh6CpNLJh7vp1YvjZ8donNlB3qmhweJjN7UllDTdq032qF
	P4xcU5XSvsMT8J5cA+//LyRjd2jn0phSBIJt9w01c8/9GtdFmdJG1IblRMWSj/ai4A3sR3874bX
	E5ImddubBqvLlRbzH2Od+SXp7pccByf/jEQ==
X-Google-Smtp-Source: AGHT+IGmdqX9IZttVYna5BJ5xmHOnuGw9/sYW7r7das3xWFHBQfvmW7jivr0ZkUOFKLeiH33vIEMqw==
X-Received: by 2002:a05:6000:2011:b0:3b7:88a1:19f4 with SMTP id ffacd0b85a97d-3b788a11e12mr1371642f8f.27.1753682885748;
        Sun, 27 Jul 2025 23:08:05 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe6ba0sm86195215e9.9.2025.07.27.23.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:08:05 -0700 (PDT)
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
Subject: [PATCH 9/9] crytpo: sun8i-ce - factor out prepare/unprepare from sun8i_ce_hash_run()
Date: Mon, 28 Jul 2025 09:07:01 +0300
Message-ID: <20250728060701.1787607-10-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
References: <20250728060701.1787607-1-ovidiu.panait.oss@gmail.com>
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
index e28100c07b86..70c761baf847 100644
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
@@ -433,22 +426,59 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
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

