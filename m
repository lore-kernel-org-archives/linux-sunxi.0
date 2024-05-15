Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647D541A88
	for <linux-sunxi@lists.linux.dev>; Wed, 15 May 2024 23:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715816978; cv=none; b=G6pJlwf27MC4v3BNB+nJgRj3NkdPeVm16kDwIKI+tj64fDe1A9m2RrenVk+wUlgZb0gG8lRU8GBF0tEaPexnFJQlWMtqcbfgpzpiYB8MdhNMOEsCX0nKDH5XXpGv0BUTY6YNl/wMuj7sh3xxfDmcVYs3hl77ImAvDrmKjrsSEhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715816978; c=relaxed/simple;
	bh=w6Nn1MLYBdXo4HvSNhoDf3k8NpRZfYVykJk0YlnaOew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gE42rCllPhn0ifmnElOIRJW8gXA0y1NeOEYlZTl9LQ2yL5tRncYHx6JJwa8TPh210ZxOLNl0HMv2+rwkbZAGhnUst7SigWGmEfI7UTvmSNu8wa9lxJcHp3gXqOoAouiAB7KgAgusXZcIhcc7vYd52oDM0wGyC9VLk9O9vR5ReN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9DD41042;
	Wed, 15 May 2024 16:49:59 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11B783F641;
	Wed, 15 May 2024 16:49:33 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Ryan Walklin <ryan@testtoast.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 4/6] power: pmic: sunxi: use generic AXP SPL driver for AXP313
Date: Thu, 16 May 2024 00:48:37 +0100
Message-Id: <20240515234839.26898-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20240515234839.26898-1-andre.przywara@arm.com>
References: <20240515234839.26898-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic AXP SPL driver implementation can cover all regulators we
need for the AXP313.

Add the descriptions for the three DC/DC regulators of the AXP313, and
enable that when CONFIG_AXP313_POWER is enabled. Also remove the old
driver, and switch the Makefile to include the new, generic version.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/power/Makefile  |   2 +-
 drivers/power/axp313.c  | 133 ----------------------------------------
 drivers/power/axp_spl.c |  13 ++++
 3 files changed, 14 insertions(+), 134 deletions(-)
 delete mode 100644 drivers/power/axp313.c

diff --git a/drivers/power/Makefile b/drivers/power/Makefile
index 6df23a81c29..30e0daf0621 100644
--- a/drivers/power/Makefile
+++ b/drivers/power/Makefile
@@ -13,7 +13,7 @@ obj-$(CONFIG_AXP152_POWER)	+= axp152.o
 obj-$(CONFIG_AXP209_POWER)	+= axp209.o
 obj-$(CONFIG_AXP221_POWER)	+= axp221.o
 obj-$(CONFIG_AXP305_POWER)	+= axp305.o
-obj-$(CONFIG_AXP313_POWER)	+= axp313.o
+obj-$(CONFIG_AXP313_POWER)	+= axp_spl.o
 obj-$(CONFIG_AXP717_POWER)	+= axp_spl.o
 obj-$(CONFIG_AXP809_POWER)	+= axp809.o
 obj-$(CONFIG_AXP818_POWER)	+= axp818.o
