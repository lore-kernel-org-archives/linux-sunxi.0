Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A2D10EA
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Apr 2023 00:26:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 865741D14;
	Fri,  7 Apr 2023 17:27:35 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D25203F6C4;
	Fri,  7 Apr 2023 17:26:49 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Anatolij Gustschin <agust@denx.de>
Cc: Lukasz Majewski <lukma@denx.de>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Sean Anderson <seanga2@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 2/2] video: sunxi: dw-hdmi: Use DM for HVCC regulator
Date: Sat,  8 Apr 2023 01:26:39 +0100
Message-Id: <20230408002639.26241-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.7
In-Reply-To: <20230408002639.26241-1-andre.przywara@arm.com>
References: <20230408002639.26241-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Samuel Holland <samuel@sholland.org>

The HDMI PHY depends on the HVCC supply being enabled. So far we have
relied on it being enabled by an earlier firmware stage (SPL or TF-A).
Attempt to enable the regulator here, so we can remove that dependency.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/video/sunxi/sunxi_dw_hdmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/video/sunxi/sunxi_dw_hdmi.c b/drivers/video/sunxi/sunxi_dw_hdmi.c
index ef18d1f281f..0324a050d03 100644
--- a/drivers/video/sunxi/sunxi_dw_hdmi.c
+++ b/drivers/video/sunxi/sunxi_dw_hdmi.c
@@ -19,11 +19,13 @@
 #include <asm/arch/lcdc.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
+#include <power/regulator.h>
 
 struct sunxi_dw_hdmi_priv {
 	struct dw_hdmi hdmi;
 	struct reset_ctl_bulk resets;
 	struct clk_bulk clocks;
+	struct udevice *hvcc;
 };
 
 struct sunxi_hdmi_phy {
@@ -333,6 +335,9 @@ static int sunxi_dw_hdmi_probe(struct udevice *dev)
 		(struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
 	int ret;
 
+	if (priv->hvcc)
+		regulator_set_enable(priv->hvcc, true);
+
 	/* Set pll3 to 297 MHz */
 	clock_set_pll3(297000000);
 
@@ -384,6 +389,10 @@ static int sunxi_dw_hdmi_of_to_plat(struct udevice *dev)
 	if (ret)
 		return ret;
 
+	ret = device_get_supply_regulator(dev, "hvcc-supply", &priv->hvcc);
+	if (ret)
+		priv->hvcc = NULL;
+
 	return 0;
 }
 
-- 
2.35.7

