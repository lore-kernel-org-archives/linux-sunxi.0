Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5738072
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Nov 2021 09:35:43 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id z8so41860573ljz.9
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Nov 2021 01:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5a/Std0CdLhhceL3Y6/V4PWA+iMZUZInfEMYaHuWA/8=;
        b=2EC4inBIQ6DU4E/YdDNE1Z/ONgexouKomSmmpfYVQkvSKtLOSjBBXheuodS4tu3fAx
         FSpaSKubDT3enRImiyulPEEEy5Fl7g89YmRW1ddxYXsPql23Q2zuB2l4g5OzQ3zugA6x
         EFciMItxNcYfGzeCIN4r/77WUlxttwax/UMqp7svzChKDvUfvLMGDP+Cw+MddO3KzMWQ
         fvbAOTcxz0akrpzjEcBLJLrU1/KYQDtlpLIxAq5xGOeeVKyM+xkG5X5kQ7UX36uMqug7
         tIfMxeaoXhr2byypT7qSTVVeDopEfsLAGJfQ0tyfAP3IuIW3rYmjxaV/UasprKnj3Vwa
         fL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5a/Std0CdLhhceL3Y6/V4PWA+iMZUZInfEMYaHuWA/8=;
        b=EeeDlx6PnsUCaHSEti6mxjDH+0AS8UpkgqXRNUNWYWoVY7X5UVfjNXPrHsKSKcdqRf
         xZYhhgI1DaU+H+P0MO9uJsst6jRGqAtGLn0RUEkmx/vrlUw8Gd8iYiURXli82uiuTxUX
         +JS7bRhVsUeFj6dU8EajgwB/avGJYLdTU2P4OT7IQwv49T9lmBcrJyHS5/YTB3kwCbRb
         FbdLN9QyJMoz3+LGm/YUMVIkEBWWXTcg6mkKBx/2ozi0P3JhwnIXpkT5wfDaNIA92V32
         ZvV7EXePMZJ25a3xX3vVqxyFEQ+xGx+xdHsjGuNXwATHBUhrFeZG5uinBRHHQu7UN1lD
         yanQ==
X-Gm-Message-State: AOAM531jqSvUs8/sUMN+aP7Qe+RXZr3hp7vRb7hjwZ9LYdmQeTNke/+N
	gNu5RkxS1ru3FAo51A+DJe1R9BztRtu3og==
X-Google-Smtp-Source: ABdhPJyIslw7cKCT8hE8JR8XKYFUQof01sWdaSDzd51ceZSUftuk7ZhBqkIFCCgWW3S3r0WrRKYCvw==
X-Received: by 2002:a05:651c:503:: with SMTP id o3mr5662800ljp.353.1637055341690;
        Tue, 16 Nov 2021 01:35:41 -0800 (PST)
Received: from boger-laptop.lan (81.5.99.121.dhcp.mipt-telecom.ru. [81.5.99.121])
        by smtp.gmail.com with ESMTPSA id m28sm1281080lfq.189.2021.11.16.01.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 01:35:41 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: linux-sunxi@lists.linux.dev
Cc: Evgeny Boger <boger@wirenboard.com>,
	linux-arm-kernel@lists.infradead.org,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Yangtao Li <frank@allwinnertech.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	andre.przywara@arm.com
Subject: [PATCH RESEND] phy: sun4i-usb: fix phy write on H3 and newer
Date: Tue, 16 Nov 2021 12:35:10 +0300
Message-Id: <20211116093509.346002-1-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On older SoCs (prior to H3) PHY register are accessed by manipulating
the common register for all PHYs. PHY index is specified by pulsing
usbc bit.

Newer SoCs leave the access procedure mostly unchanged, the
difference being that the latch registers are separate for each PHY.

Additionally, accessing USB PHY registers is only possible if phy0 is
routed to musb IP instead of HCI.

Introduce phy_reg_access_v2 cfg flag for H3 (H2+, H5),
R40 (V40, A40i, T3), V3s (V3, S3) and A64 SoCs.

On A83t, H6, H616, T507 and probably on more recent hardware,
these PHY registers are not used in vendor BSP.
So don't set v2 flag for these even newer SoCs as a precaution.

