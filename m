Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17D0205AA3
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Jun 2025 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734567; cv=none; b=KBnuE27YMNP3S+/03Z2ggmFkEazsehWTUuqwCYNh6F22ZWu6CH9JSCIGiPdWBL2ZqPpKysg0pE0mFLaYYLpkTBg370LPjPQCIFFLCXABQJqEkPWOOaiVSBwpbbfqKopxyzylPPwAMBzXigiEiRHKq9F2F/Z8TvccvfdF3VBh8A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734567; c=relaxed/simple;
	bh=pcmGu317gTZwAy3/dan+A6JGqZDrA3MuzLVFRN4QaD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gCl5mHwD9Ft7KQbFzBEihTrFrCuzPSOMIDug4rKq4jjmIG1NwJTZFxLcxAtb6OUOW05Hi90q50WCZEBYa1xrdXD89GL70AUhkuayELCIxfuzLXANDLT9VFHsodGToWwaEhXzm66v6nmuYxvwWMDsBTMz3v/s9bmhSaHh26Z/nVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NVJPtO23; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NVJPtO23"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-adb47e0644dso168905066b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 12 Jun 2025 06:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734564; x=1750339364; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5mo28r4bSLhtRxKleEgwjFwDjbfBKbh8TaaOWlq67M=;
        b=NVJPtO23wkSZP23GC2ayxZokDrUKzGww51ROCVkfJAbyYE6h0dpfabFGPb7tNefPAy
         dX6QDLz0GRRNmE9AxyEts97fTKTnppwI6gfQqEoxQ16qXSxSu58EPVYVbmSj4+cX7Hfp
         wk0KGlER7Y0LIV8mi3/vIWpfHBwkYrJgJi/PYX1BpbBX0X62DQ0muxiMizXQSFGH+nPw
         6BKdmbcoOlWQU7ZWUhKzrX6VOSlKu1DXMK6RK/R4QJIJOfGPQFhhk/3cXd9Lk2oCp9Vh
         wf5Ck+1LPQPx4sm5P+CFDXY/LD1Pe9SvpE36cXDZz5sLVUuQ12Q6WiiBY8ipkMXLZ/CW
         RBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734564; x=1750339364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5mo28r4bSLhtRxKleEgwjFwDjbfBKbh8TaaOWlq67M=;
        b=uHnunHbP2aZONUhE+gL8BMEwjYF/acK34ouzEQn4WFJnsOoFXO5GrkUoqbu8M7Q3V+
         17+1UFEq+7iUhp4mKwO0YXKfcVUaALHIbYwII3ND6+ZOJxC5nEd4I+khAUBlgwRlRT4d
         q2AkAUajasbJIyuzu10/9UUktlbTDgpqrIPjjxuaRCyNkuuLaEoECs97Uy+sniAF5tjo
         SxBBJREcyzp7Er/ZTaj7ZRpyKrtAy2pfA33jK5fbMVJdcEDsykFdWrs9aDOBuVzdT9SW
         pyvrKVrfOKmNNTBZzHKqpOIp9NUnXsg5VFL/clGNmKNSfbe5qbgdjZoGL4DCr05zBqfI
         mXJA==
X-Forwarded-Encrypted: i=1; AJvYcCUJWD9/rIfvMQtsWREte2FNqCbJbASa1BsbqNGQQZ0qgISp2RP3YIUu+VU0w8UhS8vEnKz4+jsZJPugKg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu0q5f8BYyfn4PXIam02PfuFiOEi8Tq3bjzzx1SWrFxwSUe2C9
	jtiRf2fV8VTH8O5TJgJDyF399/m97oR/B4bGc2SYtGYhqYHn8vG4HNPkCDUeuSMH2DU49Wtg7iz
	NLm6Yvtw=
X-Gm-Gg: ASbGncv/OuhWKZcAved1VImC6FRn7xLgnQK6knX6Zz7Xi+koUV+1l9FNYPWRTVnGhsU
	283e7ZqZc3n9x7ya9lKfkjx9ydBNyvY/BuEW99Yy00vyYUNHnwc1PibIFe15MYOZ469FA/3nwvN
	mLfAIs+ALiuRtLtsD87fhSIQrojoB6sA/W4Y4wZpaNgTKOyvCkwlKV/JVCziUyQLL3de/KDSwEF
	ZrHKYR04WaGrYl7K744n+6cKu3w73WlxDjX7ecfXHvceDJhuqEGsazL9KlGn3xa15akiyzbnNww
	KIAgLtJoWlU3PzK8HhojNN45vt3DQsVeugNQ7ZiIWA32jdWqooYtzTqB/whfHT3YpQ==
