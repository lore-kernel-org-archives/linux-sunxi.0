Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4AF24CEE5
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Apr 2025 12:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744029442; cv=none; b=aos4cgd7hw1WWdA2cuSNyLi7hru799C5oJ5thU6V+xEzwPlN+0KKarjqjm6eEdxK4x5fjO/HYWHLk7VMPIryEqEJwXT80bkXN2Bgq2WrBYwLh8id1mwebar51HgFkoVL6Cki6J2k/fuBVdGD0CYdbn5CdyEy9yiuLHMNNYFiKIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744029442; c=relaxed/simple;
	bh=fPaIJlcWeN7XcHAT4dA7liyZzdvlkwCm9/OnQCQ+nbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aqJtY+kPsiB4OhLshf/KxRTyaiL4RWMaFw2KwG+w0qXyUI6h4JPQNKcH8GOEXyPRAO+W8FLtTSqPqwm+5AKREWTsVSbuFWuLyo04BnIfwv0/4+xvIPfiDOSCDoGHsFaOAE8cG5TjJuIpp/LNVT9pN81/WqIsrQZKH4qBJ0hEjt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsKKADQ5; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsKKADQ5"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3913d129c1aso2933779f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Apr 2025 05:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744029439; x=1744634239; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0o6+zdI0AtRq1Xlwz5OA5c9uHll3v6Nadhh0JoXi15w=;
        b=MsKKADQ5+VCfQ5S0z9kqgLI01kfSqE4qlZh3vTIFezAjK8uT3Ka6cJ1f/FDzRiYc2d
         sF2+fp+GoEQZd9r4JsyC7fhDtV1JBlxGvk+TY5PhpXhQyCGYyCxJ91m6XGHi61zXuQTH
         A0aynx38qu/R4sQpiQU4Tihz09cDJwdpyr2NjOZOQXIdQLf8JPOgPd1KxmW+J1WioM3P
         3CVxa2WBS2G1glVUurzL+95JCiwgImzkZtcKGLe8f84BgZaRiw2cvhU3vxbieDOij7ZP
         GKmG/pliowKBUZkPLjOrxw4Rt/VwhjP9oB8o3M9WNCjEbv8Aei1UyL8LF03tUQb3pelQ
         uy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744029439; x=1744634239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0o6+zdI0AtRq1Xlwz5OA5c9uHll3v6Nadhh0JoXi15w=;
        b=cvpcOjMmBMcXbefEnzn+lcBUGQuWoqGD2ovITy59GeFQqC/Rkhy7A/YaT3W2fpQFHT
         Hyoomo83mmXIqfBrZ2tqY35c98mvAdLcdKFbc61ddzzy8kOzACqX9cICyIt8XHy6WkQq
         9MQ3QdHAJHgZYdwWwSVXdWMzsoxmVC9t98gDs6UlGNLYqEY8+pldomc5MeddW0oXMlFP
         5OXHOz/Fe5RbMoDrHRMZSXRIzbRepXtL7ZakfM6+tTljZWPaF3m1Sen6C2C1O9EtO2jG
         i0Nn1gktjeajYqIcOsznCIwBzSmbTy+ClyD+v/5HuGXBfKOKGOyGll8pA4NupxnosFWt
         ld4A==
X-Forwarded-Encrypted: i=1; AJvYcCVZdAYgsmkme97HnhPq0nw0amnxc7Sm1DTuTKGpuDbGpvjUwYy0YAJ1iTJGqdcmpyz766eYuRY5yHt5BQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWHW834le5X5pYQH9HL1GJ5xCbUmg8ZlXxhXgE6dHf2m/y0nSz
	KeUWVBUwqX9coRkwD6oQMG1oJRHAtk9yYrypkhSjqwHsjI3i0ur1
X-Gm-Gg: ASbGncu9nSM7kEGqXdRCVHP8Q47Wx2P9Q2DOr63tAVYYFIpEDCi1IaPuWieP3FrKZcS
	d75K87s68WKuYcOOGakoz9mrDhXiTSlWz6un3kEYeg512GKl2t8vFfOOYpgOl71mFVcOApma4Wx
	WsoFifBX009/SMoo4iHvcI4JjMXj7rrBjNLyc6Oehg5VDdBbevRRxw8w6YoNx+HZz3YHPhAFit3
	OiCYGYM0eS/EWZLMOJwaqJ1J44HdhiGfh0UwHbZiGFMZz+19Pm4vpyg64Wf3b8Si1DArOeULf03
	IZxy7Flzg/9z/IO4y7y/QhJqc08F7kLi40F/AIdtKBZDU1AVDR3wJW/WDhlH+6dgJgMI62In
