Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5D11DE896
	for <linux-sunxi@lists.linux.dev>; Sun,  3 Aug 2025 19:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754248266; cv=none; b=kS15vCcfiSUVC2xDHoZnMt0CtFkNq6JwSlM0VUnNQM1/eWLqUC/Lw0xAElZNze3uGWwSzQ0UIjC3W83z4utVGiMTmMnLCzlSy8TNC/Z7AphD+cCEY7yfZuj6vP/7P78cCTqSxDaPmNVUAuK4AAF0oN+idoO2ykKhkNYGwg0nBJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754248266; c=relaxed/simple;
	bh=JhryCQPIHZMBHN4Dh3iGOODDbabwR0S+i4gukSM6ud0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iWL0ECy5WUyF7A7Dy0R6R1y4XpSD3HGqehJ6tYCu+H7LXR+icbET2PFpEAS9wGPi0LNSVBw23Dy69Q4TOhCMCchR9O+LmRJXSq7g/a3eDsdehGp6vCJQlSsxzhtovotB3jMVzNSBgGNlxopnGi/YPQeDniB/vXbZVtmvnFbjBpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nNLB9oT8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNLB9oT8"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b7848df30cso2916627f8f.0
        for <linux-sunxi@lists.linux.dev>; Sun, 03 Aug 2025 12:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754248263; x=1754853063; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzXOYoDcw0s4gQ4w74V4qvU2nwkX5U7En2+CKV1FmvU=;
        b=nNLB9oT8dDcCEir7KjOzYmuugqWDM1ipxshnGk1UWqwdwyJARzfKkfjbrVwF+OEPMm
         mtJX8ro33Rnn7RD9Vh/s/L/oOGnGEUhsW+IpGNFLZSje6/z6M3xqzB8HlevDTTVN3FrU
         VFIkH6VgZOB+nV+7bKJVgw1grlanwM8NnWdaFzrfGP2ncsBP+OkGvob3aaBIGVA1bmx5
         1/f5RlJ4sml/qJBuLhFk3tjArsoEGfn7uowzm6tequEIj8bBiNIFRKphT7XWobf+/r5m
         u0y2vjO/koJvD8T9JTfhoj7TKp/WpoQT3dvbNDcw1CYl1/n0xzx78h4gbBIzmbqKYnnm
         evYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754248263; x=1754853063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzXOYoDcw0s4gQ4w74V4qvU2nwkX5U7En2+CKV1FmvU=;
        b=SGi8WAXFLnwTeg6lSW6hq71QVfUBMu93FN4XXTtCPtWcpjNmFYTBYvTe/QcRNi4Spz
         P/LhGchYnbTE9KxeyrInXiLB7nw7uzewH9DyGeg4X1g/NLL86Y5yDX4kQbxG8P3qN5Y9
         wZPq3fwnNLhmo5MTXVsaI/cOGFqqBBcmTLTEs6UlcQ1jurFVFxCAqb0/wLvYlcel08YS
         UesgDQ9vnOT5sny7iID/W2G33jZYNDESn0fgZYa5wJY7qmWkyu2VT6Fp6iZPKpdon9qu
         39/rFUPD51ONeUHUnWO4bGnWIhTydxlDLKqW9OXOrypaYWNhmYGRsVtZ9OHL76yhAIcP
         IewA==
X-Forwarded-Encrypted: i=1; AJvYcCVU+QxOuxBpk+S5JNKOZG5q/5YHru746aaAolfCNzLBPkOeby+XZ8F9QMG8IMGbaZR/Y03Dyd58JiLtvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZ1oJAwCw7FyNu2DhSeGi5agRdmHe3zRM/bODflEu6Cvbqa8BU
	PIjr+T0iTsJFu1yi1DMPL4nsg//IkW/W5U8xJKUBCBu+2PcoieC7M+jS
X-Gm-Gg: ASbGnctYaEdIoW+rqQa1LFmLUfzVPamv3ufz1bw+Qd1smCpb5/3SBGjgSJDEf8FUVUB
	WFKOQ2tnipW44j5rDkX/Nv9BmtUfIcDFvQgnHma56dbh2P63OmkIfFd67v+fuEo0Qvel4ht9pOb
	jhZbUser8t2mFexDMlyutqDNB9SU+RODPaOQRHjBRgLXMA7MbDqUyt8YjGX3Pyz7JsD9F5n/8hY
	HExDqvl/ypsL4kN7QnTYTxn3GCLkzCEgQo0SouRhVShCYUGhX1fBLEZuABUaYiZSfo6qYa9tkIF
	BGzB+F5SSzCW8l3nb8GaWdDm0e+teuaz7zioaEAUtgLc2Faj0U5c76eqMEC+yfW4BFSdEJQM+iC
	ogiHP1v4edb6sEPl+21xN7YshOyaKwUDMNCYlwqdA4VgG
X-Google-Smtp-Source: AGHT+IG9wEYs4+lgjHCzhOPCxH3cmlxe163baafRUi6P07GZhQb6rgYttNhQt1qtCDkr7AuXCuEO3g==
X-Received: by 2002:a05:6000:420d:b0:3a4:f7dd:6fad with SMTP id ffacd0b85a97d-3b8d959d43cmr5579015f8f.14.1754248262831;
        Sun, 03 Aug 2025 12:11:02 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm13099210f8f.39.2025.08.03.12.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:11:02 -0700 (PDT)
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
Subject: [PATCH v2 1/9] crypto: sun8i-ce - remove channel timeout field
Date: Sun,  3 Aug 2025 22:10:21 +0300
Message-ID: <20250803191029.3592987-2-ovidiu.panait.oss@gmail.com>
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

