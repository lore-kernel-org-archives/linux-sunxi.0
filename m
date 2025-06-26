Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B61B2D3EC9
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750931966; cv=none; b=fKVL3jYIrfNCXlmta+9gdphROJ/lvBguhk8kQ8S+sprI7rkkzMmgEWKGIZd2FVwlXPL0pCGkGrn7Gd58wtnl/AlAcxRveJz8IxVjyJdPE/F/q3/OQM7IH36FtF59oWwZ8ajYfejjZRdATy/GqlW5hYm34zyxUnT+s7Jb4GORobs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750931966; c=relaxed/simple;
	bh=C/gJk2ObWTENdNN8gXRsiciv6hvj3wk+copliiqlW8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YyO4mtWAYhUzQaPaJ8dB048pDOibf+GftwqfBvbdSSIEp9dvudVMGqpGKeaeXIkyFFwWYTDzgct4fdMTg3TWqFa/+2CMq2CoWgPd9/dDoAq1eZV5dOnw8XkLzHZddaKL7XPAqneGfGYjX61sTUvG1O8ajGfFm6Zw6eMAnOK/RKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHnqNbGj; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHnqNbGj"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-adb2bb25105so121055466b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 02:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750931963; x=1751536763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4FE/m8CCQWWX6zEjUZSa1AuebcPVAo/kb1WN2hI258=;
        b=RHnqNbGjeNTOkkAkXfdRXmyCd83ZEI2RuEYWgm2wo1aG2wgBgMB79rtOr//wfoxCK8
         17gEq1eFdPgfr1aayWS9bB6GmAgdehXdi/NwdKb9bar06SDN1pAu3CdHm2vFuai6mGCu
         JKTy6/kwnd/n2OsZJEDi4KsCfszlvclN+Fu+4fV0z/KjsuPC35715PqZtxmO8QP6m0z5
         3qzI/AhyhDEsx/Efx+j/yS+eZV2v2nm/NA2Tbwg71M6IzrH/LJwbDlKmCr/Zd7psZ50t
         LiB/itkKN29ScNN5HmpO+Q/vH3v7qOjZl1oXrgiFrsSiqVPKg03U53IfOk5flvX145Ez
         BpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931963; x=1751536763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4FE/m8CCQWWX6zEjUZSa1AuebcPVAo/kb1WN2hI258=;
        b=NwZG0s1ADW6BoRlFeG0ovUxOhQKVW9sXOBJPSQJ+XCMOQiU+gJ6I6CVcGFPSkkkgNN
         NIzs8gpu3U59qsQBiyUJjPHPEYqTTAFXmTn5umTIrkkCyD9DrsiSpDKef2K+psmaBfPN
         oaZUlZynRkcUWoU5YYMCV/S8zyuWa4rDYI3yrVZVmAQftBPXxfpU7RoslZJk+gZuSP/n
         UHC2jHpA9i1hOpAq80SMHIXnG69Rdk0MknIWF1SBRrp0kOURmxKSzhcYDPFhzrGZ1TDl
         5aCjKTpv8e1QJurus3T3P2bJsGpSiaP0RseEARtRAJVJ4eYIs1GQGdNJmCj1hhwGI5Bn
         Au+g==
X-Forwarded-Encrypted: i=1; AJvYcCUwdoqFGYSu1KC6q1UKo9rnS584z4w/Ilk2fk1pNfOWqcrbl4OdSSP64yBPqDaRfSKHTRwwz/EfI0jrUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFLMAV5Z+mf/1o8zgkWuto40jhUzf+AB6oZ5fqoiQDx91T9Gqk
	P6spoFsTcVKaIRC7S8eOCu/opweZaGa/4P/OWG3Y7W6V3JCJRr9TI6RF
X-Gm-Gg: ASbGncvnWg+dA0zFOfWOpDY76HnQmElr6PVVFezvH3/slLwdMrESA7HtUegqzwyhd4W
	MgcURKHDLL/XOVjwVoEkPewfrjP+Da2YmeFOoSWZ5CxtMhju6GXmEyE67+WIVWRWBVX+wm/WYb3
	XT8jwa4Z2HDx5wNQAAQBGSSgLSDW+fPqkTqEX4aICTHz7vbsM3xHegEPRZAyACHJF/GYrSyEbTY
	p97uOj0Suj83rSTPGLN+4R33lmLFqSZk97QXbpOIhrMVCsu3+B6vJaL6kPrqUfsMaM5+m2Gf1Kg
	GeSV9dwNysO9u1fnbCf64YaKeIIy8m6hmf0PEi5xMqm0rtO2PvQ3yuYyp4JHKxz1w2lfCrfMZb1
	rylTUaHiIDzu1stEb2FGn+X3X
X-Google-Smtp-Source: AGHT+IFTZlskgagUQmsCBIaQcTzLFQ/L/bhoraExJkrhCa/vRJ39QMtLqAaw8cYJYMf4uvVB6AQrMw==
X-Received: by 2002:a17:907:d26:b0:ad8:9e80:6baf with SMTP id a640c23a62f3a-ae0be95d15amr719826166b.13.1750931962452;
        Thu, 26 Jun 2025 02:59:22 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae06aa5ff34sm1014106166b.40.2025.06.26.02.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:59:22 -0700 (PDT)
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
Subject: [PATCH v2 04/10] crypto: sun8i-ce - save hash buffers and dma info to request context
Date: Thu, 26 Jun 2025 12:58:07 +0300
Message-ID: <20250626095813.83963-5-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, all hash processing (buffer allocation/deallocation, dma
mapping/unmapping) is done inside do_one_request() callback.

In order to implement request batching, the hash buffers and dma info
associated with each request need to be saved inside request context, for
later use (during do_batch_requests() callback).

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 56 +++++++------------
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  | 17 ++++++
 2 files changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 61e8d968fdcc..3ee0c65ef600 100644
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
2.49.0

