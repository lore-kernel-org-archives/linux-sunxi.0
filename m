Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA7A2CA3
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jan 2022 16:52:09 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id x7so58494549lfu.8
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jan 2022 08:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rrlL7bK8FZhyKt4mIdGvNP9RYrYKcyozulIsDBS9RXE=;
        b=KyJZrFvp3SaqM2Ug1MOfE2gKsuGfGifd7WrkbdbmxgPVsc9Ns5nNdo96fBs7Dho3mG
         Lef+bY1Pc2VgP9LQeLvAkoeprJEFrF6TJGxRocfadD9XuYT+sT9GBJcqWArdT3Nd4Zzx
         o9Qzv6Zq1Lz7Y1wyRb90OmEAtObTh6WBVX4gOZn+9ZUP8nsFZLXVq2XZBqH8CCkEc9wo
         ef5vcu0n0Sx14rvcDLN5bJdfoA0uqyjoAhExn4lr7PJxmgt9UDrxBAkp/A5wAygrSd4u
         fRkKX5Yj6c0hNpL4vd8Ol8I9R5ZDnqp7lUgznuP2FJMFAY0u9y9bUJdwAVkWUZWgYQ+o
         XeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rrlL7bK8FZhyKt4mIdGvNP9RYrYKcyozulIsDBS9RXE=;
        b=kMPc6dM4/M33A9X66gckrNL8Zvbau3eheJP7krzhx8mtwkGul37dJNQdYlZ4sm3nuB
         TS/jEJ5AlIY8MwIJanBCh5lTflw+rNHI0H5u7QXl9+gRoKnEwv9RUQO6vb1yZhPPrnTB
         xCjo3IIqMmNDemU8S6m5yxXCrqtvfvBvdgSNaJ9nOrvzv68zC76Cep2W182851dYXvmG
         VB2n+HMTp5z2r+LVFo9lpkyORBTaJn82Hfa5N0yjhT5qZ/Uxx1O8g7sW53HFJdm6pQ6J
         NogpI9PgAIKVOFZQwaRMb/PaGzvN3A7p+YTei0M6TUrEiAdmNKtqfBEt2z755SvQPv5n
         T48g==
X-Gm-Message-State: AOAM532Pqe7bcOOLwW75VpQIOkoYj/GdwMjCiktltVGygJdp/uAInYg2
	QgaOrQW1wiRNWyYSpfuA+fBp6dMJVXmJCw==
X-Google-Smtp-Source: ABdhPJwYH5IH5SC+OdbQpmLgtOnmWy9EKOPfUBoYmEqaV/rmX3j5HtPnBCwUEnXVWefuqrrZA6eWqA==
X-Received: by 2002:ac2:57c7:: with SMTP id k7mr4112756lfo.110.1641919927655;
        Tue, 11 Jan 2022 08:52:07 -0800 (PST)
Received: from boger-laptop.lan (81.5.110.253.dhcp.mipt-telecom.ru. [81.5.110.253])
        by smtp.gmail.com with ESMTPSA id c21sm1386388lfi.95.2022.01.11.08.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 08:52:07 -0800 (PST)
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
Subject: [PATCH v2 1/1] phy: sun4i-usb: fix phy write on H3 and newer
Date: Tue, 11 Jan 2022 19:51:53 +0300
Message-Id: <20220111165153.63632-2-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111165153.63632-1-boger@wirenboard.com>
References: <20220111165153.63632-1-boger@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We noticed that USB hosts won't reliably enumerate USB HS (480Mb/s) devices
in our custom A40i-based design. What we observe is that after several
attempts USB device would fail to enumerate on EHCI port (HS) and will be
enumerated instead on OHCI (FS, 12Mb/s) only:

[    6.368009] usb 1-1: new high-speed USB device number 5 using ehci-platform
[    6.818008] usb 1-1: device not accepting address 5, error -71
[    6.823868] usb usb1-port1: unable to enumerate USB device
[    7.308013] usb 3-1: new full-speed USB device number 2 using ohci-platform
[    7.575045] usb 3-1: not running at top speed; connect to a high speed hub

On some boards one of the ports would work in high-speed mode, but
on most of the boards all three USB ports would only work in FS mode.

At the same time, USB work flawlessly in high-speed mode in vendor kernel.

Looking for the differences in USB code, we found the issue with USB PHY
register initialization. Basically, USB PHY driver sets a couple of
internal undocumented PHY registers to the predefined constants. These PHY
registers are accessed in a very (and I mean VERY) weird way by shifting
register addresses and values bit-by-bit. This access method was slightly
changed starting from H3 SoC, according to the BSP source for different
SoCs.

As a result, mainline PHY driver won't set these PHY registers properly
resulting in unreliable enumeration in high-speed mode.

We don't know whether this issue will result in broken HS mode on all
affected SoCs or instead the A40i is an unfortunate exception. What we
indeed verified, is that BSPs for all affected SoCs write these registers
properly while mainline kernel don't. We also were able to reproduce the
USB issue on a couple of A40i boards from other vendors, so we are pretty
sure these registers have to always be properly set, regardlress of
a hardware layout.

The proposed patch is tested on A40i-based Wiren Board 7 building
automation controller. More details are below.

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

