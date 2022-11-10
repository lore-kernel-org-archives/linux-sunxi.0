Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D98D626
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Nov 2022 07:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC439C433C1;
	Thu, 10 Nov 2022 07:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668065664;
	bh=ORU0qrBQLiwD80y04yoBx3tqJygBCTo9ElPeDBafR2w=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=pMd6+hNmjeMyihzzNVABLyxoqDIfjicphHu4Bi7/SwZ/vMy3Vp9SSecMu63AYtEJs
	 QI9tf1ERFsmKqYFhqaaebFdKuhNlOA3oqPvTkNVDXgfj0PGVY2vL8XlIfQ+oLmgSMk
	 7Tp9g+QHmas3nwcWc/AKtcpGGdN/ntwCew9i2xttNyqDgUSwCh4TC6H5y8RcUsKN0I
	 VfAgExLmImTBSt/w80tk513Lb/oYmrzrtwbDUjQEVFGQi3YPDWEfT4sEpT5Y1xFTjx
	 UeD0fYY8azgZfr7IAQpoLS34dVzbGGGtN/gdrukbgbE0QJaK6RegveKEPZyXhhmbXP
	 Y/BdIkAcJop2w==
Date: Thu, 10 Nov 2022 13:04:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
List-Id: <soc.lore.kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, soc@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v3 10/11] phy: sun4i-usb: Replace types with explicit
 quirk flags
Message-ID: <Y2ype6fU6nKyIH1w@matsya>
References: <20221106154826.6687-1-andre.przywara@arm.com>
 <20221106154826.6687-11-andre.przywara@arm.com>
 <D8382138-8943-46F7-B6A6-F83DF98E26AE@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D8382138-8943-46F7-B6A6-F83DF98E26AE@icenowy.me>

