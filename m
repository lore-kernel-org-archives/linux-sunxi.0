Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F1917837D
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 16:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724086126; cv=none; b=RH8S71jKxwFlKkKt9yaDIBLMJcR4cmVIdZ4sS6bPpOJyl0B4HQVLuRCMHINHQsx43Lb/hiVNV4MvZ0HlNG8GSpXWARjorEsolOfjziL4suXRHDayWY4K9ojL790TrItTigV8bVCplznjbs8ErwP8N/ylV3FQzoX2P2njdNCp0IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724086126; c=relaxed/simple;
	bh=LrihmKdwSa2HCqhUaNRUZZtZeL+1LnhboUcWlT0Xaqw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kfKmSNJFn3tdY5aEmhGNKtPi9pzum1ZISsD5JUP4uymzySo4gTvWpfNPISTalhvX8gekGmqI3Nn3atgqmsdMZ8dd1Y5yUEMwLcCsUKcriwByDWgpZWAOPYJ8fyg0mQcL2yBEvVKoZXdcx08byvf1kLZb45Qo0G139KiTM/PVGZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlGcWnSA; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlGcWnSA"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-70949118d26so3724726a34.0
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724086124; x=1724690924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOS6CB7c1t/IxbcoB65fP4OgyGzoOrEBpGmlG4zcGvM=;
        b=dlGcWnSAIMONVwrof8HDirQ2sdTMS8O3Vl+eHnVF4mXpHVfs+ggwCBS62feYtqKeou
         iHTegd/gd3RDBNFlLhc+ETCBWruH6wgASPhksz+QOU07zAf35+5uVOXkfvPGDlQctW/t
         ZwQZ4HAiNrJGy2VKApsc8g1TOuiVM6dfubpbcRPex0rt3ByYyW8EAqSRLZTVR0MJs6x0
         bv9DO4tRTC1hWTF+JuzV13cWcfxME75OebnJZ69k3NGWbmcqM7Xc2jpW65XQ1l/l++qu
         lNKFKQr2tB4TEXpFQU988HBrYE2wAABOp+evryLrtf6O20f1T1Cm/787wDpC2qsAN+44
         mvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724086124; x=1724690924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOS6CB7c1t/IxbcoB65fP4OgyGzoOrEBpGmlG4zcGvM=;
        b=hHXXDxTNy7dZ5ql6CHZlIOGBpnRf0aIHDpge90lMtXavgvXkaLrz5rdjvKB3AgKeKa
         x//zWbgSu+MRIJztbRmFbo/cFecvKgyANGhSw50xe6JUvi28BiU9VPhlr0HL/Ie6NFLT
         YPcixfLtwQ68fcoforcJYUiAXr6rN6rUEuisxnu9/e3b/iyKBmVqnZKWQodYSIncYvhS
         xiuwt3+hEARWu7DcqT/LhHwFaqrRGFA/7juP5EPXzhLSymoNcId7KoLDNwSsqwWSEPls
         tw5fmvS+i0YYZnwhtKmiPdYqEwh6rlkvvrn4e+X3cIpeJP7kbpXcDHC0LT0VqnRy1Dx5
         Cc5Q==
X-Gm-Message-State: AOJu0Yx6B9SKZ41v+qQimhRAoONQBD7WiCqjC+5EewkiP6taWpHP1l7x
	/1JHOw9CYttA1Hyhl66LeFFr+c88ynC9g9l3w1HnVaf0F1tQlMoS2Xrlsg==
X-Google-Smtp-Source: AGHT+IGRbx6BxU4vKawFjexC1H9e2LGpEq+T3o1X+Pv/qXuObKZyJbfFheTtea7zTF3p2BUGf2M5zw==
X-Received: by 2002:a05:6830:d1c:b0:709:4936:d8fd with SMTP id 46e09a7af769-70cac8bf963mr15151806a34.29.1724086123933;
        Mon, 19 Aug 2024 09:48:43 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70ca649c61csm2332428a34.26.2024.08.19.09.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 09:48:43 -0700 (PDT)
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
	Chris Morgan <macromorgan@hotmail.com>,
	Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH V3 02/15] power: supply: axp20x_battery: Remove design from min and max voltage
Date: Mon, 19 Aug 2024 11:46:06 -0500
Message-Id: <20240819164619.556309-3-macroalpha82@gmail.com>
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

The POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN and
POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN values should be immutable
properties of the battery, but for this driver they are writable values
and used as the minimum and maximum values for charging. Remove the
DESIGN designation from these values.

Fixes: 46c202b5f25f ("power: supply: add battery driver for AXP20X and AXP22X PMICs")
Suggested-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/power/supply/axp20x_battery.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/power/supply/axp20x_battery.c b/drivers/power/supply/axp20x_battery.c
index 6ac5c80cfda2..7520b599eb3d 100644
--- a/drivers/power/supply/axp20x_battery.c
+++ b/drivers/power/supply/axp20x_battery.c
@@ -303,11 +303,11 @@ static int axp20x_battery_get_prop(struct power_supply *psy,
 		val->intval = reg & AXP209_FG_PERCENT;
 		break;
 
-	case POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN:
+	case POWER_SUPPLY_PROP_VOLTAGE_MAX:
 		return axp20x_batt->data->get_max_voltage(axp20x_batt,
 							  &val->intval);
 
-	case POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN:
+	case POWER_SUPPLY_PROP_VOLTAGE_MIN:
 		ret = regmap_read(axp20x_batt->regmap, AXP20X_V_OFF, &reg);
 		if (ret)
 			return ret;
@@ -455,10 +455,10 @@ static int axp20x_battery_set_prop(struct power_supply *psy,
 	struct axp20x_batt_ps *axp20x_batt = power_supply_get_drvdata(psy);
 
 	switch (psp) {
-	case POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN:
+	case POWER_SUPPLY_PROP_VOLTAGE_MIN:
 		return axp20x_set_voltage_min_design(axp20x_batt, val->intval);
 
-	case POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN:
+	case POWER_SUPPLY_PROP_VOLTAGE_MAX:
 		return axp20x_batt->data->set_max_voltage(axp20x_batt, val->intval);
 
 	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT:
@@ -493,8 +493,8 @@ static enum power_supply_property axp20x_battery_props[] = {
 	POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT,
 	POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT_MAX,
 	POWER_SUPPLY_PROP_HEALTH,
-	POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN,
-	POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN,
+	POWER_SUPPLY_PROP_VOLTAGE_MAX,
+	POWER_SUPPLY_PROP_VOLTAGE_MIN,
 	POWER_SUPPLY_PROP_CAPACITY,
 };
 
@@ -502,8 +502,8 @@ static int axp20x_battery_prop_writeable(struct power_supply *psy,
 					 enum power_supply_property psp)
 {
 	return psp == POWER_SUPPLY_PROP_STATUS ||
-	       psp == POWER_SUPPLY_PROP_VOLTAGE_MIN_DESIGN ||
-	       psp == POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN ||
+	       psp == POWER_SUPPLY_PROP_VOLTAGE_MIN ||
+	       psp == POWER_SUPPLY_PROP_VOLTAGE_MAX ||
 	       psp == POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT ||
 	       psp == POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT_MAX;
 }
-- 
2.34.1

