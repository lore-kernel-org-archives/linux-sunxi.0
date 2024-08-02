Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDF315C12F
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Aug 2024 19:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722626574; cv=none; b=lUmyE84JJ87shpKbdndRkX1lQrYUuS7dVdV0ePudKEP5kg3UEyxHHZLTqkXJkXt7ZR3iy2GfMSTZJaD9V7Y8+lEcUmdA55M5f/CgPQyuE9PrUoz+b/fAbqtjbl5P78ZY6vgfGxyfKenyodWAE5ahonLSilbzDmIfld5l4lfKb0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722626574; c=relaxed/simple;
	bh=7oiVFaUcI0C5oMqqUaovkqLRY8Weg4Zg7WG/UFywWlQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eGrVTOW1Eytt4fxlIFt//87hg4LQMK5qHqSXqDoKasF4UtOEkmun7HlnLwuX1P3ExWNksW818xFLqUuKzdRrt2bpzPbub8BC8OLQxeoUhdPuy45sEn33hzYFxMgaQMeuGb1xf6XOOr5IhYY0sMmenrYtrOKhzI0G8W5STkZF2Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SeIH/+g2; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeIH/+g2"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3db51133978so1670779b6e.3
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Aug 2024 12:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722626572; x=1723231372; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6uKad2/4G0gY3Nm8pi2ZP0lDyan1DAsdC6ygDIyfJY=;
        b=SeIH/+g2XJHwCvfEczh5pL4w7DJlMIPh8hNUyblirGz+P/MtJ6bucllvksDFirlDua
         l1rA4MmAXKRD3pEuFYmf596Y0n00DtyldBEBBXOleTb3lXxs63HlOSNNz9aJQC0xyTp3
         Hjsf/skEm/ncMK4Oc4EPrfelpsYbKnoUG/s1/IRtbK0DhT/PwENg+QTL8MCvgAb1/w2r
         C430jhC1whNu1w70f9jiYVdP+2pQds7BtsRL89ipeRxrmzKnIFVrgyEC/eDCu/HGKFZr
         M3hDYbcI7Zumt14tqwK0L/+/bhpsackRTbYVMPMG4V8KWLrUa5pJ8jFiGlTfYVWH+ESo
         azvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722626572; x=1723231372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6uKad2/4G0gY3Nm8pi2ZP0lDyan1DAsdC6ygDIyfJY=;
        b=SGtEL3sStrGEgFgZj2cCi5xyPDhzg0jFNfSFXtmzeRpYQd+ek7l2njwRDOkQNHA5Sb
         UGLF8TFosBJRsE9s1Nrmz2w8qPW59qE7lbAg7BGFY8Eb69j06IDQ5Pe05gTVs7LYeLAk
         IGxte2Hhc3B6qhsv6/l/H2eqfF0ZO8zzk8B7sNKOW24hK5/4LUX/QhjkaO+u86uNz7OI
         3R7sgpNn06+ufTsxZy2CoFJgCW+8EjbGDheqoUZbRIy55oJSuL1/moiK51E4Cyh7Lz1I
         XVOJ5rgcLnmHnU4Lwr/bqRKw/SdMNZQktmnL+I353Bu1RBxhG1uhmQP06WqqYL75YQIS
         rfSA==
X-Gm-Message-State: AOJu0YxfuQTBhG8OFjH083rva9QGRHLDN5AdwpjAJ/21/8iIiACY28+G
	J1rS5ekoS4iM2psgmPzo7qbX/KXGY+3wNwH+NVhYiUz6JSTm7PPF9GuVOg==
X-Google-Smtp-Source: AGHT+IEs9MYOXNw9PGLjeIwOe5v18039zsdnnwbfUh7/mG/Os5RpVQqMKE2Qlaw7JTtbbAdERBGK9w==
X-Received: by 2002:a05:6808:151f:b0:3d9:232b:e275 with SMTP id 5614622812f47-3db558107d9mr6092097b6e.25.1722626572004;
        Fri, 02 Aug 2024 12:22:52 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db563b7065sm584592b6e.46.2024.08.02.12.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 12:22:51 -0700 (PDT)
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
Subject: [PATCH V2 03/15] power: supply: axp20x_battery: Make iio and battery config per device
Date: Fri,  2 Aug 2024 14:20:14 -0500
Message-Id: <20240802192026.446344-4-macroalpha82@gmail.com>
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

Move the configuration of battery specific information and available
iio channels from the probe function to a device specific routine,
allowing us to use this driver for devices with slightly different
configurations (such as the AXP717).

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/power/supply/axp20x_battery.c | 137 +++++++++++++++++---------
 1 file changed, 88 insertions(+), 49 deletions(-)

