Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D98166F1F
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Aug 2024 19:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722626581; cv=none; b=sXcc86Oey/RXqtoevzZp8yRq9zgZKXEfjuJeT7FZ+9h5CNzGJdBKGz7sCDV2s2byYxpTp5LGj2P3SqO2n4/a/EOi/Qt/G37nMg0FkQpOFhdpdfWqI55RfQNjzfkp3yGDEPDR5YnNksZbhCXscCGGmB/JtzKK342C4CkvbzGUYFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722626581; c=relaxed/simple;
	bh=AnxZP1FhbIiTw7qgVtLdTml6aLbQDPHhBgPYaEPu9ac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JxhWxNkMhIiNdGySEyMVvMW0MUGMECn38o66jbibm7BaHRM2hcC+uDf10U7tzPKx5dK0RNiFx36SZj1uddhbToIbM7Vo9XDAPXeJbGDXLHQhuB4ISfPtB4HFIW1JAvb8dlg9uhO2MEJS+/ch7eOjBWuI6g0fxzXcXIZYj9g67z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/pTqbCb; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/pTqbCb"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3db23a60850so4566072b6e.0
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Aug 2024 12:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722626579; x=1723231379; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6u+FjoNfAIrSP8vvJhv6wXYDtHqwQQPD0jrS5e6x2g=;
        b=R/pTqbCb8vQ7yv+JQ2ba81v/bi9tN2q30ZpgaMJL8RqBq7rnkQn+oX2uKHEOBhyvH7
         eETpLqw73+lCIkAkyA5ZAwCWGosors0UoRRXjj3aM7gx+SMqlNYN3K4c0OoPtIsXCnRs
         doItC46dVgCLxFgaFUDyL0MomTN7He3YIoqH5h2FBFhMyg89lIOfZjkneSW2jtQTBBc9
         BkQZ2U1WaSQ24p2urVDCI1lfz/PJZnZB2RGZZQxa+3V1nM2YefGhXZoOiorhtdRlWX74
         8znMFJle4wp+tm7Y1JchwBC/fWuUfLkCkkF7X7fXrqBdFL6pdfdXxfh6TQJQWSL7Xl+V
         G+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722626579; x=1723231379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6u+FjoNfAIrSP8vvJhv6wXYDtHqwQQPD0jrS5e6x2g=;
        b=sa+Kxb/H6zVtdgyypuJ2W+rKB3RkIMH6ILqZY8Q0wn+GCH6hHWqaTedgP1xawwq0+z
         cSOGkr39Yyoi3zpwAoujp7mwuiWh1mFHyuaiXtYAG2TUDCSRS5zk5EZaZClECRnCgtKH
         MgWT9FkhmqFBGqD52tWUc1a0rWZJ+OqIvAGkcmQbzzbPb8VNiqwKpt1iE8/m+JPes6Wu
         m7zUeieMy61D929ntYhxf1qomZK1yLd/bA76X4g36wdIq1wmMiI/Pk4YabM3d+w+YiVU
         DimR0X2tEU4h8WMx+QUYm0FFnpNV0gEhkenHTwimUdeqvubjz520LkfwzVX4yJmEo6yY
         s3KA==
X-Gm-Message-State: AOJu0Yw14wHwsQFev8HTblvWppzAi9SkEvrjn0D9byBpCfieEbrEHnky
	qnHxppenqU67TnnpYHFNsl+dyRXmZSZSktFSHSVSFQe+4zhC16d/oP+ONg==
X-Google-Smtp-Source: AGHT+IES15dii3KMN0EmuxDAjKqL5UDHMMGUgVak5DAQxFnN1Kt6oly4wkinZCyQh4SEf8UtgJY7ig==
X-Received: by 2002:a05:6808:bc6:b0:3d9:28e5:5865 with SMTP id 5614622812f47-3db55813a9cmr6357865b6e.21.1722626579070;
        Fri, 02 Aug 2024 12:22:59 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db563b7065sm584592b6e.46.2024.08.02.12.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 12:22:58 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	quentin.schulz@free-electrons.com,
	mripard@kernel.org,
	tgamblin@baylibre.com,
	aidanmacdonald.0x0@gmail.com,
	u.kleine-koenig@pengutronix.de,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	sre@kernel.org,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lars@metafoo.de,
	jic23@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 11/15] mfd: axp20x: Add ADC, BAT, and USB cells for AXP717
