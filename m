Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537095111B5
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Sep 2026 20:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466208; cv=none; b=SAMk/UvmcGdBx1Sb0Av9wJwtTmcZebDELIim1yOdEamt/oH3Ahig5UsVWaQSwO+v37QwJyAtWC2fqdoW1iQixckiMMprXD4GK1EVY75xpPviQ8f7ZcHjXWnDyKKoV3KE5umoMY9w/lUj5/YCfvzMAW33rdhB8TMFjGCmKKnA2co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466208; c=relaxed/simple;
	bh=yFKfRHQGDijdEKRtQlfMmeXlW6cJECeONVvRTmHPL90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NJFBtXOKdglVHYJmxp2K8fP4bpiHP896ppLjqfYiB8PoMcpjv3XjNRhXXmJ3o38ou1gY4b/55Yby/gB3AsK6SlbYpzi4PGH+cFBLytYRMgrC4Oy18rAQy5WBBd7nbqKcDaOR2aK7l8j9np4QGJ1GAMq+cyBpxg9Wi6Bbf1Yn/cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XK1JuMrm; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XK1JuMrm"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4af173320f9so202674b6e.2
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Sep 2026 13:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788466195; x=1789070995; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=85h9R8hU4OlIInyy88aMVvVOyqXeqxmnt2NxcH2V/5I=;
        b=XK1JuMrm2ipDq5VPm62kUnrLOwpgR9xM5RGwMgGeqW2edUNmEyfTSpbJCxaH5fJKtj
         4k817jSk/0V0eDENQjHHZP30eRk+2Lnb8UB78poPvroYXMPb4NGLnEZaBXGheOzBQJoH
         HVneVVnXR2udVowi+Y6gnmk3QGRSUzmOpxidZOD08dVCTrna605RAKcomzsw96lJJ/4a
         Q4L/xRbtF7zGEgTHC53BRNvVEjrusxWCokn5T0sI+buuNnSSmZ3AeYwzjoy26xdLpPX8
         GRT/32odZ3/tpiS95Or0eO8GacBsgRO2wHENvnNWXF8YA4AZxjOre14kfPbzNl/ZquDD
         JJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466195; x=1789070995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=85h9R8hU4OlIInyy88aMVvVOyqXeqxmnt2NxcH2V/5I=;
        b=B4K+J+gSw+6O4/m6Fo2rtPnuFPpiMpB13AwyXxM1p+vcheu3Blfg4/d5erZTGnuCFU
         rD8qthR/hDP8Mn+UlO0a/K0LYVYFdMhIsJMvADNHDALVPK6jUE5jyozjiZbcnstsXGSl
         ZyHjFQFFLXIMbkb7HKvcV1mJ7oQGqx8FTv82NO3XnXtuvHbq5NsVEw9co7cusgqpMMNt
         AOilarOla8m9pRj/7cqXYX4pqmNmR01x5zmNFdiGyKpUw9I5f+zMxtslbbtlN3RU5ibP
         vVm2DXLEhCmrQUa2T5467f6Xm8F+ivibguIVZKzWUP1mqdLspYLTojdtg/Ierqflihse
         NJBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzF+dHbI3OEPvqcSibvyRv3AEQTWiaGUqxpgx+ROkP2OdQ3KdRtxbtGdxZ/xP6vmQ62mAxpCE4jsF8o9w==@lists.linux.dev
X-Gm-Message-State: AFuF++n26gicgXXxgR5wLTCkqthhRVp79Y2s5GMJu4upPhFcefAhqwoe
	/n4Jv0iB/hrVHrAJQTjK+DauI6tks5C0IlXjGyuAVxEU/Udc5LSdkAoM
X-Gm-Gg: AYBFou3YdZYOKLyxHU32qbJMTm8Xv26DLkYuYF5jVOLnOHcAGIg5fYkiSqO/vZCzoAU
	CI78YVuLffZcTPdDdS7NeoHGVUBNP4feAEQSvLhtxDsj68ppWSvgLKgu7tOerJfbg7JGgRMxSwe
	pco00YHtVW8KQNUf/n4T0eMYhA+eR9Q02k/G2KRZCGRgSO2svxRq9jkbOC6gzXku2k8DM1Lj+EX
	rKdXMnvGhlWgLRW/BBX0BfhtZElafNkqRICY8mJaghR04o+Q6qRnxRgMGJ8a1GkSKWIy/cfZjVZ
	64hiQ+AXoCam2Hrh6/eRJ89xX+E3ehXWJBmXkONQIzDSH7gJM0vsWK388B11TfRLA04wUBRclMr
	Rcv1CHIw2Ahv9RuGpsGa5cNWRY+oDYlb8iXfd0yN3gaPGqlY8VpdUjCs3UHfiSskOtyENV4Gddv
	RjzT4Ad86gE1S3O0XJlBSF9nhXxM/s2yNkBS0/mls70MblgbXb26z/NG/87Eg3OquLEH161YAfs
	2nD3+Arwn2dtHj28t0QJtkHOTftCkv7q313qpTP+91iXpOVcUOV17iT/khQajTFo8sfEQQJ6tpk
	2Aj2Dr0j/t3RlrC4jHZF68sYXqhRiqWkf4t0ASJyQgRcXcEn20MjzcRwVqyYMcD7AzFGm0vKWc1
	NPoN3tc7YGtcFmfnyCvE6C9BwYgPQw+4=
