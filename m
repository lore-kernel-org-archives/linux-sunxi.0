Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5159A2FE599
	for <linux-sunxi@lists.linux.dev>; Tue,  2 Sep 2025 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819380; cv=none; b=psZAI4mrCQIF3Edd7QHR78uN/Wl4sHbr6H+ziXCCVQi/F+4l5h2izr6HVnpD4RFBDXv4UJWghWO6/h4vR6YLl8e6D5njb6fcrQHIZTpO1aDc1rYHRF2QEkwUV3ndeq6fitZhqOzCXL14t4YsojTlKUeaC66kdkfzr8ibQT3zwHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819380; c=relaxed/simple;
	bh=JhryCQPIHZMBHN4Dh3iGOODDbabwR0S+i4gukSM6ud0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ne9DJ1Ag70ySHgfFxDxjuNd/XEREzuZ9yZiuwrGlGzsXHCujpDQh2FOqfMhv63X8P1RA3lJUmkDBjPoHbaasizFWbGenMmQHCsVP+y9xAf1SWqHv9hN6px/tSk+EMYKan1qd8bawwJale3J6qsjGMjNbhHHSIkU9M007cdjIF4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUkX5uIh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUkX5uIh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b84367affso28831675e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 02 Sep 2025 06:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819377; x=1757424177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzXOYoDcw0s4gQ4w74V4qvU2nwkX5U7En2+CKV1FmvU=;
        b=lUkX5uIhD9OcPKGU4lHp+MgNaLR9wUMMQWXCCPTXyV3uHO9QORNOe0+L3KmWkS9hjs
         KvaztgiNxvM9nDPbuNAeYJrce7bzHkrQY7zCanyVmIOIa273dLV+d96UnBDfgsPesVg/
         VfXNCDQP2nGEo4ZfJoBDIoXcvdnsCHwTFnDR8adiow/+Om5ZAX0D96IEE2XXp7wVOA8y
         jZvsBTxZtWhhcv/C4iDd/QMAbrHTJbwa7ztWyBpxyYkGNmIRzoj1kMvKmiSqvl9FeXXv
         9qyuRRIFcwKcHNuvNDqoIUk3Mjtryf/GUY3bybXq9Yfx5bIB/GX8T0uu/BmsOklsKaOe
         CRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819377; x=1757424177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzXOYoDcw0s4gQ4w74V4qvU2nwkX5U7En2+CKV1FmvU=;
        b=OmpRPuZypOhNWx3eb4ODLqNfp4c9iE581oxWGF13nhioeOkvWtYLekd/Y/QMgrE+JG
         E9k9SDqXKAWv7VGaiw2LYGrfb03pnkXq++KwMYFlokIJ1Af/KQadz+zWE6xHozC70vnF
         3zvuO51uY6TmNnNmY7yiwaDwdcQNzLfDvQ8zQrd7PbEauGjox4lD/GIcP+BdQaADWMd1
         c1sWBC5pFRfepEL6inLlbOcdJMrzakWt/2cAgAe1E4hX3bnNgW+V+rJAonDuY7lukm7/
         q8jByLtKyURfKioq/w4Ahr5JBjWXX1v8na8wc9GNUrKwA0xwCjj8SQplPw16sea7cLGz
         3r4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVL6yFMmHw3u7LOd8OUc0MbR4hMwbLQQt2KGArM/uKUF8pf+qdCfRzHDVXInstw/OS41pA1g2K0c1H5HA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWHcN3b1m7OfCsUBxWcRAKW78GzudLzY2NvD/BEvWJDX7ox0LN
	Mnq5EAyttrKytK6v+gjpUYulgZM+OZphlxxqtpvB9F/MsiNisJmAt8xE
X-Gm-Gg: ASbGncuI2hfUnlll0D+513Kh0Q1hV8QjFTvSEHIzRzDsbfOi6iIAxbHqKVfZLZmAzuK
	a+bNTsmNuXNMEMKPggdyuVK0fqP+WS4ZneSx7HsH48SSi9WEwdrI5jXG4R9bG3j1TYtAra2I6+e
	JvTLN9duGVzYtkHzxT0YYuQMMjHgSXNQKczqSVHjDBXBwOPJkVnwstFfb37R9iBus8sIDnNvX3Q
	3+0MqE5uGnvKW+nE+0hMjj4vsrFMYFA4bU2jFEgn62+E2UTsGP1qG2is4oLqr8Dn/27jNKYJMos
	NdxNcEt5tah/ZhtmQAX+tStwmld2g72NJ05raEqwiB4573M1E9Gk+bNHajw8Z40NqxKyMuan0GG
	31pbNbgfU50TWxbj2U5ImN5XdkZMbaoCDtA==
X-Google-Smtp-Source: AGHT+IFt+jAuwZmgoKT1RiQF+kj0FR8UU7YL3V14hPMpMmBPvbwYtZIzf4vHPonAarMjK9TcaNg3/A==
X-Received: by 2002:a05:600c:3b28:b0:459:d46a:ee3d with SMTP id 5b1f17b1804b1-45b872e711emr80758545e9.2.1756819376326;
        Tue, 02 Sep 2025 06:22:56 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:22:55 -0700 (PDT)
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
Subject: [PATCH v3 1/9] crypto: sun8i-ce - remove channel timeout field
Date: Tue,  2 Sep 2025 16:21:26 +0300
Message-ID: <20250902132134.3287515-2-ovidiu.panait.oss@gmail.com>
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

