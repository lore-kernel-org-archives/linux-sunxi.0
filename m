Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F10D35947
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729778; cv=none; b=szmUSPNtV2gh0CsJ08dkuk8lANiY/VMvRrVFmFn/HFBuiM+VYi5pHqrfmj5YfqnFKoZ32SHBspAxmV5pvrHrCy0+v+ft81HVhRLVj9Mz/4UWcu0R03J69PF3zqV+oM0baqHKiqECnnYG0tpvBblLF+nn8oRFzl7K+dox+3ri+Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729778; c=relaxed/simple;
	bh=JumKY4uqt3+w1D+UCliKspe8/4c/TvNCxQ7H3vWGgRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B+NlDn5efhpa7eQvGpoFp3aQbOYrxRaUopMlzwCN1OHU/mTmSfURYeBjZ2sexjdutR5EXyt8p3ZbfiAWycO7Iz37UNoe3wh80oercHfScnbgihY1Oqwjoh3ONxBM0BzFNZEh0kppXMQY7DszZHwfBQX/F5THR21e8O8kpPPULVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 089701595;
	Sun, 23 Mar 2025 04:36:20 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1867D3F694;
	Sun, 23 Mar 2025 04:36:11 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCH 02/34] sunxi: mmc: remove usage of struct sunxi_ccm_reg
Date: Sun, 23 Mar 2025 11:35:12 +0000
Message-ID: <20250323113544.7933-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250323113544.7933-1-andre.przywara@arm.com>
References: <20250323113544.7933-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner MMC code uses a complex C struct, modelling the clock
device's register frame. We rely on sharing the member names across all
Allwinner SoCs, which is fragile.

Drop the usage of the struct in the MMC code, by using #define'd
register names and their offset, and then adding those names to the base
pointer. This requires to define those offsets for all SoCs, but since we
only use between four and six clock registers in the MMC code, this is
easily done.

This removes one common user of the clock register struct.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/include/asm/arch-sunxi/clock_sun4i.h |  6 ++++++
 .../include/asm/arch-sunxi/clock_sun50i_h6.h  |  4 ++++
 arch/arm/include/asm/arch-sunxi/clock_sun6i.h |  7 +++++++
 .../include/asm/arch-sunxi/clock_sun8i_a83t.h |  7 +++++++
 arch/arm/include/asm/arch-sunxi/clock_sun9i.h |  7 +++++++
 drivers/mmc/sunxi_mmc.c                       | 20 +++++++++----------
 6 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun4i.h b/arch/arm/include/asm/arch-sunxi/clock_sun4i.h
index 2cec91cb20e..00bdd5f938d 100644
--- a/arch/arm/include/asm/arch-sunxi/clock_sun4i.h
+++ b/arch/arm/include/asm/arch-sunxi/clock_sun4i.h
@@ -10,6 +10,12 @@
 #ifndef _SUNXI_CLOCK_SUN4I_H
 #define _SUNXI_CLOCK_SUN4I_H
 
