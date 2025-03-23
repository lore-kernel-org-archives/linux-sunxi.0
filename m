Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681B12045BA
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729778; cv=none; b=htykS6lKUCUGA+Q8lWNHwfQNAYIRl5hD1c4wxsoDFycTN5QSaweYfJeg5fH2bdjs5VGUTSdhKoQbJwKqGFsKxhxkDNNvd2aAeynk6xu5B+FmfdSXfUsZQXZ6B/PKLapaJkl6SsuRaaxb9KGD8kzLSE+iuL3m9o8RFS28yYn5NqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729778; c=relaxed/simple;
	bh=JLGGHHuk7ZA2UfItr1jldedoCvs0T6934nMFTqMGR9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZbh5Se2eB59EUlXDLeS+3IBC7rx7M/b2HWKdAqzNQ5gWHn6jxHdPneHxhXYjOdCXwOheCCQodV+HNxOwPPZoqcLAXsnpsWTQrIeOcUP/PT6px/GH1MZAhMoAu1zZzcW79J7d5kst59gj41QGwdGxSPYmWPiAeZezNcHW+2AJb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B8B1106F;
	Sun, 23 Mar 2025 04:36:22 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C23783F694;
	Sun, 23 Mar 2025 04:36:14 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 04/34] sunxi: H6: dram: remove usage of struct sunxi_ccm_reg
Date: Sun, 23 Mar 2025 11:35:14 +0000
Message-ID: <20250323113544.7933-5-andre.przywara@arm.com>
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

The Allwinner H6 DRAM initialisation code uses a complex C struct,
modelling the clock device's register frame. For this SoC, the struct
contains 127 registers, but the DRAM code only uses four of them.

Since we want to get rid of this struct, drop the usage of the struct in
the H6 DRAM code, by using #define'd register names and their offset, and
then adding those names to the base pointer.

This removes one more user of the clock register struct.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/dram_sun50i_h6.c | 32 ++++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/mach-sunxi/dram_sun50i_h6.c b/arch/arm/mach-sunxi/dram_sun50i_h6.c
index e7862bd06ea..35f7a247718 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h6.c
@@ -152,34 +152,34 @@ static void mctl_set_master_priority(void)
 
 static void mctl_sys_init(struct dram_para *para)
 {
-	struct sunxi_ccm_reg * const ccm =
-			(struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
+	void * const ccm = (void *)SUNXI_CCM_BASE;
 	struct sunxi_mctl_com_reg * const mctl_com =
 			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
 	struct sunxi_mctl_ctl_reg * const mctl_ctl =
 			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
 
 	/* Put all DRAM-related blocks to reset state */
-	clrbits_le32(&ccm->mbus_cfg, MBUS_ENABLE | MBUS_RESET);
-	clrbits_le32(&ccm->dram_gate_reset, BIT(0));
+	clrbits_le32(ccm + CCU_H6_MBUS_CFG, MBUS_ENABLE | MBUS_RESET);
+	clrbits_le32(ccm + CCU_H6_DRAM_GATE_RESET, BIT(0));
 	udelay(5);
-	writel(0, &ccm->dram_gate_reset);
-	clrbits_le32(&ccm->pll5_cfg, CCM_PLL5_CTRL_EN);
-	clrbits_le32(&ccm->dram_clk_cfg, DRAM_MOD_RESET);
+	writel(0, ccm + CCU_H6_DRAM_GATE_RESET);
+	clrbits_le32(ccm + CCU_H6_PLL5_CFG, CCM_PLL5_CTRL_EN);
+	clrbits_le32(ccm + CCU_H6_DRAM_CLK_CFG, DRAM_MOD_RESET);
 
 	udelay(5);
 
 	/* Set PLL5 rate to doubled DRAM clock rate */
 	writel(CCM_PLL5_CTRL_EN | CCM_PLL5_LOCK_EN |
-	       CCM_PLL5_CTRL_N(para->clk * 2 / 24), &ccm->pll5_cfg);
-	mctl_await_completion(&ccm->pll5_cfg, CCM_PLL5_LOCK, CCM_PLL5_LOCK);
+	       CCM_PLL5_CTRL_N(para->clk * 2 / 24), ccm + CCU_H6_PLL5_CFG);
+	mctl_await_completion(ccm + CCU_H6_PLL5_CFG,
+			      CCM_PLL5_LOCK, CCM_PLL5_LOCK);
 
 	/* Configure DRAM mod clock */
-	writel(DRAM_CLK_SRC_PLL5, &ccm->dram_clk_cfg);
-	setbits_le32(&ccm->dram_clk_cfg, DRAM_CLK_UPDATE);
-	writel(BIT(RESET_SHIFT), &ccm->dram_gate_reset);
+	writel(DRAM_CLK_SRC_PLL5, ccm + CCU_H6_DRAM_CLK_CFG);
+	setbits_le32(ccm + CCU_H6_DRAM_CLK_CFG, DRAM_CLK_UPDATE);
+	writel(BIT(RESET_SHIFT), ccm + CCU_H6_DRAM_GATE_RESET);
 	udelay(5);
-	setbits_le32(&ccm->dram_gate_reset, BIT(0));
+	setbits_le32(ccm + CCU_H6_DRAM_GATE_RESET, BIT(0));
 
 	/* Disable all channels */
 	writel(0, &mctl_com->maer0);
@@ -187,9 +187,9 @@ static void mctl_sys_init(struct dram_para *para)
 	writel(0, &mctl_com->maer2);
 
 	/* Configure MBUS and enable DRAM mod reset */
-	setbits_le32(&ccm->mbus_cfg, MBUS_RESET);
-	setbits_le32(&ccm->mbus_cfg, MBUS_ENABLE);
-	setbits_le32(&ccm->dram_clk_cfg, DRAM_MOD_RESET);
+	setbits_le32(ccm + CCU_H6_MBUS_CFG, MBUS_RESET);
+	setbits_le32(ccm + CCU_H6_MBUS_CFG, MBUS_ENABLE);
+	setbits_le32(ccm + CCU_H6_DRAM_CLK_CFG, DRAM_MOD_RESET);
 	udelay(5);
 
 	/* Unknown hack from the BSP, which enables access of mctl_ctl regs */
-- 
2.46.3