X-Google-Smtp-Source: AGHT+IGBzR2mvuzoTZVHlKLwIjCRQmPWg1494+jjoGTBRb95NjkbBovSMnn1G3/kvKyntrJFTjslYw==
X-Received: by 2002:a05:6000:1acc:b0:3a4:eb7a:2ccb with SMTP id ffacd0b85a97d-3a5607fa6a9mr2706309f8f.16.1749734131666;
        Thu, 12 Jun 2025 06:15:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:18 +0200
Subject: [PATCH 09/16] pinctrl: digicolor: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-9-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2000;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OQugchdrkWqDPvdem4KQYa6SyzhpAo4iCK+GSkQ42zM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLm65xc3XhSAXLjOYJrRx8iTF6Z3NPsxp5s+
 otU7k+QhaWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5gAKCRARpy6gFHHX
 cpxgD/4qN100OY/e/Uz3KaPovCgsqpm2wpUtbSiYEFHBmHRBGLuf3ySBpaIk66jUCp2HK6IC/Cu
 2rqLmWG+B1iFpS4BnVMqobo6XmQjO/ARjPAV5Mt5CaDoOoTOhpLoNchztmEN9Q2JKULHtTgCqhX
 lQHrPhbY/9i/5W0RbV5etGdJItUlMoySsE119JLcLNM/on+dOLWMt+O3R6OFQVbA2Ax1wh27sWY
 400r6LQeOyu7NOnJX3zbqfwN/N+J2L065B6bTivK6wSYzswkHHRl1mWBdJI08KlqfsH6XPgQFQw
 JX9YVFecSDqkoVn+ypM6aD02FboP/q3cvaaUBgxUNeZX30SJzwt52lsSpg1n+Tx4J77UuEZyss+
 GFY852aRZcZxAim54v/DC23tAfXW37EDYmRMBWXAr+q34Gz7l0YcsBZVHY59CfR/16FxKPEggg/
 3iQYJRkgoOkddEdzxoZ8j7F7myunohSmcOCpD5Tu7Ycpzt2nb9gQzdsAwZZixXN2jBJxs11uOSl
 KaDj1iHD+UyHxRyF4uxpTztdkNsHGKodkqbgajWh9wCY7oxvodduH64VwV96QA8h2NgxXxorrg6
 X3fbAgBNYIXJF2fF+V2DAOgvtIyTF7nNrlcaKu7z3fq0cycKeH7OGmyuh2ikwHlpBgY8Zj4s2kM
 q0e5Q8QmLCBxxSg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-digicolor.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-digicolor.c b/drivers/pinctrl/pinctrl-digicolor.c
index a0423172bdd6d8600fcb56a542ef498e14308968..1676cb3cc4c98755d287d3d87ba682ffc61192a1 100644
--- a/drivers/pinctrl/pinctrl-digicolor.c
+++ b/drivers/pinctrl/pinctrl-digicolor.c
@@ -182,7 +182,7 @@ static int dc_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 	return 0;
 }
 
-static void dc_gpio_set(struct gpio_chip *chip, unsigned gpio, int value);
+static int dc_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value);
 
 static int dc_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 				    int value)
@@ -216,7 +216,7 @@ static int dc_gpio_get(struct gpio_chip *chip, unsigned gpio)
 	return !!(input & BIT(bit_off));
 }
 
-static void dc_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
+static int dc_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct dc_pinmap *pmap = gpiochip_get_data(chip);
 	int reg_off = GP_OUTPUT0(gpio/PINS_PER_COLLECTION);
@@ -232,6 +232,8 @@ static void dc_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
 		output &= ~BIT(bit_off);
 	writeb_relaxed(output, pmap->regs + reg_off);
 	spin_unlock_irqrestore(&pmap->lock, flags);
+
+	return 0;
 }
 
 static int dc_gpiochip_add(struct dc_pinmap *pmap)
@@ -246,7 +248,7 @@ static int dc_gpiochip_add(struct dc_pinmap *pmap)
 	chip->direction_input	= dc_gpio_direction_input;
 	chip->direction_output	= dc_gpio_direction_output;
 	chip->get		= dc_gpio_get;
-	chip->set		= dc_gpio_set;
+	chip->set_rv		= dc_gpio_set;
 	chip->base		= -1;
 	chip->ngpio		= PINS_COUNT;
 

-- 
2.48.1

