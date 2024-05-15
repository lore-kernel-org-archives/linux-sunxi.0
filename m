Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43A84D5A5
	for <linux-sunxi@lists.linux.dev>; Wed, 15 May 2024 23:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715816976; cv=none; b=poxmRH6Lophqhkyq/XpWUNTFakPz5RGFwXgWEB1D99CNU36Iq3aG5c87mqat3u6TzVVGbzNckBEe+tsHLszJ1l7pcsz3cf3ck5b7HTPFJ5ms+83y0YooAUuupLZFt3N0S5PKnbd3O9oiMfIOsk+ZJfXB47z4flt3/fW9HHGraGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715816976; c=relaxed/simple;
	bh=lUZy5RlvzH9+bC1qta0mQVPulVSEsiTPDCMXfEROJTc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M0X44g0Qiki6au78WDatscSJgeUcFkxysFFqBeshSEEhTMiSY2aOQbE9G8sShqkVK6JvEnSWk0JD9Nkm9GrVrt8x5DwnfOctVh5fkvCAsMJFHZ8mHsbUf22L0IOPw4XL5nFTzqoDGdtE1yhrwPzIiFpDl9jdD+brAOrShZt1bCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AFA9DA7;
	Wed, 15 May 2024 16:49:58 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 763A33F641;
	Wed, 15 May 2024 16:49:32 -0700 (PDT)
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
Subject: [PATCH 3/6] power: pmic: sunxi: replace AXP717 SPL driver
Date: Thu, 16 May 2024 00:48:36 +0100
Message-Id: <20240515234839.26898-4-andre.przywara@arm.com>
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

We now have a generic AXP SPL driver implementation, that already covers
the DC/DC converters of the AXP717 PMIC.

Remove the old, dedicated driver and switch to the new generic driver.
This should not introduce any change in behaviour.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/power/Makefile |  2 +-
 drivers/power/axp717.c | 92 ------------------------------------------
 2 files changed, 1 insertion(+), 93 deletions(-)
 delete mode 100644 drivers/power/axp717.c

diff --git a/drivers/power/Makefile b/drivers/power/Makefile
index 9d1f4c65262..6df23a81c29 100644
--- a/drivers/power/Makefile
+++ b/drivers/power/Makefile
@@ -14,7 +14,7 @@ obj-$(CONFIG_AXP209_POWER)	+= axp209.o
 obj-$(CONFIG_AXP221_POWER)	+= axp221.o
 obj-$(CONFIG_AXP305_POWER)	+= axp305.o
 obj-$(CONFIG_AXP313_POWER)	+= axp313.o
-obj-$(CONFIG_AXP717_POWER)	+= axp717.o
+obj-$(CONFIG_AXP717_POWER)	+= axp_spl.o
 obj-$(CONFIG_AXP809_POWER)	+= axp809.o
 obj-$(CONFIG_AXP818_POWER)	+= axp818.o
 endif
diff --git a/drivers/power/axp717.c b/drivers/power/axp717.c
deleted file mode 100644
index 7c77c09ea8f..00000000000
--- a/drivers/power/axp717.c
+++ /dev/null
@@ -1,92 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * AXP717 SPL driver
- * (C) Copyright 2024 Arm Ltd.
- */
-
-#include <common.h>
-#include <command.h>
-#include <errno.h>
-#include <asm/arch/pmic_bus.h>
-#include <axp_pmic.h>
-
-enum axp717_reg {
-	AXP717_CHIP_VERSION = 0x3,
-	AXP717_SHUTDOWN = 0x27,
-	AXP717_OUTPUT_CTRL1 = 0x80,
-	AXP717_DCDC1_VOLTAGE = 0x83,
-};
-
-#define AXP717_CHIP_VERSION_MASK	0xc8
-#define AXP717_DCDC_1220MV_OFFSET	71
-#define AXP717_POWEROFF			(1U << 0)
-#define DCDC_DVM_ENABLE			(1U << 7)
-
-static u8 axp_mvolt_to_cfg(int mvolt, int min, int max, int div)
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
-	u8 cfg = DCDC_DVM_ENABLE;
-
-	if (dcdc_num < 1 || dcdc_num > 3)
-		return -EINVAL;
-
-	if (mvolt >= 1220)
-		cfg |= AXP717_DCDC_1220MV_OFFSET +
-			axp_mvolt_to_cfg(mvolt, 1220,
-					 dcdc_num == 3 ? 1840 : 1540, 20);
-	else
-		cfg |= axp_mvolt_to_cfg(mvolt, 500, 1200, 10);
-
-	if (mvolt == 0)
-		return pmic_bus_clrbits(AXP717_OUTPUT_CTRL1,
-					1U << (dcdc_num -1));
-
-	ret = pmic_bus_write(AXP717_DCDC1_VOLTAGE + dcdc_num - 1, cfg);
-	if (ret)
-		return ret;
-
-	return pmic_bus_setbits(AXP717_OUTPUT_CTRL1, 1U << (dcdc_num - 1));
-}
-
-int axp_set_dcdc1(unsigned int mvolt)
-{
-	return axp_set_dcdc(1, mvolt);
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
-	return pmic_bus_init();
-}
-
-#if !CONFIG_IS_ENABLED(ARM_PSCI_FW) && !IS_ENABLED(CONFIG_SYSRESET_CMD_POWEROFF)
-int do_poweroff(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
-{
-	pmic_bus_setbits(AXP717_SHUTDOWN, AXP717_POWEROFF);
-
-	/* infinite loop during shutdown */
-	while (1) {}
-
-	/* not reached */
-	return 0;
-}
-#endif
-- 
2.35.8

