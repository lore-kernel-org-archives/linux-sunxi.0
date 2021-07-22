Received: from smtpbg.qq.com (smtpbg127.qq.com [109.244.180.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918002FB3
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 06:32:07 +0000 (UTC)
X-QQ-mid: bizesmtp46t1626935454tf02cx30
Received: from localhost.localdomain (unknown [14.154.30.9])
	by esmtp6.qq.com (ESMTP) with 
	id ; Thu, 22 Jul 2021 14:30:52 +0800 (CST)
X-QQ-SSF: 01100000002000104000B00A0000000
X-QQ-FEAT: xmzaef4TE3ermivczOtxUSq3JDusAxwMhC3TtqnTEbkUthE0zHMOUA5j6DFVH
	n774c+cGtyIRRsZltKbm/ewiCPTpuvbx1Yo5P1oURVy4uDnVuEPFJ7PemDgCJ1MMcM+HxrO
	/rUdK6Od8VX7irnk9ofTt0kvw0R9Mu+QTr9Ohpa0FrbDms/T2YsnoduwY36wRNxiw5UseKf
	zDkKRQQTAW41X0IqFoqhKvI0RvwJ1CoXQMwMkT4ow40jwUX2wm1hbbU0ZtNnGS6ss86fXDZ
	7IwmvlwZp5bX9SF0jJV2llnVuIoCAWIMCmUNjfBkr8knRv7xCd3+IHJOWwuC+0ietBVE0Qs
	3cbff/tHRlyGmGLoOw=
X-QQ-GoodBg: 0
From: Icenowy Zheng <icenowy@sipeed.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@sipeed.com>
Subject: [RFC PATCH 10/13] clk: sunxi: add support for R329 in sunxi DM clock driver
Date: Thu, 22 Jul 2021 14:30:12 +0800
Message-Id: <20210722063015.421923-11-icenowy@sipeed.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722063015.421923-1-icenowy@sipeed.com>
References: <20210722063015.421923-1-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam1

Currently only a subset of clocks/resets (similar to other SoCs) are
supported.

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 drivers/clk/sunxi/Kconfig    |  7 +++
 drivers/clk/sunxi/Makefile   |  1 +
 drivers/clk/sunxi/clk_r329.c | 94 ++++++++++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+)
 create mode 100644 drivers/clk/sunxi/clk_r329.c

diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
index bf084fa7a8..8dd3be4683 100644
--- a/drivers/clk/sunxi/Kconfig
+++ b/drivers/clk/sunxi/Kconfig
@@ -86,6 +86,13 @@ config CLK_SUN50I_H616
 	  This enables common clock driver support for platforms based
 	  on Allwinner H616 SoC.
 
+config CLK_SUN50I_R329
+	bool "Clock driver for Allwinner R329"
+	default MACH_SUN50I_R329
+	help
+	  This enables common clock driver support for platforms based
+	  on Allwinner R329 SoC.
+
 config CLK_SUN50I_A64
 	bool "Clock driver for Allwinner A64"
 	default MACH_SUN50I
diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
index 4f9282a8b9..050f7ecc46 100644
--- a/drivers/clk/sunxi/Makefile
+++ b/drivers/clk/sunxi/Makefile
@@ -19,4 +19,5 @@ obj-$(CONFIG_CLK_SUN9I_A80) += clk_a80.o
 obj-$(CONFIG_CLK_SUN8I_H3) += clk_h3.o
 obj-$(CONFIG_CLK_SUN50I_H6) += clk_h6.o
 obj-$(CONFIG_CLK_SUN50I_H616) += clk_h616.o
+obj-$(CONFIG_CLK_SUN50I_R329) += clk_r329.o
 obj-$(CONFIG_CLK_SUN50I_A64) += clk_a64.o
diff --git a/drivers/clk/sunxi/clk_r329.c b/drivers/clk/sunxi/clk_r329.c
new file mode 100644
index 0000000000..17157214b6
--- /dev/null
+++ b/drivers/clk/sunxi/clk_r329.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2021 Sipeed
+ * Based on clk_h616.c, which is:
+ *   Copyright (C) 2021 Jernej Skrabec <jernej.skrabec@siol.net>
+ */
+
+#include <common.h>
+#include <clk-uclass.h>
+#include <dm.h>
+#include <errno.h>
+#include <asm/arch/ccu.h>
+#include <dt-bindings/clock/sun50i-r329-ccu.h>
+#include <dt-bindings/reset/sun50i-r329-ccu.h>
+#include <linux/bitops.h>
+
+static struct ccu_clk_gate r329_gates[] = {
+	[CLK_BUS_MMC0]		= GATE(0x84c, BIT(0)),
+	[CLK_BUS_MMC1]		= GATE(0x84c, BIT(1)),
+
+	[CLK_BUS_UART0]		= GATE(0x90c, BIT(0)),
+	[CLK_BUS_UART1]		= GATE(0x90c, BIT(1)),
+	[CLK_BUS_UART2]		= GATE(0x90c, BIT(2)),
+	[CLK_BUS_UART3]		= GATE(0x90c, BIT(3)),
+
+	[CLK_SPI0]		= GATE(0x940, BIT(31)),
+	[CLK_SPI1]		= GATE(0x944, BIT(31)),
+
+	[CLK_BUS_SPI0]		= GATE(0x96c, BIT(0)),
+	[CLK_BUS_SPI1]		= GATE(0x96c, BIT(1)),
+
+	[CLK_BUS_EMAC]		= GATE(0x97c, BIT(0)),
+
+	[CLK_USB_PHY0]		= GATE(0xa70, BIT(29)),
+	[CLK_USB_OHCI0]		= GATE(0xa70, BIT(31)),
+
+	[CLK_USB_PHY1]		= GATE(0xa74, BIT(29)),
+	[CLK_USB_OHCI1]		= GATE(0xa74, BIT(31)),
+
+	[CLK_BUS_OHCI0]		= GATE(0xa8c, BIT(0)),
+	[CLK_BUS_OHCI1]		= GATE(0xa8c, BIT(1)),
+	[CLK_BUS_EHCI0]		= GATE(0xa8c, BIT(4)),
+	[CLK_BUS_OTG]		= GATE(0xa8c, BIT(8)),
+};
+
+static struct ccu_reset r329_resets[] = {
+	[RST_BUS_MMC0]		= RESET(0x84c, BIT(16)),
+	[RST_BUS_MMC1]		= RESET(0x84c, BIT(17)),
+
+	[RST_BUS_UART0]		= RESET(0x90c, BIT(16)),
+	[RST_BUS_UART1]		= RESET(0x90c, BIT(17)),
+	[RST_BUS_UART2]		= RESET(0x90c, BIT(18)),
+	[RST_BUS_UART3]		= RESET(0x90c, BIT(19)),
+
+	[RST_BUS_SPI0]		= RESET(0x96c, BIT(16)),
+	[RST_BUS_SPI1]		= RESET(0x96c, BIT(17)),
+
+	[RST_BUS_EMAC]		= RESET(0x97c, BIT(16)),
+
+	[RST_USB_PHY0]		= RESET(0xa70, BIT(30)),
+
+	[RST_USB_PHY1]		= RESET(0xa74, BIT(30)),
+
+	[RST_BUS_OHCI0]		= RESET(0xa8c, BIT(16)),
+	[RST_BUS_OHCI1]		= RESET(0xa8c, BIT(17)),
+	[RST_BUS_EHCI0]		= RESET(0xa8c, BIT(20)),
+	[RST_BUS_OTG]		= RESET(0xa8c, BIT(24)),
+};
+
+static const struct ccu_desc r329_ccu_desc = {
+	.gates = r329_gates,
+	.resets = r329_resets,
+};
+
+static int r329_clk_bind(struct udevice *dev)
+{
+	return sunxi_reset_bind(dev, ARRAY_SIZE(r329_resets));
+}
+
+static const struct udevice_id r329_ccu_ids[] = {
+	{ .compatible = "allwinner,sun50i-r329-ccu",
+	  .data = (ulong)&r329_ccu_desc },
+	{ }
+};
+
+U_BOOT_DRIVER(clk_sun50i_r329) = {
+	.name		= "sun50i_r329_ccu",
+	.id		= UCLASS_CLK,
+	.of_match	= r329_ccu_ids,
+	.priv_auto	= sizeof(struct ccu_priv),
+	.ops		= &sunxi_clk_ops,
+	.probe		= sunxi_clk_probe,
+	.bind		= r329_clk_bind,
+};
-- 
2.30.2

