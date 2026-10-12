Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8AA46EC7A
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799788; cv=none; b=lT7yXwLJYD3xk8MDE+QgYpcJuvdNbDCXrG3eeVtVEMypIM1MhPnLMY/N3pMcq9t5Tz5S9lYpivZTSs0e2arD2zQPXHkYXgsq6S3+Cq36Epr7/0b9Sk0LBrur+0+1Y1I0wZh7Tpo7s679mTi+JpxSZGYbTo4sCJ/60scwovWCpVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799788; c=relaxed/simple;
	bh=AcDqqpUvQPtp2r2+5XU1PHfYoNql0A6LEGqhcq1OH+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mSJDHpncmwuzNdCdNCnFa+L/WG2PBHeLuHeaq3tEBWe4Mb2i6mfkrODcaimOPpW+lYrpGjIf28Oro87qgxLxcExPasnlDr677hCXH6DTuna9C67LwarzZUy1kWaxDGw+/sU0ORHoEcCNNorXgcst4/yhFdpnzX2Mvmn6WGzIT/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQfHLGZd; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQfHLGZd"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so15520215e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 03:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799775; x=1792404575; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNojFJwmE0oVprdqqjx/OIelZ/6m6PVyF1/QNYvXH3o=;
        b=YQfHLGZd2qf3v7G4HCeqG1rA939mDg3owaGgDtQ2mjguTm+niNX2vUhba9dFhmlpDi
         z0mtG926VynX+a4xVixMoZ21bM1Jw1+2h/8lapv93RlDUeusG6Y5n3No0CfT0bIgPeZE
         zEPpB5SvglUEn8DP+aMRhkOqdQru1T6EJJPb/UWAp8MdSb/dRj28R13BH95JS0BdE5Dm
         XJ9rYUj4plmY9U5JQmW75TnKnd4QClP8HZEi80G8s66C4LPjM7qgqb929SfXy41PHFi1
         9/Jsp9oVzrtRI6Ch17YanKm934QAX1LDVjkRlfIZDa2KdF5WWcIWiR4SLHIRzu/JWd1F
         MCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799775; x=1792404575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNojFJwmE0oVprdqqjx/OIelZ/6m6PVyF1/QNYvXH3o=;
        b=lfRuNeTHcV8xG/9OUNNjV5xhgif5V93YNquzBNcxBSAbGMb97ljRHSHrQerElKUu+X
         gcY46YcRX15CgM5mQGCA5NvKZ2W79eudk4EtE6Y5v9aQdMB62B1lA7BSx8aH+jU2LI89
         tHhq2GwgmvJLJMwCh9bJ/LPxe7/851RcoPPucA1TnUtYXw363NJwoaB5wufGkbzp4kjM
         ecmj5MYcw3qldDXZ12LNbtOYDTaiMy+U3OVXQIsTA+dy+ASp6EkWxfk0dXuwKJSijOPK
         QqOtILzhIwSFjfaOoFN5FE17EalwfvksFZb8ZmQDrEnEhEU5THp3uHZTViNoNxRIr+CF
         50CQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4LCs5cBrbKkZBOatcHRihw8c6VEJBRRHm4SqHTmknP04vKMHfU813YOdseAKNAS62aqB/arf8rYYsOA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJbZKEoBVv8Wny2azjlhJbdrgyK9WsEA8PxDPr5LlofulwGfKK9
	+NoXao6sYxUdw/RyGKZcASWr1n4OCyC8C83Rh1RahsTKtrfetn9+5PIV
X-Gm-Gg: AYBFou12bKOGwDelEuTOuknn63d+1SQzNJXNsuWJdVTDsf963pIZaZId8blOW/zn5NP
	8TGJ0sAxAJt1/MMK/6z5joArDUrH9oW0j3H4c4bblKOy3S6Hv0eapzb96HoywWYqqMfCiXHpffH
	qDvKXeinm5s77Zn2yLizbXJuU7yHU4KyvRAFtUvneQzDmKPq/xsodVHq0YVCv/QFKZJtvM5ZEw8
	Apw3lPUBkajIRflCKj9qOkg+kllf8S9Fe7gn+l/iiWuNtINb8rXGb3XmwOoTzUh4gjcWu/VugeX
	F7+r+3JkdqpZfzsLb1/uKRbYHJ89hd+RgWQRv3EODaWJ/73fFdwFkQniYQpmsF4k5CXfgIsfrR/
	cT1f7PixTIKB9ePeAy2qbuOBouWdaP6uZcPxeiCfDymfFsORRWo16R+TK+DIaPvFUayih3RX3Wi
	NJ3Zq/0gKC8A0STj6w79aoyMQ/QfLGm0MCJ23fCxhvvWf8Hsx1e7iC3PxHuhYm3Tnts58B3aVLW
	HqnnB9Sy6Q3PXRibQ7xrPV3WA/yiGok
X-Received: by 2002:a05:600c:3f0c:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a18e498471mr190194615e9.20.1791799775134;
        Mon, 12 Oct 2026 03:09:35 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:34 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 04/11] pinctrl: sunxi: add Allwinner B288 pin controller driver
Date: Mon, 12 Oct 2026 11:08:09 +0100
Message-ID: <20261012100816.331033-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
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

