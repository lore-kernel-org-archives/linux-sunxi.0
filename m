Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CF6204090
	for <linux-sunxi@lists.linux.dev>; Sun,  3 Aug 2025 19:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754248271; cv=none; b=ZNilkP/6zixrMT4dA3/V/sK0H13XXeAFwAZp34Rtwtlcjt/KUURU0P5uBlDj0meUtFGrs2xq8lVkdPUR56nBhowIMp65PbozYZe8kKCH6+DdlEFEAow3KKySpfylYmr7F7v0GIocwGswYpBtW6XrGlfhZ4RhL9P7OYACyP2cEa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754248271; c=relaxed/simple;
	bh=4gturWBm9llQ03CvUeU357O9qcWzGD7EQUK/d5jFGRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oOF2kVYi+JPfyCjF4CoYClG/H4w4dBa2nze33VUkuaDhan27qpjfO0edl2Tekk+aXEJzQisMQ13EK/T0BYJOjysXGOG5pyBtYBz8T1I0zAEEkZJANAGJw3TBR6AoILCAGhO6flu1zemL6mSUXvW7AMLomtv0600amQMCaKISq8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEs0SuA9; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEs0SuA9"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b785a69454so1475993f8f.2
        for <linux-sunxi@lists.linux.dev>; Sun, 03 Aug 2025 12:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754248268; x=1754853068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+X8fG0ywPfrmQVR6r26O20nKFt/URQggWx0ndoBVaZQ=;
        b=NEs0SuA9MiIhsMm0AuRWOaqAkfzIUbfsV4I+JemhAxAWOM3RfhjgibUeCicAjhZ/l5
         OmO4B8brjv4w0KpVNvuUapOwFKEu3RQgDChGpFc/qprFgKTif9MVDs2gnUFV60CAT52P
         INrIDUPsN2UzWw0V9HlAwXIrzf9kMxW9jxvxpHPrIEuevJx6Rvw3Qsu84IxG8mRMrTo5
         83OWsWe8DLkkZOxPXwXw9OXD3Hl1znRAHtRMOezxLBu9p9aikLgpvsxEomSso7mDwrvG
         5vmHlZhg9UyJZ0ilh1Zd61oiSIahuOZVY9gGXPFAcT1ZW+ww3Eq8OT//o8UiWaNGIwtI
         +/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754248268; x=1754853068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+X8fG0ywPfrmQVR6r26O20nKFt/URQggWx0ndoBVaZQ=;
        b=o3eIaJ7iO1dwBbgbp3/z+Y3R3QmHFkTxSTyBlBy3FQntApJm14TJkic27MqrxnprJQ
         aTCYaupLeGchs9HxXVOC3d1LZG6RnxFsOHWwTSp/r5lJ8eMqPSPVO36t88WxRHsV+6jZ
         mQGkj0Zcl24T5OdtttEn369/Tlk/5yPxPSkNZDlHXMGJnCv2x5j5gl4S56F8UPwh1Na+
         n014Idd9BrdjiJCBkiTQU2n9jTQTNChdM2RjPkSprzenU/bd1oKmrrF6SuydXuK27B1V
         1paAN2k+9+ZF8keQ1vyoI+0BqS+h9Dozko/O/A8teP3gW8cVOKfQ4s8pxy5KbHLkKtX4
         EZQw==
X-Forwarded-Encrypted: i=1; AJvYcCUpZ1bRe1PrBUK/oDhe9K6/881S44PAo7k87r5mZr2LApWLpV503yZv78I+f86mFM1bslY3OQ2IPohhkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuCj4Z0e4bBwGdOFkFCvDMleiE1bwbBVRLCepUDu+cp48VSiYh
	9X4vjHgL3+Cf3DNLxgxpYzTG7GW2cPFhzxC481atXSl2N7sywUe3AG4J
X-Gm-Gg: ASbGncs+GTnpyFy/60BDkjNuNKRFXNc5YJJlThJ3tePQMMSZZQS6j5tZwSM5m6IQM2G
	koqwrdnKR4tmIDNXVz8IdqVeQxm19UVv0xs+W6PXkJUELE9+Gt9xHM992TRYZtWbJPi3139s65E
	ZALlt9IDBfOLY4uP7OLEA1yw+H0lYzH/xDoeE8OpUypdZTfjvUquXmNbSLFvrQwtPyBGeyAVhRe
	WTQIGL3gEayAJFVZJVJkXyHBJNcUmpev3c68YpoaRAoWvi81H1XUTDyyai5BShhNYbcQD5pRoek
	3MUcN3AAMN5XajnOg7MlJ9TQPMP6DiqLT46nZ6LT3cBcEDVFG1FIKR/pO1uAvSOOFtrWwSHCBzH
	YWRfIjxaP2yFeHWcxfyn6usXGB9xlAHgSnw==
X-Google-Smtp-Source: AGHT+IHmU63nL7KhrYVgzX7obJHqRHaKsmdzwuH3zpDNrqoBJQ2FLJGMFWpvAfGKl736d20CpxhjUQ==
X-Received: by 2002:a05:6000:290c:b0:3b7:97c8:da97 with SMTP id ffacd0b85a97d-3b8d94baa99mr5568207f8f.43.1754248268189;
        Sun, 03 Aug 2025 12:11:08 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm13099210f8f.39.2025.08.03.12.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:11:07 -0700 (PDT)
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
Subject: [PATCH v2 5/9] crypto: sun8i-ce - move bounce_iv and backup_iv to request context
Date: Sun,  3 Aug 2025 22:10:25 +0300
Message-ID: <20250803191029.3592987-6-ovidiu.panait.oss@gmail.com>
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

Currently, the iv buffers are allocated once per flow during driver probe.
However, the iv buffers hold request-specific data, so they should be part
of the request context.

Therefore, allocate iv buffers per request, rather than per flow.

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
2.50.0

