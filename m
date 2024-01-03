Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CA310EE
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jan 2024 00:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B36FC15;
	Tue,  2 Jan 2024 16:14:26 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0EF93F5A1;
	Tue,  2 Jan 2024 16:13:39 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: [PATCH 10/19] sunxi: sun4i: make more clock functions SPL only
Date: Wed,  3 Jan 2024 00:12:30 +0000
Message-Id: <20240103001239.17482-11-andre.przywara@arm.com>
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

In clock_sun4i.c, responsible for (mostly early) clock setup on early
generation Allwinner SoCs, many functions are only needed by the SPL,
and are thus already guarded by CONFIG_SPL_BUILD.

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
 arch/arm/mach-sunxi/clock_sun4i.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-sunxi/clock_sun4i.c b/arch/arm/mach-sunxi/clock_sun4i.c
index 8f1d1b65f00..eead5a924f4 100644
--- a/arch/arm/mach-sunxi/clock_sun4i.c
+++ b/arch/arm/mach-sunxi/clock_sun4i.c
@@ -41,7 +41,6 @@ void clock_init_safe(void)
 	setbits_le32(&ccm->pll6_cfg, 0x1 << CCM_PLL6_CTRL_SATA_EN_SHIFT);
 #endif
 }
-#endif
 
 void clock_init_uart(void)
 {
@@ -75,7 +74,6 @@ int clock_twi_onoff(int port, int state)
 	return 0;
 }
 
-#ifdef CONFIG_SPL_BUILD
 #define PLL1_CFG(N, K, M, P)	( 1 << CCM_PLL1_CFG_ENABLE_SHIFT | \
 				  0 << CCM_PLL1_CFG_VCO_RST_SHIFT |  \
 				  8 << CCM_PLL1_CFG_VCO_BIAS_SHIFT | \
@@ -175,8 +173,9 @@ void clock_set_pll1(unsigned int hz)
 	       &ccm->cpu_ahb_apb0_cfg);
 	sdelay(20);
 }
-#endif
+#endif /* CONFIG_SPL_BUILD */
 
+/* video, DRAM, PLL_PERIPH clocks */
 void clock_set_pll3(unsigned int clk)
 {
 	struct sunxi_ccm_reg * const ccm =
-- 
2.35.8

