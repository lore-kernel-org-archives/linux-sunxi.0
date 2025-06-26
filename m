Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152892D12E3
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750931964; cv=none; b=PoumlPY+Q2Jlx4fqJRnDE/EVCYzggkiI0VN7tSNBxFdvXhLeKAWTv+JyI1MI3ZD1dldzNTkgSJAMlOAcn8M4qgIBomPnDSlGgkV0LYacCucdTrUxvb2wAhn3P6u5AnPcujcjdcdp68kbVv3q5F3XVkdh21Qiju8FVXYyxZPuHsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750931964; c=relaxed/simple;
	bh=pRmnLFjBJ2dWkN+uiG3G+4366k2+/zNV3iQ7dsrr+ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qSuvAYIrQULa7y+tcMBPJX67J/Qa2DyYtTG9pdoV5oV8F6alZsYwhks9Fhvoc2MRCu2PKASnX0Q4/MGtnQmmws9euIYqoK0+M2+zrCfsRdTnzfJUhLVlGlMIj7kikaI8ocMLdqemV881UnYsOE7hDJzuG2C5OVELNr44SjY1jRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTyHkjak; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTyHkjak"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60c4f796446so1275044a12.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 02:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750931961; x=1751536761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t10wxuAUiB4KyOt9zeZgZ/9RxJrj16+YdQHln4bOH7s=;
        b=RTyHkjakQY4F/YV2LF8FVKDjo14jsG8s0HzkzOHrHI0OFGEjBjleRiJsRZaLI3RWoz
         YucEdDdvCgvsw6ijN07Df5FBZkbEEUPlwA3JhhLIoUHurqVfzn1PXctTp5vDgso+IUa5
         GwNCnXzz9mKPWlOn/Im0+aVxrWXP1soLqB3/JZCzEeqRT90mMlHVf+B94UlyjMO7+DPA
         G8C1tbA0D6YJ/Ry9qhLYJ8NoAWRovqsiXwlsYjXgANquwYvjsB9AP8LohYAxhRf6//R8
         LxRCdcu63Eg1oAaBzBx9ZxwkV4Ww4bg3BQWusCjzjCopoaRMZf8vDnB9jAaDgCcBT8DQ
         kL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931961; x=1751536761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t10wxuAUiB4KyOt9zeZgZ/9RxJrj16+YdQHln4bOH7s=;
        b=L2C87VGJj33cVyaZSqnUd8mCX9wylKvVwcYEKh1KmQIaKG0R+9wZdTExvr6fvvqtG1
         KSLuj8UNKA4m5BP7KhDoJ8tOIWA6+l9HL7sQfKX1rtHAETS8goO73yFWRDvOhv6wB645
         seMnOhUe7WtpSjstQO+bI7XLsC4w82itK1B1ZFiyNRjkX//b05VMJo9Ro7E8aoLBHiTO
         ZpYBR8GdafMvarTjit/nUtJJW9u2zuippGhGuW2XA40Un7X2NFmqzh40vjDwSrbiVEyP
         mWpdC5yfiqfjgKiTrrmxVjijYu1lB0vu2aIrbnuOw9QjQtV4W3iiPhP7auoune1BGs8o
         ko6g==
X-Forwarded-Encrypted: i=1; AJvYcCWZMo8i4dZLErxBet+ssY4fBc1gbsfTJifc9J/QRk3cAU9jWY/XobPUkZZ+tHt01wlhETrIWACVDGEOYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxaYoUhl8cFHsuR/HkFeoCturhhPHjY6kJJmilPHtOzgBedYNgl
	EkeqVeuVItjC2Yct+SmQ23RVwUJet4Db0aEyI27sjBSTZTyTFbqjTGmp
X-Gm-Gg: ASbGncvk8a0yW71ozNJLIgpO1ZidG/uXmZ/GE1S87x16r/v0VXQ8guPSKxFaFSMpqOW
	bFC1e1fd6QvFXZVOk88LAYNbh00Cm1fG2lOrWIXQWsled7FQQW/RK3QEb1mNcfpzBLF6wnGER2H
	5E9ZXyftVi1rzBvxf0EQBw0jCFgpVEKbjCf9lHKys+SWSHyQM8w5dsVdpBoVrNCbNlmNk0eu8DL
	FLEBznf/UkB9W7PvRZAkQUjycLSDlQ4Jt1+VrvqTPfPqNX3d/JCA+XvkgnFDYdnbqKgPO5P16pL
	8uvpmStzcdktFeWM5aimubo5+cb6BNZTYBaQ3/hsgDlge31bp1rzepyomjgMTklfeDmv7ndH4pz
	w1QlUIfdih9y9OA==
X-Google-Smtp-Source: AGHT+IF88aeRCVtH1nDToQx7qH4JEcc3ZSBCfS0kNyW1PJ4UHQE1SJGsErLVbTOdPYpSRcUEg4t7Mg==
X-Received: by 2002:a17:907:fd01:b0:ae0:b33d:2a4a with SMTP id a640c23a62f3a-ae0bee50370mr591341566b.35.1750931961147;
        Thu, 26 Jun 2025 02:59:21 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae06aa5ff34sm1014106166b.40.2025.06.26.02.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:59:20 -0700 (PDT)
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
Subject: [PATCH v2 03/10] crypto: sun8i-ce - move bounce_iv and backup_iv to request context
Date: Thu, 26 Jun 2025 12:58:06 +0300
Message-ID: <20250626095813.83963-4-ovidiu.panait.oss@gmail.com>
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

