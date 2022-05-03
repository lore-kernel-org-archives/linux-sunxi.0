Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E0933F0
	for <linux-sunxi@lists.linux.dev>; Tue,  3 May 2022 21:21:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54ECD13D5;
	Tue,  3 May 2022 14:21:00 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9ABC73FA53;
	Tue,  3 May 2022 14:20:58 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jesse Taube <mr.bossman075@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Yifan Gu <me@yifangu.com>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	George Hilliard <thirtythreeforty@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: [PATCH 1/7] clk: sunxi: implement clock driver for suniv f1c100s
Date: Tue,  3 May 2022 22:20:34 +0100
Message-Id: <20220503212040.27884-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220503212040.27884-1-andre.przywara@arm.com>
References: <20220503212040.27884-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: George Hilliard <thirtythreeforty@gmail.com>

The f1c100s has a clock tree similar to those of other sunxi parts.
Add support for it.

Signed-off-by: George Hilliard <thirtythreeforty@gmail.com>
Signed-off-by: Yifan Gu <me@yifangu.com>
Acked-by: Sean Anderson <seanga2@gmail.com>
[Andre: add PIO and I2C]
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi/Kconfig       |  7 ++++
 drivers/clk/sunxi/Makefile      |  1 +
 drivers/clk/sunxi/clk_f1c100s.c | 74 +++++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+)
 create mode 100644 drivers/clk/sunxi/clk_f1c100s.c

diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
index f19908113e1..bf11fad6eef 100644
--- a/drivers/clk/sunxi/Kconfig
+++ b/drivers/clk/sunxi/Kconfig
@@ -10,6 +10,13 @@ config CLK_SUNXI
 
 if CLK_SUNXI
 
+config CLK_SUNIV_F1C100S
+	bool "Clock driver for Allwinner F1C100s"
+	default MACH_SUNIV
+	help
+	  This enables common clock driver support for platforms based
+	  on Allwinner F1C100s SoC.
+
 config CLK_SUN4I_A10
 	bool "Clock driver for Allwinner A10/A20"
 	default MACH_SUN4I || MACH_SUN7I
diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
index 48a48a2f000..895da02ebea 100644
--- a/drivers/clk/sunxi/Makefile
+++ b/drivers/clk/sunxi/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_CLK_SUNXI) += clk_sunxi.o
 
 obj-$(CONFIG_CLK_SUNXI) += clk_sun6i_rtc.o
 
+obj-$(CONFIG_CLK_SUNIV_F1C100S) += clk_f1c100s.o
 obj-$(CONFIG_CLK_SUN4I_A10) += clk_a10.o
 obj-$(CONFIG_CLK_SUN5I_A10S) += clk_a10s.o
 obj-$(CONFIG_CLK_SUN6I_A31) += clk_a31.o
diff --git a/drivers/clk/sunxi/clk_f1c100s.c b/drivers/clk/sunxi/clk_f1c100s.c
new file mode 100644
index 00000000000..72cf8a6e5c0
--- /dev/null
+++ b/drivers/clk/sunxi/clk_f1c100s.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: (GPL-2.0+)
+/*
+ * Copyright (C) 2019 George Hilliard <thirtythreeforty@gmail.com>.
+ */
+
+#include <common.h>
+#include <clk-uclass.h>
+#include <dm.h>
+#include <errno.h>
+#include <clk/sunxi.h>
+#include <dt-bindings/clock/suniv-ccu-f1c100s.h>
+#include <dt-bindings/reset/suniv-ccu-f1c100s.h>
+
+static struct ccu_clk_gate f1c100s_gates[] = {
+	[CLK_BUS_MMC0]		= GATE(0x060, BIT(8)),
+	[CLK_BUS_MMC1]		= GATE(0x060, BIT(9)),
+	[CLK_BUS_SPI0]		= GATE(0x060, BIT(20)),
+	[CLK_BUS_SPI1]		= GATE(0x060, BIT(21)),
+	[CLK_BUS_OTG]		= GATE(0x060, BIT(24)),
+
+	[CLK_BUS_I2C0]		= GATE(0x068, BIT(16)),
+	[CLK_BUS_I2C1]		= GATE(0x068, BIT(17)),
+	[CLK_BUS_I2C2]		= GATE(0x068, BIT(18)),
+	[CLK_BUS_PIO]		= GATE(0x068, BIT(19)),
+
+	[CLK_BUS_UART0]		= GATE(0x06c, BIT(20)),
+	[CLK_BUS_UART1]		= GATE(0x06c, BIT(21)),
+	[CLK_BUS_UART2]		= GATE(0x06c, BIT(22)),
+
+	[CLK_USB_PHY0]          = GATE(0x0cc, BIT(1)),
+};
+
+static struct ccu_reset f1c100s_resets[] = {
+	[RST_USB_PHY0]		= RESET(0x0cc, BIT(0)),
+
+	[RST_BUS_MMC0]		= RESET(0x2c0, BIT(8)),
+	[RST_BUS_MMC1]		= RESET(0x2c0, BIT(9)),
+	[RST_BUS_SPI0]		= RESET(0x2c0, BIT(20)),
+	[RST_BUS_SPI1]		= RESET(0x2c0, BIT(21)),
+	[RST_BUS_OTG]		= RESET(0x2c0, BIT(24)),
+
+	[RST_BUS_I2C0]		= RESET(0x2d0, BIT(16)),
+	[RST_BUS_I2C1]		= RESET(0x2d0, BIT(17)),
+	[RST_BUS_I2C2]		= RESET(0x2d0, BIT(18)),
+	[RST_BUS_UART0]		= RESET(0x2d0, BIT(20)),
+	[RST_BUS_UART1]		= RESET(0x2d0, BIT(21)),
+	[RST_BUS_UART2]		= RESET(0x2d0, BIT(22)),
+};
+
+static const struct ccu_desc f1c100s_ccu_desc = {
+	.gates = f1c100s_gates,
+	.resets = f1c100s_resets,
+};
+
+static int f1c100s_clk_bind(struct udevice *dev)
+{
+	return sunxi_reset_bind(dev, ARRAY_SIZE(f1c100s_resets));
+}
+
+static const struct udevice_id f1c100s_clk_ids[] = {
+	{ .compatible = "allwinner,suniv-f1c100s-ccu",
+	  .data = (ulong)&f1c100s_ccu_desc },
+	{ }
+};
+
+U_BOOT_DRIVER(clk_suniv_f1c100s) = {
+	.name		= "suniv_f1c100s_ccu",
+	.id		= UCLASS_CLK,
+	.of_match	= f1c100s_clk_ids,
+	.priv_auto	= sizeof(struct ccu_priv),
+	.ops		= &sunxi_clk_ops,
+	.probe		= sunxi_clk_probe,
+	.bind		= f1c100s_clk_bind,
+};
-- 
2.35.3

