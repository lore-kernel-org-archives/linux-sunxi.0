Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D9430DD1A
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Sep 2025 13:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819389; cv=none; b=MZwK1Fndqa/BEbky4UMF6YS04cSbo5Z8KPPWvbGU6hCApuaPwsNosTTkCuQycaiylMNovs3WJPQGenCwiorvrX8W6cW8DAo4eFZh4DlT879aqLo/RluheroosSetpv+6VKOj01VqEJHo51horSacW62PSlrLKNkGR474l8UK8KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819389; c=relaxed/simple;
	bh=iUJf2ME5JPBKyPRHHiEIhLOkEFHThzgikx7ZYRJssN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j6OCtxn9+FC0PY/aKYLbxc6d3OopgEkf8ZQIwSzaiQgLaXrffK4NTfM+RAbrkqPZHecb0NRmhhhnYhr50IH7dp39oL9CPi+V0XUaIRJJh17Mjv2D05Nnx1lrba8ubUqHLbwUc5pJZZre+2Pq5p8ncbRywxG4yzf69D8mGm0F3LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYQue74p; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYQue74p"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b627ea685so45733465e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Sep 2025 06:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819385; x=1757424185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Brl2BLRMH8dw6ZRRE0AMqdemVZpKH9vXc+oBuQmErPs=;
        b=gYQue74pciXQg2kms4SRquFfSNyC1KinkKMgGKfQKeTSfYEmFLqbHTghyTrcXkCl4p
         oBqCsAkhkkW3LIqjiQkFMi20tQD+oxrb+HwNIffL0lYXZywAkout0cctPl8Xgi7goBtL
         oD/9+bKn8jJ83Zz638HFlfc5gwSDTpOZLvB+465LS7tjwQvDAEGUCSPGUUCGA/OjX5Vr
         w5dZ3R4iMhchkOG3BqLIfNXINj8nmrdGAitTiegrAHzm+SHpWN+NoQ+LDcUykA/V1qJV
         TqooGUWMkhubGV5zCCbt4zAnAXsb2/5+uUGnf4eFdUII0izQLKG/LpcmZfw0SWAaq2wS
         UAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819385; x=1757424185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Brl2BLRMH8dw6ZRRE0AMqdemVZpKH9vXc+oBuQmErPs=;
        b=T7CPEMIi3hMqW1IEgKg+fUqgI9Wdtrnt9aBFltCEt17FmL5W0qbLnvkgorDoHdTpmC
         fcVwWgSOjvlTlAYZUbLV+wIFHNj4Rub9N6slKAhe8rfjcMFVVA0whyFOmhWhn0MjPq6k
         U7psWJlyjqQekJFdW46EZ2triVYtLx55SJOnLFq3fxqwkNlkns9TnJHgjVmns++giVv6
         JndfqwBdO4RG5e1OvfonqQ3JCtCx0cEnvRbB8F6y2xe3ze7FpTVWW1iaRcUFNGv8S7GN
         u82GsI+QiECLOHvdARv4mjWIpA9cOAGhVJqLorCP3eAV/E8fH4MxcGYnxHsMberEg7Rp
         SnfA==
X-Forwarded-Encrypted: i=1; AJvYcCWwJ9z+y9C/X1/aOOQO/69mgu8MLfF2tuYqi99ocd63x28CAo9pFeSZWNauw6nQ45oKaUOtl+A/p2SVzg==@lists.linux.dev
X-Gm-Message-State: AOJu0YypQI7rpcjWOpCW+2Zfsz/SfNvlJCYAS4+VPKipoE5N1pPCPBS+
	aIS+o383ABydIMc5ZquSEDkc7iK05zZ6/aR1eug3t3LKpH32xj+v+ZXQ
