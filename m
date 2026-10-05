Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B9A4E36D2
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Oct 2026 20:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232107; cv=none; b=s6m9q2ajtyEik9jah/NyYTW3CejOWwtPGh4RAtZp0drgDzFpTl4t2IVOX8a0bS/XnWpBc8BUVViZlVlLEiPEF5tr7222bO5X/5T09awo5tZjg9nMM/oOsbLLf6DreHDP69/P+xxob/hArU6GaOwK83wQMCKDMGL25CTPjP9tD/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232107; c=relaxed/simple;
	bh=AcDqqpUvQPtp2r2+5XU1PHfYoNql0A6LEGqhcq1OH+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dizg2il/5c+mYiThWvUQ82JeOKLDm7PmPiuJ2+BtriXY+iWyqb800eEajcuQR428MWuVSp9W/OJitYOLbVRKvrHIMG8PCHp7oWJ9RZU373gYCLZbw51JqRdRNdPcmtgEUt+AquCkcsgqU15qJn++TtTyzjlV8QtJdwLqMFivz04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddMtkMOg; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddMtkMOg"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6ab006eb282so3108542a12.0
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Oct 2026 13:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232092; x=1791836892; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNojFJwmE0oVprdqqjx/OIelZ/6m6PVyF1/QNYvXH3o=;
        b=ddMtkMOgDpZJuAu+zCzrAoF4B5Ds+zgP3D8ZwnxyT0y9KfQRpzhvUuaV1fRCM90YCQ
         vbnFEZ2R95RHTtgVh300AQtGfVSQX6vdx28HeegThXZXLzgEFNgZDm6JDGHnHLiEZ6Ah
         1o6clZn/rkQcXCM9B+KTXudIUUL5sersRq2ujksJdGS3I/TGrx0Nvf+wrFIEXmlleKHk
         ZDnyokCSX/C/O/kAUC1B6X23Bed0z3Af5F5+NYYuz6k6KFS1Bzy/1TwsFHsiqk0jtN/m
         IaDQ9FmhZBkJa9tAGFhklS0OLVk6OaYwz9MdIrrtmBlewGbFh0aIvpuK4npGTy1itILH
         Lx6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232092; x=1791836892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNojFJwmE0oVprdqqjx/OIelZ/6m6PVyF1/QNYvXH3o=;
        b=bDeMSZww+UHwY86bHurTN3bqx4rZXpymoITmAdZILWOR/FFxFI8+qRkFHer1NiGySX
         mg8lcev8lYOMjb7qZxeQ05XitVb0bzjNKvrMMbO7uTw5Ghvbbv/SCYdx3KSM5JEVYzvO
         avx4KxRCW/oz6b62XAq9lgzuEzSHPrzVbzzHzSPtKIJxttQkChu4KRxqq4pEnguoTfkV
         merp6hM1OOxMH4cuWd2eurbKB253A/AAVGjAliAEKFxigvx0AJDXYAKVH5kMIZRf32V/
         9I7pmnBa41nsbRPZ6uw6QxrL+/2TTnIHjhg04WVMFen60uPGCDbwVG5PSMl5rg0AQMrk
         nZJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxV0jmJ74RFuSOfC60tWlT1GnnnnBMdcb+2LT3RNrOb6DIZmu/sNB3kwAMxesjlUYwfWI1JHkQJqxU8rw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIWu5+xUElVGjDFoN3d1Qh0+ANso9ybOXOwyEVZbQ8wWprTY8K/
	cj3TfwENOlU4FxK6YGkEpkzXvD7RBuQaQ7FhAi1Js0498cmS5mgh2+iN
X-Gm-Gg: AYBFou1IEXWoCd2PVbhM1rxTL+nE4eZAk3WMKJSFZV3/InjSZrW6tkxwKBD+Ga2V7mA
	6Gq4MJairpC/nhyKznZMb02aDwBMMf7RhPoWGj1Y+id1WyFOuQalaY29B1oYxLRWLP80FuPdUGV
	IoM5vUhyy10wdm/3Wm9+MFTnKR4uaHMnbnm1EP2BTAdhBv/jThA3t5P0KYAugZcmMjZ2JGwtGXN
	wrvGf7e85h1pvbDFml2Vy64EXrLh1svoIw4qspqViYvRCxf8g7KZV5zycz5bZqXnIppi9U3gHs+
	yy7TARN+dSUif3dkSHfRn1J09O6DWKJsnt+dDpx5bsMIESUGeJBxd5HInJtdW30GyHW10KuzcMC
	EG5pyFLhPTrXK9KAKfZ4NgYcezpr8fIw/g+1AC1UQcTD9o0Uw0jmvJfWMmLF8Y6ZHcrhtN1ZlAZ
	lpUFD4T+H6pb9l16q1LlpfTiUYNgEEPwNkcChlqy56g3xoN30G6CZ/8I5coHoU92QLQDMVpwCqJ
	Ru6JxdOQyEX//g9dZGoP9f3F9KPZ/4a
X-Received: by 2002:a05:6402:274c:b0:6ab:8067:6a8a with SMTP id 4fb4d7f45d1cf-6afada12e14mr7642825a12.32.1791232092260;
        Mon, 05 Oct 2026 13:28:12 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:10 -0700 (PDT)
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
Subject: [PATCH v3 04/11] pinctrl: sunxi: add Allwinner B288 pin controller driver
Date: Mon,  5 Oct 2026 21:27:24 +0100
Message-ID: <20261005202731.153971-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

80 pins across ports B, C, D, F and G; the mux values come from the DT.
Port C has no external interrupts. PH0 is BSP FPGA-only and omitted.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/Kconfig              | 10 +++++
 drivers/pinctrl/sunxi/Makefile             |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c | 49 ++++++++++++++++++++++
 3 files changed, 60 insertions(+)
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
index 000000000000..f973c2b3f2eb
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Allwinner B288 (sun8iw10p1) SoC pinctrl driver.
+ *
+ * Bank sizes and the interrupt mux derived from Allwinner's BSP driver
+ * pinctrl-sun8iw10p1.c, which is:
+ * Copyright (C) 2014 Jackie Hwang <huangshr@allwinnertech.com>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-sunxi.h"
+
+/* PH0 exists only on the BSP's FPGA platform and is omitted. */
+static const u8 b288_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG */
+	{  0, 17, 15, 29,  0,  7, 12 };
+
+static const u8 b288_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG */
+	{  0,  6,  0,  6,  0,  6,  6 };
+
+static struct sunxi_pinctrl_desc b288_pinctrl_data = {
+	.irq_banks	= 4,
+};
+
+static int b288_pinctrl_probe(struct platform_device *pdev)
+{
+	return sunxi_pinctrl_dt_table_init(pdev, b288_nr_bank_pins,
+					   b288_irq_bank_muxes,
+					   &b288_pinctrl_data, 0);
+}
+
+static const struct of_device_id b288_pinctrl_match[] = {
+	{ .compatible = "allwinner,sun8i-b288-pinctrl", },
+	{}
+};
+
+static struct platform_driver b288_pinctrl_driver = {
+	.probe	= b288_pinctrl_probe,
+	.driver	= {
+		.name		= "sun8i-b288-pinctrl",
+		.of_match_table	= b288_pinctrl_match,
+	},
+};
+builtin_platform_driver(b288_pinctrl_driver);
-- 
2.52.0

