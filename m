Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B2617C79
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Feb 2025 12:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759955; cv=none; b=OUzdY/+zbsi2Wa7t9hHumEqQf/lErgO/PK1pvtf9jOItiuvxxK5jJSmZr3eAzwQAbw/0OOK7veMbhAvjhLwiQFYIu8gDJrnNX9F2ACz53RY72BqvHmiCNInxKlzFmBHd0GNUX2INrX31wewrLqn1VgrYKMFx9BpdiQW2dPyWIzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759955; c=relaxed/simple;
	bh=J+xMojpvOnH+y4xF0FQzAkneVDyy4UQzwkTwxNQpHZY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ErvDfqzaY/WpQk+iJvW1AacRz8eMljJM6y/RrDKQ+vHnVEmT5sRMoW/Ym6cse9QYOUj0r7hn6TJNcj0PmmZfdzr3D3p1OL0mox2YTQF3f2g+8RB/TbwE6U+OroVGk1aMY6G3FxNnbrZQBX/Uo7zebl9bo2vHmuSPAh6cfu0HNaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lT6Lk9My; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lT6Lk9My"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5dca451f922so6548976a12.2
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Feb 2025 04:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759952; x=1739364752; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgfFrjRxyOW1xOgdcC7mwiMGS+SjeOrC7s5Z2O3ZWyY=;
        b=lT6Lk9MyBLhovdL8/1Kla4HXNp4nUohW481Tx6iLe1vslcuBDgDsn/lMsRjMJfFJ5o
         s1SfpdB+P1ClMa056hHXQ8CDrbTbPhTHnBdKmuqMDHW53scg9fk2QnDZ1La/hguLIoS9
         IBuAc/8JU8O5NlINhnFwJaG2DpivFsFh2AdQKfhgtYoaIRwKJDDoHClhPBzrDQ8PCsGT
         BSxwubVb+4i6qDWvIKdRcH8bA2LXxv6lzScVxXWrvaPhjnLtn7nCq9ME/WMiWiRnrmhf
         5Os6U2XZrMQsx7AFgor6vpx2it3rMRyUAzCdPim4GEhvraCGy7jeT5xfDJRreldCP63a
         I5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759952; x=1739364752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgfFrjRxyOW1xOgdcC7mwiMGS+SjeOrC7s5Z2O3ZWyY=;
        b=UszYTwxhAk6YOtMrcXtDQCqOrMcZu9qYIqn+STQK4ulvzrHWFJPeTParBgAd0Xn53z
         1jH+Q4zdivhTtRac0dOflhUuvVffIfIcwMiq5eax4W8LyfplnmzUCMmJRup3xZk/s8lV
         /wQkCXfdgBNePCuBO0JfDPAa299a5oZwQnnm+A8glnDDsIMdspJS0IxgIIKbvmGUsUOr
         ZYrF7kADQ4uvvVhoBO59NqgIMJFmfam012kbylVRKc505/9YlA/RK68rP5PjFtQu+JKf
         42fiul3kmKL2QgYPZxw3V7EXWtFfWPCBhcaAEntX6kcyHfoemswYamHsMr/fjqt0Qklg
         NsRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG4OQKZL8LWfyy61MjYfuHd3aaqWW7N0rRwaq5TERgAzMv11W18PKUjhom3RW0AOzGt1xV44kuvG5HAw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaLPPPDo+eKSwUe2ML7YPiqJLOymssH9xmzwED7uWskh4W4eDz
	O1Qi/Pg/r2kUou3PASCL23AL1J8Uoo0VBxTAVZT1YyQlqYd+T+gJIT6ErKZ9
X-Gm-Gg: ASbGncvYjCRWw3uWL4F3HtZ9+LKaJIIlLwgK/+ALBoeXukpeBBumQS2+uP2eZg2VcqU
	rPRzwpg85C6DYuuWizEeELxpYYBZDjMfsrxdL6W0hfof6EZbll54eNOxHEF3flhnD8ZRdJNVsnw
	P7GJ8SX/z5c3/dlhyTqoLkFfqzQayWVCT8CzXdHLKJ4tBQPce5EJLbfQRGqI4jEKw8xLwog334o
	lo9YiMs+yfYBhNXdRm0oVSc1HD7jgY+w3ySEzsf/fFp/uCleqBIT9PihndQIVJMpE1gUFQOQ9UU
	ZVh7QxLSji96pzfiHdrryBxG7/b4IWinsaht6ANnJzNDhw==