diff --git a/drivers/power/axp313.c b/drivers/power/axp313.c
deleted file mode 100644
index 09ecb5b1ec2..00000000000
--- a/drivers/power/axp313.c
+++ /dev/null
@@ -1,133 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * AXP313(a) driver
- *
- * (C) Copyright 2023 Arm Ltd.
- *
- * Based on axp305.c
- * (C) Copyright 2020 Jernej Skrabec <jernej.skrabec@siol.net>
- * (C) Copyright 2014 Hans de Goede <hdegoede@redhat.com>
- * (C) Copyright 2013 Oliver Schinagl <oliver@schinagl.nl>
- */
-
-#include <command.h>
-#include <errno.h>
-#include <asm/arch/pmic_bus.h>
-#include <axp_pmic.h>
-
-enum axp313_reg {
-	AXP313_CHIP_VERSION	= 0x03,
-	AXP313_OUTPUT_CTRL	= 0x10,
-	AXP313_DCDC1_CTRL	= 0x13,
-	AXP313_SHUTDOWN		= 0x1a,
-};
-
-#define AXP313_CHIP_VERSION_MASK	0xcf
-#define AXP313_CHIP_VERSION_AXP1530	0x48
-#define AXP313_CHIP_VERSION_AXP313A	0x4b
-#define AXP313_CHIP_VERSION_AXP313B	0x4c
-
-#define AXP313_DCDC_SPLIT_OFFSET	71
-#define AXP313_DCDC_SPLIT_MVOLT		1200
-
-#define AXP313_POWEROFF			BIT(7)
-
-static u8 mvolt_to_cfg(int mvolt, int min, int max, int div)
-{
-	if (mvolt < min)
-		mvolt = min;
-	else if (mvolt > max)
-		mvolt = max;
-
-	return (mvolt - min) / div;
-}
-
-static int axp_set_dcdc(int dcdc_num, unsigned int mvolt)
-{
-	int ret;
-	u8 cfg, enable_mask = 1U << (dcdc_num - 1);
-	int volt_reg = AXP313_DCDC1_CTRL + dcdc_num - 1;
-	int max_mV;
-
-	switch (dcdc_num) {
-	case 1:
-	case 2:
-		max_mV	= 1540;
-		break;
-	case 3:
-		/*
-		 * The manual defines a different split point, but tests
-		 * show that it's the same 1200mV as for DCDC1/2.
-		 */
-		max_mV	= 1840;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	if (mvolt > AXP313_DCDC_SPLIT_MVOLT)
-		cfg = AXP313_DCDC_SPLIT_OFFSET + mvolt_to_cfg(mvolt,
-				AXP313_DCDC_SPLIT_MVOLT + 20, max_mV, 20);
-	else
-		cfg = mvolt_to_cfg(mvolt, 500, AXP313_DCDC_SPLIT_MVOLT, 10);
-
-	if (mvolt == 0)
-		return pmic_bus_clrbits(AXP313_OUTPUT_CTRL, enable_mask);
-
-	debug("DCDC%d: writing 0x%x to reg 0x%x\n", dcdc_num, cfg, volt_reg);
-	ret = pmic_bus_write(volt_reg, cfg);
-	if (ret)
-		return ret;
-
-	return pmic_bus_setbits(AXP313_OUTPUT_CTRL, enable_mask);
-}
-
-int axp_set_dcdc2(unsigned int mvolt)
-{
-	return axp_set_dcdc(2, mvolt);
-}
-
-int axp_set_dcdc3(unsigned int mvolt)
-{
-	return axp_set_dcdc(3, mvolt);
-}
-
-int axp_init(void)
-{
-	u8 axp_chip_id;
-	int ret;
-
-	ret = pmic_bus_init();
-	if (ret)
-		return ret;
-
-	ret = pmic_bus_read(AXP313_CHIP_VERSION, &axp_chip_id);
-	if (ret)
-		return ret;
-
-	axp_chip_id &= AXP313_CHIP_VERSION_MASK;
-	switch (axp_chip_id) {
-	case AXP313_CHIP_VERSION_AXP1530:
-	case AXP313_CHIP_VERSION_AXP313A:
-	case AXP313_CHIP_VERSION_AXP313B:
-		break;
-	default:
-		debug("unknown PMIC: 0x%x\n", axp_chip_id);
-		return -EINVAL;
-	}
-
-	return ret;
-}
-
-#if !CONFIG_IS_ENABLED(ARM_PSCI_FW) && !IS_ENABLED(CONFIG_SYSRESET_CMD_POWEROFF)
-int do_poweroff(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
-{
-	pmic_bus_write(AXP313_SHUTDOWN, AXP313_POWEROFF);
-
-	/* infinite loop during shutdown */
-	while (1) {}
-
-	/* not reached */
-	return 0;
-}
-#endif
diff --git a/drivers/power/axp_spl.c b/drivers/power/axp_spl.c
index 36eb6bd0b2a..f72d106315e 100644
--- a/drivers/power/axp_spl.c
+++ b/drivers/power/axp_spl.c
@@ -34,6 +34,19 @@ static const struct axp_reg_desc_spl axp_spl_dcdc_regulators[] = {
 #define AXP_SHUTDOWN_REG	0x27
 #define AXP_SHUTDOWN_MASK	BIT(0)
 
+#elif defined(CONFIG_AXP313_POWER)				/* AXP313 */
+
+static const struct axp_reg_desc_spl axp_spl_dcdc_regulators[] = {
+	{ 0x10, BIT(0), 0x13, 0x7f,  500, 1540,  10, 70 },
+	{ 0x10, BIT(1), 0x14, 0x7f,  500, 1540,  10, 70 },
+	{ 0x10, BIT(2), 0x15, 0x7f,  500, 1840,  10, 70 },
+};
+#define AXP_CHIP_VERSION	0x3
+#define AXP_CHIP_VERSION_MASK	0xc8
+#define AXP_CHIP_ID		0x48
+#define AXP_SHUTDOWN_REG	0x1a
+#define AXP_SHUTDOWN_MASK	BIT(7)
+
 #else
 
 	#error "Please define the regulator registers in axp_spl_regulators[]."
-- 
2.35.8

