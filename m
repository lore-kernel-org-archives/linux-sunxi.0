Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FA62905
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Apr 2025 00:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744158102; cv=none; b=NDsGQxwXPbwjwlFlryV7h57Khbopzf7zOEiipNh/i9dud0u/KIuzaShomXLyJ7qJtFUE71Shfn8iGotqMPylQNkHadrBwN41pxJjBn4tIYZ7UebUNZDFhKs7dQcz7ajfFKsnddpU1pY/5mjsVilU8zn4wM+XafCwGobr9Ceuv5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744158102; c=relaxed/simple;
	bh=+z3G2lJBqvaC4klGtaGpQL8ahf6xXMXa7nrboR4Mj1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TOmssCZiGv0Zimvpe7vjMcb+/iJOoA2mmmgPROtpF37j4h/78c34uRWdzZL+60DEznQF1u8mb7MuQx3bN+lSwzU3i+27m5MgBDjW65o1V9syk18vXFGW6jYCNVkj/9kYTTLnk6DFN2oSIlqw3y15qURxxmX55EzBp4o321q438A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64F0B2328;
	Tue,  8 Apr 2025 17:21:40 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 014223F6A8;
	Tue,  8 Apr 2025 17:21:35 -0700 (PDT)
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
Subject: [PATCH v2 3/8] phy: sun4i-usb: Control supplies via the regulator uclass
Date: Wed,  9 Apr 2025 01:20:31 +0100
Message-ID: <20250409002036.12212-4-andre.przywara@arm.com>
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

The device tree binding for the PHY provides VBUS supplies as regulator
references. Now that all boards have the appropriate regulator uclass
drivers enabled, the PHY driver can switch to using them. This replaces
direct GPIO usage, which in some cases needed a special DM-incompatible
"virtual" GPIO from the PMIC.

The following boards provided a value for CONFIG_USB0_VBUS_PIN, but are
missing the "usb0_vbus-supply" property in their device tree. None of
them have the MUSB controller enabled in host or OTG mode, so they
should see no impact:
 - Ainol_AW1_defconfig / sun7i-a20-ainol-aw1
 - Ampe_A76_defconfig / sun5i-a13-ampe-a76
 - CHIP_pro_defconfig / sun5i-gr8-chip-pro
 - Cubieboard4_defconfig / sun9i-a80-cubieboard4
 - Merrii_A80_Optimus_defconfig / sun9i-a80-optimus
 - Sunchip_CX-A99_defconfig / sun9i-a80-cx-a99
 - Yones_Toptech_BD1078_defconfig / sun7i-a20-yones-toptech-bd1078
 - Yones_Toptech_BS1078_V2_defconfig /
   sun6i-a31s-yones-toptech-bs1078-v2
 - iNet_3F_defconfig / sun4i-a10-inet-3f
 - iNet_3W_defconfig / sun4i-a10-inet-3w
 - iNet_86VS_defconfig / sun5i-a13-inet-86vs
 - iNet_D978_rev2_defconfig / sun8i-a33-inet-d978-rev2
 - icnova-a20-swac_defconfig / sun7i-a20-icnova-swac
 - sun8i_a23_evb_defconfig / sun8i-a23-evb

Similarly, the following boards set CONFIG_USB1_VBUS_PIN, but do not
have "usb1_vbus-supply" in their device tree. Neither of them have USB
enabled at all, so again there should be no impact:
 - Cubieboard4_defconfig / sun9i-a80-cubieboard4 (also for USB3)
 - sun8i_a23_evb_defconfig / sun8i-a23-evb

The following boards use a different pin for USB1 VBUS between their
defconfig and their device tree. Depending on which is correct, they
may be broken:
 - Linksprite_pcDuino3_Nano_defconfig (PH11) /
   sun7i-a20-pcduino3-nano (PD2)
 - icnova-a20-swac_defconfig (PG10) / sun7i-a20-icnova-swac (PH6)

Finally, this board has conflicting pins given for its USB2 VBUS:
 - Lamobo_R1_defconfig (PH3) / sun7i-a20-lamobo-r1 (PH12)

