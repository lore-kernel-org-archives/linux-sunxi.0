Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD09218AD2
	for <linux-sunxi@lists.linux.dev>; Sun,  3 Aug 2025 19:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754248275; cv=none; b=B4FE9A6ut+NiOegkKwngpvQklU0JdBiB43LiR8Zh15J+iR2XmVP6PNhT5OexAEY0Fnws0P5Z45PGJOqMT9X2tJxBmIDQ6nAfb+yXw+EVISOZiI8Rb5HIlR87KtEsNCuLX/FTF7CqsBXkEKke1CBxP+NLSfVAfAJi14dTGRbe+9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754248275; c=relaxed/simple;
	bh=B65GIV3its2xp1R6jcBGC4dXubBGAt9T//wtW+mLfK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NvOC7A0KloWmPdG6uQPohXCahPGuJ1chLuTaS8qN5uSzq0N2o6xF21sSiMfj7oIA4Cz6sYqVO8ltYBrgKP9G5gTUNeE6U0mQgGjEBoNNHdBUcFAgvIf6cqJr8gHGm1Y7FYIq94OlEkyelDcCTcXPAf54jp1Zuyt6sIithTuWdOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLVSvCW7; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLVSvCW7"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b7910123a0so3863508f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 03 Aug 2025 12:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754248272; x=1754853072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPkkvVwxFYU+2Mr615PFvFXGtNmnnnpM8am4NYDPd7Y=;
        b=kLVSvCW7XHR/ePOv4KTmL6/8HXZvj/lIlvBLw84FcA9UF/4YwnXqjWwDTf3RyjDucY
         a4oSs99fLoqVfgUrKucuxV+KkZIT+U76Qm+0mc21MpFziVri/KfWg8odNcvZ+iI4pNo3
         kmOZd7IxxXYt8YoZ3lY8LO1uYiDedKAgREWuzyyadp30At7+l/2W/fz8nlLlOp0jxV7C
         xBTw62pqL+cvgiHmfdfFKMm7MmSwp8LL4EMXzI8h72LGAphfYSLERCzLbmsOctNIKGk2
         eHmYJnQPEta/Wlt2T9zalY9tUzm0VNJ9oTOBwx5WUiJdE6E0e1hG3W7EVjxzul2kmd/+
         vJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754248272; x=1754853072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPkkvVwxFYU+2Mr615PFvFXGtNmnnnpM8am4NYDPd7Y=;
        b=YTWH93v8W+T67pTHQWAt+nKfJvJuPKCS4xmz9CF3VDNFbW7Q0QGHMzxrOMR90peoG8
         623TfrmyVCL1JuzMWUUiP5RaBqPapSsZ3NSZP5r/S5sjHSQOklxsM76tygqR7sNhpoKt
         ghlV4MXdkZdnLFutL4aHfPYATHBqgUrInufYZvq7oLs+Lq9bY45k8NPXBUBS5Nr80JlD
         9/CHe15n9ubJA7WNYUALqZEEAr0MAaiuwJ4zMwtKedcIRG4Byc7Sdf6Hi38L0dZhdGVn
         z32RZIFK7OhFZQH6cwsK7mnGCOQcbIj5HDRd7WQGvAQX5SpdaVgMuCyQgNgLegVTuuww
         3HgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS8HXm20id3GGbvzTUR44wRFgXIjPsKgwaf8TCmuttevt/G4KVolpYpkmQETMpc6fj3lSQumGsQVQ/uA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+RRL33YdSoAKU45a8j3V5UuWO2i5LXSRUrw2Hbfu1nQua+//T
	pSdCmuryNnAz9HlZuDnTF7pheAonInCDE+6vQGXo1nt9ZDfuFXhqXzLr
X-Gm-Gg: ASbGncu6uH2+TLLKOZwk+4dU53ZcgCZQgRZ8xE0U/fDlXMT+5ah3pC9JK9Vfaozlf4h
	XIIEID3wyBseE/ZwrwpfFq5MPNzgktYr7Qs+haLcYLBdu23HQf3d7bZFKtl3yrDaThXZbSEX/aL
	xaTT7tkXN25sgd0qbTIYsaGAnd5jKaAUVzumY0iA8dKFaVRJ/5az6E6unKgnqoGyRAgEouS27ED
	d2+MPH91aeCW9uEjC3e+Cx08Vnv3isF1PE255wLT7qc/u27aCnmRHp7U3ddt94G961c+hJwa3kC
	ABE+1ckSIuipdPRIXXE97QUVrNDaSluv2FuttkDJAV4+MZVa5dNjWbxIJ40PqqYYOO3za++4DHg
	lp8pBQbE/UcQ4g2GU+gn8+mZYlXsyWw1Gfg==
X-Google-Smtp-Source: AGHT+IE6MhL7+I58bcS8THCFfl9pcCuQ6d4eZ/cd8pKuwSLCaUyMm7M6/8UMIKCzZ6nMlHDZh0bvtw==
X-Received: by 2002:a5d:5d0f:0:b0:3a3:65b5:51d7 with SMTP id ffacd0b85a97d-3b8d94838a3mr5271879f8f.26.1754248272003;
        Sun, 03 Aug 2025 12:11:12 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm13099210f8f.39.2025.08.03.12.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:11:11 -0700 (PDT)
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
Subject: [PATCH v2 8/9] crypto: sun8i-ce - save hash buffers and dma info to request context
Date: Sun,  3 Aug 2025 22:10:28 +0300
Message-ID: <20250803191029.3592987-9-ovidiu.panait.oss@gmail.com>
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

Similar to sun8i-ce skcipher code, move all request-specific data to
request context.

This simplifies sun8i_ce_hash_run() and it eliminates the remaining
kmalloc() calls from the digest path. It also makes it easier to split
the monolithic sun8i_ce_hash_run() function in the next commit.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 56 +++++++------------
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  | 17 ++++++
 2 files changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index df2acef9c679..e28100c07b86 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -328,12 +328,9 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
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
@@ -345,19 +342,7 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
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
@@ -378,11 +363,12 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
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
@@ -397,10 +383,13 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
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
@@ -428,10 +417,12 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
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
@@ -444,21 +435,16 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 
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
index 0d46531c475c..90b955787d37 100644
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
+	u8 result[CE_MAX_HASH_DIGEST_SIZE] ____cacheline_aligned;
+	u8 pad[2 * CE_MAX_HASH_BLOCK_SIZE] ____cacheline_aligned;
 	struct ahash_request fallback_req; // keep at the end
 };
 
-- 
2.50.0

