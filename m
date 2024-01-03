Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9EE7E
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jan 2024 00:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADC931516;
	Tue,  2 Jan 2024 16:14:29 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C31683F5A1;
	Tue,  2 Jan 2024 16:13:42 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: [PATCH 13/19] sunxi: sun8i_a83t: make more clock functions SPL only
Date: Wed,  3 Jan 2024 00:12:33 +0000
Message-Id: <20240103001239.17482-14-andre.przywara@arm.com>
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

In clock_sun8i_a83t.c, responsible for (mostly early) clock setup on the
Allwinner A83T SoC, many functions are only needed by the SPL, and are
thus already guarded by CONFIG_SPL_BUILD.

Over the years drivers like for the UART or I2C were converted to DM,
so they care about clock setup themselves now, by using a proper DM clock
driver.

This means those devices need the clock setup functions here for the SPL
only. Include those functions into the existing CONFIG_SPL_BUILD guards,
so they are compiled for the SPL only.

This avoids unnecessary code in U-Boot proper and helps further
refactoring. Add some comments on the way to help understanding of the
file.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/clock_sun8i_a83t.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-sunxi/clock_sun8i_a83t.c b/arch/arm/mach-sunxi/clock_sun8i_a83t.c
index 198fe9dbd73..9eeba084f95 100644
--- a/arch/arm/mach-sunxi/clock_sun8i_a83t.c
+++ b/arch/arm/mach-sunxi/clock_sun8i_a83t.c
@@ -46,7 +46,6 @@ void clock_init_safe(void)
 	/* timestamp */
 	writel(1, 0x01720000);
 }
-#endif
 
 void clock_init_uart(void)
 {
@@ -70,7 +69,6 @@ void clock_init_uart(void)
 			   CONFIG_CONS_INDEX - 1));
 }
 
-#ifdef CONFIG_SPL_BUILD
 void clock_set_pll1(unsigned int clk)
 {
 	struct sunxi_ccm_reg * const ccm =
@@ -102,8 +100,9 @@ void clock_set_pll1(unsigned int clk)
 		CPU_CLK_SRC_PLL1 << C1_CPUX_CLK_SRC_SHIFT,
 	       &ccm->cpu_axi_cfg);
 }
-#endif
+#endif /* CONFIG_SPL_BUILD */
 
+/* DRAM and PLL_PERIPH0 clock (used by the MMC driver) */
 void clock_set_pll5(unsigned int clk)
 {
 	struct sunxi_ccm_reg * const ccm =
-- 
2.35.8

