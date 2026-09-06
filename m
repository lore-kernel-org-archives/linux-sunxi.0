Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5993A3939A6
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Sep 2026 22:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788733863; cv=none; b=dwFMUppJ1u2A6VQu+5m5q705K3S1QzdIzpR7b9UtSbC4VlbNvkEtPuwfvxiHN8641w8X5OitwyIHTHzzQ32d8nkFI8UxzCJ71GF15o6Ad8cXWCPnSNJ5dgOyztc2m9/uXc4JLJRKm4JKQ9mVsDSuUxSmxmGkgBwk2UooBdnbEgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788733863; c=relaxed/simple;
	bh=os/NIfl1ccq6gUHp5OfT9qtp40l8U56ofBPUWhCh9Lg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sbBxZUHB32WhURD1xN7Gym+y0SDdig8zBOoDRdNEDwtNTTQrB8Tx5CnqAPYymw64Yzj0J6sZ3d/8Gtm0jTdkDfiL9nlB/+o3jFXJzdXqIDVj46Bp4aEOTh++KTq+aibqrEvEfwcgUKttAKW28VsdWb2Y+kQzN+GaMJSieYIvu6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/GYR33r; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/GYR33r"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4b333de9451so2920715b6e.3
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Sep 2026 15:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788733860; x=1789338660; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsJq6AK24wZ1N9wcHHbuy2vFWyU6KtPM7MjpT9Bw5M8=;
        b=A/GYR33rWOfp26eJvHek3h3sPxLnyvKC9kUIsmaGFmp3gssvGx6e+fJFb5TVdVoXNc
         1cQfTvqqZdBBc9pULuP3J1LNPYIM21E8TbgPNG0V9VemH9paBrqP5YHV0cO2p2ain3p1
         nB3582QMz8alHAxy1VsYt6oaW0k5Nvafmx4P4hG1fClatnYqAxCsWa6uFwOfQ3rbW28v
         3mEm1aKT7pAOnnIALOFd6vx/TcsyZ+dSrqX+0tZGUAsuUywAxPYFqMAzmt0+R+luGSiC
         t7pT5B936JARwx60/CKipxiLq2x+28c7VFcf5YWlZKR/qzc8dEPK58c3rqtebkJbXSLp
         iCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788733860; x=1789338660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AsJq6AK24wZ1N9wcHHbuy2vFWyU6KtPM7MjpT9Bw5M8=;
        b=EVXNbdagsyjTHlcaEx4+YC2PH44VSWJ+eGwh7l/gyZC8nI8MmKsPgUZ/PSZGQACHXN
         hyf4XmKetS2UzA3YEN6LNXp3ZW2BH6bQI1clM0k+rRzMMpGjjP5QpiTEDDisXktBmi25
         S1lgKyUpBgbWCUvrUseNFLkFETiFnfDlVmCxw4VJ7H/V7HWVU5IYoub9j/fV33/KNm2g
         LqzQaHCvWY+k+BZ/bYYiawIhJhDt0EpvSaIpK4ngM++wSeF6tbyVOR8r4NawCNzPZNYb
         5KL7blPhUxF8ClxAUaj5iNW2ecCHrzww8fc2sBIiwfgheqHFVCpi6Pcry23EN3IOsAB4
         MqkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhhyOMgnyITV6oOX7buuqAcSEiCYeS6JZKVNNIEwNf6Pkg0gFGBf0l9W2OgJe3QwfVa6icnzTznsho6A==@lists.linux.dev
X-Gm-Message-State: AFuF++mo0f/c+CPi8ejsZBCS3DhNLvSstW7RwbpKsJfuz0lvm+0Mxd12
	6sdQpNW8DeTJN5k2PiGn2R+LFhaYQpxQVplX4huSPf+lTafBLYa5h7ot
X-Gm-Gg: AYBFou2U8S121coJmPGviMuj5NjirfsD/Pn3ixsQY9l1KcKfm6Uu07p/xtl18KYNOxZ
	meZT/QTT6CYG9S2EXecBJY594NwTs5L9I+5cwjvLvFXWiM0vqoWDrcfUVAqlGSPZkJtPyPMZ1JA
	Ea7k2z/H5fU3HszOkE7UErebW7ihx6jzqWGBmV5cfA6v4ylpY8dEvaWeU5FSrn67u8o7V4R2SOC
	WNyUJ1Dbgpk+9zCqZRCsHUOt4ujx0U4QTYTZB5G12voSRrEi9DVmqPBP2IASgStyA2NJ+Z2NEAU
	A8bd2lDN4vUrEVMWyYM26wf9tU+rF0QL8RCiaUiOnhZiKFIencdaSKa/0yyhw4EYFMPyS1+VyTL
	if1ov6g/ARUzVX+0X38lY9EFcC8lUtju/zTDWgwJy9HDuWCzDhV2gfbKWn/XXQdAm5ETdGOV77W
	oJwzyQB8iTk6iYWzMlfXHgHGQUMFKXG/rVZOF5eNyV0uiVd4pUECogMsuDGoJ7NAShk4Ewl8LQU
	8Xg8D5Lb9CNaXl2GDFFpy63HbIn00ufLSmwOuhAdzVwFW84oYOn6yhlr/AKsvWzqrw7H03P3SJt
	v3AEGvz0hwGDGpM4W+/OHFj8cnL/4pt3gcbuqs7wXunnakWiCNCmyh57n5SDHxyjyAj2ds/r9Sg
	mrMmu2nKjBZ2WVt1mV3A=
