Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751EE1D95B4
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729785; cv=none; b=E8mDPeqoknNIrsbAyqAJHGUxfXvAD2HdUq4Kw9nOy3X1HHuyreD8sGeBUYiMbHTTl63hudF4SlqFJZkYtvY6PIGT0xP4z2ZrX6zEBih+QizxE9SlcxQ3BRyGAYbrC+GXJkgZcwpke4OzqEfEqR3MPAu+MaObRGjXgDM/QeQaBxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729785; c=relaxed/simple;
	bh=dQyOkvDZzfBURwMeuUwZ0R7THRw178iP02519XUlUmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ld6oqAR8eWTpLadqVG18kPKewePINxH4CZTxEVrA2kWhd9xZmTG5PprLd9OD64WR7uNrABo3eAsU3Qh7AqPNW4mjbhqkWi/qKWEZPZkGW33MFVDWXbk3LN/qVXaPlyvilKq9HdzEaw5K0W51BgopS4NtTsy1ROC6V1wp9SEmYjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E69E6106F;
	Sun, 23 Mar 2025 04:36:29 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38A2A3F694;
	Sun, 23 Mar 2025 04:36:22 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 10/34] sunxi: clock: H6: factor out clock_set_pll()
Date: Sun, 23 Mar 2025 11:35:20 +0000
Message-ID: <20250323113544.7933-11-andre.przywara@arm.com>
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
 arch/arm/mach-sunxi/clock_sun50i_h6.c         | 51 +++++++++++++++----
 2 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
index bc64c8e2f97..6761ce9d8f7 100644
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
index 67d65fccffe..9faf659f834 100644
--- a/arch/arm/mach-sunxi/clock_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/clock_sun50i_h6.c
@@ -2,6 +2,7 @@
 #include <asm/arch/cpu.h>
 #include <asm/arch/clock.h>
 #include <asm/arch/prcm.h>
+#include <linux/delay.h>
 
 #ifdef CONFIG_XPL_BUILD
 void clock_init_safe(void)
@@ -70,6 +71,46 @@ void clock_init_uart(void)
 		     1 << (RESET_SHIFT + CONFIG_CONS_INDEX - 1));
 }
 
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
+	if (IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2)) {
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
+	if (IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2)) {
+		val |= CCM_PLL_OUT_EN;
+		writel(val, reg);
+	}
+}
+
 void clock_set_pll1(unsigned int clk)
 {
 	void *const ccm = (void *)SUNXI_CCM_BASE;
@@ -84,15 +125,7 @@ void clock_set_pll1(unsigned int clk)
 	val |= CCM_CPU_AXI_MUX_OSC24M;
 	writel(val, ccm + CCU_H6_CPU_AXI_CFG);
 
-	/* clk = 24*n/p, p is ignored if clock is >288MHz */
-	val = CCM_PLL_CTRL_EN | CCM_PLL_LOCK_EN | CCM_PLL1_CLOCK_TIME_2;
-	val |= CCM_PLL1_CTRL_N(clk / 24000000);
-	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616))
-	       val |= CCM_PLL_OUT_EN;
-	if (IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2))
-	       val |= CCM_PLL_OUT_EN | CCM_PLL_LDO_EN;
-	writel(val, ccm + CCU_H6_PLL1_CFG);
-	while (!(readl(ccm + CCU_H6_PLL1_CFG) & CCM_PLL_LOCK)) {}
+	clock_set_pll(ccm + CCU_H6_PLL1_CFG, clk / 24000000);
 
 	/* Switch CPU to PLL1 */
 	val = readl(ccm + CCU_H6_CPU_AXI_CFG);
-- 
2.46.3