On 06-11-22, 23:54, Icenowy Zheng wrote:
> 
> 
> 于 2022年11月6日 GMT+08:00 下午11:48:25, Andre Przywara <andre.przywara@arm.com> 写到:
> >So far we were assigning some crude "type" (SoC name, really) to each
> >Allwinner USB PHY model, then guarding certain quirks based on this.
> >This does not only look weird, but gets more or more cumbersome to
> >maintain.
> >
> >Remove the bogus type names altogether, instead introduce flags for each
> >quirk, and explicitly check for them.
> >This improves readability, and simplifies future extensions.
> >
> >Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >---
> > drivers/phy/allwinner/phy-sun4i-usb.c | 50 ++++++++-------------------
> > 1 file changed, 15 insertions(+), 35 deletions(-)
> >
> >diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
> >index 51fb24c6dcb3..422129c66282 100644
> >--- a/drivers/phy/allwinner/phy-sun4i-usb.c
> >+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> >@@ -99,27 +99,17 @@
> > #define DEBOUNCE_TIME			msecs_to_jiffies(50)
> > #define POLL_TIME			msecs_to_jiffies(250)
> > 
> >-enum sun4i_usb_phy_type {
> >-	sun4i_a10_phy,
> >-	sun6i_a31_phy,
> >-	sun8i_a33_phy,
> >-	sun8i_a83t_phy,
> >-	sun8i_h3_phy,
> >-	sun8i_r40_phy,
> >-	sun8i_v3s_phy,
> >-	sun50i_a64_phy,
> >-	sun50i_h6_phy,
> >-};
> >-
> > struct sun4i_usb_phy_cfg {
> > 	int num_phys;
> > 	int hsic_index;
> >-	enum sun4i_usb_phy_type type;
> > 	u32 disc_thresh;
> > 	u32 hci_phy_ctl_clear;
> > 	u8 phyctl_offset;
> > 	bool dedicated_clocks;
> > 	bool phy0_dual_route;
> >+	bool phy2_is_hsic;
> 
> Maybe use a `int hsic_phy` instead? But the problem is this practice is
> assuming USB0 could not be HSIC -- although USB0 is usually OTG.

why should it be int.. dont think hsic_phy is improvement over
phy2_is_hsic?

> 
> >+	bool siddq_in_base;
> >+	bool poll_vbusen;
> > 	int missing_phys;
> > };
> > 
> >@@ -251,7 +241,7 @@ static void sun4i_usb_phy_passby(struct sun4i_usb_phy *phy, int enable)
> > 		SUNXI_AHB_INCRX_ALIGN_EN | SUNXI_ULPI_BYPASS_EN;
> > 
> > 	/* A83T USB2 is HSIC */
> >-	if (phy_data->cfg->type == sun8i_a83t_phy && phy->index == 2)
> >+	if (phy_data->cfg->phy2_is_hsic && phy->index == 2)
> > 		bits |= SUNXI_EHCI_HS_FORCE | SUNXI_HSIC_CONNECT_INT |
> > 			SUNXI_HSIC;
> > 
> >@@ -295,8 +285,7 @@ static int sun4i_usb_phy_init(struct phy *_phy)
> > 		writel(val, phy->pmu + REG_HCI_PHY_CTL);
> > 	}
> > 
> >-	if (data->cfg->type == sun8i_a83t_phy ||
> >-	    data->cfg->type == sun50i_h6_phy) {
> >+	if (data->cfg->siddq_in_base) {
> > 		if (phy->index == 0) {
> > 			val = readl(data->base + data->cfg->phyctl_offset);
> > 			val |= PHY_CTL_VBUSVLDEXT;
> >@@ -340,8 +329,7 @@ static int sun4i_usb_phy_exit(struct phy *_phy)
> > 	struct sun4i_usb_phy_data *data = to_sun4i_usb_phy_data(phy);
> > 
> > 	if (phy->index == 0) {
> >-		if (data->cfg->type == sun8i_a83t_phy ||
> >-		    data->cfg->type == sun50i_h6_phy) {
> >+		if (data->cfg->siddq_in_base) {
> > 			void __iomem *phyctl = data->base +
> > 				data->cfg->phyctl_offset;
> > 
> >@@ -414,9 +402,8 @@ static bool sun4i_usb_phy0_poll(struct sun4i_usb_phy_data *data)
> > 	 * vbus using the N_VBUSEN pin on the pmic, so we must poll
> > 	 * when using the pmic for vbus-det _and_ we're driving vbus.
> > 	 */
> >-	if ((data->cfg->type == sun6i_a31_phy ||
> >-	     data->cfg->type == sun8i_a33_phy) &&
> >-	    data->vbus_power_supply && data->phys[0].regulator_on)
> >+	if (data->cfg->poll_vbusen && data->vbus_power_supply &&
> >+	    data->phys[0].regulator_on)
> > 		return true;
> > 
> > 	return false;
> >@@ -861,7 +848,6 @@ static int sun4i_usb_phy_probe(struct platform_device *pdev)
> > 
> > static const struct sun4i_usb_phy_cfg suniv_f1c100s_cfg = {
> > 	.num_phys = 1,
> >-	.type = sun4i_a10_phy,
> > 	.disc_thresh = 3,
> > 	.phyctl_offset = REG_PHYCTL_A10,
> > 	.dedicated_clocks = true,
> >@@ -869,7 +855,6 @@ static const struct sun4i_usb_phy_cfg suniv_f1c100s_cfg = {
> > 
> > static const struct sun4i_usb_phy_cfg sun4i_a10_cfg = {
> > 	.num_phys = 3,
> >-	.type = sun4i_a10_phy,
> > 	.disc_thresh = 3,
> > 	.phyctl_offset = REG_PHYCTL_A10,
> > 	.dedicated_clocks = false,
> >@@ -877,7 +862,6 @@ static const struct sun4i_usb_phy_cfg sun4i_a10_cfg = {
> > 
> > static const struct sun4i_usb_phy_cfg sun5i_a13_cfg = {
> > 	.num_phys = 2,
> >-	.type = sun4i_a10_phy,
> > 	.disc_thresh = 2,
> > 	.phyctl_offset = REG_PHYCTL_A10,
> > 	.dedicated_clocks = false,
> >@@ -885,15 +869,14 @@ static const struct sun4i_usb_phy_cfg sun5i_a13_cfg = {
> > 
> > static const struct sun4i_usb_phy_cfg sun6i_a31_cfg = {
> > 	.num_phys = 3,
> >-	.type = sun6i_a31_phy,
> > 	.disc_thresh = 3,
> > 	.phyctl_offset = REG_PHYCTL_A10,
> > 	.dedicated_clocks = true,
> >+	.poll_vbusen = true,
> > };
> > 
> > static const struct sun4i_usb_phy_cfg sun7i_a20_cfg = {
> > 	.num_phys = 3,
> >-	.type = sun4i_a10_phy,
> > 	.disc_thresh = 2,
> > 	.phyctl_offset = REG_PHYCTL_A10,
> > 	.dedicated_clocks = false,
> >@@ -901,31 +884,31 @@ static const struct sun4i_usb_phy_cfg sun7i_a20_cfg = {
> > 
> > static const struct sun4i_usb_phy_cfg sun8i_a23_cfg = {
> > 	.num_phys = 2,
> >-	.type = sun6i_a31_phy,
> > 	.disc_thresh = 3,
> > 	.phyctl_offset = REG_PHYCTL_A10,
> > 	.dedicated_clocks = true,
> >+	.poll_vbusen = true,
> > };
> > 
> > static const struct sun4i_usb_phy_cfg sun8i_a33_cfg = {
> > 	.num_phys = 2,
> >-	.type = sun8i_a33_phy,
> > 	.disc_thresh = 3,
> > 	.phyctl_offset = REG_PHYCTL_A33,
> > 	.dedicated_clocks = true,
> >+	.poll_vbusen = true,
> > };
> > 
> > static const struct sun4i_usb_phy_cfg sun8i_a83t_cfg = {
> > 	.num_phys = 3,
> > 	.hsic_index = 2,
> >-	.type = sun8i_a83t_phy,
> > 	.phyctl_offset = REG_PHYCTL_A33,
> > 	.dedicated_clocks = true,
> >+	.siddq_in_base = true,
> >+	.phy2_is_hsic = true,
> > };
> > 
> > static const struct sun4i_usb_phy_cfg sun8i_h3_cfg = {
> > 	.num_phys = 4,
> >-	.type = sun8i_h3_phy,
> > 	.disc_thresh = 3,
> > 	.phyctl_offset = REG_PHYCTL_A33,
> > 	.dedicated_clocks = true,
> >@@ -935,7 +918,6 @@ static const struct sun4i_usb_phy_cfg sun8i_h3_cfg = {
> > 
> > static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
> > 	.num_phys = 3,
> >-	.type = sun8i_r40_phy,
> > 	.disc_thresh = 3,
> > 	.phyctl_offset = REG_PHYCTL_A33,
> > 	.dedicated_clocks = true,
> >@@ -945,7 +927,6 @@ static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
> > 
> > static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
> > 	.num_phys = 1,
> >-	.type = sun8i_v3s_phy,
> > 	.disc_thresh = 3,
> > 	.phyctl_offset = REG_PHYCTL_A33,
> > 	.dedicated_clocks = true,
> >@@ -955,16 +936,15 @@ static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
> > 
> > static const struct sun4i_usb_phy_cfg sun20i_d1_cfg = {
> > 	.num_phys = 2,
> >-	.type = sun50i_h6_phy,
> > 	.phyctl_offset = REG_PHYCTL_A33,
> > 	.dedicated_clocks = true,
> > 	.hci_phy_ctl_clear = PHY_CTL_SIDDQ,
> > 	.phy0_dual_route = true,
> >+	.siddq_in_base = true,
> > };
> > 
> > static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
> > 	.num_phys = 2,
> >-	.type = sun50i_a64_phy,
> > 	.disc_thresh = 3,
> > 	.phyctl_offset = REG_PHYCTL_A33,
> > 	.dedicated_clocks = true,
> >@@ -974,11 +954,11 @@ static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
> > 
> > static const struct sun4i_usb_phy_cfg sun50i_h6_cfg = {
> > 	.num_phys = 4,
> >-	.type = sun50i_h6_phy,
> > 	.phyctl_offset = REG_PHYCTL_A33,
> > 	.dedicated_clocks = true,
> > 	.phy0_dual_route = true,
> > 	.missing_phys = BIT(1) | BIT(2),
> >+	.siddq_in_base = true,
> > };
> > 
> > static const struct of_device_id sun4i_usb_phy_of_match[] = {

-- 
~Vinod
