Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811A2535FA7
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 20:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194992; cv=none; b=d/R6pDfOWq6a87eiUGm7e60cd7iHGxWr+tZGLrxppRAecd8f34+8gJoEgIeoeb9PdLvt+UdO/7F+leKcSvXF9lHW04ScGmibYYv3Dizh09gDXFOA3UnM5Buc+049EFMCrAPD7utDqVc0oBMLa84t7R6/lsEcU3UBGKG5J/LjTqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194992; c=relaxed/simple;
	bh=dQ/yv3OWcpPrnBB7ezstn31Bg5XhAjz93YOeewJwVyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eh0V58DQeZJjvIWcV1N27zIxmYnzkL3XothOXGfqzxLXIHM0yeMc7wdSvRIu8ETvCF6EIIvzrBWanSkwMYmo114jbFgsRHY4qQJ18aPRDQCesedOWMYuItuJPbz0lMi6d6F5rw8Qz+BkCRxcMpPDRbPs+wHfq7pFygHGZIHfjBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbWgmB1W; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbWgmB1W"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c264788fd58so203125766b.1
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 13:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194981; x=1790799781; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I1gBoExOllz30AxRLmt2mRXZAZOAXGp6rC+PfUA8lEU=;
        b=CbWgmB1WflKNpzRPA0IAZ74x6YQoVsrraRi+lmFNixkfJgCQj0gpdgfhjr8Pfcpbjz
         Hv43DJjY8H8eymPzoeDTA0OgK44VXDttGrVwMht9eeZVtEtA6xLc0HX+EuWGjlURhFlm
         kfCCSf1xbPGcZZFwjA46rg6UpQhxtI3PdtdxCTeUSK60XKmrvLaep/8losMbhUV1gbFF
         LFiHltLarAEYdWF4Bv2h35ixQx9jnTbLDy/Ec7YMmdhP/+rFEZkBO6qs7efiUs8qWTcV
         qf9wnL9A6SehDy21+N1q7Vn36BcOeQwoqA0MVayXSnStNPWZc5wzIcFxSs6tm1JOdUSn
         Z3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194981; x=1790799781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I1gBoExOllz30AxRLmt2mRXZAZOAXGp6rC+PfUA8lEU=;
        b=R1DffBNTJr/aiZkA351D1oLFhMzu8n0/9WCNWIZX8kS4rJ/uYBMKzbG0HmRAHrNzMi
         dP/zoxYgOeGxUZJrYzSwtXBwaDOHiX1joME/cY7eCuhPlDnZQiEts0h/oaEbeUVQXVYP
         /fzOf7dYCfjiMyyt+gtmd9Q0IwDcTNwJdDznJSValWTgOhKgLXK+L5r1v9DFkrget/sn
         U+a3sjD2ovrA6MFUxy2ye+fev9yAriaPAjX/28V/nMT/3kOXEvds+pD3+/huHRPrDpZM
         jIS/8FiryaEvTSjYBDDIXI/ZcMzwzQetUpI+zdVSWLj07iCXBQ+PWgY/Hi7gECWAobbd
         ukKg==
X-Forwarded-Encrypted: i=1; AKwUvByRUGxwREY2BmFX1JbKMc935YB6uzArqgbTaRBXciDO95rDjr+l4MOg83MAvO1V/LjgE9NTV51NhF61CA==@lists.linux.dev
X-Gm-Message-State: AFuF++nrwi5sF3mR99ClJu3fe1kymg8BkA0PV+bBJNRIacFRPeJpFf9v
	Jt5Wj5DjGT6YnuG7W4dAfeILVzepzgJzFjvPLUFhqUgni2TC3T6EonpR
X-Gm-Gg: AYBFou3hh0UH6CBnxZIjwOWciQop9E4VNlmp+hg/TRxp15g/XroKDxvw7bxPufzOrdN
	T8t4e4tjhOQIJ7XRBEO6BasyKNOP926tkNNvGYFfIoYVd5PbsvKB2aSaSNMFdIXbVPlCIkyrAgY
	+S3jif2TtakZaMTstRNSe135JJylwjBX+CYupGrHlrDnJxEHVNVxOx0bQoeO6DYVI1tG8BA3wgS
	q8+4v0rMUy14KS1ir0ordhUiEZGyrCGH1g2XuwAQ/kmWibYMVSgQ2dQFG4VGmNsnnS0iPP8FeQg
	l7+UCEDMxjPA1qTGbsTbX4BmhrTiupxLp7zOGgJYvfVlmG5IIwbNaqrY6Y9+uR9us1ftru7lN5i
	p+e2BhmkAi3cHa+eX4rG0Gm93fO1Jtb2RhyvQJZEiI1apoigesb65A0qPNPuXaPQtN0dQGn0cMy
	UDuvX4XFo3GzuOcfgxs4xdtwrtxtvycEge8ph439rmYzuh+SdDvrr6/07ALwkVkxRi+GlFtMjvn
	YDycFE3Ae5PmALjrIVRrJWkNooKAqaS
