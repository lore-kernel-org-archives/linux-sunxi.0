Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C6170
	for <linux-sunxi@lists.linux.dev>; Wed, 26 May 2021 00:57:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DE4C168F;
	Tue, 25 May 2021 17:57:42 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4B5D3F719;
	Tue, 25 May 2021 17:57:40 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de,
	Paul Kocialkowski <contact@paulk.fr>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Icenowy Zheng <icenowy@aosc.io>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] phy: sun4i-usb: Fix PHY0 routing and passby configuration for MUSB
Date: Wed, 26 May 2021 01:57:18 +0100
Message-Id: <20210526005718.23767-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Recent Allwinner platforms (starting with the H3) only use the MUSB
controller for peripheral mode and use HCI for host mode. As a result,
extra steps need to be taken to properly route USB signals to one or
the other. More precisely, the following is required:
* Routing the pins to either HCI/MUSB (controlled by PHY);
* Enabling USB PHY passby in HCI mode (controlled by PMU).

The current code will enable passby for each PHY and reroute PHY0 to
MUSB, which is inconsistent and results in broken USB host support
for port 0.

Passby on PHY0 must only be enabled when we want to use HCI. Since
host/device mode detection is not available from the PHY code and
because U-Boot does not support changing the mode dynamically anyway,
we can just mux the controller to MUSB if it is enabled and mux it to
HCI otherwise.

This fixes USB host support for port 0 on platforms with PHY0 dual-route,
especially on boards like Pine64 (with only USB-A host ports) and
TV boxes without OTG ports.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
[Andre: tweak commit message, use IS_ENABLED()]
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

for H6 boards to work this requires a DT update (to get the <&usbphy 0>
links between HCI and PHY), which I will send later.
Tested on Pine H64, Pine64-LTS, OrangePi Zero, OrangePi PC 2, BananaPi M64,
BananaPi M1.

Cheers,
Andre

 drivers/phy/allwinner/phy-sun4i-usb.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 5723c980323..e6ceafc7648 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -313,9 +313,21 @@ static int sun4i_usb_phy_init(struct phy *phy)
 				    data->cfg->disc_thresh, PHY_DISCON_TH_LEN);
 	}
 
-	sun4i_usb_phy_passby(phy, true);
+	if (IS_ENABLED(CONFIG_USB_MUSB_SUNXI)) {
+		/* Needed for HCI and conflicts with MUSB, keep PHY0 on MUSB */
+		if (usb_phy->id != 0)
+			sun4i_usb_phy_passby(phy, true);
+
+		/* Route PHY0 to MUSB to allow USB gadget */
+		if (data->cfg->phy0_dual_route)
+			sun4i_usb_phy0_reroute(data, true);
+	} else {
+		sun4i_usb_phy_passby(phy, true);
 
-	sun4i_usb_phy0_reroute(data, true);
+		/* Route PHY0 to HCI to allow USB host */
+		if (data->cfg->phy0_dual_route)
+			sun4i_usb_phy0_reroute(data, false);
+	}
 
 	return 0;
 }
-- 
2.17.5

