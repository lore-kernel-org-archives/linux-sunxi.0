Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907392905
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Apr 2025 00:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744158110; cv=none; b=ppiAz628iMKnLJZlc/AeuToLJ8+iiFdBUqI53ezXVBZMyrTNjbSzJJOd34Ss7mmrBYthPVvefr6KJsPlBdlVJ3nhGGPYlYjhUNd6OLGBfmOgMIjYgUZN5zCEyhAhgMTAx46LzchuiwroyWC1tbiSIiPoUSAoZZktBIpLnWbTFrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744158110; c=relaxed/simple;
	bh=OcoEe6rXZHS84p0IExm1Mi/WPd8Tcnf0YZy+4bdRhMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X/O/HUfw2L/Xpx7KPgyXtvjd8CarBZCHSUuIxW5FWhNf9+1PFonZ0b60vlVgCoZ33lzm7aOoH6rc2I3c8aIlN2XO8Kk02mtIk2SrVhnTn4wJpqFdW2RhsGC1nP/oTzIt+hDuN56bXNcEGpRnnMVeXATYTOtyHMJrN54Bc3zgGjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90632237B;
	Tue,  8 Apr 2025 17:21:48 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A9633F6A8;
	Tue,  8 Apr 2025 17:21:44 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Olliver Schinagl <oliver@schinagl.nl>,
	Iain Paton <ipaton0@gmail.com>,
	Marcus Cooper <codekipper@gmail.com>,
	Stefan Mavrodiev <stefan@olimex.com>,
	Paul Kocialkowski <contact@paulk.fr>,
	Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ian Campbell <ijc@hellion.org.uk>,
	Adam Sampson <ats@offog.org>,
	Zoltan Herpai <wigyori@uid0.hu>,
	Siarhei Siamashka <siarhei.siamashka@gmail.com>,
	VishnuPatekar <vishnupatekar0510@gmail.com>,
	Rask Ingemann Lambertsen <rask@formelder.dk>,
	Aleksei Mamlin <mamlinav@gmail.com>,
	Peter Korsgaard <peter@korsgaard.com>,
	Michal Suchanek <hramrach@gmail.com>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	Stefan Roese <sr@denx.de>,
	Phil Han <pengphei@sina.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	Jonas Smedegaard <dr@jones.dk>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Heiko Schocher <hs@denx.de>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 5/8] gpio: axp: Remove virtual VBUS enable GPIO
Date: Wed,  9 Apr 2025 01:20:33 +0100
Message-ID: <20250409002036.12212-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250409002036.12212-1-andre.przywara@arm.com>
References: <20250409002036.12212-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Holland <samuel@sholland.org>

Now that this functionality is modeled using the device tree and
regulator uclass, the named GPIO is not referenced anywhere. Remove
it, along with the rest of the support for AXP virtual GPIOs.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/gpio/axp_gpio.c   | 75 +++++++++++----------------------------
 drivers/gpio/sunxi_gpio.c | 12 +------
 include/axp221.h          |  4 ---
 include/axp809.h          |  4 ---
 include/axp818.h          |  4 ---
 include/sunxi_gpio.h      |  8 -----
 6 files changed, 22 insertions(+), 85 deletions(-)

diff --git a/drivers/gpio/axp_gpio.c b/drivers/gpio/axp_gpio.c
index 6e632c8fc73..181c53bfe72 100644
--- a/drivers/gpio/axp_gpio.c
+++ b/drivers/gpio/axp_gpio.c
@@ -15,6 +15,9 @@
 #include <errno.h>
 #include <sunxi_gpio.h>
 
+#define AXP_GPIO_PREFIX			"AXP0-"
+#define AXP_GPIO_COUNT			4
+
 static int axp_gpio_set_value(struct udevice *dev, unsigned pin, int val);
 
 static u8 axp_get_gpio_ctrl_reg(unsigned pin)
@@ -46,28 +49,14 @@ static int axp_gpio_direction_input(struct udevice *dev, unsigned pin)
 static int axp_gpio_direction_output(struct udevice *dev, unsigned pin,
 				     int val)
 {
-	__maybe_unused int ret;
 	u8 reg;
 
-	switch (pin) {
-#ifdef AXP_MISC_CTRL_N_VBUSEN_FUNC
-	/* Only available on later PMICs */
-	case SUNXI_GPIO_AXP0_VBUS_ENABLE:
-		ret = pmic_bus_clrbits(AXP_MISC_CTRL,
-				       AXP_MISC_CTRL_N_VBUSEN_FUNC);
-		if (ret)
-			return ret;
-
-		return axp_gpio_set_value(dev, pin, val);
-#endif
-	default:
-		reg = axp_get_gpio_ctrl_reg(pin);
-		if (reg == 0)
-			return -EINVAL;
+	reg = axp_get_gpio_ctrl_reg(pin);
+	if (reg == 0)
+		return -EINVAL;
 
-		return pmic_bus_write(reg, val ? AXP_GPIO_CTRL_OUTPUT_HIGH :
-						 AXP_GPIO_CTRL_OUTPUT_LOW);
-	}
+	return pmic_bus_write(reg, val ? AXP_GPIO_CTRL_OUTPUT_HIGH :
+					 AXP_GPIO_CTRL_OUTPUT_LOW);
 }
 
 static int axp_gpio_get_value(struct udevice *dev, unsigned pin)