X-Received: by 2002:a17:907:c30c:b0:c29:53b5:c69d with SMTP id a640c23a62f3a-c2ac22aaf81mr23824566b.28.1790194980777;
        Wed, 23 Sep 2026 13:23:00 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:22:59 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 04/11] pinctrl: sunxi: add Allwinner B288 pin controller driver
Date: Wed, 23 Sep 2026 21:16:54 +0100
Message-ID: <20260923201701.43391-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

78 pins across ports B, C, D, F and G. PH0 is BSP FPGA-only and omitted.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/Kconfig              |  10 +
 drivers/pinctrl/sunxi/Makefile             |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c | 623 +++++++++++++++++++++
 3 files changed, 634 insertions(+)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index dc62eba96348..a08186133090 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -56,6 +56,16 @@ config PINCTRL_SUN8I_A23_R
 	default MACH_SUN8I
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN8I_B288
+	bool "Support for the Allwinner B288 PIO"
+	default MACH_SUN8I
+	select PINCTRL_SUNXI
+	help
+	  Say Y here to enable pin controller and GPIO support for the
+	  Allwinner B288 (sun8iw10p1) SoC, as used in e-book readers such
+	  as the PocketBook Verse. This covers ports B, C, D, F and G,
+	  including the four banks of external interrupt capable pins.
+
 config PINCTRL_SUN8I_H3
 	bool "Support for the Allwinner H3 PIO"
 	default MACH_SUN8I
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index 951b3f1e4b4f..5129c0f19f3e 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_PINCTRL_SUN50I_A100)	+= pinctrl-sun50i-a100.o
 obj-$(CONFIG_PINCTRL_SUN50I_A100_R)	+= pinctrl-sun50i-a100-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_A83T)	+= pinctrl-sun8i-a83t.o
 obj-$(CONFIG_PINCTRL_SUN8I_A83T_R)	+= pinctrl-sun8i-a83t-r.o
+obj-$(CONFIG_PINCTRL_SUN8I_B288)	+= pinctrl-sun8i-b288.o
 obj-$(CONFIG_PINCTRL_SUN8I_H3)		+= pinctrl-sun8i-h3.o
 obj-$(CONFIG_PINCTRL_SUN8I_H3_R)	+= pinctrl-sun8i-h3-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_V3S)		+= pinctrl-sun8i-v3s.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
