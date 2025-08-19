Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E06ECA4E
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Aug 2025 00:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755562703; cv=none; b=eoWwNU5WnZk6wTBmEbZfFAacjlbqFjCHVrIqp+xB7IqEw625j3ju0NV5lwIgtMdW9o2whtkGK2XTwJDO5h92QMCtmFmtwjlLB3XFpQoZeYfKrmUTfajkJPwa08+fx+x27QzxRbTjwP2Nm0L4MxJcoLH6ISh3Y3Qm+a+6k9jJnJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755562703; c=relaxed/simple;
	bh=hysv5EiLFm6I7/21z2WMgyjzPZbqAwr4wf8JtGpOX90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J9jLcB95wCQTnyvMvRQi0XRcSPyYnaNKBH005IL5Ihy0bM1xo8pHWKDY/iux5gzkh5ZoFJP5dnE+7kg3tPNmCh8gwFDfZqdc9+el5/ldxBm0uaVR40CSRUkDAsHZwZCblU9Tayk/XSEqn/QGSc4bE4MGlUZdNRCK57uEo8GXE8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 225EE1595;
	Mon, 18 Aug 2025 17:18:11 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BD8F3F63F;
	Mon, 18 Aug 2025 17:18:17 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Mikhail Kalashnikov <iuncuim@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] phy: sun4i-usb: drop num_phys assumption
Date: Tue, 19 Aug 2025 01:15:22 +0100
Message-ID: <20250819001522.13011-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far we set a number of expected Allwinner USB PHY instances for any
given compatible string, and would fail if we do not find every PHY
described properly in the DT (missing reset/PMU/clocks).
This is somewhat redundant, as the DT only describes the resources for
the implemented PHYs, but goes in line with being strict about firmware
descriptions, and rather fixing things in the driver code, based on the
compatible string.
However this causes issues when we make a mistake, like we did recently
on the A523: there are actually three USB PHYs, not two, as we assumed.
Changing the number in the driver and the compatible string would cause
all kinds of compatibility issues, both with older and newer DTs.

To avoid problems with newer kernels and older or newer DTs, we can change
the driver code to deduce the number of PHY instances from what's
described in the DT. This has the added advantage of not requiring new
compatible strings for new SoCs when just the number of PHYs change, which
already happened and might occur again in the future.

Drop the num_phys member from the config struct, and remove the fixed
number of PHYs from each SoC's config description. Then enumerate the
usb<x>_reset properties for all of the maximum four PHY instances, and
just stop once we cannot find such a property anymore.
The binding describes the reset property as mandatory for each PHY
instance, and each DT in the kernel tree matches exactly the num_phys
value in the current driver code, so we can rely on that.

Apart from being more future proof, this will solve the A523 mishap:
Older DTs would just describe two PHYs, whereas newer ones would feature
all three of them. In any case we would get a valid number, matching the
other nodes in the DT. Older kernels would always enumerate two PHYs,
which at least does not cause any regressions.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

this is in response to Mikhail's patch series for adding USB3.0 support
for the Allwinner A523 SoC, which revealed the problem with the number
of PHYs begin wrong:
https://lore.kernel.org/linux-sunxi/20250816143117.4b86ecc6@minigeek.lan/

Regression tested on A64 and H6.

