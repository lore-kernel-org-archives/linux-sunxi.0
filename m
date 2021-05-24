Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3E52FB0
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 23:30:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2777101E;
	Mon, 24 May 2021 16:30:54 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 672023F73D;
	Mon, 24 May 2021 16:30:53 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: u-boot@lists.denx.de,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ondrej Jirman <megous@megous.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/8] mmc: sunxi: Fix MMC clock parent selection
Date: Tue, 25 May 2021 00:30:24 +0100
Message-Id: <20210524233029.16417-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210524233029.16417-1-andre.przywara@arm.com>
References: <20210524233029.16417-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Most Allwinner SoCs which use the so called "new timing mode" in their
MMC controllers actually use the double-rate PLL6/PERIPH0 clock as their
parent input clock. This is interestingly enough compensated by a hidden
"by 2" post-divider in the mod clock, so the divider and actual output
rate stay the same.

Even though for the H6 and H616 (but only for them!) we use the doubled
input clock for the divider computation, we never accounted for the
implicit post-divider, so the clock was only half the speed on those SoCs.
This didn't really matter so far, as our slow MMIO routine limits the
transfer speed anyway, but we will fix this soon.

Clean up the code around that selection, to always use the normal PLL6
(PERIPH0(1x)) clock as an input. As the rate and divider are the same,
that makes no difference.
Explain the hardware differences in a comment.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h |  2 +-
 drivers/mmc/sunxi_mmc.c                           | 10 +++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
index 62abfc4ef6b..e000f78ff45 100644
--- a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
+++ b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
@@ -326,7 +326,7 @@ struct sunxi_ccm_reg {
 #define CCM_MMC_CTRL_M(x)		((x) - 1)
 #define CCM_MMC_CTRL_N(x)		((x) << 8)
 #define CCM_MMC_CTRL_OSCM24		(0x0 << 24)
-#define CCM_MMC_CTRL_PLL6X2		(0x1 << 24)
+#define CCM_MMC_CTRL_PLL6		(0x1 << 24)
 #define CCM_MMC_CTRL_PLL_PERIPH2X2	(0x2 << 24)
 #define CCM_MMC_CTRL_ENABLE		(0x1 << 31)
 /* H6 doesn't have these delays */
diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
index 869af993d35..bc68debdad6 100644
--- a/drivers/mmc/sunxi_mmc.c
+++ b/drivers/mmc/sunxi_mmc.c
@@ -124,10 +124,14 @@ static int mmc_set_mod_clk(struct sunxi_mmc_priv *priv, unsigned int hz)
 #ifdef CONFIG_MACH_SUN9I
 		pll = CCM_MMC_CTRL_PLL_PERIPH0;
 		pll_hz = clock_get_pll4_periph0();
-#elif defined(CONFIG_SUN50I_GEN_H6)
-		pll = CCM_MMC_CTRL_PLL6X2;
-		pll_hz = clock_get_pll6() * 2;
 #else
+		/*
+		 * SoCs since the A64 (H5, H6, H616) actually use the doubled
+		 * rate of PLL6/PERIPH0 as an input clock, but compensate for
+		 * that with a fixed post-divider of 2 in the mod clock.
+		 * This cancels each other out, so for simplicity we just
+		 * pretend it's always PLL6 without a post divider here.
+		 */
 		pll = CCM_MMC_CTRL_PLL6;
 		pll_hz = clock_get_pll6();
 #endif
-- 
2.17.5

