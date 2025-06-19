Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCDD2459E6
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Jun 2025 12:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335857; cv=none; b=ShT+Z8a4GSNIV9N2I8Qzu9er6v6QLkPkCHTlsf+Pnxo3TtkbBkEyVp4Kd/+ZgwkzSb4stkZLcylUdXpZHXsM9g/X71JDWUaYBwWftzOy88iGelZjZYNsInVQ8Q018XjIC1f78LEP8Af7oCUIADt9Q9dQuREIyBzdFJV80t6ehYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335857; c=relaxed/simple;
	bh=pRmnLFjBJ2dWkN+uiG3G+4366k2+/zNV3iQ7dsrr+ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nd2yqrhtK3vnsgXrfGnAi174WE0pEHynuTj2Y7fAvxDrBFykyiOkcL8OwP3qJKEqr4WyjCsKsgvA+SZZRgX11lUCKeuHoew+fAtyI/AmhQ+GIvRLNAVcEGCUxXLV82GxMx+y4D1Nd9yQMJ2bp6lRB+oxnSGidnxgw7x+9o2hOZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBdQsGXR; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBdQsGXR"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ade48b24c97so115178266b.2
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Jun 2025 05:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335854; x=1750940654; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t10wxuAUiB4KyOt9zeZgZ/9RxJrj16+YdQHln4bOH7s=;
        b=RBdQsGXRSa0bnm8O3uTZqaI0MB4R6g6Svsdi94TwjQbExn/wbJCRjoACeIyhVR5ufm
         gopl4SpmBkf4rlTLsESVJpCcNgybXcwG5rAgA3gq8lgzgSAK+W3Bzz1HxNkcE2FJ0rWh
         JOAfdkUr0V50lXp8MUOk4x0riCpllHN4wkR4M5zs1LiTiv/mZQjse6OneQJd/ks7+9ly
         nSPw3Xhqp/nDp2zyx6M6EZf+IOIJJmtCohLl/5xxifgDUf3Z6BpRSu3cDUHSm8RNp51g
         CFWxzl6Re8nEFmN/paBnETmXXAGHx1haavLlEZnEeOySU5c1m+0EGtr/4htNu/GajbTF
         BXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335854; x=1750940654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t10wxuAUiB4KyOt9zeZgZ/9RxJrj16+YdQHln4bOH7s=;
        b=viUTwRxDl9ppxE6f2M36dA6QrDECD89Vw/ElZm2g+4EhVMNiCJxk0r2/qhDOjpgha+
         hh+ZDDRfsIlGiO5w4MVMJhbzwin9D8KRbS6v6QmPyaywvoE8Act6poaBEOqvC3SjDRPU
         MFor16rh9rBPg8wWNmLFXj+u6xDyD3Ne8gxR4qgsfK4eOGwBZKiMnPBX3I7W6oWymC2h
         dFuGC5nrGYGEKgiIhnNAB3Qr3aWIlmWbRBbjvRev7Cqa8sOPKQFxSbvrePbQYx3iIeNr
         S9lkfpEcAmaMyQZ1U6M6EcHOBoNi4c08I6UZj3mERx7Y1hweqJi51GX/mpqof24GkaBj
         U2Ug==
X-Forwarded-Encrypted: i=1; AJvYcCV/Ma+2ObuYz69IEQc56y4jaVujB03BScrWYv2X+DafzXN9fZPmU0q90p/uMR8CwWY+Qh7HH+OYbHnmLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzlMGyCQMG419iAswdPgmVrFdNai2mOukCNYEPLhDs6PW7StQE
	XuvTj22/9FskmZTfl55XSgKIS6EkiFM/geR6ZiNa++v6WcU+YmGYP7U8hdsoTw==
X-Gm-Gg: ASbGncvNonptfAtxJz6vQ9OnzJMqwJ0S6WWPTh3UV2Txh/Nct2CuDQ7zvlCBOZcDDhT
	cLhtOgNp7mKC8wIATGcOyge9o3DBp6+gZwb9jxu8bgasGMNyIJSCV8qBLGAxlUEm+GSaj3N5BWr
	D7Ka/6J/m3XmeZx9g4qjGDYb8j4Si+Xhqn5IdxZE+asnkjh1a94Rt4t/MAdIeh2+suuMyGdrKyH
	LevQIsLuQp3LOENzQm2q6sdncDc4L08OEN1zSHzcJt8y7WGcvpthonnotQk9qTIYj+zujmCbGYt
	5CAgIYwju1jmFahCXnzDu7lRHziZrI1p1QEf3BKnR3GkFo96dZVpK/hhDIwhzD2IxRHbuLEhBTB
	o2M+ob7tQLnrJTw==
X-Google-Smtp-Source: AGHT+IHjXBuVHBHVzGX7KJawSoi/MaD0OIMw0TPwOstgtvFQbFHnqwQM6253a1WMLNA8WmktvzgJrw==
X-Received: by 2002:a17:907:7fa6:b0:ae0:3f20:68f8 with SMTP id a640c23a62f3a-ae03f207cdamr188465966b.39.1750335854011;
        Thu, 19 Jun 2025 05:24:14 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae000b02bd3sm504688066b.3.2025.06.19.05.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:24:13 -0700 (PDT)
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
Subject: [PATCH 03/10] crypto: sun8i-ce - move bounce_iv and backup_iv to request context
Date: Thu, 19 Jun 2025 15:23:09 +0300
Message-ID: <20250619122316.2587236-4-ovidiu.panait.oss@gmail.com>
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

Currently, the iv buffers are allocated once per flow during driver probe.
Having a single iv buffer for all requests works with the current setup
where requests are processed one by one, but it wouldn't work if multiple
requests are chained together and processed in one go.

