Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7055246BD8
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Jun 2025 13:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734130; cv=none; b=Cku7rCfKG3jAVXNYfrZuwqffUKc0hv8CSZm68SkAJuIiC/41gkhj/W/d7VyKgKeCUhnrfmN7XpZCrqS9YVmnqxDPbOO1DxN8bgdh3dLsuZgvQbpGcMfwqDx9HFJI/Iyub01h0dqPQdzQjolz9Iq+NlxaXcE93CkaB+x22rkOLU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734130; c=relaxed/simple;
	bh=kcI0bfI5H/Hmf5yZdyf0QMbThFtI4nWGLfbZ3WK0FlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i/M+ONVwMafUSK1eoTPhx3ANgzKKpY7iijzeYBQBAKV6eSFOoFQ3nXHjzAUj0f01v9wshJNGD3eTO7bGSDjClTgHN3XerSr+D/ZpdpKUeO0pqQS+lv8IiAzj7iymndecI6jk8EoW9BthSL7pI6IPQxmft6ESP3gyEnhOLqVK3Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RXbw2e3w; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RXbw2e3w"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so998612f8f.0
        for <linux-sunxi@lists.linux.dev>; Thu, 12 Jun 2025 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734127; x=1750338927; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPh64evwrzs2XEZo26akT0hL+LXbpDIaNfa8zeCvhbI=;
        b=RXbw2e3wbhGZG/1esiG9QpMS90A0Pyh6pofSrE+J444wMt78zf/0ZA6uQFrv/a3/04
         /eTRhvdtZsowluhlxJRnwELDDPl7GLiieYUPFGlyBdPgA+HMVK3pyH4i8iqKthmyeGN/
         FFThbqBeIH2UMI8DSwoeA8OQIzaD0lc9dNn/1O8o2cv0WnkXqO3SxM1wEGsaznwjxV6U
         zsEMr9bkyKoBOMANkwFSA1KPatDgidi7TK9aviRrgNk9/xX6KP1Lv0nSwBct5lSIuseI
         BGGAemv5CFdmygH+kf6tCyx5pcYHrbAIvHF7USWslWHr2Dw2TYKb8O4e2owxzSUZUQBG
         pgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734127; x=1750338927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPh64evwrzs2XEZo26akT0hL+LXbpDIaNfa8zeCvhbI=;
        b=JfWeAlxfaQU0QcikNCgABvM+IoCvcRrebBetvOHSjBOrMCXfRsFobLq+ys1p8vVlcB
         wnHt+egagGd+PeGtBo+5iaxihrw56XrIADPrLX6lTSFG4a94QT+1QO3K58lWxiXTophH
         /9Hd3Iixzrw8IPWRjtH90Vbg5FXFKzG4v/rN6AK0E3YIApgRtmzVRGLl2zPY3GtZ8j24
         C+TG11ZDyRIXLhKYjS/qSB9Rg2UKkhGutZE428opdajXIzoZuqdGAL2GO6KuTH+6Qqk6
         ixJy7VELUSdPJxsNZ7LuOKoZP/LQ6uBqEA4z95RJuyyIkxrqJUBAP3j8qxR+0LJ7Q+kL
         emYg==
X-Forwarded-Encrypted: i=1; AJvYcCWALft0yznF0ITsGI4+CvjMQYoCte36DhPpuEUzEsaKIrDU1UWjCOdpbNMtofT6XgNArf8rpmcKkenqHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTKwJJBAPdkDX05jtGTvNXZTbxXHqRZOqV9c+7k0PYqdcQfsG9
	E0uz29b+IBBxH/O4BbINJg05GAkpH8am7fvD/15ZegfznZSfQ/9DZoQCTgMppgkll4E=
X-Gm-Gg: ASbGncvE5IKsTNKDd9vQhO97lTVNEmjjp84DKhUUJVtiiMF/Bktj/0PCv3DterU4Tgm
	UUrzqNRQL7Z+0ycPHJTR35CalABWExXx7zehnA4WP8KINLEMlzIB5CTcJSJzDXz39g0W1UoFPB4
	TTMCfsHzQSvtJK+S9VIT2HlINJoU8r+9WwDw9I2Ocy+Mqns3lddF+WuQU2tv6Kh/l9+5A7cWO3O
	jgBOfETtbYBRk7w2yjH1gm7Kb6EKxYuA+IVbJSm6APSDF4N5eAj5QrJjrWaq65t/UsjSpdL9NHl
	re6aOlH8UaBQsS13p5/3Kn+ic0oKOBlMdUHc0AiTodYVzUzjWi1hw3FskOto+V9Hsw==
