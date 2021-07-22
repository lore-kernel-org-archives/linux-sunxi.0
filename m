Received: from smtpbg604.qq.com (smtpbg604.qq.com [59.36.128.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E38173
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 06:33:08 +0000 (UTC)
X-QQ-mid: bizesmtp46t1626935435tc6562pc
Received: from localhost.localdomain (unknown [14.154.30.9])
	by esmtp6.qq.com (ESMTP) with 
	id ; Thu, 22 Jul 2021 14:30:34 +0800 (CST)
X-QQ-SSF: 01100000002000104000B00A0000000
X-QQ-FEAT: L8+aRVORnLmRIizcMCMbkfXIXh0YuM9xXcqW/S3oShlUO77rXsyDF7xcJ5rb5
	fTS1pLaaZB5+NrhMuPaWgFkfYrtD3lJovYAKurEBqbjoDxoRs06kI1xcjah0yh8fM3M8eov
	p6eQCbhK9718UrhBESFfRnOnisMOViCMfLqS+5fwsNCuO0qxwQceh37p2nE+UmcUSyBHcEE
	a/Elc2j4jDY3R9B+Z8TKI0U6KvaXnylSENaE5nlppOjbOry+BEjhJFnXKa/v42yTWpV1nf6
	SSfEKXBo2i2KlNOIBEs5FPR6A50q66c23CxPUc14dgOmtE0GqRp2YCZlwbpaOmmVzUWh6Uy
	F1/BsHpYC+cu/N/f2w=
X-QQ-GoodBg: 0
From: Icenowy Zheng <icenowy@sipeed.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@sipeed.com>
Subject: [RFC PATCH 05/13] sunxi: add support for R329 clocks
Date: Thu, 22 Jul 2021 14:30:07 +0800
Message-Id: <20210722063015.421923-6-icenowy@sipeed.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722063015.421923-1-icenowy@sipeed.com>
References: <20210722063015.421923-1-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam4

R329 has a quite different clock tree than other SoCs. It has only 4
PLLs and its PLL-PERIPH has two post dividers, one for the normal
PLL-PERIPH-2x output and another for a special PLL-PERIPH-800M output.
In addition, its PLL configuration registers are in PRCM memory zone,
not the ordinary CPUX CCU one.

Add support for basical R329 clock initialization.

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 arch/arm/mach-sunxi/clock_sun50i_h6.c | 49 ++++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-sunxi/clock_sun50i_h6.c b/arch/arm/mach-sunxi/clock_sun50i_h6.c
index a947463e0a..28bc5fccd8 100644
--- a/arch/arm/mach-sunxi/clock_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/clock_sun50i_h6.c
@@ -9,6 +9,13 @@ void clock_init_safe(void)
 {
 	struct sunxi_ccm_reg *const ccm =
 		(struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
+#ifdef CONFIG_MACH_SUN50I_R329
+	struct sunxi_prcm_reg *const prcm =
+		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
+	struct sunxi_prcm_reg *const pllccm = prcm;
+#else
+	struct sunxi_ccm_reg *const pllccm = ccm;
+#endif
 
 	/* this seems to enable PLLs on H616 */
 	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616))
@@ -16,22 +23,26 @@ void clock_init_safe(void)
 
 	clock_set_pll1(408000000);
 
-	writel(CCM_PLL6_DEFAULT, &ccm->pll6_cfg);
-	while (!(readl(&ccm->pll6_cfg) & CCM_PLL6_LOCK))
+	writel(CCM_PLL6_DEFAULT, &pllccm->pll6_cfg);
+	while (!(readl(&pllccm->pll6_cfg) & CCM_PLL6_LOCK))
 		;
 
 	clrsetbits_le32(&ccm->cpu_axi_cfg, CCM_CPU_AXI_APB_MASK | CCM_CPU_AXI_AXI_MASK,
 			CCM_CPU_AXI_DEFAULT_FACTORS);
 
 	writel(CCM_PSI_AHB1_AHB2_DEFAULT, &ccm->psi_ahb1_ahb2_cfg);
+#ifdef CCM_AHB3_DEFAULT
 	writel(CCM_AHB3_DEFAULT, &ccm->ahb3_cfg);
+#endif
 	writel(CCM_APB1_DEFAULT, &ccm->apb1_cfg);
 
+#ifndef CONFIG_MACH_SUN50I_R329
 	/*
 	 * The mux and factor are set, but the clock will be enabled in
 	 * DRAM initialization code.
 	 */
 	writel(MBUS_CLK_SRC_PLL6X2 | MBUS_CLK_M(3), &ccm->mbus_cfg);
+#endif
 }
 #endif
 
@@ -60,8 +71,20 @@ void clock_set_pll1(unsigned int clk)
 {
 	struct sunxi_ccm_reg * const ccm =
 		(struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
+#ifdef CONFIG_MACH_SUN50I_R329
+	struct sunxi_prcm_reg *const prcm =
+		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
+	struct sunxi_prcm_reg *const pllccm = prcm;
+#else
+	struct sunxi_ccm_reg *const pllccm = ccm;
+#endif
 	u32 val;
 
+#ifdef CONFIG_MACH_SUN50I_R329
+	/* Fix undervoltage reset threshold */
+	clrsetbits_le32(0x070901f4, 0xfff, 0xc0);
+#endif
+
 	/* Do not support clocks < 288MHz as they need factor P */
 	if (clk < 288000000) clk = 288000000;
 
@@ -73,11 +96,11 @@ void clock_set_pll1(unsigned int clk)
 
 	/* clk = 24*n/p, p is ignored if clock is >288MHz */
 	writel(CCM_PLL1_CTRL_EN | CCM_PLL1_LOCK_EN | CCM_PLL1_CLOCK_TIME_2 |
-#ifdef CONFIG_MACH_SUN50I_H616
+#ifndef CONFIG_MACH_SUN50I_H6
 	       CCM_PLL1_OUT_EN |
 #endif
-	       CCM_PLL1_CTRL_N(clk / 24000000), &ccm->pll1_cfg);
-	while (!(readl(&ccm->pll1_cfg) & CCM_PLL1_LOCK)) {}
+	       CCM_PLL1_CTRL_N(clk / 24000000), &pllccm->pll1_cfg);
+	while (!(readl(&pllccm->pll1_cfg) & CCM_PLL1_LOCK)) {}
 
 	/* Switch CPU to PLL1 */
 	val = readl(&ccm->cpu_axi_cfg);
@@ -87,6 +110,7 @@ void clock_set_pll1(unsigned int clk)
 }
 #endif
 
+#ifndef CONFIG_MACH_SUN50I_R329
 unsigned int clock_get_pll6(void)
 {
 	struct sunxi_ccm_reg *const ccm =
@@ -102,6 +126,21 @@ unsigned int clock_get_pll6(void)
 	/* The register defines PLL6-2X or PLL6-4X, not plain PLL6 */
 	return 24000000 / m * n / div1 / div2;
 }
+#else
+unsigned int clock_get_pll6(void)
+{
+	struct sunxi_prcm_reg *const prcm =
+		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
+
+	uint32_t rval = readl(&prcm->pll6_cfg);
+	int m = ((rval & CCM_PLL6_CTRL_M_MASK) >> CCM_PLL6_CTRL_M_SHIFT) + 1;
+	int n = ((rval & CCM_PLL6_CTRL_N_MASK) >> CCM_PLL6_CTRL_N_SHIFT) + 1;
+	int div1 = ((rval & CCM_PLL6_CTRL_DIV1_MASK) >>
+			CCM_PLL6_CTRL_DIV1_SHIFT) + 1;
+	/* The register defines PLL6-2X, not plain PLL6 */
+	return 24000000 / m * n / div1 / 2;
+}
+#endif
 
 int clock_twi_onoff(int port, int state)
 {
-- 
2.30.2

