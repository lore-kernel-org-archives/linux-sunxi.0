Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A0342E8E7
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Aug 2026 23:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786489922; cv=none; b=h+jcxvwqKQF8J7UjQ1vsM/MF3U9hZyJsmx2tKUkP+aJZ5VremqVLPBK+IjzEuyVRx1EEtk7w5jmsc6Z5Fe01TUkZLyFD3a1BsfufiKuDVj7zbEp9IIDg/lh7FHwQyu/U1u6ytcqQJpvMboKWemuAy4mktuQVVbthMKsOtZBcOg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786489922; c=relaxed/simple;
	bh=QralU1poZQg09RVKr5NNb/BibZe2gOrv/KNDHTC44yo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uVm/pYvsUed+iZhA2AYhA3gN5eJuI2RPRuGwdUWm3cnicoA+BkwbEjxYa0YebWtH7oUI1mZUqbdV/ZcHqfACXRN89m7dIEPjbv566coq0NjWKGlp33xmAeySXdkOuyB2ttzODc5B6jq7nV2kzdLwxe7vLXgVcg8AkrkxKAmWQaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkTjlxej; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkTjlxej"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7ec58fa3e01so250430a34.1
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Aug 2026 16:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786489919; x=1787094719; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VBgBajntdhkFY7cnFzN+T0hqoforp5BZwweLljzEDt0=;
        b=MkTjlxejjpH13YSD0GQJ6abHJ0yPLemGrIh+r1R8VfzHCvX5D2xlV/vW9lRCwFft3H
         Q8ZHsKqG7aivtqwO9Xn1Ne88MdT7LrGehUTYNVllseoSvbrxGctWa+k0cE305s1/AOZL
         Gcsr9Cs1m7ixRXxam2t54H/VTxG1QrB84FPS3smlQ6esHjzvfUxflcjD9HVxNlIQusuu
         QB+QLufTapQhrlAlOl5grRLuy1BeEF69R6tztuQnnCZ8d5/McVu/ccmY5M42DlTGvDyL
         CNXUw2lpNUJw74FBs2H/p1qxMTUsEPfCH6qkXPGxQY/EQ8sk/xWxUJb6WF1CgTdBWktq
         X1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786489919; x=1787094719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBgBajntdhkFY7cnFzN+T0hqoforp5BZwweLljzEDt0=;
        b=b5lEAfagJYZi6353Ha/5piofy1splMmmqEtE/IQJimDOQKGEQIqfmHB7ZkiH3Fj15q
         sBGb3su0vBgVpjsW2uJyl7f6Ieq7faVy/95d3RbUSHKfMmSnG3fHotiO3eBGVLysMmF6
         E0cBmq7+A81xtnT5OmqjbMOfJ33rQDIQj6pH7XqnovQ9vcMwIomNM7AzEAxnqtXQ6sX6
         7uOr/GAtLAAFdpGnb7MTxRDGRAHItqjgUy7ubSHoGjpkYLTnhTHfQXvT7gyogt6hgFyi
         lkQ7hz98cCV1bbVc/te5mks3K0tb62/lSMssux3AvALgni9MO1SWgKQJsmcgJRd6jDOd
         /4iA==
X-Forwarded-Encrypted: i=1; AHgh+RozuT4WQask1WZwCVBsHMILUa8Stm/WfJmWiNckRUyA6O/B7w1e2jKIFtn63MwyZcl2kwCVSHCJgoWXFA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yys4vWdjHDmh7OGQZhC/Hv2m5sjgC4ODF3objVb6189LmoVjHU/
	yza3JJubiJvlCMMRjYT7YsmrEBVQb3vweVXfwPVW1VdTQLaFoTFegLWs
X-Gm-Gg: AR+sD12UEGYhhLzZuVeVpJaQC+/MUPTOtvPqraRWh4ZUQui9WxyDL1HrISgSLc9pKQk
	ooDW43gfKcZu34YWfN234GxPgzND/ZnQfBPjh6kt4zRKhz7Khd+Zk4D/rkQ21mDVZH6Dy/tW2t7
	RMyWgccF3OkMK5bGMzXTM+r9Ss206jNN8ToLpTcW8TnjJsT+vTr5CQ1ks1SZq/at2d7eAEClcWR
	9zlYYwAKnzBM3w8aJPlswnaXwXtiC3wOiGp17Cv4sHPfMJwH6ZnBVXugRTcP7j+kN36ZKotS8XK
	aWIuxJ/xpv9sZZ7Cn1iAXTbXoNL3Fu95kfvSCnGR01KabCdl+hhvARinWjdrZtDHT3BIBzO0O9X
	OL3Cyon0fcFxXuCURytccOJl9DWeKdH56L4dhORzfo1e7A3owvOlHfKsqPZxBy6C6feKp3pLydK
	b29Z3AxwPqXFcdbW7hfDB8Sl01vhMaAX4Q1W3XUV+V26jYaXc/b0T2JrojCrKKVCHXeauzgMg5O
	Lzpn6EbeXlP0seI5iPYvD5bO2i5qV6osKOTzpWioIlQYeKbEi3CYkBWvBx/XQ2fE3Mh1iJc439o
	wtIlPLl39lWqyNKI0rQpiTZJz0Ng54et5yDesuhZMYdkp+Tqr45ayYnk8gwPWJIu7nxmsUlAeAh
	BFlSQGhLXLSLnAaVh
