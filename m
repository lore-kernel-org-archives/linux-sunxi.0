Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519F217ADF8
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Aug 2024 21:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724277456; cv=none; b=We5CV+kaRO0gk3hlsiv3CNfqpETOweFprOcpFnah1WtMbiStXG3dnjT36wk0wE28o7KLfqnEa/nsj2iLXxVK2e86O0eQ9fIuC2Dw2NdI9o5v7ejq3G25vjv5vCcx2k6oceEFxsPakNlol2UQ9mmIQpcxDjLfEOHe90IBrbykU2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724277456; c=relaxed/simple;
	bh=PXcsBzwFl2GwJIvfGM2Lg71OZ1PddeIewm5S+RRkQ44=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jL6xPkg4AG+64ABRGBCUXFnpb4GUgeq0VfsnHzdNPa5aOziKL8XJSFUbBT6DmOimcoQMYlckd33RzUkylK2KkFDtvc/eSinWLqLrZEtUdVQZyy8Ygm08Zgnawt+wS/FZ2SpQqI6eZlQtolCa4DfJpunkq83pZXSYlyNN1h5vSh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCUBtO95; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCUBtO95"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3db157d3bb9so79387b6e.2
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Aug 2024 14:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724277452; x=1724882252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0UhxZ2XxQFgvUjgiU5dDgFB2D6T8k8pYUXnFuEDKNs=;
        b=LCUBtO95vhDzP8VKKqEicHTCoKYXl72bnxJhRan7P4j2ZJUWRTcitJotyi6eNgxXU6
         31Fu0AwIRjexmCJMmn6IXIdFcv3LBWnTmmxpHvcvQFfI1SyFzg08IL/lg+hXUDJ4Oxd2
         98ICTuurQ6NjiypegLPu7lUZgQGdCM0ZE350KqlCiWQ/hnWTWobl6PJN3Ph36g61+rCz
         F+c3CQFznU0KoNF2c2pDmjuiiZhKBKQvFb3G6PhM9wy59p/YMV+0WlqVea8xEpckKqG1
         mIVsUGqrncyw0Ih8sKzpP6qz4BirWOAidmxrx+9WPrPZBwwM35PkuG/oMmeZVRn7nYxa
         zUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724277452; x=1724882252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0UhxZ2XxQFgvUjgiU5dDgFB2D6T8k8pYUXnFuEDKNs=;
        b=kMn6wWNtrDV/JXv7P4n4NWBjRvouG54k5afcRCj2n7OnhzcQEPtIIedqPJhFU49KuX
         R2zOlvTHwIdef9lYajj9m9zgRUohO9vOtCpAAQ+MONWqi0FNI1Tyk4AxD+cjFvBQRSEj
         0l06n/BqlG4hi6hmxC4XslJW1aq24rYOhynyawBUKAScQHu+QVGNnLZcXgNxg8CXanWH
         mRYjN8c7QcQ5P9Gfo8pmHKirpatHs3cO83lCcA/q6f2aKlsTOXyDRMBYb7+XnZHhiyeb
         kuvBwwvf1qowuWGYBMj3jU0Nocx5HgdxdVJ4C6SvCGKgMP8kJPk35PUyyn/YpK34DZK/
         p/8w==
X-Gm-Message-State: AOJu0YxKl/dYbhm3TJqzbQ3CDlO+ww3bWWkselFEcMfsZLvld56H8xXp
	lr497G1YTKsYgcqzFOAOnlkQgsEL0VsQpj2yEi2yPIerioAF05KDc54jsw==
X-Google-Smtp-Source: AGHT+IG0XI2TE/eI97M843RE/qlc7osFS8BEftni9pYq41Isvj2l2mBUFv5vVdUHIaSBnu9JP0w/Sw==
X-Received: by 2002:a05:6808:1142:b0:3db:1661:4d64 with SMTP id 5614622812f47-3de194f34a2mr4379695b6e.13.1724277452201;
        Wed, 21 Aug 2024 14:57:32 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:81a9:2325:e0f7:7376])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3de225555b6sm47070b6e.17.2024.08.21.14.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 14:57:31 -0700 (PDT)
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
Subject: [PATCH V4 04/15] power: supply: axp20x_usb_power: Make VBUS and IIO config per device
Date: Wed, 21 Aug 2024 16:54:45 -0500
Message-Id: <20240821215456.962564-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821215456.962564-1-macroalpha82@gmail.com>
References: <20240821215456.962564-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Make reading of the vbus value and configuring of the iio channels
device specific, to allow additional devices (such as the AXP717) to
be supported by this driver.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/power/supply/axp20x_usb_power.c | 87 +++++++++++++++----------
 1 file changed, 54 insertions(+), 33 deletions(-)

