Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21D51993BB
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Jun 2024 22:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718661966; cv=none; b=MM2cS4TEgyeXb81TJTikm1r+c+MChwsRpVy52PrPDZHv/XwkDCTz6NMctBujIas16ZvDItfuziWewPa5gNe0AJ3hBgTUdee3WzofVy9url7/JvDlexReiu8kyaItfoyDAJm8pKhr4gFlH/GCYCB3OTcgMGfrlWrPqml+URrD5ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718661966; c=relaxed/simple;
	bh=7W+zEzC3vXAhnwwYg1m5125PlBcZ0yMCdMRtGNi+7bQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EKfLz234BqayVqOoNptffY9lzDYb4MDGcLwULKLkIIkZG6Aa4/hi9Tx4bdonB6/vq3A9jm47pC2vQVIuwp22HOwGhOdDcKNQJWFNPxcpJY2Qwzi2GZx+bvtTzW8n1E0Pc+YTCm623BdBwPyGTe9ot35Dh6C1VTmxBfNssqrwBiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U59Waa0i; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U59Waa0i"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6fd622e5d2dso558489a34.3
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Jun 2024 15:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718661963; x=1719266763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwIGCzrn9e+OTRycHSADYLuR/RgspG+7oK+u1Nm/RTs=;
        b=U59Waa0in6P9HuuIF9zXajFxIOIu+6nd4X67aJEnOsjZNEUSYsg1N5N+AQPZv6vqjM
         EBOlun+93XqRGde25CJ6ckuuBcfT/cRQeDaxKo5IxaGXZC+whvch2zWxBfTyZOj4YLK/
         D8JJSI6fAcaZm/WN6yvTktLiSCQNS3KqWq6dAhRwrd9Fzf+unNoinD82+dgPlPsyBoL0
         bpxYrnMln6cq7XpHgE58vMg+T+wp+RMh/5hpPpQ5xs5gTeGIcR+uAo0XY1Dx5BsWPQ/K
         HmkZHfZc2vAvnmOjsrvAXtcb4G45WfPEg3XWucS2UTB0rgwkmHMfHGKbaqLuiAeXH9iG
         mjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718661963; x=1719266763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwIGCzrn9e+OTRycHSADYLuR/RgspG+7oK+u1Nm/RTs=;
        b=o1rrKSHU66KKFMZEvIMBObyCviTLZsqAmyGS/tE7LVBpgCvzWAaYpuo8utbsUEu2hR
         VxxX49ecmA4oM/xDTF5T32FN20ClNnaj9ZQBcjqazLJzW8lU4brkBTj+RaFGaoUCsei+
         DolJSS6Zn9D0lJbZkh23tLgGp5ZiE+ePs8Oo7NnUwIwT61zyFKiMbzc1Bq3OmNY7xIDW
         1WNQE8w+9VLkIO9aAp35Ln1hQTguwC7v68Tydp1HtHfYK1+Wn7evUAlbWpkM0ku5Ctwm
         WBRKu7yiK4WhYMw6RfhqLWcg3drcSeFvj2LJ/f+YpZkUes+mJypw+hYAuScxpPqbnePm
         W56Q==
X-Gm-Message-State: AOJu0Yz6NIIUYpxxcAkNiUWyfhMC+hmiKw9R1QLqwPBG7kE9XgexCtI6
	pAN8Yu8MeDXUEOug1maMk3AcSeKQULZS89dHEQVy3pL9+6mFE7uHuJllPw==
X-Google-Smtp-Source: AGHT+IH+BJi6sHo6LCYmv5GY+d5V0KJOmJZoT5JeyfTGtL7+u2rP6PM8K5xHKrmlkUm+Gxz9BtCinw==
X-Received: by 2002:a9d:5608:0:b0:6f9:88a6:f94f with SMTP id 46e09a7af769-6fb93891669mr11990016a34.31.1718661963480;
        Mon, 17 Jun 2024 15:06:03 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6fb5b1b0fa8sm1664232a34.28.2024.06.17.15.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 15:06:03 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	broonie@kernel.org,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	sre@kernel.org,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lars@metafoo.de,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 4/8] mfd: axp20x: Add ADC, BAT, and USB cells for AXP717
