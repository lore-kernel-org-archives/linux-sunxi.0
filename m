Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35272040BA
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729776; cv=none; b=oxRMt+N+4Xgbgsz2PtvY4JoOcoEZWh6MAYp/NrkomkyIjZMXmaQt7jR2EqnVhMXQxkduA58j4OzpfEzSmI6UkTq7b6Bva+mrrdaA+C9q5thZiiv4jPKjU3bzL6c23zhoJGFHvAlS242BgcIjf0ZaxEWFi/ulNdMtDqb3ZJxGIr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729776; c=relaxed/simple;
	bh=bAL5yXL7UfoZNLtDcB2TtkvNkiWda+aI6R2CiPERfYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a8hPWZrxmGlZ4xk3Yy6/KYAXyHnF94bLrMWwiAvhu3G2pPE3y6PwCHK20LgR/YUX2tA0lBK4D+nYmBj6Tj7X8hb88YZx4F46srG8ZhzK0+IM2RyVk+4WBIf6KWYThqFejWjdh69fRUDsJ2ofEkyVhvGUwJeUpoY0ce4v+OPz6E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41F17339;
	Sun, 23 Mar 2025 04:36:21 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88B533F694;
	Sun, 23 Mar 2025 04:36:13 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 03/34] sunxi: H616: dram: remove usage of struct sunxi_ccm_reg
Date: Sun, 23 Mar 2025 11:35:13 +0000
Message-ID: <20250323113544.7933-4-andre.przywara@arm.com>
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

The Allwinner H616 DRAM initialisation code uses a complex C struct,
modelling the clock device's register frame. For this SoC, the struct
contains 127 registers, but the DRAM code only uses four of them.

Since we want to get rid of this struct, drop the usage of the struct in
the H616 DRAM code, by using #define'd register names and their offset,
and then adding those names to the base pointer.

This removes one more user of the clock register struct.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../include/asm/arch-sunxi/clock_sun50i_h6.h  |  2 ++
 arch/arm/mach-sunxi/dram_sun50i_h616.c        | 32 +++++++++----------
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
index 655f562c2af..0a5f9342308 100644
--- a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
+++ b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
@@ -22,6 +22,8 @@
 #define CCU_H6_APB1_CFG			0x520
 #define CCU_H6_APB2_CFG			0x524
 #define CCU_H6_MBUS_CFG			0x540
+#define CCU_H6_DRAM_CLK_CFG		0x800
+#define CCU_H6_DRAM_GATE_RESET		0x80c
 #define CCU_MMC0_CLK_CFG		0x830
 #define CCU_MMC1_CLK_CFG		0x834
 #define CCU_MMC2_CLK_CFG		0x838
diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index b3554cc64bf..b310c6a7632 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -93,34 +93,34 @@ static void mctl_set_master_priority(void)
 
 static void mctl_sys_init(u32 clk_rate)
 {
-	struct sunxi_ccm_reg * const ccm =
-			(struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
+	void * const ccm = (void *)SUNXI_CCM_BASE;
 	struct sunxi_mctl_com_reg * const mctl_com =
 			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
 	struct sunxi_mctl_ctl_reg * const mctl_ctl =
 			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
 
 	/* Put all DRAM-related blocks to reset state */
-	clrbits_le32(&ccm->mbus_cfg, MBUS_ENABLE);
-	clrbits_le32(&ccm->mbus_cfg, MBUS_RESET);
-	clrbits_le32(&ccm->dram_gate_reset, BIT(GATE_SHIFT));
+	clrbits_le32(ccm + CCU_H6_MBUS_CFG, MBUS_ENABLE);
+	clrbits_le32(ccm + CCU_H6_MBUS_CFG, MBUS_RESET);
+	clrbits_le32(ccm + CCU_H6_DRAM_GATE_RESET, BIT(GATE_SHIFT));
 	udelay(5);
-	clrbits_le32(&ccm->dram_gate_reset, BIT(RESET_SHIFT));
-	clrbits_le32(&ccm->pll5_cfg, CCM_PLL5_CTRL_EN);
-	clrbits_le32(&ccm->dram_clk_cfg, DRAM_MOD_RESET);
+	clrbits_le32(ccm + CCU_H6_DRAM_GATE_RESET, BIT(RESET_SHIFT));
+	clrbits_le32(ccm + CCU_H6_PLL5_CFG, CCM_PLL5_CTRL_EN);
+	clrbits_le32(ccm + CCU_H6_DRAM_CLK_CFG, DRAM_MOD_RESET);
 
 	udelay(5);
 
 	/* Set PLL5 rate to doubled DRAM clock rate */
 	writel(CCM_PLL5_CTRL_EN | CCM_PLL5_LOCK_EN | CCM_PLL5_OUT_EN |
-	       CCM_PLL5_CTRL_N(clk_rate * 2 / 24), &ccm->pll5_cfg);
-	mctl_await_completion(&ccm->pll5_cfg, CCM_PLL5_LOCK, CCM_PLL5_LOCK);
+	       CCM_PLL5_CTRL_N(clk_rate * 2 / 24), ccm + CCU_H6_PLL5_CFG);
+	mctl_await_completion(ccm + CCU_H6_PLL5_CFG,
+			      CCM_PLL5_LOCK, CCM_PLL5_LOCK);
 
 	/* Configure DRAM mod clock */
-	writel(DRAM_CLK_SRC_PLL5, &ccm->dram_clk_cfg);
-	writel(BIT(RESET_SHIFT), &ccm->dram_gate_reset);
+	writel(DRAM_CLK_SRC_PLL5, ccm + CCU_H6_DRAM_CLK_CFG);
+	writel(BIT(RESET_SHIFT), ccm + CCU_H6_DRAM_GATE_RESET);
 	udelay(5);
-	setbits_le32(&ccm->dram_gate_reset, BIT(GATE_SHIFT));
+	setbits_le32(ccm + CCU_H6_DRAM_GATE_RESET, BIT(GATE_SHIFT));
 
 	/* Disable all channels */
 	writel(0, &mctl_com->maer0);
@@ -128,12 +128,12 @@ static void mctl_sys_init(u32 clk_rate)
 	writel(0, &mctl_com->maer2);
 
 	/* Configure MBUS and enable DRAM mod reset */
-	setbits_le32(&ccm->mbus_cfg, MBUS_RESET);
-	setbits_le32(&ccm->mbus_cfg, MBUS_ENABLE);
+	setbits_le32(ccm + CCU_H6_MBUS_CFG, MBUS_RESET);
+	setbits_le32(ccm + CCU_H6_MBUS_CFG, MBUS_ENABLE);
 
 	clrbits_le32(&mctl_com->unk_0x500, BIT(25));
 
-	setbits_le32(&ccm->dram_clk_cfg, DRAM_MOD_RESET);
+	setbits_le32(ccm + CCU_H6_DRAM_CLK_CFG, DRAM_MOD_RESET);
 	udelay(5);
 
 	/* Unknown hack, which enables access of mctl_ctl regs */
-- 
2.46.3

