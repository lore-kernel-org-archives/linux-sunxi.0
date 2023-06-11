Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB2F1641D
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Jun 2023 23:33:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43EED1FB;
	Sun, 11 Jun 2023 16:34:21 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1506A3F663;
	Sun, 11 Jun 2023 16:33:33 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Samuel Holland <samuel@sholland.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Sam Edwards <cfsworks@gmail.com>,
	=?UTF-8?q?=E8=B7=AF=E8=BE=89?= <luhux76@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 5/7] phy: sun4i-usb: Add H616 USB PHY quirk support
Date: Mon, 12 Jun 2023 00:32:39 +0100
Message-Id: <20230611233241.14235-6-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20230611233241.14235-1-andre.przywara@arm.com>
References: <20230611233241.14235-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The H616 USB PHY is some kind of special snowflake: Only port2 works out
of the box, but all other ports need some help from this port2 to work
correctly: The CLK_BUS_PHY2 and RST_USB_PHY2 clock and reset need to be
enabled, and the SIDDQ bit in the PMU PHY control register needs to be
cleared. For this register to be accessible, CLK_BUS_ECHI2 needs to be
ungated. Don't ask ....

Follow the respective Linux patch (b45c6d80325b) and add a quirk bit,
triggering the special sequence as outlined above, for PHYs other than
PHY2: ungate this one special clock, and clear the SIDDQ bit. We also
pick the clock and reset from PHY2 and enable them as well.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 46 +++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 88c1a3dc84a..c81811a7522 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -82,6 +82,7 @@ struct sun4i_usb_phy_cfg {
 	bool dedicated_clocks;
 	bool phy0_dual_route;
 	bool siddq_in_base;
+	bool needs_phy2_siddq;
 	int missing_phys;
 };
 
@@ -118,6 +119,7 @@ struct sun4i_usb_phy_plat {
 	struct gpio_desc gpio_vbus_det;
 	struct gpio_desc gpio_id_det;
 	struct clk clocks;
+	struct clk clk2;
 	struct reset_ctl resets;
 	int id;
 };
@@ -272,6 +274,41 @@ static int sun4i_usb_phy_init(struct phy *phy)
 		return ret;
 	}
 
+	/* Some PHYs on some SoCs (the H616) need the help of PHY2 to work. */
+	if (data->cfg->needs_phy2_siddq && phy->id != 2) {
+		struct sun4i_usb_phy_plat *phy2 = &data->usb_phy[2];
+
+		ret = clk_enable(&phy2->clocks);
+		if (ret) {
+			dev_err(phy->dev, "failed to enable aux clock\n");
+			return ret;
+		}
+
+		ret = reset_deassert(&phy2->resets);
+		if (ret) {
+			dev_err(phy->dev, "failed to deassert aux reset\n");
+			return ret;
+		}
+
+		/*
+		 * This extra clock is just needed to access the
+		 * REG_HCI_PHY_CTL PMU register for PHY2.
+		 */
+		ret = clk_enable(&phy2->clk2);
+		if (ret) {
+			dev_err(phy->dev, "failed to enable PHY2 clock\n");
+			return ret;
+		}
+
+		if (phy2->pmu && data->cfg->hci_phy_ctl_clear) {
+			val = readl(phy2->pmu + REG_HCI_PHY_CTL);
+			val &= ~data->cfg->hci_phy_ctl_clear;
+			writel(val, phy2->pmu + REG_HCI_PHY_CTL);
+		}
+
+		clk_disable(&phy2->clk2);
+	}
+
 	if (usb_phy->pmu && data->cfg->hci_phy_ctl_clear) {
 		val = readl(usb_phy->pmu + REG_HCI_PHY_CTL);
 		val &= ~data->cfg->hci_phy_ctl_clear;
@@ -500,6 +537,15 @@ static int sun4i_usb_phy_probe(struct udevice *dev)
 			return ret;
 		}
 
+		/* Helper clock from PHY2 for the H616 PHY quirk */
+		snprintf(name, sizeof(name), "pmu%d_clk", i);
+		ret = clk_get_by_name_optional(dev, name, &phy->clk2);
+		if (ret) {
+			dev_err(dev, "failed to get pmu%d_clk clock phandle\n",
+				i);
+			return ret;
+		}
+
 		snprintf(name, sizeof(name), "usb%d_reset", i);
 		ret = reset_get_by_name(dev, name, &phy->resets);
 		if (ret) {
-- 
2.35.8