Date: Fri,  2 Aug 2024 14:20:22 -0500
Message-Id: <20240802192026.446344-12-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240802192026.446344-1-macroalpha82@gmail.com>
References: <20240802192026.446344-1-macroalpha82@gmail.com>
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
 drivers/mfd/axp20x.c       | 25 ++++++++++++++++++++++++-
 include/linux/mfd/axp20x.h | 27 +++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index dacd3c96c9f5..4051551757f2 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -209,13 +209,23 @@ static const struct regmap_access_table axp313a_volatile_table = {
 };
 
 static const struct regmap_range axp717_writeable_ranges[] = {
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
@@ -308,6 +318,12 @@ static const struct resource axp22x_usb_power_supply_resources[] = {
 	DEFINE_RES_IRQ_NAMED(AXP22X_IRQ_VBUS_REMOVAL, "VBUS_REMOVAL"),
 };
 
+static const struct resource axp717_usb_power_supply_resources[] = {
+	DEFINE_RES_IRQ_NAMED(AXP717_IRQ_VBUS_OVER_V, "VBUS_OVER_V"),
+	DEFINE_RES_IRQ_NAMED(AXP717_IRQ_VBUS_PLUGIN, "VBUS_PLUGIN"),
+	DEFINE_RES_IRQ_NAMED(AXP717_IRQ_VBUS_REMOVAL, "VBUS_REMOVAL"),
+};
+
 /* AXP803 and AXP813/AXP818 share the same interrupts */
 static const struct resource axp803_usb_power_supply_resources[] = {
 	DEFINE_RES_IRQ_NAMED(AXP803_IRQ_VBUS_PLUGIN, "VBUS_PLUGIN"),
@@ -422,7 +438,7 @@ static const struct regmap_config axp717_regmap_config = {
 	.val_bits = 8,
 	.wr_table = &axp717_writeable_table,
 	.volatile_table = &axp717_volatile_table,
-	.max_register = AXP717_CPUSLDO_CONTROL,
+	.max_register = AXP717_ADC_DATA_L,
 	.cache_type = REGCACHE_MAPLE,
 };
 
@@ -1024,6 +1040,13 @@ static struct mfd_cell axp313a_cells[] = {
 static struct mfd_cell axp717_cells[] = {
 	MFD_CELL_NAME("axp20x-regulator"),
 	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
+	MFD_CELL_OF("axp717-adc",
+		    NULL, NULL, 0, 0, "x-powers,axp717-adc"),
+	MFD_CELL_OF("axp20x-usb-power-supply",
+		    axp717_usb_power_supply_resources, NULL, 0, 0,
+		    "x-powers,axp717-usb-power-supply"),
+	MFD_CELL_OF("axp20x-battery-power-supply",
+		    NULL, NULL, 0, 0, "x-powers,axp717-battery-power-supply"),
 };
 
 static const struct resource axp288_adc_resources[] = {
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index 8c0a33a2e9ce..f4dfc1871a95 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -115,6 +115,16 @@ enum axp20x_variants {
 #define AXP313A_IRQ_STATE		0x21
 
 #define AXP717_ON_INDICATE		0x00
+#define AXP717_PMU_STATUS_2		0x01
+#define AXP717_BC_DETECT		0x05
+#define AXP717_PMU_FAULT		0x08
+#define AXP717_MODULE_EN_CONTROL_1	0x0b
+#define AXP717_MIN_SYS_V_CONTROL	0x15
+#define AXP717_INPUT_VOL_LIMIT_CTRL	0x16
+#define AXP717_INPUT_CUR_LIMIT_CTRL	0x17
+#define AXP717_MODULE_EN_CONTROL_2	0x19
+#define AXP717_BOOST_CONTROL		0x1e
+#define AXP717_VSYS_V_POWEROFF		0x24
 #define AXP717_IRQ0_EN			0x40
 #define AXP717_IRQ1_EN			0x41
 #define AXP717_IRQ2_EN			0x42
@@ -125,6 +135,9 @@ enum axp20x_variants {
 #define AXP717_IRQ2_STATE		0x4a
 #define AXP717_IRQ3_STATE		0x4b
 #define AXP717_IRQ4_STATE		0x4c
+#define AXP717_ICC_CHG_SET		0x62
+#define AXP717_ITERM_CHG_SET		0x63
+#define AXP717_CV_CHG_SET		0x64
 #define AXP717_DCDC_OUTPUT_CONTROL	0x80
 #define AXP717_DCDC1_CONTROL		0x83
 #define AXP717_DCDC2_CONTROL		0x84
@@ -145,6 +158,19 @@ enum axp20x_variants {
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
@@ -484,6 +510,7 @@ enum {
 	AXP717_CLDO3,
 	AXP717_CLDO4,
 	AXP717_CPUSLDO,
+	AXP717_BOOST,
 	AXP717_REG_ID_MAX,
 };
 
-- 
2.34.1

