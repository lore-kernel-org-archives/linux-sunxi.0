Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7412905
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Apr 2025 00:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744158119; cv=none; b=fg/Tg4OtREN5tndWpM9l+TVD9dpD//OzsyDwRRUKHmrKUxJUwLRUnXKwI9LsqLbd/n1CvhbLgBw1v5ih/zEGexS0Ar1KuKXPw+kSAzwLnTSfaEaIarSNTXeS7AXr6Msl08UNwQMKgprcVVt+AtZ2axMMNhEkfDl0gTlQE3X2VJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744158119; c=relaxed/simple;
	bh=RIu0hQskOih6iw5dt6ZieOG27DIv9NVhwvXKRgqqi5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kv3RGfKahxUffusToa/yDc75quDO+E0QWsF7Bj88lT8Qyz1HDeOgtXjWfHBlAs8TYnUEksseK7Pm1g+ZaNUfSTnt5ohV6hyWofehu+CstSr4nJnvYpGuckYo7Jlfuvdc9FD18Aw213jThGXDDrLieDJJhOwOFahDck/p4y3mAdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4D6B22FC;
	Tue,  8 Apr 2025 17:21:56 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D8713F6A8;
	Tue,  8 Apr 2025 17:21:52 -0700 (PDT)
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
Subject: [PATCH v2 7/8] phy: sun4i-usb: Determine USB OTG detection pin from devicetree
Date: Wed,  9 Apr 2025 01:20:35 +0100
Message-ID: <20250409002036.12212-8-andre.przywara@arm.com>
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

So far Allwinner boards controlled the USB OTG ID detection via the
respective GPIO pin specified in Kconfig, as a string. All boards should
have the same GPIO already specified in the devicetree, in the
usb0_id_det-gpios property.

Convert the usage of the Kconfig configured GPIO over to query that
information from the devicetree, then use the existing DM GPIO
infrastructure to request the GPIO.
Only PHY0 supports USB-OTG, so limit the GPIO request to that PHY, to
avoid claiming it multiple times.

This removes the need to name that GPIO in the defconfig file.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 35 ++++++---------------------
 1 file changed, 8 insertions(+), 27 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 42e67b47328..3acffb40b0b 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -85,23 +85,6 @@ struct sun4i_usb_phy_cfg {
 	int missing_phys;
 };
 
-struct sun4i_usb_phy_info {
-	const char *gpio_id_det;
-} phy_info[] = {
-	{
-		.gpio_id_det = CONFIG_USB0_ID_DET,
-	},
-	{
-		.gpio_id_det = NULL,
-	},
-	{
-		.gpio_id_det = NULL,
-	},
-	{
-		.gpio_id_det = NULL,
-	},
-};
-
 struct sun4i_usb_phy_plat {
 	void __iomem *pmu;
 	struct gpio_desc gpio_vbus_det;
@@ -475,7 +458,6 @@ static int sun4i_usb_phy_probe(struct udevice *dev)
 	data->usb_phy = plat;
 	for (i = 0; i < data->cfg->num_phys; i++) {
 		struct sun4i_usb_phy_plat *phy = &plat[i];
-		struct sun4i_usb_phy_info *info = &phy_info[i];
 		char name[32];
 
 		if (data->cfg->missing_phys & BIT(i))
@@ -499,17 +481,16 @@ static int sun4i_usb_phy_probe(struct udevice *dev)
 					ret);
 				return ret;
 			}
-		}
 
-		ret = dm_gpio_lookup_name(info->gpio_id_det, &phy->gpio_id_det);
-		if (ret == 0) {
-			ret = dm_gpio_request(&phy->gpio_id_det, "usb_id_det");
-			if (ret)
-				return ret;
-			ret = dm_gpio_set_dir_flags(&phy->gpio_id_det,
-						GPIOD_IS_IN | GPIOD_PULL_UP);
-			if (ret)
+			ret = gpio_request_by_name(dev, "usb0_id_det-gpios", 0,
+						   &phy->gpio_id_det,
+						   GPIOD_IS_IN | GPIOD_PULL_UP);
+			if (ret && ret != -ENOENT) {
+				dev_err(dev,
+					"failed to get ID detect GPIO: %d\n",
+					ret);
 				return ret;
+			}
 		}
 
 		if (data->cfg->dedicated_clocks)
-- 
2.46.3

