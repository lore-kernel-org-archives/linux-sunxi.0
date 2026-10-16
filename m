Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB23443E3B
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 09:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142231; cv=none; b=f1KSBoyfm/rxNJC0QrGvr5U69j6CcbTRCY1kiF8yGqyJgxxRnZZJBCklMizu2kCbwfS511RRsQ19U7I/3rOayCHHx8PCIF6quSrtpMF1CyWgmYfFjOxAbHAU61KsV55MjzKeXV9lAzXEoCU/SLvyLTFJDamJLR45w+1g9phd+Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142231; c=relaxed/simple;
	bh=LKNuin4QEQYpsvt1l9l/bOqEA7Fzza311iY9RZN9M78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZnvEplUtyzz/ssuCrXMQjdBHuJ10GO08tQO5WkNPYdXNJwhc+d5rOTGWUEuD6O/tWNYMY/7zR/Nq6aT7ukKgl+IGW/KhWbMHjcTGtYcnxI0Kxsio4p5tDi8PF2KP3T3SHnTA9vynodhE9h5xmLSQbCVYIRQIr1GkvRyrKiQLSjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IaJ6JdY0; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaJ6JdY0"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df4f540ebso956962f8f.3
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 02:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792142228; x=1792747028; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jzb1jPTx4Lu/VpK6gDrZCHItR5/gwrp2RWkpDE8o1GM=;
        b=IaJ6JdY07r7J/iWoj71yBgEUd06B6h3e8V4vtI4ctOpKaT2aNDhLfyo3F/TlVykKST
         5lo8j5aP9o2Zvud8pq+Kgf/GbVSaQV5gc+PD1E7WTV+EpvEPsrAgq8eUYUtTo8x+xL7k
         WSBU0p3QpvwQ5FsERt1tRh5GMDXVAfueNL1ex8KpM1KKzqPaYG7nndTsTqf8uzZdotGI
         r6/HNbm1qtXMjWV/NXqcv1232KtL9lSdryV2XgI/W8EhWK4pjfYCe5FB4gOvIP33A7sL
         LF4fXTPTkRrABBLEyP8VHEe5jEoM+iaUowjuMLC6sZKEPo27oXZHMpH4atJSzbiiVmNg
         20Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142228; x=1792747028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jzb1jPTx4Lu/VpK6gDrZCHItR5/gwrp2RWkpDE8o1GM=;
        b=Z3g7yQp7wsMlY/VYJYipd2DtK1iVetiCGjuX38S82euF/xWzOr+qcv2vWXkzYl6kr8
         o1U+lEOuIgMV9vzt7QORKin/zeX05U33IkYqso7ZpO1z/F8YazVSmoOtxQpWF0TvpdNa
         eEpF0OHzsOzN8IO6Uz+4nYWUVHDjvqLsceidxFW5tk3iOnITjF38tS1sXhhz9y/BxYOk
         5/i3SfsOlEOMhFGp4IM9RQrZf6nmwk4x8oimsvBe3APm0qt4/0R+1UbjaeUHTKnVV7Y7
         wYLdbLoOKxmJ5IYiyY1wv1Epyu02TT6beihJNDw+o/B+Is/EVZEfhCwDT8lms/28KJ4V
         RM3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxWjL/NmHUL/71g2Q/641QVU4oiUIJRjdHXD4AfOdmxtMdL7HuwsLPgl1tLxnebJfWyxI3HOuFWBlqBOw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLpXkyr0/EXJ2RqqnSW/ovQ6OtBgyK5OxTsM8AQjSYlGVTJ31Ls
	ZjBHoVN7Ikf75uqaIsFwyITcH5a4cdgLDWIJuyEfTrONivQXN//boOqs
