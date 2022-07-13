Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86FD46B2
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Jul 2022 16:21:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A7DF1C01;
	Wed, 13 Jul 2022 09:21:55 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DF0C3F792;
	Wed, 13 Jul 2022 09:21:54 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/3] sunxi: mmc: ignore card detect in SPL
Date: Wed, 13 Jul 2022 17:21:43 +0100
Message-Id: <20220713162145.95744-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713162145.95744-1-andre.przywara@arm.com>
References: <20220713162145.95744-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sunxi MMC code does not use the DM in the SPL, as we don't have a
device tree available that early, also no space for it.
This also means we cannot access the card-detect GPIO information from
there, so we have Kconfig symbols called CONFIG_MMCx_CD_PIN, which each
board has to define. This is a burden, also requires extra GPIO code in
the SPL.
As the SPL is the natural successor of the BootROM (from which we are
loaded), we can actually ignore the CD pin completely, as this is what
the BootROM does as well: CD GPIOs are board specific, but the BootROM
is not, so accesses the MMC devices anyway.

Remove the card detect code from the non-DM implementation of the sunxi
MMC driver, to get rid of this unneeded code.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/mmc/sunxi_mmc.c | 37 ++-----------------------------------
 1 file changed, 2 insertions(+), 35 deletions(-)

diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
index 1bb7b6d0e9..b2f7e2d142 100644
--- a/drivers/mmc/sunxi_mmc.c
+++ b/drivers/mmc/sunxi_mmc.c
@@ -44,22 +44,10 @@ struct sunxi_mmc_priv {
 /* support 4 mmc hosts */
 struct sunxi_mmc_priv mmc_host[4];
 
-static int sunxi_mmc_getcd_gpio(int sdc_no)
-{
-	switch (sdc_no) {
-	case 0: return sunxi_name_to_gpio(CONFIG_MMC0_CD_PIN);
-	case 1: return sunxi_name_to_gpio(CONFIG_MMC1_CD_PIN);
-	case 2: return sunxi_name_to_gpio(CONFIG_MMC2_CD_PIN);
-	case 3: return sunxi_name_to_gpio(CONFIG_MMC3_CD_PIN);
-	}
-	return -EINVAL;
-}
-
 static int mmc_resource_init(int sdc_no)
 {
 	struct sunxi_mmc_priv *priv = &mmc_host[sdc_no];
 	struct sunxi_ccm_reg *ccm = (struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
-	int cd_pin, ret = 0;
 
 	debug("init mmc %d resource\n", sdc_no);
 
@@ -90,16 +78,7 @@ static int mmc_resource_init(int sdc_no)
 	}
 	priv->mmc_no = sdc_no;
 
-	cd_pin = sunxi_mmc_getcd_gpio(sdc_no);
-	if (cd_pin >= 0) {
-		ret = gpio_request(cd_pin, "mmc_cd");
-		if (!ret) {
-			sunxi_gpio_set_pull(cd_pin, SUNXI_GPIO_PULL_UP);
-			ret = gpio_direction_input(cd_pin);
-		}
-	}
-
-	return ret;
+	return 0;
 }
 #endif
 
@@ -523,23 +502,11 @@ static int sunxi_mmc_send_cmd_legacy(struct mmc *mmc, struct mmc_cmd *cmd,
 	return sunxi_mmc_send_cmd_common(priv, mmc, cmd, data);
 }
 
-static int sunxi_mmc_getcd_legacy(struct mmc *mmc)
-{
-	struct sunxi_mmc_priv *priv = mmc->priv;
-	int cd_pin;
-
-	cd_pin = sunxi_mmc_getcd_gpio(priv->mmc_no);
-	if (cd_pin < 0)
-		return 1;
-
-	return !gpio_get_value(cd_pin);
-}
-
+/* .get_cd is not needed by the SPL */
 static const struct mmc_ops sunxi_mmc_ops = {
 	.send_cmd	= sunxi_mmc_send_cmd_legacy,
 	.set_ios	= sunxi_mmc_set_ios_legacy,
 	.init		= sunxi_mmc_core_init,
-	.getcd		= sunxi_mmc_getcd_legacy,
 };
 
 struct mmc *sunxi_mmc_init(int sdc_no)
-- 
2.25.1

