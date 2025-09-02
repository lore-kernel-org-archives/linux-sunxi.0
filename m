Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D6B307AE9
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Sep 2025 13:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819385; cv=none; b=igv7cFFC1j6d/5VWgFAubGDcoRGfaGa1jLrJnrMAHD0UB3EfL9Vw0MHw+5J2fddWL/2Cgmoj5Li00YOlviRA9nOkuJaS2PnFp3OtnMeCS91gaxBux0l9GXaWrnzGxqG5lkaYal0wy+rfk2bHc1C4hPEBtFtKs3fI9rs8Tr+yc0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819385; c=relaxed/simple;
	bh=Tv+uPkupmNEYL/Dftci6+vTNcsCph7gyS6HdR98JrGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L+b/qSJCs9N1CDErnQBoafs9O/btOat+80IS71g3hjJ/pmxQWLYHXyFtuzeLt7qdnZpF5Wzq1dgppF6/fMWQF51biLfwNgQkmgKVcOQ0gj8uZ5VmDodyrzRLfXYyIOPIkqwwBVpal2cS15yV7k6Q9ts3bbOhi3YQThnW6PP9SnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOnkWtIN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOnkWtIN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b7e69570bso27489025e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Sep 2025 06:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819382; x=1757424182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtsBsRfxsCildLBhMXrk/1mukmK+Bo0TNCGWMCSP/qs=;
        b=VOnkWtIN50VSuWDyfqDcZY+4HYtHc2pXX2Un+WPvWQzZg0tZ9KHVkW2L9o+Az4cJcY
         xmTFxGnQWThrN2VSP33XWax2iHVQhEBhZOUCImyzQpYrAwcDH4Dh+jP2NLKrv2187Tio
         2JXHW41RXQ4LNyMHJ7uHRlMg0tfscYxGCNZxTBmPk/L90saYLgYZn4/WmNqugLHKz5FY
         wmENoz+8YIb3mJ3zj+Bt/zWWT7LOSCeJyeNUdbOWb/UaV/v/ThRzzbZZIJDErmHUHU2i
         TeZxVviwDBJX1a2HPCPs/GxymTJP1XB8eMPpS40FGM31ltlm9/MNafDpfL1+QrJeCnKX
         IVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819382; x=1757424182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtsBsRfxsCildLBhMXrk/1mukmK+Bo0TNCGWMCSP/qs=;
        b=w1RtID9eapZDU3LF7kLceALwANXqBRboI0rMEGp8TCmSqkGccs7HhgdPXXCl+A4+ll
         IJxn0f6oYd2DmSkIhb2UprZf0IwCbFoif+L79ZP4n7U23EQRLiSzzzHyMFROKclJmfan
         iw1A4nstZka1TyrshE9OchZlKO/EY0NpnTk8lg0r7YLQ5Bd5XwKR7UoItIIHnSkljlbe
         Pjs4Th8KZnLt0QirisyfIRl/0tHH96UFtIm/Mv6ZFYfUc8l89ODcMjYsTJWS8p01ZrkE
         xoOJGX06gSUIU+fPpSk20Ts2lyEzwnuLrvXXNj6bEaomzQaaBr+wQfvjgpJdvit0+RaB
         62vw==
X-Forwarded-Encrypted: i=1; AJvYcCWOi81aglnNa0vTDWUBEKu7bpHZ6RzMe+xy0u28PLAD7o4fPWBQ7Q1GJrYvY2h/lxAP0auqZh0HmujB7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXlj3zjrz9PX5TIBtw1BVZCjxtCXC7mwRcoGLeB5bO/uO1VZSq
	0nI1SqVAnMf9ZEf9q4DvWwvuB6uowDqwa4ak5ZaSmw7CfgIrnjq9XAji
X-Gm-Gg: ASbGnctG3UHZAp/SAA17zJUPeByYr7Nz/HjzsiJE93hk16HZeioBsa9Q6LIHcxJrnrc
	1/YC8nRLF4OvlcuOmnr1vTl5hRYcEIUYZdVthdteuSrjYb1mwX3Yjj/Z7Euec1oAE5uYzwUJmf4
	L8nzVUHHe+eM1o5TVxugEJU+XcErsW5lKZFy50sGCXvpaM268bkyhSBuj5P2ehpKuDxtbqD0hhb
	slO5c5qospeZ4Kf807uKPG3PoEJZXWe7ho58uSq6MU97RCKpdry32NFbJeQdUUSpmA7uUrCiQ9n
	x0S15/cBG2CxHxIyURI6XTjTT7jTbu4ECchu8f3jbcrQYOOrjGx9X+miqT0mB2srViLMCqFl5+z
	NfGoS1Gqbxo7MBsxeIGmxtd2aqu9OqyWperwWVM0GNgVx
X-Google-Smtp-Source: AGHT+IETMOb0Rz6uokv2cCuXIze1UZwZd7stbSLwZ5/eUHfLJCESg1DUz9amO71j1f3f3X5J/fE/FA==
X-Received: by 2002:a05:6000:2f87:b0:3d4:d572:b8eb with SMTP id ffacd0b85a97d-3d4d5820387mr7918018f8f.45.1756819381342;
        Tue, 02 Sep 2025 06:23:01 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:23:01 -0700 (PDT)
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
Subject: [PATCH v3 5/9] crypto: sun8i-ce - move bounce_iv and backup_iv to request context
Date: Tue,  2 Sep 2025 16:21:30 +0300
Message-ID: <20250902132134.3287515-6-ovidiu.panait.oss@gmail.com>
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

Currently, the iv buffers are allocated per flow during driver probe,
which means that the buffers are shared by all requests. This works
because the driver is not yet truly asynchronous, since it waits inside
do_one_request() for the completion irq.

However, the iv data is request-specific, so it should be part of the
request context. Move iv buffers to request context.

The bounce_iv buffer is aligned to sizeof(u32) to match the 'word address'
requirement for the task descriptor's iv field.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c       | 18 +++++++++---------
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c  | 12 ------------
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h   |  8 ++++----
 3 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index c57c64a1a388..69ba8236cf2d 100644
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
index b7093fbb8e9d..c16bb6ce6ee3 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -759,18 +759,6 @@ static int sun8i_ce_allocate_chanlist(struct sun8i_ce_dev *ce)
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
index f12c32d1843f..de3a096c476c 100644
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
+	u8 bounce_iv[AES_BLOCK_SIZE] __aligned(sizeof(u32));
+	u8 backup_iv[AES_BLOCK_SIZE];
 	struct skcipher_request fallback_req;   // keep at the end
 };
 
-- 
2.50.0