X-Gm-Gg: AYBFou2DuHRP4oi+6Zi+YB0uTIeOw1VIqUPb9XfKfJjKEvYG/VtsVaxHc2L33uMUgDj
	CeBMURSRjJAtS/CoyZQqNvnPi/Fkk1OHZ3uqIAHW8DSV0AhXBW6h8wVVsgQft/fRNfAQxjEZ+m1
	y97W9+kX/IM4akQusBSybKhQdMwIcBCD9XVPFpj2RsmrdFZTvA1bBXtpZWPCJn4ybuQavgYkFJk
	YmFddIsNPTrNuAmHO+lUv1Su+XvkYIbsoeY+8GOlv+tU31y5pMsamX/3uGu2HsOQjPQUBdIndXV
	R39/7q9BQdZJ2yObPAI6inGojQO5wi5nmArBnr11T6UTsdWFqVUe5lAlrl4I8XKqRMaCW7WBAzR
	yeXcNh57moDhI0SOSs0dHQRJ++f0/UG5X7URoZTBXBS3pCUteMJnMJsA2KSDl6KrDCZRh4i0p4V
	85BC+rwW89kD82Q8GpGdM21YQOqzgotG05cdo6dtC3wUxRCzLsm06vhQL5nWY=
X-Received: by 2002:a05:6000:2209:b0:487:1575:ebef with SMTP id ffacd0b85a97d-48dbacf70c3mr41418713f8f.47.1792142228053;
        Fri, 16 Oct 2026 02:17:08 -0700 (PDT)
Received: from debian.tfbnw.net ([2620:10d:c092:400::4:7d8a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ee183sm3692331f8f.29.2026.10.16.02.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:17:06 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	u-boot@lists.u-boot-project.org
Cc: Tom Rini <trini@konsulko.com>,
	linux-sunxi@lists.linux.dev,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH 4/7] clk: sunxi: add the Allwinner B288 gates and resets
Date: Fri, 16 Oct 2026 10:16:05 +0100
Message-ID: <20261016091608.121842-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016091608.121842-1-pmazzini@gmail.com>
References: <20261016091608.121842-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bus clock gates and resets, as in the Linux CCU driver.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/clk/sunxi/Kconfig     |   7 +++
 drivers/clk/sunxi/Makefile    |   1 +
 drivers/clk/sunxi/clk_b288.c  | 101 ++++++++++++++++++++++++++++++++++
 drivers/clk/sunxi/clk_sunxi.c |   5 ++
 4 files changed, 114 insertions(+)
 create mode 100644 drivers/clk/sunxi/clk_b288.c

diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
index 1c1cc82719c..e4fe6f63626 100644
--- a/drivers/clk/sunxi/Kconfig
+++ b/drivers/clk/sunxi/Kconfig
@@ -52,6 +52,13 @@ config CLK_SUN8I_A23
 	  This enables common clock driver support for platforms based
 	  on Allwinner A23/A33 SoC.
 
+config CLK_SUN8I_B288
+	bool "Clock driver for Allwinner B288"
+	default MACH_SUN8I_B288
+	help
+	  This enables common clock driver support for platforms based
+	  on Allwinner B288 SoC.
+
 config CLK_SUN8I_A83T
 	bool "Clock driver for Allwinner A83T"
 	default MACH_SUN8I_A83T
diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
index 93b542cebcd..4f278ff551a 100644
--- a/drivers/clk/sunxi/Makefile
+++ b/drivers/clk/sunxi/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_CLK_SUN6I_A31) += clk_a31.o
 obj-$(CONFIG_CLK_SUN6I_A31_R) += clk_a31_r.o
 obj-$(CONFIG_CLK_SUN8I_A23) += clk_a23.o
 obj-$(CONFIG_CLK_SUN8I_A83T) += clk_a83t.o
+obj-$(CONFIG_CLK_SUN8I_B288) += clk_b288.o
 obj-$(CONFIG_CLK_SUN8I_R40) += clk_r40.o
 obj-$(CONFIG_CLK_SUN8I_V3S) += clk_v3s.o
 obj-$(CONFIG_CLK_SUN9I_A80) += clk_a80.o
