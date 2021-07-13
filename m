Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA41F168
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Jul 2021 12:07:47 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id b26so17491933lfo.4
        for <linux-sunxi@lists.linux.dev>; Tue, 13 Jul 2021 05:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8352iHkl0Yrxdg9vY81krfsoSyfvHtWK/xGBQ/Fg6Q8=;
        b=qh0h/pJdYWlhAY3uOh/VUFIMKN4Ha2pek58KztkxO45Ikn7ld2dkrCLhWH64E0qm7q
         BAvnhEpEEzX1CGNn62TbA0x2AoUDTGuvmftjkMdZbkzehAaL1HbbD7SUoi2Qf6mMQRvV
         Iww1W4Qwju/RsGLSnNQ67uHjloS/BpsONl/LZiERK6tcSQBZzWmwfbalQIPltZ6XseP0
         HnLal+nX8GzIeBCOH8T6Znz5w5AxcyJnkxjaq018WgVZHgz1Tdqax238StCnY5ux70Bl
         DM0SopDHBnEqBkwfOEOBk3y41P7Ipipb7NmjFJP158hngNdnAk5JOo0ivVhKgehyTfLZ
         ATxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8352iHkl0Yrxdg9vY81krfsoSyfvHtWK/xGBQ/Fg6Q8=;
        b=Sgis4j2s6WHX+sDzljYlLDVt9+ypjeasnc0z/ZW/m9IKiUA2Oq2syWaP4a4YBSx/4k
         sY64HOQhEDUFuvbT2vv5SucqAjRW4GwpUL/BfwhIPHJWXR0GmJ6OPe2qr0SxZm9sPUf8
         W4k//sTh2mXoQ6yS30u+QZm0kwg7uAecUq75fnynzCzboKLz8bKDfE+NQBO/Xl1lxwwJ
         kKthGXZUqUkVcQGWfznJJpTHrcQGZceRlstJxrhBZjd9A0OVemGjo4t8cS1Fj3apfQY7
         TkMzZucRoQqrjCUPu/hmsCv6AmbaWAhu44W+dm+B1NPcbpSYW9QYVFvL2Nwkpy+KEZE+
         /0vQ==
X-Gm-Message-State: AOAM531jn3Jx7r7QzOcZdpROIxhzrIDw/WdUA7QLBGNMfPdghyAbxFu5
	Tk8v7tlONjLOa4WlvWaYIt/x49vwEW4ZcA==
X-Google-Smtp-Source: ABdhPJxwtocUq7RGDqGJzaJJ9eTsy9xroN8Ns70O4LslsogHjoA6GJKZ9+33hadJaKwMiORcg8izOA==
X-Received: by 2002:a05:6512:23a6:: with SMTP id c38mr3288367lfv.78.1626178065537;
        Tue, 13 Jul 2021 05:07:45 -0700 (PDT)
Received: from boger-laptop.lan (81.5.110.226.dhcp.mipt-telecom.ru. [81.5.110.226])
        by smtp.gmail.com with ESMTPSA id v13sm1902355lji.30.2021.07.13.05.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 05:07:45 -0700 (PDT)
From: Evgeny Boger <boger@wirenboard.com>
To: linux-sunxi@lists.linux.dev
Cc: Evgeny Boger <boger@wirenboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <mripard@kernel.org>,
	qianfan Zhao <qianfanguijin@163.com>,
	andre.przywara@arm.com
Subject: [PATCH] phy: sun4i-usb: fix phy write on H3 and newer
Date: Tue, 13 Jul 2021 15:07:11 +0300
Message-Id: <20210713120711.995629-1-boger@wirenboard.com>
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
index 651d5e2a25ce..f7c974914619 100644
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
 
@@ -931,6 +961,7 @@ static const struct sun4i_usb_phy_cfg sun8i_h3_cfg = {
 	.dedicated_clocks = true,
 	.enable_pmu_unk1 = true,
 	.phy0_dual_route = true,
+	.phy_reg_access_v2 = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
@@ -941,6 +972,7 @@ static const struct sun4i_usb_phy_cfg sun8i_r40_cfg = {
 	.dedicated_clocks = true,
 	.enable_pmu_unk1 = true,
 	.phy0_dual_route = true,
+	.phy_reg_access_v2 = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
@@ -951,6 +983,7 @@ static const struct sun4i_usb_phy_cfg sun8i_v3s_cfg = {
 	.dedicated_clocks = true,
 	.enable_pmu_unk1 = true,
 	.phy0_dual_route = true,
+	.phy_reg_access_v2 = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
@@ -961,6 +994,7 @@ static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
 	.dedicated_clocks = true,
 	.enable_pmu_unk1 = true,
 	.phy0_dual_route = true,
+	.phy_reg_access_v2 = true,
 };
 
 static const struct sun4i_usb_phy_cfg sun50i_h6_cfg = {
-- 
2.25.1

