Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DEF78F4C
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729809; cv=none; b=pXA7pjb555TOXGem3haLJQgdePfJYbXkjzdQOVQ2CG3DVYnakXbzAslja+leEkakro7ZnJ4N6e149DlBAH7Z7WVAJ6F/dVbNQqZOYE8Sca0w/bCgMNXmtCOLAZ7dEJ1OZ0SxAI5hbOjOCFBtyD5FODKizjEKCKI9b9/lCJnfqo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729809; c=relaxed/simple;
	bh=kVPwEgEGPdOG3Nt+eID2asRoC7VabG4RM9ykyJuEIKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgBYfmgWdMn/5RH5SqdDVvopJ8lLhWPpIBUWf447fgcjQqyStbZJkPWnfCYSXR1NjmYL8sLTfcz7AJ0GaghNoTFfQnaBBwk41Fcu0xW1wsLSxJVvsuTUXNvx3qxXijSjUfAsisIG/xFF8fRAwYXWfuaBkpd/ajNezX6DJLFYTaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EAC91595;
	Sun, 23 Mar 2025 04:36:54 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 954CF3F694;
	Sun, 23 Mar 2025 04:36:46 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 29/34] sunxi: sun50i_h6: add A523 SPL clock setup code
Date: Sun, 23 Mar 2025 11:35:39 +0000
Message-ID: <20250323113544.7933-30-andre.przywara@arm.com>
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

From: Jernej Skrabec <jernej.skrabec@gmail.com>

---
 .../include/asm/arch-sunxi/clock_sun50i_h6.h  | 10 ++++++
 arch/arm/mach-sunxi/clock_sun50i_h6.c         | 32 ++++++++++++++-----
 2 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
index c95f2b39e64..d251ed49798 100644
--- a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
+++ b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
@@ -101,6 +101,13 @@
 #define CCM_PLL6_DEFAULT		0xe8216300
 #define CCM_PSI_AHB1_AHB2_DEFAULT	0x03000002
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
@@ -120,6 +127,7 @@
 /* MBUS clock bit field */
 #define MBUS_ENABLE			BIT(31)
 #define MBUS_RESET			BIT(30)
+#define MBUS_UPDATE			BIT(27)
 #define MBUS_CLK_SRC_MASK		GENMASK(25, 24)
 #define MBUS_CLK_SRC_OSCM24		(0 << 24)
 #define MBUS_CLK_SRC_PLL6X2		(1 << 24)
@@ -132,10 +140,12 @@
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
index f76d1b83883..2ba144a6ac3 100644
--- a/arch/arm/mach-sunxi/clock_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/clock_sun50i_h6.c
@@ -14,15 +14,22 @@ void clock_init_safe(void)
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
 
@@ -39,9 +46,10 @@ void clock_init_safe(void)
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
@@ -53,7 +61,15 @@ void clock_init_safe(void)
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

