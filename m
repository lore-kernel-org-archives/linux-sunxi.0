Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1D62FB0
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 23:30:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFB24101E;
	Mon, 24 May 2021 16:30:51 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73EAE3F73D;
	Mon, 24 May 2021 16:30:50 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: u-boot@lists.denx.de,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ondrej Jirman <megous@megous.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/8] mmc: sunxi: Avoid #ifdefs in delay and width setup
Date: Tue, 25 May 2021 00:30:22 +0100
Message-Id: <20210524233029.16417-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210524233029.16417-1-andre.przywara@arm.com>
References: <20210524233029.16417-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

The delay and bus-width setup are slightly different across the
Allwinner SoC generations, and we covered this so far with some
preprocessor conditionals.

Use the more readable IS_ENABLE() instead.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/mmc/sunxi_mmc.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
index 3503ccdb2ee..87b79fcf5ef 100644
--- a/drivers/mmc/sunxi_mmc.c
+++ b/drivers/mmc/sunxi_mmc.c
@@ -156,23 +156,19 @@ static int mmc_set_mod_clk(struct sunxi_mmc_priv *priv, unsigned int hz)
 	} else if (hz <= 25000000) {
 		oclk_dly = 0;
 		sclk_dly = 5;
-#ifdef CONFIG_MACH_SUN9I
-	} else if (hz <= 52000000) {
-		oclk_dly = 5;
-		sclk_dly = 4;
-	} else {
-		/* hz > 52000000 */
-		oclk_dly = 2;
-		sclk_dly = 4;
-#else
-	} else if (hz <= 52000000) {
-		oclk_dly = 3;
-		sclk_dly = 4;
 	} else {
-		/* hz > 52000000 */
-		oclk_dly = 1;
+		if (IS_ENABLED(CONFIG_MACH_SUN9I)) {
+			if (hz <= 52000000)
+				oclk_dly = 5;
+			else
+				oclk_dly = 2;
+		} else {
+			if (hz <= 52000000)
+				oclk_dly = 3;
+			else
+				oclk_dly = 1;
+		}
 		sclk_dly = 4;
-#endif
 	}
 
 	if (new_mode) {
@@ -521,10 +517,11 @@ struct mmc *sunxi_mmc_init(int sdc_no)
 
 	cfg->voltages = MMC_VDD_32_33 | MMC_VDD_33_34;
 	cfg->host_caps = MMC_MODE_4BIT;
-#if defined(CONFIG_MACH_SUN50I) || defined(CONFIG_MACH_SUN8I) || defined(CONFIG_SUN50I_GEN_H6)
-	if (sdc_no == 2)
+
+	if ((IS_ENABLED(CONFIG_MACH_SUN50I) || IS_ENABLED(CONFIG_MACH_SUN8I) ||
+	    IS_ENABLED(CONFIG_SUN50I_GEN_H6)) && (sdc_no == 2))
 		cfg->host_caps = MMC_MODE_8BIT;
-#endif
+
 	cfg->host_caps |= MMC_MODE_HS_52MHz | MMC_MODE_HS;
 	cfg->b_max = CONFIG_SYS_MMC_MAX_BLK_COUNT;
 
-- 
2.17.5