diff --git a/drivers/power/supply/axp20x_usb_power.c b/drivers/power/supply/axp20x_usb_power.c
index dae7e5cfc54e..cd9e92f2ce71 100644
--- a/drivers/power/supply/axp20x_usb_power.c
+++ b/drivers/power/supply/axp20x_usb_power.c
@@ -45,6 +45,8 @@
  */
 #define DEBOUNCE_TIME			msecs_to_jiffies(50)
 
+struct axp20x_usb_power;
+
 struct axp_data {
 	const struct power_supply_desc	*power_desc;
 	const char * const		*irq_names;
@@ -58,6 +60,10 @@ struct axp_data {
 	struct reg_field		usb_bc_det_fld;
 	struct reg_field		vbus_disable_bit;
 	bool				vbus_needs_polling: 1;
+	void (*axp20x_read_vbus)(struct work_struct *work);
+	int (*axp20x_cfg_iio_chan)(struct platform_device *pdev,
+				   struct axp20x_usb_power *power);
+	int (*axp20x_cfg_adc_reg)(struct axp20x_usb_power *power);
 };
 
 struct axp20x_usb_power {
@@ -385,6 +391,36 @@ static int axp20x_usb_power_prop_writeable(struct power_supply *psy,
 	       psp == POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT;
 }
 
+static int axp20x_configure_iio_channels(struct platform_device *pdev,
+					 struct axp20x_usb_power *power)
+{
+	power->vbus_v = devm_iio_channel_get(&pdev->dev, "vbus_v");
+	if (IS_ERR(power->vbus_v)) {
+		if (PTR_ERR(power->vbus_v) == -ENODEV)
+			return -EPROBE_DEFER;
+		return PTR_ERR(power->vbus_v);
+	}
+
+	power->vbus_i = devm_iio_channel_get(&pdev->dev, "vbus_i");
+	if (IS_ERR(power->vbus_i)) {
+		if (PTR_ERR(power->vbus_i) == -ENODEV)
+			return -EPROBE_DEFER;
+		return PTR_ERR(power->vbus_i);
+	}
+
+	return 0;
+}
+
+static int axp20x_configure_adc_registers(struct axp20x_usb_power *power)
+{
+	/* Enable vbus voltage and current measurement */
+	return regmap_update_bits(power->regmap, AXP20X_ADC_EN1,
+				  AXP20X_ADC_EN1_VBUS_CURR |
+				  AXP20X_ADC_EN1_VBUS_VOLT,
+				  AXP20X_ADC_EN1_VBUS_CURR |
+				  AXP20X_ADC_EN1_VBUS_VOLT);
+}
+
 static enum power_supply_property axp20x_usb_power_properties[] = {
 	POWER_SUPPLY_PROP_HEALTH,
 	POWER_SUPPLY_PROP_PRESENT,
@@ -505,6 +541,9 @@ static const struct axp_data axp192_data = {
 	.curr_lim_fld   = REG_FIELD(AXP20X_VBUS_IPSOUT_MGMT, 0, 1),
 	.vbus_valid_bit = REG_FIELD(AXP192_USB_OTG_STATUS, 2, 2),
 	.vbus_mon_bit   = REG_FIELD(AXP20X_VBUS_MON, 3, 3),
+	.axp20x_read_vbus = &axp20x_usb_power_poll_vbus,
+	.axp20x_cfg_iio_chan = axp20x_configure_iio_channels,
+	.axp20x_cfg_adc_reg = axp20x_configure_adc_registers,
 };
 
 static const struct axp_data axp202_data = {
@@ -516,6 +555,9 @@ static const struct axp_data axp202_data = {
 	.curr_lim_fld   = REG_FIELD(AXP20X_VBUS_IPSOUT_MGMT, 0, 1),
 	.vbus_valid_bit = REG_FIELD(AXP20X_USB_OTG_STATUS, 2, 2),
 	.vbus_mon_bit   = REG_FIELD(AXP20X_VBUS_MON, 3, 3),
+	.axp20x_read_vbus = &axp20x_usb_power_poll_vbus,
+	.axp20x_cfg_iio_chan = axp20x_configure_iio_channels,
+	.axp20x_cfg_adc_reg = axp20x_configure_adc_registers,
 };
 
 static const struct axp_data axp221_data = {
@@ -526,6 +568,9 @@ static const struct axp_data axp221_data = {
 	.curr_lim_table_size = ARRAY_SIZE(axp221_usb_curr_lim_table),
 	.curr_lim_fld   = REG_FIELD(AXP20X_VBUS_IPSOUT_MGMT, 0, 1),
 	.vbus_needs_polling = true,
+	.axp20x_read_vbus = &axp20x_usb_power_poll_vbus,
+	.axp20x_cfg_iio_chan = axp20x_configure_iio_channels,
+	.axp20x_cfg_adc_reg = axp20x_configure_adc_registers,
 };
 
 static const struct axp_data axp223_data = {
@@ -536,6 +581,9 @@ static const struct axp_data axp223_data = {
 	.curr_lim_table_size = ARRAY_SIZE(axp20x_usb_curr_lim_table),
 	.curr_lim_fld   = REG_FIELD(AXP20X_VBUS_IPSOUT_MGMT, 0, 1),
 	.vbus_needs_polling = true,
+	.axp20x_read_vbus = &axp20x_usb_power_poll_vbus,
+	.axp20x_cfg_iio_chan = axp20x_configure_iio_channels,
+	.axp20x_cfg_adc_reg = axp20x_configure_adc_registers,
 };
 
 static const struct axp_data axp813_data = {
@@ -549,6 +597,9 @@ static const struct axp_data axp813_data = {
 	.usb_bc_det_fld = REG_FIELD(AXP288_BC_DET_STAT, 5, 7),
 	.vbus_disable_bit = REG_FIELD(AXP20X_VBUS_IPSOUT_MGMT, 7, 7),
 	.vbus_needs_polling = true,
+	.axp20x_read_vbus = &axp20x_usb_power_poll_vbus,
+	.axp20x_cfg_iio_chan = axp20x_configure_iio_channels,
+	.axp20x_cfg_adc_reg = axp20x_configure_adc_registers,
 };
 
 #ifdef CONFIG_PM_SLEEP
@@ -590,36 +641,6 @@ static int axp20x_usb_power_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(axp20x_usb_power_pm_ops, axp20x_usb_power_suspend,
 						  axp20x_usb_power_resume);
 
-static int configure_iio_channels(struct platform_device *pdev,
-				  struct axp20x_usb_power *power)
-{
-	power->vbus_v = devm_iio_channel_get(&pdev->dev, "vbus_v");
-	if (IS_ERR(power->vbus_v)) {
-		if (PTR_ERR(power->vbus_v) == -ENODEV)
-			return -EPROBE_DEFER;
-		return PTR_ERR(power->vbus_v);
-	}
-
-	power->vbus_i = devm_iio_channel_get(&pdev->dev, "vbus_i");
-	if (IS_ERR(power->vbus_i)) {
-		if (PTR_ERR(power->vbus_i) == -ENODEV)
-			return -EPROBE_DEFER;
-		return PTR_ERR(power->vbus_i);
-	}
-
-	return 0;
-}
-
-static int configure_adc_registers(struct axp20x_usb_power *power)
-{
-	/* Enable vbus voltage and current measurement */
-	return regmap_update_bits(power->regmap, AXP20X_ADC_EN1,
-				  AXP20X_ADC_EN1_VBUS_CURR |
-				  AXP20X_ADC_EN1_VBUS_VOLT,
-				  AXP20X_ADC_EN1_VBUS_CURR |
-				  AXP20X_ADC_EN1_VBUS_VOLT);
-}
-
 static int axp20x_regmap_field_alloc_optional(struct device *dev,
 					      struct regmap *regmap,
 					      struct reg_field fdesc,
@@ -707,7 +728,7 @@ static int axp20x_usb_power_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = devm_delayed_work_autocancel(&pdev->dev, &power->vbus_detect,
-					   axp20x_usb_power_poll_vbus);
+					   axp_data->axp20x_read_vbus);
 	if (ret)
 		return ret;
 
@@ -718,9 +739,9 @@ static int axp20x_usb_power_probe(struct platform_device *pdev)
 			return ret;
 
 		if (IS_ENABLED(CONFIG_AXP20X_ADC))
-			ret = configure_iio_channels(pdev, power);
+			ret = axp_data->axp20x_cfg_iio_chan(pdev, power);
 		else
-			ret = configure_adc_registers(power);
+			ret = axp_data->axp20x_cfg_adc_reg(power);
 
 		if (ret)
 			return ret;
-- 
2.34.1