@@ -75,25 +64,16 @@ static int axp_gpio_get_value(struct udevice *dev, unsigned pin)
 	u8 reg, val, mask;
 	int ret;
 
-	switch (pin) {
-#ifdef AXP_MISC_CTRL_N_VBUSEN_FUNC
-	/* Only available on later PMICs */
-	case SUNXI_GPIO_AXP0_VBUS_ENABLE:
-		ret = pmic_bus_read(AXP_VBUS_IPSOUT, &val);
-		mask = AXP_VBUS_IPSOUT_DRIVEBUS;
-		break;
-#endif
-	default:
-		reg = axp_get_gpio_ctrl_reg(pin);
-		if (reg == 0)
-			return -EINVAL;
+	reg = axp_get_gpio_ctrl_reg(pin);
+	if (reg == 0)
+		return -EINVAL;
 
-		ret = pmic_bus_read(AXP_GPIO_STATE, &val);
-		mask = 1 << (pin + AXP_GPIO_STATE_OFFSET);
-	}
+	ret = pmic_bus_read(AXP_GPIO_STATE, &val);
 	if (ret)
 		return ret;
 
+	mask = 1 << (pin + AXP_GPIO_STATE_OFFSET);
+
 	return (val & mask) ? 1 : 0;
 }
 
@@ -101,25 +81,12 @@ static int axp_gpio_set_value(struct udevice *dev, unsigned pin, int val)
 {
 	u8 reg;
 
-	switch (pin) {
-#ifdef AXP_MISC_CTRL_N_VBUSEN_FUNC
-	/* Only available on later PMICs */
-	case SUNXI_GPIO_AXP0_VBUS_ENABLE:
-		if (val)
-			return pmic_bus_setbits(AXP_VBUS_IPSOUT,
-						AXP_VBUS_IPSOUT_DRIVEBUS);
-		else
-			return pmic_bus_clrbits(AXP_VBUS_IPSOUT,
-						AXP_VBUS_IPSOUT_DRIVEBUS);
-#endif
-	default:
-		reg = axp_get_gpio_ctrl_reg(pin);
-		if (reg == 0)
-			return -EINVAL;
+	reg = axp_get_gpio_ctrl_reg(pin);
+	if (reg == 0)
+		return -EINVAL;
 
-		return pmic_bus_write(reg, val ? AXP_GPIO_CTRL_OUTPUT_HIGH :
-						 AXP_GPIO_CTRL_OUTPUT_LOW);
-	}
+	return pmic_bus_write(reg, val ? AXP_GPIO_CTRL_OUTPUT_HIGH :
+					 AXP_GPIO_CTRL_OUTPUT_LOW);
 }
 
 static const struct dm_gpio_ops gpio_axp_ops = {
@@ -134,8 +101,8 @@ static int gpio_axp_probe(struct udevice *dev)
 	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
 
 	/* Tell the uclass how many GPIOs we have */
-	uc_priv->bank_name = strdup(SUNXI_GPIO_AXP0_PREFIX);
-	uc_priv->gpio_count = SUNXI_GPIO_AXP0_GPIO_COUNT;
+	uc_priv->bank_name = AXP_GPIO_PREFIX;
+	uc_priv->gpio_count = AXP_GPIO_COUNT;
 
 	return 0;
 }
diff --git a/drivers/gpio/sunxi_gpio.c b/drivers/gpio/sunxi_gpio.c
index 2ca4960f17a..094c45a6927 100644
--- a/drivers/gpio/sunxi_gpio.c
+++ b/drivers/gpio/sunxi_gpio.c
@@ -244,17 +244,7 @@ int sunxi_name_to_gpio(const char *name)
 int sunxi_name_to_gpio(const char *name)
 {
 	unsigned int gpio;
-	int ret;
-#if !defined CONFIG_XPL_BUILD && defined CONFIG_AXP_GPIO
-	char lookup[8];
-
-	if (strcasecmp(name, "AXP0-VBUS-ENABLE") == 0) {
-		sprintf(lookup, SUNXI_GPIO_AXP0_PREFIX "%d",
-			SUNXI_GPIO_AXP0_VBUS_ENABLE);
-		name = lookup;
-	}
-#endif
-	ret = gpio_lookup_name(name, NULL, NULL, &gpio);
+	int ret = gpio_lookup_name(name, NULL, NULL, &gpio);
 
 	return ret ? ret : gpio;
 }
