Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DA820408D
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729783; cv=none; b=PhNKItEadsQaMv8wOJYbaUs8qOH03b7X7pNKuE1L/bTUQXDUS6zA3Y1UC7o6fcsWMXWxS5FuVCINQU8jEm1fWWG2yxDJysTAYJU962ZL2NKULey30/9WAVC084vSuH0d3naIS1QLU8dhUM1EW4M1peXuzpFy3FPF6eAVqlDP/YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729783; c=relaxed/simple;
	bh=N4KbBs+mQuzJ17BAGBWxO9sxgHzprf3RL/b87YUk3i4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PxssHrbCroIQpESmJkb+M/yf6b1+SNU7z88t+Af0eQ0P6jQ+p7CAblenFY0+YU65kRZ0p0Zpcqv3TPdZLmdk6ol3Jfnx1ySUTUX19A+40Q7w7LWwENNTnWgaikqf8VCNWTlv5P+Z+NRWJi39R1D+Edb8mpQFiet9lX6ZATsSNK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC744339;
	Sun, 23 Mar 2025 04:36:28 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F31553F694;
	Sun, 23 Mar 2025 04:36:20 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 09/34] sunxi: clock: H6: unify PLL control bit definitions
Date: Sun, 23 Mar 2025 11:35:19 +0000
Message-ID: <20250323113544.7933-10-andre.przywara@arm.com>
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

The Allwinner PLLs share most of their control bits, they differ mostly
in the factors and dividers.

Drop the PLL specific definition of those common bits, and use one
shared macro, for all PLLs.

This requires changing the users in the SPL clock and DRAM code.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../include/asm/arch-sunxi/clock_sun50i_h6.h  | 20 +++++++------------
 arch/arm/mach-sunxi/clock_sun50i_h6.c         | 10 +++++-----
 arch/arm/mach-sunxi/dram_sun50i_h6.c          |  6 +++---
 arch/arm/mach-sunxi/dram_sun50i_h616.c        |  6 +++---
 4 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
index ccacc99d018..bc64c8e2f97 100644
--- a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
+++ b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
@@ -31,29 +31,23 @@
 #define CCU_H6_UART_GATE_RESET		0x90c
 #define CCU_H6_I2C_GATE_RESET		0x91c
 
-/* pll1 bit field */
-#define CCM_PLL1_CTRL_EN		BIT(31)
-#define CCM_PLL1_LDO_EN			BIT(30)
-#define CCM_PLL1_LOCK_EN		BIT(29)
-#define CCM_PLL1_LOCK			BIT(28)
-#define CCM_PLL1_OUT_EN			BIT(27)
+/* PLL bit fields */
+#define CCM_PLL_CTRL_EN			BIT(31)
+#define CCM_PLL_LDO_EN			BIT(30)
+#define CCM_PLL_LOCK_EN			BIT(29)
+#define CCM_PLL_LOCK			BIT(28)
+#define CCM_PLL_OUT_EN			BIT(27)
+#define CCM_PLL1_UPDATE			BIT(26)
 #define CCM_PLL1_CLOCK_TIME_2		(2 << 24)
 #define CCM_PLL1_CTRL_P(p)		((p) << 16)
 #define CCM_PLL1_CTRL_N(n)		(((n) - 1) << 8)
 
 /* pll5 bit field */
-#define CCM_PLL5_CTRL_EN		BIT(31)
-#define CCM_PLL5_LOCK_EN		BIT(29)
-#define CCM_PLL5_LOCK			BIT(28)
-#define CCM_PLL5_OUT_EN			BIT(27)
 #define CCM_PLL5_CTRL_N(n)		(((n) - 1) << 8)
 #define CCM_PLL5_CTRL_DIV1(div1)	((div1) << 0)
 #define CCM_PLL5_CTRL_DIV2(div0)	((div0) << 1)
 
 /* pll6 bit field */
-#define CCM_PLL6_CTRL_EN		BIT(31)
-#define CCM_PLL6_LOCK_EN		BIT(29)
-#define CCM_PLL6_LOCK			BIT(28)
 #define CCM_PLL6_CTRL_P0_SHIFT		16
 #define CCM_PLL6_CTRL_P0_MASK		(0x7 << CCM_PLL6_CTRL_P0_SHIFT)
 #define CCM_PLL6_CTRL_N_SHIFT		8
diff --git a/arch/arm/mach-sunxi/clock_sun50i_h6.c b/arch/arm/mach-sunxi/clock_sun50i_h6.c
index 615c13b5da0..67d65fccffe 100644
--- a/arch/arm/mach-sunxi/clock_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/clock_sun50i_h6.c
@@ -31,7 +31,7 @@ void clock_init_safe(void)
 	clock_set_pll1(408000000);
 
 	writel(CCM_PLL6_DEFAULT, ccm + CCU_H6_PLL6_CFG);
