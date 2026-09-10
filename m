Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F5245C717
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Sep 2026 10:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037099; cv=none; b=dAqDII+d1NBv0WRblapyxks7ARQCi+ZR+tE3gQjaZa4hg5cBfQ49IH3mS+RX1HL+u9P3+C1sc/8GwzMtwAFcTTy328BRLqZH2zpzMKtstJJdxPN+5VmIyXpniPmVGTVVd/2S1x5eQWd0y4z4gWre903eFoZ6g+K9RhiH/qGvhyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037099; c=relaxed/simple;
	bh=GJPDThOnszeiZ3vt9KH8FW9Eaxz3tFiR4MX/ju/T7HQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NVdgrMeeRI11+/yYfazOUjogVJ85nFxSC7VJla7i/X3QqiAo/91uCNORlhH2V7eOKGPVB0K92IVW0IuK9IKi3nfgG3mzm7wZqHtFX9gqv4E1l5j30zIoHuniQ1b//TN0BKx2Y5EYvtUQUtpCfAaQ5ZV/J0wsEaKDtb4XEGSiqjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=i0qzLPFS; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="i0qzLPFS"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso66377815e9.0
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Sep 2026 03:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789037094; x=1789641894; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4df3jNNf+SwA47LnnMoTuv12BdxZ5QKPK9X6Eu1aAJA=;
        b=i0qzLPFS49dCEkRHW/r+MjMo8LCg3ilCam9+/ruZfyT/Jn+XqzjIC7ajvD75PNzRs4
         3CiXCgU06hgiPISkChsLVOR0Pj326cLVPGkuV8Gp3jpl1u7rwAb+Np3ILV6B9WAqDifB
         amauiF2s8VBqQ9j+SS2XoD9+zhgsRmHZ3VdSZk1of3L+lxhGKgR458J1TtU2G/ITJWq+
         ODg/VUuHSayqU5bRineX5FC5JjkFEWbRlWP9YdKuiiLkd4DAITpqg/K3N9rpbCMkwGRM
         N97MNAVm7HTdrZ5+v87Z/pEuX+I81Q7pJp5JaIB2bW7TQ5igOYbCLJBRiBMbR0Qzv7U1
         +2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789037094; x=1789641894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4df3jNNf+SwA47LnnMoTuv12BdxZ5QKPK9X6Eu1aAJA=;
        b=mR9AVZV8/UFaVnnCwDdshVpKbjLdUP4IoUhmnGO90T23PigsyVTp0LNOBWPjzyLVp3
         0EQxR9tAzzAIrl0/4dFm9HNWrf8zGAbCONw2wsjRz7J6SgWcj1foNKYO0QHon2efhV8w
         vL7nGOaNcN4luT6GgSgCNizR/YBEWWalmRAUGkGqMyb/rzmQDyNU3/FbPI5Qw/pMWL5r
         EM7hSB7aVza8zD0C/v5wkaVcpwMv6sE8Ju2yYMo6m5YprA/s41Nab5vxqxYaRUwbLl8a
         Z/6LhBqxoMCeoelh86ElJeB7I1WHPzW7VkKaxtJ4dP8OOTLbUUpOd8xCpD22mIMGyDc2
         dZRA==
X-Forwarded-Encrypted: i=1; AKwUvBwDSEVtXnfpMX71ZEKS2siV2QOdUb2MZYETtVVfHyGbvHNaqjmypvwdo1xlJA8f+59QCqxo/EUQTGqACw==@lists.linux.dev
X-Gm-Message-State: AFuF++nzA8ybV+UFW7wTR08v1LfUsL0i9vrpNnFmcC65l9TBdoNAS89l
	PQ112gBI8h0nLpHkkO7RS7k+mbhDsEwBLCpYkdMvt3/V8h1STAPo7M6T235MkkUw1p8=