new file mode 100644
index 000000000000..ffd7eef68d19
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
@@ -0,0 +1,623 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Allwinner B288 (sun8iw10p1) SoC pinctrl driver.
+ *
+ * Derived from Allwinner's BSP driver pinctrl-sun8iw10p1.c, which is:
+ * Copyright (C) 2014 Jackie Hwang <huangshr@allwinnertech.com>
+ *
+ * Based on pinctrl-sun8i-a23.c, which is:
+ * Copyright (C) 2014 Chen-Yu Tsai <wens@csie.org>
+ * Copyright (C) 2014 Maxime Ripard <maxime.ripard@free-electrons.com>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-sunxi.h"
+
+static const struct sunxi_desc_pin sun8i_b288_pins[] = {
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 0),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart2"),
+		  SUNXI_FUNCTION(0x3, "jtag0"),
+		  SUNXI_FUNCTION(0x5, "vdevice"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 1),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart2"),
+		  SUNXI_FUNCTION(0x3, "jtag0"),
+		  SUNXI_FUNCTION(0x4, "spdif0"),
+		  SUNXI_FUNCTION(0x5, "vdevice"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 1)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 2),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart2"),
+		  SUNXI_FUNCTION(0x3, "jtag0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 2)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 3),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart2"),
+		  SUNXI_FUNCTION(0x3, "jtag0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 3)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 4),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart0"),
+		  SUNXI_FUNCTION(0x3, "pwm0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 4)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 5),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "uart0"),
+		  SUNXI_FUNCTION(0x3, "pwm1"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 5)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 6),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "twi0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 6)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 7),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "twi0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 7)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 10),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "spi1"),
+		  SUNXI_FUNCTION(0x3, "uart4"),
+		  SUNXI_FUNCTION(0x4, "pwm2"),
+		  SUNXI_FUNCTION(0x5, "wifi_uart0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 10)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 11),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "spi1"),
+		  SUNXI_FUNCTION(0x3, "uart4"),
+		  SUNXI_FUNCTION(0x4, "pwm3"),
+		  SUNXI_FUNCTION(0x5, "wifi_uart0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 11)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 12),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "i2s1"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 12)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 13),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "i2s1"),
+		  SUNXI_FUNCTION(0x4, "pwm4"),
+		  SUNXI_FUNCTION(0x5, "uart3"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 13)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 14),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "i2s1"),
+		  SUNXI_FUNCTION(0x4, "pwm5"),
+		  SUNXI_FUNCTION(0x5, "uart3"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 14)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 15),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "i2s1"),
+		  SUNXI_FUNCTION(0x3, "ac0"),
+		  SUNXI_FUNCTION(0x4, "twi1"),
+		  SUNXI_FUNCTION(0x5, "uart3"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 15)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 16),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "i2s1"),
+		  SUNXI_FUNCTION(0x3, "ac0"),
+		  SUNXI_FUNCTION(0x4, "twi1"),
+		  SUNXI_FUNCTION(0x5, "uart3"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 16)),
+	/*Hole*/
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 0),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),
+		  SUNXI_FUNCTION(0x4, "spi0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 1),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),
+		  SUNXI_FUNCTION(0x3, "sdc2"),
+		  SUNXI_FUNCTION(0x4, "spi0"),
+		  SUNXI_FUNCTION(0x5, "sdc3"),
+		  SUNXI_FUNCTION(0x7, "io_disabled")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 2),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),
+		  SUNXI_FUNCTION(0x4, "spi0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 3),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),
+		  SUNXI_FUNCTION(0x4, "spi0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 4),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),
+		  SUNXI_FUNCTION(0x3, "sdc2"),
+		  SUNXI_FUNCTION(0x5, "sdc3"),
+		  SUNXI_FUNCTION(0x7, "io_disabled")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 5),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),
+		  SUNXI_FUNCTION(0x3, "sdc2"),
+		  SUNXI_FUNCTION(0x5, "sdc3"),
+		  SUNXI_FUNCTION(0x7, "io_disabled")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 6),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),
+		  SUNXI_FUNCTION(0x3, "sdc2"),
+		  SUNXI_FUNCTION(0x4, "uart1"),
+		  SUNXI_FUNCTION(0x5, "sdc3"),
+		  SUNXI_FUNCTION(0x7, "io_disabled")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 7),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),
+		  SUNXI_FUNCTION(0x3, "sdc2"),
+		  SUNXI_FUNCTION(0x4, "uart1"),
+		  SUNXI_FUNCTION(0x5, "sdc3"),
+		  SUNXI_FUNCTION(0x7, "io_disabled")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 8),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),
+		  SUNXI_FUNCTION(0x3, "sdc2"),
+		  SUNXI_FUNCTION(0x4, "uart1"),
+		  SUNXI_FUNCTION(0x5, "sdc3"),
+		  SUNXI_FUNCTION(0x7, "io_disabled")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 9),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),
+		  SUNXI_FUNCTION(0x3, "sdc2"),
+		  SUNXI_FUNCTION(0x4, "uart1"),
+		  SUNXI_FUNCTION(0x5, "sdc3"),
+		  SUNXI_FUNCTION(0x7, "io_disabled")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 10),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),
+		  SUNXI_FUNCTION(0x3, "sdc2"),
+		  SUNXI_FUNCTION(0x4, "uart1"),
+		  SUNXI_FUNCTION(0x5, "sdc3"),
+		  SUNXI_FUNCTION(0x7, "io_disabled")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 11),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),
+		  SUNXI_FUNCTION(0x3, "sdc2"),
+		  SUNXI_FUNCTION(0x4, "uart1"),
+		  SUNXI_FUNCTION(0x5, "sdc3"),
+		  SUNXI_FUNCTION(0x7, "io_disabled")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 12),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),
+		  SUNXI_FUNCTION(0x3, "sdc2"),
+		  SUNXI_FUNCTION(0x4, "uart1"),
+		  SUNXI_FUNCTION(0x5, "sdc3"),
+		  SUNXI_FUNCTION(0x7, "io_disabled")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 13),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),
+		  SUNXI_FUNCTION(0x3, "sdc2"),
+		  SUNXI_FUNCTION(0x4, "uart1"),
+		  SUNXI_FUNCTION(0x5, "sdc3"),
+		  SUNXI_FUNCTION(0x7, "io_disabled")),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "nand0"),
+		  SUNXI_FUNCTION(0x3, "sdc2"),
+		  SUNXI_FUNCTION(0x5, "sdc3"),
+		  SUNXI_FUNCTION(0x7, "io_disabled")),
+	/* Hole */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 0),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x3, "uart1"),
+		  SUNXI_FUNCTION(0x4, "csi0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 0)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 1),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x3, "uart1"),
+		  SUNXI_FUNCTION(0x4, "csi0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 1)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 2),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x3, "uart5"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 2)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 3),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x3, "uart5"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 3)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 4),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x3, "uart5"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 4)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 5),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x3, "uart5"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 5)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 6),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 6)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 7),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 7)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 8),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x3, "uart1"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 8)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 9),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x3, "uart1"),
+		  SUNXI_FUNCTION(0x4, "csi0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 9)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 10),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 10)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 11),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 11)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 12),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 12)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 13),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x4, "csi0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 13)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 14),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x4, "csi0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 14)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 15),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x4, "csi0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 15)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 16),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x4, "csi0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 16)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 17),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x4, "csi0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 17)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 18),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x4, "csi0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 18)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 19),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x4, "csi0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 19)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 20),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x4, "csi0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 20)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 21),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x4, "csi0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 21)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 22),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x4, "csi0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 22)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 23),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x4, "csi0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 23)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 24),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x3, "spi2"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 24)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 25),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x3, "spi2"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 25)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 26),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x3, "spi2"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 26)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 27),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd0"),
+		  SUNXI_FUNCTION(0x3, "spi2"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 27)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 28),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "pwm0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 28)),
+
+	/* Hole */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 0),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "sdc0"),
+		  SUNXI_FUNCTION(0x4, "jtag0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 0)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 1),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "sdc0"),
+		  SUNXI_FUNCTION(0x4, "jtag0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 1)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 2),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "sdc0"),
+		  SUNXI_FUNCTION(0x4, "uart0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 2)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 3),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "sdc0"),
+		  SUNXI_FUNCTION(0x4, "jtag0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 3)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 4),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "sdc0"),
+		  SUNXI_FUNCTION(0x4, "uart0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 4)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 5),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "sdc0"),
+		  SUNXI_FUNCTION(0x4, "jtag0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 5)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 6),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 6)),
+
+	/* Hole */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 0),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "pwm6"),
+		  SUNXI_FUNCTION(0x3, "dmic0"),
+		  SUNXI_FUNCTION(0x4, "spi1"),
+		  SUNXI_FUNCTION(0x5, "sdc1"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 0)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 1),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "pwm7"),
+		  SUNXI_FUNCTION(0x3, "dmic0"),
+		  SUNXI_FUNCTION(0x4, "spi1"),
+		  SUNXI_FUNCTION(0x5, "sdc1"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 1)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 2),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "twi1"),
+		  SUNXI_FUNCTION(0x3, "dmic0"),
+		  SUNXI_FUNCTION(0x4, "spi1"),
+		  SUNXI_FUNCTION(0x5, "sdc1"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 2)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 3),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "twi1"),
+		  SUNXI_FUNCTION(0x3, "dmic0"),
+		  SUNXI_FUNCTION(0x4, "spi1"),
+		  SUNXI_FUNCTION(0x5, "sdc1"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 1)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 4),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "twi2"),
+		  SUNXI_FUNCTION(0x3, "dmic0"),
+		  SUNXI_FUNCTION(0x4, "spi1"),
+		  SUNXI_FUNCTION(0x5, "sdc1"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 4)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 5),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "twi2"),
+		  SUNXI_FUNCTION(0x4, "ac0"),
+		  SUNXI_FUNCTION(0x5, "sdc1"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 5)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 6),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "i2s0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 6)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 7),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "i2s0"),
+		  SUNXI_FUNCTION(0x3, "dsd0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 7)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 8),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "i2s0"),
+		  SUNXI_FUNCTION(0x3, "dsd0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 8)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 9),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "i2s0"),
+		  SUNXI_FUNCTION(0x3, "dsd0"),
+		  SUNXI_FUNCTION(0x4, "bist_result0"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 9)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 10),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "i2s0"),
+		  SUNXI_FUNCTION(0x3, "dsd0"),
+		  SUNXI_FUNCTION(0x4, "bist_result1"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 10)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 11),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "spdif0"),
+		  SUNXI_FUNCTION(0x4, "pll_lock_dbg"),
+		  SUNXI_FUNCTION(0x7, "io_disabled"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 11)),
+
+};
+
+static const struct sunxi_pinctrl_desc sun8i_b288_pinctrl_data = {
+	.pins = sun8i_b288_pins,
+	.npins = ARRAY_SIZE(sun8i_b288_pins),
+	.irq_banks = 4,
+};
+
+static int sun8i_b288_pinctrl_probe(struct platform_device *pdev)
+{
+	return sunxi_pinctrl_init(pdev,
+				  &sun8i_b288_pinctrl_data);
+}
+
+static const struct of_device_id sun8i_b288_pinctrl_match[] = {
+	{ .compatible = "allwinner,sun8i-b288-pinctrl", },
+	{}
+};
+
+static struct platform_driver sun8i_b288_pinctrl_driver = {
+	.probe	= sun8i_b288_pinctrl_probe,
+	.driver	= {
+		.name		= "sun8i-b288-pinctrl",
+		.of_match_table	= sun8i_b288_pinctrl_match,
+	},
+};
+builtin_platform_driver(sun8i_b288_pinctrl_driver);
-- 
2.53.0