X-Received: by 2002:a05:6820:c8a:b0:6ae:8a52:ffa5 with SMTP id 006d021491bc7-6b0b2adad44mr401448eaf.23.1786489918939;
        Tue, 11 Aug 2026 16:11:58 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45e3510fa5fsm713176fac.1.2026.08.11.16.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 16:11:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 17:11:31 -0600
Subject: [PATCH v7 2/2] mfd: ac200: Add X-Powers AC200 support
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-submit-ac200-mfd-v7-2-8b06f552a4d7@gmail.com>
References: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
In-Reply-To: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 =?utf-8?q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
 linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The X-Powers AC200 is a mixed-signal companion IC with a paged register
map accessed over I2C.

Enable the shared input clock and prevent its rate from changing. Match
the vendor driver's 40 ms wait before the first register access,
initialize the paged regmap, report the chip and package revision, and
apply common reset.

The Ethernet PHY link endpoint is independently enumerated on its MDIO
bus rather than created as an MFD platform child. Keep the regmap attached
to the AC200 I2C device so a separately enumerated function can resolve
that device, establish its required lifetime relationship and retrieve
the regmap from the provider.

Cache only the common page selector. Individual functions can reset
independently and invalidate their other registers without regmap's
knowledge, so leave all functional registers volatile.

Reset the chip during managed teardown and system shutdown.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mfd/Kconfig  |  11 ++++
 drivers/mfd/Makefile |   1 +
 drivers/mfd/ac200.c  | 163 +++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 175 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index e4fd4572472f..cac3fff5aee9 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -205,6 +205,17 @@ config MFD_AC100
 	  This driver include only the core APIs. You have to select individual
 	  components like codecs or RTC under the corresponding menus.
 
+config MFD_AC200
+	tristate "X-Powers AC200"
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
index 000000000000..0964e637afef
--- /dev/null
+++ b/drivers/mfd/ac200.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * MFD core driver for the X-Powers AC200
+ *
+ * Copyright (C) 2019 Jernej Skrabec <jernej.skrabec@gmail.com>
+ * Copyright (C) 2026 James Hilliard <james.hilliard1@gmail.com>
+ *
+ * Based on the AC100 driver:
+ * Copyright (C) 2016 Chen-Yu Tsai
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#define AC200_SYS_VERSION_REG			0x0000
+#define AC200_SYS_VERSION_PACKAGE_MASK		GENMASK(15, 14)
+#define AC200_SYS_VERSION_CHIP_MASK		GENMASK(11, 0)
+
+#define AC200_SYS_CONTROL_REG			0x0002
+#define AC200_SYS_CONTROL_CHIP_RESET_DEASSERT	BIT(0)
+
+/* Interface register accessible from every register page. */
+#define AC200_TWI_REG_ADDR_H	0x00fe
+#define AC200_MAX_REG		0xa1f2
+
+struct ac200 {
+	struct regmap *regmap;
+};
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
+static void ac200_disable(void *data)
+{
+	struct ac200 *ddata = data;
+
+	regmap_write(ddata->regmap, AC200_SYS_CONTROL_REG, 0);
+}
+
+static int ac200_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	unsigned int version;
+	struct ac200 *ddata;
+	struct clk *clk;
+	int ret;
+
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
+	if (!ddata)
+		return -ENOMEM;
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
+	ddata->regmap = devm_regmap_init_i2c(client, &ac200_regmap_config);
+	if (IS_ERR(ddata->regmap))
+		return dev_err_probe(dev, PTR_ERR(ddata->regmap),
+				     "failed to initialize regmap\n");
+
+	i2c_set_clientdata(client, ddata);
+
+	/*
+	 * No minimum delay is documented. Match the vendor driver's 40 ms delay
+	 * before its first AC200 register access after enabling the input clock.
+	 */
+	msleep(40);
+
+	ret = regmap_read(ddata->regmap, AC200_SYS_VERSION_REG, &version);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to read chip version\n");
+
+	dev_info(dev, "AC200 revision %#lx in package %lu\n",
+		 FIELD_GET(AC200_SYS_VERSION_CHIP_MASK, version),
+		 FIELD_GET(AC200_SYS_VERSION_PACKAGE_MASK, version));
+
+	/* Reset the chip after dependent function drivers have unbound. */
+	ret = devm_add_action_or_reset(dev, ac200_disable, ddata);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ddata->regmap, AC200_SYS_CONTROL_REG, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(ddata->regmap, AC200_SYS_CONTROL_REG,
+			   AC200_SYS_CONTROL_CHIP_RESET_DEASSERT);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void ac200_shutdown(struct i2c_client *client)
+{
+	ac200_disable(i2c_get_clientdata(client));
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
+	.shutdown = ac200_shutdown,
+	.id_table = ac200_i2c_ids,
+};
+module_i2c_driver(ac200_driver);
+
+MODULE_AUTHOR("James Hilliard <james.hilliard1@gmail.com>");
+MODULE_DESCRIPTION("X-Powers AC200 MFD core driver");
+MODULE_LICENSE("GPL");

-- 
2.53.0