Date: Mon, 17 Jun 2024 17:05:31 -0500
Message-Id: <20240617220535.359021-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617220535.359021-1-macroalpha82@gmail.com>
References: <20240617220535.359021-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the AXP717 PMIC to utilize the ADC (for reading
voltage, current, and temperature information from the PMIC) as well
as the USB charger and battery.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/mfd/axp20x.c                 | 30 +++++++++++++++++++++++++---
 drivers/regulator/axp20x-regulator.c |  2 +-
 include/linux/mfd/axp20x.h           | 26 +++++++++++++++++++++++-
 3 files changed, 53 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 609e7e149681..07db4a11acbc 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -209,15 +209,23 @@ static const struct regmap_access_table axp313a_volatile_table = {
 };
 
 static const struct regmap_range axp717_writeable_ranges[] = {
-	regmap_reg_range(AXP717_MODULE_EN_CONTROL, AXP717_MODULE_EN_CONTROL),
-	regmap_reg_range(AXP717_BOOST_CONTROL, AXP717_BOOST_CONTROL),
+	regmap_reg_range(AXP717_PMU_FAULT, AXP717_MODULE_EN_CONTROL_1),
+	regmap_reg_range(AXP717_MIN_SYS_V_CONTROL, AXP717_BOOST_CONTROL),
+	regmap_reg_range(AXP717_VSYS_V_POWEROFF, AXP717_VSYS_V_POWEROFF),
 	regmap_reg_range(AXP717_IRQ0_EN, AXP717_IRQ4_EN),
 	regmap_reg_range(AXP717_IRQ0_STATE, AXP717_IRQ4_STATE),
+	regmap_reg_range(AXP717_ICC_CHG_SET, AXP717_CV_CHG_SET),
 	regmap_reg_range(AXP717_DCDC_OUTPUT_CONTROL, AXP717_CPUSLDO_CONTROL),
+	regmap_reg_range(AXP717_ADC_CH_EN_CONTROL, AXP717_ADC_CH_EN_CONTROL),
+	regmap_reg_range(AXP717_ADC_DATA_SEL, AXP717_ADC_DATA_SEL),
 };
 
 static const struct regmap_range axp717_volatile_ranges[] = {
+	regmap_reg_range(AXP717_ON_INDICATE, AXP717_PMU_FAULT),
 	regmap_reg_range(AXP717_IRQ0_STATE, AXP717_IRQ4_STATE),
+	regmap_reg_range(AXP717_BATT_PERCENT_DATA, AXP717_BATT_PERCENT_DATA),
+	regmap_reg_range(AXP717_BATT_V_H, AXP717_BATT_CHRG_I_L),
+	regmap_reg_range(AXP717_ADC_DATA_H, AXP717_ADC_DATA_L),
 };
 
 static const struct regmap_access_table axp717_writeable_table = {
@@ -310,6 +318,11 @@ static const struct resource axp22x_usb_power_supply_resources[] = {
 	DEFINE_RES_IRQ_NAMED(AXP22X_IRQ_VBUS_REMOVAL, "VBUS_REMOVAL"),
 };
 
+static const struct resource axp717_usb_power_supply_resources[] = {
+	DEFINE_RES_IRQ_NAMED(AXP717_IRQ_VBUS_PLUGIN, "VBUS_PLUGIN"),
+	DEFINE_RES_IRQ_NAMED(AXP717_IRQ_VBUS_REMOVAL, "VBUS_REMOVAL"),
+};
+
 /* AXP803 and AXP813/AXP818 share the same interrupts */
 static const struct resource axp803_usb_power_supply_resources[] = {
 	DEFINE_RES_IRQ_NAMED(AXP803_IRQ_VBUS_PLUGIN, "VBUS_PLUGIN"),
@@ -424,7 +437,7 @@ static const struct regmap_config axp717_regmap_config = {
 	.val_bits = 8,
 	.wr_table = &axp717_writeable_table,
 	.volatile_table = &axp717_volatile_table,
-	.max_register = AXP717_CPUSLDO_CONTROL,
+	.max_register = AXP717_ADC_DATA_L,
 	.cache_type = REGCACHE_MAPLE,
 };
 
@@ -1026,6 +1039,17 @@ static struct mfd_cell axp313a_cells[] = {
 static struct mfd_cell axp717_cells[] = {
 	MFD_CELL_NAME("axp20x-regulator"),
 	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
+	{
+		.name		= "axp717-adc",
+		.of_compatible	= "x-powers,axp717-adc",
+	},
+	MFD_CELL_OF("axp20x-usb-power-supply",
+		    axp717_usb_power_supply_resources, NULL, 0, 0,
+		    "x-powers,axp717-usb-power-supply"),
+	{
+		.name		= "axp20x-battery-power-supply",
+		.of_compatible	= "x-powers,axp717-battery-power-supply",
+	},
 };
 
 static const struct resource axp288_adc_resources[] = {
diff --git a/drivers/regulator/axp20x-regulator.c b/drivers/regulator/axp20x-regulator.c
index 20bef3971fec..a8e91d9d028b 100644
--- a/drivers/regulator/axp20x-regulator.c
+++ b/drivers/regulator/axp20x-regulator.c
@@ -837,7 +837,7 @@ static const struct regulator_desc axp717_regulators[] = {
 		 AXP717_LDO1_OUTPUT_CONTROL, BIT(4)),
 	AXP_DESC(AXP717, BOOST, "boost", "vin1", 4550, 5510, 64,
 		 AXP717_BOOST_CONTROL, AXP717_BOOST_V_OUT_MASK,
-		 AXP717_MODULE_EN_CONTROL, BIT(4)),
+		 AXP717_MODULE_EN_CONTROL_2, BIT(4)),
 };
 
 /* DCDC ranges shared with AXP813 */
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index 5e86b976c4ca..f4dfc1871a95 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -115,8 +115,16 @@ enum axp20x_variants {
 #define AXP313A_IRQ_STATE		0x21
 
 #define AXP717_ON_INDICATE		0x00
-#define AXP717_MODULE_EN_CONTROL	0x19
+#define AXP717_PMU_STATUS_2		0x01
+#define AXP717_BC_DETECT		0x05
+#define AXP717_PMU_FAULT		0x08
+#define AXP717_MODULE_EN_CONTROL_1	0x0b
+#define AXP717_MIN_SYS_V_CONTROL	0x15
+#define AXP717_INPUT_VOL_LIMIT_CTRL	0x16
+#define AXP717_INPUT_CUR_LIMIT_CTRL	0x17
+#define AXP717_MODULE_EN_CONTROL_2	0x19
 #define AXP717_BOOST_CONTROL		0x1e
+#define AXP717_VSYS_V_POWEROFF		0x24
 #define AXP717_IRQ0_EN			0x40
 #define AXP717_IRQ1_EN			0x41
 #define AXP717_IRQ2_EN			0x42
@@ -127,6 +135,9 @@ enum axp20x_variants {
 #define AXP717_IRQ2_STATE		0x4a
 #define AXP717_IRQ3_STATE		0x4b
 #define AXP717_IRQ4_STATE		0x4c
+#define AXP717_ICC_CHG_SET		0x62
+#define AXP717_ITERM_CHG_SET		0x63
+#define AXP717_CV_CHG_SET		0x64
 #define AXP717_DCDC_OUTPUT_CONTROL	0x80
 #define AXP717_DCDC1_CONTROL		0x83
 #define AXP717_DCDC2_CONTROL		0x84
@@ -147,6 +158,19 @@ enum axp20x_variants {
 #define AXP717_CLDO3_CONTROL		0x9d
 #define AXP717_CLDO4_CONTROL		0x9e
 #define AXP717_CPUSLDO_CONTROL		0x9f
+#define AXP717_BATT_PERCENT_DATA	0xa4
+#define AXP717_ADC_CH_EN_CONTROL	0xc0
+#define AXP717_BATT_V_H			0xc4
+#define AXP717_BATT_V_L			0xc5
+#define AXP717_VBUS_V_H			0xc6
+#define AXP717_VBUS_V_L			0xc7
+#define AXP717_VSYS_V_H			0xc8
+#define AXP717_VSYS_V_L			0xc9
+#define AXP717_BATT_CHRG_I_H		0xca
+#define AXP717_BATT_CHRG_I_L		0xcb
+#define AXP717_ADC_DATA_SEL		0xcd
+#define AXP717_ADC_DATA_H		0xce
+#define AXP717_ADC_DATA_L		0xcf
 
 #define AXP806_STARTUP_SRC		0x00
 #define AXP806_CHIP_ID			0x03
-- 
2.34.1

