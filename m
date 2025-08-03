Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E06C21ADB7
	for <linux-sunxi@lists.linux.dev>; Sun,  3 Aug 2025 19:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754248276; cv=none; b=KO1hfeYqR5ukSMHY5jL3DiYTK8XiALwDTgMZr8dX7May/OeroCaTBmG2jU5z7peDMNoqKeS4myC/LLFtviqmb78Yst0ce2JiLzSsIVGj3skDP5uetf8KfJSnx+oh7dfgO3ZntLJ9S0hJGb755OeVcz21Rp6O0IvP5c7iNrgTq/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754248276; c=relaxed/simple;
	bh=J9ebtys+gOadsS+t9/vBdipuMTDeR7aQZjcVU3lSpuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tI0UdAq+cZjiPM0TFWCXQB36gLbCptjmZ+ptALIV1cWi9KQGjy7dsFtcO85SBzU2g4SPSlcZJgpBoC+imPHLQxkUsg8m9w6OiBsfMyFJthBOHQ4jhgODOPTgof/0oxiGk6fxwcyeAhYxAzE/Bkhxt5pjLwn9Fe2T6qnpH0IHYe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYD07AFp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYD07AFp"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b7825e2775so3013868f8f.2
        for <linux-sunxi@lists.linux.dev>; Sun, 03 Aug 2025 12:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754248273; x=1754853073; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OquH3bzsfHd+3HPbbgh3jCNSZfVC5bnpDs/2otunY4=;
        b=IYD07AFp9wOsTEfUFwbhd5Om6oecyrBU+HfC201UTQR0dYjATDZdrKrjcujMdHL0v/
         dPGdGoWNsl67Em6gRRu8acFAmCGA4GVReh5O2RfQiMnbDI1PR9pKNsSR1uYyUQ1+XJSh
         9zoot0SQGOkRqz+ih1Wz6RvV6xYrSehfrSqWyUY5vfhVx78HGc78YRiyQwD7EAcJTtFM
         x4XPcWJKu1JzMAwm+/5yntUzMDUCde3+2BkBJxBMhWlMHFRgWTIyRQxrbzsv1xNqd9dn
         9nmgb7qznqakKZ4dehTiN49yXRusX3TgncTNStXBMxszqGXAk4nbaZyIkHSwwx+9m2HE
         GZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754248273; x=1754853073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OquH3bzsfHd+3HPbbgh3jCNSZfVC5bnpDs/2otunY4=;
        b=uJxAsdLlegILXvkIUi0IUiMh2HGrKMq4nCACy1cAUoHd95im8tHsXzp8p07slNu8ie
         Bj9kUenAPr4+G0hlJDPbBeHGmND34+nwTi+MT15n4KlMeUVSbSXqg3XmKlBdtI9l3Qja
         BGGOz9u7/OrrlpycuihI782pmAWo1pHkOBXmOce3obbL2H0i+CtkM4oKHhCf7MhbHc3c
         4+ooqn5XET38MG27FQB4EtCs3DfN/c9X7aZAqEz/qRQQjcXu6517NyMFoHKWbG4wuQCD
         Yn/HNuB19FKL1lVcUJ/SKfq+RLnJGnP8kK5U4VUIR2+826EJQYd21eQzDoLaQmKcWZ8f
         JbwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMUg4Ukhr9Rm9ftBZF/jrlF6U6rKmPR8WNMAQQ9EDpt1os0D8B6fWJTTPWBd9mbUILtYLx7nM41bYTig==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzfs9hIFn5ZdjT1MhWHgaogbksvYI79+0yokhw9JpVywbHY+FOo
	uMYmIGTN8s5eggFZ3RMxGowR5rSMqVGIEpB9fnxVwCoXF/LMq44nRxzN
X-Gm-Gg: ASbGnctTetKR4YAisUgvP8y+u0S66wxhsgjsHyUX+z+BFpRzzvJjx1zX9IQCfBAP/4g
	Ld52qveTqbr2zeCtwnSlPJNjWsQf4UsXQKfChpwAe5ydqC/p7bVeTRpkl6ynWHH1pTDZSV96e2F
	r67aCB0OE45bZEKUjevvWhxfQ6JQztf1pReQ/2DSjPbkfwWnfLnNq7QMVvw681yixROzchHTcrn
	37iyxmah+w5yumUMD/vMpekI0cc019L7eugFlvoa8yzDEZ4we4WztF7QmPobdI3h2iOE8F/kYs5
	JH8tbt7lqd+pcG087IZ9rRSD3pm6nxymryTjguRXcD6jLwJ/GukrsioQl7uIoYOsamGmyViFTGR
	gTS/UmgnMrEO2juXbnWeJtQropdF84yRckS5iX2ohyagU
X-Google-Smtp-Source: AGHT+IGpjk4CRmkJ8M4LqTsc8/ENOgpA5it89IFM3cfJG0O++/wGGjyhzDfblVGHm0OKLzdq4SaUOQ==
X-Received: by 2002:a05:6000:2f85:b0:3a4:e68e:d33c with SMTP id ffacd0b85a97d-3b8d94c4caamr5017378f8f.47.1754248273270;
        Sun, 03 Aug 2025 12:11:13 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm13099210f8f.39.2025.08.03.12.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:11:12 -0700 (PDT)
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
Subject: [PATCH v2 9/9] crytpo: sun8i-ce - factor out prepare/unprepare from sun8i_ce_hash_run()
Date: Sun,  3 Aug 2025 22:10:29 +0300
Message-ID: <20250803191029.3592987-10-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
References: <20250803191029.3592987-1-ovidiu.panait.oss@gmail.com>
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

