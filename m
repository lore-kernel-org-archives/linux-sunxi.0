Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB48A200130
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729781; cv=none; b=KE2mPqmd6/JTG92+MW/ywzURnlr7Z9ei36iGLpfbl2ET0kyaQx4CcAwgbJxuDBHUrtryhqetCUdAT40wlg8XcXwWQc7I5bud/ILOIKDbfCugnM5p6hI8T1/L4gBWjYxEwqowSDmor3YssCRlyJ5CoS8rybP7jVk/P5Ip8GWGd2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729781; c=relaxed/simple;
	bh=VjRS7yrABqVAPnHlRZf3sOeeTP9f1hMonGaaqryA3tE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rMCuMxNF0fue054QpgEHA3n++hd594E37yYe975dxA7kKL83fO5jhnu5JgR6uErItbNEvuDrmWkT3UaG4gSgFwvW3DS84WFsacTO96D3waVU/adNuUvTH01/Rlf6knOkcCVsGxrdMsBQm89evI8F5+WcMZakLQQVpdzzMVEgA3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 399EB106F;
	Sun, 23 Mar 2025 04:36:26 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 809783F694;
	Sun, 23 Mar 2025 04:36:18 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 07/34] sunxi: H6/H616: dram: remove usage of struct sunxi_prcm_reg
Date: Sun, 23 Mar 2025 11:35:17 +0000
Message-ID: <20250323113544.7933-8-andre.przywara@arm.com>
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

The Allwinner H6 and H616 DRAM initialisation code uses a complex C
struct, modelling the PRCM clock register frame. For those SoCs, this
struct contains 20 registers, but the DRAM code only uses two of them.

Since we want to get rid of this struct, drop the usage of the struct in
the H6 and H616 DRAM code, by using #define'd register names and their
offset, and then adding those names to the base pointer.

This removes one more user of the PRCM clock register struct.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/include/asm/arch-sunxi/prcm_sun50i.h | 1 +
 arch/arm/mach-sunxi/dram_sun50i_h6.c          | 7 +++----
 arch/arm/mach-sunxi/dram_sun50i_h616.c        | 7 +++----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/prcm_sun50i.h b/arch/arm/include/asm/arch-sunxi/prcm_sun50i.h
index 8ed78dccf10..738cd68320c 100644
--- a/arch/arm/include/asm/arch-sunxi/prcm_sun50i.h
+++ b/arch/arm/include/asm/arch-sunxi/prcm_sun50i.h
@@ -15,6 +15,7 @@
 #define CCU_PRCM_PLL_LDO_CFG		0x244
 #define CCU_PRCM_SYS_PWROFF_GATING	0x250
 #define CCU_PRCM_RES_CAL_CTRL		0x310
+#define CCU_PRCM_OHMS240		0x318
 
 struct sunxi_prcm_reg {
 	u32 cpus_cfg;		/* 0x000 */
diff --git a/arch/arm/mach-sunxi/dram_sun50i_h6.c b/arch/arm/mach-sunxi/dram_sun50i_h6.c
index 35f7a247718..5bf932001cb 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h6.c
@@ -665,8 +665,7 @@ unsigned long sunxi_dram_init(void)
 {
 	struct sunxi_mctl_com_reg * const mctl_com =
 			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
-	struct sunxi_prcm_reg *const prcm =
-		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
+	void *const prcm = (void *)SUNXI_PRCM_BASE;
 	struct dram_para para = {
 		.clk = CONFIG_DRAM_CLK,
 #ifdef CONFIG_SUNXI_DRAM_H6_LPDDR3
@@ -682,8 +681,8 @@ unsigned long sunxi_dram_init(void)
 
 	unsigned long size;
 
-	setbits_le32(&prcm->res_cal_ctrl, BIT(8));
-	clrbits_le32(&prcm->ohms240, 0x3f);
+	setbits_le32(prcm + CCU_PRCM_RES_CAL_CTRL, BIT(8));
+	clrbits_le32(prcm + CCU_PRCM_OHMS240, 0x3f);
 
 	mctl_auto_detect_rank_width(&para);
 	mctl_auto_detect_dram_size(&para);
diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index b310c6a7632..ab00bd263f4 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -1423,13 +1423,12 @@ static const struct dram_para para = {
 
 unsigned long sunxi_dram_init(void)
 {
-	struct sunxi_prcm_reg *const prcm =
-		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
+	void *const prcm = (void *)SUNXI_PRCM_BASE;
 	struct dram_config config;
 	unsigned long size;
 
-	setbits_le32(&prcm->res_cal_ctrl, BIT(8));
-	clrbits_le32(&prcm->ohms240, 0x3f);
+	setbits_le32(prcm + CCU_PRCM_RES_CAL_CTRL, BIT(8));
+	clrbits_le32(prcm + CCU_PRCM_OHMS240, 0x3f);
 
 	mctl_auto_detect_rank_width(&para, &config);
 	mctl_auto_detect_dram_size(&para, &config);
-- 
2.46.3

