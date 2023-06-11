Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF89EA8
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Jun 2023 23:33:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A5EFD75;
	Sun, 11 Jun 2023 16:34:19 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0E1B3F663;
	Sun, 11 Jun 2023 16:33:31 -0700 (PDT)
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
Subject: [PATCH v2 4/7] phy: sun4i-usb: Replace types with explicit quirk flags
Date: Mon, 12 Jun 2023 00:32:38 +0100
Message-Id: <20230611233241.14235-5-andre.przywara@arm.com>
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

So far we were assigning some crude "type" (SoC name, really) to each
Allwinner USB PHY model, then guarding certain quirks based on this.
This does not only look weird, but gets more or more cumbersome to
maintain.

Remove the bogus type names altogether, instead introduce flags for each
quirk, and explicitly check for them.
This improves readability, and simplifies future extensions.

Port of Linux patch 8dd256bae653.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 41 ++++++---------------------
 1 file changed, 9 insertions(+), 32 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 2bf47fc36a7..88c1a3dc84a 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -73,26 +73,15 @@
 
 #define MAX_PHYS			4
 
-enum sun4i_usb_phy_type {
-	sun4i_a10_phy,
-	sun6i_a31_phy,
-	sun8i_a33_phy,
-	sun8i_a83t_phy,
-	sun8i_h3_phy,
-	sun8i_r40_phy,
-	sun8i_v3s_phy,
-	sun50i_a64_phy,
-	sun50i_h6_phy,
-};
-
 struct sun4i_usb_phy_cfg {
 	int num_phys;
-	enum sun4i_usb_phy_type type;
+	int hsic_index;
 	u32 disc_thresh;
 	u32 hci_phy_ctl_clear;
 	u8 phyctl_offset;
 	bool dedicated_clocks;
 	bool phy0_dual_route;
+	bool siddq_in_base;
 	int missing_phys;
 };
 
@@ -200,7 +189,7 @@ static void sun4i_usb_phy_passby(struct phy *phy, bool enable)
 		SUNXI_AHB_INCRX_ALIGN_EN | SUNXI_ULPI_BYPASS_EN;
 
 	/* A83T USB2 is HSIC */
-	if (data->cfg->type == sun8i_a83t_phy && usb_phy->id == 2)
+	if (data->cfg->hsic_index && usb_phy->id == data->cfg->hsic_index)
 		bits |= SUNXI_EHCI_HS_FORCE | SUNXI_HSIC_CONNECT_INT |
 			SUNXI_HSIC;
 
@@ -289,8 +278,7 @@ static int sun4i_usb_phy_init(struct phy *phy)
 		writel(val, usb_phy->pmu + REG_HCI_PHY_CTL);
 	}
 
-	if (data->cfg->type == sun8i_a83t_phy ||
-	    data->cfg->type == sun50i_h6_phy) {
+	if (data->cfg->siddq_in_base) {
 		if (phy->id == 0) {
 			val = readl(data->base + data->cfg->phyctl_offset);
 			val |= PHY_CTL_VBUSVLDEXT;
@@ -339,8 +327,7 @@ static int sun4i_usb_phy_exit(struct phy *phy)
 	int ret;
 
 	if (phy->id == 0) {
-		if (data->cfg->type == sun8i_a83t_phy ||
-		    data->cfg->type == sun50i_h6_phy) {
+		if (data->cfg->siddq_in_base) {
 			void __iomem *phyctl = data->base +
 				data->cfg->phyctl_offset;
 
@@ -536,7 +523,6 @@ static int sun4i_usb_phy_probe(struct udevice *dev)
 
 static const struct sun4i_usb_phy_cfg sun4i_a10_cfg = {
 	.num_phys = 3,
-	.type = sun4i_a10_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = false,
@@ -544,7 +530,6 @@ static const struct sun4i_usb_phy_cfg sun4i_a10_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun5i_a13_cfg = {
 	.num_phys = 2,
-	.type = sun4i_a10_phy,
 	.disc_thresh = 2,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = false,
@@ -552,7 +537,6 @@ static const struct sun4i_usb_phy_cfg sun5i_a13_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun6i_a31_cfg = {
 	.num_phys = 3,
-	.type = sun6i_a31_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = true,
@@ -560,7 +544,6 @@ static const struct sun4i_usb_phy_cfg sun6i_a31_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun7i_a20_cfg = {
 	.num_phys = 3,
-	.type = sun4i_a10_phy,
 	.disc_thresh = 2,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = false,
@@ -568,7 +551,6 @@ static const struct sun4i_usb_phy_cfg sun7i_a20_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun8i_a23_cfg = {
 	.num_phys = 2,
-	.type = sun4i_a10_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = true,
@@ -576,7 +558,6 @@ static const struct sun4i_usb_phy_cfg sun8i_a23_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun8i_a33_cfg = {
 	.num_phys = 2,
-	.type = sun8i_a33_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
@@ -584,14 +565,14 @@ static const struct sun4i_usb_phy_cfg sun8i_a33_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun8i_a83t_cfg = {
 	.num_phys = 3,
-	.type = sun8i_a83t_phy,
+	.hsic_index = 2,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
+	.siddq_in_base = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_h3_cfg = {
 	.num_phys = 4,
-	.type = sun8i_h3_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
@@ -601,7 +582,6 @@ static const struct sun4i_usb_phy_cfg sun8i_h3_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
 	.num_phys = 3,
-	.type = sun8i_r40_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
@@ -611,7 +591,6 @@ static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
 	.num_phys = 1,
-	.type = sun8i_v3s_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
@@ -621,16 +600,15 @@ static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun20i_d1_cfg = {
 	.num_phys = 2,
-	.type = sun50i_h6_phy,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
 	.hci_phy_ctl_clear = PHY_CTL_SIDDQ,
 	.phy0_dual_route = true,
+	.siddq_in_base = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
 	.num_phys = 2,
-	.type = sun50i_a64_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
@@ -640,17 +618,16 @@ static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun50i_h6_cfg = {
 	.num_phys = 4,
-	.type = sun50i_h6_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
 	.phy0_dual_route = true,
+	.siddq_in_base = true,
 	.missing_phys = BIT(1) | BIT(2),
 };
 
 static const struct sun4i_usb_phy_cfg suniv_f1c100s_cfg = {
 	.num_phys = 1,
-	.type = sun4i_a10_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = true,
-- 
2.35.8