X-Received: by 2002:a05:6808:f90:b0:4b9:e6ab:d07d with SMTP id 5614622812f47-4b9e6abd4e7mr8544835b6e.29.1788733860184;
        Sun, 06 Sep 2026 15:31:00 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b970d200fesm8701910b6e.3.2026.09.06.15.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 15:30:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 06 Sep 2026 16:30:47 -0600
Subject: [PATCH v10 2/2] mfd: ac200: Add X-Powers AC200 support
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-submit-ac200-mfd-v10-2-f522e8dc2bd4@gmail.com>
References: <20260906-submit-ac200-mfd-v10-0-f522e8dc2bd4@gmail.com>
In-Reply-To: <20260906-submit-ac200-mfd-v10-0-f522e8dc2bd4@gmail.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 James Hilliard <james.hilliard1@gmail.com>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The X-Powers AC200 is a mixed-signal companion IC with a paged register
map accessed over I2C.

Enable and rate-lock the shared input clock, retain the BSP resume path's
40 ms wait before creating the regmap and accessing registers, and
deassert the common reset. No minimum delay is documented. Set only the
deassert bit instead of forcing a reset cycle, avoiding a chip-wide reset
of unrelated function registers. Leave the common reset deasserted during
driver removal and system shutdown; function drivers own their block
resets. Supplier unbind still tears down linked consumers and releases
the provider's clock references.

Cache only the common page selector. Individual functions can reset
independently and invalidate their other registers, so leave all
functional registers volatile.

Register the audio codec and TV encoder as MFD cells when their enabled
child nodes are present. Filtering the cell list avoids unused platform
devices and warnings about missing firmware nodes on PHY-only boards.
Use automatically assigned platform device IDs to support multiple AC200
instances. Initialize the parent's DMA mask for its non-DMA children so
their OF configuration does not warn about a missing mask.

Add a regmap IRQ controller for the shared level-triggered INTB output so
the TV encoder can consume its cable-detection interrupt. Default to
level-low when the upstream interrupt has no trigger type configured.
Keep INTB disabled until regmap has masked the sources and installed the
handler, and disable it before releasing the IRQ chip. The source
function remains responsible for clearing its interrupt condition.

The Ethernet PHY is enumerated on its MDIO bus rather than as an MFD
child. It follows the x-powers,ac200 phandle and uses this regmap for
ancillary package-control access.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 MAINTAINERS          |   1 +
 drivers/mfd/Kconfig  |  15 +++
 drivers/mfd/Makefile |   1 +
 drivers/mfd/ac200.c  | 255 +++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 272 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1b1dd57cc419..8a48f6a1e593 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29510,6 +29510,7 @@ M:	James Hilliard <james.hilliard1@gmail.com>
 L:	linux-sunxi@lists.linux.dev
 S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
+F:	drivers/mfd/ac200.c
 F:	include/dt-bindings/mfd/x-powers,ac200.h
 
 X-POWERS AXP288 PMIC DRIVERS
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 857ca3bb0d5b..5193c6f71bd8 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -205,6 +205,21 @@ config MFD_AC100
 	  This driver include only the core APIs. You have to select individual
 	  components like codecs or RTC under the corresponding menus.
 
+config MFD_AC200
+	tristate "X-Powers AC200"
+	depends on COMMON_CLK
+	depends on I2C
+	depends on OF
+	select MFD_CORE
+	select REGMAP_I2C
+	select REGMAP_IRQ
+	help
+	  Support for the X-Powers AC200 mixed-signal companion IC. The AC200
+	  contains audio, video, RTC and Fast Ethernet PHY functions and is
+	  co-packaged with some Allwinner H6 and H616 SoCs. This driver provides
+	  the shared register access and instantiates the individual function
+	  devices.
+
 config MFD_AXP20X
 	tristate
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 72d3944b0ad8..f8101d2a9ce9 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -150,6 +150,7 @@ obj-$(CONFIG_MFD_DA9052_SPI)	+= da9052-spi.o
 obj-$(CONFIG_MFD_DA9052_I2C)	+= da9052-i2c.o
 
 obj-$(CONFIG_MFD_AC100)		+= ac100.o
