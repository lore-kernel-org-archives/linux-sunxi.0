Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC21219A1F
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Jul 2023 13:47:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D0A0D75;
	Fri, 21 Jul 2023 06:48:00 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FD873F6C4;
	Fri, 21 Jul 2023 06:47:15 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	u-boot@lists.denx.de
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Maxim Kiselev <bigunclemax@gmail.com>,
	Sam Edwards <cfsworks@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 11/20] sunxi: clock: D1/R528: Enable PLL LDO during PLL1 setup
Date: Fri, 21 Jul 2023 14:45:57 +0100
Message-Id: <20230721134606.4505-12-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20230721134606.4505-1-andre.przywara@arm.com>
References: <20230721134606.4505-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The D1/R528/T113s SoCs introduce a new "LDO enable" bit in the CPUX_PLL.
Just enable that when we program that PLL.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h |  1 +
 arch/arm/mach-sunxi/clock_sun50i_h6.c             | 12 +++++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
index 37df4410eaa..9895c2c220e 100644
--- a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
+++ b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
@@ -228,6 +228,7 @@ struct sunxi_ccm_reg {
 
 /* pll1 bit field */
 #define CCM_PLL1_CTRL_EN		BIT(31)
+#define CCM_PLL1_LDO_EN			BIT(30)
 #define CCM_PLL1_LOCK_EN		BIT(29)
 #define CCM_PLL1_LOCK			BIT(28)
 #define CCM_PLL1_OUT_EN			BIT(27)
diff --git a/arch/arm/mach-sunxi/clock_sun50i_h6.c b/arch/arm/mach-sunxi/clock_sun50i_h6.c
index 7926394cf76..90110eab101 100644
--- a/arch/arm/mach-sunxi/clock_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/clock_sun50i_h6.c
@@ -86,11 +86,13 @@ void clock_set_pll1(unsigned int clk)
 	writel(val, &ccm->cpu_axi_cfg);
 
 	/* clk = 24*n/p, p is ignored if clock is >288MHz */
-	writel(CCM_PLL1_CTRL_EN | CCM_PLL1_LOCK_EN | CCM_PLL1_CLOCK_TIME_2 |
-#ifdef CONFIG_MACH_SUN50I_H616
-	       CCM_PLL1_OUT_EN |
-#endif
-	       CCM_PLL1_CTRL_N(clk / 24000000), &ccm->pll1_cfg);
+	val = CCM_PLL1_CTRL_EN | CCM_PLL1_LOCK_EN | CCM_PLL1_CLOCK_TIME_2;
+	val |= CCM_PLL1_CTRL_N(clk / 24000000);
+	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616))
+	       val |= CCM_PLL1_OUT_EN;
+	if (IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2))
+	       val |= CCM_PLL1_OUT_EN | CCM_PLL1_LDO_EN;
+	writel(val, &ccm->pll1_cfg);
 	while (!(readl(&ccm->pll1_cfg) & CCM_PLL1_LOCK)) {}
 
 	/* Switch CPU to PLL1 */
-- 
2.35.8

