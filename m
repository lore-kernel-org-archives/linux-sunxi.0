Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEBF1EB19B
	for <linux-sunxi@lists.linux.dev>; Sun,  3 Aug 2025 19:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754248267; cv=none; b=YBEPpZRACYY35ovtj34lYslDnzHkFJyogTuKPvknxSUCHdL+Syb0WeJeqflWcgjJxaWfxlogy1V2UcJPMw2zjRMJfnOrcS/uEjTq6VLhmJ54+MSaGbXneA9k1VgA7luq4txXq6BRaNJbTG5yUG/+NMkv8x4aChBpOVs9KGlY7Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754248267; c=relaxed/simple;
	bh=kyASvvV0C6502P156s4uvhgiJ2anCkqmkQU+DPnmJLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PaKQeJNrOytBPll3HuiUDqXAY1HjZZhKIjUUX+uVSQGaXCUAJ2Ggcelcb/K62IugB9rrx1TK4CCu7OamAjlBTT01bQ++bj+i2nXO7MwhtAjJxIOnQVRt70qHn5wEy+DJdPSitE6ZzHnwnFkZHfS43QjzqSakLEekOrMYMjssT9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbgY9oPz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbgY9oPz"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4563cfac19cso39126625e9.2
        for <linux-sunxi@lists.linux.dev>; Sun, 03 Aug 2025 12:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754248264; x=1754853064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ElWdGUyg9Q9uvasE/0knQrvGqeT+AHFO5zlC/AHADc=;
        b=MbgY9oPzTN0EWLbfbxpATIXCAcTn/KKr8IJ5G9MvaaZl/DkHhnfbgcFubZDP94mSXO
         QP+SytEmIk0Zk4xLdZ3oK45iHcuSsPKHA/9IkFeZO2o7FoseT/zulRDT+D59tGeKR085
         45vdNyWIDC0tnOuVEwZWr9DSJa+/jD9RERM6aW1+nAIYyXGRXRezsg3EnCBM6GZzBwNM
         z4kXdRna3Jo1DCKPVbE+9XBnICDGRppZxZP0br1giROAgwoPpun8aP0iAOGonMd16Mox
         1VE588uMsDa79t+1M5gNOMi9jd5VuRtoPzbfEeK+ZraTHYmSdnRK2oPzzTwpfzeK57ud
         L+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754248264; x=1754853064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ElWdGUyg9Q9uvasE/0knQrvGqeT+AHFO5zlC/AHADc=;
        b=d4zmegnavUHg0uWrIm8RH4ryQPAC8li6pkDXGSPjNxu4CTtZMHLl1F45+hFk4PGp/2
         yW053usoXiFrhZPmAVIOXYBGlXNBOLYfjOQj0L4r3ieX54n2SZNLAzNrZtN1Tay+8NlN
         0fgbQzorbYSYrG0iggwi512U9aEAejTOwviOWkNg/OQNlPN4ws0Sv5PMRX108rgBJQT5
         jaYpcuJeGZ8TZSoA70aqrTt7SGfkrEey+JpsHiF7Z7pyvFRkp4ORe2uUPpx9OUO1hi8g
         JvPT6WruVsIQgqEt6cYCHl/Kat5ojro4/3ceZ7rJt/H2Mahjyr/bGrqPlgx+FlSY8gZP
         udYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvtLliQC6H0E8wXYa43xFI9FNTq4Vb7540tRSputd7mCYfB54PvKvR5yMW86P8nl4QpP7KCx3wcHx9Kg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp1Xnayx0tyb0tr74xP97escqVlUGtlBh7eSbVlzMwIhxThvhT
	0gpCnQEYTHqwOBaOwBHNx3w/X2+nHAiBgYUt3pH4W2I5Cb9Sjr4XvQQ4mlOgIw==
X-Gm-Gg: ASbGnctAmpIZbifX44B6K6es8tpZ/TuLBpBpBagdKp9qt3UHrayZSgJx6yTRlD9ZwCw
	zhuIVk6YMU5/zv4S4H8ApYcWvfUxMQGdfLDnUfCS1/xnl7s4H9D3S7uZj7n1Xmo6Q/SwKq7fqTQ
	yRgDDR+ofRPPvb64Lu/gLNbcXFz4z6299eVq0q+cs9etbx/It80JQbYkKMszApqgq5tNdA6IA/Z
	Ok7rDHzF8Exli5GmNZL/Did3MIFkf0aPyTgeq/Q9jeER5UZ0JEPOQG9vWraH286l7Tv0ixnPMHV
	oHGLJkGX9+fOf+SzjWgbicn7d0aT4uZHfqKuLzYpWzBTUQsCj3peITaHJxBRlyhl3HkmKpZSx4i
	maCt5Rj7vNilgX4tFWJ/xK2JGZMQLKgx97w==
X-Google-Smtp-Source: AGHT+IEuwtHoQB0DUIyO/0Z1tXMmBf/alEdLn9qmJWqD0USge+nGe1p/Rv0Bwaf6WNGkHFKl9ruVMA==
X-Received: by 2002:a05:6000:310c:b0:3b7:93d3:f478 with SMTP id ffacd0b85a97d-3b8d94ce4a7mr4645712f8f.51.1754248264043;
        Sun, 03 Aug 2025 12:11:04 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm13099210f8f.39.2025.08.03.12.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:11:03 -0700 (PDT)
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
Subject: [PATCH v2 2/9] crypto: sun8i-ce - remove boilerplate in sun8i_ce_hash_digest()
Date: Sun,  3 Aug 2025 22:10:22 +0300
Message-ID: <20250803191029.3592987-3-ovidiu.panait.oss@gmail.com>
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