+#define CCU_AHB_GATE0		0x60
+#define CCU_MMC0_CLK_CFG	0x88
+#define CCU_MMC1_CLK_CFG	0x8c
+#define CCU_MMC2_CLK_CFG	0x90
+#define CCU_MMC3_CLK_CFG	0x94
+
 struct sunxi_ccm_reg {
 	u32 pll1_cfg;		/* 0x00 pll1 control */
 	u32 pll1_tun;		/* 0x04 pll1 tuning */
diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
index a485e00f1f3..655f562c2af 100644
--- a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
+++ b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
@@ -22,6 +22,10 @@
 #define CCU_H6_APB1_CFG			0x520
 #define CCU_H6_APB2_CFG			0x524
 #define CCU_H6_MBUS_CFG			0x540
+#define CCU_MMC0_CLK_CFG		0x830
+#define CCU_MMC1_CLK_CFG		0x834
+#define CCU_MMC2_CLK_CFG		0x838
+#define CCU_H6_MMC_GATE_RESET		0x84c
 #define CCU_H6_UART_GATE_RESET		0x90c
 #define CCU_H6_I2C_GATE_RESET		0x91c
 
diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun6i.h b/arch/arm/include/asm/arch-sunxi/clock_sun6i.h
index 7fcf340db69..28c3faccbbc 100644
--- a/arch/arm/include/asm/arch-sunxi/clock_sun6i.h
+++ b/arch/arm/include/asm/arch-sunxi/clock_sun6i.h
@@ -10,6 +10,13 @@
 #ifndef _SUNXI_CLOCK_SUN6I_H
 #define _SUNXI_CLOCK_SUN6I_H
 
+#define CCU_AHB_GATE0		0x060
+#define CCU_MMC0_CLK_CFG	0x088
+#define CCU_MMC1_CLK_CFG	0x08c
+#define CCU_MMC2_CLK_CFG	0x090
+#define CCU_MMC3_CLK_CFG	0x094
+#define CCU_AHB_RESET0_CFG	0x2c0
+
 struct sunxi_ccm_reg {
 	u32 pll1_cfg;		/* 0x00 pll1 control */
 	u32 reserved0;
diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun8i_a83t.h b/arch/arm/include/asm/arch-sunxi/clock_sun8i_a83t.h
index 35ca0491ac9..5ad2163926a 100644
--- a/arch/arm/include/asm/arch-sunxi/clock_sun8i_a83t.h
+++ b/arch/arm/include/asm/arch-sunxi/clock_sun8i_a83t.h
@@ -13,6 +13,13 @@
 #ifndef _SUNXI_CLOCK_SUN8I_A83T_H
 #define _SUNXI_CLOCK_SUN8I_A83T_H
 
+#define CCU_AHB_GATE0		0x060
+#define CCU_MMC0_CLK_CFG	0x088
+#define CCU_MMC1_CLK_CFG	0x08c
+#define CCU_MMC2_CLK_CFG	0x090
+#define CCU_MMC3_CLK_CFG	0x094
+#define CCU_AHB_RESET0_CFG	0x2c0
+
 struct sunxi_ccm_reg {
 	u32 pll1_c0_cfg;	/* 0x00 c1cpu# pll control */
 	u32 pll1_c1_cfg;	/* 0x04 c1cpu# pll control */
diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun9i.h b/arch/arm/include/asm/arch-sunxi/clock_sun9i.h
index 006f7761fc6..8d696e533f8 100644
--- a/arch/arm/include/asm/arch-sunxi/clock_sun9i.h
+++ b/arch/arm/include/asm/arch-sunxi/clock_sun9i.h
@@ -12,6 +12,13 @@
 #include <linux/bitops.h>
 #endif
 
+#define CCU_MMC0_CLK_CFG	0x410
+#define CCU_MMC1_CLK_CFG	0x414
+#define CCU_MMC2_CLK_CFG	0x418
+#define CCU_MMC3_CLK_CFG	0x41c
+#define CCU_AHB_GATE0		0x580
+#define CCU_AHB_RESET0_CFG	0x5a0
+
 struct sunxi_ccm_reg {
 	u32 pll1_c0_cfg;	/* 0x00 c0cpu# pll configuration */
 	u32 pll2_c1_cfg;	/* 0x04 c1cpu# pll configuration */
diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
index 0b56d1405be..432be66c632 100644
--- a/drivers/mmc/sunxi_mmc.c
+++ b/drivers/mmc/sunxi_mmc.c
@@ -451,29 +451,29 @@ struct sunxi_mmc_priv mmc_host[4];
 static int mmc_resource_init(int sdc_no)
 {
 	struct sunxi_mmc_priv *priv = &mmc_host[sdc_no];
-	struct sunxi_ccm_reg *ccm = (struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
+	void *ccm = (void *)SUNXI_CCM_BASE;
 
 	debug("init mmc %d resource\n", sdc_no);
 
 	switch (sdc_no) {
 	case 0:
 		priv->reg = (struct sunxi_mmc *)SUNXI_MMC0_BASE;
-		priv->mclkreg = &ccm->sd0_clk_cfg;
+		priv->mclkreg = ccm + CCU_MMC0_CLK_CFG;
 		break;
 	case 1:
 		priv->reg = (struct sunxi_mmc *)SUNXI_MMC1_BASE;
-		priv->mclkreg = &ccm->sd1_clk_cfg;
+		priv->mclkreg = ccm + CCU_MMC1_CLK_CFG;
 		break;
 #ifdef SUNXI_MMC2_BASE
 	case 2:
 		priv->reg = (struct sunxi_mmc *)SUNXI_MMC2_BASE;
-		priv->mclkreg = &ccm->sd2_clk_cfg;
+		priv->mclkreg = ccm + CCU_MMC2_CLK_CFG;
 		break;
 #endif
 #ifdef SUNXI_MMC3_BASE
 	case 3:
 		priv->reg = (struct sunxi_mmc *)SUNXI_MMC3_BASE;
-		priv->mclkreg = &ccm->sd3_clk_cfg;
+		priv->mclkreg = ccm + CCU_MMC3_CLK_CFG;
 		break;
 #endif
 	default:
@@ -520,7 +520,7 @@ static const struct mmc_ops sunxi_mmc_ops = {
 
 struct mmc *sunxi_mmc_init(int sdc_no)
 {
-	struct sunxi_ccm_reg *ccm = (struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
+	void *ccm = (void *)SUNXI_CCM_BASE;
 	struct sunxi_mmc_priv *priv = &mmc_host[sdc_no];
 	struct mmc_config *cfg = &priv->cfg;
 	int ret;
@@ -549,11 +549,11 @@ struct mmc *sunxi_mmc_init(int sdc_no)
 	/* config ahb clock */
 	debug("init mmc %d clock and io\n", sdc_no);
 #if !defined(CONFIG_SUN50I_GEN_H6) && !defined(CONFIG_SUNXI_GEN_NCAT2)
-	setbits_le32(&ccm->ahb_gate0, 1 << AHB_GATE_OFFSET_MMC(sdc_no));
+	setbits_le32(ccm + CCU_AHB_GATE0, 1 << AHB_GATE_OFFSET_MMC(sdc_no));
 
 #ifdef CONFIG_SUNXI_GEN_SUN6I
 	/* unassert reset */
-	setbits_le32(&ccm->ahb_reset0_cfg, 1 << AHB_RESET_OFFSET_MMC(sdc_no));
+	setbits_le32(ccm + CCU_AHB_RESET0_CFG, 1 << AHB_RESET_OFFSET_MMC(sdc_no));
 #endif
 #if defined(CONFIG_MACH_SUN9I)
 	/* sun9i has a mmc-common module, also set the gate and reset there */
@@ -561,9 +561,9 @@ struct mmc *sunxi_mmc_init(int sdc_no)
 	       SUNXI_MMC_COMMON_BASE + 4 * sdc_no);
 #endif
 #else /* CONFIG_SUN50I_GEN_H6 */
-	setbits_le32(&ccm->sd_gate_reset, 1 << sdc_no);
+	setbits_le32(ccm + CCU_H6_MMC_GATE_RESET, 1 << sdc_no);
 	/* unassert reset */
-	setbits_le32(&ccm->sd_gate_reset, 1 << (RESET_SHIFT + sdc_no));
+	setbits_le32(ccm + CCU_H6_MMC_GATE_RESET, 1 << (RESET_SHIFT + sdc_no));
 #endif
 	ret = mmc_set_mod_clk(priv, 24000000);
 	if (ret)
-- 
2.46.3

