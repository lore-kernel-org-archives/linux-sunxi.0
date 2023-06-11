Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1401CEA8
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Jun 2023 23:33:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 312BDC14;
	Sun, 11 Jun 2023 16:34:23 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DB6F3F663;
	Sun, 11 Jun 2023 16:33:35 -0700 (PDT)
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
Subject: [PATCH v2 6/7] phy: sun4i: Add H616 USB PHY support
Date: Mon, 12 Jun 2023 00:32:40 +0100
Message-Id: <20230611233241.14235-7-andre.przywara@arm.com>
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

Now that the Allwinner USB PHY driver supports the H616 quirk, let's
enable support for USB ports on that SoC.

We connect the compatible string to a new struct describing the SoCs USB
PHY properties, and unblock the PHY driver selection in Kconfig.

A later patch will enable USB support in the H616 boards' defconfigs.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/phy/allwinner/Kconfig         |  1 -
 drivers/phy/allwinner/phy-sun4i-usb.c | 12 ++++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/allwinner/Kconfig b/drivers/phy/allwinner/Kconfig
index 565b4617b01..bb0bd8d5f81 100644
--- a/drivers/phy/allwinner/Kconfig
+++ b/drivers/phy/allwinner/Kconfig
@@ -5,7 +5,6 @@ config PHY_SUN4I_USB
 	bool "Allwinner Sun4I USB PHY driver"
 	depends on ARCH_SUNXI
 	depends on !MACH_SUN9I
-	depends on !MACH_SUN50I_H616
 	default n if MACH_SUN8I_V3S
 	default y
 	select DM_REGULATOR
diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index c81811a7522..77dffcad884 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -672,6 +672,17 @@ static const struct sun4i_usb_phy_cfg sun50i_h6_cfg = {
 	.missing_phys = BIT(1) | BIT(2),
 };
 
+static const struct sun4i_usb_phy_cfg sun50i_h616_cfg = {
+	.num_phys = 4,
+	.disc_thresh = 3,
+	.phyctl_offset = REG_PHYCTL_A33,
+	.dedicated_clocks = true,
+	.phy0_dual_route = true,
+	.hci_phy_ctl_clear = PHY_CTL_SIDDQ,
+	.needs_phy2_siddq = true,
+	.siddq_in_base = true,
+};
+
 static const struct sun4i_usb_phy_cfg suniv_f1c100s_cfg = {
 	.num_phys = 1,
 	.disc_thresh = 3,
@@ -693,6 +704,7 @@ static const struct udevice_id sun4i_usb_phy_ids[] = {
 	{ .compatible = "allwinner,sun20i-d1-usb-phy", .data = (ulong)&sun20i_d1_cfg },
 	{ .compatible = "allwinner,sun50i-a64-usb-phy", .data = (ulong)&sun50i_a64_cfg},
 	{ .compatible = "allwinner,sun50i-h6-usb-phy", .data = (ulong)&sun50i_h6_cfg},
+	{ .compatible = "allwinner,sun50i-h616-usb-phy", .data = (ulong)&sun50i_h616_cfg },
 	{ .compatible = "allwinner,suniv-f1c100s-usb-phy", .data = (ulong)&suniv_f1c100s_cfg },
 	{ }
 };
-- 
2.35.8

