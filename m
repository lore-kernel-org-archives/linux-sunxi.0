Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDEB12905
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Apr 2025 00:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744158114; cv=none; b=m2lKVWYX56lTohxgQl16qBDTYbrOADvfx4lVkgrf9Mr0eKYYl79GX6xjKL2ra7FZcdBLX+psFGIsniEKjkigJ0o/jCJ2sLAIG0yZnBGm6gKKJdC9WxsLFwyjhBvQH8z36g5R3de7IeL2ZXj9p0YqtwwarOYEUmixeO2azRElpoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744158114; c=relaxed/simple;
	bh=o7oEkBIP3/liMFE58louqflQwTEGyMHPzzgJuYyYCeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rQ4H/dSs+HtmN6l2TF3KcjQQpzrP7tsLZi0ZoT4R02wAqienCDmytFuF0wwnjLceMCm297jdaZ4uIrgS/0rVE4d+pPhU+ZDXFikGbMubfOo3URg3RVq84+vtAC8OHt6V6Y89M8nRyy7oGboy3SA99AUUGgX26t6tTO9E8uHykFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A9281688;
	Tue,  8 Apr 2025 17:21:52 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3365F3F6A8;
	Tue,  8 Apr 2025 17:21:48 -0700 (PDT)
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
Subject: [PATCH v2 6/8] phy: sun4i-usb: Determine VBUS detection pin from devicetree
Date: Wed,  9 Apr 2025 01:20:34 +0100
Message-ID: <20250409002036.12212-7-andre.przywara@arm.com>
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

So far Allwinner boards controlled the USB VBUS detection via the
respective GPIO pin specified in Kconfig, as a string. All boards should
have the same GPIO already specified in the devicetree, in the
usb0_vbus_det-gpios property.

Convert the usage of the Kconfig configured GPIO over to query that
information from the devicetree, then use the existing DM GPIO
infrastructure to request the GPIO.
Only PHY0 supports USB-OTG, so limit the GPIO request to that PHY, to
avoid claiming it multiple times.

This removes the need to name that GPIO in the defconfig file.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 2def87897d4..42e67b47328 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -86,23 +86,18 @@ struct sun4i_usb_phy_cfg {
 };
 
 struct sun4i_usb_phy_info {
-	const char *gpio_vbus_det;
 	const char *gpio_id_det;
 } phy_info[] = {
 	{
-		.gpio_vbus_det = CONFIG_USB0_VBUS_DET,
 		.gpio_id_det = CONFIG_USB0_ID_DET,
 	},
 	{
-		.gpio_vbus_det = NULL,
 		.gpio_id_det = NULL,
 	},
 	{
-		.gpio_vbus_det = NULL,
 		.gpio_id_det = NULL,
 	},
 	{
-		.gpio_vbus_det = NULL,
 		.gpio_id_det = NULL,
 	},
 };
@@ -494,17 +489,16 @@ static int sun4i_usb_phy_probe(struct udevice *dev)
 				return ret;
 		}
 
-		ret = dm_gpio_lookup_name(info->gpio_vbus_det,
-					  &phy->gpio_vbus_det);
-		if (ret == 0) {
-			ret = dm_gpio_request(&phy->gpio_vbus_det,
-					      "usb_vbus_det");
-			if (ret)
-				return ret;
-			ret = dm_gpio_set_dir_flags(&phy->gpio_vbus_det,
-						    GPIOD_IS_IN);
-			if (ret)
+		if (i == 0) {
+			ret = gpio_request_by_name(dev, "usb0_vbus_det-gpios",
+						   0, &phy->gpio_vbus_det,
+						   GPIOD_IS_IN);
+			if (ret && ret != -ENOENT) {
+				dev_err(dev,
+					"failed to get VBUS detect GPIO: %d\n",
+					ret);
 				return ret;
+			}
 		}
 
 		ret = dm_gpio_lookup_name(info->gpio_id_det, &phy->gpio_id_det);
-- 
2.46.3

