Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A2E10EE
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jan 2024 00:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A222BC15;
	Tue,  2 Jan 2024 16:14:28 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7A753F5A1;
	Tue,  2 Jan 2024 16:13:41 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: [PATCH 12/19] sunxi: sun50i_h6: make more clock functions SPL only
Date: Wed,  3 Jan 2024 00:12:32 +0000
Message-Id: <20240103001239.17482-13-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20240103001239.17482-1-andre.przywara@arm.com>
References: <20240103001239.17482-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In clock_sun50i_h6.c, responsible for (mostly early) clock setup on
newer generation Allwinner SoCs, many functions are only needed by the
SPL, and are thus already guarded by CONFIG_SPL_BUILD.

Over the years drivers like for the UART or I2C were converted to DM,
so they care about clock setup themselves now, by using a proper DM clock
driver.

This means those devices need the clock setup functions here for the SPL
only. Include those functions into the existing CONFIG_SPL_BUILD guards,
so they are compiled for the SPL only. By moving the clock_get_pll6()
function to the end of the file, all SPL-only clocks can be contained
within one #ifdef guard.

This avoids unnecessary code in U-Boot proper and helps further
refactoring. Add some comments on the way to help understanding of the
file.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/clock_sun50i_h6.c | 57 +++++++++++++--------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/arch/arm/mach-sunxi/clock_sun50i_h6.c b/arch/arm/mach-sunxi/clock_sun50i_h6.c
index dac3663e1be..cc2ee336416 100644
--- a/arch/arm/mach-sunxi/clock_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/clock_sun50i_h6.c
@@ -51,7 +51,6 @@ void clock_init_safe(void)
 	 */
 	writel(MBUS_CLK_SRC_PLL6X2 | MBUS_CLK_M(3), &ccm->mbus_cfg);
 }
-#endif
 
 void clock_init_uart(void)
 {
@@ -73,7 +72,6 @@ void clock_init_uart(void)
 		     1 << (RESET_SHIFT + CONFIG_CONS_INDEX - 1));
 }
 
-#ifdef CONFIG_SPL_BUILD
 void clock_set_pll1(unsigned int clk)
 {
 	struct sunxi_ccm_reg * const ccm =
@@ -105,33 +103,6 @@ void clock_set_pll1(unsigned int clk)
 	val |= CCM_CPU_AXI_MUX_PLL_CPUX;
 	writel(val, &ccm->cpu_axi_cfg);
 }
-#endif
-
-unsigned int clock_get_pll6(void)
-{
-	struct sunxi_ccm_reg *const ccm =
-		(struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
-	uint32_t rval = readl(&ccm->pll6_cfg);
-	int n = ((rval & CCM_PLL6_CTRL_N_MASK) >> CCM_PLL6_CTRL_N_SHIFT) + 1;
-	int div2 = ((rval & CCM_PLL6_CTRL_DIV2_MASK) >>
-		    CCM_PLL6_CTRL_DIV2_SHIFT) + 1;
-	int div1, m;
-
-	if (IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2)) {
-		div1 = ((rval & CCM_PLL6_CTRL_P0_MASK) >>
-			CCM_PLL6_CTRL_P0_SHIFT) + 1;
-		m = 1;
-	} else {
-		div1 = ((rval & CCM_PLL6_CTRL_DIV1_MASK) >>
-			CCM_PLL6_CTRL_DIV1_SHIFT) + 1;
-		if (IS_ENABLED(CONFIG_MACH_SUN50I_H6))
-			m = 4;
-		else
-			m = 2;
-	}
-
-	return 24000000U * n / m / div1 / div2;
-}
 
 int clock_twi_onoff(int port, int state)
 {
@@ -160,3 +131,31 @@ int clock_twi_onoff(int port, int state)
 
 	return 0;
 }
+#endif /* CONFIG_SPL_BUILD */
+
+/* PLL_PERIPH0 clock, used by the MMC driver */
+unsigned int clock_get_pll6(void)
+{
+	struct sunxi_ccm_reg *const ccm =
+		(struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
+	uint32_t rval = readl(&ccm->pll6_cfg);
+	int n = ((rval & CCM_PLL6_CTRL_N_MASK) >> CCM_PLL6_CTRL_N_SHIFT) + 1;
+	int div2 = ((rval & CCM_PLL6_CTRL_DIV2_MASK) >>
+		    CCM_PLL6_CTRL_DIV2_SHIFT) + 1;
+	int div1, m;
+
+	if (IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2)) {
+		div1 = ((rval & CCM_PLL6_CTRL_P0_MASK) >>
+			CCM_PLL6_CTRL_P0_SHIFT) + 1;
+		m = 1;
+	} else {
+		div1 = ((rval & CCM_PLL6_CTRL_DIV1_MASK) >>
+			CCM_PLL6_CTRL_DIV1_SHIFT) + 1;
+		if (IS_ENABLED(CONFIG_MACH_SUN50I_H6))
+			m = 4;
+		else
+			m = 2;
+	}
+
+	return 24000000U * n / m / div1 / div2;
+}
-- 
2.35.8

