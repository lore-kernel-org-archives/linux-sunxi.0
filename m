Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F0717ADF8
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Aug 2024 21:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724277453; cv=none; b=K+h1zIzxNQHaIFM0S5jeTZNA8YfYRIMg3HhE63OaB0CHom48DPI4arA9Wjx3/lpmjVjmayxboEpaLu254TBqrL+RS4VOKbCrwQvEvwlv2wwy1ekbkAFW4AtwJciua/9/PHH94SqYThGAKu1rXSJUL6UZhhUPtmo2OhehPCk0Vj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724277453; c=relaxed/simple;
	bh=LrihmKdwSa2HCqhUaNRUZZtZeL+1LnhboUcWlT0Xaqw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RIPaNMII1fHrGSpkC7IfkINIcXjcwiRVSmvCYdZ0q+sJEyxsOpgJ90J8+f92RAWsXrD+1AiydrFR0A6Jf5R9lNOt3sqQkESIojJx8u7vaIInujvD7Z6rVvKbnx+RXrbyd6axBi/YitFfwEef5DfsPbR/dkLtHDp6kwuruoiPqXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9z5WcF0; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9z5WcF0"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3db16b2c1d2so86562b6e.2
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Aug 2024 14:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724277450; x=1724882250; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOS6CB7c1t/IxbcoB65fP4OgyGzoOrEBpGmlG4zcGvM=;
        b=I9z5WcF0JsUaXB+msYxnK+sD8XHDTQmzdsMEb2cR6etm8uHoECjnh0+jT6MO3caocX
         xvuAPgUHCWohVaqhQ/dP4hyY6qRP3+DLJQkRB8JxF/SR27yrTVcE8B77QthfCA6tu8Ci
         3zjcyeJQ1+QxU/QCYoWzTIE9cQy0LRqpFIzF9zK7GvwurM2u5V68HKuBiamqbfYrJYJs
         jZ27/bIilCcjZ8wtcQjK+pEiGO0pemjIGLdpxgldfuJFVynm9faYoLAuISIn/omhy+rT
         kFv8Ku5s/1XA6c0amxe/PGryMHEBfHqS0+DjMooIDqjg89pf0WCjMOSb17C1oKThQIfe
         h5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724277450; x=1724882250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOS6CB7c1t/IxbcoB65fP4OgyGzoOrEBpGmlG4zcGvM=;
        b=ooV4Zo+GZ9V7AePwa6VcXvfwkd7Gld1Ljy9k4seYid4Tjm5qVJxtsyft9bv9evOF/+
         NXJQfACaqTLjZB8kcqYE6Q+rWNou8Bt/E6sDiVDMh6H+cvRWtZHXh3a8o3CK0w9O7/JM
         0j1mu6yD0Oh3voos4ogZSwI8SPpnPuAe5dzmybwNZieuJxpwflPpzsdtSojNgFJKJlzU
         d3D+DdR2/NvaPTAw5aSLK4JSFeNP0fcldwLgEOuRM2yRVeO5saZDDBnOuTsJuhD1O8Qw
         hi1VjqhjV9YcpQzih7tMTwLpXgBsCDa56Gnw+7eb4/b8yxzNhUKaPEqy5YMemCNLFfOY
         ASow==
X-Gm-Message-State: AOJu0YxrrTyBCC77/PWNoytzmN07XUCPJvs1svcgABHmEZtzH2mS7g2V
	KuF2eLU3TWPZlhsvGYpIZtO9kGC2VkB2zxKCNbsbTUmFvxBRR+1u8KM2Uw==
X-Google-Smtp-Source: AGHT+IEDEnpxMg/ftuWHkBCtoVjAbIZKtyzSllfCGKNLbkBb8Dpv1EHptRmC6SwkiV2S5+OBbV92Hw==
X-Received: by 2002:a05:6808:1914:b0:3dd:32a3:76a4 with SMTP id 5614622812f47-3de194ed3dbmr5089953b6e.4.1724277450470;
        Wed, 21 Aug 2024 14:57:30 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:81a9:2325:e0f7:7376])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3de225555b6sm47070b6e.17.2024.08.21.14.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 14:57:30 -0700 (PDT)
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
Subject: [PATCH V4 02/15] power: supply: axp20x_battery: Remove design from min and max voltage
Date: Wed, 21 Aug 2024 16:54:43 -0500
Message-Id: <20240821215456.962564-3-macroalpha82@gmail.com>
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

