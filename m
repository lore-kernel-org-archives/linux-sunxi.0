Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775875;
	b=WkBWI0Tpp+H6++z5W/rM6jWitYYWV1m3rRra1fnRdsmfRf3cTXHsVwuMrECT2P2nFOhh
	 8IwFE0UdsHMqQPezlWgCiRvvJ8LtESmWRIxIMupoLK8bIaKF2rLiu3OIhv9c3x1AW7rzy
	 VsOIx7cISNMxtPWMosSxIsmVo+xTjGNGC2S32nHqTULlEA+YUH9GcwL5BPy3aMwreuXVd
	 vz5n6+GiMHWRGsPtDZNBmzuOMz3yr8dLnTXCXYIqrEtTfFXYGF5OxkR3o6jTamkIrt++l
	 D0JdlXngGVdXVYl33r9oQGrB7ND4fbcxLLjSMUWp+DIM2y60KD/3Dyy7qsJxyo/yY/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=cH1B6Iuht9cMtUDc/M/94P//50P+MLK9IG4hanh0qHU=;
	b=pVvYbkw76fUnTYAQGlAf7jB3n7r7t7O0WRhjV/ljPk1geh5FgzmC/fkZYPZPVpnEx3Wl
	 q7v5+uqs58aPAoa/rKJ+DAagRHHlTNTUaXGa4ZgrBmsFG9ZPPVTTjzOA//sViXwVMOs3H
	 ReAZtiJ/dE+7OTTWeGpqUrS8+mzr+UjHnPmDvOcORlRelxyEmg1IvggWGXmyLcaNdvyWS
	 p3GZeQzrkesmTJCT75sFp/gQx7irb6RUQhU2c6pXKVX7R3cNwq8dQx72KCMkE9yMyt0YG
	 FkSZbQsaVO0BTENYlFY3Tv54Wt+Eta1B7InqVAYzQMRHHX4+VY1qJP+wtq6h20wz6dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DYmQ5A3z;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A69C606A68D
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 10:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A69C606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DYmQ5A3z
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so68086225e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 02:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795775873; x=1796380673; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cH1B6Iuht9cMtUDc/M/94P//50P+MLK9IG4hanh0qHU=;
        b=DYmQ5A3zBDu+cTFhRH1weBtYL2xsXnUstoxXU+jeAoByhqp9CL6Q8RLAnsZznRd/vk
         ilNTTrizhDYujQTIosiFM6NZH8PH7acVJfqBvB6dthBABhpKnan88vxuSOMZX1A1fIWG
         XVW4PCUQ0wsVcFDs3wlpYpCZdn5MKCVkAkgXop5sernVXD32dhOrzz1edZHuAt+SvXkG
         i3LPeV2sMiOszCQroExjOlQya+VL1FNWkGxZ2TYkZcyGxWRdP4EvA1yTVDMBHGf8Gi3A
         es+w8LOBXWYrTJ27aucRq3c/P7Pa2ASpZtb3ozPeFvBxJx0GdTO1owqCDIryc6nJUMfh
         E6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775873; x=1796380673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cH1B6Iuht9cMtUDc/M/94P//50P+MLK9IG4hanh0qHU=;
        b=KqpoIejdCIcIEFqEoD0rPv4c+5K/p4HPGx/kWebqhs6VlgU06qHoHPgRkM1vwCDY9z
         BUNtw51ZrI4qIyVCvtMrhsIYTSZ46/PBYCixrppbcm3zYHps/fSTjFyu4kSd1QT2nLGM
         kYKJfODH8u6MXi+Ti1ZAJioBtQp0w9K/Rhtz5RLGjkDOgv2kmplr1LfatySH+FKeawWu
         aqmB8+MNK1DAZifb3jZ2d2zpaq4zxn1RNzZY0TW7W7nwzDCVscpohvx9hkxYGSUqmyqN
         raKepMpReFNSrklyM3/gUfY2MNXRie2QzLBxohcHj/SBGwic6InOTKA26Y5HhQgdJblg
         Qwvw==
X-Forwarded-Encrypted: i=1; AL+hErFHIqVcoj6bML8Ty7DChe19t2q1UWd/jX8p8wOxWmGIfvoZMphZgSanWafXnH0Y2P+3Xffcb0yXcXr6TQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Orm3kwSNVJvF1VPWUw+KHvyH750ON40PphPsM7Gc08mfxlZjf
	iCBRrhI2ZO6g8MesCgCpMmhdSPzkXBKzu77Dxgq77isgocxIbITD/PH15/Xlw7y643A=
X-Gm-Gg: AZFdTZefM1/LylM6CdpBHgyTi84iJlS2VYoV9RFgqnb3uDeYOky9+DuXrIQE2IXPlWk
	L6OOgqT8571o9Iqsjr2kVkb+jgCpu8DF2gmQuAbO+YJD2x271j50xqHoJWaenhVkyUYW5x5AFkJ
	tAs6aBZPba6gnjBOdkQTZLNHKH8zhHH9idg1VQBZrt/Q8bKzQRpEbsdHFDqkqki7aWoAjHqRZ53
	MnEMJRRcSXXWuFrf/Sz8FhDY71/1P97D2OAataxdYzmAnIiqnF9qsdK1uqCBG5D8CEpEMKVtJO9
	kzxgJrYtQPrM72bfFtnKRm1O1C9+4C/l1tlc+E0fGyeBJ/rM3G0xO4eOUQb1KCBvHrFwYxZTN8j
	BpmdKxR3P2HxjgY7BERNVYY9bBXcOevLOV7cQw9phBpLS/JqQw/TyAwpLqs0UJFB04W9AgIlJhE
	W311ovFssWMOyFf1euItoq9PuTugRNVkbOoVn7hyKbYlGXcJBPxm0J/OKja+kjZOGcAm+uvdUFP
	cMqvJtnFT8fxyPYDeVh+gNLghkznLGCST/7gYRBG+AETnjuvaSsUdk80kb4453i60jBkTit5Kps
	Acu1BoHRs3jq1TO5t7QCw4Ww7+yxnBduDpvBoqNY4kSHUdgdtUrkWoVEsTFmhtuVhsf23g==
X-Received: by 2002:a05:600c:848d:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4bb88812026mr457679215e9.15.1795775872934;
        Fri, 27 Nov 2026 02:37:52 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm903539005e9.0.2026.11.27.02.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:37:52 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 27 Nov 2026 11:37:38 +0100
Subject: [PATCH v9 4/5] mfd: axp20x: Add support for AXP318W PMIC
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-axp318-regulator-v9-4-986b68f3c4a0@baylibre.com>
References: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
In-Reply-To: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=12979; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=TmuaxKN6c5g8yX7BhkplAay7oqBTL/Kggu6nA8dds+k=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcsVVPz2lbWyzmaHrTdE3n3Xr5/0sfNC27/3xa9+2r9
 teTTefd7ShlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBEBKUZGbZVBlpGvWbwORO1
 Ztb77gctV/ULd8wU7Xh2eK//ntPTljYy/JVIn2muP2/PdYOMumeiAUEubCa/bqaaPlnvEaul9YK
 7jRsA
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
index aac4fe03f7dd..8655a1a59c07 100644
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