diff --git a/drivers/power/supply/axp20x_battery.c b/drivers/power/supply/axp20x_battery.c
index 7520b599eb3d..c903c588b361 100644
--- a/drivers/power/supply/axp20x_battery.c
+++ b/drivers/power/supply/axp20x_battery.c
@@ -58,11 +58,19 @@
 struct axp20x_batt_ps;
 
 struct axp_data {
-	int	ccc_scale;
-	int	ccc_offset;
-	bool	has_fg_valid;
+	int		ccc_scale;
+	int		ccc_offset;
+	unsigned int	ccc_reg;
+	unsigned int	ccc_mask;
+	bool		has_fg_valid;
+	const struct	power_supply_desc *bat_ps_desc;
 	int	(*get_max_voltage)(struct axp20x_batt_ps *batt, int *val);
 	int	(*set_max_voltage)(struct axp20x_batt_ps *batt, int val);
+	int	(*cfg_iio_chan)(struct platform_device *pdev,
+				struct axp20x_batt_ps *axp_batt);
+	void	(*set_bat_info)(struct platform_device *pdev,
+				struct axp20x_batt_ps *axp_batt,
+				struct power_supply_battery_info *info);
 };
 
 struct axp20x_batt_ps {
@@ -508,7 +516,7 @@ static int axp20x_battery_prop_writeable(struct power_supply *psy,
 	       psp == POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT_MAX;
 }
 
-static const struct power_supply_desc axp20x_batt_ps_desc = {
+static const struct power_supply_desc axp209_batt_ps_desc = {
 	.name = "axp20x-battery",
 	.type = POWER_SUPPLY_TYPE_BATTERY,
 	.properties = axp20x_battery_props,
@@ -518,27 +526,94 @@ static const struct power_supply_desc axp20x_batt_ps_desc = {
 	.set_property = axp20x_battery_set_prop,
 };
 
+static int axp209_bat_cfg_iio_channels(struct platform_device *pdev,
+				       struct axp20x_batt_ps *axp_batt)
+{
+	axp_batt->batt_v = devm_iio_channel_get(&pdev->dev, "batt_v");
+	if (IS_ERR(axp_batt->batt_v)) {
+		if (PTR_ERR(axp_batt->batt_v) == -ENODEV)
+			return -EPROBE_DEFER;
+		return PTR_ERR(axp_batt->batt_v);
+	}
+
+	axp_batt->batt_chrg_i = devm_iio_channel_get(&pdev->dev,
+							"batt_chrg_i");
+	if (IS_ERR(axp_batt->batt_chrg_i)) {
+		if (PTR_ERR(axp_batt->batt_chrg_i) == -ENODEV)
+			return -EPROBE_DEFER;
+		return PTR_ERR(axp_batt->batt_chrg_i);
+	}
+
+	axp_batt->batt_dischrg_i = devm_iio_channel_get(&pdev->dev,
+							   "batt_dischrg_i");
+	if (IS_ERR(axp_batt->batt_dischrg_i)) {
+		if (PTR_ERR(axp_batt->batt_dischrg_i) == -ENODEV)
+			return -EPROBE_DEFER;
+		return PTR_ERR(axp_batt->batt_dischrg_i);
+	}
+
+	return 0;
+}
+
+static void axp209_set_battery_info(struct platform_device *pdev,
+				    struct axp20x_batt_ps *axp_batt,
+				    struct power_supply_battery_info *info)
+{
+	int vmin = info->voltage_min_design_uv;
+	int ccc = info->constant_charge_current_max_ua;
+
+	if (vmin > 0 && axp20x_set_voltage_min_design(axp_batt, vmin))
+		dev_err(&pdev->dev,
+			"couldn't set voltage_min_design\n");
+
+	/* Set max to unverified value to be able to set CCC */
+	axp_batt->max_ccc = ccc;
+
+	if (ccc <= 0 || axp20x_set_constant_charge_current(axp_batt, ccc)) {
+		dev_err(&pdev->dev,
+			"couldn't set ccc from DT: fallback to min value\n");
+		ccc = 300000;
+		axp_batt->max_ccc = ccc;
+		axp20x_set_constant_charge_current(axp_batt, ccc);
+	}
+}
+
 static const struct axp_data axp209_data = {
 	.ccc_scale = 100000,
 	.ccc_offset = 300000,
+	.ccc_reg = AXP20X_CHRG_CTRL1,
+	.ccc_mask = AXP20X_CHRG_CTRL1_TGT_CURR,
+	.bat_ps_desc = &axp209_batt_ps_desc,
 	.get_max_voltage = axp20x_battery_get_max_voltage,
 	.set_max_voltage = axp20x_battery_set_max_voltage,
+	.cfg_iio_chan = axp209_bat_cfg_iio_channels,
+	.set_bat_info = axp209_set_battery_info,
 };
 
 static const struct axp_data axp221_data = {
 	.ccc_scale = 150000,
 	.ccc_offset = 300000,
+	.ccc_reg = AXP20X_CHRG_CTRL1,
+	.ccc_mask = AXP20X_CHRG_CTRL1_TGT_CURR,
 	.has_fg_valid = true,
+	.bat_ps_desc = &axp209_batt_ps_desc,
 	.get_max_voltage = axp22x_battery_get_max_voltage,
 	.set_max_voltage = axp22x_battery_set_max_voltage,
+	.cfg_iio_chan = axp209_bat_cfg_iio_channels,
+	.set_bat_info = axp209_set_battery_info,
 };
 
 static const struct axp_data axp813_data = {
 	.ccc_scale = 200000,
 	.ccc_offset = 200000,
+	.ccc_reg = AXP20X_CHRG_CTRL1,
+	.ccc_mask = AXP20X_CHRG_CTRL1_TGT_CURR,
 	.has_fg_valid = true,
+	.bat_ps_desc = &axp209_batt_ps_desc,
 	.get_max_voltage = axp813_battery_get_max_voltage,
 	.set_max_voltage = axp20x_battery_set_max_voltage,
+	.cfg_iio_chan = axp209_bat_cfg_iio_channels,
+	.set_bat_info = axp209_set_battery_info,
 };
 
 static const struct of_device_id axp20x_battery_ps_id[] = {
@@ -561,6 +636,7 @@ static int axp20x_power_probe(struct platform_device *pdev)
 	struct power_supply_config psy_cfg = {};
 	struct power_supply_battery_info *info;
 	struct device *dev = &pdev->dev;
+	int ret;
 
 	if (!of_device_is_available(pdev->dev.of_node))
 		return -ENODEV;
@@ -572,29 +648,6 @@ static int axp20x_power_probe(struct platform_device *pdev)
 
 	axp20x_batt->dev = &pdev->dev;
 
-	axp20x_batt->batt_v = devm_iio_channel_get(&pdev->dev, "batt_v");
-	if (IS_ERR(axp20x_batt->batt_v)) {
-		if (PTR_ERR(axp20x_batt->batt_v) == -ENODEV)
-			return -EPROBE_DEFER;
-		return PTR_ERR(axp20x_batt->batt_v);
-	}
-
-	axp20x_batt->batt_chrg_i = devm_iio_channel_get(&pdev->dev,
-							"batt_chrg_i");
-	if (IS_ERR(axp20x_batt->batt_chrg_i)) {
-		if (PTR_ERR(axp20x_batt->batt_chrg_i) == -ENODEV)
-			return -EPROBE_DEFER;
-		return PTR_ERR(axp20x_batt->batt_chrg_i);
-	}
-
-	axp20x_batt->batt_dischrg_i = devm_iio_channel_get(&pdev->dev,
-							   "batt_dischrg_i");
-	if (IS_ERR(axp20x_batt->batt_dischrg_i)) {
-		if (PTR_ERR(axp20x_batt->batt_dischrg_i) == -ENODEV)
-			return -EPROBE_DEFER;
-		return PTR_ERR(axp20x_batt->batt_dischrg_i);
-	}
-
 	axp20x_batt->regmap = dev_get_regmap(pdev->dev.parent, NULL);
 	platform_set_drvdata(pdev, axp20x_batt);
 
@@ -603,8 +656,12 @@ static int axp20x_power_probe(struct platform_device *pdev)
 
 	axp20x_batt->data = (struct axp_data *)of_device_get_match_data(dev);
 
+	ret = axp20x_batt->data->cfg_iio_chan(pdev, axp20x_batt);
+	if (ret)
+		return ret;
+
 	axp20x_batt->batt = devm_power_supply_register(&pdev->dev,
-						       &axp20x_batt_ps_desc,
+						       axp20x_batt->data->bat_ps_desc,
 						       &psy_cfg);
 	if (IS_ERR(axp20x_batt->batt)) {
 		dev_err(&pdev->dev, "failed to register power supply: %ld\n",
@@ -613,33 +670,15 @@ static int axp20x_power_probe(struct platform_device *pdev)
 	}
 
 	if (!power_supply_get_battery_info(axp20x_batt->batt, &info)) {
-		int vmin = info->voltage_min_design_uv;
-		int ccc = info->constant_charge_current_max_ua;
-
-		if (vmin > 0 && axp20x_set_voltage_min_design(axp20x_batt,
-							      vmin))
-			dev_err(&pdev->dev,
-				"couldn't set voltage_min_design\n");
-
-		/* Set max to unverified value to be able to set CCC */
-		axp20x_batt->max_ccc = ccc;
-
-		if (ccc <= 0 || axp20x_set_constant_charge_current(axp20x_batt,
-								   ccc)) {
-			dev_err(&pdev->dev,
-				"couldn't set constant charge current from DT: fallback to minimum value\n");
-			ccc = 300000;
-			axp20x_batt->max_ccc = ccc;
-			axp20x_set_constant_charge_current(axp20x_batt, ccc);
-		}
+		axp20x_batt->data->set_bat_info(pdev, axp20x_batt, info);
+		power_supply_put_battery_info(axp20x_batt->batt, info);
 	}
 
 	/*
 	 * Update max CCC to a valid value if battery info is present or set it
 	 * to current register value by default.
 	 */
-	axp20x_get_constant_charge_current(axp20x_batt,
-					   &axp20x_batt->max_ccc);
+	axp20x_get_constant_charge_current(axp20x_batt, &axp20x_batt->max_ccc);
 
 	return 0;
 }
-- 
2.34.1