X-Gm-Gg: ASbGncuXteX7gINdbrj5shN/vklZM7pP/0gMG5pYOnpJF9fYkviMEizJVZgI167C5X5
	YhPi9xtRFgm/Eq0GBFdYUkts2Yp2ElE/q0nwJaqqgbULeu+RBwojfoc+l2DZ9AO2njr2UunQb7C
	TCgOYg1S40YlAXoxJin/itYYqIIF+Ekd0OSXz/x7qWD+DgSk6UmKB19AOKOtJbx1hBCZDcncex+
	XOCOPqnWwZJ1HBahTTITZLxdl9nBMTErgfYrf6FiXWeteH2C59Jex2qBXGVxza5IXBX88/uXgN5
	M+FgV02jf9Jz06NWTtjRRrvHD8mc8X6tqJRpl11Zdin8Hc72eI1M40UHmxFCAGFXFV9/Gh4SwLq
	j8te5RInOJIuu9EKL7WI/OqItYVRPa1A5C859WF669RDswkk78SIMXTY=
X-Google-Smtp-Source: AGHT+IHVGvsGBQGQkvMvtDDfpFtA8mIByGRDIA1JCKyDlAWmlLEu0KLDhiMCrW7Q3CDU6nE/Q0y2eQ==
X-Received: by 2002:a05:600c:a41:b0:45b:627a:60cf with SMTP id 5b1f17b1804b1-45b8559b8edmr113456095e9.24.1756819385117;
        Tue, 02 Sep 2025 06:23:05 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:23:04 -0700 (PDT)
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
Subject: [PATCH v3 8/9] crypto: sun8i-ce - save hash buffers and dma info to request context
Date: Tue,  2 Sep 2025 16:21:33 +0300
Message-ID: <20250902132134.3287515-9-ovidiu.panait.oss@gmail.com>
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

Similar to sun8i-ce skcipher code, move all request-specific data to
request context. This simplifies sun8i_ce_hash_run() and it eliminates
the remaining kmalloc() calls from the digest path.

