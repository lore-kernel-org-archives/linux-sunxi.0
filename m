Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DE8224896
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Jul 2025 06:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753682888; cv=none; b=sn/60Jd86dxr7UP5RI20E/i4vRYpPtf6l+gHJEmo9wyWua1IH4WQKG6KaGACJMTDXqJw9l3kPhXQokoF3SC7R+kfEKTKqKmWJAM7cumZ/hczuR0TZFafd8HqolmcNMGjZAjo48wMrl7rxjdk/Z3+byHzoEtp+IQGNfXOjlejBvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753682888; c=relaxed/simple;
	bh=B65GIV3its2xp1R6jcBGC4dXubBGAt9T//wtW+mLfK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DfsyZRCzlgGCKehMx2G1V43j17WcqEBZl2FyBbRgfboHpmWV27KJufIHxBEt1TVsUTkXyd4VXj+QrNwlPUoYHaiosQmt0fd4TRq2SXCFy9qgIkdFfyjug2QEuqqFH4UTKQsDyAf5DXTrQ7JwQTp34pJR5neH7ZBcyQYbS0qLyBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhtRLG7d; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhtRLG7d"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4560cdf235cso19478225e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Jul 2025 23:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682885; x=1754287685; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPkkvVwxFYU+2Mr615PFvFXGtNmnnnpM8am4NYDPd7Y=;
        b=IhtRLG7dUpyhPtBNgMR5pa3H182QwMb71q8ibV3WfqRd9wRFuKTiTddLx0KeYjJ5IS
         a+xRQjDYGBBa4/l39vu3Wq0dszg7UgP12OhSjAbweQX2CyO8+aH6UP+sLLoUPFeiC5JK
         nfIt254e1EQnauGqSnovv3MxiiKEsvDwom4a1O8nKJoARmCJoqPgwwHqdm+qONZinDPY
         WTjs44Z6zu7shsw6TgKhXGrKN9cExnJaZefJSPxxwmFvfh1xeYw34XYl3VgYpEp5CsDr
         4nk7I3bUQXwfWQhMtaH2AY9Xi8f05/WqkDO6gWZH88JQSIz9TRQzyy9otRUyFp6L2nhc
         sXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682885; x=1754287685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPkkvVwxFYU+2Mr615PFvFXGtNmnnnpM8am4NYDPd7Y=;
        b=ZLQyPXM2jo0irDYXnUl7NEuCVFlAsow543caE36IzkeHHf4/UUraJLRmxdsIUx05s7
         IuGYhZUhRpy9nP/bfT+Fw42AEaS0KghsFiRJsICZAWMuqEzvTWSoaX9uvymnP49MdWCe
         6Enlap4/RYKC1wLNxugrGJd29+VBkxQ8oCHSGtdJwaIw2nsWaadhDPcdZpIcJcN1igPH
         wIHd7rVETkc7Bug5rhSgXw4q1Lau14D3Iwr6714iDipLX6ndpkkoM3uy+R9yB3Mw7UHK
         5Q47ZqxJdsmf/ewHOWDPijM/SMy1k6GP1OJ7v5CX9orAqDpMOcAkm/ls+yL6eGoFWeCf
         UD5A==
X-Forwarded-Encrypted: i=1; AJvYcCVDokgBVJSMnkDbtpZXgd80Ece1WZ3u6KZOKaKANaoLt58TDHme9lWZ/Defbr3zrs9ygNAcPlw+ilyaDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwREz/ULVrchdrRTbtuGtJcGvP7sjJREPObPMkOonp75VkkpDlZ
	ZCbXzp9iLtfE+8OblNNQcJCt1aMcQYbnB4A7iGfPdMUJnob/EKz/avmi
X-Gm-Gg: ASbGncshkQKeR8G6SOdD6wLCAqMM4w+ct8YSPVy2hFCo+2Xo7yIbadWjsIrYVq0Kzi9
	rLzjKlxNwq70uJkz0euv2/KGGP6dkzDJBGangSOvV/9wRfSuM4sfQUvp8TfyaixjQImDQwkKx+N
	G39iBmwlCp7HNzIYgVMbn++8GeovKAjMx3AcgzvfY261SOG1HUt+AWRqlYwFdeJPxex0RWy/Dya
	6nlTOVMp08A4c6ejI0WyfTb9oxvlXDTa81UGbodI9Ix6+9gPwcg3/7NirveRCxKf8mEBeUIdiqi
	n2PzDdgAD6kzQA1j+gcCMz8ZK/aW6vUYerJDWoytnPuRkpg3IB3ELgsyS3fVwt9jnVno5XxoJ5R
	WsKFNlMhbIlYgE4HhkzGAdLAmHn2xpDpybQ==
X-Google-Smtp-Source: AGHT+IGNHmqJIpVWF51P/BJHTnOzhLLnt+a4s0Kx90Y6aX/0rcrlD4mW+DwtiXOJokQk4AhF1Jdd9Q==
X-Received: by 2002:a05:600c:674f:b0:455:ed48:144f with SMTP id 5b1f17b1804b1-4587630921cmr85129635e9.14.1753682884424;
        Sun, 27 Jul 2025 23:08:04 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe6ba0sm86195215e9.9.2025.07.27.23.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:08:04 -0700 (PDT)
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
Subject: [PATCH 8/9] crypto: sun8i-ce - save hash buffers and dma info to request context
Date: Mon, 28 Jul 2025 09:07:00 +0300
Message-ID: <20250728060701.1787607-9-ovidiu.panait.oss@gmail.com>
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