+obj-$(CONFIG_MFD_AC200)		+= ac200.o
 obj-$(CONFIG_MFD_AXP20X)	+= axp20x.o
 obj-$(CONFIG_MFD_AXP20X_I2C)	+= axp20x-i2c.o
 obj-$(CONFIG_MFD_AXP20X_RSB)	+= axp20x-rsb.o
diff --git a/drivers/mfd/ac200.c b/drivers/mfd/ac200.c
new file mode 100644
index 000000000000..30828e113c11
--- /dev/null
+++ b/drivers/mfd/ac200.c
@@ -0,0 +1,255 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * MFD core driver for the X-Powers AC200
+ *
+ * Copyright (C) 2019 Jernej Skrabec <jernej.skrabec@gmail.com>
+ * Copyright (C) 2026 James Hilliard <james.hilliard1@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/mfd/x-powers,ac200.h>
+
+#define AC200_SYS_CONTROL_REG			0x0002
+#define AC200_SYS_CONTROL_CHIP_RESET_DEASSERT	BIT(0)
+#define AC200_SYS_IRQ_ENABLE_REG		0x0004
+#define AC200_SYS_IRQ_INTB_ENABLE		BIT(15)
+#define AC200_SYS_IRQ_INTB_ACTIVE_HIGH		BIT(14)
+#define AC200_SYS_IRQ_RTC			BIT(12)
+#define AC200_SYS_IRQ_EPHY			BIT(8)
+#define AC200_SYS_IRQ_TVE			BIT(4)
+#define AC200_SYS_IRQ_STATUS_REG		0x0006
+
+/* Interface register accessible from every register page. */
+#define AC200_TWI_REG_ADDR_H	0x00fe
+#define AC200_MAX_REG		0xa1f2
+
+static const struct regmap_range_cfg ac200_range_cfg[] = {
+	{
+		.range_max = AC200_MAX_REG,
+		.selector_reg = AC200_TWI_REG_ADDR_H,
+		.selector_mask = 0xff,
+		.window_len = 256,
+	},
+};
+
+/*
+ * Each AC200 sub-block can reset independently, invalidating its register
+ * contents without regmap's knowledge. Cache only the common page selector;
+ * this avoids a selector read-modify-write for every access on the same page
+ * without ever returning stale functional-register values.
+ */
+static bool ac200_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return reg != AC200_TWI_REG_ADDR_H;
+}
+
+static const struct regmap_config ac200_regmap_config = {
+	.name = "ac200",
+	.reg_bits = 8,
+	.reg_stride = 2,
+	.val_bits = 16,
+	.ranges = ac200_range_cfg,
+	.num_ranges = ARRAY_SIZE(ac200_range_cfg),
+	.max_register = AC200_MAX_REG,
+	.volatile_reg = ac200_volatile_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+static const struct regmap_irq ac200_irqs[] = {
+	REGMAP_IRQ_REG(AC200_IRQ_TVE, 0, AC200_SYS_IRQ_TVE),
+	REGMAP_IRQ_REG(AC200_IRQ_EPHY, 0, AC200_SYS_IRQ_EPHY),
+	REGMAP_IRQ_REG(AC200_IRQ_RTC, 0, AC200_SYS_IRQ_RTC),
+};
+
+/*
+ * SYS_IRQ_ENABLE is an enable register rather than a mask register, hence
+ * unmask_base. SYS_IRQ_STATUS reflects the source levels, so the function
+ * which raised an interrupt is responsible for clearing it.
+ */
+static const struct regmap_irq_chip ac200_irq_chip = {
+	.name = "ac200",
+	.status_base = AC200_SYS_IRQ_STATUS_REG,
+	.unmask_base = AC200_SYS_IRQ_ENABLE_REG,
+	.num_regs = 1,
+	.irqs = ac200_irqs,
+	.num_irqs = ARRAY_SIZE(ac200_irqs),
+};
+
+static const struct mfd_cell ac200_cells[] = {
+	{
+		.name = "ac200-codec",
+		.of_compatible = "x-powers,ac200-codec",
+	}, {
+		.name = "ac200-tve",
+		.of_compatible = "x-powers,ac200-tve",
+	},
+};
+
+static void ac200_disable_intb(void *data)
+{
+	struct regmap *regmap = data;
+	int ret;
+
+	ret = regmap_clear_bits(regmap, AC200_SYS_IRQ_ENABLE_REG,
+				AC200_SYS_IRQ_INTB_ENABLE);
+	if (ret)
+		dev_err(regmap_get_device(regmap), "failed to disable INTB: %d\n",
+			ret);
+}
+
+static int ac200_init_irq(struct device *dev, struct regmap *regmap, int irq)
+{
+	struct regmap_irq_chip_data *irq_data;
+	unsigned int trigger;
+	u16 value = 0;
+	int ret;
+
+	trigger = irq_get_trigger_type(irq);
+	if (trigger == IRQ_TYPE_NONE)
+		trigger = IRQ_TYPE_LEVEL_LOW;
+
+	switch (trigger) {
+	case IRQ_TYPE_LEVEL_HIGH:
+		value |= AC200_SYS_IRQ_INTB_ACTIVE_HIGH;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		break;
+	default:
+		return dev_err_probe(dev, -EINVAL,
+				     "INTB is level triggered, not type %u\n",
+				     trigger);
+	}
+
+	/* Keep INTB disabled until the sources are masked and the IRQ is ready. */
+	ret = regmap_update_bits(regmap, AC200_SYS_IRQ_ENABLE_REG,
+				 AC200_SYS_IRQ_INTB_ENABLE |
+				 AC200_SYS_IRQ_INTB_ACTIVE_HIGH, value);
+	if (ret)
+		return ret;
+
+	ret = devm_regmap_add_irq_chip(dev, regmap, irq, trigger | IRQF_ONESHOT, 0,
+				       &ac200_irq_chip, &irq_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add IRQ chip\n");
+
+	/* Disable INTB before the IRQ chip and regmap are released. */
+	ret = devm_add_action_or_reset(dev, ac200_disable_intb, regmap);
+	if (ret)
+		return ret;
+
+	return regmap_set_bits(regmap, AC200_SYS_IRQ_ENABLE_REG,
+			       AC200_SYS_IRQ_INTB_ENABLE);
+}
+
+static int ac200_add_devices(struct device *dev)
+{
+	struct mfd_cell cells[ARRAY_SIZE(ac200_cells)];
+	unsigned int num_cells = 0;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(ac200_cells); i++) {
+		const struct mfd_cell *cell = &ac200_cells[i];
+		struct device_node *child;
+
+		child = of_get_compatible_child(dev->of_node,
+						cell->of_compatible);
+		if (!child)
+			continue;
+		if (of_device_is_available(child))
+			cells[num_cells++] = *cell;
+		of_node_put(child);
+	}
+
+	if (!num_cells)
+		return 0;
+
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cells, num_cells,
+				   NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to add function devices\n");
+
+	return 0;
+}
+
+static int ac200_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct regmap *regmap;
+	struct clk *clk;
+	int ret;
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to enable input clock\n");
+
+	ret = devm_clk_rate_exclusive_get(dev, clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to lock clock rate\n");
+
+	/*
+	 * No minimum delay is documented. Retain the BSP resume path's 40 ms wait
+	 * after enabling the input clock and before register access.
+	 */
+	msleep(40);
+
+	regmap = devm_regmap_init_i2c(client, &ac200_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "failed to initialize regmap\n");
+
+	ret = regmap_set_bits(regmap, AC200_SYS_CONTROL_REG,
+			      AC200_SYS_CONTROL_CHIP_RESET_DEASSERT);
+	if (ret)
+		return ret;
+
+	if (client->irq > 0) {
+		ret = ac200_init_irq(dev, regmap, client->irq);
+		if (ret)
+			return ret;
+	}
+
+	/* AC200 and its children do not perform DMA. */
+	dev->coherent_dma_mask = 0;
+	dev->dma_mask = &dev->coherent_dma_mask;
+
+	return ac200_add_devices(dev);
+}
+
+static const struct of_device_id ac200_of_match[] = {
+	{ .compatible = "x-powers,ac200" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ac200_of_match);
+
+static const struct i2c_device_id ac200_i2c_ids[] = {
+	{ .name = "ac200" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ac200_i2c_ids);
+
+static struct i2c_driver ac200_driver = {
+	.driver = {
+		.name = "ac200",
+		.of_match_table = ac200_of_match,
+	},
+	.probe = ac200_probe,
+	.id_table = ac200_i2c_ids,
+};
+module_i2c_driver(ac200_driver);
+
+MODULE_AUTHOR("Jernej Skrabec <jernej.skrabec@gmail.com>");
+MODULE_AUTHOR("James Hilliard <james.hilliard1@gmail.com>");
+MODULE_DESCRIPTION("X-Powers AC200 MFD core driver");
+MODULE_LICENSE("GPL");

-- 
2.53.0