diff --git a/include/axp221.h b/include/axp221.h
index 32b988f3a9c..8a4a3cca82f 100644
--- a/include/axp221.h
+++ b/include/axp221.h
@@ -53,10 +53,6 @@
 #ifdef CONFIG_AXP221_POWER
 #define AXP_POWER_STATUS		0x00
 #define AXP_POWER_STATUS_ALDO_IN		BIT(0)
-#define AXP_VBUS_IPSOUT			0x30
-#define AXP_VBUS_IPSOUT_DRIVEBUS		(1 << 2)
-#define AXP_MISC_CTRL			0x8f
-#define AXP_MISC_CTRL_N_VBUSEN_FUNC		(1 << 4)
 #define AXP_GPIO0_CTRL			0x90
 #define AXP_GPIO1_CTRL			0x92
 #define AXP_GPIO_CTRL_OUTPUT_LOW		0x00 /* Drive pin low */
diff --git a/include/axp809.h b/include/axp809.h
index 71a7cb2aaa1..3bd71b3d1a3 100644
--- a/include/axp809.h
+++ b/include/axp809.h
@@ -47,10 +47,6 @@
 #ifdef CONFIG_AXP809_POWER
 #define AXP_POWER_STATUS		0x00
 #define AXP_POWER_STATUS_ALDO_IN		BIT(0)
-#define AXP_VBUS_IPSOUT			0x30
-#define AXP_VBUS_IPSOUT_DRIVEBUS		(1 << 2)
-#define AXP_MISC_CTRL			0x8f
-#define AXP_MISC_CTRL_N_VBUSEN_FUNC		(1 << 4)
 #define AXP_GPIO0_CTRL			0x90
 #define AXP_GPIO1_CTRL			0x92
 #define AXP_GPIO_CTRL_OUTPUT_LOW	0x00 /* Drive pin low */
diff --git a/include/axp818.h b/include/axp818.h
index 08ac35d15fa..b3a9686e0e5 100644
--- a/include/axp818.h
+++ b/include/axp818.h
@@ -61,10 +61,6 @@
 #ifdef CONFIG_AXP818_POWER
 #define AXP_POWER_STATUS		0x00
 #define AXP_POWER_STATUS_ALDO_IN		BIT(0)
-#define AXP_VBUS_IPSOUT			0x30
-#define AXP_VBUS_IPSOUT_DRIVEBUS		(1 << 2)
-#define AXP_MISC_CTRL			0x8f
-#define AXP_MISC_CTRL_N_VBUSEN_FUNC		(1 << 4)
 #define AXP_GPIO0_CTRL			0x90
 #define AXP_GPIO1_CTRL			0x92
 #define AXP_GPIO_CTRL_OUTPUT_LOW	0x00 /* Drive pin low */
diff --git a/include/sunxi_gpio.h b/include/sunxi_gpio.h
index 122987c395e..12b54c8dda4 100644
--- a/include/sunxi_gpio.h
+++ b/include/sunxi_gpio.h
@@ -82,7 +82,6 @@ enum sunxi_gpio_number {
 	SUNXI_GPIO_L_START = 352,
 	SUNXI_GPIO_M_START = SUNXI_GPIO_NEXT(SUNXI_GPIO_L),
 	SUNXI_GPIO_N_START = SUNXI_GPIO_NEXT(SUNXI_GPIO_M),
-	SUNXI_GPIO_AXP0_START = 1024,
 };
 
 /* SUNXI GPIO number definitions */
@@ -99,8 +98,6 @@ enum sunxi_gpio_number {
 #define SUNXI_GPM(_nr)	(SUNXI_GPIO_M_START + (_nr))
 #define SUNXI_GPN(_nr)	(SUNXI_GPIO_N_START + (_nr))
 
-#define SUNXI_GPAXP0(_nr)	(SUNXI_GPIO_AXP0_START + (_nr))
-
 /* GPIO pin function config */
 #define SUNXI_GPIO_INPUT	0
 #define SUNXI_GPIO_OUTPUT	1
@@ -185,11 +182,6 @@ enum sunxi_gpio_number {
 #define SUNXI_GPIO_PULL_UP	1
 #define SUNXI_GPIO_PULL_DOWN	2
 
-/* Virtual AXP0 GPIOs */
-#define SUNXI_GPIO_AXP0_PREFIX "AXP0-"
-#define SUNXI_GPIO_AXP0_VBUS_ENABLE	5
-#define SUNXI_GPIO_AXP0_GPIO_COUNT	6
-
 struct sunxi_gpio_plat {
 	void			*regs;
 	char			bank_name[3];
-- 
2.46.3

