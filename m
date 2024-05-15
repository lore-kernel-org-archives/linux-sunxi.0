Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C124F213
	for <linux-sunxi@lists.linux.dev>; Wed, 15 May 2024 23:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715816975; cv=none; b=Ki1xFTg3Ulon7UZZ0TCQ0nbqe+Syg6pdVJU3x8HZNHfGbLkx93oIuN23ChuvZK56CFpc4oFMbuIMuJ15bfGuMXjs/eJWKFzHr6ID5+GAFxrKTV3uQ1tu+1ZFJLXkvANgh41Psw9cuA9uNOMV1xARZFdCIVOWwJdZUvI4dZzSL5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715816975; c=relaxed/simple;
	bh=HtOAUWrnyjsx3AjguALoidVkeucoXjwFJ8YzFHo2zuc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X49AIKooL3MJv91WuAr5GRkxdM9xRmppS1duGShrT7PGmLr+fm4jQcHgGZdCnWAIGXW3I/HHJPlLicHYY4tqI0jioUy88/0fXa/4UBer12li/5R9psqMSJnay9xrV5gdceBAASk8z+viGF/zwzCMynmQ3VgqPUGIPjX4ZPlgjpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADB741042;
	Wed, 15 May 2024 16:49:56 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA72D3F641;
	Wed, 15 May 2024 16:49:30 -0700 (PDT)
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
Subject: [PATCH 2/6] power: pmic: sunxi: introduce generic SPL AXP DC/DC driver
Date: Thu, 16 May 2024 00:48:35 +0100
Message-Id: <20240515234839.26898-3-andre.przywara@arm.com>
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

So far we had a separate driver file for each AXP PMIC chip that we need
to support in the SPL. The code in there was largely similar, but
differed in many details.

Based on the idea of the DM AXP driver, introduce a data structure to
describe each regulator in a compact way. This is a simplified version
of the struct used in the DM driver, as we don't need to support the full
voltage range and not every regulator in the SPL.
For now we only support the DC/DC buck converters, since that's what we
need the SPL to configure, mostly. Also we get rid of the regulator name,
and hardcode the regulator number by its position in the array (first is
DCDC1, second is DCDC2, etc). We also drop support for the value table,
we ideally won't need that for the subset of regulators required.
At the end each regulator is described by a 10 bytes struct, so we avoid
blowing up the SPL footprint, but still can use generic code.

Each chip is supposed to be described separately, and protected by
ifdef's, to only build in the regulators needed for a particular board.
We also describe the bits to help identifying the AXP chip, and the
shutdown details in that section.

Add a generic driver, that exports axp_set_dcdc<x>() functions to set up
the buck converters. For now this just contains the bits for the (new)
AXP717, but it's not wired up anywhere yet.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/power/axp_spl.c | 141 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 drivers/power/axp_spl.c

diff --git a/drivers/power/axp_spl.c b/drivers/power/axp_spl.c
new file mode 100644
index 00000000000..36eb6bd0b2a
--- /dev/null
+++ b/drivers/power/axp_spl.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * AXP PMIC SPL driver
+ * (C) Copyright 2024 Arm Ltd.
+ */
+
+#include <errno.h>
+#include <asm/arch/pmic_bus.h>
+#include <axp_pmic.h>
+
+struct axp_reg_desc_spl {
+	u8	enable_reg;
+	u8	enable_mask;
+	u8	volt_reg;
+	u8	volt_mask;
+	u16	min_mV;
+	u16	max_mV;
+	u8	step_mV;
+	u8	split;
+};
+
+#define NA 0xff
+
+#if defined(CONFIG_AXP717_POWER)				/* AXP717 */
+
+static const struct axp_reg_desc_spl axp_spl_dcdc_regulators[] = {
+	{ 0x80, BIT(0), 0x83, 0x7f,  500, 1540,  10, 70 },
+	{ 0x80, BIT(1), 0x84, 0x7f,  500, 1540,  10, 70 },
+	{ 0x80, BIT(2), 0x85, 0x7f,  500, 1840,  10, 70 },
+};
+#define AXP_CHIP_VERSION	0x0
+#define AXP_CHIP_VERSION_MASK	0x0
+#define AXP_CHIP_ID		0x0
+#define AXP_SHUTDOWN_REG	0x27
+#define AXP_SHUTDOWN_MASK	BIT(0)
+
+#else
+
+	#error "Please define the regulator registers in axp_spl_regulators[]."
+
+#endif
+
+static u8 axp_mvolt_to_cfg(int mvolt, const struct axp_reg_desc_spl *reg)
+{
+	if (mvolt < reg->min_mV)
+		mvolt = reg->min_mV;
+	else if (mvolt > reg->max_mV)
+		mvolt = reg->max_mV;
+
+	mvolt -= reg->min_mV;
+
+	/* voltage in the first range ? */
+	if (mvolt <= reg->split * reg->step_mV)
+		return mvolt / reg->step_mV;
+
+	mvolt -= reg->split * reg->step_mV;
+
+	return reg->split + mvolt / (reg->step_mV * 2);
+}
+
+static int axp_set_dcdc(int dcdc_num, unsigned int mvolt)
+{
+	const struct axp_reg_desc_spl *reg;
+	int ret;
+
+	if (dcdc_num < 1 || dcdc_num > ARRAY_SIZE(axp_spl_dcdc_regulators))
+		return -EINVAL;
+
+	reg = &axp_spl_dcdc_regulators[dcdc_num - 1];
+
+
+	if (mvolt == 0)
+		return pmic_bus_clrbits(reg->enable_reg, reg->enable_mask);
+
+	ret = pmic_bus_write(reg->volt_reg, axp_mvolt_to_cfg(mvolt, reg));
+	if (ret)
+		return ret;
+
+	return pmic_bus_setbits(reg->enable_reg, reg->enable_mask);
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
+int axp_set_dcdc4(unsigned int mvolt)
+{
+	return axp_set_dcdc(4, mvolt);
+}
+
+int axp_set_dcdc5(unsigned int mvolt)
+{
+	return axp_set_dcdc(5, mvolt);
+}
+
+int axp_init(void)
+{
+	int ret = pmic_bus_init();
+
+	if (ret)
+		return ret;
+
+	if (AXP_CHIP_VERSION_MASK) {
+		u8 axp_chip_id;
+
+		ret = pmic_bus_read(AXP_CHIP_VERSION, &axp_chip_id);
+		if (ret)
+			return ret;
+
+		if ((axp_chip_id & AXP_CHIP_VERSION_MASK) != AXP_CHIP_ID) {
+			debug("unknown PMIC: 0x%x\n", axp_chip_id);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+#if !CONFIG_IS_ENABLED(ARM_PSCI_FW) && !IS_ENABLED(CONFIG_SYSRESET_CMD_POWEROFF)
+int do_poweroff(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
+{
+	pmic_bus_setbits(AXP_SHUTDOWN_REG, AXP_SHUTDOWN_MASK);
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

