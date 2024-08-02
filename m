Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E851547D1
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Aug 2024 19:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722626576; cv=none; b=bmBsiz3VXoSBkXiSlO5Y5Y9aUBcs+cJegQR5aRn4QnCzkp4ahsiyKk8Uvimb3lTpA7wbqHTgTSHO3Da8zt46cJtuCL0zcBS1f02ycp3VdjNmCzm+DYObxkRs53tY9RS8vJwQkK7iRpfvIp38BXr4piiU7H1JZO7HYmREPWOyHbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722626576; c=relaxed/simple;
	bh=PXcsBzwFl2GwJIvfGM2Lg71OZ1PddeIewm5S+RRkQ44=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m+DNwA9kwB/PpwTXro9+yCTgXDxV5lcTT673du6440CY7vx2MVht5aAUejFvZF4fkdtU0bcC0yorRBr0vRDI1qu4fpCegBzufsTTuSteA6XhE8aPW6uO29HlHRv1qIzcIe9AXXXH9crjF7Uu/u42edv+iYULU/aq1lJwuXSbU5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GeOnIeAL; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GeOnIeAL"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3db23a60850so4566024b6e.0
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Aug 2024 12:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722626573; x=1723231373; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0UhxZ2XxQFgvUjgiU5dDgFB2D6T8k8pYUXnFuEDKNs=;
        b=GeOnIeALAtXd0JdH83TAjXMVHEvY4qUBJxyE5f0oUROF5NNuMuP6oetJQecGLda6AX
         0z2G/jpAgyrFdkxNKesswbX5CYeWfFUBYzfEDo1TrDTC0qRvRQOaLSpsyP9FkBPWFmAH
         WoZj00T6BH3nfwxskp6WFoyTk2vuT0LJ+6qEkGguO+ejgcYRx0AcqJEfs+3aFXRIXzj3
         bXoxCPUAyPZJyrp+8zkBukuLMiwlN/7VIbk585RxvBvU7Dl1Fd9msppPmR4Luu5nBJOE
         48GFSvcR2+gva+co+iznjvatKna4ckWJ6hWByQpAa/YHxEVe0qTo3qbf2p9QxsU5imaz
         o3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722626573; x=1723231373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0UhxZ2XxQFgvUjgiU5dDgFB2D6T8k8pYUXnFuEDKNs=;
        b=rq+suoS2jsz2sLA8dU98AtJhwMHZgM08CNP221Uyc33xxFS/Adm6zfwoy4uHLRX4l2
         o+Rnyb73/+b1Jchx1yivmaiHWK15DMMIKfZ/tDL+95ECF0GQBNIgEirLFdoZvNry6wTA
         7AmmNmA53mu6rV3Cq3xDxNWcxWFq5sHmD1n8FxVKHVi5n0rwhttacMnZi9oO9RG3koiq
         FC584zGTR2216wXk/cZGetoI9sjcIWOJbud++YNvwukBLkx8oL7nKxBXgs32dxyftsG7
         xS/e7x0/IzHbb9KOjTaPg7LajASgeBKRxNtWfOwS9rigQVFIQwEljelrMtVbiW6+4G8R
         hyIA==
X-Gm-Message-State: AOJu0YyhbEQuNnyhxveOtIxkTqWZDL8Rm9w4k/99M5idGG2bPBq70dwo
	bXPjVl5hkewkaMyT3gqxD9qbIc0O3D4i5xhz/ZkpyX7mFKRYnX1zEje2BA==
X-Google-Smtp-Source: AGHT+IFx9K3D5CljvOXxOmLTsl/b/6M3kDJw++iO1oQoXWQvuhxjVWHOCKtVJ83E+30VVXO5vQkprw==
X-Received: by 2002:a05:6808:16a3:b0:3da:aae9:718c with SMTP id 5614622812f47-3db5583546dmr5731822b6e.35.1722626573098;
        Fri, 02 Aug 2024 12:22:53 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db563b7065sm584592b6e.46.2024.08.02.12.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 12:22:52 -0700 (PDT)
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
Subject: [PATCH V2 04/15] power: supply: axp20x_usb_power: Make VBUS and IIO config per device
Date: Fri,  2 Aug 2024 14:20:15 -0500
Message-Id: <20240802192026.446344-5-macroalpha82@gmail.com>
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

