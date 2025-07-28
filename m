Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F72E22126A
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Jul 2025 06:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753682879; cv=none; b=gTzlymWWtoogVxTWtNiGw63yZBGTIGLHKrX/DtmJVp2SqUYNV2uu55VIv47ije97NWhgHTGB84Oy1u48gGNFVQxV1zXydNbskwDuT9M2h5c0q2CraazUbLcZ3inYUa2kk0cGEnYhy40lIP4DvfopDCzOWeHRXtEwioOFQoSqJ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753682879; c=relaxed/simple;
	bh=kyASvvV0C6502P156s4uvhgiJ2anCkqmkQU+DPnmJLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QTpHj/qZXCqbs7PVIBXQzTMY1a6JMNB3VvVP0JrHqVH6LOc6ktXYg1zDUa1yCLuY5Plkh2z7Xgxp4fFsjRokNmTifFpi+eNn1vHhSdIeQVuy+4WdRtiLFtltijiWy9NFa6pUof4PMDaXjjVR5OHnJa4EbJMLmys7OEmYs+R3AJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtL9AXFF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtL9AXFF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-454f428038eso35349605e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Jul 2025 23:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682877; x=1754287677; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ElWdGUyg9Q9uvasE/0knQrvGqeT+AHFO5zlC/AHADc=;
        b=gtL9AXFFj+ZVvoIBXQ9FHSQELfXYdby47PsFJ3Q/wzEAz5u5VzDInUduO6NoAPb9+2
         c8AgZZ7RfCOlenJSB7fUWKQgHhlmRnQVMXL5dywRFmQerHSMMaYwndEuUcqAP1IwUQaf
         9ydCB8vUwuS2QDBffLH1QgU/n8c/yzeRodbvzBVv7XtFt0ieKLgIC0J1nho+6AHMnJgf
         LpmAwDB9nlwsLDNgKHtEs5o74iRDkU7jvg6jkSh+QlV51t/XNoq7Lh1LeTb833NY9K7P
         gVI8uZiNhqyqbEXhTT9GKqgUQS/Czm/ivf7vrRA6BKNX6rY1TXht/kTwD2rQK0G4pv8Z
         az5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682877; x=1754287677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ElWdGUyg9Q9uvasE/0knQrvGqeT+AHFO5zlC/AHADc=;
        b=DM1BjNyQBh2W//BAo0lcL51Qh7X6+nsxnRjSzTKT4Q2cbi+bYlFLRNqiDXYz63+MXV
         QS/MkYVthN7P4smwOUG8p+XoCd+GAg07oo1T3F79P5FFR26d9A64dkpzs9rGlBq4D5DB
         8tl7flzY4o5gdZKeUDfWii+Jpm42KxZr5ypm3K/r87X2LDhLuanxzz6pqxwx910cO2p5
         pvpqN5C04YZGMVyXzcDLSUb48uHmjHsoLxn/bId5qIVAJmRNx/6BiPfZRXm7AnYiv/k3
         497bk4L2BeiN3MpeNqqCZQLp25cJNAaMYNJM/zxvVxqK2aOflFuVQKJvGvxHauXB4gj0
         hKYw==
X-Forwarded-Encrypted: i=1; AJvYcCXkdb27ZpHVlQQMyjcckFEMP8jG2M6rvXkYjUfuB1Hp7xMdHViK1JiYkvSxMNyWgZk+alpGLtikbS2QNA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbeLHqDeoATJC+0WEEFuh8pO/BNo8TenfFLj3xgA85ONvUPgSk
	lcHvj/nEY7aAuyE62Nu/7G+7g1YEwF4qvXOVfaUANzvHRjXISYRLLm7n
X-Gm-Gg: ASbGncvOWQT4qvkHvjGu8J4Isx+GBOaviBwQWVv4sfK7FMelQ6aSKu5oGll3z/9YL2b
	EhlFKebkSZwoU9f9yXKxDhJ1TGPk3KVwtgDMqibXqR+Z2J+Wh8RT29AxssvHnjKW7XRuOS+Bp6L
	WMWtgP3Vu6lpwZc9oeQN63Pr5KuxpT+7v7j7onNv0xGyqSOPFSrzJp8CFtGavQ67Tj/ZLmqspwz
	PeJ7lbSZYfNrTHSgD5eMWApLlBMU1i5LVnK/APPq03gsD1CloR3IQ2QvZbh5iEGfQkLyOwqlccb
	u8sOPkT/BGKJft0tmaYkeLt6UTv7C9gk+lOt3BFssuHZWaeJQuCOVvT1VqmqetRNfEFfiIm2CL+
	qrH5c3FhhOrxQWVIhcRh2dVC3ATACW1dIiA==
X-Google-Smtp-Source: AGHT+IFJw3EbsUDLtQA1ecwg56WxcbMEO+eyP+FEUWh83ffWtoZBkFf3rr8tJhzBHJdAJ6osjr0sWQ==
X-Received: by 2002:a05:600c:1e1d:b0:450:d4a6:799d with SMTP id 5b1f17b1804b1-45877445e1bmr70270965e9.7.1753682876514;
        Sun, 27 Jul 2025 23:07:56 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe6ba0sm86195215e9.9.2025.07.27.23.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:07:56 -0700 (PDT)
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
Subject: [PATCH 2/9] crypto: sun8i-ce - remove boilerplate in sun8i_ce_hash_digest()
Date: Mon, 28 Jul 2025 09:06:54 +0300
Message-ID: <20250728060701.1787607-3-ovidiu.panait.oss@gmail.com>
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

Retrieve the dev pointer from tfm context to eliminate some boilerplate
code in sun8i_ce_hash_digest().

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Reviewed-by: Corentin LABBE <clabbe.montjoie@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index b26f5427c1e0..61e8d968fdcc 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -238,19 +238,15 @@ static bool sun8i_ce_hash_need_fallback(struct ahash_request *areq)
 int sun8i_ce_hash_digest(struct ahash_request *areq)
 {
 	struct crypto_ahash *tfm = crypto_ahash_reqtfm(areq);
-	struct ahash_alg *alg = __crypto_ahash_alg(tfm->base.__crt_alg);
+	struct sun8i_ce_hash_tfm_ctx *ctx = crypto_ahash_ctx(tfm);
 	struct sun8i_ce_hash_reqctx *rctx = ahash_request_ctx(areq);
-	struct sun8i_ce_alg_template *algt;
-	struct sun8i_ce_dev *ce;
+	struct sun8i_ce_dev *ce = ctx->ce;
 	struct crypto_engine *engine;
 	int e;
 
 	if (sun8i_ce_hash_need_fallback(areq))
 		return sun8i_ce_hash_digest_fb(areq);
 
-	algt = container_of(alg, struct sun8i_ce_alg_template, alg.hash.base);
-	ce = algt->ce;
-
 	e = sun8i_ce_get_engine_number(ce);
 	rctx->flow = e;
 	engine = ce->chanlist[e].engine;
-- 
2.50.0

