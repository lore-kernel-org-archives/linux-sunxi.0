Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AAB23B603
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Jun 2025 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335855; cv=none; b=Rk7YmH4achnIeURm/UxnvjgYxqdQR+P7189LLvKi3PDk2V6PEC5060b8gsQp/hs1j6W6gMX7UiR6t+h7JG90e01xV89dFSxzFCutMyz+0gok/CF9Wc10dC24KDh+IUL38J621s//CP2kr4Z4+sYDYnKuf61rFRgUGzdmHSp4kTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335855; c=relaxed/simple;
	bh=V+HFJ3mcjgzB1Gr3bIDT3f6dj+Z5XsFbLbUNii2zGtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PAAiOTNUGMe6TWlnB6ZZhajbHs7ZKnmTnAK/OeysvI88rHVrfh6kVk6VCbXkOSKucjT4hKoBCZ4Tbpw6xR9/jdqc8iVBGe3k08tl/zIWSbM1Vr8BHvv/Bmd+Whbg1HDwQaVmyQFUxJq7X8yUwOC5lCPjny4lvy97DZMvOh4xMsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1CoKRnU; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1CoKRnU"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-adfb562266cso132534866b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Jun 2025 05:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335852; x=1750940652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbU44eJvfJDBcTZ+xWKQo+1cPwZ/TlkyCXqSjcDCqLQ=;
        b=X1CoKRnUd2Ga1gghtUq0qQ6/6WVPIFmOAEza78Qcu1O8IB+XjFVVXEX/mwY+qhLqvB
         TlZw9SUroAcqEAkjWQ6XlWV1ULUI/tDJuh0Fkr56dsyn2IgqesO2AfmAhS3xnWh9Jlyb
         nmLu//rUqkMuHOdiSF03o+dtTMDttFQMeRqyXbHEr4WKdxDKD4tnrSOiWfQ8+qJkN7QD
         KeNujkAKaNI0iTHaiqBKH8fvmE1WwP5bheUh5kALa9orqfyebHn4UUWugyApCYjlqK9M
         jN3GNstqKaVRWRyu/KQAUtbew4hBKeErCW5BhQQabrqhPM82mRand7tCyw9Qe9FVVvvq
         JcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335852; x=1750940652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XbU44eJvfJDBcTZ+xWKQo+1cPwZ/TlkyCXqSjcDCqLQ=;
        b=VfsVYWb0sVcBn9S56DnDgZTKGqw5axq5C29QxD1s3D8kimU4G9W4iqYvjIL6jUjFAG
         7SrhBBnqz2C+HPPUtrIHJI9HwUFOHK6MLw9OQpO9QGv2TF+EvNaLBKxl6Sk7/vJIvHpp
         i4tdjP60CyFA1huV7xI6tF5hAYhswx8B6UqTReDXaLjtIuME+kH1uz5a67o2dlZiOJAj
         4Wi3f15GlcJqWmCn/Tjo/EwJMS1BR9eGjrSwVOO0uDxoK6ahvXvx/IPeb+6YfhA5JLNL
         Ppkz5yKZzKKPhFsAfGssUG4cY0bjZ6JGKDoN2ILG8ex0LOpm98KAs1/N6XhvwrBdWK3s
         Qsqw==
X-Forwarded-Encrypted: i=1; AJvYcCW2N6Gl4dd8fg4h4tMKx75yfZyB2xEBEuhJArt6VL9rGLlJqwi6z91PrwkL07yg3n6NnXDlCdspOtOxww==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDK2TuzGHxLtCLLMAavaOW7JJty9VUbU8Aq8u0x0iytD77saY2
	zuAM7XHrGkclbhP7NKSVguHKlRJJ3gCLHtMdLlBPugnaJKV+3+5miCQq
X-Gm-Gg: ASbGncuPL7tER7QLqDVvAE3/cIcYGwrfs2i86vLfXr8S7/UeM4C1Fky5xFskJWlv/KS
	oayUOiPYOhNk2P0huExDov7Eijx7J9XOch2lXU7Eyt+D9rL17pc8oqMhD59fN5UQsuUsJ3WssJH
	qEb2j4Cb405Z+awYpRBGwaZEK9b1hdbVWeDOnk1Am7mZEipbJwmnG/nGSz+P3Fb/bk+qqiKPQBS
	lK4Vyu+0mDrI44BIWeHvUqmZ5jNNeU4cQEIoEicgoTZUh0az7bt0jBFUXpZgx2b6WoCzRhcXgcY
	Dh5cQt7Piv6Z2KZXmXoZRELXPqe1bIjqsbRsBlv3PF/R7bsTrFUQxTTX/BnKA9QbUVOd3phlXBD
	uUJU9ucrSWY/4NQ==
X-Google-Smtp-Source: AGHT+IHxZ6KyDVZH+/AWtxZdICZOs1YlDPZ1ZpE6Nu/jpvdE/3Ii2DDUvVsNbEbPVhvCkr3A2LmzwA==
X-Received: by 2002:a17:907:d86:b0:ad8:8d89:bbec with SMTP id a640c23a62f3a-adfad4123a2mr2149991966b.28.1750335851736;
        Thu, 19 Jun 2025 05:24:11 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae000b02bd3sm504688066b.3.2025.06.19.05.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:24:11 -0700 (PDT)
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
Subject: [PATCH 01/10] crypto: sun8i-ce - remove channel timeout field
Date: Thu, 19 Jun 2025 15:23:07 +0300
Message-ID: <20250619122316.2587236-2-ovidiu.panait.oss@gmail.com>
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

Using the number of bytes in the request as DMA timeout is really
inconsistent, as large requests could possibly set a timeout of
hundreds of seconds.

Remove the per-channel timeout field and use a single, static DMA
timeout of 3 seconds for all requests.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
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
2.49.0

