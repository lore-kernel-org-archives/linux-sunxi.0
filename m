Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAFF23E35B
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Jun 2025 12:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335856; cv=none; b=UvUNoKxecAKVoYhYC0s+IuxziPPwLnmW3lVnRjb8XbwwsptZivVFgTX/Go27yDlPBLQna/yMN3yAEWrPGm8ly6ex1prNhqcbvwrTCIT3jKIbZ1QZfSWLR50dIrg0F7hwWSJ0hJiVAF9gMMt2YU7H0qwG9mO4BLeb4PqUhMOcQ6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335856; c=relaxed/simple;
	bh=D3Fpyml+Pwh/ot9LUtEAJrW9x78rJDQPnjdfBz8Z7cI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=He/YaDgGg4z9K17mtADPHXwvRnGUwsYPyAdWPtYhRK9xxSJgzjgVcud3/7Pc7XfgQWQbkFaFCDuiIJ54ZXVRQh9X8xuwWQciRl92xOOE3Dlo1pz2anWM+wGfvMULA/XvCa86DzJaVL9IssnkjIRl/91yTqAtZCxsAtwwTjGu1d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPVVQMUn; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPVVQMUn"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ade4679fba7so144139566b.2
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Jun 2025 05:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335853; x=1750940653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HrsFLSEEMdhGLUzZIYXTdJy0VycwWTY4NZmzeB9UZg=;
        b=nPVVQMUnMdfYRFFcMlzPLUSbDGhbkizr7FnQJSEycOkWmgbV7A85n9CdQ14Q8/yBSd
         brpkek5Z9pCuGeJ652/jynDy4mD2OCVfzw4wareIfFJeEa33lJqKl1Nja7GTO8GLXrpH
         CrAJREkHLv3xe/9jrIaO6CtrjvjSNQ4SzRMp9WEss9d2mPkbQQ+Evl460Pb5X5ETEILV
         jwg6rGnjwhyQPsUxPI1P97zm81xz/COrS7tiC81LbNhp92HlMGT64p198jvXvjDn9H+F
         nkTOzkmMC37d8v8X9nR0icrEJwfbXVEfFgE6pUWiuub2WpAmHXx3qv7S0uqeJ6etGfjH
         f7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335853; x=1750940653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HrsFLSEEMdhGLUzZIYXTdJy0VycwWTY4NZmzeB9UZg=;
        b=AmDvyMM5DgtrwnXp5n0NpLmwVEsNGdn0eXJ/CWIrTxgIo7quP5roS9IZ8lKQBwm93P
         hfKD3cnQ40LQGddA61SQUuR8w8+HTGJaawsgb9EwoVAfE2AdJL4c5whOK4/Q1C5c9bMt
         NZgDRI8qr48V/M+VQuwwWZumQ86BjYkp2nImljrqseYfVxiCWCBsGqiW4gpugBYOuIpS
         tmK5WB04RJ2McIksxGPDAGmtND7fkyqUFDc624ULbZT84IjNOv2ZUYSflvCZCu6fVmUS
         0wmJPq6WRAVtv7UQBFxAqpQXxdLBe9OUXXJLYQ/S9ItIFBVm9E6TWu3TchbDb2+QkEOL
         S7jg==
X-Forwarded-Encrypted: i=1; AJvYcCXMvjZb3ZRsLRARjzXFE2B8CbNm7LCBbMCLXrJi8qT/5nGRjbs4OYMY17zsKjBnAOhX/+kkS7nlUJelQg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4H0YSmQmG0m6Fh3puhwlvvOQ25wmp7OkHsOpyLAkDoXzINKly
	DeN5GK66wzcaedhTsjiUOJ9ykOHxWdSN+HN971Zcv5NGop1pKSb289b1
X-Gm-Gg: ASbGncsrEG7VeA2B5XdyCKE0xCkcKJBY3Ke/E98Su3C4WkpHO4re8wgS3AzIO3OOhAt
	UtIxUOvqEMAqYwU8XjAsAXbOOF/qMcn3/6rQbqFfp38HteJBe7hJkgtLlEaKxAJ6s9hFS3HmWDd
	6OmaxPGQuSW3MM7CYg6XWHoT86NtEtFjM7hat+PA0uMR7UJ0COms7lolv0xLrm0d7k9OdujmTMt
	6HsridECHerI1LzzVkBL8aAkO5B3K+Alxx7MnYRjYowtNwkNh6sM+M6snOFEUsLr+p6MlBYDlDr
	OtDN8OfO1n1WGNEGlwpUn40LzdXFVKEbacSA7bqWYwlJpQMXGEim1CcQSD2ejS4vlnQlIobcJmF
	TEs/zQbOgwu9/Uw==
X-Google-Smtp-Source: AGHT+IFHuWqBozXH71wulrFP//Y6OM4S5v5aSjrSOQKgs/LL1p2at57xIwfuaUeDkpt3vFS1Udqh+Q==
X-Received: by 2002:a17:907:3f1a:b0:ad8:8e56:3c5c with SMTP id a640c23a62f3a-adfad363d82mr1948037266b.11.1750335852861;
        Thu, 19 Jun 2025 05:24:12 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae000b02bd3sm504688066b.3.2025.06.19.05.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:24:12 -0700 (PDT)
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
Subject: [PATCH 02/10] crypto: sun8i-ce - remove boilerplate in sun8i_ce_hash_digest()
Date: Thu, 19 Jun 2025 15:23:08 +0300
Message-ID: <20250619122316.2587236-3-ovidiu.panait.oss@gmail.com>
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

Retrieve the dev pointer from tfm context to eliminate some boilerplate
code in sun8i_ce_hash_digest().

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
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
2.49.0

