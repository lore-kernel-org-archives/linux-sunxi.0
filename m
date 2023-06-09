Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D180B10950
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Jun 2023 10:56:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26F181042;
	Fri,  9 Jun 2023 03:57:15 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A82C73F587;
	Fri,  9 Jun 2023 03:56:28 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Marek Vasut <marex@denx.de>,
	Sam Edwards <cfsworks@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/3] phy: sun4i-usb: Fix of_xlate() argument check
Date: Fri,  9 Jun 2023 11:56:19 +0100
Message-Id: <20230609105621.1410483-2-andre.przywara@arm.com>
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
2.25.1

