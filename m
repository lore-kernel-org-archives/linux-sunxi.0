Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E78F22A1D5
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Jul 2025 06:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753682884; cv=none; b=J6Qm2eqDQOcybsHXPv9bQf0Hp/tTdmJHIF9VDwlNdJQp12fJDiQ5DcTYoMvPAri+XuQOewu3k9sefaHOgFJERp2fY1u9ArGyJrddbekuccSxamJTx9gwF0zDdJUIGJfeFb8yTLxJAmD/0LTKCCrgJgGIbeGcUjRj0X9gJ94+hik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753682884; c=relaxed/simple;
	bh=xmk9NUUKau69JXd8j/FyZNIhFMPQAiXB84NiNB/WsI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZaN46XSnI1/rPa5g1hXIGaUcHL11qv1zRqoAWNe7a7eZeyEj4P57mcZmsUN+g3i++maplrWhHbmFB2SmGrnhxV/FLgyYwj43eK2akt3gGP3vyh9CWAMXu4rDgLaUkxW4YlM/i7N18GQ81CTNzSJ76m2o8wbHXCBwJwhBGFpktYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QN4yAMXk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QN4yAMXk"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4560d176f97so43194725e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Jul 2025 23:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682881; x=1754287681; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdqdaaScOBYi48Kijra/+QGBgmA2GIY7lfOSgwcV1kY=;
        b=QN4yAMXkYjIgbXxvsbQUKp7+kWxacOmyvyYpCwn5/YOd0WAdsCOcdmUGRwDz7VYJ04
         038kfjndpNcDF6P1Zf3R3L5LxrSZvv1S7r10A+VZwc6Hs1LexxUj2W3FlgG3ewyrZfE4
         F1iMYQayDtCdpLtDd1YfOFc1iSmYa0Y6dz8zKkMa5mLnAB40+3mHmvoyVhmMVHsDyAjF
         EbiGOXSPe4571qi7SA8OiQoK/uC4tM5eKdkQ7QrE3X//DLgZiQ+jW72w0T1KS4NUxn6d
         1yEnqGTvT9+FMsqeOI17EXjN8yfThNOhOQ7XMALfae8PQ5oGENDayCKcDti/tR+EwynW
         G9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682881; x=1754287681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdqdaaScOBYi48Kijra/+QGBgmA2GIY7lfOSgwcV1kY=;
        b=MWJfql4A7RbQidxit2QIZ2nESjWfGyO8Fh7K3OxVS8Z01Q9hQR7KEWY4mjnNcqvwmc
         Ues+ijfW7XFEBRKHqSveG6lX4RG1E3OpPG6FTCYSvzM07FLSIl/IanA5PyAHZqpTYTVP
         0syLeCKYhNebQXYCZPTU5t/aEiHdVY1wkspBK9gKgjp5wskZy5RPNO291hHK5s/AMCfN
         K2PQudSKnvHTKWBU0YxIENT2Y8Jkp/VQ2Sr2bfeKLl8RrcR0rWZUxIkxy1Jmqap7a7KZ
         NNjJ9RfJ8v+ipLDpuyAOsGhPXAVPESEw9+xdRQALllrjnhMKfOD6Jt+V1LJKkruOWGUS
         GTPw==
X-Forwarded-Encrypted: i=1; AJvYcCWyzkgV6xV1vfBxUKLUlRgpFefK5S8Nzl3HQbjkw+NFnfs07tmmT/F6aFdoNKTEp11ryqTXEtx3ahotIg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx86eS0AkB24OnlsNic1P15rlMYwigzEmbE4mVbrJKZHLvP7SHS
	Yu/lvwHEf+YfiOsYXIVleQXeWRIWEgP3lEqPYByAfNbnKyUooOQMUnCikPfskg==
X-Gm-Gg: ASbGncvRqqLlOKvuQeqz8cGG/BWeEo88k20q4LbSEgUtdRlKlnKlkTyh0oUOH5vT3D+
	PN0+/1h1mp5DxxtYklA6hUWeJ7fQiYMquFZfCvwvt7xacadxz5kv28W4BMsG5rYkzztMNn32BEu
	Vf5QCOrgmttrole+ajGK88KHmcPY2OhTvbD7OMPSWiH1DQjNQcRBoGdJOAh5+UqhFx7Uw5ECiZ/
	taGVCq5vjAcn3q71nx9j5KmnLHWXaIO21Tkk7VaqGSvrgzo1yFRV9ihR6ozik18OUFGGTK0/j1r
	h170C09YnRWo+6vdOuujLoPLcJtOq9QfHQmsnkvCHPyrZeV0FORCZ5cKFBhzaiRKLHDZckfknyL
	2VEU6Lp/9DknCs2kQFb6vWVrN/+rzZYJjzw==
X-Google-Smtp-Source: AGHT+IHZ+61CYtmRgVeRSYGGn06dcWJ7qkkpNHOxwMUzzATXNR8lg1Va00usgycivkfePU3GB9B7Ig==
X-Received: by 2002:a05:600c:5027:b0:456:1a87:a6ba with SMTP id 5b1f17b1804b1-4587666af1amr70261495e9.33.1753682880486;
        Sun, 27 Jul 2025 23:08:00 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe6ba0sm86195215e9.9.2025.07.27.23.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:08:00 -0700 (PDT)
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
Subject: [PATCH 5/9] crypto: sun8i-ce - move bounce_iv and backup_iv to request context
Date: Mon, 28 Jul 2025 09:06:57 +0300
Message-ID: <20250728060701.1787607-6-ovidiu.panait.oss@gmail.com>
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
index d94304a439d3..ac29e3f4e099 100644
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

