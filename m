Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DB11292DC
	for <linux-sunxi@lists.linux.dev>; Thu,  9 May 2024 23:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715298256; cv=none; b=cjSlrw9leYP5oCkqMH23uv9yaC2Plarqp4OW8VPMt30yIp4+inlcFv849yw5crzs0Qmjnoh2iI10ixZ/LAcv9355ZWDEaSY66JWxplhue/lze3HCG7uBIRPjQeYPjrDscNbZRFyq6yt+g67bAfK3BPGnCEOk8ahqHG8NxGsI1mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715298256; c=relaxed/simple;
	bh=DAETix6DPszkzMmISxd78MWrORqZh8zNcGoIHsPu5jc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eVZ02dy6CHYOLiSrQbELTI7XSupt5JASH6QjnT7uGY3LkjJS6houDTbWJTCbS7V32WLfgoNA518PW1dAprCYN5d49NaRgyQ9kyEbnbq0gDnXKRUrnvJA3DEUjHzXMyAq6xgfwm0h7vaPag9gyAr4QOVJ7eb7aj3bVIxW/HGkzfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2A6912FC;
	Thu,  9 May 2024 16:44:38 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 252303F6A8;
	Thu,  9 May 2024 16:44:12 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jaehoon Chung <jh80.chung@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Ryan Walklin <ryan@testtoast.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Tom Rini <trini@konsulko.com>
Subject: [PATCH 1/2] power: pmic: sunxi: add AXP717 SPL driver
Date: Fri, 10 May 2024 00:43:18 +0100
Message-Id: <20240509234319.13104-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20240509234319.13104-1-andre.przywara@arm.com>
References: <20240509234319.13104-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On boards using the AXP717 PMIC, the DRAM rail is often not setup
correctly at reset time, so we have to program the PMIC very early in
the SPL, before running the DRAM initialisation.

Add a simple AXP717 PMIC driver that knows about the buck converters, so
that we can set the voltage for the DRAM chips and the CPU cores.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/pmic_bus.c |  3 ++
 board/sunxi/board.c            |  2 +-
 drivers/power/Kconfig          | 17 +++++--
 drivers/power/Makefile         |  1 +
 drivers/power/axp717.c         | 92 ++++++++++++++++++++++++++++++++++
 5 files changed, 110 insertions(+), 5 deletions(-)
 create mode 100644 drivers/power/axp717.c

diff --git a/arch/arm/mach-sunxi/pmic_bus.c b/arch/arm/mach-sunxi/pmic_bus.c
index 87df312725c..8e19324c8ac 100644
--- a/arch/arm/mach-sunxi/pmic_bus.c
+++ b/arch/arm/mach-sunxi/pmic_bus.c
@@ -19,6 +19,7 @@
 #define AXP152_I2C_ADDR			0x30
 
 #define AXP209_I2C_ADDR			0x34
+#define AXP717_I2C_ADDR			0x34
 
 #define AXP305_I2C_ADDR			0x36
 #define AXP313_I2C_ADDR			0x36
@@ -36,6 +37,8 @@ static int pmic_i2c_address(void)
 		return AXP305_I2C_ADDR;
 	if (IS_ENABLED(CONFIG_AXP313_POWER))
 		return AXP313_I2C_ADDR;
+	if (IS_ENABLED(CONFIG_AXP717_POWER))
+		return AXP717_I2C_ADDR;
 
 	/* Other AXP2xx and AXP8xx variants */
 	return AXP209_I2C_ADDR;
diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index 1313b01dcea..2c65f4c93cb 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -563,7 +563,7 @@ void sunxi_board_init(void)
 #if defined CONFIG_AXP152_POWER || defined CONFIG_AXP209_POWER || \
 	defined CONFIG_AXP221_POWER || defined CONFIG_AXP305_POWER || \
 	defined CONFIG_AXP809_POWER || defined CONFIG_AXP818_POWER || \