X-Google-Smtp-Source: AGHT+IF8dQFZu3267rnqS9T+MlnDpsGMNr4UhOIVEWZlRhW8ilrSLXmT3/L/LQod0dJlLDDEHru6ig==
X-Received: by 2002:a05:6000:2505:b0:3a4:f7e6:2b29 with SMTP id ffacd0b85a97d-3a5586dcc29mr6204277f8f.5.1749734127149;
        Thu, 12 Jun 2025 06:15:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:14 +0200
Subject: [PATCH 05/16] pinctrl: wmt: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-5-556b0a530cd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zZBlMtHKzzXioPhlG1XBi+lA5WvGdR2KtCyPxbjRVIk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLll7sZrjDKxB+yIfzZvsGDAzsgGsNSphici
 P1S3FHTYBuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5QAKCRARpy6gFHHX
 clh4D/0eejaFFeaR28Vf6ymty4cRxtkyHHnZyl0oNIAQK4k2LKxfyvv1Uvm5rcDeJyn5YwvFLUM
 63wQ/V8f3n0FvrZ0akyzb4OoY/gTGr9TqBrRvfmdw3r88RstUyCq+LAePz4qg737URegvsmvcqD
 d0sTmTdeWFE8SJUqM1Rthnrc32nwNGmdogrzN3Y3ZySLnrLIrGYKfwRv1uaBnPxjdZ92ZZp7S3u
 EkfpWxLbbosC+cqD7juqS5+lazxS8yOH2tC8dPPUxwYFwlA/yuIElg3a5eB1sSMrR4EGmkb2RuG
 omLdr7y0eoOfBmNyoHulUJeZERWMiUDyTpZuVWgKEfCYdzgb/Ti1935juLv1SrhpTfvkpL369DG
 saMpzPev+8uD4fKF3iWymk7Rpdk2zZ+93Ey4bGlSG2YDdgz5qd31nsBMFhvQPWVdVKNty0XtRyX
 mt0+a9PFIVXl1mjGeDhyldfzWKuR1cd3kDzod6bLGisrs3zMUq+/Ru0yBalUAzuB40k9boYhvhv
 jfa8sc/Rp5eAZ3YSb7LDTNEf9m5zWmWu2wMBGWlQIS0JyYZqtY+6j37fbI16nOHQgPZcd9zGGG/
 cvIur8XbL1wPUk8bK7ZObQF8wT/Nu0GAH+UK2fj/hAJAIHmRY6Vy2gaw9fAM0vxRT/AEE2HSZfC
 45zRTemNQslYrtA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/vt8500/pinctrl-wmt.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
index fce92111a32e4976bd31c7e9845e4fd08a7affa3..767c6808a463ede61aee61b63f28ee38185b7633 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
@@ -507,8 +507,8 @@ static int wmt_gpio_get_value(struct gpio_chip *chip, unsigned offset)
 	return !!(readl_relaxed(data->base + reg_data_in) & BIT(bit));
 }
 
-static void wmt_gpio_set_value(struct gpio_chip *chip, unsigned offset,
-			       int val)
+static int wmt_gpio_set_value(struct gpio_chip *chip, unsigned int offset,
+			      int val)
 {
 	struct wmt_pinctrl_data *data = gpiochip_get_data(chip);
 	u32 bank = WMT_BANK_FROM_PIN(offset);
@@ -517,19 +517,26 @@ static void wmt_gpio_set_value(struct gpio_chip *chip, unsigned offset,
 
 	if (reg_data_out == NO_REG) {
 		dev_err(data->dev, "no data out register defined\n");
-		return;
+		return -EINVAL;
 	}
 
 	if (val)
 		wmt_setbits(data, reg_data_out, BIT(bit));
 	else
 		wmt_clearbits(data, reg_data_out, BIT(bit));
+
+	return 0;
 }
 
 static int wmt_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 				     int value)
 {
-	wmt_gpio_set_value(chip, offset, value);
+	int ret;
+
+	ret = wmt_gpio_set_value(chip, offset, value);
+	if (ret)
+		return ret;
+
 	return pinctrl_gpio_direction_output(chip, offset);
 }
 
@@ -542,7 +549,7 @@ static const struct gpio_chip wmt_gpio_chip = {
 	.direction_input = pinctrl_gpio_direction_input,
 	.direction_output = wmt_gpio_direction_output,
 	.get = wmt_gpio_get_value,
-	.set = wmt_gpio_set_value,
+	.set_rv = wmt_gpio_set_value,
 	.can_sleep = false,
 };
 

-- 
2.48.1