X-Google-Smtp-Source: AGHT+IEPI0/uAmG1j3NVe3lMMXToyTKqXz/tt6wVkSqKVKUWUxmvO7uD/TEvDrvrmVRLlqnGT6k+9g==
X-Received: by 2002:a05:6000:2489:b0:390:e9ee:f27a with SMTP id ffacd0b85a97d-39cba94dac8mr10539389f8f.28.1744029438981;
        Mon, 07 Apr 2025 05:37:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c50a:8800:cf9e:ee0b:4a01:37f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b76f2sm12065198f8f.53.2025.04.07.05.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:37:18 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: linux-crypto@vger.kernel.org,
	herbert@gondor.apana.org.au
Cc: davem@davemloft.net,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/4] crypto: sun8i-ss - use API helpers to setup fallback request
Date: Mon,  7 Apr 2025 15:36:03 +0300
Message-ID: <20250407123604.2109561-3-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407123604.2109561-1-ovidiu.panait.oss@gmail.com>
References: <20250407123604.2109561-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than setting up the fallback request by hand, use
ahash_request_set_callback() and ahash_request_set_crypt() API helpers
to properly setup the new request.

This also ensures that the completion callback is properly passed down
to the fallback algorithm, which avoids a crash with async fallbacks.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev

 .../crypto/allwinner/sun8i-ss/sun8i-ss-hash.c | 49 ++++++++++---------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
index 753f67a36dc5..8bc08089f044 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c
@@ -150,7 +150,9 @@ int sun8i_ss_hash_init(struct ahash_request *areq)
 	memset(rctx, 0, sizeof(struct sun8i_ss_hash_reqctx));
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
 
 	return crypto_ahash_init(&rctx->fallback_req);
 }
@@ -162,7 +164,9 @@ int sun8i_ss_hash_export(struct ahash_request *areq, void *out)
 	struct sun8i_ss_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
 
 	return crypto_ahash_export(&rctx->fallback_req, out);
 }
@@ -174,7 +178,9 @@ int sun8i_ss_hash_import(struct ahash_request *areq, const void *in)
 	struct sun8i_ss_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
 
 	return crypto_ahash_import(&rctx->fallback_req, in);
 }
@@ -186,9 +192,10 @@ int sun8i_ss_hash_final(struct ahash_request *areq)
 	struct sun8i_ss_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags &
-					CRYPTO_TFM_REQ_MAY_SLEEP;
-	rctx->fallback_req.result = areq->result;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
+	ahash_request_set_crypt(&rctx->fallback_req, NULL, areq->result, 0);
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_SS_DEBUG)) {
 		struct ahash_alg *alg = crypto_ahash_alg(tfm);
@@ -212,10 +219,10 @@ int sun8i_ss_hash_update(struct ahash_request *areq)
 	struct sun8i_ss_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags &
-					CRYPTO_TFM_REQ_MAY_SLEEP;
-	rctx->fallback_req.nbytes = areq->nbytes;
-	rctx->fallback_req.src = areq->src;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
+	ahash_request_set_crypt(&rctx->fallback_req, areq->src, NULL, areq->nbytes);
 
 	return crypto_ahash_update(&rctx->fallback_req);
 }
@@ -227,12 +234,11 @@ int sun8i_ss_hash_finup(struct ahash_request *areq)
 	struct sun8i_ss_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags &
-					CRYPTO_TFM_REQ_MAY_SLEEP;
-
-	rctx->fallback_req.nbytes = areq->nbytes;
-	rctx->fallback_req.src = areq->src;
-	rctx->fallback_req.result = areq->result;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
+	ahash_request_set_crypt(&rctx->fallback_req, areq->src, areq->result,
+				areq->nbytes);
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_SS_DEBUG)) {
 		struct ahash_alg *alg = crypto_ahash_alg(tfm);
@@ -256,12 +262,11 @@ static int sun8i_ss_hash_digest_fb(struct ahash_request *areq)
 	struct sun8i_ss_hash_tfm_ctx *tfmctx = crypto_ahash_ctx(tfm);
 
 	ahash_request_set_tfm(&rctx->fallback_req, tfmctx->fallback_tfm);
-	rctx->fallback_req.base.flags = areq->base.flags &
-					CRYPTO_TFM_REQ_MAY_SLEEP;
-
-	rctx->fallback_req.nbytes = areq->nbytes;
-	rctx->fallback_req.src = areq->src;
-	rctx->fallback_req.result = areq->result;
+	ahash_request_set_callback(&rctx->fallback_req,
+				   areq->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP,
+				   areq->base.complete, areq->base.data);
+	ahash_request_set_crypt(&rctx->fallback_req, areq->src, areq->result,
+				areq->nbytes);
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_SS_DEBUG)) {
 		struct ahash_alg *alg = crypto_ahash_alg(tfm);
-- 
2.48.1

