Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42935241676
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jul 2025 23:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752796622; cv=none; b=rOiC3jTehHewS7i/hX2eIqloYCj/ay4tXN5BfoxmLwqV+6wwInBMGrcbL2xCUfWavX72ypy66cm8aoiy6K4r9L0SR1wGtE7AYGydI9CavKMwL+n4710VxHEDbF4ca3QAMrg5vEdXmDangPQKF7blETTmEyxGOPlgXlR8yAYsR80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752796622; c=relaxed/simple;
	bh=DWa6oSl3XejSulqak7tioMuB13Re+BNUyxWySZvL7rI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dyb1bYGN4TdkIYkKscvxT/Yw8Ylbe62GpGauUx7VVRVxqS/tv0GhDQFmcduTMZ76CS5x6ilqUE+Q4FHAiPqGp+IjHzUOnXLSgZ3DvgFsG3I9xj7EDJxGn+ibfJUqPYXwB9ORZgqTrhGwJ9whPBgrewNJcVtS5lxu5lDMNABrY9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 613871762;
	Thu, 17 Jul 2025 16:56:53 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB70A3F694;
	Thu, 17 Jul 2025 16:56:59 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-sunxi@lists.linux.dev,
	Tom Rini <trini@konsulko.com>
Subject: [PATCH v2 07/20] clk: sunxi: Add support for the A523 -R CCU
Date: Fri, 18 Jul 2025 00:54:42 +0100
Message-ID: <20250717235455.32528-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250717235455.32528-1-andre.przywara@arm.com>
References: <20250717235455.32528-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a clock driver for the PRCM clock controller on the Allwinner A523
family of SoCs, often also used with an "r" prefix or suffix.
This just describes the clock gates and reset lines for the few devices
that we would need, most prominently the R_I2C device for the PMIC.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi/Kconfig      |  7 ++++++
 drivers/clk/sunxi/Makefile     |  1 +
 drivers/clk/sunxi/clk_a523_r.c | 39 ++++++++++++++++++++++++++++++++++
 drivers/clk/sunxi/clk_sunxi.c  |  5 +++++
 4 files changed, 52 insertions(+)
 create mode 100644 drivers/clk/sunxi/clk_a523_r.c

diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
index 74e89b86301..1c1cc82719c 100644
--- a/drivers/clk/sunxi/Kconfig
+++ b/drivers/clk/sunxi/Kconfig
@@ -136,4 +136,11 @@ config CLK_SUN55I_A523
 	  This enables common clock driver support for platforms based
 	  on Allwinner A523/T527 SoC.
 
+config CLK_SUN55I_A523_R
+	bool "Clock driver for Allwinner A523 generation PRCM"
+	default MACH_SUN55I_A523
+	help
+	  This enables common clock driver support for the PRCM
+	  in Allwinner A523/T527 SoCs.
+
 endif # CLK_SUNXI
diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
index dd33eabe2ed..93b542cebcd 100644
--- a/drivers/clk/sunxi/Makefile
+++ b/drivers/clk/sunxi/Makefile
@@ -26,3 +26,4 @@ obj-$(CONFIG_CLK_SUN50I_H616) += clk_h616.o
 obj-$(CONFIG_CLK_SUN50I_A64) += clk_a64.o
 obj-$(CONFIG_CLK_SUN50I_A100) += clk_a100.o
 obj-$(CONFIG_CLK_SUN55I_A523) += clk_a523.o
+obj-$(CONFIG_CLK_SUN55I_A523_R) += clk_a523_r.o
diff --git a/drivers/clk/sunxi/clk_a523_r.c b/drivers/clk/sunxi/clk_a523_r.c
new file mode 100644
index 00000000000..01e613d20aa
--- /dev/null
+++ b/drivers/clk/sunxi/clk_a523_r.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2024 Arm Ltd.
+ */
+
+#include <clk-uclass.h>
+#include <dm.h>
+#include <clk/sunxi.h>
+#include <dt-bindings/clock/sun55i-a523-r-ccu.h>
+#include <dt-bindings/reset/sun55i-a523-r-ccu.h>
+#include <linux/bitops.h>
+
+static struct ccu_clk_gate a523_r_gates[] = {
+	[CLK_R_AHB]             = GATE_DUMMY,
+	[CLK_R_APB0]            = GATE_DUMMY,
+	[CLK_R_APB1]            = GATE_DUMMY,
+	[CLK_BUS_R_TWD]         = GATE(0x12c, BIT(0)),
+	[CLK_BUS_R_I2C0]        = GATE(0x19c, BIT(0)),
+	[CLK_BUS_R_I2C1]        = GATE(0x19c, BIT(1)),
+	[CLK_BUS_R_I2C2]        = GATE(0x19c, BIT(2)),
+	[CLK_BUS_R_RTC]         = GATE(0x20c, BIT(0)),
+};
+
+static struct ccu_reset a523_r_resets[] = {
+	[RST_BUS_R_TWD]         = RESET(0x12c, BIT(16)),
+	[RST_BUS_R_UART0]       = RESET(0x18c, BIT(16)),
+	[RST_BUS_R_I2C0]        = RESET(0x19c, BIT(16)),
+	[RST_BUS_R_I2C1]        = RESET(0x19c, BIT(17)),
+	[RST_BUS_R_I2C2]        = RESET(0x19c, BIT(18)),
+	[RST_BUS_R_PPU1]        = RESET(0x1ac, BIT(17)),
+	[RST_BUS_R_RTC]         = RESET(0x20c, BIT(16)),
+};
+
+const struct ccu_desc a523_r_ccu_desc = {
+	.gates = a523_r_gates,
+	.resets = a523_r_resets,
+	.num_gates = ARRAY_SIZE(a523_r_gates),
+	.num_resets = ARRAY_SIZE(a523_r_resets),
+};
diff --git a/drivers/clk/sunxi/clk_sunxi.c b/drivers/clk/sunxi/clk_sunxi.c
index 30baabaafcd..842a0541bd6 100644
--- a/drivers/clk/sunxi/clk_sunxi.c
+++ b/drivers/clk/sunxi/clk_sunxi.c
@@ -127,6 +127,7 @@ extern const struct ccu_desc h6_r_ccu_desc;
 extern const struct ccu_desc r40_ccu_desc;
 extern const struct ccu_desc v3s_ccu_desc;
 extern const struct ccu_desc a523_ccu_desc;
+extern const struct ccu_desc a523_r_ccu_desc;
 
 static const struct udevice_id sunxi_clk_ids[] = {
 #ifdef CONFIG_CLK_SUN4I_A10
@@ -228,6 +229,10 @@ static const struct udevice_id sunxi_clk_ids[] = {
 #ifdef CONFIG_CLK_SUN55I_A523
 	{ .compatible = "allwinner,sun55i-a523-ccu",
 	  .data = (ulong)&a523_ccu_desc },
+#endif
+#ifdef CONFIG_CLK_SUN55I_A523_R
+	{ .compatible = "allwinner,sun55i-a523-r-ccu",
+	  .data = (ulong)&a523_r_ccu_desc },
 #endif
 	{ }
 };
-- 
2.46.3

