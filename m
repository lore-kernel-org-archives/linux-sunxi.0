Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0463622258E
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jul 2025 23:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752796629; cv=none; b=CmkIjmQoO5Tj5CaD1YKpPJECVyg1UJf1oY64gp7oj4yDkqMdCHu6tUzcaQTaOCY6xJOV8T3r3Q4gX/T+MlPOouwAv4p3OPxRy17IKXWttJT2WiCkeLl9WupDBhQbWxtiyjcMLMkqBRkiB9BqO52E1mH85lPJFFzwCYhs7BbVxyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752796629; c=relaxed/simple;
	bh=eVSHCr+/lmgCSqYiwUzjApX7kA03ejcLL5xmPX5suGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tpLl/4ulJT/tgVidawtvUGhF60SWHcmhL0D/TLdQeORgzCJJn6LQ6TLywVvNe2+8R2GAMyEIpCePPnJMTnrZVVYrGLfrd0fz52UvlS1yKb5KNiqFcvzvf302d7hg/PPeKBpc0RPrAaAT+3ehxNUQ8LGHzKfs529Wsdc49lQxPdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 389651762;
	Thu, 17 Jul 2025 16:57:00 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A28B13F694;
	Thu, 17 Jul 2025 16:57:06 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-sunxi@lists.linux.dev,
	Tom Rini <trini@konsulko.com>
Subject: [PATCH v2 12/20] sunxi: sun50i_h6: add A523 SPL clock setup code
Date: Fri, 18 Jul 2025 00:54:47 +0100
Message-ID: <20250717235455.32528-13-andre.przywara@arm.com>
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

---
 .../include/asm/arch-sunxi/clock_sun50i_h6.h  | 10 ++++++
 arch/arm/mach-sunxi/clock_sun50i_h6.c         | 32 ++++++++++++++-----
 2 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
index 5881ab88573..699d75f37c4 100644
--- a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
+++ b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
@@ -108,6 +108,13 @@
 #define CCM_PSI_AHB1_AHB2_DEFAULT	0x03000002
 #define CCM_AHB3_DEFAULT		0x03000002
 #define CCM_APB1_DEFAULT		0x03000102
+
+#elif CONFIG_MACH_SUN55I_A523				/* A523 */
+
+#define CCM_PLL6_DEFAULT		0xe8116310	    /* 1200 MHz */
+#define CCM_PSI_AHB1_AHB2_DEFAULT	0x03000002	    /* 200 MHz */
+#define CCM_APB1_DEFAULT		0x03000005	    /* APB0 really */
+#define CCM_APB2_DEFAULT		0x03000005	    /* APB1 really */
 #endif
 
 /* apb2 bit field */
@@ -127,6 +134,7 @@
 /* MBUS clock bit field */
 #define MBUS_ENABLE			BIT(31)
 #define MBUS_RESET			BIT(30)
+#define MBUS_UPDATE			BIT(27)
 #define MBUS_CLK_SRC_MASK		GENMASK(25, 24)
 #define MBUS_CLK_SRC_OSCM24		(0 << 24)
 #define MBUS_CLK_SRC_PLL6X2		(1 << 24)
@@ -139,10 +147,12 @@
 #define GATE_SHIFT			(0)
 
 /* DRAM clock bit field */
+#define DRAM_CLK_ENABLE			BIT(31)
 #define DRAM_MOD_RESET			BIT(30)
 #define DRAM_CLK_UPDATE			BIT(27)
 #define DRAM_CLK_SRC_MASK		GENMASK(25, 24)
 #define DRAM_CLK_SRC_PLL5		(0 << 24)
+#define DRAM_CLK_M_MASK			(0x1f)
 #define DRAM_CLK_M(m)			(((m)-1) << 0)
 
 /* MMC clock bit field */
diff --git a/arch/arm/mach-sunxi/clock_sun50i_h6.c b/arch/arm/mach-sunxi/clock_sun50i_h6.c
index 3a4399a9c6c..80004f13a1e 100644
--- a/arch/arm/mach-sunxi/clock_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/clock_sun50i_h6.c
@@ -16,15 +16,22 @@ void clock_init_safe(void)
 	void *const ccm = (void *)SUNXI_CCM_BASE;
 	void *const prcm = (void *)SUNXI_PRCM_BASE;
 
-	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616)) {
-		/* this seems to enable PLLs on H616 */
+	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616))
 		setbits_le32(prcm + CCU_PRCM_SYS_PWROFF_GATING, 0x10);
+	if (IS_ENABLED(CONFIG_MACH_SUN55I_A523))
+		setbits_le32(prcm + CCU_PRCM_SYS_PWROFF_GATING, 0x200);
+	udelay(1);
+
+	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616) ||
+	    IS_ENABLED(CONFIG_MACH_SUN55I_A523))
 		setbits_le32(prcm + CCU_PRCM_RES_CAL_CTRL, 2);
-	}
+	udelay(1);
 
 	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616) ||
-	    IS_ENABLED(CONFIG_MACH_SUN50I_H6)) {
+	    IS_ENABLED(CONFIG_MACH_SUN50I_H6) ||
+	    IS_ENABLED(CONFIG_MACH_SUN55I_A523)) {
 		clrbits_le32(prcm + CCU_PRCM_RES_CAL_CTRL, 1);
+		udelay(1);
 		setbits_le32(prcm + CCU_PRCM_RES_CAL_CTRL, 1);
 	}
 
@@ -41,9 +48,10 @@ void clock_init_safe(void)
 	while (!(readl(ccm + CCU_H6_PLL6_CFG) & CCM_PLL_LOCK))
 		;
 
-	clrsetbits_le32(ccm + CCU_H6_CPU_AXI_CFG,
-			CCM_CPU_AXI_APB_MASK | CCM_CPU_AXI_AXI_MASK,
-			CCM_CPU_AXI_DEFAULT_FACTORS);
+	if (!IS_ENABLED(CONFIG_MACH_SUN55I_A523))
+		clrsetbits_le32(ccm + CCU_H6_CPU_AXI_CFG,
+				CCM_CPU_AXI_APB_MASK | CCM_CPU_AXI_AXI_MASK,
+				CCM_CPU_AXI_DEFAULT_FACTORS);
 
 	writel(CCM_PSI_AHB1_AHB2_DEFAULT, ccm + CCU_H6_PSI_AHB1_AHB2_CFG);
 #ifdef CCM_AHB3_DEFAULT
@@ -55,7 +63,15 @@ void clock_init_safe(void)
 	 * The mux and factor are set, but the clock will be enabled in
 	 * DRAM initialization code.
 	 */
-	writel(MBUS_CLK_SRC_PLL6X2 | MBUS_CLK_M(3), ccm + CCU_H6_MBUS_CFG);
+	if (IS_ENABLED(CONFIG_MACH_SUN55I_A523)) {
+		writel(MBUS_RESET, ccm + CCU_H6_MBUS_CFG);
+		udelay(1);
+		writel(MBUS_UPDATE | MBUS_CLK_SRC_OSCM24 | MBUS_CLK_M(4),
+		       ccm + CCU_H6_MBUS_CFG);
+	} else {
+		writel(MBUS_CLK_SRC_PLL6X2 | MBUS_CLK_M(3),
+		       ccm + CCU_H6_MBUS_CFG);
+	}
 }
 
 void clock_init_uart(void)
-- 
2.46.3