X-Gm-Gg: AYBFou2NParaEg3KzHRemsC9pf4RZ4fB9T7t0dFG3Y5d0GQ8+JrO7DPAfVFsQGJ85Oj
	HwlJ7dqEybju6jhaCVza1eKraP5/3/ANAv9iugxYNs+UxqUPaUBLvJjEr1ImiFmhkmvYss2ok6v
	E9PNUWXCM6ab1zZJQBitnzxVq6iUqXGCvAACxRyx7J9zN6bvllFfbAB/KyjzCGM8vq7NSn62SVE
	69vqiFHVqQIWX7HyHdazqAR4IyrCPOOIGjmlHNIL5aq5iwIRSs3MSvilBVuO+FVTwas+/ye/oGX
	19fV4T0ozMGmzDN8T5XHHsxAcnnb73OFQCuHTvvsRko9FATdaSDO9k18f6BnAql1N43DePXy6E9
	hKfKafbvnxXK95iadpHKkVcr3cfH2lUv+S0R4YifGF59HL9DRU8qz8ZPafDTUjXp1FFRRflmMxP
	l4pdCZajZRcyWfGQXl0Ns/qp6jcbn/d/EMuYpW0iRi6WYSA5pQvQDdws8N+Y94Z5g9fAoEOgBne
	RrZQu/2HC3hu9DKyQ==
X-Received: by 2002:a05:600c:314f:b0:49c:ffde:45ff with SMTP id 5b1f17b1804b1-49cffde4629mr343074845e9.17.1789037093673;
        Thu, 10 Sep 2026 03:44:53 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c04ba2sm63146745e9.12.2026.09.10.03.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:44:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 10 Sep 2026 12:44:38 +0200
Subject: [PATCH v8 4/5] mfd: axp20x: Add support for AXP318W PMIC
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-axp318-regulator-v8-4-e906a61a7f3d@baylibre.com>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
In-Reply-To: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12979; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=8KErW1FkPZKKzrIm6143ej3q+jSd6lOTIZxIGTzIMGo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqoooZtwfiBaHUIc8bzVQcykinbG3jRWKj8fjox
 NIeKZfBzUSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqKKGQAKCRDm/A8cN/La
 hRy8D/9GH+zGwxI2z3NnksSzCSQdAbEpiilj6AFFhkRZAWbZa9WT/fOFqI2qzwqa6nGBxFAqPNB
 eYxtbVCAukj6vUjEdx6TqhxQJxGQ9CC9GR/yKN6vkaHT4kxuUNaNDa0HQXfelX+YJxp2sxro5DC
 ZR7qYdI8We1o3y2xswhEXMgotPIJfwoq6hI161gJu5ULgMVxUuPh8nlGxLmjvU9H/2yUNGvnvtZ
 L+VXqPAFO3WodftTWKMfRoNN5Ht0bv5rocXFQtnH2hIWfukQZjJLcfqK5Umj2Ka8hqI+gt6gId9
 z81ezeFU42Duvvb6aBXHPzzYLiS6Ts0mF7KBwQVyOPH8x2tdPH0/Bf4z/NYkW9zuSVorn+bMHT7
 8J/o+jime1TJ28cySojjjjuWhPc6gKxWiaIj3m+GsFi68TVsJxHnOWNaommCvRu7H/jBsrdjrgt
 4o1lk9JCcxzsIYLPjoR6LAej+NnB/edeG2FXpF2e/dPpmAddYmXmACIRGm8Z/yi4ifEwRDVmeR4
 2xFgxONyaba/66TW9VC+FIIPsK8uArZgvsGcFfU8Hcw7y577j8UzDwdpoj7SIh5gNePhWtLKSyY
 vInDaICxHYkvRlY90mhCOMRcICydeqTvpPxOYZ1BACOZkiEujjQmTvICjVR/TBo0MRrggTLp5i7
 fwA9c4ZFiLIYV3Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

From: Andre Przywara <andre.przywara@arm.com>

The AXP318W is a PMIC chip produced by X-Powers, it can be connected to
an I2C bus.

