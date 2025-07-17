Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20EE72309BD
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jul 2025 23:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752796617; cv=none; b=S9ielsqCjPz5MRJzHORvzTIHw1Uay1GL6Xrzf7okJpCSWEegVPAoVmGH7seomhhZAyCb8xxg5+sbjcW4NOroGZuMCFsc8PFek/sxKFfZYzXaUs8zbnGquCKSAFVz5pFHQrqXFihbWD7uW15yKwVR689+JTukLNf8X/yZEz4OAgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752796617; c=relaxed/simple;
	bh=5w7wJT9Ma+MQjAO3OCSa7p54JU1cUymrFijAit7nRiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nhFUbKGeIOH7Q370LHqUwSEqBJl3+/RZOLK4buwVA/H4mIUeqQiM54PVVZ0aXswfqsULaI7HEhnDZH9LEmLqnOhs7Cl2889UOKY+9FRv6iU3Qr7DKCfWt2T3m4vUaQtTdE/oTIP8UWPBT9UKKWRWljySjRNSxvSuhov/XjxDN+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B1B61762;
	Thu, 17 Jul 2025 16:56:46 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 028E83F694;
	Thu, 17 Jul 2025 16:56:52 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-sunxi@lists.linux.dev,
	Tom Rini <trini@konsulko.com>
Subject: [PATCH v2 02/20] sunxi: clock: H6: factor out clock_set_pll()
Date: Fri, 18 Jul 2025 00:54:37 +0100
Message-ID: <20250717235455.32528-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250717235455.32528-1-andre.przywara@arm.com>
References: <20250717235455.32528-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SPL initial clock setup code for the Allwinner H6 and H616 SoCs uses
a simple CPU PLL setup routine, which programs all register bits at once,
then waits for the LOCK bit to clear.
The manual suggests to follow a certain procedure for bringing up any
PLLs, which involves several register writes, one at a time, and some
delays. Also the H616 and the new A523 require some tiny changes in this
sequence, and the different SoCs also feature some extra bits here and
there, which we should not just clear.

So factor out the PLL setup routine, and make it follow the manual's
suggestion. This will read the PLL register at the beginning, then tweak
the bits we need to manipulate, and writes the register several times on
the way. This allows to cover the specific bits for different SoCs.

Besides improving the reliability of the PLL setup, this helps with the
A523, which requires *three* CPU PLLs to be programmed.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../include/asm/arch-sunxi/clock_sun50i_h6.h  |  2 +-
 arch/arm/mach-sunxi/clock_sun50i_h6.c         | 60 +++++++++++++++----
 2 files changed, 50 insertions(+), 12 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
index 37a620c9866..5d6519d2367 100644
--- a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
+++ b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
@@ -38,8 +38,8 @@
 #define CCM_PLL_LOCK			BIT(28)
 #define CCM_PLL_OUT_EN			BIT(27)
 #define CCM_PLL1_UPDATE			BIT(26)
-#define CCM_PLL1_CLOCK_TIME_2		(2 << 24)
 #define CCM_PLL1_CTRL_P(p)		((p) << 16)
+#define CCM_PLL1_CTRL_N_MASK		GENMASK(15, 8)
 #define CCM_PLL1_CTRL_N(n)		(((n) - 1) << 8)
 
 /* pll5 bit field */
diff --git a/arch/arm/mach-sunxi/clock_sun50i_h6.c b/arch/arm/mach-sunxi/clock_sun50i_h6.c
index 2f2fd5df93d..90436b45b40 100644
--- a/arch/arm/mach-sunxi/clock_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/clock_sun50i_h6.c
@@ -4,6 +4,7 @@
 #include <asm/arch/cpu.h>
 #include <asm/arch/clock.h>
 #include <asm/arch/prcm.h>
+#include <linux/delay.h>
 
 #ifdef CONFIG_XPL_BUILD
 void clock_init_safe(void)
@@ -72,6 +73,53 @@ void clock_init_uart(void)
 		     1 << (RESET_SHIFT + CONFIG_CONS_INDEX - 1));
 }
 
+static bool has_pll_output_gate(void)
+{
+	return (IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2) ||
+		IS_ENABLED(CONFIG_MACH_SUN50I_H616) ||
+		IS_ENABLED(CONFIG_MACH_SUN50I_A133));
+}
+
+/* A shared routine to program the CPU PLLs for H6, H616, T113, A523 */
+static void clock_set_pll(u32 *reg, unsigned int n)
+{
+	u32 val = readl(reg);
+
+	/* clear the lock enable bit */
+	val &= ~CCM_PLL_LOCK_EN;
+	writel(val, reg);
+
+	/* gate the output on the newer SoCs */
+	if (has_pll_output_gate()) {
+		val &= ~CCM_PLL_OUT_EN;
+		writel(val, reg);
+	}
+
+	val &= ~(CCM_PLL1_CTRL_N_MASK | GENMASK(3, 0) | GENMASK(21, 16));
+	val |= CCM_PLL1_CTRL_N(n);
+	writel(val, reg);			/* program parameter */
+
+	val |= CCM_PLL_CTRL_EN;
+	if (IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2))
+		val |= CCM_PLL_LDO_EN;
+	writel(val, reg);			/* enable PLL */
+
+	val |= CCM_PLL_LOCK_EN;
+	if (IS_ENABLED(CONFIG_MACH_SUN55I_A523))
+		val |= CCM_PLL1_UPDATE;
+	writel(val, reg);			/* start locking process */
+
+	while (!(readl(reg) & CCM_PLL_LOCK)) {	/* wait for lock bit */
+	}
+	udelay(20);				/* wait as per manual */
+
+	/* un-gate the output on the newer SoCs */
+	if (has_pll_output_gate()) {
+		val |= CCM_PLL_OUT_EN;
+		writel(val, reg);
+	}
+}
+
 void clock_set_pll1(unsigned int clk)
 {
 	void *const ccm = (void *)SUNXI_CCM_BASE;
@@ -86,17 +134,7 @@ void clock_set_pll1(unsigned int clk)
 	val |= CCM_CPU_AXI_MUX_OSC24M;
 	writel(val, ccm + CCU_H6_CPU_AXI_CFG);
 
-	/* clk = 24*n/p, p is ignored if clock is >288MHz */
-	val = CCM_PLL_CTRL_EN | CCM_PLL_LOCK_EN | CCM_PLL1_CLOCK_TIME_2;
-	val |= CCM_PLL1_CTRL_N(clk / 24000000);
-	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616) ||
-	    IS_ENABLED(CONFIG_MACH_SUN50I_A133))
-		val |= CCM_PLL_OUT_EN;
-	if (IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2))
-		val |= CCM_PLL_OUT_EN | CCM_PLL_LDO_EN;
-	writel(val, ccm + CCU_H6_PLL1_CFG);
-	while (!(readl(ccm + CCU_H6_PLL1_CFG) & CCM_PLL_LOCK))
-		;
+	clock_set_pll(ccm + CCU_H6_PLL1_CFG, clk / 24000000);
 
 	/* Switch CPU to PLL1 */
 	val = readl(ccm + CCU_H6_CPU_AXI_CFG);
-- 
2.46.3

