Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198CB15C2
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Jan 2023 01:22:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D20A1576;
	Sun,  8 Jan 2023 17:23:17 -0800 (PST)
Received: from donnerap.cambridge.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A42F23F67D;
	Sun,  8 Jan 2023 17:22:33 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v5 3/3] phy: sun4i-usb: Replace types with explicit quirk flags
Date: Mon,  9 Jan 2023 01:22:23 +0000
Message-Id: <20230109012223.4079299-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230109012223.4079299-1-andre.przywara@arm.com>
References: <20230109012223.4079299-1-andre.przywara@arm.com>
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

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 51 ++++++++-------------------
 1 file changed, 15 insertions(+), 36 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index d9beacc3f8c22..fbcd7014ab437 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -99,28 +99,17 @@
 #define DEBOUNCE_TIME			msecs_to_jiffies(50)
 #define POLL_TIME			msecs_to_jiffies(250)
 
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
 	int hsic_index;
-	enum sun4i_usb_phy_type type;
 	u32 disc_thresh;
 	u32 hci_phy_ctl_clear;
 	u8 phyctl_offset;
 	bool dedicated_clocks;
 	bool phy0_dual_route;
 	bool needs_phy2_siddq;
+	bool siddq_in_base;
+	bool poll_vbusen;
 	int missing_phys;
 };
 
@@ -252,7 +241,8 @@ static void sun4i_usb_phy_passby(struct sun4i_usb_phy *phy, int enable)
 		SUNXI_AHB_INCRX_ALIGN_EN | SUNXI_ULPI_BYPASS_EN;
 
 	/* A83T USB2 is HSIC */
-	if (phy_data->cfg->type == sun8i_a83t_phy && phy->index == 2)
+	if (phy_data->cfg->hsic_index &&
+	    phy->index == phy_data->cfg->hsic_index)
 		bits |= SUNXI_EHCI_HS_FORCE | SUNXI_HSIC_CONNECT_INT |
 			SUNXI_HSIC;
 
@@ -340,8 +330,7 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 		writel(val, phy->pmu + REG_HCI_PHY_CTL);
 	}
 
-	if (data->cfg->type == sun8i_a83t_phy ||
-	    data->cfg->type == sun50i_h6_phy) {
+	if (data->cfg->siddq_in_base) {
 		if (phy->index == 0) {
 			val = readl(data->base + data->cfg->phyctl_offset);
 			val |= PHY_CTL_VBUSVLDEXT;
@@ -385,8 +374,7 @@ static int sun4i_usb_phy_exit(struct phy *_phy)
 	struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
 
 	if (phy->index == 0) {
-		if (data->cfg->type == sun8i_a83t_phy ||
-		    data->cfg->type == sun50i_h6_phy) {
+		if (data->cfg->siddq_in_base) {
 			void __iomem *phyctl = data->base +
 				data->cfg->phyctl_offset;
 
@@ -466,9 +454,8 @@ static bool sun4i_usb_phy0_poll(struct sun4i_usb_phy_data *data)
 	 * vbus using the N_VBUSEN pin on the pmic, so we must poll
 	 * when using the pmic for vbus-det _and_ we're driving vbus.
 	 */
-	if ((data->cfg->type == sun6i_a31_phy ||
-	     data->cfg->type == sun8i_a33_phy) &&
-	    data->vbus_power_supply && data->phys[0].regulator_on)
+	if (data->cfg->poll_vbusen && data->vbus_power_supply &&
+	    data->phys[0].regulator_on)
 		return true;
 
 	return false;
@@ -920,7 +907,6 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 
 static const struct sun4i_usb_phy_cfg suniv_f1c100s_cfg = {
 	.num_phys = 1,
-	.type = sun4i_a10_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = true,
@@ -928,7 +914,6 @@ static const struct sun4i_usb_phy_cfg suniv_f1c100s_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun4i_a10_cfg = {
 	.num_phys = 3,
-	.type = sun4i_a10_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = false,
@@ -936,7 +921,6 @@ static const struct sun4i_usb_phy_cfg sun4i_a10_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun5i_a13_cfg = {
 	.num_phys = 2,
-	.type = sun4i_a10_phy,
 	.disc_thresh = 2,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = false,
@@ -944,15 +928,14 @@ static const struct sun4i_usb_phy_cfg sun5i_a13_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun6i_a31_cfg = {
 	.num_phys = 3,
-	.type = sun6i_a31_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = true,
+	.poll_vbusen = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun7i_a20_cfg = {
 	.num_phys = 3,
-	.type = sun4i_a10_phy,
 	.disc_thresh = 2,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = false,
@@ -960,31 +943,30 @@ static const struct sun4i_usb_phy_cfg sun7i_a20_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun8i_a23_cfg = {
 	.num_phys = 2,
-	.type = sun6i_a31_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = true,
+	.poll_vbusen = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_a33_cfg = {
 	.num_phys = 2,
-	.type = sun8i_a33_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
+	.poll_vbusen = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_a83t_cfg = {
 	.num_phys = 3,
 	.hsic_index = 2,
-	.type = sun8i_a83t_phy,
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
@@ -994,7 +976,6 @@ static const struct sun4i_usb_phy_cfg sun8i_h3_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
 	.num_phys = 3,
-	.type = sun8i_r40_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
@@ -1004,7 +985,6 @@ static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
 	.num_phys = 1,
-	.type = sun8i_v3s_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
@@ -1014,16 +994,15 @@ static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
 
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
@@ -1033,22 +1012,22 @@ static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
 
 static const struct sun4i_usb_phy_cfg sun50i_h6_cfg = {
 	.num_phys = 4,
-	.type = sun50i_h6_phy,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
 	.phy0_dual_route = true,
 	.missing_phys = BIT(1) | BIT(2),
+	.siddq_in_base = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun50i_h616_cfg = {
 	.num_phys = 4,
-	.type = sun50i_h6_phy,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
 	.phy0_dual_route = true,
 	.hci_phy_ctl_clear = PHY_CTL_SIDDQ,
 	.needs_phy2_siddq = true,
+	.siddq_in_base = true,
 };
 
 static const struct of_device_id sun4i_usb_phy_of_match[] = {
-- 
2.25.1

