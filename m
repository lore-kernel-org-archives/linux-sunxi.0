Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE782D663A
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 09:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750931968; cv=none; b=DRbSQCc3/xSxTz6DLEBL6/g6KqAWrP3Es7kQC7kVg3GvTqSzBCY+hz30c/+Wrf+fRiDa0TR+Qxn3qCHhUSxZ2uIP4uV7dOk8oN5EZh9jE/SkqCTkkTgGQKdHnTlDBlDY59LPLnuC2hrIr8yNDNVjGeHKX4KGZ/BLUVxo5QRFWXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750931968; c=relaxed/simple;
	bh=MVmmWlPksmaiBVibi00qDI48RIUv844ifSFHgrjus/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jFDi6iWOeej488pcUgjPM/r8PdHLdX671pQF8QYtYJwYMm0LJW4yAB0PX4VIp0fzfHu1SbUl2S1BgTpJvjMUebLyz81w9cBx5Quu5SCIuAkpNmf6oqHzCDAz0520H24G5yl+SoXHL3VoOL/SQhH5mtUsW8simW1FYhpk6U1A7jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkGQJndt; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkGQJndt"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso1285327a12.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 02:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750931965; x=1751536765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOCWgCxa5TuHqEzs7P/Xd0Uu+UeKSk+lfEEEEay9BLo=;
        b=BkGQJndtxURBipUMovRKpAO+rTHR12X1KkWohjRtKZyiKFdMIZs8Hs5PPhVgcQL0th
         ouIRDAGABJNSH0emjVuFXYN6ydPRtErBmYPZOxboBnzDdiLlBw7ERiVTp36crvRLb0/P
         SfW5LVCNzXOaNfkbtrUBJILYrOeNk20n61LmUjVztIkt7sOliv43/p1kuRoojvk6Ss+w
         VXbxhcPxFKtZ6yTJdado5qURpYJq0SYHx5xqS4YipNlK6RindZdLBY9XyvL79rtTK5Rh
         yxXFT/VOxbgUnDWXMMyKrWcbHzUx9jTGQFAgCrTirF3usF7h7+E5DShqqkxCrahoh7Ho
         vOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931965; x=1751536765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOCWgCxa5TuHqEzs7P/Xd0Uu+UeKSk+lfEEEEay9BLo=;
        b=LL/+JihQSB+4pNmI6cwBs9u+mxv+Offiu1D/zuX+sXslR1/W2SsYcryB1lVgajbxQ3
         Tu6/Z24Uh85QcMfLBuMLhEnWJCXqRjAvgQQVo+XGxJla4qVX1DMHTNdYbmlfzkjOTLVH
         HciH02eJy6vUbXj+wnaLKkeoUUgLMKviHVajXgEh1bSCQm4WutNhN8Qs6mpPJ96YwJdp
         mSZYNVZaXIIfQ4wDuOXaiKWdvr6zuI2G6OV/dAY3m0sn474HfzBWHhXGxq0pnsNoPPm/
         yOmTGOZeFomCblipOFcOt0JbW/VCzaiiHrGvFfnkVQSZ5LiDnci8Qm1RiteQf7VYTFLO
         qHOA==
X-Forwarded-Encrypted: i=1; AJvYcCUmRlO2PZGTGwXHJqRMgpPm5KCmwq3ishmlZcMs56IoSVRzu0Ec/bfOyEZqLP+Tt1k1EKRrXFQ3ZPhx1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxuublnSgC8ckBcNX2GQ1iZJlXB9qUULpBIUrLGWERjKszwBJEN
	UUvjYauURM1ruZEBK9G1phEldq9AB0pwZPtt2VnD/dYB/tOmt69/zJWloOFutg==