X-Google-Smtp-Source: AGHT+IEAbQlJM9YpeCWJhaXrMd8JjdEQmk1PIGdg1MxSU0j0zzL77t1J5QeVhoIykZ9fWSW5KttwGw==
X-Received: by 2002:a05:6402:350c:b0:5d0:b51c:8479 with SMTP id 4fb4d7f45d1cf-5dcdb7179ccmr3428449a12.10.1738759951997;
        Wed, 05 Feb 2025 04:52:31 -0800 (PST)
Received: from localhost.localdomain (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724055e5sm11559997a12.45.2025.02.05.04.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:52:31 -0800 (PST)
From: Andras Szemzo <szemzo.andras@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 02/10] pinctrl: sunxi: add driver for Allwinner V853
Date: Wed,  5 Feb 2025 13:52:17 +0100
Message-Id: <20250205125225.1152849-3-szemzo.andras@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250205125225.1152849-1-szemzo.andras@gmail.com>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The V853 family has multiple package variants, from BGA to QFN88.
The latter has co-packaged DRAM and fewer pins, and less features (pin muxes).
All family members can be supported by a single driver, as the available pins
with allowed muxes is the same across the devices.

This new pinctrl driver depends on the new sunxi device-tree based mux support
patch series [1].

[1]: https://lore.kernel.org/linux-sunxi/20241111005750.13071-1-andre.przywara@arm.com/T/

Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
---
 drivers/pinctrl/sunxi/Kconfig              |  5 ++
 drivers/pinctrl/sunxi/Makefile             |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c | 53 ++++++++++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index a78fdbbdfc0c..fac9c61039e2 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -81,6 +81,11 @@ config PINCTRL_SUN9I_A80_R
 	default MACH_SUN9I
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN8I_V853
+	bool "Support for the Allwinner V853/V851S/V851SE PIO"
+	default MACH_SUN8I
+	select PINCTRL_SUNXI
+
 config PINCTRL_SUN20I_D1
 	bool "Support for the Allwinner D1 PIO"
 	default MACH_SUN8I || (RISCV && ARCH_SUNXI)
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index 2ff5a55927ad..8937b56b2ef4 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_PINCTRL_SUN8I_A83T_R)	+= pinctrl-sun8i-a83t-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_H3)		+= pinctrl-sun8i-h3.o
 obj-$(CONFIG_PINCTRL_SUN8I_H3_R)	+= pinctrl-sun8i-h3-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_V3S)		+= pinctrl-sun8i-v3s.o
+obj-$(CONFIG_PINCTRL_SUN8I_V853)	+= pinctrl-sun8i-v853.o
 obj-$(CONFIG_PINCTRL_SUN20I_D1)		+= pinctrl-sun20i-d1.o
 obj-$(CONFIG_PINCTRL_SUN50I_H5)		+= pinctrl-sun50i-h5.o
 obj-$(CONFIG_PINCTRL_SUN50I_H6)		+= pinctrl-sun50i-h6.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c
new file mode 100644
index 000000000000..fb2112ee12d0
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-v853.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Allwinner V853 SoC pinctrl driver.
+ *
+ * Copyright (c) 2025 Andras Szemzo <szemzo.andras@gmail.com>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-sunxi.h"
+
+static const u8 v853_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  */
+	{ 22,  0, 12, 23, 18,  7,  8, 16,  5 };
+
+static const unsigned int v853_irq_bank_map[] = { 0, 2, 3, 4, 5, 6, 7, 8 };
+
+static const u8 v853_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG  PH  PI */
+	{ 14,  0, 14, 14, 14, 14, 14, 14, 14 };
+
+static struct sunxi_pinctrl_desc v853_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(v853_irq_bank_map),
+	.irq_bank_map = v853_irq_bank_map,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+};
+
+static int v853_pinctrl_probe(struct platform_device *pdev)
+{
+	return sunxi_pinctrl_dt_table_init(pdev, v853_nr_bank_pins,
+					   v853_irq_bank_muxes,
+					   &v853_pinctrl_data,
+					   SUNXI_PINCTRL_NEW_REG_LAYOUT |
+					   SUNXI_PINCTRL_ELEVEN_BANKS);
+}
+
+static const struct of_device_id v853_pinctrl_match[] = {
+	{ .compatible = "allwinner,sun8i-v853-pinctrl", },
+	{}
+};
+
+static struct platform_driver v853_pinctrl_driver = {
+	.probe	= v853_pinctrl_probe,
+	.driver	= {
+		.name		= "sun8i-v853-pinctrl",
+		.of_match_table	= v853_pinctrl_match,
+	},
+};
+builtin_platform_driver(v853_pinctrl_driver);
-- 
2.39.5