X-Received: by 2002:a05:6808:30a4:b0:496:892:c58f with SMTP id 5614622812f47-4b960164768mr965196b6e.2.1788466194662;
        Thu, 03 Sep 2026 13:09:54 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971246d9csm252885b6e.7.2026.09.03.13.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 13:09:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 03 Sep 2026 14:09:41 -0600
Subject: [PATCH v9 2/4] mfd: ac200: Add X-Powers AC200 support
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-submit-ac200-mfd-v9-2-6b7ed278989c@gmail.com>
References: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
In-Reply-To: <20260903-submit-ac200-mfd-v9-0-6b7ed278989c@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The X-Powers AC200 is a mixed-signal companion IC with a paged register
map accessed over I2C.

Enable and rate-lock the shared input clock, wait 40 ms before the first
register access, initialize the paged regmap and deassert the common
reset. Set only the deassert bit instead of forcing a reset cycle, so
state established by firmware or independently powered functions remains
intact. Leave the common reset deasserted during driver removal and system
shutdown; function drivers own their block resets.

The Ethernet PHY is enumerated on its MDIO bus rather than as an MFD
child. It follows the x-powers,ac200 phandle and uses this regmap for
ancillary package-control access. The audio codec and TV encoder are
added as MFD children by subsequent patches.

Cache only the common page selector. Individual functions can reset
independently and invalidate their other registers, so leave all
functional registers volatile.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 MAINTAINERS          |   1 +
 drivers/mfd/Kconfig  |  12 ++++++
 drivers/mfd/Makefile |   1 +
 drivers/mfd/ac200.c  | 113 +++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 127 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 419340093c9b..1d03b0060bda 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29510,6 +29510,7 @@ M:	James Hilliard <james.hilliard1@gmail.com>
 L:	linux-sunxi@lists.linux.dev
 S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
+F:	drivers/mfd/ac200.c
 
 X-POWERS AXP288 PMIC DRIVERS
 M:	Hans de Goede <hansg@kernel.org>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 857ca3bb0d5b..6dea35c8c18e 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -205,6 +205,18 @@ config MFD_AC100
 	  This driver include only the core APIs. You have to select individual
 	  components like codecs or RTC under the corresponding menus.
 
+config MFD_AC200
+	tristate "X-Powers AC200"
+	depends on COMMON_CLK
+	depends on I2C
+	depends on OF
+	select REGMAP_I2C
+	help
+	  Support for the X-Powers AC200 mixed-signal companion IC. The AC200
+	  contains audio, video, RTC and Fast Ethernet PHY functions and is
+	  co-packaged with some Allwinner H6 and H616 SoCs. This driver provides
+	  the shared register access used by the individual function drivers.
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
index 000000000000..94aa13deb0f8
--- /dev/null
+++ b/drivers/mfd/ac200.c
@@ -0,0 +1,113 @@
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
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#define AC200_SYS_CONTROL_REG			0x0002
+#define AC200_SYS_CONTROL_CHIP_RESET_DEASSERT	BIT(0)
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
+	regmap = devm_regmap_init_i2c(client, &ac200_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "failed to initialize regmap\n");
+
+	/*
+	 * No minimum delay is documented. Match the vendor driver's 40 ms delay
+	 * before its first AC200 register access after enabling the input clock.
+	 */
+	msleep(40);
+
+	ret = regmap_set_bits(regmap, AC200_SYS_CONTROL_REG,
+			      AC200_SYS_CONTROL_CHIP_RESET_DEASSERT);
+	if (ret)
+		return ret;
+
+	return 0;
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
+MODULE_AUTHOR("James Hilliard <james.hilliard1@gmail.com>");
+MODULE_DESCRIPTION("X-Powers AC200 MFD core driver");
+MODULE_LICENSE("GPL");

-- 
2.53.0