-	defined CONFIG_AXP313_POWER
+	defined CONFIG_AXP313_POWER || defined CONFIG_AXP717_POWER
 	power_failed = axp_init();
 
 	if (IS_ENABLED(CONFIG_AXP_DISABLE_BOOT_ON_POWERON) && !power_failed) {
diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
index 33b8bc1214d..5556a22cf69 100644
--- a/drivers/power/Kconfig
+++ b/drivers/power/Kconfig
@@ -109,6 +109,13 @@ config AXP313_POWER
 	Select this to enable support for the AXP313 PMIC found on some
 	H616 boards.
 
+config AXP717_POWER
+	bool "axp717 pmic support"
+	select AXP_PMIC_BUS
+	select CMD_POWEROFF
+	---help---
+	Select this to enable support for the AXP717 PMIC found on some boards.
+
 config AXP809_POWER
 	bool "axp809 pmic support"
 	depends on MACH_SUN9I
@@ -151,10 +158,11 @@ config AXP_DCDC1_VOLT
 
 config AXP_DCDC2_VOLT
 	int "axp pmic dcdc2 voltage"
-	depends on AXP152_POWER || AXP209_POWER || AXP221_POWER || AXP809_POWER || AXP818_POWER || AXP313_POWER
+	depends on AXP152_POWER || AXP209_POWER || AXP221_POWER || AXP809_POWER || AXP818_POWER || AXP313_POWER || AXP717_POWER
 	default 900 if AXP818_POWER
 	default 1400 if AXP152_POWER || AXP209_POWER
 	default 1000 if AXP313_POWER
+	default 1000 if AXP717_POWER
 	default 1200 if MACH_SUN6I
 	default 1100 if MACH_SUN8I
 	default 0 if MACH_SUN9I
@@ -167,11 +175,11 @@ config AXP_DCDC2_VOLT
 	On A80 boards dcdc2 powers the GPU and can be left off.
 	On A83T boards dcdc2 is used for VDD-CPUA(cluster 0) and should be 0.9V.
 	On R40 boards dcdc2 is VDD-CPU and should be 1.1V
-	On boards using the AXP313 it's often VDD-CPU.
+	On boards using the AXP313 or AXP717 it's often VDD-CPU.
 
 config AXP_DCDC3_VOLT
 	int "axp pmic dcdc3 voltage"
-	depends on AXP152_POWER || AXP209_POWER || AXP221_POWER || AXP809_POWER || AXP818_POWER || AXP313_POWER
+	depends on AXP152_POWER || AXP209_POWER || AXP221_POWER || AXP809_POWER || AXP818_POWER || AXP313_POWER || AXP717_POWER
 	default 900 if AXP809_POWER || AXP818_POWER
 	default 1500 if AXP152_POWER
 	default 1250 if AXP209_POWER
@@ -188,7 +196,8 @@ config AXP_DCDC3_VOLT
 	On A80 boards dcdc3 is used for VDD-CPUA(cluster 0) and should be 0.9V.
 	On A83T boards dcdc3 is used for VDD-CPUB(cluster 1) and should be 0.9V.
 	On R40 boards dcdc3 is VDD-SYS and VDD-GPU and should be 1.1V.
-	On boards using the AXP313 it's often VDD-DRAM and should be 1.1V for LPDDR4.
+	On boards using the AXP313 or AXP717 it's often VDD-DRAM and should
+	be 1.1V for LPDDR4.
 
 config AXP_DCDC4_VOLT
 	int "axp pmic dcdc4 voltage"
diff --git a/drivers/power/Makefile b/drivers/power/Makefile
index c7ee4595fc8..41ebb494fff 100644
--- a/drivers/power/Makefile
+++ b/drivers/power/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_AXP209_POWER)	+= axp209.o
 obj-$(CONFIG_AXP221_POWER)	+= axp221.o
 obj-$(CONFIG_AXP305_POWER)	+= axp305.o
 obj-$(CONFIG_AXP313_POWER)	+= axp313.o
+obj-$(CONFIG_AXP717_POWER)	+= axp717.o
 obj-$(CONFIG_AXP809_POWER)	+= axp809.o
 obj-$(CONFIG_AXP818_POWER)	+= axp818.o
 obj-$(CONFIG_EXYNOS_TMU)	+= exynos-tmu.o
diff --git a/drivers/power/axp717.c b/drivers/power/axp717.c
new file mode 100644
index 00000000000..7c77c09ea8f
--- /dev/null
+++ b/drivers/power/axp717.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * AXP717 SPL driver
+ * (C) Copyright 2024 Arm Ltd.
+ */
+
+#include <common.h>
+#include <command.h>
+#include <errno.h>
+#include <asm/arch/pmic_bus.h>
+#include <axp_pmic.h>
+
+enum axp717_reg {
+	AXP717_CHIP_VERSION = 0x3,
+	AXP717_SHUTDOWN = 0x27,
+	AXP717_OUTPUT_CTRL1 = 0x80,
+	AXP717_DCDC1_VOLTAGE = 0x83,
+};
+
+#define AXP717_CHIP_VERSION_MASK	0xc8
+#define AXP717_DCDC_1220MV_OFFSET	71
+#define AXP717_POWEROFF			(1U << 0)
+#define DCDC_DVM_ENABLE			(1U << 7)
+
+static u8 axp_mvolt_to_cfg(int mvolt, int min, int max, int div)
+{
+	if (mvolt < min)
+		mvolt = min;
+	else if (mvolt > max)
+		mvolt = max;
+
+	return (mvolt - min) / div;
+}
+
+static int axp_set_dcdc(int dcdc_num, unsigned int mvolt)
+{
+	int ret;
+	u8 cfg = DCDC_DVM_ENABLE;
+
+	if (dcdc_num < 1 || dcdc_num > 3)
+		return -EINVAL;
+
+	if (mvolt >= 1220)
+		cfg |= AXP717_DCDC_1220MV_OFFSET +
+			axp_mvolt_to_cfg(mvolt, 1220,
+					 dcdc_num == 3 ? 1840 : 1540, 20);
+	else
+		cfg |= axp_mvolt_to_cfg(mvolt, 500, 1200, 10);
+
+	if (mvolt == 0)
+		return pmic_bus_clrbits(AXP717_OUTPUT_CTRL1,
+					1U << (dcdc_num -1));
+
+	ret = pmic_bus_write(AXP717_DCDC1_VOLTAGE + dcdc_num - 1, cfg);
+	if (ret)
+		return ret;
+
+	return pmic_bus_setbits(AXP717_OUTPUT_CTRL1, 1U << (dcdc_num - 1));
+}
+
+int axp_set_dcdc1(unsigned int mvolt)
+{
+	return axp_set_dcdc(1, mvolt);
+}
+
+int axp_set_dcdc2(unsigned int mvolt)
+{
+	return axp_set_dcdc(2, mvolt);
+}
+
+int axp_set_dcdc3(unsigned int mvolt)
+{
+	return axp_set_dcdc(3, mvolt);
+}
+
+int axp_init(void)
+{
+	return pmic_bus_init();
+}
+
+#if !CONFIG_IS_ENABLED(ARM_PSCI_FW) && !IS_ENABLED(CONFIG_SYSRESET_CMD_POWEROFF)
+int do_poweroff(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
+{
+	pmic_bus_setbits(AXP717_SHUTDOWN, AXP717_POWEROFF);
+
+	/* infinite loop during shutdown */
+	while (1) {}
+
+	/* not reached */
+	return 0;
+}
+#endif
-- 
2.35.8

