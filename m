Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00657168AF
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Jun 2023 23:33:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FDDC2F4;
	Sun, 11 Jun 2023 16:34:13 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CD883F663;
	Sun, 11 Jun 2023 16:33:25 -0700 (PDT)
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
Subject: [PATCH v2 1/7] phy: sun4i-usb: Fix of_xlate() argument check
Date: Mon, 12 Jun 2023 00:32:35 +0100
Message-Id: <20230611233241.14235-2-andre.przywara@arm.com>
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

In its of_xlate() function, the Allwinner USB PHY driver compares the
args_count variable against the number of implemented USB PHYs, although
this is the *number of arguments* to the DT phandle property. Per the DT
binding for this PHY device, this number is always one, so this check
will always fail if the particular SoC implements exactly one USB PHY.
So far this affected only the V3s (which has USB support disabled), but
the F1C100s also sports one PHY only.

Fix that check to compare args_count against exactly 1, and the args[0]
content (requested PHY number) against the number of implemented PHYs.

This fixes USB operation on the Allwinner V3s and allows to enable USB
on the Allwinner F1C100s SoC.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 6428163c188..dbea70f9a5e 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -372,7 +372,10 @@ static int sun4i_usb_phy_xlate(struct phy *phy,
 {
 	struct sun4i_usb_phy_data *data = dev_get_priv(phy->dev);
 
-	if (args->args_count >= data->cfg->num_phys)
+	if (args->args_count != 1)
+		return -EINVAL;
+
+	if (args->args[0] >= data->cfg->num_phys)
 		return -EINVAL;
 
 	if (data->cfg->missing_phys & BIT(args->args[0]))
-- 
2.35.8