Since the 'result' buffer in the request ctx struct is used for from-device
DMA, it needs to be properly aligned to CRYPTO_DMA_ALIGN. Therefore:
- increase reqsize by CRYPTO_DMA_PADDING
- add __aligned(CRYPTO_DMA_ALIGN) attribute for the 'result' buffer
- convert all ahash_request_ctx_dma() calls to ahash_request_ctx_dma()

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 77 ++++++++-----------
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  | 17 ++++
 2 files changed, 49 insertions(+), 45 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index df2acef9c679..6573c566bd0d 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -58,7 +58,8 @@ int sun8i_ce_hash_init_tfm(struct crypto_ahash *tfm)
 
 	crypto_ahash_set_reqsize(tfm,
 				 sizeof(struct sun8i_ce_hash_reqctx) +
-				 crypto_ahash_reqsize(op->fallback_tfm));
+				 crypto_ahash_reqsize(op->fallback_tfm) +
+				 CRYPTO_DMA_PADDING);
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG))
 		memcpy(algt->fbname,
@@ -84,7 +85,7 @@ void sun8i_ce_hash_exit_tfm(struct crypto_ahash *tfm)
 
 int sun8i_ce_hash_init(struct ahash_request *areq)
 {
-	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
@@ -100,7 +101,7 @@ int sun8i_ce_hash_init(struct ahash_request *areq)
 
 int sun8i_ce_hash_export(struct ahash_request *areq, void *out)
 {
-	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
@@ -114,7 +115,7 @@ int sun8i_ce_hash_export(struct ahash_request *areq, void *out)
 
 int sun8i_ce_hash_import(struct ahash_request *areq, const void *in)
 {
-	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
@@ -128,7 +129,7 @@ int sun8i_ce_hash_import(struct ahash_request *areq, const void *in)
 
 int sun8i_ce_hash_final(struct ahash_request *areq)
 {
-	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
@@ -145,7 +146,7 @@ int sun8i_ce_hash_final(struct ahash_request *areq)
 
 int sun8i_ce_hash_update(struct ahash_request *areq)
 {
-	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
@@ -160,7 +161,7 @@ int sun8i_ce_hash_update(struct ahash_request *areq)
 
 int sun8i_ce_hash_finup(struct ahash_request *areq)
 {
-	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
@@ -178,7 +179,7 @@ int sun8i_ce_hash_finup(struct ahash_request *areq)
 
 static int sun8i_ce_hash_digest_fb(struct ahash_request *areq)
 {
-	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
@@ -239,7 +240,7 @@ int sun8i_ce_hash_digest(struct ahash_request *areq)
 {
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct sun8i_ce_hash_tfm_ctx *ctx = crypto_ahash_ctx(tfm);
-	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
 	struct sun8i_ce_dev *ce = ctx->ce;
 	struct crypto_engine *engine;
 	int e;
@@ -317,7 +318,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	struct ahash_request *areq = container_of(breq, struct ahash_request, base);
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
 	struct ahash_alg *alg = __crypto_ahash_alg(tfm->base.__crt_alg);
-	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
+	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx_dma(areq);
 	struct sun8i_ce_alg_template *algt;
 	struct sun8i_ce_dev *ce;
 	struct sun8i_ce_flow *chan;
@@ -328,12 +329,9 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	u32 common;
 	u64 byte_count;
 	__le32 *bf;
-	void *buf, *result;
 	int j, i, todo;
 	u64 bs;
 	int digestsize;
-	dma_addr_t addr_res, addr_pad;
-	int ns = sg_nents_for_len(areq->src, areq->nbytes);
 
 	algt = container_of(alg, struct sun8i_ce_alg_template, alg.hash.base);
 	ce = algt->ce;
@@ -345,19 +343,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	if (digestsize == SHA384_DIGEST_SIZE)
 		digestsize = SHA512_DIGEST_SIZE;
 
-	/* the padding could be up to two block. */
-	buf = kcalloc(2, bs, GFP_KERNEL | GFP_DMA);
-	if (!buf) {
-		err = -ENOMEM;
-		goto err_out;
-	}
-	bf = (__le32 *)buf;
-
-	result = kzalloc(digestsize, GFP_KERNEL | GFP_DMA);
-	if (!result) {
-		err = -ENOMEM;
-		goto err_free_buf;
-	}
+	bf = (__le32 *)rctx->pad;
 
 	flow = rctx->flow;
 	chan = &ce->chanlist[flow];
@@ -378,11 +364,12 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	cet->t_sym_ctl = 0;
 	cet->t_asym_ctl = 0;
 
-	nr_sgs = dma_map_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
+	rctx->nr_sgs = sg_nents_for_len(areq->src, areq->nbytes);
+	nr_sgs = dma_map_sg(ce->dev, areq->src, rctx->nr_sgs, DMA_TO_DEVICE);
 	if (nr_sgs <= 0 || nr_sgs > MAX_SG) {
 		dev_err(ce->dev, "Invalid sg number %d\n", nr_sgs);
 		err = -EINVAL;
-		goto err_free_result;
+		goto err_out;
 	}
 
 	len = areq->nbytes;
@@ -397,10 +384,13 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 		err = -EINVAL;
 		goto err_unmap_src;
 	}
-	addr_res = dma_map_single(ce->dev, result, digestsize, DMA_FROM_DEVICE);
-	cet->t_dst[0].addr = desc_addr_val_le32(ce, addr_res);
-	cet->t_dst[0].len = cpu_to_le32(digestsize / 4);
-	if (dma_mapping_error(ce->dev, addr_res)) {
+
+	rctx->result_len = digestsize;
+	rctx->addr_res = dma_map_single(ce->dev, rctx->result, rctx->result_len,
+					DMA_FROM_DEVICE);
+	cet->t_dst[0].addr = desc_addr_val_le32(ce, rctx->addr_res);
+	cet->t_dst[0].len = cpu_to_le32(rctx->result_len / 4);
+	if (dma_mapping_error(ce->dev, rctx->addr_res)) {
 		dev_err(ce->dev, "DMA map dest\n");
 		err = -EINVAL;
 		goto err_unmap_src;
@@ -428,10 +418,12 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 		goto err_unmap_result;
 	}
 
-	addr_pad = dma_map_single(ce->dev, buf, j * 4, DMA_TO_DEVICE);
-	cet->t_src[i].addr = desc_addr_val_le32(ce, addr_pad);
+	rctx->pad_len = j * 4;
+	rctx->addr_pad = dma_map_single(ce->dev, rctx->pad, rctx->pad_len,
+					DMA_TO_DEVICE);
+	cet->t_src[i].addr = desc_addr_val_le32(ce, rctx->addr_pad);
 	cet->t_src[i].len = cpu_to_le32(j);
-	if (dma_mapping_error(ce->dev, addr_pad)) {
+	if (dma_mapping_error(ce->dev, rctx->addr_pad)) {
 		dev_err(ce->dev, "DMA error on padding SG\n");
 		err = -EINVAL;
 		goto err_unmap_result;
@@ -444,21 +436,16 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 
 	err = sun8i_ce_run_task(ce, flow, crypto_ahash_alg_name(tfm));
 
-	dma_unmap_single(ce->dev, addr_pad, j * 4, DMA_TO_DEVICE);
+	dma_unmap_single(ce->dev, rctx->addr_pad, rctx->pad_len, DMA_TO_DEVICE);
 
 err_unmap_result:
-	dma_unmap_single(ce->dev, addr_res, digestsize, DMA_FROM_DEVICE);
+	dma_unmap_single(ce->dev, rctx->addr_res, rctx->result_len,
+			 DMA_FROM_DEVICE);
 	if (!err)
-		memcpy(areq->result, result, crypto_ahash_digestsize(tfm));
+		memcpy(areq->result, rctx->result, crypto_ahash_digestsize(tfm));
 
 err_unmap_src:
-	dma_unmap_sg(ce->dev, areq->src, ns, DMA_TO_DEVICE);
-
-err_free_result:
-	kfree(result);
-
-err_free_buf:
-	kfree(buf);
+	dma_unmap_sg(ce->dev, areq->src, rctx->nr_sgs, DMA_TO_DEVICE);
 
 err_out:
 	local_bh_disable();
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index de3a096c476c..71f5a0cd3d45 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -110,6 +110,9 @@
 
 #define MAXFLOW 4
 
+#define CE_MAX_HASH_DIGEST_SIZE		SHA512_DIGEST_SIZE
+#define CE_MAX_HASH_BLOCK_SIZE		SHA512_BLOCK_SIZE
+
 /*
  * struct ce_clock - Describe clocks used by sun8i-ce
  * @name:	Name of clock needed by this variant
@@ -304,9 +307,23 @@ struct sun8i_ce_hash_tfm_ctx {
  * struct sun8i_ce_hash_reqctx - context for an ahash request
  * @fallback_req:	pre-allocated fallback request
  * @flow:	the flow to use for this request
+ * @nr_sgs: number of entries in the source scatterlist
+ * @result_len: result length in bytes
+ * @pad_len: padding length in bytes
+ * @addr_res: DMA address of the result buffer, returned by dma_map_single()
+ * @addr_pad: DMA address of the padding buffer, returned by dma_map_single()
+ * @result: per-request result buffer
+ * @pad: per-request padding buffer (up to 2 blocks)
  */
 struct sun8i_ce_hash_reqctx {
 	int flow;
+	int nr_sgs;
+	size_t result_len;
+	size_t pad_len;
+	dma_addr_t addr_res;
+	dma_addr_t addr_pad;
+	u8 result[CE_MAX_HASH_DIGEST_SIZE] __aligned(CRYPTO_DMA_ALIGN);
+	u8 pad[2 * CE_MAX_HASH_BLOCK_SIZE];
 	struct ahash_request fallback_req; // keep at the end
 };
 
-- 
2.50.0