diff --git a/drivers/clk/sunxi/clk_b288.c b/drivers/clk/sunxi/clk_b288.c
new file mode 100644
index 00000000000..505fa27f83a
--- /dev/null
+++ b/drivers/clk/sunxi/clk_b288.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Allwinner B288 (sun8iw10p1) CCU gates and resets
+ */
+
+#include <clk-uclass.h>
+#include <dm.h>
+#include <errno.h>
+#include <clk/sunxi.h>
+#include <dt-bindings/clock/sun8i-b288-ccu.h>
+#include <dt-bindings/reset/sun8i-b288-ccu.h>
+#include <linux/bitops.h>
+
+static const struct ccu_clk_gate b288_gates[] = {
+	[CLK_BUS_DMA]		= GATE(0x060, BIT(6)),
+	[CLK_BUS_SDMMC0_BUS]	= GATE(0x060, BIT(8)),
+	[CLK_BUS_SDMMC1_BUS]	= GATE(0x060, BIT(9)),
+	[CLK_BUS_SDMMC2_BUS]	= GATE(0x060, BIT(10)),
+	[CLK_BUS_SDMMC3_BUS]	= GATE(0x060, BIT(11)),
+	[CLK_BUS_NAND]		= GATE(0x060, BIT(13)),
+	[CLK_BUS_SDRAM]		= GATE(0x060, BIT(14)),
+	[CLK_BUS_PSRAM]		= GATE(0x060, BIT(15)),
+	[CLK_BUS_SPI0]		= GATE(0x060, BIT(20)),
+	[CLK_BUS_SPI1]		= GATE(0x060, BIT(21)),
+	[CLK_BUS_SPI2]		= GATE(0x060, BIT(22)),
+	[CLK_BUS_USBOTG]	= GATE(0x060, BIT(24)),
+	[CLK_BUS_USBEHCI0]	= GATE(0x060, BIT(26)),
+	[CLK_BUS_USBOHCI0]	= GATE(0x060, BIT(29)),
+	[CLK_BUS_TCON0]		= GATE(0x064, BIT(4)),
+	[CLK_BUS_CSI]		= GATE(0x064, BIT(8)),
+	[CLK_BUS_DE]		= GATE(0x064, BIT(12)),
+	[CLK_BUS_EE]		= GATE(0x064, BIT(13)),
+	[CLK_BUS_ADDA]		= GATE(0x068, BIT(0)),
+	[CLK_BUS_SPDIF]		= GATE(0x068, BIT(1)),
+	[CLK_BUS_DSD]		= GATE(0x068, BIT(2)),
+	[CLK_BUS_DMIC]		= GATE(0x068, BIT(3)),
+	[CLK_BUS_PIO]		= GATE(0x068, BIT(5)),
+	[CLK_BUS_THS]		= GATE(0x068, BIT(8)),
+	[CLK_BUS_KEYADC]	= GATE(0x068, BIT(9)),
+	[CLK_BUS_GPADC]		= GATE(0x068, BIT(10)),
+	[CLK_BUS_I2S0]		= GATE(0x068, BIT(12)),
+	[CLK_BUS_I2S1]		= GATE(0x068, BIT(13)),
+	[CLK_BUS_TWI0]		= GATE(0x06c, BIT(0)),
+	[CLK_BUS_TWI1]		= GATE(0x06c, BIT(1)),
+	[CLK_BUS_TWI2]		= GATE(0x06c, BIT(2)),
+	[CLK_BUS_UART0]		= GATE(0x06c, BIT(16)),
+	[CLK_BUS_UART1]		= GATE(0x06c, BIT(17)),
+	[CLK_BUS_UART2]		= GATE(0x06c, BIT(18)),
+	[CLK_BUS_UART3]		= GATE(0x06c, BIT(19)),
+	[CLK_BUS_UART4]		= GATE(0x06c, BIT(20)),
+	[CLK_BUS_UART5]		= GATE(0x06c, BIT(21)),
+};
+
+static const struct ccu_reset b288_resets[] = {
+	[RST_USBPHY0]		= RESET(0x0cc, BIT(0)),
+	[RST_MBUS]		= RESET(0x0fc, BIT(31)),
+	[RST_BUS_DMA]		= RESET(0x2c0, BIT(6)),
+	[RST_BUS_MMC0]		= RESET(0x2c0, BIT(8)),
+	[RST_BUS_MMC1]		= RESET(0x2c0, BIT(9)),
+	[RST_BUS_MMC2]		= RESET(0x2c0, BIT(10)),
+	[RST_BUS_MMC3]		= RESET(0x2c0, BIT(11)),
+	[RST_BUS_NAND]		= RESET(0x2c0, BIT(13)),
+	[RST_BUS_DRAM]		= RESET(0x2c0, BIT(14)),
+	[RST_BUS_PSRAM]		= RESET(0x2c0, BIT(15)),
+	[RST_BUS_SPI0]		= RESET(0x2c0, BIT(20)),
+	[RST_BUS_SPI1]		= RESET(0x2c0, BIT(21)),
+	[RST_BUS_SPI2]		= RESET(0x2c0, BIT(22)),
+	[RST_BUS_OTG]		= RESET(0x2c0, BIT(24)),
+	[RST_BUS_EHCI0]		= RESET(0x2c0, BIT(26)),
+	[RST_BUS_OHCI0]		= RESET(0x2c0, BIT(29)),
+	[RST_BUS_WLAN]		= RESET(0x2c4, BIT(1)),
+	[RST_BUS_TCON0]		= RESET(0x2c4, BIT(4)),
+	[RST_BUS_CSI]		= RESET(0x2c4, BIT(8)),
+	[RST_BUS_DE]		= RESET(0x2c4, BIT(12)),
+	[RST_BUS_EE]		= RESET(0x2c4, BIT(13)),
+	[RST_BUS_ADDA]		= RESET(0x2d0, BIT(0)),
+	[RST_BUS_SPDIF]		= RESET(0x2d0, BIT(1)),
+	[RST_BUS_DSD]		= RESET(0x2d0, BIT(2)),
+	[RST_BUS_DMIC]		= RESET(0x2d0, BIT(3)),
+	[RST_BUS_THS]		= RESET(0x2d0, BIT(8)),
+	[RST_BUS_KEYADC]	= RESET(0x2d0, BIT(9)),
+	[RST_BUS_GPADC]		= RESET(0x2d0, BIT(10)),
+	[RST_BUS_I2S0]		= RESET(0x2d0, BIT(12)),
+	[RST_BUS_I2S1]		= RESET(0x2d0, BIT(13)),
+	[RST_BUS_I2C0]		= RESET(0x2d8, BIT(0)),
+	[RST_BUS_I2C1]		= RESET(0x2d8, BIT(1)),
+	[RST_BUS_I2C2]		= RESET(0x2d8, BIT(2)),
+	[RST_BUS_UART0]		= RESET(0x2d8, BIT(16)),
+	[RST_BUS_UART1]		= RESET(0x2d8, BIT(17)),
+	[RST_BUS_UART2]		= RESET(0x2d8, BIT(18)),
+	[RST_BUS_UART3]		= RESET(0x2d8, BIT(19)),
+	[RST_BUS_UART4]		= RESET(0x2d8, BIT(20)),
+	[RST_BUS_UART5]		= RESET(0x2d8, BIT(21)),
+};
+
+const struct ccu_desc b288_ccu_desc = {
+	.gates = b288_gates,
+	.resets = b288_resets,
+	.num_gates = ARRAY_SIZE(b288_gates),
+	.num_resets = ARRAY_SIZE(b288_resets),
+};
diff --git a/drivers/clk/sunxi/clk_sunxi.c b/drivers/clk/sunxi/clk_sunxi.c
index 046d5d1605a..5f40f30fe89 100644
--- a/drivers/clk/sunxi/clk_sunxi.c
+++ b/drivers/clk/sunxi/clk_sunxi.c
@@ -117,6 +117,7 @@ extern const struct ccu_desc a64_ccu_desc;
 extern const struct ccu_desc a80_ccu_desc;
 extern const struct ccu_desc a80_mmc_clk_desc;
 extern const struct ccu_desc a83t_ccu_desc;
+extern const struct ccu_desc b288_ccu_desc;
 extern const struct ccu_desc d1_ccu_desc;
 extern const struct ccu_desc f1c100s_ccu_desc;
 extern const struct ccu_desc h3_ccu_desc;
@@ -154,6 +155,10 @@ static const struct udevice_id sunxi_clk_ids[] = {
 	{ .compatible = "allwinner,sun8i-a33-ccu",
 	  .data = (ulong)&a23_ccu_desc },
 #endif
+#ifdef CONFIG_CLK_SUN8I_B288
+	{ .compatible = "allwinner,sun8i-b288-ccu",
+	  .data = (ulong)&b288_ccu_desc },
+#endif
 #ifdef CONFIG_CLK_SUN8I_A83T
 	{ .compatible = "allwinner,sun8i-a83t-ccu",
 	  .data = (ulong)&a83t_ccu_desc },
-- 
2.52.0

