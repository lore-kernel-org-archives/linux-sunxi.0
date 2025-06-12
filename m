Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248BE248869
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Jun 2025 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734134; cv=none; b=gbH2KkJxpCM0sHXP1v8s8CDPQyrW7b0qN+X7URd3GRwv8I/YjvC+S9WMqUPFamYOw+RTPuErYNCtSfo7x86nYs3K3nHJW0DjaATOXD8npUNY7+sWNudXetgT21Ij9jwXwpKPZMle0RxqyAF7A1VI+blR43IiGs3nEEEmX5rETnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734134; c=relaxed/simple;
	bh=DCdQEcUDLTTl1/hH+Diq9E/bx+GpQ/RAE5sx+LPA2K4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cS3u8+A6vslBkgzdyde77vd4QYnEJGTrzVSqy2XefORXIgyzNHpHDNSXeHe145GIVpGzEqz39YWQeJx8kmofExNWWLFLKySF5rOmqO6i8ZlVA6ZTxtmVAPmr3K0FMjLw2ezTVeVRhF/b0zT82x/fs4FWNTZJTDDU5MYjhtuigX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Gi0FHkoS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Gi0FHkoS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451d7b50815so7690555e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 12 Jun 2025 06:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734130; x=1750338930; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddos4D+qX7/1EnT+iqN5KagM9V0p0W2P3w/4kWY208s=;
        b=Gi0FHkoSMvTJnF6jS317p1VlvUyDtX5gfUdOa+tE2mvPZX3UzrD9Gwx0Zy98ebbWKb
         OB/6hB9OFaiqwUHPKtFQ1PaKKQq54Ht0QOFScXxx/i1SWVBPcmtRX4D9CciBDHrmjwmn
         vzVGuswJkMhr0hpTRvnEvVk0EHn+ENjOkeVYwiF2cJtoTMiCOEZNUoEody1EaMR4Pj24
         ISdFyXzqGc2CPvKDHL6LS74kD0fDq9uMW8a7/LEh5lGNc3K5dJpUcB+qQcEFRa4hY0ad
         IAOFIWHTlAx7TQvTA0ejrgSF+mzp6h2OwX9Myde4o6m6bUM7xZ7Qr/cAOv8uwICZl2ZP
         KBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734130; x=1750338930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddos4D+qX7/1EnT+iqN5KagM9V0p0W2P3w/4kWY208s=;
        b=mfBEqRdMqbOgVqUWEXihS8CVZRUYR8YeLYlSwnXlXp9Iv72AWHwhJ+5KrZjbYYOSwy
         KOnB2gacg8/GyAREY5o+3zAGIQuNpzxOjH3htwxH44+nMl1wcc3eITv7We2GYmsKic45
         zefW/G4HtqHWrMc8YQsGQe/Qg/GBe4aJPbfjqiK+mbkQIxsE0tKvuIcaROHNUnf24dqW
         198vEZj4asH+4bXhZQXj/445CdlPe5rCQlMpsiEyJ3lnGFzf/HKOJfpcZ7kugofHASaO
         sSMcA587sk3JbQbygf+kVJLP95e2i/n2zWGYHlnVA3IvPZkSYrMI9xiWeg4p+C0x0Jf/
         Q/hw==
X-Forwarded-Encrypted: i=1; AJvYcCWjwCIwUNh9fbzxyQb/WVIRQkrXGyF+5bXEkC1YO0KJ43Bsn5slakVxErXdwkid+zksc1Xq3u8GK2lksA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOrGLznvKl+hPDNq5und6Qdc4JrgHwIn3jA9A1+th6riLlsVHH
	MY5hYjWggsJEvqgOTLNOyaNLWC3zZPFxrpuSDzrpayyF3wqjqlwXMEy3Ck+EnscToVw=
X-Gm-Gg: ASbGncujJd8fU+ufafmYKMzJW3txLcmg7EhdCGdlW4CMoZAL8mQWQ+63TA3p5FhKlTu
	/OimceUSgtBCAMGlhzCBlQPzbAcNYZQKJeTs0YfATIzcsRzBObpAZ/xKF4ah61y74MWnlWbw2Re
	lsvbpa8jzJ7iAm3goWa0wJDb/DOG+SjeRhhrfj4UDKi776lPwrG8vU1ZjfPkIfgcOOTjedlDmaX
	BevSh+9WK5CChjveOo8hnjVaJNVXFmFQADQt8e/43RfUIoxTh+8w8BTzmZEDo+7mEvSV7UZ2Rse
	Zq1p1I/PALjXP+IFkVZq2G+cUia6qPcWugAzPKPm38ctrHlpamBFoN0=
