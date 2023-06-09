Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D931410958
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Jun 2023 10:56:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7314B11FB;
	Fri,  9 Jun 2023 03:57:16 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0007B3F587;
	Fri,  9 Jun 2023 03:56:29 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Marek Vasut <marex@denx.de>,
	Sam Edwards <cfsworks@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/3] phy: sun4i-usb: add Allwinner F1C100s support
Date: Fri,  9 Jun 2023 11:56:20 +0100
Message-Id: <20230609105621.1410483-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230609105621.1410483-1-andre.przywara@arm.com>
References: <20230609105621.1410483-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner F1C100s implements a single USB PHY, connected to its MUSB
OTG controller. The USB PHY is of the simpler, older type (like the A10),
the only real difference is that it's indeed only one PHY.

Add a struct describing those F1C100s USB PHY properties, and connect it
to the new compatible string.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index dbea70f9a5e..2bf47fc36a7 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -648,6 +648,14 @@ static const struct sun4i_usb_phy_cfg sun50i_h6_cfg = {
 	.missing_phys = BIT(1) | BIT(2),
 };
 
+static const struct sun4i_usb_phy_cfg suniv_f1c100s_cfg = {
+	.num_phys = 1,
+	.type = sun4i_a10_phy,
+	.disc_thresh = 3,
+	.phyctl_offset = REG_PHYCTL_A10,
+	.dedicated_clocks = true,
+};
+
 static const struct udevice_id sun4i_usb_phy_ids[] = {
 	{ .compatible = "allwinner,sun4i-a10-usb-phy", .data = (ulong)&sun4i_a10_cfg },
 	{ .compatible = "allwinner,sun5i-a13-usb-phy", .data = (ulong)&sun5i_a13_cfg },
@@ -662,6 +670,7 @@ static const struct udevice_id sun4i_usb_phy_ids[] = {
 	{ .compatible = "allwinner,sun20i-d1-usb-phy", .data = (ulong)&sun20i_d1_cfg },
 	{ .compatible = "allwinner,sun50i-a64-usb-phy", .data = (ulong)&sun50i_a64_cfg},
 	{ .compatible = "allwinner,sun50i-h6-usb-phy", .data = (ulong)&sun50i_h6_cfg},
+	{ .compatible = "allwinner,suniv-f1c100s-usb-phy", .data = (ulong)&suniv_f1c100s_cfg },
 	{ }
 };
 
-- 
2.25.1