Cheers,
Andre

 drivers/phy/allwinner/phy-sun4i-usb.c | 38 +++++++++------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 8873aed3a52aa..59d38d88efb08 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -97,7 +97,6 @@
 #define POLL_TIME			msecs_to_jiffies(250)
 
 struct sun4i_usb_phy_cfg {
-	int num_phys;
 	int hsic_index;
 	u32 disc_thresh;
 	u32 hci_phy_ctl_clear;
@@ -115,6 +114,7 @@ struct sun4i_usb_phy_data {
 	const struct sun4i_usb_phy_cfg *cfg;
 	enum usb_dr_mode dr_mode;
 	spinlock_t reg_lock; /* guard access to phyctl reg */
+	int num_phys;
 	struct sun4i_usb_phy {
 		struct phy *phy;
 		void __iomem *pmu;
@@ -686,7 +686,7 @@ static struct phy *sun4i_usb_phy_xlate(struct device *dev,
 {
 	struct sun4i_usb_phy_data *data = dev_get_drvdata(dev);
 
-	if (args->args[0] >= data->cfg->num_phys)
+	if (args->args[0] >= data->num_phys)
 		return ERR_PTR(-ENODEV);
 
 	if (data->cfg->missing_phys & BIT(args->args[0]))
@@ -779,13 +779,22 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	for (i = 0; i < data->cfg->num_phys; i++) {
+	for (i = 0; i < MAX_PHYS; i++) {
 		struct sun4i_usb_phy *phy = data->phys + i;
 		char name[32];
 
 		if (data->cfg->missing_phys & BIT(i))
 			continue;
 
+		snprintf(name, sizeof(name), "usb%d_reset", i);
+		phy->reset = devm_reset_control_get(dev, name);
+		if (IS_ERR(phy->reset)) {
+			if (PTR_ERR(phy->reset) == -ENOENT)
+				break;
+			dev_err(dev, "failed to get reset %s\n", name);
+			return PTR_ERR(phy->reset);
+		}
+
 		snprintf(name, sizeof(name), "usb%d_vbus", i);
 		phy->vbus = devm_regulator_get_optional(dev, name);
 		if (IS_ERR(phy->vbus)) {
@@ -828,13 +837,6 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 			}
 		}
 
-		snprintf(name, sizeof(name), "usb%d_reset", i);
-		phy->reset = devm_reset_control_get(dev, name);
-		if (IS_ERR(phy->reset)) {
-			dev_err(dev, "failed to get reset %s\n", name);
-			return PTR_ERR(phy->reset);
-		}
-
 		if (i || data->cfg->phy0_dual_route) { /* No pmu for musb */
 			snprintf(name, sizeof(name), "pmu%d", i);
 			phy->pmu = devm_platform_ioremap_resource_byname(pdev, name);
@@ -851,6 +853,7 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 		phy->index = i;
 		phy_set_drvdata(phy->phy, &data->phys[i]);
 	}
+	data->num_phys = i;
 
 	data->id_det_irq = gpiod_to_irq(data->id_det_gpio);
 	if (data->id_det_irq > 0) {
@@ -901,28 +904,24 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
 }
 
 static const struct sun4i_usb_phy_cfg suniv_f1c100s_cfg = {
-	.num_phys = 1,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun4i_a10_cfg = {
-	.num_phys = 3,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = false,
 };
 
 static const struct sun4i_usb_phy_cfg sun5i_a13_cfg = {
-	.num_phys = 2,
 	.disc_thresh = 2,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = false,
 };
 
 static const struct sun4i_usb_phy_cfg sun6i_a31_cfg = {
-	.num_phys = 3,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = true,
@@ -930,14 +929,12 @@ static const struct sun4i_usb_phy_cfg sun6i_a31_cfg = {
 };
 
 static const struct sun4i_usb_phy_cfg sun7i_a20_cfg = {
-	.num_phys = 3,
 	.disc_thresh = 2,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = false,
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_a23_cfg = {
-	.num_phys = 2,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A10,
 	.dedicated_clocks = true,
@@ -945,7 +942,6 @@ static const struct sun4i_usb_phy_cfg sun8i_a23_cfg = {
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_a33_cfg = {
-	.num_phys = 2,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
@@ -953,7 +949,6 @@ static const struct sun4i_usb_phy_cfg sun8i_a33_cfg = {
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_a83t_cfg = {
-	.num_phys = 3,
 	.hsic_index = 2,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
@@ -961,7 +956,6 @@ static const struct sun4i_usb_phy_cfg sun8i_a83t_cfg = {
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_h3_cfg = {
-	.num_phys = 4,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
@@ -970,7 +964,6 @@ static const struct sun4i_usb_phy_cfg sun8i_h3_cfg = {
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
-	.num_phys = 3,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
@@ -979,7 +972,6 @@ static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
-	.num_phys = 1,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
@@ -988,7 +980,6 @@ static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
 };
 
 static const struct sun4i_usb_phy_cfg sun20i_d1_cfg = {
-	.num_phys = 2,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
 	.hci_phy_ctl_clear = PHY_CTL_SIDDQ,
@@ -997,7 +988,6 @@ static const struct sun4i_usb_phy_cfg sun20i_d1_cfg = {
 };
 
 static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
-	.num_phys = 2,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
@@ -1006,7 +996,6 @@ static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
 };
 
 static const struct sun4i_usb_phy_cfg sun50i_h6_cfg = {
-	.num_phys = 4,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
 	.phy0_dual_route = true,
@@ -1015,7 +1004,6 @@ static const struct sun4i_usb_phy_cfg sun50i_h6_cfg = {
 };
 
 static const struct sun4i_usb_phy_cfg sun50i_h616_cfg = {
-	.num_phys = 4,
 	.disc_thresh = 3,
 	.phyctl_offset = REG_PHYCTL_A33,
 	.dedicated_clocks = true,
-- 
2.46.3