-	while (!(readl(ccm + CCU_H6_PLL6_CFG) & CCM_PLL6_LOCK))
+	while (!(readl(ccm + CCU_H6_PLL6_CFG) & CCM_PLL_LOCK))
 		;
 
 	clrsetbits_le32(ccm + CCU_H6_CPU_AXI_CFG,
@@ -85,14 +85,14 @@ void clock_set_pll1(unsigned int clk)
 	writel(val, ccm + CCU_H6_CPU_AXI_CFG);
 
 	/* clk = 24*n/p, p is ignored if clock is >288MHz */
-	val = CCM_PLL1_CTRL_EN | CCM_PLL1_LOCK_EN | CCM_PLL1_CLOCK_TIME_2;
+	val = CCM_PLL_CTRL_EN | CCM_PLL_LOCK_EN | CCM_PLL1_CLOCK_TIME_2;
 	val |= CCM_PLL1_CTRL_N(clk / 24000000);
 	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616))
-	       val |= CCM_PLL1_OUT_EN;
+	       val |= CCM_PLL_OUT_EN;
 	if (IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2))
-	       val |= CCM_PLL1_OUT_EN | CCM_PLL1_LDO_EN;
+	       val |= CCM_PLL_OUT_EN | CCM_PLL_LDO_EN;
 	writel(val, ccm + CCU_H6_PLL1_CFG);
-	while (!(readl(ccm + CCU_H6_PLL1_CFG) & CCM_PLL1_LOCK)) {}
+	while (!(readl(ccm + CCU_H6_PLL1_CFG) & CCM_PLL_LOCK)) {}
 
 	/* Switch CPU to PLL1 */
 	val = readl(ccm + CCU_H6_CPU_AXI_CFG);
diff --git a/arch/arm/mach-sunxi/dram_sun50i_h6.c b/arch/arm/mach-sunxi/dram_sun50i_h6.c
index 5bf932001cb..374acfe8a2e 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h6.c
@@ -163,16 +163,16 @@ static void mctl_sys_init(struct dram_para *para)
 	clrbits_le32(ccm + CCU_H6_DRAM_GATE_RESET, BIT(0));
 	udelay(5);
 	writel(0, ccm + CCU_H6_DRAM_GATE_RESET);
-	clrbits_le32(ccm + CCU_H6_PLL5_CFG, CCM_PLL5_CTRL_EN);
+	clrbits_le32(ccm + CCU_H6_PLL5_CFG, CCM_PLL_CTRL_EN);
 	clrbits_le32(ccm + CCU_H6_DRAM_CLK_CFG, DRAM_MOD_RESET);
 
 	udelay(5);
 
 	/* Set PLL5 rate to doubled DRAM clock rate */
-	writel(CCM_PLL5_CTRL_EN | CCM_PLL5_LOCK_EN |
+	writel(CCM_PLL_CTRL_EN | CCM_PLL_LOCK_EN |
 	       CCM_PLL5_CTRL_N(para->clk * 2 / 24), ccm + CCU_H6_PLL5_CFG);
 	mctl_await_completion(ccm + CCU_H6_PLL5_CFG,
-			      CCM_PLL5_LOCK, CCM_PLL5_LOCK);
+			      CCM_PLL_LOCK, CCM_PLL_LOCK);
 
 	/* Configure DRAM mod clock */
 	writel(DRAM_CLK_SRC_PLL5, ccm + CCU_H6_DRAM_CLK_CFG);
diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index ab00bd263f4..cbf4668b406 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -105,16 +105,16 @@ static void mctl_sys_init(u32 clk_rate)
 	clrbits_le32(ccm + CCU_H6_DRAM_GATE_RESET, BIT(GATE_SHIFT));
 	udelay(5);
 	clrbits_le32(ccm + CCU_H6_DRAM_GATE_RESET, BIT(RESET_SHIFT));
-	clrbits_le32(ccm + CCU_H6_PLL5_CFG, CCM_PLL5_CTRL_EN);
+	clrbits_le32(ccm + CCU_H6_PLL5_CFG, CCM_PLL_CTRL_EN);
 	clrbits_le32(ccm + CCU_H6_DRAM_CLK_CFG, DRAM_MOD_RESET);
 
 	udelay(5);
 
 	/* Set PLL5 rate to doubled DRAM clock rate */
-	writel(CCM_PLL5_CTRL_EN | CCM_PLL5_LOCK_EN | CCM_PLL5_OUT_EN |
+	writel(CCM_PLL_CTRL_EN | CCM_PLL_LOCK_EN | CCM_PLL_OUT_EN |
 	       CCM_PLL5_CTRL_N(clk_rate * 2 / 24), ccm + CCU_H6_PLL5_CFG);
 	mctl_await_completion(ccm + CCU_H6_PLL5_CFG,
-			      CCM_PLL5_LOCK, CCM_PLL5_LOCK);
+			      CCM_PLL_LOCK, CCM_PLL_LOCK);
 
 	/* Configure DRAM mod clock */
 	writel(DRAM_CLK_SRC_PLL5, ccm + CCU_H6_DRAM_CLK_CFG);
-- 
2.46.3

