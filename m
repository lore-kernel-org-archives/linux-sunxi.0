Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC5920408D
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729781; cv=none; b=AR2VrV23rM93K+CGlPXLXAXgyzkLBmUi9t/OJOXp7y9YMXDFNzrJEWIOyW01j45R02I5L6MDjQAXqXk0I3bz1TG5sTZFmaM/kJK4ZA5bgAc0/4iBLK8arS9Nj58RqG3pqwhQdz0CB1J/c0ND7LxM8huLTdo0pmAgcg5Bmnn3CR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729781; c=relaxed/simple;
	bh=nrF7RMYJQ9sA/Pb3ncQxRdWl5daZWVY9DJKJEWMd5cU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLIr4+0ziJaz+vmTjlxwvwpNXFspJ178cdx+/7qjXuwgXqI7NwmaT17PtgqR7GpugCsigSHpVEHUQUf2w6lfV0vp+9cTYWyShUlFZDBKXsVjSv8WSm1J9SfokGm2Qwt8IyV7KA3MUq8ngnjgtg0tjfpBxsR/jJv/cFl4i+nJUeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 009BD339;
	Sun, 23 Mar 2025 04:36:25 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4143C3F694;
	Sun, 23 Mar 2025 04:36:17 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 06/34] sunxi: clock: H6: drop usage of struct sunxi_prcm_reg
Date: Sun, 23 Mar 2025 11:35:16 +0000
Message-ID: <20250323113544.7933-7-andre.przywara@arm.com>
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

U-Boot drivers often revert to using C structures for modelling hardware
register frames. This creates some problems:
- A "struct" is a C language construct to group several variables
  together. The details of the layout of this struct are partly subject
  to the compiler's discretion (padding and alignment).
- The "packed" attribute would force a certain layout, but we are not
  using it.
- The actual source of information from the data sheet is the register
  offset. Here we create an artificial struct, carefully tuning the
  layout (with a lot of reserved members) to match that offset. To help
  with correctness, we put the desired information as a *comment*,
  though this is purely for the human reader, and has no effect on the
  generated layout. This sounds all very backwards.
- Using a struct suggests we can assign a pointer and then access the
  register content via the members. But this is not the case, instead
  every MMIO register access must go through specific accessor functions,
  to meet the ordering and access size guarantees the hardware requires.
- We share those structs in code shared across multiple SoC families,
  though most SoCs define their own version of the struct. Members must
  match in their name, across every SoC, otherwise compilation will fail.
  We work around this with even more #ifdefs in the shared code.
- Some SoCs have an *almost* identical layout, but differ in a few
  registers. This requires hard to maintain #ifdef's in the struct
  definition.
- Some of the register frames are huge: the H6 CCU device defines 127
  registers. We use 15 of them. Still the whole frame would need to be
  described, which is very tedious, but for no reason.
- Adding a new SoC often forces people to decide whether to share an
  existing struct, or to create a new copy. For some cases (say like 80%
  similarity) this works out badly either way.

The Linux kernel heavily frowns upon those register structs, and instead
uses a much simpler solution: #define REG_NAME  <offset>
This easily maps to the actual information from the data sheet, and can
much simpler be shared across multiple SoCs, as it allows to have all
SoC versions visible, so we can use C "if" statements instead of #ifdef's.
Also it requires to just define the registers we need, and we can use
alternative locations for some registers much more easily.

Drop the usage of "struct sunxi_prcm_reg" in the H6 SPL clock code, by
defining the respective register names and their offsets, then adding
them to the base pointer.
We cannot drop the struct definition quite yet, as it's also used in
other drivers, still.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/include/asm/arch-sunxi/prcm_sun50i.h |  5 +++++
 arch/arm/mach-sunxi/clock_sun50i_h6.c         | 20 +++++++++----------
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/prcm_sun50i.h b/arch/arm/include/asm/arch-sunxi/prcm_sun50i.h
index fd63d3aad83..8ed78dccf10 100644
--- a/arch/arm/include/asm/arch-sunxi/prcm_sun50i.h
+++ b/arch/arm/include/asm/arch-sunxi/prcm_sun50i.h
@@ -11,6 +11,11 @@
 #ifndef __ASSEMBLY__
 #include <linux/compiler.h>
 
+#define CCU_PRCM_I2C_GATE_RESET		0x19c
+#define CCU_PRCM_PLL_LDO_CFG		0x244
+#define CCU_PRCM_SYS_PWROFF_GATING	0x250
+#define CCU_PRCM_RES_CAL_CTRL		0x310
+
 struct sunxi_prcm_reg {
 	u32 cpus_cfg;		/* 0x000 */
 	u8 res0[0x8];		/* 0x004 */
diff --git a/arch/arm/mach-sunxi/clock_sun50i_h6.c b/arch/arm/mach-sunxi/clock_sun50i_h6.c
index 482d9e0c695..615c13b5da0 100644
--- a/arch/arm/mach-sunxi/clock_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/clock_sun50i_h6.c
@@ -7,26 +7,25 @@
 void clock_init_safe(void)
 {
 	void *const ccm = (void *)SUNXI_CCM_BASE;
-	struct sunxi_prcm_reg *const prcm =
-		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
+	void *const prcm = (void *)SUNXI_PRCM_BASE;
 
 	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616)) {
 		/* this seems to enable PLLs on H616 */
-		setbits_le32(&prcm->sys_pwroff_gating, 0x10);
-		setbits_le32(&prcm->res_cal_ctrl, 2);
+		setbits_le32(prcm + CCU_PRCM_SYS_PWROFF_GATING, 0x10);
+		setbits_le32(prcm + CCU_PRCM_RES_CAL_CTRL, 2);
 	}
 
 	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616) ||
 	    IS_ENABLED(CONFIG_MACH_SUN50I_H6)) {
-		clrbits_le32(&prcm->res_cal_ctrl, 1);
-		setbits_le32(&prcm->res_cal_ctrl, 1);
+		clrbits_le32(prcm + CCU_PRCM_RES_CAL_CTRL, 1);
+		setbits_le32(prcm + CCU_PRCM_RES_CAL_CTRL, 1);
 	}
 
 	if (IS_ENABLED(CONFIG_MACH_SUN50I_H6)) {
 		/* set key field for ldo enable */
-		setbits_le32(&prcm->pll_ldo_cfg, 0xA7000000);
+		setbits_le32(prcm + CCU_PRCM_PLL_LDO_CFG, 0xA7000000);
 		/* set PLL VDD LDO output to 1.14 V */
-		setbits_le32(&prcm->pll_ldo_cfg, 0x60000);
+		setbits_le32(prcm + CCU_PRCM_PLL_LDO_CFG, 0x60000);
 	}
 
 	clock_set_pll1(408000000);
@@ -105,8 +104,7 @@ void clock_set_pll1(unsigned int clk)
 int clock_twi_onoff(int port, int state)
 {
 	void *const ccm = (void *)SUNXI_CCM_BASE;
-	struct sunxi_prcm_reg *const prcm =
-		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
+	void *const prcm = (void *)SUNXI_PRCM_BASE;
 	u32 value, *ptr;
 	int shift;
 
@@ -114,7 +112,7 @@ int clock_twi_onoff(int port, int state)
 
 	if (port == 5) {
 		shift = 0;
-		ptr = &prcm->twi_gate_reset;
+		ptr = prcm + CCU_PRCM_I2C_GATE_RESET;
 	} else {
 		shift = port;
 		ptr = ccm + CCU_H6_I2C_GATE_RESET;
-- 
2.46.3