Signed-off-by: Evgeny Boger <boger@wirenboard.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 44 ++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 788dd5cdbb7d..cf10e385f199 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -119,6 +119,7 @@ struct sun4i_usb_phy_cfg {
 	bool dedicated_clocks;
 	bool enable_pmu_unk1;
 	bool phy0_dual_route;
+	bool phy_reg_access_v2;
 	int missing_phys;
 };
 
@@ -192,13 +193,38 @@ static void sun4i_usb_phy_write(struct sun4i_usb_phy *phy, u32 addr, u32 data,
 				int len)
 {
 	struct sun4i_usb_phy_data *phy_data = to_sun4i_usb_phy_data(phy);
-	u32 temp, usbc_bit = BIT(phy->index * 2);
+	u32 otgctl_val, temp, usbc_bit;
 	void __iomem *phyctl = phy_data->base + phy_data->cfg->phyctl_offset;
+	void __iomem *phyctl_latch;
 	unsigned long flags;
 	int i;
 
 	spin_lock_irqsave(&phy_data->reg_lock, flags);
 
+	/* On older SoCs (prior to H3) PHY register are accessed by manipulating the
+	 * common register for all PHYs. PHY index is specified by pulsing usbc bit.
+	 * Newer SoCs leave the access procedure mostly unchanged, the difference
+	 * being that the latch registers are separate for each PHY.
+	 */
+	if (phy_data->cfg->phy_reg_access_v2) {
+		if (phy->index == 0)
+			phyctl_latch = phy_data->base + phy_data->cfg->phyctl_offset;
+		else
+			phyctl_latch = phy->pmu + phy_data->cfg->phyctl_offset;
+		usbc_bit = 1;
+
+		/* Accessing USB PHY registers is only possible if phy0 is routed to musb.
+		 * As it's not clear whether is this related to actual PHY
+		 * routing or rather the hardware is just reusing the same bit,
+		 * don't check phy0_dual_route here.
+		 */
+		otgctl_val = readl(phy_data->base + REG_PHY_OTGCTL);
+		writel(otgctl_val | OTGCTL_ROUTE_MUSB, phy_data->base + REG_PHY_OTGCTL);
+	} else {
+		phyctl_latch = phyctl;
+		usbc_bit = BIT(phy->index * 2);
+	}
+
 	if (phy_data->cfg->phyctl_offset == REG_PHYCTL_A33) {
 		/* SoCs newer than A33 need us to set phyctl to 0 explicitly */
 		writel(0, phyctl);
@@ -224,17 +250,21 @@ static void sun4i_usb_phy_write(struct sun4i_usb_phy *phy, u32 addr, u32 data,
 		writeb(temp, phyctl);
 
 		/* pulse usbc_bit */
-		temp = readb(phyctl);
+		temp = readb(phyctl_latch);
 		temp |= usbc_bit;
-		writeb(temp, phyctl);
+		writeb(temp, phyctl_latch);
 
-		temp = readb(phyctl);
+		temp = readb(phyctl_latch);
 		temp &= ~usbc_bit;
-		writeb(temp, phyctl);
+		writeb(temp, phyctl_latch);
 
 		data >>= 1;
 	}
 
+	/* Restore PHY routing and the rest of OTGCTL */
+	if (phy_data->cfg->phy_reg_access_v2)
+		writel(otgctl_val, phy_data->base + REG_PHY_OTGCTL);
+
 	spin_unlock_irqrestore(&phy_data->reg_lock, flags);
 }
 
@@ -927,6 +957,7 @@ static const struct sun4i_usb_phy_cfg sun8i_h3_cfg = {
 	.dedicated_clocks = true,
 	.enable_pmu_unk1 = true,
 	.phy0_dual_route = true,
+	.phy_reg_access_v2 = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
@@ -937,6 +968,7 @@ static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
 	.dedicated_clocks = true,
 	.enable_pmu_unk1 = true,
 	.phy0_dual_route = true,
+	.phy_reg_access_v2 = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
@@ -947,6 +979,7 @@ static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
 	.dedicated_clocks = true,
 	.enable_pmu_unk1 = true,
 	.phy0_dual_route = true,
+	.phy_reg_access_v2 = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
@@ -957,6 +990,7 @@ static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
 	.dedicated_clocks = true,
 	.enable_pmu_unk1 = true,
 	.phy0_dual_route = true,
+	.phy_reg_access_v2 = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun50i_h6_cfg = {
-- 
2.25.1