X-Google-Smtp-Source: AGHT+IEjm92mzG6iTvPU0aaqMJR5tJjcC1kKUVwpXp7/ZRJdx/YJfK1/AxyJNMPRaZiUgO8dI0ZM0g==
X-Received: by 2002:a05:6000:18a2:b0:3a5:3b56:974e with SMTP id ffacd0b85a97d-3a560694b22mr2626108f8f.6.1749734130365;
        Thu, 12 Jun 2025 06:15:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:17 +0200
Subject: [PATCH 08/16] pinctrl: xway: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-8-556b0a530cd4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=83dVwDjCWymw8bEavhDOHIM+hxScalMSI8x7KJC7tWY=;
 b=kA0DAAoBEacuoBRx13IByyZiAGhK0uWivjkySga8kTnFeUwUE68bmLo7YM/dAt6M6sI+TJxUj
 4kCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJoStLlAAoJEBGnLqAUcddyEcsP/0U/
 lQ+/N8a7qZ3Y1MwY7dHUJKTAx5Dfzvi0QNp3MMjqS8cvsbF+baaAXMW8ngmt+x64NWoYANmZ6bH
 1lRgsQ8pUweyVIBotIf0V1huvpTG5o6r6v6jVRpqLWw6OTMlDXHFcbpZDl9MFXQm1LgD/gNqkaR
 pOAY8yWvG5YXJGzz5PaZOxE8Dn81QWKgYwJh0kY4qgqOrIy5eefHE0LjmtWWWvlpkU3unM5uTWa
 k8Rw37a2U49NeIX1dz7lM8O7RicIdC/a8YqDuRkU99HRBPnMawH93t9cSlWVVqi3rEzt9nMMlZn
 8YZVHGwgC2TaJWyVzd+3zMJy2wqx94f4WFgCMk7oK98TbH6VaT57g3qyYorVUBPJ9DuYeiHN3Kz
 0VXawdCFHV4VwHWhX13VnGIo5tHIFn1PCQxKz6LysoKHrvPDXKdvVduU3lAOX9d4IUiND4hUSPx
 6kD6UrXqaS9XCdctmTZROU1jqUSo+jSET9EqeIsb/TfqSdc7CBrSiyFIKaTXDZNVF0WAhJA8rN1
 yANcZDYks4P2EiL/bRon27uP/947tNFjIXoY4QHGBfTBfi9DSQfyCoIoLs0SbXbofzs4A74Bxgm
 PE5Q269V5ir7Xb+83MPmRPLy4bK/9pOzT3CdEFZfGMhdoZZ9bpHDY0j6tS3nlEPrf6rllqjrk3V
 U+5o7
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-xway.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index 02e65d25e72911b812446ad4b90bfd611c9c1714..53c6c22ff24d752ba66bdd8d46c860bfd9a93731 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1293,7 +1293,7 @@ static struct ltq_pinmux_info xway_info = {
 };
 
 /* ---------  gpio_chip related code --------- */
-static void xway_gpio_set(struct gpio_chip *chip, unsigned int pin, int val)
+static int xway_gpio_set(struct gpio_chip *chip, unsigned int pin, int val)
 {
 	struct ltq_pinmux_info *info = dev_get_drvdata(chip->parent);
 
@@ -1301,6 +1301,8 @@ static void xway_gpio_set(struct gpio_chip *chip, unsigned int pin, int val)
 		gpio_setbit(info->membase[0], GPIO_OUT(pin), PORT_PIN(pin));
 	else
 		gpio_clearbit(info->membase[0], GPIO_OUT(pin), PORT_PIN(pin));
+
+	return 0;
 }
 
 static int xway_gpio_get(struct gpio_chip *chip, unsigned int pin)
@@ -1328,9 +1330,7 @@ static int xway_gpio_dir_out(struct gpio_chip *chip, unsigned int pin, int val)
 	else
 		gpio_setbit(info->membase[0], GPIO_OD(pin), PORT_PIN(pin));
 	gpio_setbit(info->membase[0], GPIO_DIR(pin), PORT_PIN(pin));
-	xway_gpio_set(chip, pin, val);
-
-	return 0;
+	return xway_gpio_set(chip, pin, val);
 }
 
 /*
@@ -1354,7 +1354,7 @@ static struct gpio_chip xway_chip = {
 	.direction_input = xway_gpio_dir_in,
 	.direction_output = xway_gpio_dir_out,
 	.get = xway_gpio_get,
-	.set = xway_gpio_set,
+	.set_rv = xway_gpio_set,
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
 	.to_irq = xway_gpio_to_irq,

-- 
2.48.1