X-Gm-Gg: ASbGncumOc1b76dudj3mJyFzWedMXJgW9fudDepUBDk21G8nh15fRVI/S/Z3+BdTAqA
	J7csee0b5uT8b3naQ/BmkFV1pqhxRDCU2nduUp+PcHeISOQjikKLier0khhOfGx5V411nhGg1uw
	Q5s93SIckUvlTkz7mRxDaVaaa4VOpZRqjbV6ymyy/+/CSRlC5oFrmiRYJ6AdGZehYSYIG1+0yjC
	7+vHgaU+PKxR2Zi3JQ8XIRRw4ajHp3/EBeenQxNfbOJtYPqU1Kj3k7inWVCk4ZEn93fwMottUIO
	iJDoXcinoTeHgBDyy5cszRTJopwoHjbtru9lFuaTlPpQpMmzHzYQzIQEZHQyQtLFCSOdfV0HH2p
	7dgDCLQopzaUPTw==
X-Google-Smtp-Source: AGHT+IFXLtDWsVLMRJFKSM7ZfKEbTxaY7obk208Kuz4qR9WlO3f5+snTWFaRNwrAjl6SXIyIm+JgZw==
X-Received: by 2002:a17:906:33d5:b0:ade:cdec:7085 with SMTP id a640c23a62f3a-ae0be893190mr488892666b.26.1750931964994;
        Thu, 26 Jun 2025 02:59:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae06aa5ff34sm1014106166b.40.2025.06.26.02.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:59:24 -0700 (PDT)
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
Subject: [PATCH v2 06/10] crypto: sun8i-ce - fold sun8i_ce_cipher_run() into sun8i_ce_cipher_do_one()
Date: Thu, 26 Jun 2025 12:58:09 +0300
Message-ID: <20250626095813.83963-7-ovidiu.panait.oss@gmail.com>
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

Fold sun8i_ce_cipher_run() into it's only caller, sun8i_ce_cipher_do_one(),
to eliminate a bit of boilerplate.

This will also make it a bit more clear that the skcipher do_one_request()
callback follows the usual prepare -> run -> unprepare pattern.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 34 ++++++++-----------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 9963e5962551..5fdb6a986b1f 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -360,31 +360,27 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
 	dma_unmap_single(ce->dev, rctx->addr_key, op->keylen, DMA_TO_DEVICE);
 }
 
-static void sun8i_ce_cipher_run(struct crypto_engine *engine, void *areq)
-{
-	struct skcipher_request *breq = container_of(areq, struct skcipher_request, base);
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(breq);
-	struct sun8i_cipher_tfm_ctx *op = crypto_skcipher_ctx(tfm);
-	struct sun8i_ce_dev *ce = op->ce;
-	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(breq);
-	int flow, err;
-
-	flow = rctx->flow;
-	err = sun8i_ce_run_task(ce, flow, crypto_tfm_alg_name(breq->base.tfm));
-	sun8i_ce_cipher_unprepare(engine, areq);
-	local_bh_disable();
-	crypto_finalize_skcipher_request(engine, breq, err);
-	local_bh_enable();
-}
-
 int sun8i_ce_cipher_do_one(struct crypto_engine *engine, void *areq)
 {
-	int err = sun8i_ce_cipher_prepare(engine, areq);
+	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(areq);
+	struct skcipher_request *req = skcipher_request_cast(areq);
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	struct sun8i_cipher_tfm_ctx *ctx = crypto_skcipher_ctx(tfm);
+	struct sun8i_ce_dev *ce = ctx->ce;
+	int err;
 
+	err = sun8i_ce_cipher_prepare(engine, areq);
 	if (err)
 		return err;
 
-	sun8i_ce_cipher_run(engine, areq);
+	err = sun8i_ce_run_task(ce, rctx->flow,
+				crypto_tfm_alg_name(req->base.tfm));
+	sun8i_ce_cipher_unprepare(engine, areq);
+
+	local_bh_disable();
+	crypto_finalize_skcipher_request(engine, req, err);
+	local_bh_enable();
+
 	return 0;
 }
 
-- 
2.49.0

