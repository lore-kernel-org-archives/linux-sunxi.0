Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391D521CFFD
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Jul 2025 06:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753682879; cv=none; b=R92ElWQpo1V1Gnnb5dsIHPQt8yuyfGdxWN+SK9EoBhX/7UD6uRAFfal6fHYR6LBDKLyK/dPAWag0+xg4maDkc+wyUImhGVLKv8LPbCpnXMbmzYfoiOD5hy6yKf3tIhTgd6gfzudbX3rBXaAxMfA7eK2ZS+mfNAuRAqEzn/863bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753682879; c=relaxed/simple;
	bh=JhryCQPIHZMBHN4Dh3iGOODDbabwR0S+i4gukSM6ud0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rPUGZ8vbP1iuZRnBlMFr6BrNjSMS+k0seUeRiYD6D8GZBt0u7LtdyrojIG244po5M2K/vex+rmFnHR7i/MGXDoFaLrr57xfOa3wtoHfBHtSf4rkotmCxWCSJxMj/uqa9ltI1FMghAPgq/v0A3etHfj4pliyIrYj3b9ShAAJj5hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMTzDbJN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMTzDbJN"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451d3f72391so37784865e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Jul 2025 23:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682875; x=1754287675; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzXOYoDcw0s4gQ4w74V4qvU2nwkX5U7En2+CKV1FmvU=;
        b=OMTzDbJNucLTz7lvUNOvmEPMAwoa6l1ofu0TT9KlEBUOG6e3BBZsgv/EMGNhZy2/+C
         x8m3MHdNxCJeEFoALUmr2FkFRzCu8uL7hruwHGRZR72RH+HC/xjhRHtvPIK2ktclLK/2
         V6zeZKPJAfMd1VfGDdevG+mEGDim82E7N6M8M/gANY1MoPZpQSY0nn1uEdHbAJOdni7w
         05g0uoxiOna8NFLWXL2jpFPQJfGAloH3IdmI3uUE/DkMZ3gSyZyf8EwN35BLqS+SCg7u
         x4EEcKKUeAeqpcdxRuNOiQMOCl3yfZlB3NMfpJOLYWxOsx5ANyorPofsuc3tZPNQZ/JB
         MSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682875; x=1754287675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzXOYoDcw0s4gQ4w74V4qvU2nwkX5U7En2+CKV1FmvU=;
        b=j0Yq6dnjn9x0saiisarixVtkGiL+xu2X1DgEce/RoICv0HQpFF6/E1oKeYlvgjimhE
         GsR4R+anPN8GzkAtzhzAM3+FbD6ctP6iEbZeb7yju2IfSJxLS1wxG5lTsuaZAtFLI9CI
         5rw2E2ekGeMGkOTc1Y54Xl3G7RhR3F3uSfY95f1Tqudhu9IMyCj1eLsktkpZn1cTSQw9
         bR0f4mD91lozGU9w8NZpMjAUhb8Gk0wKeRsnU9Bx39vCi6cVjqHRrSWFXj6qpbzE3NaY
         YbpFlAM06V59F0srRBEPYSpIUZm6Us+J+vK2a5qTRTqRCo10YlgVciQrFbrEEJgGfy20
         N1CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeo0+AfnnuDoafwlkpM/JvARp8eimQgQ9b5US490J7DYsTEiN2jrIsB47BucZGbzk/eijcBD9x8VNEpQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLORtBktPYIgoZgIrczzK60fOeWZ46PHSq0V/3lfow/YBbCfMI
	OQdPrJ9CFj+MSagOeIU1xjEMuxoEf40em2mXnSwKOCo5YeuwTNbqHjoT
X-Gm-Gg: ASbGncshrEcBX5eYGzxJ7wUdCa0x//+5qNo0DSIXXpw7I/EH1tg5UZ/pN7xrGh4/m0K
	AEffG9mGRvOvoDBOl7cb9XuogTv5ZMSrwPHECOBBfInj5WbzajXIw29/VtzmmY3Kk1vXlXbSW1L
	rzHzyYPuoVYfemPSygOQyqJOCICDUbj6RN5lP2rRBxC6SeVyDgErCwFQ2MX572aAsaRcJwLdE/5
	i7w5yR2sG4iqcF7MGake40wnr2Vfljw/D59ilK8eDV7uZD1RWDjchCf6hEj9iSBkSS2tw8nB9UP
	GXpBIjv1VVzYDCpHnoGIlcs1GpL7wlY8IGwsSauFJgMEVjzjuxfCFGBw828CbiKtjiTEComg0Ol
	bKt5XamTL12MhOS/FSySERbDY1A9UATRD4g==
