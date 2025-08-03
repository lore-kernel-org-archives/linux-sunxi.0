Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586241F4CB3
	for <linux-sunxi@lists.linux.dev>; Sun,  3 Aug 2025 19:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754248269; cv=none; b=S4RVWaLItF8bBUoQq7+tM9xZlt7czt92h/3WmNF2t/KyxEOoMAJ7YodArZdndqabWigJQpseXrmegCGFoA8Nzi1FIsa9dWwCgTIcM/6bYNThFdLSu529pVERtONfLRp5J1XOWxq7mrTjokbcBMasDLU12WY0pUO0O1BrQO1nkWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754248269; c=relaxed/simple;
	bh=bsrtN/UNG9iIkOTFtbf/aBs98lsRgQ3mXT6PfL4G5aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CaBim0j7o133uLqt96uE0fuP5XAnp3crq3Eef0fDU7J2kWsOpNg9onTrkVsMXa5GxXp6udRnkz570uu8ITDbCVPcGLpPYINwqfVO3WDMdHoBir5F7Fmj50JB6nJph3SJq582VVVKQ/eQsI+LyFiD2tLjn5PYcWgbPTvCWxy8zis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NR9YJYJY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NR9YJYJY"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-455b00339c8so23407615e9.3
        for <linux-sunxi@lists.linux.dev>; Sun, 03 Aug 2025 12:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754248266; x=1754853066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SQo1VWDa8L0gOXuwTFV8cUa7G4/T2C+1QUOVeEgYOo=;
        b=NR9YJYJY5uysQXNEQMyuRYj2gnZH0pw5TgCH+pqKI8fOAee3/uQgbebg16+RSLd3Ib
         mgmpfzPQX3kqJawYpXtpWW7TEeYAYWuWtNLwXryD6/Fr1U5+td3fjZ6jQsZ8EXhPs0A7
         aTABfxUYXxeoUDhvOVRDIDcBQzvqOrDlMUspLP0c1qtoSPyaYwbt1qvrDmV8VPGcXfUY
         zyPelEal34PJF19etcnWDHldeWO3UFnPatRtzTMEZSN1+FF7JMniRpQFrFd2fShSCd0E
         H1cYf64EiAw6FoHHdOSyCKYOQIi0o8AGd/GoFfRS3wHfccdhgmqLGkQh8UIEIV0fM/F2
         Uh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754248266; x=1754853066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SQo1VWDa8L0gOXuwTFV8cUa7G4/T2C+1QUOVeEgYOo=;
        b=FKWsNETQ9GvS+AJQrgoib8fIdzZpe2kAa6SaOSYAqG9xbT04hzl4jAZh7dMIGjWIdt
         /lBjwLW8LJEh4iIqFwFjaYhiY1v2xVpav65qnUszctTqKObnwUBV2luF8X95W/8hiE9X
         wx+VpgwsaAr+QdjfJR7UTd8DydLTdUq7ZMsxtNqBqCUGPTqWpG7pJpZr3vmpA0e5DZuo
         EEGaUy/blvNZirVlkoGMlZ5MiQb+Wm0Jw4OBYGkERMn90gks4S4ImmMrX022EIRSoMyT
         TCjEP6TdBlN/rLICBphQ7ajdGbdYqXOgneWWHdtHssa00b2K+DV63TaFYxjWKJFBrA79
         O+zw==
X-Forwarded-Encrypted: i=1; AJvYcCWCFljh2LdfsU8gqwi5QbAQIfelOpWEXzro7557zMlJ6x0ken3wwMjZHXE8HValFCP+iIBTrNjqCPnV3w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzhtn/zAx5fBCA/g3u0sNEF6VEIxR8QLAQDxLJXiyuKqtfqNUbR
	BcIyCpxQvpf5eURZ70Aocvop9ECetqkK6BTDM/0s+MaPs0aKekOTp07s
X-Gm-Gg: ASbGnctnEWl00Vb9z7yVbWuSSzwnKZnySj36JD/lnvdE/qhhJbLBLx/xZkXONb+XULD
	+JUPKaiOoYqMIcJDfHWBGxJGgDJT6KQXtORFHiMLJVr0Z++qWMBuv/vP/Iw4AXBlr3DIj2E3oh4
	LOLSbhfymWsTjhzx2+muRbEjiy5r/NGoMbYUSh9Lqw5tMTM70AsbLzscfmwn4SlcUtv7QLIZ2f2
	PG/SNqyU6eo5X3hRzVssxVMg2AYmWXQfF6BEw2Lji6RZv2cEHomEje9LbpJNLcrhMMYisKoPXEF
	um0McAFePNhJuQItrM62egpG41uVV76bd4JLP7wIvyM3GaUXs0mKm+y/UG64NGu7pHLK5uO92SQ
	HWMfklKHBaNyQ5Kn6iYJBu0uNVfcMvLjvPw==
X-Google-Smtp-Source: AGHT+IGAkLXj89d8+BSh3EqnA4GVIsKBPznnVnW8s4SI6ImldpUHqZ4tb20/Ec2WyIE1Q5fljBDFvA==
X-Received: by 2002:a5d:584e:0:b0:3a4:dfc2:bb60 with SMTP id ffacd0b85a97d-3b8d9481972mr4970990f8f.26.1754248265452;
        Sun, 03 Aug 2025 12:11:05 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:ca0d:f700:1210:b727:adc8:716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm13099210f8f.39.2025.08.03.12.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 12:11:05 -0700 (PDT)
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
Subject: [PATCH v2 3/9] crypto: sun8i-ce - remove unnecessary __maybe_unused annotations
Date: Sun,  3 Aug 2025 22:10:23 +0300
Message-ID: <20250803191029.3592987-4-ovidiu.panait.oss@gmail.com>
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

There are 3 instances of '__maybe_unused' annotations that are not needed,
as the variables are always used, so remove them.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c   | 2 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

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
index 79ec172e5c99..ba30859e749c 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -1062,7 +1062,7 @@ static int sun8i_ce_probe(struct platform_device *pdev)
 	pm_runtime_put_sync(ce->dev);
 
 	if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG)) {
-		struct dentry *dbgfs_dir __maybe_unused;
+		struct dentry *dbgfs_dir;
 		struct dentry *dbgfs_stats __maybe_unused;
 
 		/* Ignore error of debugfs */
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

