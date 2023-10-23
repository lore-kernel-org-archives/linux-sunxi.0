Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5668318E34
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Oct 2023 13:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C9BCC15;
	Mon, 23 Oct 2023 06:26:05 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4CF43F762;
	Mon, 23 Oct 2023 06:25:22 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Maxim Kiselev <bigunclemax@gmail.com>,
	Sam Edwards <cfsworks@gmail.com>,
	Okhunjon Sobirjonov <okhunjon72@gmail.com>
Subject: [PATCH v3 14/24] sunxi: clock: support D1/R528 PLL6 clock
Date: Mon, 23 Oct 2023 14:24:39 +0100
Message-Id: <20231023132449.813863-15-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023132449.813863-1-andre.przywara@arm.com>
References: <20231023132449.813863-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PLL_PERIPH0 clock changed a bit in the D1/R528/T113s SoCs: there is
new P0 divider at bits [18:16], and the M divider is 1.

Add code to support this version of "PLL6".

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../include/asm/arch-sunxi/clock_sun50i_h6.h  |  2 ++
 arch/arm/mach-sunxi/clock_sun50i_h6.c         | 24 +++++++++++++------
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
index 9895c2c220e..8471e11aa02 100644
--- a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
+++ b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
@@ -249,6 +249,8 @@ struct sunxi_ccm_reg {
 #define CCM_PLL6_CTRL_EN		BIT(31)
 #define CCM_PLL6_LOCK_EN		BIT(29)
 #define CCM_PLL6_LOCK			BIT(28)
+#define CCM_PLL6_CTRL_P0_SHIFT		16
+#define CCM_PLL6_CTRL_P0_MASK		(0x7 << CCM_PLL6_CTRL_P0_SHIFT)
 #define CCM_PLL6_CTRL_N_SHIFT		8
 #define CCM_PLL6_CTRL_N_MASK		(0xff << CCM_PLL6_CTRL_N_SHIFT)
 #define CCM_PLL6_CTRL_DIV1_SHIFT	0
diff --git a/arch/arm/mach-sunxi/clock_sun50i_h6.c b/arch/arm/mach-sunxi/clock_sun50i_h6.c
index d32e33465f5..daae994787e 100644
--- a/arch/arm/mach-sunxi/clock_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/clock_sun50i_h6.c
@@ -110,16 +110,26 @@ unsigned int clock_get_pll6(void)
 {
 	struct sunxi_ccm_reg *const ccm =
 		(struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
-	int m = IS_ENABLED(CONFIG_MACH_SUN50I_H6) ? 4 : 2;
-
 	uint32_t rval = readl(&ccm->pll6_cfg);
 	int n = ((rval & CCM_PLL6_CTRL_N_MASK) >> CCM_PLL6_CTRL_N_SHIFT) + 1;
-	int div1 = ((rval & CCM_PLL6_CTRL_DIV1_MASK) >>
-			CCM_PLL6_CTRL_DIV1_SHIFT) + 1;
 	int div2 = ((rval & CCM_PLL6_CTRL_DIV2_MASK) >>
-			CCM_PLL6_CTRL_DIV2_SHIFT) + 1;
-	/* The register defines PLL6-2X or PLL6-4X, not plain PLL6 */
-	return 24000000 / m * n / div1 / div2;
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
 }
 
 int clock_twi_onoff(int port, int state)
-- 
2.25.1

