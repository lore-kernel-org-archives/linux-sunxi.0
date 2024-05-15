Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C774D5A5
	for <linux-sunxi@lists.linux.dev>; Wed, 15 May 2024 23:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715816979; cv=none; b=d+HlcanQgg4kpmXumP3RQpxoS3po8P9AZh5gSdUojvSnFXcCNYx3khbGApOyT+H4XQV5F0n/lupli4nEEvVsQq0gSQsGutjrYJZ10b5py43b04ynXUI4p4Dn82b0InUb/+eE2T4t8Yi2RapccSKhjuT8Qf1Eh5XWGL868IAFPUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715816979; c=relaxed/simple;
	bh=tkj3SrszOguPLVuOJObEuLypvLVsZwBpQahFyAJKNZY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c5S1P9Ey93ikrz//eFdgMJ5r0HtBal2eIggeSRvTxUdD/byDLTav0zxKT7XaH06xlLVkCsjrAFNhpi/SYd5IkRiConQfQMLPCy/SclOvjQKRruY5FvoWNDkHNDbmgPL2Y7YP4MvAnoviatTDZU94U+7/+zTkWng9lzFJEbcPurY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 744EEDA7;
	Wed, 15 May 2024 16:50:01 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A13073F641;
	Wed, 15 May 2024 16:49:35 -0700 (PDT)
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
Subject: [PATCH 5/6] power: pmic: sunxi: use generic AXP SPL driver for AXP305
Date: Thu, 16 May 2024 00:48:38 +0100
Message-Id: <20240515234839.26898-6-andre.przywara@arm.com>
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
need for the AXP305.

Add the descriptions for four of the six DC/DC regulators of the AXP305,
and enable that when CONFIG_AXP305_POWER is enabled. We won't need DCDC2
and DCDC3, but by using the position in the array for the index we keep
the code cleaner.
Also remove the old driver, and switch the Makefile to include the new,
generic driver.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/power/Makefile  |  2 +-
 drivers/power/axp305.c  | 82 -----------------------------------------
 drivers/power/axp_spl.c | 15 ++++++++
 3 files changed, 16 insertions(+), 83 deletions(-)
 delete mode 100644 drivers/power/axp305.c

diff --git a/drivers/power/Makefile b/drivers/power/Makefile
index 30e0daf0621..8d36f87ed32 100644
--- a/drivers/power/Makefile
+++ b/drivers/power/Makefile
@@ -12,7 +12,7 @@ ifdef CONFIG_SPL_BUILD
 obj-$(CONFIG_AXP152_POWER)	+= axp152.o
 obj-$(CONFIG_AXP209_POWER)	+= axp209.o
 obj-$(CONFIG_AXP221_POWER)	+= axp221.o
-obj-$(CONFIG_AXP305_POWER)	+= axp305.o
+obj-$(CONFIG_AXP305_POWER)	+= axp_spl.o
 obj-$(CONFIG_AXP313_POWER)	+= axp_spl.o
 obj-$(CONFIG_AXP717_POWER)	+= axp_spl.o
 obj-$(CONFIG_AXP809_POWER)	+= axp809.o
diff --git a/drivers/power/axp305.c b/drivers/power/axp305.c
deleted file mode 100644
index 0312ad9af76..00000000000
--- a/drivers/power/axp305.c
+++ /dev/null
@@ -1,82 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * AXP305 driver
- *
- * (C) Copyright 2020 Jernej Skrabec <jernej.skrabec@siol.net>
- *
- * Based on axp221.c
- * (C) Copyright 2014 Hans de Goede <hdegoede@redhat.com>
- * (C) Copyright 2013 Oliver Schinagl <oliver@schinagl.nl>
- */
-
-#include <command.h>
-#include <errno.h>
-#include <asm/arch/pmic_bus.h>
-#include <axp_pmic.h>
-
-#define AXP305_DCDC4_1600MV_OFFSET 46
-
-static u8 axp305_mvolt_to_cfg(int mvolt, int min, int max, int div)
-{
-	if (mvolt < min)
-		mvolt = min;
-	else if (mvolt > max)
-		mvolt = max;
-
-	return  (mvolt - min) / div;
-}
-
-int axp_set_dcdc4(unsigned int mvolt)
-{
-	int ret;
-	u8 cfg;
-
-	if (mvolt >= 1600)
-		cfg = AXP305_DCDC4_1600MV_OFFSET +
-			axp305_mvolt_to_cfg(mvolt, 1600, 3300, 100);
-	else
-		cfg = axp305_mvolt_to_cfg(mvolt, 600, 1500, 20);
-
-	if (mvolt == 0)
-		return pmic_bus_clrbits(AXP305_OUTPUT_CTRL1,
-					AXP305_OUTPUT_CTRL1_DCDCD_EN);
-
-	ret = pmic_bus_write(AXP305_DCDCD_VOLTAGE, cfg);
-	if (ret)
-		return ret;
-
-	return pmic_bus_setbits(AXP305_OUTPUT_CTRL1,
-				AXP305_OUTPUT_CTRL1_DCDCD_EN);
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
-	ret = pmic_bus_read(AXP305_CHIP_VERSION, &axp_chip_id);
-	if (ret)
-		return ret;
-
-	if ((axp_chip_id & AXP305_CHIP_VERSION_MASK) != 0x40)
-		return -ENODEV;
-
-	return ret;
-}
-
-#if !CONFIG_IS_ENABLED(ARM_PSCI_FW) && !IS_ENABLED(CONFIG_SYSRESET_CMD_POWEROFF)
-int do_poweroff(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
-{
-	pmic_bus_write(AXP305_SHUTDOWN, AXP305_POWEROFF);
-
-	/* infinite loop during shutdown */
-	while (1) {}
-
-	/* not reached */
-	return 0;
-}
-#endif
diff --git a/drivers/power/axp_spl.c b/drivers/power/axp_spl.c
index f72d106315e..e38895c5c7d 100644
--- a/drivers/power/axp_spl.c
+++ b/drivers/power/axp_spl.c
@@ -47,6 +47,21 @@ static const struct axp_reg_desc_spl axp_spl_dcdc_regulators[] = {
 #define AXP_SHUTDOWN_REG	0x1a
 #define AXP_SHUTDOWN_MASK	BIT(7)
 
+#elif defined(CONFIG_AXP305_POWER)				/* AXP305 */
+
+static const struct axp_reg_desc_spl axp_spl_dcdc_regulators[] = {
+        { 0x10, BIT(0), 0x12, 0x7f,  600, 1520,  10, 50 },
+        { 0x10, BIT(1), 0x13, 0x1f, 1000, 2550,  50, NA },
+        { 0x10, BIT(2), 0x14, 0x7f,  600, 1520,  10, 50 },
+        { 0x10, BIT(3), 0x15, 0x3f,  600, 1500,  20, NA },
+        { 0x10, BIT(4), 0x16, 0x1f, 1100, 3400, 100, NA },
+};
+#define AXP_CHIP_VERSION	0x3
+#define AXP_CHIP_VERSION_MASK	0xcf
+#define AXP_CHIP_ID		0x40
+#define AXP_SHUTDOWN_REG	0x32
+#define AXP_SHUTDOWN_MASK	BIT(7)
+
 #else
 
 	#error "Please define the regulator registers in axp_spl_regulators[]."
-- 
2.35.8