It has a large number of regulators: 9(!) DCDC buck converters, and 28
LDOs, also some ADCs, interrupts, and a power key.

Describe the regmap and the MFD bits, along with the registers exposed
via I2C only. This covers the regulators and interrupts for now.
Advertise the device using the new compatible string.

We use just "318" for the internal identifiers, for easier typing and
less churn, but use "318W" for anything externally visible. If something
else other than the "AXP318W" shows up, that's an easy change then.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Co-developed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x-i2c.c   |   2 +
 drivers/mfd/axp20x.c       |  88 +++++++++++++++++++++++++++
 include/linux/mfd/axp20x.h | 145 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 235 insertions(+)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index a76bec5604c4..64c212b76e5e 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -66,6 +66,7 @@ static const struct of_device_id axp20x_i2c_of_match[] = {
 	{ .compatible = "x-powers,axp221", .data = (void *)AXP221_ID },
 	{ .compatible = "x-powers,axp223", .data = (void *)AXP223_ID },
 	{ .compatible = "x-powers,axp313a", .data = (void *)AXP313A_ID },
+	{ .compatible = "x-powers,axp318w", .data = (void *)AXP318_ID },
 	{ .compatible = "x-powers,axp323", .data = (void *)AXP323_ID },
 	{ .compatible = "x-powers,axp717", .data = (void *)AXP717_ID },
 	{ .compatible = "x-powers,axp803", .data = (void *)AXP803_ID },
@@ -84,6 +85,7 @@ static const struct i2c_device_id axp20x_i2c_id[] = {
 	{ .name = "axp221",	.driver_data = AXP221_ID },
 	{ .name = "axp223",	.driver_data = AXP223_ID },
 	{ .name = "axp313a",	.driver_data = AXP313A_ID },
+	{ .name = "axp318w",	.driver_data = AXP318_ID },
 	{ .name = "axp323",	.driver_data = AXP323_ID },
 	{ .name = "axp717",	.driver_data = AXP717_ID },
 	{ .name = "axp803",	.driver_data = AXP803_ID },
diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index de6946d4bb13..67ab529ebd2c 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -42,6 +42,7 @@ static const char * const axp20x_model_names[] = {
 	[AXP223_ID] = "AXP223",
 	[AXP288_ID] = "AXP288",
 	[AXP313A_ID] = "AXP313a",
+	[AXP318_ID] = "AXP318W",
 	[AXP323_ID] = "AXP323",
 	[AXP717_ID] = "AXP717",
 	[AXP803_ID] = "AXP803",
@@ -218,6 +219,38 @@ static const struct regmap_access_table axp313a_volatile_table = {
 	.n_yes_ranges = ARRAY_SIZE(axp313a_volatile_ranges),
 };
 
+static const struct regmap_range axp318_writeable_ranges[] = {
+	regmap_reg_range(AXP20X_DATACACHE(0), AXP20X_DATACACHE(3)),
+	regmap_reg_range(AXP318_DCDC_OUTPUT_CONTROL1, AXP318_DCDC_MODE_CTRL1),
+	regmap_reg_range(AXP318_DCDC_MODE_CTRL3, AXP318_DCDC_MODE_CTRL3),
+	regmap_reg_range(AXP318_LDO_OUTPUT_CONTROL1, AXP318_IRQ_EN4),
+	regmap_reg_range(AXP318_IRQ_STATE1, AXP318_IRQ_STATE4),
+	regmap_reg_range(AXP318_SHUTDOWN_SRC_CTRL1, AXP318_POK_CTRL),
+	regmap_reg_range(AXP318_WAKEUP_PWROK_PIN_CFG, AXP318_WAKEUP_PWROK_PIN_CFG),
+	regmap_reg_range(AXP318_TS_PIN_CFG, AXP318_TS_PIN_CFG),
+	regmap_reg_range(AXP318_TEMP_ADC_H_EN, AXP318_TEMP_ADC_H_EN),
+	regmap_reg_range(AXP318_DIE_TEMP_ADC_H_EN, AXP318_DIE_TEMP_ADC_H_EN),
+	regmap_reg_range(AXP318_GPADC_H_EN, AXP318_GPADC_H_EN),
+	regmap_reg_range(AXP318_GPIO_CTRL, AXP318_WDOG_CTRL),
+};
+
+static const struct regmap_range axp318_volatile_ranges[] = {
+	regmap_reg_range(AXP318_IRQ_STATE1, AXP318_IRQ_STATE4),
+	regmap_reg_range(AXP318_POWER_REASON, AXP318_SHUTDOWN_SOURCE),
+	regmap_reg_range(AXP318_TEMP_ADC_H_EN, AXP318_GPADC_L),
+	regmap_reg_range(AXP318_GPIO_INPUT, AXP318_GPIO_INPUT),
+};
+
+static const struct regmap_access_table axp318_writeable_table = {
+	.yes_ranges = axp318_writeable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(axp318_writeable_ranges),
+};
+
+static const struct regmap_access_table axp318_volatile_table = {
+	.yes_ranges = axp318_volatile_ranges,
+	.n_yes_ranges = ARRAY_SIZE(axp318_volatile_ranges),
+};
+
 static const struct regmap_range axp717_writeable_ranges[] = {
 	regmap_reg_range(AXP717_PMU_FAULT, AXP717_MODULE_EN_CONTROL_1),
 	regmap_reg_range(AXP717_MIN_SYS_V_CONTROL, AXP717_BOOST_CONTROL),
@@ -447,6 +480,15 @@ static const struct regmap_config axp313a_regmap_config = {
 	.cache_type = REGCACHE_MAPLE,
 };
 
+static const struct regmap_config axp318_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.wr_table = &axp318_writeable_table,
+	.volatile_table = &axp318_volatile_table,
+	.max_register = AXP318_WDOG_CTRL,
+	.cache_type = REGCACHE_MAPLE,
+};
+
 static const struct regmap_config axp323_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -663,6 +705,28 @@ static const struct regmap_irq axp313a_regmap_irqs[] = {
 	INIT_REGMAP_IRQ(AXP313A, DIE_TEMP_HIGH,		0, 0),
 };
 
+static const struct regmap_irq axp318_regmap_irqs[] = {
+	INIT_REGMAP_IRQ(AXP318, DCDC8_V_LOW,		0, 7),
+	INIT_REGMAP_IRQ(AXP318, DCDC7_V_LOW,		0, 6),
+	INIT_REGMAP_IRQ(AXP318, DCDC6_V_LOW,		0, 5),
+	INIT_REGMAP_IRQ(AXP318, DCDC5_V_LOW,		0, 4),
+	INIT_REGMAP_IRQ(AXP318, DCDC4_V_LOW,		0, 3),
+	INIT_REGMAP_IRQ(AXP318, DCDC3_V_LOW,		0, 2),
+	INIT_REGMAP_IRQ(AXP318, DCDC2_V_LOW,		0, 1),
+	INIT_REGMAP_IRQ(AXP318, DCDC1_V_LOW,		0, 0),
+	INIT_REGMAP_IRQ(AXP318, PEK_RIS_EDGE,		1, 6),
+	INIT_REGMAP_IRQ(AXP318, PEK_FAL_EDGE,		1, 5),
+	INIT_REGMAP_IRQ(AXP318, PEK_SHORT,		1, 4),
+	INIT_REGMAP_IRQ(AXP318, PEK_LONG,		1, 3),
+	INIT_REGMAP_IRQ(AXP318, DIE_TEMP_HIGH_LV2,	1, 2),
+	INIT_REGMAP_IRQ(AXP318, DIE_TEMP_HIGH_LV1,	1, 1),
+	INIT_REGMAP_IRQ(AXP318, DCDC9_V_LOW,		1, 0),
+	INIT_REGMAP_IRQ(AXP318, GPIO3_INPUT,		2, 6),
+	INIT_REGMAP_IRQ(AXP318, GPIO2_INPUT,		2, 5),
+	INIT_REGMAP_IRQ(AXP318, GPIO1_INPUT,		2, 4),
+	INIT_REGMAP_IRQ(AXP318, WDOG_EXPIRE,		3, 0),
+};
+
 static const struct regmap_irq axp717_regmap_irqs[] = {
 	INIT_REGMAP_IRQ(AXP717, SOC_DROP_LVL2,		0, 7),
 	INIT_REGMAP_IRQ(AXP717, SOC_DROP_LVL1,		0, 6),
@@ -884,6 +948,17 @@ static const struct regmap_irq_chip axp313a_regmap_irq_chip = {
 	.num_regs		= 1,
 };
 
+static const struct regmap_irq_chip axp318_regmap_irq_chip = {
+	.name			= "axp318w_irq_chip",
+	.status_base		= AXP318_IRQ_STATE1,
+	.ack_base		= AXP318_IRQ_STATE1,
+	.unmask_base		= AXP318_IRQ_EN1,
+	.init_ack_masked	= true,
+	.irqs			= axp318_regmap_irqs,
+	.num_irqs		= ARRAY_SIZE(axp318_regmap_irqs),
+	.num_regs		= 4,
+};
+
 static const struct regmap_irq_chip axp717_regmap_irq_chip = {
 	.name			= "axp717_irq_chip",
 	.status_base		= AXP717_IRQ0_STATE,
@@ -1061,6 +1136,10 @@ static const struct mfd_cell axp313a_cells[] = {
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
 };
 
+static const struct mfd_cell axp318_cells[] = {
+	MFD_CELL_NAME("axp20x-regulator"),
+};
+
 static const struct mfd_cell axp717_cells[] = {
 	MFD_CELL_NAME("axp20x-regulator"),
 	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
@@ -1248,6 +1327,9 @@ static int axp20x_power_off(struct sys_off_data *data)
 	case AXP313A_ID:
 		shutdown_reg = AXP313A_SHUTDOWN_CTRL;
 		break;
+	case AXP318_ID:
+		shutdown_reg = AXP318_SHUTDOWN_CTRL;
+		break;
 	default:
 		shutdown_reg = AXP20X_OFF_CTRL;
 		break;
@@ -1312,6 +1394,12 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
 		axp20x->regmap_cfg = &axp313a_regmap_config;
 		axp20x->regmap_irq_chip = &axp313a_regmap_irq_chip;
 		break;
+	case AXP318_ID:
+		axp20x->nr_cells = ARRAY_SIZE(axp318_cells);
+		axp20x->cells = axp318_cells;
+		axp20x->regmap_cfg = &axp318_regmap_config;
+		axp20x->regmap_irq_chip = &axp318_regmap_irq_chip;
+		break;
 	case AXP323_ID:
 		axp20x->nr_cells = ARRAY_SIZE(axp313a_cells);
 		axp20x->cells = axp313a_cells;
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index 1badb4868d17..5c307f41a31f 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -19,6 +19,7 @@ enum axp20x_variants {
 	AXP223_ID,
 	AXP288_ID,
 	AXP313A_ID,
+	AXP318_ID,
 	AXP323_ID,
 	AXP717_ID,
 	AXP803_ID,
@@ -116,6 +117,84 @@ enum axp20x_variants {
 #define AXP313A_IRQ_STATE		0x21
 #define AXP323_DCDC_MODE_CTRL2		0x22
 
+#define AXP318_DCDC_OUTPUT_CONTROL1	0x10
+#define AXP318_DCDC_OUTPUT_CONTROL2	0x11
+#define AXP318_DCDC1_CONTROL		0x12
+#define AXP318_DCDC2_CONTROL		0x13
+#define AXP318_DCDC3_CONTROL		0x14
+#define AXP318_DCDC4_CONTROL		0x15
+#define AXP318_DCDC5_CONTROL		0x16
+#define AXP318_DCDC6_CONTROL		0x17
+#define AXP318_DCDC7_CONTROL		0x18
+#define AXP318_DCDC8_CONTROL		0x19
+#define AXP318_DCDC9_CONTROL		0x1a
+#define AXP318_DCDC_MODE_CTRL1		0x1b
+#define AXP318_DCDC_MODE_CTRL3		0x1d
+#define AXP318_LDO_OUTPUT_CONTROL1	0x20
+#define AXP318_LDO_OUTPUT_CONTROL2	0x21
+#define AXP318_LDO_OUTPUT_CONTROL3	0x22
+#define AXP318_LDO_OUTPUT_CONTROL4	0x23
+#define AXP318_ALDO1_CONTROL		0x24
+#define AXP318_ALDO2_CONTROL		0x25
+#define AXP318_ALDO3_CONTROL		0x26
+#define AXP318_ALDO4_CONTROL		0x27
+#define AXP318_ALDO5_CONTROL		0x28
+#define AXP318_ALDO6_CONTROL		0x29
+#define AXP318_BLDO1_CONTROL		0x2a
+#define AXP318_BLDO2_CONTROL		0x2b
+#define AXP318_BLDO3_CONTROL		0x2c
+#define AXP318_BLDO4_CONTROL		0x2d
+#define AXP318_BLDO5_CONTROL		0x2e
+#define AXP318_CLDO1_CONTROL		0x2f
+#define AXP318_CLDO2_CONTROL		0x30
+#define AXP318_CLDO3_CONTROL		0x31
+#define AXP318_CLDO4_CONTROL		0x32
+#define AXP318_CLDO5_CONTROL		0x33
+#define AXP318_DLDO1_CONTROL		0x34
+#define AXP318_DLDO2_CONTROL		0x35
+#define AXP318_DLDO3_CONTROL		0x36
+#define AXP318_DLDO4_CONTROL		0x37
+#define AXP318_DLDO5_CONTROL		0x38
+#define AXP318_DLDO6_CONTROL		0x39
+#define AXP318_ELDO1_CONTROL		0x3a
+#define AXP318_ELDO2_CONTROL		0x3b
+#define AXP318_ELDO3_CONTROL		0x3c
+#define AXP318_ELDO4_CONTROL		0x3d
+#define AXP318_ELDO5_CONTROL		0x3e
+#define AXP318_ELDO6_CONTROL		0x3f
+#define AXP318_IRQ_EN1			0x40
+#define AXP318_IRQ_EN2			0x41
+#define AXP318_IRQ_EN3			0x42
+#define AXP318_IRQ_EN4			0x43
+#define AXP318_IRQ_STATE1		0x48
+#define AXP318_IRQ_STATE2		0x49
+#define AXP318_IRQ_STATE3		0x4a
+#define AXP318_IRQ_STATE4		0x4b
+#define AXP318_POWER_REASON		0x50
+#define AXP318_SHUTDOWN_SOURCE		0x51
+#define AXP318_SHUTDOWN_SRC_CTRL1	0x52
+#define AXP318_SHUTDOWN_SRC_CTRL2	0x53
+#define AXP318_DISCHARGE_OVERTEMP_CTRL	0x54
+#define AXP318_SHUTDOWN_CTRL		0x55
+#define AXP318_WAKEUP_VOFF_CTRL		0x56
+#define AXP318_POK_CTRL			0x57
+#define AXP318_WAKEUP_PWROK_PIN_CFG	0x5d
+#define AXP318_TS_PIN_CFG		0x60
+#define AXP318_TEMP_ADC_H_EN		0x65
+#define AXP318_TEMP_ADC_L		0x66
+#define AXP318_DIE_TEMP_ADC_H_EN	0x67
+#define AXP318_DIE_TEMP_ADC_L		0x68
+#define AXP318_GPADC_H_EN		0x69
+#define AXP318_GPADC_L			0x6a
+#define AXP318_GPIO_CTRL		0x70
+#define AXP318_GPIO_INPUT		0x71
+#define AXP318_GPIO_OUTPUT		0x72
+#define AXP318_PWM_CTRL1		0x73
+#define AXP318_PWM_CTRL2		0x74
+#define AXP318_PWM_CTRL3		0x75
+#define AXP318_BACKUP_BATTERY_CTRL	0x76
+#define AXP318_WDOG_CTRL		0x77
+
 #define AXP717_ON_INDICATE		0x00
 #define AXP717_PMU_STATUS_2		0x01
 #define AXP717_BC_DETECT		0x05
@@ -498,6 +577,50 @@ enum {
 	AXP313A_REG_ID_MAX,
 };
 
+enum {
+	AXP318_DCDC1 = 0,
+	AXP318_DCDC2,
+	AXP318_DCDC3,
+	AXP318_DCDC4,
+	AXP318_DCDC5,
+	AXP318_DCDC6,
+	AXP318_DCDC7,
+	AXP318_DCDC8,
+	AXP318_DCDC9,
+	AXP318_ALDO1,
+	AXP318_ALDO2,
+	AXP318_ALDO3,
+	AXP318_ALDO4,
+	AXP318_ALDO5,
+	AXP318_ALDO6,
+	AXP318_BLDO1,
+	AXP318_BLDO2,
+	AXP318_BLDO3,
+	AXP318_BLDO4,
+	AXP318_BLDO5,
+	AXP318_CLDO1,
+	AXP318_CLDO2,
+	AXP318_CLDO3,
+	AXP318_CLDO4,
+	AXP318_CLDO5,
+	AXP318_DLDO1,
+	AXP318_DLDO2,
+	AXP318_DLDO3,
+	AXP318_DLDO4,
+	AXP318_DLDO5,
+	AXP318_DLDO6,
+	AXP318_ELDO1,
+	AXP318_ELDO2,
+	AXP318_ELDO3,
+	AXP318_ELDO4,
+	AXP318_ELDO5,
+	AXP318_ELDO6,
+	AXP318_SWOUT1,
+	AXP318_SWOUT2,
+	AXP318_RTC_LDO,
+	AXP318_REG_ID_MAX,
+};
+
 enum {
 	AXP717_DCDC1 = 0,
 	AXP717_DCDC2,
@@ -819,6 +942,28 @@ enum axp313a_irqs {
 	AXP313A_IRQ_PEK_RIS_EDGE,
 };
 
+enum axp318_irqs {
+	AXP318_IRQ_DCDC1_V_LOW,
+	AXP318_IRQ_DCDC2_V_LOW,
+	AXP318_IRQ_DCDC3_V_LOW,
+	AXP318_IRQ_DCDC4_V_LOW,
+	AXP318_IRQ_DCDC5_V_LOW,
+	AXP318_IRQ_DCDC6_V_LOW,
+	AXP318_IRQ_DCDC7_V_LOW,
+	AXP318_IRQ_DCDC8_V_LOW,
+	AXP318_IRQ_DCDC9_V_LOW,
+	AXP318_IRQ_DIE_TEMP_HIGH_LV1,
+	AXP318_IRQ_DIE_TEMP_HIGH_LV2,
+	AXP318_IRQ_PEK_LONG,
+	AXP318_IRQ_PEK_SHORT,
+	AXP318_IRQ_PEK_FAL_EDGE,
+	AXP318_IRQ_PEK_RIS_EDGE,
+	AXP318_IRQ_GPIO1_INPUT = 20,
+	AXP318_IRQ_GPIO2_INPUT,
+	AXP318_IRQ_GPIO3_INPUT,
+	AXP318_IRQ_WDOG_EXPIRE = 24,
+};
+
 enum axp717_irqs {
 	AXP717_IRQ_VBUS_FAULT,
 	AXP717_IRQ_VBUS_OVER_V,

-- 
2.53.0