X-Google-Smtp-Source: AGHT+IHqPCaG3R/59IYXjBcGJJCe3DhN/AsfRtBjv+Iqv+7bPs2nkDA/DLavuu+09pT2v/lTOUM3GA==
X-Received: by 2002:a05:600c:8b11:b0:456:1d34:97a with SMTP id 5b1f17b1804b1-4587631561fmr92141855e9.9.1753682875203;
        Sun, 27 Jul 2025 23:07:55 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe6ba0sm86195215e9.9.2025.07.27.23.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:07:54 -0700 (PDT)
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
Subject: [PATCH 1/9] crypto: sun8i-ce - remove channel timeout field
Date: Mon, 28 Jul 2025 09:06:53 +0300
Message-ID: <20250728060701.1787607-2-ovidiu.panait.oss@gmail.com>
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

Using the number of bytes in the request as DMA timeout is really
inconsistent, as large requests could possibly set a timeout of
hundreds of seconds.

Remove the per-channel timeout field and use a single, static DMA
timeout of 3 seconds for all requests.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Reviewed-by: Corentin LABBE <clabbe.montjoie@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 1 -
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c   | 5 ++---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c   | 2 --
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c   | 1 -
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c   | 1 -
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h        | 2 +-
 6 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 5663df49dd81..113a1100f2ae 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -276,7 +276,6 @@ static int sun8i_ce_cipher_prepare(struct crypto_engine *engine, void *async_req
 		goto theend_sgs;
 	}
 
-	chan->timeout = areq->cryptlen;
 	rctx->nr_sgs = ns;
 	rctx->nr_sgd = nd;
 	return 0;
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index 658f520cee0c..79ec172e5c99 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -210,11 +210,10 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 	mutex_unlock(&ce->mlock);
 
 	wait_for_completion_interruptible_timeout(&ce->chanlist[flow].complete,
-			msecs_to_jiffies(ce->chanlist[flow].timeout));
+			msecs_to_jiffies(CE_DMA_TIMEOUT_MS));
 
 	if (ce->chanlist[flow].status == 0) {
-		dev_err(ce->dev, "DMA timeout for %s (tm=%d) on flow %d\n", name,
-			ce->chanlist[flow].timeout, flow);
+		dev_err(ce->dev, "DMA timeout for %s on flow %d\n", name, flow);
 		err = -EFAULT;
 	}
 	/* No need to lock for this read, the channel is locked so
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 13bdfb8a2c62..b26f5427c1e0 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -446,8 +446,6 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 	else
 		cet->t_dlen = cpu_to_le32(areq->nbytes / 4 + j);
 
-	chan->timeout = areq->nbytes;
-
 	err = sun8i_ce_run_task(ce, flow, crypto_ahash_alg_name(tfm));
 
 	dma_unmap_single(ce->dev, addr_pad, j * 4, DMA_TO_DEVICE);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c
index 762459867b6c..d0a1ac66738b 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c
@@ -137,7 +137,6 @@ int sun8i_ce_prng_generate(struct crypto_rng *tfm, const u8 *src,
 
 	cet->t_dst[0].addr = desc_addr_val_le32(ce, dma_dst);
 	cet->t_dst[0].len = cpu_to_le32(todo / 4);
-	ce->chanlist[flow].timeout = 2000;
 
 	err = sun8i_ce_run_task(ce, 3, "PRNG");
 	mutex_unlock(&ce->rnglock);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c
index e1e8bc15202e..244529bf0616 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c
@@ -79,7 +79,6 @@ static int sun8i_ce_trng_read(struct hwrng *rng, void *data, size_t max, bool wa
 
 	cet->t_dst[0].addr = desc_addr_val_le32(ce, dma_dst);
 	cet->t_dst[0].len = cpu_to_le32(todo / 4);
-	ce->chanlist[flow].timeout = todo;
 
 	err = sun8i_ce_run_task(ce, 3, "TRNG");
 	mutex_unlock(&ce->rnglock);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index 0f9a89067016..f12c32d1843f 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -106,6 +106,7 @@
 #define MAX_SG 8
 
 #define CE_MAX_CLOCKS 4
+#define CE_DMA_TIMEOUT_MS	3000
 
 #define MAXFLOW 4
 
@@ -196,7 +197,6 @@ struct sun8i_ce_flow {
 	struct completion complete;
 	int status;
 	dma_addr_t t_phy;
-	int timeout;
 	struct ce_task *tl;
 	void *backup_iv;
 	void *bounce_iv;
-- 
2.50.0

