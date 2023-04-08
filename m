Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051FC10E3
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Apr 2023 00:26:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D53981424;
	Fri,  7 Apr 2023 17:27:33 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31B063F6C4;
	Fri,  7 Apr 2023 17:26:48 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Anatolij Gustschin <agust@denx.de>
Cc: Lukasz Majewski <lukma@denx.de>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Sean Anderson <seanga2@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 1/2] video: sunxi: dw-hdmi: Use DM for clock gates and resets
Date: Sat,  8 Apr 2023 01:26:38 +0100
Message-Id: <20230408002639.26241-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.7
In-Reply-To: <20230408002639.26241-1-andre.przywara@arm.com>
References: <20230408002639.26241-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Holland <samuel@sholland.org>

This abstracts away the CCU register layout, which is necessary for
supporting new SoCs like H6 with a reorganized CCU. One of the resets is
referenced from the PHY node instead of the controller node, so it will
have to wait until the PHY code is factored out to a separate driver.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/video/sunxi/sunxi_dw_hdmi.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/video/sunxi/sunxi_dw_hdmi.c b/drivers/video/sunxi/sunxi_dw_hdmi.c
index 4f5d0989286..ef18d1f281f 100644
--- a/drivers/video/sunxi/sunxi_dw_hdmi.c
+++ b/drivers/video/sunxi/sunxi_dw_hdmi.c
@@ -5,12 +5,14 @@
  * (C) Copyright 2017 Jernej Skrabec <jernej.skrabec@siol.net>
  */
 
+#include <clk.h>
 #include <common.h>
 #include <display.h>
 #include <dm.h>
 #include <dw_hdmi.h>
 #include <edid.h>
 #include <log.h>
+#include <reset.h>
 #include <time.h>
 #include <asm/io.h>
 #include <asm/arch/clock.h>
@@ -20,6 +22,8 @@
 
 struct sunxi_dw_hdmi_priv {
 	struct dw_hdmi hdmi;
+	struct reset_ctl_bulk resets;
+	struct clk_bulk clocks;
 };
 
 struct sunxi_hdmi_phy {
@@ -336,14 +340,16 @@ static int sunxi_dw_hdmi_probe(struct udevice *dev)
 	clrsetbits_le32(&ccm->hdmi_clk_cfg, CCM_HDMI_CTRL_PLL_MASK,
 			CCM_HDMI_CTRL_PLL3);
 
-	/* Set ahb gating to pass */
-	setbits_le32(&ccm->ahb_reset1_cfg, 1 << AHB_RESET_OFFSET_HDMI);
+	/* This reset is referenced from the PHY devicetree node. */
 	setbits_le32(&ccm->ahb_reset1_cfg, 1 << AHB_RESET_OFFSET_HDMI2);
-	setbits_le32(&ccm->ahb_gate1, 1 << AHB_GATE_OFFSET_HDMI);
-	setbits_le32(&ccm->hdmi_slow_clk_cfg, CCM_HDMI_SLOW_CTRL_DDC_GATE);
 
-	/* Clock on */
-	setbits_le32(&ccm->hdmi_clk_cfg, CCM_HDMI_CTRL_GATE);
+	ret = reset_deassert_bulk(&priv->resets);
+	if (ret)
+		return ret;
+
+	ret = clk_enable_bulk(&priv->clocks);
+	if (ret)
+		return ret;
 
 	sunxi_dw_hdmi_phy_init(&priv->hdmi);
 
@@ -362,6 +368,7 @@ static int sunxi_dw_hdmi_of_to_plat(struct udevice *dev)
 {
 	struct sunxi_dw_hdmi_priv *priv = dev_get_priv(dev);
 	struct dw_hdmi *hdmi = &priv->hdmi;
+	int ret;
 
 	hdmi->ioaddr = (ulong)dev_read_addr(dev);
 	hdmi->i2c_clk_high = 0xd8;
@@ -369,6 +376,14 @@ static int sunxi_dw_hdmi_of_to_plat(struct udevice *dev)
 	hdmi->reg_io_width = 1;
 	hdmi->phy_set = sunxi_dw_hdmi_phy_cfg;
 
+	ret = reset_get_bulk(dev, &priv->resets);
+	if (ret)
+		return ret;
+
+	ret = clk_get_bulk(dev, &priv->clocks);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
-- 
2.35.7

