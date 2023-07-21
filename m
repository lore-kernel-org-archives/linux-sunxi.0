Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D5819A1F
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Jul 2023 13:47:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 333C2D75;
	Fri, 21 Jul 2023 06:48:03 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 763913F6C4;
	Fri, 21 Jul 2023 06:47:18 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	u-boot@lists.denx.de
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Maxim Kiselev <bigunclemax@gmail.com>,
	Sam Edwards <cfsworks@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 13/20] sunxi: clock: h6: prepare for PRCM less SoCs
Date: Fri, 21 Jul 2023 14:45:59 +0100
Message-Id: <20230721134606.4505-14-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20230721134606.4505-1-andre.przywara@arm.com>
References: <20230721134606.4505-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner D1/R528/T113 SoCs have a very minimal separate
"management" power plane, with almost no device attached to it (so
no r_i2c or r_uart). This means we don't need to flip any clock gates in
the PRCM block, which in fact those SoCs do not have.

Prepare the code for those SoCs by making the PRCM block optional in the
H6 SPL clock code, which we otherwise share to this new family of SoCs.
If the memory map (cpu.h) does not define the PRCM address, we simply
skip any attempt to program gates there.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/clock_sun50i_h6.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-sunxi/clock_sun50i_h6.c b/arch/arm/mach-sunxi/clock_sun50i_h6.c
index 607efe6a9c1..c3a4623d345 100644
--- a/arch/arm/mach-sunxi/clock_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/clock_sun50i_h6.c
@@ -4,14 +4,20 @@
 #include <asm/arch/clock.h>
 #include <asm/arch/prcm.h>
 
+#ifndef SUNXI_PRCM_BASE
+#define SUNXI_PRCM_BASE 0
+#endif
+
 #ifdef CONFIG_SPL_BUILD
-void clock_init_safe(void)
+
+static void clock_init_safe_prcm(void)
 {
-	struct sunxi_ccm_reg *const ccm =
-		(struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
 	struct sunxi_prcm_reg *const prcm =
 		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
 
+	if (!prcm)
+		return;
+
 	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616)) {
 		/* this seems to enable PLLs on H616 */
 		setbits_le32(&prcm->sys_pwroff_gating, 0x10);
@@ -27,6 +33,14 @@ void clock_init_safe(void)
 		/* set PLL VDD LDO output to 1.14 V */
 		setbits_le32(&prcm->pll_ldo_cfg, 0x60000);
 	}
+}
+
+void clock_init_safe(void)
+{
+	struct sunxi_ccm_reg *const ccm =
+		(struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
+
+	clock_init_safe_prcm();
 
 	clock_set_pll1(408000000);
 
@@ -141,6 +155,8 @@ int clock_twi_onoff(int port, int state)
 	value = BIT(GATE_SHIFT) | BIT (RESET_SHIFT);
 
 	if (port == 5) {
+		if (!prcm)
+			return -ENODEV;
 		shift = 0;
 		ptr = &prcm->twi_gate_reset;
 	} else {
-- 
2.35.8

