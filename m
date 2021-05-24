Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6782B17F
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 23:30:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20F256D;
	Mon, 24 May 2021 16:30:56 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9E6D3F73D;
	Mon, 24 May 2021 16:30:54 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: u-boot@lists.denx.de,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ondrej Jirman <megous@megous.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 4/8] mmc: sunxi: Cleanup "new timing mode" selection
Date: Tue, 25 May 2021 00:30:25 +0100
Message-Id: <20210524233029.16417-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210524233029.16417-1-andre.przywara@arm.com>
References: <20210524233029.16417-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Among the SoCs using the "new timing mode", only the A83T needs to
explicitly switch to that mode.

By just defining the symbol for that one odd A83T bit to 0 for any other
SoCs, we can always OR that in, and save the confusing nested #ifdefs.

Clean up the also confusing new_mode setting on the way.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/mmc/sunxi_mmc.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
index bc68debdad6..33cedb4edba 100644
--- a/drivers/mmc/sunxi_mmc.c
+++ b/drivers/mmc/sunxi_mmc.c
@@ -23,6 +23,10 @@
 #include <asm-generic/gpio.h>
 #include <linux/delay.h>
 
+#ifndef CCM_MMC_CTRL_MODE_SEL_NEW
+#define CCM_MMC_CTRL_MODE_SEL_NEW	0
+#endif
+
 struct sunxi_mmc_plat {
 	struct mmc_config cfg;
 	struct mmc mmc;
@@ -102,13 +106,10 @@ static int mmc_resource_init(int sdc_no)
 static int mmc_set_mod_clk(struct sunxi_mmc_priv *priv, unsigned int hz)
 {
 	unsigned int pll, pll_hz, div, n, oclk_dly, sclk_dly;
-	bool new_mode = true;
+	bool new_mode = IS_ENABLED(CONFIG_MMC_SUNXI_HAS_NEW_MODE);
 	bool calibrate = false;
 	u32 val = 0;
 
-	if (!IS_ENABLED(CONFIG_MMC_SUNXI_HAS_NEW_MODE))
-		new_mode = false;
-
 	/* A83T support new mode only on eMMC */
 	if (IS_ENABLED(CONFIG_MACH_SUN8I_A83T) && priv->mmc_no != 2)
 		new_mode = false;
@@ -176,12 +177,8 @@ static int mmc_set_mod_clk(struct sunxi_mmc_priv *priv, unsigned int hz)
 	}
 
 	if (new_mode) {
-#ifdef CONFIG_MMC_SUNXI_HAS_NEW_MODE
-#ifdef CONFIG_MMC_SUNXI_HAS_MODE_SWITCH
-		val = CCM_MMC_CTRL_MODE_SEL_NEW;
-#endif
+		val |= CCM_MMC_CTRL_MODE_SEL_NEW;
 		setbits_le32(&priv->reg->ntsr, SUNXI_MMC_NTSR_MODE_SEL_NEW);
-#endif
 	} else if (!calibrate) {
 		/*
 		 * Use hardcoded delay values if controller doesn't support
-- 
2.17.5

