Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6146E24EAA3
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Jun 2025 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335861; cv=none; b=FHJZlMNxoN1EDnwobTORkLgo7VXZv551qJ+Rg0bd3W9OAonvb2TXXb6WSdkhzfzmaMN1nAoFJZOdViVIzItQ8zb1sGKXo5m9zPRBmwUtpfqmFlE5RJ4xtO61lqC+B6vYq87c0osE/Y1cZRNsyJImOsT2vH3hgCYJ7xJclDwQwR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335861; c=relaxed/simple;
	bh=MVmmWlPksmaiBVibi00qDI48RIUv844ifSFHgrjus/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSq21hVmYGRc90ikTLSxvGk7bqYRrTyPYI7zNKbl5EcjZFYq0FKIuw6QtVz2AEfXUrpYJUZJmo8B88onqmR9jEsb+7U+J7jjhe8deH2QQhoxyW0pfYbjX3M8HREFGQQlsHmPw3DOuaajEX5UCAj8Komi+vDq5IdL/JWSAg8MtYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfzFT1ie; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfzFT1ie"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-adeaa4f3d07so144217766b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Jun 2025 05:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335858; x=1750940658; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOCWgCxa5TuHqEzs7P/Xd0Uu+UeKSk+lfEEEEay9BLo=;
        b=mfzFT1iecTL9CosduTb2vNGJaZ9XcQ+trbK8Gl6Z6i7hWNQsYZk/Bw7HvPmMPNy+hX
         Icv87txb35rOH/VskBYEB8ntqU68j/gKvlOB8h637ZgwnwORz66AvC7Cr/F5u9KfzacT
         FuA3kibZWKPUVWCMJZWUMU5e6gmMSMUHikipJNBggyKSNyljzY2NzssS4YAtDvLvg4fj
         a46t/io4L9zy8hYKZfLTGccSx9aAK+dgEZx/SD+/2QCfhegvQ9Z/IHPT17bkCVNUx3EL
         hgPnSeJ7GkSo06sKPmcK+H7XKPqt6doRvM+YZkZIneNCRFnz+F+At6JAW8be1t4oJdvN
         pbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335858; x=1750940658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOCWgCxa5TuHqEzs7P/Xd0Uu+UeKSk+lfEEEEay9BLo=;
        b=iW6DuO86E5MfMb0Xpu2mogCXLdcEFbLDeCkL07FablB81Yu3pVW8IY4RVcDU2R2Zo4
         kmelBxb4mUL0SLBSsOQ4WRbn1NS5Cl+Rsx7kBG5Ytacn/VmIkvOxazf62LOJEVXf91TW
         5e32K50bojKZ24pioSrENgAoIyW0Ws5wChJCluNM0pZBt0iZgtrI+/BGih7lqOFffahw
         I+OZpQ3wlwCDl1wuf1uC+wsNGcpgyojZ+HsVSzlil4MIij9Ysj9dDmV65OfriMFfICiY
         PCAVk207xZweVYQ3Nw7ogTaQnvQX/YaFf6617GxVrggyrkKoLLdy+GoqCXcZzCwRLwXF
         VE/w==
X-Forwarded-Encrypted: i=1; AJvYcCVR0hR3EVrzHm673SQYEflmCT4TJQU6kOx717WghEIilbTVbz92Na1fRmEFLJZHOq0iAg50PTyya/ghNA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0AWlwPqZ3n4039sOGHA1a5wpFTPMg8FmNvppcCChUDTXD5VOo
	Oddvxs3zPdWYrNPs9jO3KqfSz8fDMclEuNwsRTjd3tEIw3ry2WzArPNWwC7I0Q==
X-Gm-Gg: ASbGncsSfFeNHzocjUskWaDQj2YYpZb7y5OtSjRcjBIzhlGpk0iPAZgDVFHF4JF1Q5u
	cMmNZk5Pt6Q91O9J5Ae/n+7JlVlZ7EaEPKRkU6VAKdGsYL9QJNfqOv7LXF5iDmwA7poZWGkSy84
	YQBTdxRhFFSyFdsH1EtVSwskxZEgHqsdDAq9fpS5xBzkaspBdfrHPP2tArbxNmDmpdEyjeFCkQe
	GUoIyyQa0XIrNY6d16gBoQj2Zi4iHG4Eb7CGvLdbmmTIzrJRrbnXiJwSF7uNaXwaXhybXoK0y+P
	WTCFRuOeChNUh6X3x50dpAEQARoChf69MC6LgRn16H3y/oqXo4ng1dji4lZyt/1RwzDEJlY2qYh
	plYVVuP3FkPHJLw==
X-Google-Smtp-Source: AGHT+IE+a44JiT4pmaQaCPgiF4SiL6W/ZMs6YLvucyMriX+08QeWg5qDOEHlRbDj5alSx6vbOGHqPA==
X-Received: by 2002:a17:906:9fcb:b0:ad8:9e5b:9217 with SMTP id a640c23a62f3a-adfad60cb3bmr2167795566b.45.1750335857453;
        Thu, 19 Jun 2025 05:24:17 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae000b02bd3sm504688066b.3.2025.06.19.05.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:24:17 -0700 (PDT)
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
Subject: [PATCH 06/10] crypto: sun8i-ce - fold sun8i_ce_cipher_run() into sun8i_ce_cipher_do_one()
Date: Thu, 19 Jun 2025 15:23:12 +0300
Message-ID: <20250619122316.2587236-7-ovidiu.panait.oss@gmail.com>
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

