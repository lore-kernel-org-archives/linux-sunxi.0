Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31B822F77E
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Jul 2025 06:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753682885; cv=none; b=D9ZUZZuBfDdxVcmhpfa6CTrP92I7TxapzsBgQypspAZyEjtr92XWRXxmzenXBSc6Ty2pXrIaRK0MtO2y7TKTjUKi6xvjk3iK6B3omRhlxYW5R3rESYUCisiKayrRwxYUqn3UJUJQyvAZ2aArfKgkybBHaRgJm774/w9Is+1SoUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753682885; c=relaxed/simple;
	bh=VLxVkCzDUptZN3MLV6XyYZWlwBVycUnPTFTRKmIikGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCdnzRH3IzXQ6RTNmOy4Gf5hTpv07WvLoafHOg0N2DNT/xdSVdOcmrr0Ri8dTk4AM+ijXnLo4pU2Bxomp58jE3sOkClXcTzIgB+AB/uvGQfnmB881VVfyqb/QRV/HJ6LfoK1OUT6ubzr0p876k27BAm+/yveAI+UHS0fQuKgezk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mG6yFfJH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mG6yFfJH"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4560add6cd2so29485325e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Jul 2025 23:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682882; x=1754287682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlcibDkuEhs59MfzxPNpL2Xe4LDD/D/d8iw52Y6RVVM=;
        b=mG6yFfJHV+Z69hXYKOj+YrjFDRsmvl08iCcqsgKcZDvgqFjE37vv6i8kuZ65uJSdSh
         qIgKuJ8Nvr2wR8HUhww2I2b3QsnRJm7gDKQNAErnT+37GA2ocdSCR+hUKDiTk9Acp4EI
         F21Dj9l96VOKqj4lAlPWEhnk/jPBtrOlboyWTwVenJKSGWlp0tmwFbu/sUvElU1qMIF0
         aYeT5GnYYOdwnXFgUFpbiZZhKKcv5d7YdjAJg+zt5/5qEcKjqGVLyIf+Vxa2QKuWyvV1
         D75mBl2dkQydtuBOA1WYPO+6W/wNcKnkoe/Ki5w+szArrmj4EFuYH+CX/HdvJk6P3WCA
         /qXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682882; x=1754287682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlcibDkuEhs59MfzxPNpL2Xe4LDD/D/d8iw52Y6RVVM=;
        b=wCfgT7abTPQ//jGlXMxnKGfZ5/J4ouIPl0wrgWED0V7L3r+vQUPnWoIzxI345eUB1B
         xVSCUQRGBJl+9l5Mneex4zhrobQHQBQSOiqlFZsjsnVKkdarm6e9JYsUNKDzmWYsQ1Eu
         BEon6bpcqvDs+pMHiO8AoBI4JBLCV1uxvt7ik7sAXGfd0OM6RPuS9ZSsygZEwsmi/ZE9
         dNSRnpl50kHy1yv/P+evDpVtCSY9HJyFaWtAHS0MIdhSmVCGo/fcpCTO6bEJTZiabX4F
         g7CcQsqpLVqqC9F18tHiPE+zyew2+lNfKo3mLIpbRwHrNsXJ6lHjztNnkNfE22ZG5gta
         zT1A==
X-Forwarded-Encrypted: i=1; AJvYcCV0TgEbeCw7JK52/zmUygvoTC8Cw5sLOlk4L1E93ho6OgQFQIpX9G7ppy9JeV3vt39dUOsTVPXzg/IVUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyjxdLrW7qoT0f1WTYN91dI5UsRAm3HSbssWm+oqcNFEy4SdSFV
	w3lTkqhPRlGDEZePDaKeIYYE3GEQHcCWdEzSXtgoDni2IGkbL/+3UAGa
X-Gm-Gg: ASbGncs5QuL5mSO9CDjzHZteGkfm867ylyEMrxPQ/aiaAJB2LCoM7rV932jQiQ3S50V
	ivGUCrFNWwQYHOMvbTGOX5vfQmV9WihicfUZf9+Lh0tNHpLAmA1s/okB3Hp6+cNzLsVHcs6GBVS
	kGPvq5N8jcjwDhokC6Assp1iZQd/5WMe0Vafob+hv0SAiOG2VtYNPQ3iyq1Nq5T92fNzwxt8S1T
	Zg0XiooAsv0UwApg1GL/J6Jjo3XM2BpGqPPcES23tu2mAvva21eSoKB2z2AZ01msQ2NxXmTwvUF
	aGQ/ckFQqWm3pIskLR+AI9yXELsTbgbttmye18aVgbZzjAJQjA5coNF34rXeCv58mN+9kqneKvW
	SOma5M0fG+KBRYiB+IIa1rYrk62YRqJyqGg==
X-Google-Smtp-Source: AGHT+IGpFevRNhf2Vrq4L9a0rQ+pWGEn25CUoR7Gcz+cBTBQUtLy+n5N/VX74UxKawJZYUhaHpYi5w==
X-Received: by 2002:a05:600c:1ca9:b0:450:c9e3:91fe with SMTP id 5b1f17b1804b1-458754bbe03mr80560255e9.0.1753682881878;
        Sun, 27 Jul 2025 23:08:01 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe6ba0sm86195215e9.9.2025.07.27.23.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:08:01 -0700 (PDT)
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
Subject: [PATCH 6/9] crypto: sun8i-ce - fold sun8i_ce_cipher_run() into sun8i_ce_cipher_do_one()
Date: Mon, 28 Jul 2025 09:06:58 +0300
Message-ID: <20250728060701.1787607-7-ovidiu.panait.oss@gmail.com>
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

Fold sun8i_ce_cipher_run() into it's only caller, sun8i_ce_cipher_do_one(),
to eliminate a bit of boilerplate.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 35 +++++++++----------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 69ba8236cf2d..f63d21cd1e52 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -360,31 +360,28 @@ static void sun8i_ce_cipher_unprepare(struct crypto_engine *engine,
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
+	struct skcipher_request *req = skcipher_request_cast(areq);
+	struct sun8i_cipher_req_ctx *rctx = skcipher_request_ctx(req);
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
+
+	sun8i_ce_cipher_unprepare(engine, areq);
+
+	local_bh_disable();
+	crypto_finalize_skcipher_request(engine, req, err);
+	local_bh_enable();
+
 	return 0;
 }
 
-- 
2.50.0

