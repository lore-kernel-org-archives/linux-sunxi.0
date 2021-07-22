Received: from smtpbg587.qq.com (smtpbg587.qq.com [113.96.223.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA562FB2
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 06:33:05 +0000 (UTC)
X-QQ-mid: bizesmtp46t1626935432tnc7m4c2
Received: from localhost.localdomain (unknown [14.154.30.9])
	by esmtp6.qq.com (ESMTP) with 
	id ; Thu, 22 Jul 2021 14:30:31 +0800 (CST)
X-QQ-SSF: 01100000002000104000B00A0000000
X-QQ-FEAT: tSE3IANCkAtlZIzE6okX3WqWMMw1qN1A01SDDxnRUjm+3vGJF2WWaulHd1jRx
	PuWo0JpR7s+NptQJrXUc8zoLRsy3GCbGkB0fu7LQ2SlCUaPZeDGgHGn46bQequTZotW/NM5
	nSIFMaK1U45yD45icGWrpUtmcnUDB2F514KdLyDeVSjGQNyyLUJmVIw2BEP6+nTyc8Je/qk
	0Kzsxg7OrwmS9ta4LYxEK+6nDcRGEaPO9to8mid6IlxkKXquKmuqMfNBl7RvavfsZkL5DCH
	hyyD2jksdnHM80velooBGgPrTgxN+cB+wK9xzvgC7zqPBwHQ6VCNj7xQFS9+u2mwku4DAwx
	3b3Ax2U16cn7SdPIQ4=
X-QQ-GoodBg: 0
From: Icenowy Zheng <icenowy@sipeed.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@sipeed.com>
Subject: [RFC PATCH 04/13] sunxi: add memory addresses for R329 SoC
Date: Thu, 22 Jul 2021 14:30:06 +0800
Message-Id: <20210722063015.421923-5-icenowy@sipeed.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722063015.421923-1-icenowy@sipeed.com>
References: <20210722063015.421923-1-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam3

Allwinner R329 SoC has a different memory map with previous post-H6
SoCs.

Add the memory map to a dedicated header file, fill everywhere that
uses a hardcoded MMIO address and specify the SPL/ATF load address.

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 arch/arm/cpu/armv8/fel_utils.S                |  2 +-
 arch/arm/dts/sunxi-u-boot.dtsi                |  2 +
 arch/arm/include/asm/arch-sunxi/boot0.h       |  4 +-
 .../include/asm/arch-sunxi/clock_sun50i_h6.h  | 17 ++++++
 arch/arm/include/asm/arch-sunxi/cpu.h         |  2 +
 .../include/asm/arch-sunxi/cpu_sun50i_r329.h  | 58 +++++++++++++++++++
 arch/arm/include/asm/arch-sunxi/prcm_sun50i.h | 33 +++++++++++
 include/configs/sunxi-common.h                |  3 +
 8 files changed, 119 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-sunxi/cpu_sun50i_r329.h

diff --git a/arch/arm/cpu/armv8/fel_utils.S b/arch/arm/cpu/armv8/fel_utils.S
index 7def44ad1d..aa16d79df9 100644
--- a/arch/arm/cpu/armv8/fel_utils.S
+++ b/arch/arm/cpu/armv8/fel_utils.S
@@ -40,7 +40,7 @@ ENTRY(return_to_fel)
 	str	w2, [x1]
 
 	ldr	x0, =0xfa50392f		// CPU hotplug magic
-#ifdef CONFIG_MACH_SUN50I_H616
+#if defined(CONFIG_MACH_SUN50I_H616) || defined(CONFIG_MACH_SUN50I_R329)
 	ldr	x2, =(SUNXI_R_CPUCFG_BASE + 0x1c0)
 	str	w0, [x2], #0x4
 #elif CONFIG_MACH_SUN50I_H6
diff --git a/arch/arm/dts/sunxi-u-boot.dtsi b/arch/arm/dts/sunxi-u-boot.dtsi
index b7244c1112..9bb6fffeb4 100644
--- a/arch/arm/dts/sunxi-u-boot.dtsi
+++ b/arch/arm/dts/sunxi-u-boot.dtsi
@@ -5,6 +5,8 @@
 #define  SCP_ADDR 0x114000
 #elif defined(CONFIG_MACH_SUN50I_H616)
 #define BL31_ADDR 0x40000000
+#elif defined(CONFIG_MACH_SUN50I_R329)
+#define BL31_ADDR 0x124000
 #else
 #define BL31_ADDR  0x44000
 #define  SCP_ADDR  0x50000
diff --git a/arch/arm/include/asm/arch-sunxi/boot0.h b/arch/arm/include/asm/arch-sunxi/boot0.h
index e8e8e38f05..a791c7c403 100644
--- a/arch/arm/include/asm/arch-sunxi/boot0.h
+++ b/arch/arm/include/asm/arch-sunxi/boot0.h
@@ -39,7 +39,9 @@
 	.word	0xf57ff06f	// isb     sy
 	.word	0xe320f003	// wfi
 	.word	0xeafffffd	// b       @wfi
-#ifndef CONFIG_SUN50I_GEN_H6
+#if defined(CONFIG_MACH_SUN50I_R329)
+	.word	0x08100040	// writeable RVBAR mapping address
+#elif !defined(CONFIG_SUN50I_GEN_H6)
 	.word	0x017000a0	// writeable RVBAR mapping address
 #else
 	.word	0x09010040	// writeable RVBAR mapping address
diff --git a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
index 37df4410ea..6c3b8ea351 100644
--- a/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
+++ b/arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h
@@ -250,10 +250,19 @@ struct sunxi_ccm_reg {
 #define CCM_PLL6_LOCK			BIT(28)
 #define CCM_PLL6_CTRL_N_SHIFT		8
 #define CCM_PLL6_CTRL_N_MASK		(0xff << CCM_PLL6_CTRL_N_SHIFT)
+#ifndef CONFIG_MACH_SUN50I_R329
 #define CCM_PLL6_CTRL_DIV1_SHIFT	0
 #define CCM_PLL6_CTRL_DIV1_MASK		(0x1 << CCM_PLL6_CTRL_DIV1_SHIFT)
 #define CCM_PLL6_CTRL_DIV2_SHIFT	1
 #define CCM_PLL6_CTRL_DIV2_MASK		(0x1 << CCM_PLL6_CTRL_DIV2_SHIFT)
+#else
+#define CCM_PLL6_CTRL_M_SHIFT	1
+#define CCM_PLL6_CTRL_M_MASK		(0x1 << CCM_PLL6_CTRL_DIV2_SHIFT)
+#define CCM_PLL6_CTRL_DIV1_SHIFT	16
+#define CCM_PLL6_CTRL_DIV1_MASK		(0x7 << CCM_PLL6_CTRL_DIV1_SHIFT)
+#define CCM_PLL6_CTRL_DIV2_SHIFT	20
+#define CCM_PLL6_CTRL_DIV2_MASK		(0x7 << CCM_PLL6_CTRL_DIV2_SHIFT)
+#endif
 
 /* cpu_axi bit field*/
 #define CCM_CPU_AXI_MUX_MASK		(0x3 << 24)
@@ -285,6 +294,14 @@ struct sunxi_ccm_reg {
 
 /* apb1 bit field */
 #define CCM_APB1_DEFAULT		0x03000102
+#elif CONFIG_MACH_SUN50I_R329
+#define CCM_PLL6_DEFAULT		0xa8216300
+
+/* ahb bit field */
+#define CCM_PSI_AHB1_AHB2_DEFAULT	0x03000002
+
+/* apb1 bit field */
+#define CCM_APB1_DEFAULT		0x02000001
 #endif
 
 /* apb2 bit field */
diff --git a/arch/arm/include/asm/arch-sunxi/cpu.h b/arch/arm/include/asm/arch-sunxi/cpu.h
index b08f202374..20d04cac74 100644
--- a/arch/arm/include/asm/arch-sunxi/cpu.h
+++ b/arch/arm/include/asm/arch-sunxi/cpu.h
@@ -8,6 +8,8 @@
 
 #if defined(CONFIG_MACH_SUN9I)
 #include <asm/arch/cpu_sun9i.h>
+#elif defined(CONFIG_MACH_SUN50I_R329)
+#include <asm/arch/cpu_sun50i_r329.h>
 #elif defined(CONFIG_SUN50I_GEN_H6)
 #include <asm/arch/cpu_sun50i_h6.h>
 #else
diff --git a/arch/arm/include/asm/arch-sunxi/cpu_sun50i_r329.h b/arch/arm/include/asm/arch-sunxi/cpu_sun50i_r329.h
new file mode 100644
index 0000000000..3d2237a59f
--- /dev/null
+++ b/arch/arm/include/asm/arch-sunxi/cpu_sun50i_r329.h
@@ -0,0 +1,58 @@
+/*
+ * (C) Copyright 2021 Sipeed
+ *
+ * SPDX-License-Identifier:	GPL-2.0+
+ */
+
+#ifndef _SUNXI_CPU_SUN50I_H6_H
+#define _SUNXI_CPU_SUN50I_H6_H
+
+#define SUNXI_SRAM_A1_BASE		0x00020000
+#define SUNXI_SRAM_A2_BASE		0x00100000
+
+#define SUNXI_TIMER_BASE		0x02000000
+#define SUNXI_PIO_BASE			0x02000400
+#define SUNXI_CCM_BASE			0x02001000
+
+#define SUNXI_UART0_BASE		0x02500000
+#define SUNXI_UART1_BASE		0x02500400
+#define SUNXI_UART2_BASE		0x02500800
+#define SUNXI_UART3_BASE		0x02500C00
+#define SUNXI_TWI0_BASE			0x02502000
+#define SUNXI_TWI1_BASE			0x02502400
+
+#define SUNXI_SRAMC_BASE		0x03000000
+#define SUNXI_DMA_BASE			0x03002000
+/* SID address space starts at 0x03006000, but e-fuse is at offset 0x200 */
+#define SUNXI_SIDC_BASE			0x03006000
+#define SUNXI_SID_BASE			0x03006200
+
+#define SUNXI_GIC400_BASE		0x03020000
+#define SUNXI_SS_BASE			0x03040000
+#define SUNXI_DRAM_COM_BASE		0x03102000
+#define SUNXI_DRAM_CTL0_BASE		0x03103000
+
+#define SUNXI_NFC_BASE			0x04011000
+#define SUNXI_MMC0_BASE			0x04020000
+#define SUNXI_MMC1_BASE			0x04021000
+#define SUNXI_SPI0_BASE			0x04025000
+#define SUNXI_SPI1_BASE			0x04026000
+#define SUNXI_USB0_BASE			0x04100000
+#define SUNXI_USB1_BASE			0x04201000
+#define SUNXI_GMAC_BASE			0x04500000
+
+#define SUNXI_R_CPUCFG_BASE		0x07000400
+#define SUNXI_PRCM_BASE			0x07010000
+#define SUNXI_R_WDOG_BASE		0x07020400
+#define SUNXI_R_PIO_BASE		0x07022000
+#define SUNXI_R_UART_BASE		0x07080000
+#define SUNXI_R_TWI_BASE		0x07081400
+#define SUNXI_RTC_BASE			0x07090000
+
+#ifndef __ASSEMBLY__
+void sunxi_board_init(void);
+void sunxi_reset(void);
+int sunxi_get_sid(unsigned int *sid);
+#endif
+
+#endif /* _SUNXI_CPU_SUN9I_H */
diff --git a/arch/arm/include/asm/arch-sunxi/prcm_sun50i.h b/arch/arm/include/asm/arch-sunxi/prcm_sun50i.h
index 5f636e8384..1aba5f0122 100644
--- a/arch/arm/include/asm/arch-sunxi/prcm_sun50i.h
+++ b/arch/arm/include/asm/arch-sunxi/prcm_sun50i.h
@@ -37,8 +37,41 @@ struct sunxi_prcm_reg {
 	u32 w1_gate_reset;	/* 0x1ec */
 	u8 res10[0x1c];		/* 0x1f0 */
 	u32 rtc_gate_reset;	/* 0x20c */
+#ifdef CONFIG_MACH_SUN50I_R329
+	u8 res11[0xdf0];	/* 0x210 */
+
+	u32 pll1_cfg;		/* 0x1000 pll1 (cpux) control */
+	u8 reserved_0x1004[0xc];
+	u32 pll6_cfg;		/* 0x1010 pll6 (periph) control */
+	u8 reserved_0x1014[0xc];
+	u32 pll2_cfg;		/* 0x1020 pll2 (audio) control */
+	u8 reserved_0x1024[0xc];
+	u32 pll_audio1_cfg;	/* 0x1030 pll audio1 control */
+	u8 reserved_0x1034[0xdc];
+	u32 pll6_pat0;		/* 0x1110 pll6 (periph) pattern0 */
+	u32 pll6_pat1;		/* 0x1114 pll6 (periph) pattern1 */
+	u8 reserved_0x1118[0x8];
+	u32 pll2_pat0;		/* 0x1120 pll2 (audio) pattern0 */
+	u32 pll2_pat1;		/* 0x1120 pll2 (audio) pattern1 */
+	u8 reserved_0x1128[0x8];
+	u32 pll_audio1_pat0;	/* 0x1130 pll audio1 pattern0 */
+	u32 pll_audio1_pat1;	/* 0x1130 pll audio1 pattern1 */
+	u8 reserved_0x1138[0x1c8];
+	u32 pll1_bias;		/* 0x1300 pll1 (cpux) bias */
+	u8 reserved_0x1304[0xc];
+	u32 pll6_bias;		/* 0x1310 pll6 (periph) bias */
+	u8 reserved_0x1314[0xc];
+	u32 pll2_bias;		/* 0x1320 pll6 (periph0) bias */
+	u8 reserved_0x1324[0xc];
+	u32 pll_audio1_bias;	/* 0x1330 pll audio1 bias */
+	u8 reserved_0x1334[0xcc];
+	u32 pll1_tun;		/* 0x1400 pll1 (cpux) tunning */
+#endif
 };
 check_member(sunxi_prcm_reg, rtc_gate_reset, 0x20c);
+#ifdef CONFIG_MACH_SUN50I_R329
+check_member(sunxi_prcm_reg, pll1_tun, 0x1400);
+#endif
 
 #define PRCM_TWI_GATE		(1 << 0)
 #define PRCM_TWI_RESET		(1 << 16)
diff --git a/include/configs/sunxi-common.h b/include/configs/sunxi-common.h
index 9e37e99684..a114c1addc 100644
--- a/include/configs/sunxi-common.h
+++ b/include/configs/sunxi-common.h
@@ -181,6 +181,9 @@
 /* end of SRAM A2 on H6 for now */
 #define LOW_LEVEL_SRAM_STACK		0x00118000
 #endif
+#elif CONFIG_SUNXI_SRAM_ADDRESS == 0x100000
+#define CONFIG_SPL_MAX_SIZE		0x7fa0		/* 32 KiB */
+#define LOW_LEVEL_SRAM_STACK		0x00120000	/* 64 KiB inside SRAM A2 */
 #else
 #define CONFIG_SPL_MAX_SIZE		0x5fa0		/* 24KB on sun4i/sun7i */
 #define LOW_LEVEL_SRAM_STACK		0x00008000	/* End of sram */
-- 
2.30.2

