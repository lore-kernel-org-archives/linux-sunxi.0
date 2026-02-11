Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32BB346E7E
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Feb 2026 03:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770780788; cv=none; b=CYEKRFIDj8MiO/LTCDLFcJ2O4CjvdKoEdcNF4A8QpJQca80OOCLpWx+/fcwR1tN5nzUgWa34AvGLJzJMhnVN6wslQg5W/XAPC2Z7pYlSOx4TezrhouNrzzqFF/dIEYtGA8mi03r1slSfhloGA6vwPCyIK9IQ0of3IM070KgA40s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770780788; c=relaxed/simple;
	bh=3xxyAdFQ4zfemGIKkRYTysU+0s05CvAtJ9iA4ZUnhvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JFfrer+9yBt1VAayhbya7wyUubmy5C4t9vTpY9JwXyH+vK57Bm3s7TX7qWW+Iswx6J7ICNeP+fEwdf7ofhSoQCAT8i/GEsJvq/7nIMUYy+mDeM+PsWSZr/l+ThhHXyYusBA0UF6jjkAGxqX7JkRj9hTV4p/sfceXGkOBCzCWXaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bB5/nQ8m; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bB5/nQ8m"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7d18d02af68so4408485a34.2
        for <linux-sunxi@lists.linux.dev>; Tue, 10 Feb 2026 19:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770780785; x=1771385585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lqL9RDMHFR3WoHQnRB4Y8oAV8tGCe4j0xxAYm/MQPvM=;
        b=bB5/nQ8mRYd+L4nbfm61mmqzKha87qr4js4RMkpUTEGZbSb6eYyH6ix7xhl1BcgPmz
         IrUL87/LxKaK/XChaokkc6mcG0hgAcUxX9lgGpYQv1v+m6F2HXBJOHa3ELO18p7aEv5x
         OY72brXWtuTGabBn87yJIQw2xbZW9MzUEqIUnlRKyQ5V0PmB8C3QhhK0mMVKLLO+Z7xx
         0Qn95YDO0x9dTtfSAAOboWqu8fNaSZdp7/SpdvKqM4Vnc83aBjmrzYtGWWPvX0KyNpc9
         FIsVcmWim7r6V7ySBuOQO1GnAA8Z4f3wJD8C7V7GFWw8Hb3DVx7naHABcz22qfHDv1y3
         lryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770780785; x=1771385585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqL9RDMHFR3WoHQnRB4Y8oAV8tGCe4j0xxAYm/MQPvM=;
        b=eFEGi+zoFsxNrXLzmGteWyCa4m1g5nHVo8UlNgy17gHlPPTD2d7nGh5wquEFSJA59A
         8ex46g2cCeKUKM1Wd1GnmlEdO0zQADomaO/LtejNNdMpEAKptbbjFKslVrlod9IGXBmO
         PziopjeOAqchze+Xo+CM/+Dq9sca6PUk6C0O/xzae3n34zVlQ1GvOrLw0faB7k8XE5Wv
         RQHseKFO94iFJbjKt3zRunXJPH5xT7cPZQSnCqJV0F5C/7jRy6X4guqTjUjik5BCk5Iw
         2eVRuVxprc//dQq5wnC+TrjUKn3+OBI+GuPOdmMY54BDot0sjfXPADf9OcUGBZc0yoRN
         wMvw==
X-Gm-Message-State: AOJu0YzB9BcX7Wx97r4T7GTs4pGoobQ5sE7IflDtTtbHRcgDjfE4grzp
	PKT9YopSRnuxr58itMEHIDlJOJ9la18moR2eFh6gHLxx64ucTDcFd8aY4pW24A==
X-Gm-Gg: AZuq6aIo1P7wK7bsqf9SdcZNIWyaRUIrl/wYp5XgOF3EwtblSZkHtbrz3xjP3UppH/W
	7Q38hnmCCKmkIOe7hs/juWtBUhSAkvorbpUaxJ2zsJCWuiYc+eCZnVG5ngPIPJ2MFQ1Q8HeGWHM
	wVvK6APK+bxazYCGxC1XQIXwXPMapDJWJgTsOUK2+7SDLkL7FHzkHJJoacmeSrhAs1VoAcUxgVW
	9RLeSJpPErX0VDhVs7f0beMdQ1h2zOY8ui2FDU9+bBumuOE9SrEImL3KQjJXvpjWU2QXyiZ+sZc
	GoIXRijiJsJCoylK6bLMp9trLl8PwfI6IDPgoAaosuoMnRxtFgN9sBvvRLul66w+5VDOh+Eczv7
	QlyqUDnqAddz6jYKR+u42VKnvW14XJ3iq2QaK7aEFmfcvBhDYyV9A+x7JR29FIO8/s6Wn1yclp2
	lbHGnANvFQwKGclW4bRm6WZu2lo2qu/4jhpuL4Eso5lmmFhWnee8tjXF36672X/08Fb6Pwy4R5P
	LfJlICroVS+zarfDYju1gN5eMvwkNpZOvuDE4tIXX4i7dSTcjf0EJNZmiRuNcs=
X-Received: by 2002:a05:6830:4494:b0:7d1:586a:32a2 with SMTP id 46e09a7af769-7d4a73cc7c1mr381970a34.0.1770780785557;
        Tue, 10 Feb 2026 19:33:05 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-26.hlrn.qwest.net. [71.218.105.26])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a75309a6sm438236a34.3.2026.02.10.19.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 19:33:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-sunxi@lists.linux.dev,
	linux-gpio@vger.kernel.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] pinctrl: sunxi: add GPIO get_direction callback
Date: Tue, 10 Feb 2026 20:32:48 -0700
Message-ID: <20260211033249.2770281-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement sunxi_pinctrl_gpio_get_direction() and wire it into
the sunxi gpio_chip setup.

The new callback reads the pin mux register and compares the mux
value against the pin descriptor gpio_in and gpio_out functions
to report GPIO_LINE_DIRECTION_IN or GPIO_LINE_DIRECTION_OUT.
If the pin is muxed to irq, report it as input.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 0fb057a07dcc..424f23be27b2 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -995,6 +995,37 @@ static int sunxi_pinctrl_gpio_direction_output(struct gpio_chip *chip,
 					    chip->base + offset, false);
 }
 
+static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
+					    unsigned int offset)
+{
+	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
+	struct sunxi_desc_function *in, *out, *irq;
+	u32 reg, shift, mask, val;
+	u16 pin = chip->base + offset;
+
+	in = sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpio_in");
+	out = sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpio_out");
+	if (!in || !out)
+		return -EINVAL;
+
+	irq = sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "irq");
+
+	sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
+	val = (readl(pctl->membase + reg) & mask) >> shift;
+
+	if (val == in->muxval)
+		return GPIO_LINE_DIRECTION_IN;
+
+	if (val == out->muxval)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	/* IRQ function is effectively input. */
+	if (irq && val == irq->muxval)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return -EINVAL;
+}
+
 static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
 				const struct of_phandle_args *gpiospec,
 				u32 *flags)
@@ -1603,6 +1634,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	pctl->chip->set_config = gpiochip_generic_config;
 	pctl->chip->direction_input = sunxi_pinctrl_gpio_direction_input;
 	pctl->chip->direction_output = sunxi_pinctrl_gpio_direction_output;
+	pctl->chip->get_direction = sunxi_pinctrl_gpio_get_direction;
 	pctl->chip->get = sunxi_pinctrl_gpio_get;
 	pctl->chip->set = sunxi_pinctrl_gpio_set;
 	pctl->chip->of_xlate = sunxi_pinctrl_gpio_of_xlate;
-- 
2.43.0

