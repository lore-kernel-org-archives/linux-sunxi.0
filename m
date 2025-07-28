Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C139C221FD8
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Jul 2025 06:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753682881; cv=none; b=c6uroRRJW8UdKrp0pSpqmuJ2SNuipV9we6eTQpLcWFeoESU+zMUIH8OEQfcIWgE8rsUtFp6msPAKyyGiNZQhi7jDBquRS3tDANwrrhLD1mUp5T/ptOCKdjrHy+EPsxaFJpruB7HQRsyuhwAEf33S/hD+G915BKp66LACWmo2WCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753682881; c=relaxed/simple;
	bh=4zJMhQ+VcPBQ76ASBvFai/gasWQveJW54RMGe/zEYD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CW9S8SIGF+xVgzgs2qsHg315m06tEqcplIWR+zIvcKzculXSky4LiAd5DQQM2FtGK2lRFuYHfBRRJ8cqPnvBHjbqOJO8h4C9ME1e6RWpNw1gp57L20njLHubr1AAIDO0EHwydj1560Se6PHc3BONvvzt/YsNc7EfT3j5JqlJow4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2Ocz7io; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2Ocz7io"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45555e3317aso19790325e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Jul 2025 23:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753682878; x=1754287678; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2K/bAbM7b4hD+UZ1sY7e2X2nlDeVKcJvl2Epy7suEc=;
        b=R2Ocz7io1ZKHaJIqtP9g9Ivkajz2JbH33/HgmYP5MY5Rm9YepitboO1tE3r1enV+ii
         6RplyVn8P5GhGHNkKgoGipWhIqyNlXuxaJnW2BCugk41+avskFEhZhMxnFmRm5MtONX/
         7EHEkgMsEqXwoICRQfOSqkv/a8d4DQGqrdkqquOi+29cch844SC2q2Uv19FuK40dmAwU
         KB7iY7f73MZ4oZh8jN9LbuKwxKbpdS2i/2s0l0aIM8xur9i/F4Lxs9846dTBmVJqLBKP
         kGosp0qlQ+leF1RgR+qcsBHSQ5pLDbtfLrYRkFx5XqYLj9f2TeBW3z0p9XPHHqWD6gaT
         E3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753682878; x=1754287678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2K/bAbM7b4hD+UZ1sY7e2X2nlDeVKcJvl2Epy7suEc=;
        b=PKlMYtts8YUYWtYbmoBLMqs83jw3eMgGAMnNx/oMX2Nuz+E1avhwA9DMC8xpcIX+S2
         2ZCmNcxxWtlyum0qf9aJStjOa2KytQZ0qtVgDSWQ0Q5OZrPe2diLaPD2GsCSREjnaAso
         zKOJ8ufFvTjgNKOT8m1HEFinMAaNaZvJqHmB+767F1wsMfU0dAKuVL3Da8QjwEqQsuHM
         G6GrQ9+dcif2r5XYGcHT7jmcLc3SLYztQUF0aA7bsGbN8KkYuv+F4XTvNhgKWmLbf/PP
         nMwE6YhaDSjJXUltFjZ6ok7JJkQI0DAI+XSWS1eBPKMyYi7z0zZtYVqrH4U5ZRNNMcyn
         EbuA==
X-Forwarded-Encrypted: i=1; AJvYcCXUlzyOoEVYgspBwtt6HJWtooSJTX+RwYFUsW4WwvKMU5HTeYMM8Ek1yFL+DzUillHwvxk7IYrIqt7x4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzexZDELh+f6IL2AKqenOeyB4s24Z50uqVaH/u6o2LvX8RfIm9C
	uL5KlFSleAUdJOi65xiS7VwGVsdX7ilaWGztQWZvzkk7EB2BoHqzIe3M
X-Gm-Gg: ASbGncs1prnXY8/luKnTvnDo1oJTk37XwtOI0Yv0PCtRBuGbO0Ks6P5/DTWDn801G/3
	LxdSaSLyZaIU6IV9D5mFD38Xgo4i61pl28izKnjVF56lGcXC4L0kyalBPCICz9fDleqG1FCaxlZ
	8O0kHwZ5L7rCaQ8brvGLpVohUIeBmIeu6ucnLtZrJC0hDLCr/PQsn6QeIAYJjNaoOqnIjsH1p0e
	W6Ol2j1stLsLgEevSYMHBwVjd1xpyGWGmccAjA0R6RD+adidIT1LEI4O7Ek7xCP+j2W54FEBgQb
	NOj2Ah8sCDW9bThKx7Vfj2LD+TZK4VtELvczPOKBNh7Aw+2XQHfYVYQdgAL50mb9iPA/XYHpBU5
	8rKF9lPZTDFkEAqn7ND7HoWWNMhzmrE8A0A==
X-Google-Smtp-Source: AGHT+IES0WVeYiOQzgvF9uZ/F/ZuRvB9DCBVa5KoIGMgW6lVQFOUgMPsAT/Es0z6LGY/i4jb9SI8lQ==
X-Received: by 2002:a05:600c:1d1e:b0:456:3b21:ad1e with SMTP id 5b1f17b1804b1-45876442799mr90886165e9.17.1753682877810;
        Sun, 27 Jul 2025 23:07:57 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abe6ba0sm86195215e9.9.2025.07.27.23.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:07:57 -0700 (PDT)
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
Subject: [PATCH 3/9] crypto: sun8i-ce - remove unnecessary __maybe_unused annotations
Date: Mon, 28 Jul 2025 09:06:55 +0300
Message-ID: <20250728060701.1787607-4-ovidiu.panait.oss@gmail.com>
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

There are 4 instances of '__maybe_unused' annotations that are not needed,
as the variables are always used, so remove them.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c   | 4 ++--
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 113a1100f2ae..c57c64a1a388 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -111,7 +111,7 @@ static int sun8i_ce_cipher_fallback(struct skcipher_request *areq)
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
 		struct skcipher_alg *alg = crypto_skcipher_alg(tfm);
-		struct sun8i_ce_alg_template *algt __maybe_unused;
+		struct sun8i_ce_alg_template *algt;
 
 		algt = container_of(alg, struct sun8i_ce_alg_template,
 				    alg.skcipher.base);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index 79ec172e5c99..326d9c988bb1 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -1062,8 +1062,8 @@ static int sun8i_ce_probe(struct platform_device *pdev)
 	pm_runtime_put_sync(ce->dev);
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
-		struct dentry *dbgfs_dir __maybe_unused;
-		struct dentry *dbgfs_stats __maybe_unused;
+		struct dentry *dbgfs_dir;
+		struct dentry *dbgfs_stats;
 
 		/* Ignore error of debugfs */
 		dbgfs_dir = debugfs_create_dir("sun8i-ce", NULL);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 61e8d968fdcc..df2acef9c679 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -26,7 +26,7 @@
 static void sun8i_ce_hash_stat_fb_inc(struct crypto_ahash *tfm)
 {
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
-		struct sun8i_ce_alg_template *algt __maybe_unused;
+		struct sun8i_ce_alg_template *algt;
 		struct ahash_alg *alg = crypto_ahash_alg(tfm);
 
 		algt = container_of(alg, struct sun8i_ce_alg_template,
-- 
2.50.0

