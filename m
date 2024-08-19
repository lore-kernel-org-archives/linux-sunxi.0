Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3440187FFF
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 16:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724086134; cv=none; b=AnyCQxwziNMUpBGkoQxQAi7w+Imrkwts5y1U226dmOJEBdQN4fFsDcx575QCduByWkFhQy4Z0Jp8KYRYrTzmkC1czxtcrS6EV5kS64OUoSimpVGiIs2KEQnQEujOqBle+W0bZAj36zJWurnPjf/972ezrGuGF9X/7pvwGPPAUbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724086134; c=relaxed/simple;
	bh=AnxZP1FhbIiTw7qgVtLdTml6aLbQDPHhBgPYaEPu9ac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V3ZWbPORmsiMpNf97a32vsf+5TOcLauctGjq1ZcNxR1cE2hZhzR3Z34mWkp7VklqLh43qlV7I43N6mDi+t998vb4d7ohgz1r2x+CjvCeC93dD0rX64FvVBexKTe/p+01F1HZXxTAR6dmi6Akna4s0q1pkWF/ertm+qqPKWJroX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uj/xpDJ0; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uj/xpDJ0"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-70cb3eb4461so897207a34.1
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 09:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724086132; x=1724690932; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6u+FjoNfAIrSP8vvJhv6wXYDtHqwQQPD0jrS5e6x2g=;
        b=Uj/xpDJ0htUdPtk96nyM5r5Rqw0zuLnGLlcAonN88491NMyazDM37DpjVilKkJ6efE
         h4iq6GE2pEiZXnYF/vper+UEIvJlhJ1+wh6oPWAeNo4BXPVZhVy6PyaMV+rv1/HmX5/u
         IZO2pn2A0OSOao6h8GEvVsAOtmhMLzls/EzFh9mCTBEgILt92uIMNeHvMcN0LTwIAEhu
         ChZ2EoKIAlScpqgISdozq6XZmIXL4smX69HHoADw4IsNyihfVKTdLIz8SAAFBWwgQD+W
         clAfNd2o7sZoxa2PRhAc+knluAReHRqLAnmSe27AOEak5gMbyMWzeTM2SyK95gqNVJb2
         XKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724086132; x=1724690932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6u+FjoNfAIrSP8vvJhv6wXYDtHqwQQPD0jrS5e6x2g=;
        b=iv346e9fpnFndE/B7/YjhX1kVybc82pS2SCgx7/FwYg1OUFIB2T/zx2H2jCepwwJy+
         cjSzte1ZjJ5nDAkyhk4/CzIUzSPYMvMGv0/yiPvVTK0WcQxfiVC8TnJ0DxWT6pAT9Ynd
         En6HOa3hRIzgdinueE5Iz5pt5CLvWFgZD73VuRXWhJbH9mfBgtYqRRJr6veSYZ5ZzR6g
         VUd7NOnDOn8pIhLh1Tvd9f0NChQPIONtpzCASETyiJTLLUs+LHgvP3Rum1BMrVWE6Mw1
         6M8QThacslp0rI4XYkW/DGnhGhZAedrR3JpUdKIiUT4OiqsmCnqR6b17x8J1gCCa8+t1
         Dl4g==
X-Gm-Message-State: AOJu0YzpnJreNfgoHkdisYwQ06TmlDjxeHYmSINv2jsbZULIBe0EXDHH
	O6LTzGd6zvECTGgKz7wxhmQ+md6nLH/iEMgVpenmmlBbnlC6cx0+50/BUQ==
X-Google-Smtp-Source: AGHT+IE+qRwvUyn+ghEnlNA2FDgLk/Q7iiqC/0u7+41VM28tCsG8R3u8V5KG44yAdufJjxow4hsiug==
X-Received: by 2002:a05:6830:3152:b0:703:629c:5e03 with SMTP id 46e09a7af769-70ded3813bfmr85939a34.13.1724086131790;
        Mon, 19 Aug 2024 09:48:51 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70ca649c61csm2332428a34.26.2024.08.19.09.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 09:48:51 -0700 (PDT)
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
	jonathan.cameron@huawei.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 11/15] mfd: axp20x: Add ADC, BAT, and USB cells for AXP717
Date: Mon, 19 Aug 2024 11:46:15 -0500
Message-Id: <20240819164619.556309-12-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240819164619.556309-1-macroalpha82@gmail.com>
References: <20240819164619.556309-1-macroalpha82@gmail.com>
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