In preparation for introducing request batching, allocate iv buffers per
request, rather than per flow.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c       | 18 +++++++++---------
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c  | 12 ------------
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h   |  8 ++++----
 3 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 113a1100f2ae..9963e5962551 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -209,11 +209,11 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 	if (areq->iv && ivsize > 0) {
 		if (rctx->op_dir & CE_DECRYPTION) {
 			offset = areq->cryptlen - ivsize;
-			scatterwalk_map_and_copy(chan->backup_iv, areq->src,
+			scatterwalk_map_and_copy(rctx->backup_iv, areq->src,
 						 offset, ivsize, 0);
 		}
-		memcpy(chan->bounce_iv, areq->iv, ivsize);
-		rctx->addr_iv = dma_map_single(ce->dev, chan->bounce_iv, ivsize,
+		memcpy(rctx->bounce_iv, areq->iv, ivsize);
+		rctx->addr_iv = dma_map_single(ce->dev, rctx->bounce_iv, ivsize,
 					       DMA_TO_DEVICE);
 		if (dma_mapping_error(ce->dev, rctx->addr_iv)) {
 			dev_err(ce->dev, "Cannot DMA MAP IV\n");
@@ -299,13 +299,13 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 
 		offset = areq->cryptlen - ivsize;
 		if (rctx->op_dir & CE_DECRYPTION) {
-			memcpy(areq->iv, chan->backup_iv, ivsize);
-			memzero_explicit(chan->backup_iv, ivsize);
+			memcpy(areq->iv, rctx->backup_iv, ivsize);
+			memzero_explicit(rctx->backup_iv, ivsize);
 		} else {
 			scatterwalk_map_and_copy(areq->iv, areq->dst, offset,
 						 ivsize, 0);
 		}
-		memzero_explicit(chan->bounce_iv, ivsize);
+		memzero_explicit(rctx->bounce_iv, ivsize);
 	}
 
 	dma_unmap_single(ce->dev, rctx->addr_key, op->keylen, DMA_TO_DEVICE);
@@ -348,13 +348,13 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
 					 DMA_TO_DEVICE);
 		offset = areq->cryptlen - ivsize;
 		if (rctx->op_dir & CE_DECRYPTION) {
-			memcpy(areq->iv, chan->backup_iv, ivsize);
-			memzero_explicit(chan->backup_iv, ivsize);
+			memcpy(areq->iv, rctx->backup_iv, ivsize);
+			memzero_explicit(rctx->backup_iv, ivsize);
 		} else {
 			scatterwalk_map_and_copy(areq->iv, areq->dst, offset,
 						 ivsize, 0);
 		}
-		memzero_explicit(chan->bounce_iv, ivsize);
+		memzero_explicit(rctx->bounce_iv, ivsize);
 	}
 
 	dma_unmap_single(ce->dev, rctx->addr_key, op->keylen, DMA_TO_DEVICE);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index 79ec172e5c99..930a6579d853 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -757,18 +757,6 @@ static int sun8i_ce_allocate_chanlist(struct sun8i_ce_dev *ce)
 			err = -ENOMEM;
 			goto error_engine;
 		}
-		ce->chanlist[i].bounce_iv = devm_kmalloc(ce->dev, AES_BLOCK_SIZE,
-							 GFP_KERNEL | GFP_DMA);
-		if (!ce->chanlist[i].bounce_iv) {
-			err = -ENOMEM;
-			goto error_engine;
-		}
-		ce->chanlist[i].backup_iv = devm_kmalloc(ce->dev, AES_BLOCK_SIZE,
-							 GFP_KERNEL);
-		if (!ce->chanlist[i].backup_iv) {
-			err = -ENOMEM;
-			goto error_engine;
-		}
 	}
 	return 0;
 error_engine:
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index f12c32d1843f..0d46531c475c 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -188,8 +188,6 @@ struct ce_task {
  * @status:	set to 1 by interrupt if task is done
  * @t_phy:	Physical address of task
  * @tl:		pointer to the current ce_task for this flow
- * @backup_iv:		buffer which contain the next IV to store
- * @bounce_iv:		buffer which contain the IV
  * @stat_req:	number of request done by this flow
  */
 struct sun8i_ce_flow {
@@ -198,8 +196,6 @@ struct sun8i_ce_flow {
 	int status;
 	dma_addr_t t_phy;
 	struct ce_task *tl;
-	void *backup_iv;
-	void *bounce_iv;
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
 	unsigned long stat_req;
 #endif
@@ -264,6 +260,8 @@ static inline __le32 desc_addr_val_le32(struct sun8i_ce_dev *dev,
  * @nr_sgd:		The number of destination SG (as given by dma_map_sg())
  * @addr_iv:		The IV addr returned by dma_map_single, need to unmap later
  * @addr_key:		The key addr returned by dma_map_single, need to unmap later
+ * @bounce_iv:		Current IV buffer
+ * @backup_iv:		Next IV buffer
  * @fallback_req:	request struct for invoking the fallback skcipher TFM
  */
 struct sun8i_cipher_req_ctx {
@@ -273,6 +271,8 @@ struct sun8i_cipher_req_ctx {
 	int nr_sgd;
 	dma_addr_t addr_iv;
 	dma_addr_t addr_key;
+	u8 bounce_iv[AES_BLOCK_SIZE] ____cacheline_aligned;
+	u8 backup_iv[AES_BLOCK_SIZE] ____cacheline_aligned;
 	struct skcipher_request fallback_req;   // keep at the end
 };
 
-- 
2.49.0