Signed-off-by: Samuel Holland <samuel@sholland.org>
[Andre: use regulator_set_enable_if_allowed()]
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 35 +++++++++++----------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index b9306c9a827..2def87897d4 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -86,27 +86,22 @@ struct sun4i_usb_phy_cfg {
 };
 
 struct sun4i_usb_phy_info {
-	const char *gpio_vbus;
 	const char *gpio_vbus_det;
 	const char *gpio_id_det;
 } phy_info[] = {
 	{
-		.gpio_vbus = CONFIG_USB0_VBUS_PIN,
 		.gpio_vbus_det = CONFIG_USB0_VBUS_DET,
 		.gpio_id_det = CONFIG_USB0_ID_DET,
 	},
 	{
-		.gpio_vbus = CONFIG_USB1_VBUS_PIN,
 		.gpio_vbus_det = NULL,
 		.gpio_id_det = NULL,
 	},
 	{
-		.gpio_vbus = CONFIG_USB2_VBUS_PIN,
 		.gpio_vbus_det = NULL,
 		.gpio_id_det = NULL,
 	},
 	{
-		.gpio_vbus = CONFIG_USB3_VBUS_PIN,
 		.gpio_vbus_det = NULL,
 		.gpio_id_det = NULL,
 	},
@@ -114,12 +109,12 @@ struct sun4i_usb_phy_info {
 
 struct sun4i_usb_phy_plat {
 	void __iomem *pmu;
-	struct gpio_desc gpio_vbus;
 	struct gpio_desc gpio_vbus_det;
 	struct gpio_desc gpio_id_det;
 	struct clk clocks;
 	struct clk clk2;
 	struct reset_ctl resets;
+	struct udevice *vbus;
 	int id;
 };
 
@@ -208,6 +203,7 @@ static int sun4i_usb_phy_power_on(struct phy *phy)
 {
 	struct sun4i_usb_phy_data *data = dev_get_priv(phy->dev);
 	struct sun4i_usb_phy_plat *usb_phy = &data->usb_phy[phy->id];
+	int ret;
 
 	if (initial_usb_scan_delay) {
 		mdelay(initial_usb_scan_delay);
@@ -220,8 +216,9 @@ static int sun4i_usb_phy_power_on(struct phy *phy)
 		return 0;
 	}
 
-	if (dm_gpio_is_valid(&usb_phy->gpio_vbus))
-		dm_gpio_set_value(&usb_phy->gpio_vbus, 1);
+	ret = regulator_set_enable_if_allowed(usb_phy->vbus, true);
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -230,9 +227,11 @@ static int sun4i_usb_phy_power_off(struct phy *phy)
 {
 	struct sun4i_usb_phy_data *data = dev_get_priv(phy->dev);
 	struct sun4i_usb_phy_plat *usb_phy = &data->usb_phy[phy->id];
+	int ret;
 
-	if (dm_gpio_is_valid(&usb_phy->gpio_vbus))
-		dm_gpio_set_value(&usb_phy->gpio_vbus, 0);
+	ret = regulator_set_enable_if_allowed(usb_phy->vbus, false);
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -482,21 +481,15 @@ static int sun4i_usb_phy_probe(struct udevice *dev)
 	for (i = 0; i < data->cfg->num_phys; i++) {
 		struct sun4i_usb_phy_plat *phy = &plat[i];
 		struct sun4i_usb_phy_info *info = &phy_info[i];
-		char name[16];
+		char name[32];
 
 		if (data->cfg->missing_phys & BIT(i))
 			continue;
 
-		ret = dm_gpio_lookup_name(info->gpio_vbus, &phy->gpio_vbus);
-		if (ret == 0) {
-			ret = dm_gpio_request(&phy->gpio_vbus, "usb_vbus");
-			if (ret)
-				return ret;
-			ret = dm_gpio_set_dir_flags(&phy->gpio_vbus,
-						    GPIOD_IS_OUT);
-			if (ret)
-				return ret;
-			ret = dm_gpio_set_value(&phy->gpio_vbus, 0);
+		snprintf(name, sizeof(name), "usb%d_vbus-supply", i);
+		ret = device_get_supply_regulator(dev, name, &phy->vbus);
+		if (phy->vbus) {
+			ret = regulator_set_enable_if_allowed(phy->vbus, false);
 			if (ret)
 				return ret;
 		}
-- 
2.46.3

