Received: from smtpbg587.qq.com (smtpbg128.qq.com [106.55.201.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5DF29D6
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 06:32:21 +0000 (UTC)
X-QQ-mid: bizesmtp46t1626935443t0lacna6
Received: from localhost.localdomain (unknown [14.154.30.9])
	by esmtp6.qq.com (ESMTP) with 
	id ; Thu, 22 Jul 2021 14:30:41 +0800 (CST)
X-QQ-SSF: 01100000002000104000B00A0000000
X-QQ-FEAT: 2OeORpo34phn4B6wGmJPJvUBLs3B4X3JradJGN/F26huEDmkWNvEiPjKCBaIM
	gK2DWiQO3Arcu5MgR+S2AlcLVhPILKp5Tye63EQ7wBVyRQCSZoyC+aaqbj9FWcMs6UiiOu1
	it3TUtJW2yhRHFjCS8AMFhhj+h06kPaDBUDwFMuQW1ElZ+d0irkiJR6EML0tLkwGTQXYlBH
	KFRSsleqII83k1MU1pqAdAhWzcuUeSkLDZm+FQ81vGDkYeuEWxx0dXG6URTdTUquGlehMgt
	JH8x/4lJuYnkGxv272VtpQ0IfS1EDcGkHMpGUNl2b7aBI4COK7QqRIMIvFVgj8gF8Dr6E7I
	PFBCDAL+AikasU8Iz0=
X-QQ-GoodBg: 0
From: Icenowy Zheng <icenowy@sipeed.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@sipeed.com>
Subject: [RFC PATCH 07/13] sunxi: add support for R329 DRAM controller
Date: Thu, 22 Jul 2021 14:30:09 +0800
Message-Id: <20210722063015.421923-8-icenowy@sipeed.com>
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
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam5

R329 has a new DRAM controller, which looks like a combination of the
H6/H616 MCTL_COM part and the SUNXI_DW MCTL_CTL part. This design has
already got reused by Allwinner, and V831/V833 SoCs have similar
memory controller.

Add support for it. To prepare for further support of other SoCs,
routines with socid parameter are added, although not checked now.

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 arch/arm/include/asm/arch-sunxi/cpu.h         |   1 +
 arch/arm/include/asm/arch-sunxi/dram.h        |   2 +
 .../include/asm/arch-sunxi/dram_sun50i_r329.h | 232 +++++++++++
 arch/arm/mach-sunxi/Kconfig                   |  16 +-
 arch/arm/mach-sunxi/Makefile                  |   2 +
 arch/arm/mach-sunxi/dram_sun50i_r329.c        | 377 ++++++++++++++++++
 arch/arm/mach-sunxi/dram_timings/Makefile     |   1 +
 arch/arm/mach-sunxi/dram_timings/ddr3_r329.c  |  89 +++++
 8 files changed, 719 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/include/asm/arch-sunxi/dram_sun50i_r329.h
 create mode 100644 arch/arm/mach-sunxi/dram_sun50i_r329.c
 create mode 100644 arch/arm/mach-sunxi/dram_timings/ddr3_r329.c

diff --git a/arch/arm/include/asm/arch-sunxi/cpu.h b/arch/arm/include/asm/arch-sunxi/cpu.h
index 20d04cac74..a968af6012 100644
--- a/arch/arm/include/asm/arch-sunxi/cpu.h
+++ b/arch/arm/include/asm/arch-sunxi/cpu.h
@@ -21,5 +21,6 @@
 #define SOCID_V3S	0x1681
 #define SOCID_H5	0x1718
 #define SOCID_R40	0x1701
+#define SOCID_R329	0x1851
 
 #endif /* _SUNXI_CPU_H */
diff --git a/arch/arm/include/asm/arch-sunxi/dram.h b/arch/arm/include/asm/arch-sunxi/dram.h
index c3b3e1f512..36549a47c5 100644
--- a/arch/arm/include/asm/arch-sunxi/dram.h
+++ b/arch/arm/include/asm/arch-sunxi/dram.h
@@ -31,6 +31,8 @@
 #include <asm/arch/dram_sun50i_h6.h>
 #elif defined(CONFIG_MACH_SUN50I_H616)
 #include <asm/arch/dram_sun50i_h616.h>
+#elif defined(CONFIG_MACH_SUN50I_R329)
+#include <asm/arch/dram_sun50i_r329.h>
 #else
 #include <asm/arch/dram_sun4i.h>
 #endif
diff --git a/arch/arm/include/asm/arch-sunxi/dram_sun50i_r329.h b/arch/arm/include/asm/arch-sunxi/dram_sun50i_r329.h
new file mode 100644
index 0000000000..723c687670
--- /dev/null
+++ b/arch/arm/include/asm/arch-sunxi/dram_sun50i_r329.h
@@ -0,0 +1,232 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * sun50i R329 platform dram controller register and constant defines
+ *
+ * (C) Copyright 2021 Sipeed
+ * 
+ * based on dram_sun50i_h6.h, which is:
+ *   (C) Copyright 2017  Icenowy Zheng <icenowy@aosc.io>
+ *
+ * based on dram_sun8i_h3.h, which is:
+ *   (C) Copyright 2007-2015 Allwinner Technology Co.
+ *                           Jerry Wang <wangflord@allwinnertech.com>
+ *   (C) Copyright 2015      Vishnu Patekar <vishnupatekar0510@gmail.com>
+ *   (C) Copyright 2014-2015 Hans de Goede <hdegoede@redhat.com>
+ *   (C) Copyright 2015      Jens Kuske <jenskuske@gmail.com>
+ */
+
+#ifndef _SUNXI_DRAM_SUN8I_H3_H
+#define _SUNXI_DRAM_SUN8I_H3_H
+
+#include <linux/bitops.h>
+
+struct sunxi_mctl_com_reg {
+	u32 cr;			/* 0x000 control register */
+	u32 cr_r1;		/* 0x004 control register for 2nd rank */
+	u32 unk_0x008;		/* 0x008 */
+	u32 tmr;		/* 0x00c timer register */
+	u8 reserved_0x010[4];	/* 0x010 */
+	u32 unk_0x014;		/* 0x014 */
+	u8 reserved_0x018[8];	/* 0x018 */
+	u32 maer0;		/* 0x020 master enable register 0 */
+	u32 maer1;		/* 0x024 master enable register 1 */
+	u32 maer2;		/* 0x028 master enable register 2 */
+	u8 reserved_0x02c[468];	/* 0x02c */
+	u32 bwcr;		/* 0x200 bandwidth control register */
+	u8 reserved_0x204[12];	/* 0x204 */
+	/*
+	 * The last master configured by BSP libdram is at 0x49x, so the
+	 * size of this struct array is set to 41 (0x29) now.
+	 */
+	struct {
+		u32 cfg0;		/* 0x0 */
+		u32 cfg1;		/* 0x4 */
+		u8 reserved_0x8[8];	/* 0x8 */
+	} master[41];		/* 0x210 + index * 0x10 */
+};
+check_member(sunxi_mctl_com_reg, master[40].reserved_0x8, 0x498);
+
+#define MCTL_CR_BL8		(0x4 << 20)
+
+#define MCTL_CR_1T		(0x1 << 19)
+#define MCTL_CR_2T		(0x0 << 19)
+
+#define MCTL_CR_LPDDR3		(0x7 << 16)
+#define MCTL_CR_LPDDR2		(0x6 << 16)
+#define MCTL_CR_DDR3		(0x3 << 16)
+#define MCTL_CR_DDR2		(0x2 << 16)
+
+#define MCTL_CR_SEQUENTIAL	(0x1 << 15)
+#define MCTL_CR_INTERLEAVED	(0x0 << 15)
+
+#define MCTL_CR_FULL_WIDTH	(0x1 << 12)
+#define MCTL_CR_HALF_WIDTH	(0x0 << 12)
+#define MCTL_CR_BUS_FULL_WIDTH(x)	((x) << 12)
+
+#define MCTL_CR_PAGE_SIZE(x)	((fls(x) - 4) << 8)
+#define MCTL_CR_ROW_BITS(x)	(((x) - 1) << 4)
+#define MCTL_CR_EIGHT_BANKS	(0x1 << 2)
+#define MCTL_CR_FOUR_BANKS	(0x0 << 2)
+#define MCTL_CR_DUAL_RANK	(0x1 << 0)
+#define MCTL_CR_SINGLE_RANK	(0x0 << 0)
+
+struct sunxi_mctl_ctl_reg {
+	u32 pir;		/* 0x00 PHY initialization register */
+	u32 pwrctl;		/* 0x04 */
+	u32 mrctrl;		/* 0x08 */
+	u32 clken;		/* 0x0c */
+	u32 pgsr[2];		/* 0x10 PHY general status registers */
+	u32 statr;		/* 0x18 */
+	u8 res1[0x10];		/* 0x1c */
+	u32 lp3mr11;		/* 0x2c */
+	u32 mr[4];		/* 0x30 mode registers */
+	u32 pllgcr;		/* 0x40 */
+	u32 ptr[5];		/* 0x44 PHY timing registers */
+	u32 dramtmg[9];		/* 0x58 DRAM timing registers */
+	u32 odtcfg;		/* 0x7c */
+	u32 pitmg[2];		/* 0x80 PHY interface timing registers */
+	u8 res2[0x4];		/* 0x88 */
+	u32 rfshctl0;		/* 0x8c */
+	u32 rfshtmg[2];		/* 0x90 refresh timing */
+	u32 pwrtmg;		/* 0x98 */
+	u8 res3[0x4];		/* 0x9c */
+	u32 unk_0x0a0;		/* 0xa0 */
+	u8 res3_1[0x14];	/* 0xa4 */
+	u32 vtfcr;		/* 0xb8 (unused on H3) */
+	u32 dqsgmr;		/* 0xbc */
+	u32 dtcr;		/* 0xc0 */
+	u32 dtar[4];		/* 0xc4 */
+	u32 dtdr[2];		/* 0xd4 */
+	u32 dtmr[2];		/* 0xdc */
+	u32 dtbmr;		/* 0xe4 */
+	u32 catr[2];		/* 0xe8 */
+	u32 dtedr[2];		/* 0xf0 */
+	u8 res4[0x8];		/* 0xf8 */
+	u32 pgcr[4];		/* 0x100 PHY general configuration registers */
+	u32 iovcr[2];		/* 0x110 */
+	u32 dqsdr;		/* 0x118 */
+	u32 dxccr;		/* 0x11c */
+	u32 odtmap;		/* 0x120 */
+	u32 zqctl[2];		/* 0x124 */
+	u8 res6[0x14];		/* 0x12c */
+	u32 zqcr;		/* 0x140 ZQ control register */
+	u32 zqsr;		/* 0x144 ZQ status register */
+	u32 zqdr[3];		/* 0x148 ZQ data registers */
+	u8 res7[0x6c];		/* 0x154 */
+	u32 sched;		/* 0x1c0 */
+	u32 perfhpr[2];		/* 0x1c4 */
+	u32 perflpr[2];		/* 0x1cc */
+	u32 perfwr[2];		/* 0x1d4 */
+	u8 res8[0x24];		/* 0x1dc */
+	u32 acmdlr;		/* 0x200 AC master delay line register */
+	u32 aclcdlr;		/* 0x204 AC local calibrated delay line register */
+	u32 aciocr;		/* 0x208 AC I/O configuration register */
+	u8 res9[0x4];		/* 0x20c */
+	u32 acbdlr[31];		/* 0x210 AC bit delay line registers */
+	u8 res10[0x74];		/* 0x28c */
+	struct {		/* 0x300 DATX8 modules*/
+		u32 mdlr;		/* 0x00 master delay line register */
+		u32 lcdlr[3];		/* 0x04 local calibrated delay line registers */
+		u32 bdlr[11];		/* 0x10 bit delay line registers */
+		u32 sdlr;		/* 0x3c output enable bit delay registers */
+		u32 gtr;		/* 0x40 general timing register */
+		u32 gcr;		/* 0x44 general configuration register */
+		u32 gsr[3];		/* 0x48 general status registers */
+		u8 res0[0x2c];		/* 0x54 */
+	} dx[4];
+	u8 res11[0x388];	/* 0x500 */
+	u32 upd2;		/* 0x888 */
+};
+check_member(sunxi_mctl_ctl_reg, upd2, 0x888);
+
+#define PTR3_TDINIT1(x)		((x) << 20)
+#define PTR3_TDINIT0(x)		((x) <<  0)
+
+#define PTR4_TDINIT3(x)		((x) << 20)
+#define PTR4_TDINIT2(x)		((x) <<  0)
+
+#define DRAMTMG0_TWTP(x)	((x) << 24)
+#define DRAMTMG0_TFAW(x)	((x) << 16)
+#define DRAMTMG0_TRAS_MAX(x)	((x) <<  8)
+#define DRAMTMG0_TRAS(x)	((x) <<  0)
+
+#define DRAMTMG1_TXP(x)		((x) << 16)
+#define DRAMTMG1_TRTP(x)	((x) <<  8)
+#define DRAMTMG1_TRC(x)		((x) <<  0)
+
+#define DRAMTMG2_TCWL(x)	((x) << 24)
+#define DRAMTMG2_TCL(x)		((x) << 16)
+#define DRAMTMG2_TRD2WR(x)	((x) <<  8)
+#define DRAMTMG2_TWR2RD(x)	((x) <<  0)
+
+#define DRAMTMG3_TMRW(x)	((x) << 16)
+#define DRAMTMG3_TMRD(x)	((x) << 12)
+#define DRAMTMG3_TMOD(x)	((x) <<  0)
+
+#define DRAMTMG4_TRCD(x)	((x) << 24)
+#define DRAMTMG4_TCCD(x)	((x) << 16)
+#define DRAMTMG4_TRRD(x)	((x) <<  8)
+#define DRAMTMG4_TRP(x)		((x) <<  0)
+
+#define DRAMTMG5_TCKSRX(x)	((x) << 24)
+#define DRAMTMG5_TCKSRE(x)	((x) << 16)
+#define DRAMTMG5_TCKESR(x)	((x) <<  8)
+#define DRAMTMG5_TCKE(x)	((x) <<  0)
+
+#define RFSHTMG_TREFI(x)	((x) << 16)
+#define RFSHTMG_TRFC(x)		((x) <<  0)
+
+#define PIR_CLRSR	(0x1 << 27)	/* clear status registers */
+#define PIR_QSGATE	(0x1 << 10)	/* Read DQS gate training */
+#define PIR_DRAMINIT	(0x1 << 8)	/* DRAM initialization */
+#define PIR_DRAMRST	(0x1 << 7)	/* DRAM reset */
+#define PIR_PHYRST	(0x1 << 6)	/* PHY reset */
+#define PIR_DCAL	(0x1 << 5)	/* DDL calibration */
+#define PIR_PLLINIT	(0x1 << 4)	/* PLL initialization */
+#define PIR_ZCAL	(0x1 << 1)	/* ZQ calibration */
+#define PIR_INIT	(0x1 << 0)	/* PHY initialization trigger */
+
+#define PGSR_INIT_DONE	(0x1 << 0)	/* PHY init done */
+
+#define ZQCR_PWRDOWN	(1U << 31)	/* ZQ power down */
+
+#define ACBDLR_WRITE_DELAY(x)	((x) << 8)
+
+#define DXBDLR_DQ(x)	(x)		/* DQ0-7 BDLR index */
+#define DXBDLR_DM	8		/* DM BDLR index */
+#define DXBDLR_DQS	9		/* DQS BDLR index */
+#define DXBDLR_DQSN	10		/* DQSN BDLR index */
+
+#define DXBDLR_WRITE_DELAY(x)	((x) << 8)
+#define DXBDLR_READ_DELAY(x)	((x) << 0)
+
+/*
+ * The delay parameters below allow to allegedly specify delay times of some
+ * unknown unit for each individual bit trace in each of the four data bytes
+ * the 32-bit wide access consists of. Also three control signals can be
+ * adjusted individually.
+ */
+#define NR_OF_BYTE_LANES	(32 / BITS_PER_BYTE)
+/* The eight data lines (DQn) plus DM, DQS and DQSN */
+#define LINES_PER_BYTE_LANE	(BITS_PER_BYTE + 3)
+struct dram_para {
+	u16 page_size;
+	u8 bus_full_width;
+	u8 dual_rank;
+	u8 row_bits;
+	u8 bank_bits;
+	const u8 dx_read_delays[NR_OF_BYTE_LANES][LINES_PER_BYTE_LANE];
+	const u8 dx_write_delays[NR_OF_BYTE_LANES][LINES_PER_BYTE_LANE];
+	const u8 ac_delays[31];
+};
+
+static inline int ns_to_t(int nanoseconds)
+{
+	const unsigned int ctrl_freq = CONFIG_DRAM_CLK / 2;
+
+	return DIV_ROUND_UP(ctrl_freq * nanoseconds, 1000);
+}
+
+void mctl_set_timing_params(uint16_t socid, struct dram_para *para);
+
+#endif /* _SUNXI_DRAM_SUN8I_H3_H */
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 391a3dd9e5..c9bb47a8bd 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -54,6 +54,12 @@ config DRAM_SUN50I_H616
 	  Select this dram controller driver for some sun50i platforms,
 	  like H616.
 
+config DRAM_SUN50I_R329
+	bool
+	help
+	  Select this dram controller driver for some sun50i platforms,
+	  like R329.
+
 if DRAM_SUN50I_H616
 config DRAM_SUN50I_H616_WRITE_LEVELING
 	bool "H616 DRAM write leveling"
@@ -402,7 +408,7 @@ config ARM_BOOT_HOOK_RMR
 	This allows both the SPL and the U-Boot proper to be entered in
 	either mode and switch to AArch64 if needed.
 
-if SUNXI_DRAM_DW || DRAM_SUN50I_H6
+if SUNXI_DRAM_DW || DRAM_SUN50I_H6 || DRAM_SUN50I_R329
 config SUNXI_DRAM_DDR3
 	bool
 
@@ -424,6 +430,14 @@ config SUNXI_DRAM_DDR3_1333
 	This option is the original only supported memory type, which suits
 	many H3/H5/A64 boards available now.
 
+config SUNXI_DRAM_DDR3_R329
+	bool "DDR3 found in R329 chip"
+	select SUNXI_DRAM_DDR3
+	depends on DRAM_SUN50I_R329
+	---help---
+	This option is only for the DDR3 memory chip which is co-packaged in
+	Allwinner R329 SoC.
+
 config SUNXI_DRAM_LPDDR3_STOCK
 	bool "LPDDR3 with Allwinner stock configuration"
 	select SUNXI_DRAM_LPDDR3
diff --git a/arch/arm/mach-sunxi/Makefile b/arch/arm/mach-sunxi/Makefile
index 3f081d92f3..f90393cbbc 100644
--- a/arch/arm/mach-sunxi/Makefile
+++ b/arch/arm/mach-sunxi/Makefile
@@ -42,4 +42,6 @@ obj-$(CONFIG_DRAM_SUN50I_H6)	+= dram_sun50i_h6.o
 obj-$(CONFIG_DRAM_SUN50I_H6)	+= dram_timings/
 obj-$(CONFIG_DRAM_SUN50I_H616)	+= dram_sun50i_h616.o
 obj-$(CONFIG_DRAM_SUN50I_H616)	+= dram_timings/
+obj-$(CONFIG_DRAM_SUN50I_R329)	+= dram_sun50i_r329.o
+obj-$(CONFIG_DRAM_SUN50I_R329)	+= dram_timings/
 endif
diff --git a/arch/arm/mach-sunxi/dram_sun50i_r329.c b/arch/arm/mach-sunxi/dram_sun50i_r329.c
new file mode 100644
index 0000000000..730883999c
--- /dev/null
+++ b/arch/arm/mach-sunxi/dram_sun50i_r329.c
@@ -0,0 +1,377 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * sun50i R329 platform dram controller init
+ *
+ * (C) Copyright 2921 Sipeed
+ *
+ * Based on dram_sunxi_dw.c, which is:
+ *   (C) Copyright 2007-2015 Allwinner Technology Co.
+ *                           Jerry Wang <wangflord@allwinnertech.com>
+ *   (C) Copyright 2015      Vishnu Patekar <vishnupatekar0510@gmail.com>
+ *   (C) Copyright 2015      Hans de Goede <hdegoede@redhat.com>
+ *   (C) Copyright 2015      Jens Kuske <jenskuske@gmail.com>
+ */
+#include <common.h>
+#include <init.h>
+#include <log.h>
+#include <asm/io.h>
+#include <asm/arch/clock.h>
+#include <asm/arch/dram.h>
+#include <asm/arch/cpu.h>
+#include <asm/arch/prcm.h>
+#include <linux/delay.h>
+#include <linux/kconfig.h>
+
+static void mctl_phy_init(u32 val)
+{
+	struct sunxi_mctl_ctl_reg * const mctl_ctl =
+			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
+
+	writel(val | PIR_INIT, &mctl_ctl->pir);
+	mctl_await_completion(&mctl_ctl->pgsr[0], PGSR_INIT_DONE, 0x1);
+}
+
+static void mctl_set_bit_delays(struct dram_para *para)
+{
+	struct sunxi_mctl_ctl_reg * const mctl_ctl =
+			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
+	int i, j;
+
+	clrbits_le32(&mctl_ctl->pgcr[0], 1 << 26);
+
+	for (i = 0; i < NR_OF_BYTE_LANES; i++)
+		for (j = 0; j < LINES_PER_BYTE_LANE; j++)
+			writel(DXBDLR_WRITE_DELAY(para->dx_write_delays[i][j]) |
+			       DXBDLR_READ_DELAY(para->dx_read_delays[i][j]),
+			       &mctl_ctl->dx[i].bdlr[j]);
+
+	for (i = 0; i < 31; i++)
+		writel(ACBDLR_WRITE_DELAY(para->ac_delays[i]),
+		       &mctl_ctl->acbdlr[i]);
+
+	/* DQSn, DMn, DQn output enable bit delay */
+	writel(0x4 << 24, &mctl_ctl->dx[0].sdlr);
+	writel(0x2 << 24, &mctl_ctl->dx[1].sdlr);
+
+	setbits_le32(&mctl_ctl->pgcr[0], 1 << 26);
+}
+
+static void mctl_apply_para(struct dram_para *para)
+{
+	struct sunxi_mctl_com_reg * const mctl_com =
+			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
+	struct sunxi_mctl_ctl_reg * const mctl_ctl =
+			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
+
+	clrsetbits_le32(&mctl_com->unk_0x008, 0x3f00, 0x2000);
+
+	writel(MCTL_CR_BL8 | MCTL_CR_INTERLEAVED |
+#if defined CONFIG_SUNXI_DRAM_DDR2
+	       MCTL_CR_DDR2 | MCTL_CR_2T |
+#elif defined CONFIG_SUNXI_DRAM_DDR3
+	       MCTL_CR_DDR3 | MCTL_CR_2T |
+#else
+#error Unsupported DRAM type!
+#endif
+	       (para->bank_bits == 3 ? MCTL_CR_EIGHT_BANKS : MCTL_CR_FOUR_BANKS) |
+	       MCTL_CR_BUS_FULL_WIDTH(para->bus_full_width) |
+	       (para->dual_rank ? MCTL_CR_DUAL_RANK : MCTL_CR_SINGLE_RANK) |
+	       MCTL_CR_PAGE_SIZE(para->page_size) |
+	       MCTL_CR_ROW_BITS(para->row_bits), &mctl_com->cr);
+
+	if (para->dual_rank)
+		writel(0x00000303, &mctl_ctl->odtmap);
+	else
+		writel(0x00000201, &mctl_ctl->odtmap);
+
+	if (!para->bus_full_width)
+		writel(0x0, &mctl_ctl->dx[1].gcr);
+
+	/* TODO: asymmetric dual rank */
+}
+
+static uint32_t mctl_r329_round_dram_clk(void)
+{
+	const int base_clk[] = {1200000, 800000, 516096, 1548288};
+	const int target_clk = CONFIG_DRAM_CLK * 2 * 1000;
+	int best_error = target_clk;
+	int best_mux = 0, best_n = 0, best_m = 0;
+
+	for (int mux = 0; mux < 4; mux++) {
+		for (int n = 0; n < 4; n++) {
+			for (int m = 0; m < 4; m++) {
+				int clk = base_clk[mux] / (1 << n) / (m + 1);
+				int error = target_clk - clk;
+
+				/* We shouldn't accept a higher result */
+				if (clk > target_clk)
+					continue;
+
+				if (error < best_error) {
+					best_error = error;
+					best_mux = mux;
+					best_n = n;
+					best_m = m;
+				}
+			}
+		}
+	}
+
+	return (((uint32_t) best_mux) << 24) | 
+	       (((uint32_t) best_n) << 8) |
+	       ((uint32_t) best_m);
+}
+
+static void mctl_sys_init(struct dram_para *para)
+{
+	struct sunxi_ccm_reg * const ccm =
+			(struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
+	struct sunxi_mctl_com_reg * const mctl_com =
+			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
+	struct sunxi_mctl_ctl_reg * const mctl_ctl =
+			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
+	struct sunxi_prcm_reg * const prcm =
+			(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
+
+	/*
+	 * These PLL2 values is the used by Allwinner BSP.
+	 *
+	 * The clock rate is 1548288 kHz according to BSP kernel.
+	 */
+
+	/* Enable PLL */
+	writel(0x09023f00, &prcm->pll2_cfg);
+	writel(0xc0070624, &prcm->pll2_pat0);
+	writel(0x0, &prcm->pll2_pat1);
+	udelay(5);
+	setbits_le32(&prcm->pll2_cfg, BIT(31) | BIT(29));
+	mctl_await_completion(&prcm->pll2_cfg, BIT(28), BIT(28));
+
+	/* Put all DRAM-related blocks to reset state */
+	clrbits_le32(&ccm->mbus_cfg, MBUS_ENABLE | MBUS_RESET);
+	clrbits_le32(&ccm->dram_gate_reset, BIT(0));
+	udelay(5);
+	writel(0, &ccm->dram_gate_reset);
+	clrbits_le32(&ccm->dram_clk_cfg, DRAM_MOD_RESET);
+	udelay(5);
+	clrbits_le32(&ccm->dram_clk_cfg, BIT(31));
+	udelay(5);
+	setbits_le32(&ccm->dram_clk_cfg, DRAM_CLK_UPDATE);
+
+	/* Configure DRAM mod clock */
+	writel(mctl_r329_round_dram_clk(), &ccm->dram_clk_cfg);
+
+	/* Disable all masters */
+	writel(1, &mctl_com->maer0);
+	writel(0, &mctl_com->maer1);
+	writel(0, &mctl_com->maer2);
+
+	/* Configure MBUS and enable DRAM mod gate and reset */
+	setbits_le32(&ccm->dram_gate_reset, BIT(RESET_SHIFT));
+	setbits_le32(&ccm->mbus_cfg, MBUS_RESET);
+	setbits_le32(&ccm->dram_clk_cfg, DRAM_MOD_RESET);
+	setbits_le32(&ccm->dram_gate_reset, BIT(0));
+	setbits_le32(&ccm->dram_clk_cfg, BIT(31));
+	setbits_le32(&ccm->dram_clk_cfg, DRAM_CLK_UPDATE);
+
+	/* Unknown hack from the BSP, which enables access of mctl_ctl regs */
+	writel(0x8000, &mctl_ctl->clken);
+}
+
+static void mctl_set_ddr3_magic(void)
+{
+	uint32_t magic_val_from_sid = (readl(SUNXI_SID_BASE + 0x20) >> 24) & 0xf;
+	if (magic_val_from_sid < 0xc) {
+		writel(0x08d08c40, SUNXI_DRAM_COM_BASE + 0x500);
+		writel(0x240030c5, SUNXI_DRAM_COM_BASE + 0x504);
+		writel(0x00000107, SUNXI_DRAM_COM_BASE + 0x508);
+		writel(0x2b4b4d60, SUNXI_DRAM_COM_BASE + 0x50c);
+		writel(0x08d08c41, SUNXI_DRAM_COM_BASE + 0x500);
+	} else if (magic_val_from_sid == 0xc) {
+		writel(0x02d20ca0, SUNXI_DRAM_COM_BASE + 0x500);
+		writel(0x24851cc2, SUNXI_DRAM_COM_BASE + 0x504);
+		writel(0x000031c9, SUNXI_DRAM_COM_BASE + 0x508);
+		writel(0x2b4b4573, SUNXI_DRAM_COM_BASE + 0x50c);
+		writel(0x02d20ca1, SUNXI_DRAM_COM_BASE + 0x500);
+	}
+}
+
+/* These are more guessed based on some Allwinner code. */
+#define DX_GCR_ODT_DYNAMIC	(0x0 << 4)
+#define DX_GCR_ODT_ALWAYS_ON	(0x1 << 4)
+#define DX_GCR_ODT_OFF		(0x2 << 4)
+
+static int mctl_channel_init(uint16_t socid, struct dram_para *para)
+{
+	struct sunxi_mctl_com_reg * const mctl_com =
+			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
+	struct sunxi_mctl_ctl_reg * const mctl_ctl =
+			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
+
+	unsigned int i;
+
+	clrsetbits_le32(&mctl_ctl->iovcr[0], 0x7f7f7f7f, 0x48484848);
+	clrsetbits_le32(&mctl_ctl->iovcr[1], 0x7f, 0x48);
+
+	mctl_apply_para(para);
+#ifdef CONFIG_SUNXI_DRAM_DDR3
+	mctl_set_ddr3_magic();
+#endif
+	mctl_set_timing_params(socid, para);
+
+	clrsetbits_le32(&mctl_com->tmr, 0xfff, (CONFIG_DRAM_CLK / 2));
+
+	/* dphy & aphy phase select ? */
+	clrsetbits_le32(&mctl_ctl->pgcr[2], (0x3 << 10) | (0x3 << 8),
+			(0x0 << 10) | (0x3 << 8));
+
+	/* set dramc odt */
+	for (i = 0; i < 4; i++) {
+		u32 clearmask = 0xf61e;
+		u32 setmask = IS_ENABLED(CONFIG_DRAM_ODT_EN) ?
+				DX_GCR_ODT_DYNAMIC : DX_GCR_ODT_OFF;
+		if (CONFIG_DRAM_CLK > 672)
+			setmask |= 0x400;
+
+		clrsetbits_le32(&mctl_ctl->dx[i].gcr, clearmask, setmask);
+	}
+
+	/* AC PDR should always ON */
+	clrsetbits_le32(&mctl_ctl->aciocr, 0, 0x1 << 1);
+
+	mctl_set_bit_delays(para);
+
+	/* set DQS auto gating PD mode */
+	setbits_le32(&mctl_ctl->pgcr[2], 0x3 << 6);
+
+	/* data training configuration */
+	clrsetbits_le32(&mctl_ctl->dtcr, 0x0fffffff,
+			(para->dual_rank ? 0x3 : 0x1) << 24 | 1);
+
+	udelay(50);
+
+	clrsetbits_le32(&mctl_ctl->zqcr, 0x3ffffff, 0x2000000 | CONFIG_DRAM_ZQ);
+
+	mctl_phy_init(PIR_ZCAL | PIR_PLLINIT | PIR_DCAL | PIR_PHYRST |
+		      PIR_QSGATE | PIR_DRAMRST | PIR_DRAMINIT);
+	if (readl(&mctl_ctl->pgsr[0]) & (0xfe << 20))
+		return 1;
+
+	/* check the dramc status */
+	mctl_await_completion(&mctl_ctl->statr, 0x1, 0x1);
+
+	/* liuke added for refresh debug */
+	setbits_le32(&mctl_ctl->rfshctl0, 0x1 << 31);
+	udelay(10);
+	clrbits_le32(&mctl_ctl->rfshctl0, 0x1 << 31);
+	udelay(10);
+
+	setbits_le32(&mctl_com->unk_0x014, BIT(31));
+
+	clrbits_le32(&mctl_ctl->pgcr[3], 0x06000000);
+
+	return 0;
+}
+
+static void mctl_auto_detect_dram_size(struct dram_para *para)
+{
+	/* detect row address bits */
+	para->page_size = 512;
+	para->row_bits = 16;
+	para->bank_bits = 2;
+	mctl_apply_para(para);
+
+	for (para->row_bits = 11; para->row_bits < 16; para->row_bits++)
+		if (mctl_mem_matches((1 << (para->row_bits + para->bank_bits)) * para->page_size))
+			break;
+
+	/* detect bank address bits */
+	para->bank_bits = 3;
+	mctl_apply_para(para);
+
+	for (para->bank_bits = 2; para->bank_bits < 3; para->bank_bits++)
+		if (mctl_mem_matches((1 << para->bank_bits) * para->page_size))
+			break;
+
+	/* detect page size */
+	para->page_size = 8192;
+	mctl_apply_para(para);
+
+	for (para->page_size = 512; para->page_size < 8192; para->page_size *= 2)
+		if (mctl_mem_matches(para->page_size))
+			break;
+}
+
+#define SUN50I_R329_DX_READ_DELAYS					\
+	{{ 10, 10, 10, 10, 10, 10, 10, 10, 10,  0,  0 },	\
+	 { 10, 10, 10, 10, 10, 10, 10, 10, 10,  0,  0 },	\
+	 {  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 },	\
+	 {  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 }}
+#define SUN50I_R329_DX_WRITE_DELAYS				\
+	{{  0,  0,  0,  0,  0,  0,  0,  0,  0,  4,  0 },	\
+	 {  0,  0,  0,  0,  0,  0,  0,  0,  0,  4,  0 },	\
+	 {  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 },	\
+	 {  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 }}
+#define SUN50I_R329_AC_DELAYS					\
+	{  0,  0,  0,  0,  0,  0,  0,  0,			\
+	   0,  0,  0,  0,  0,  0,  0,  0,			\
+	   0,  0,  0,  0,  0,  0,  0,  0,			\
+	   0,  0,  0,  0,  0,  0,  0      }
+
+unsigned long sunxi_dram_init(void)
+{
+	struct sunxi_mctl_com_reg * const mctl_com =
+			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
+	struct sunxi_mctl_ctl_reg * const mctl_ctl =
+			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
+
+	struct dram_para para = {
+		.dual_rank = 0,
+		.bus_full_width = 1,
+		.row_bits = 16,
+		.bank_bits = 3,
+		.page_size = 8192,
+
+		.dx_read_delays  = SUN50I_R329_DX_READ_DELAYS,
+		.dx_write_delays = SUN50I_R329_DX_WRITE_DELAYS,
+		.ac_delays	 = SUN50I_R329_AC_DELAYS,
+	};
+
+	/* Unknown magic */
+	writel(0x10, 0x07010250);
+	writel(0x330000, 0x07010310);
+	writel(0x330003, 0x07010310);
+
+#if defined(CONFIG_MACH_SUN50I_R329)
+	uint16_t socid = SOCID_R329;
+#endif
+
+	mctl_sys_init(&para);
+	if (mctl_channel_init(socid, &para))
+		return 0;
+
+	udelay(1);
+
+	clrbits_le32(&mctl_ctl->unk_0x0a0, 0xffff);
+	clrbits_le32(&mctl_ctl->pwrctl, 0x1);
+
+	/* HDR/DDR dynamic mode */
+	clrbits_le32(&mctl_ctl->pgcr[0], 0xf000);
+
+	/* power down zq calibration module for power save */
+	setbits_le32(&mctl_ctl->zqcr, ZQCR_PWRDOWN);
+
+	/* DQ hold disable (tpr13[26] == 1) */
+	clrbits_le32(&mctl_ctl->pgcr[2], (1 << 13));
+
+	mctl_auto_detect_dram_size(&para);
+	mctl_apply_para(&para);
+
+	/* enable master access */
+	writel(0xffffffff, &mctl_com->maer0);
+	writel(0x7f, &mctl_com->maer1);
+	writel(0xffff, &mctl_com->maer2);
+
+	return (1UL << (para.row_bits + para.bank_bits)) * para.page_size *
+	       (para.dual_rank ? 2 : 1);
+}
diff --git a/arch/arm/mach-sunxi/dram_timings/Makefile b/arch/arm/mach-sunxi/dram_timings/Makefile
index 39a8756c29..32d5f15c61 100644
--- a/arch/arm/mach-sunxi/dram_timings/Makefile
+++ b/arch/arm/mach-sunxi/dram_timings/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_SUNXI_DRAM_DDR3_1333)	+= ddr3_1333.o
+obj-$(CONFIG_SUNXI_DRAM_DDR3_R329)	+= ddr3_r329.o
 obj-$(CONFIG_SUNXI_DRAM_LPDDR3_STOCK)	+= lpddr3_stock.o
 obj-$(CONFIG_SUNXI_DRAM_DDR2_V3S)	+= ddr2_v3s.o
 obj-$(CONFIG_SUNXI_DRAM_H6_LPDDR3)	+= h6_lpddr3.o
diff --git a/arch/arm/mach-sunxi/dram_timings/ddr3_r329.c b/arch/arm/mach-sunxi/dram_timings/ddr3_r329.c
new file mode 100644
index 0000000000..e8a34e7da3
--- /dev/null
+++ b/arch/arm/mach-sunxi/dram_timings/ddr3_r329.c
@@ -0,0 +1,89 @@
+#include <common.h>
+#include <asm/arch/dram.h>
+#include <asm/arch/cpu.h>
+
+void mctl_set_timing_params(uint16_t socid, struct dram_para *para)
+{
+	struct sunxi_mctl_ctl_reg * const mctl_ctl =
+			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
+
+	u8 tccd		= 2;
+	u8 tfaw		= ns_to_t(50);
+	u8 trrd		= max(ns_to_t(10), 2);
+	u8 trcd		= ns_to_t(15);
+	u8 trc		= ns_to_t(53);
+	u8 txp		= max(ns_to_t(8), 2);
+	u8 twtr		= max(ns_to_t(8), 2);
+	u8 trtp		= max(ns_to_t(8), 2);
+	u8 twr		= max(ns_to_t(15), 2);
+	u8 trp		= ns_to_t(15);
+	u8 tras		= ns_to_t(38);
+	u16 trefi	= ns_to_t(7800) / 32 + 1;
+	u16 trfc	= ns_to_t(350);
+
+	u8 tmrw		= 0;
+	u8 tmrd		= 4;
+	u8 tmod		= 12;
+	u8 tcke		= 3;
+	u8 tcksrx	= 5;
+	u8 tcksre	= 5;
+	u8 tckesr	= 4;
+	u8 trasmax	= 25;
+
+	u8 tcl		= 6; /* CL 12 */
+	u8 tcwl		= 4; /* CWL 8 */
+	u8 t_rdata_en	= 4;
+	u8 wr_latency	= 2;
+
+	u32 tdinit0	= (500 * CONFIG_DRAM_CLK) + 1;		/* 500us */
+	u32 tdinit1	= (360 * CONFIG_DRAM_CLK) / 1000 + 1;	/* 360ns */
+	u32 tdinit2	= (200 * CONFIG_DRAM_CLK) + 1;		/* 200us */
+	u32 tdinit3	= (1 * CONFIG_DRAM_CLK) + 1;		/* 1us */
+
+	u8 twtp		= tcwl + 2 + twr;	/* WL + BL / 2 + tWR */
+	u8 twr2rd	= tcwl + 2 + twtr;	/* WL + BL / 2 + tWTR */
+	u8 trd2wr	= 5;
+
+	if (trtp < tcl + 2 - trp)
+		trtp = tcl + 2 - trp;
+	
+	/* set mode register */
+	writel(0x1c70, &mctl_ctl->mr[0]);	/* CL=11, WR=12 */
+	writel(0x2, &mctl_ctl->mr[1]);
+	writel(0x18, &mctl_ctl->mr[2]);		/* CWL=8 */
+	writel(0x0, &mctl_ctl->mr[3]);
+
+	/* set DRAM timing */
+	writel(DRAMTMG0_TWTP(twtp) | DRAMTMG0_TFAW(tfaw) |
+	       DRAMTMG0_TRAS_MAX(trasmax) | DRAMTMG0_TRAS(tras),
+	       &mctl_ctl->dramtmg[0]);
+	writel(DRAMTMG1_TXP(txp) | DRAMTMG1_TRTP(trtp) | DRAMTMG1_TRC(trc),
+	       &mctl_ctl->dramtmg[1]);
+	writel(DRAMTMG2_TCWL(tcwl) | DRAMTMG2_TCL(tcl) |
+	       DRAMTMG2_TRD2WR(trd2wr) | DRAMTMG2_TWR2RD(twr2rd),
+	       &mctl_ctl->dramtmg[2]);
+	writel(DRAMTMG3_TMRW(tmrw) | DRAMTMG3_TMRD(tmrd) | DRAMTMG3_TMOD(tmod),
+	       &mctl_ctl->dramtmg[3]);
+	writel(DRAMTMG4_TRCD(trcd) | DRAMTMG4_TCCD(tccd) | DRAMTMG4_TRRD(trrd) |
+	       DRAMTMG4_TRP(trp), &mctl_ctl->dramtmg[4]);
+	writel(DRAMTMG5_TCKSRX(tcksrx) | DRAMTMG5_TCKSRE(tcksre) |
+	       DRAMTMG5_TCKESR(tckesr) | DRAMTMG5_TCKE(tcke),
+	       &mctl_ctl->dramtmg[5]);
+
+	/* set two rank timing */
+	clrsetbits_le32(&mctl_ctl->dramtmg[8], (0xf0 << 24) | (0xff << 8) | (0xff << 0),
+			(0xf0 << 24) | (0x66 << 8) | (0x10 << 0));
+
+
+	/* set PHY interface timing, write latency and read latency configure */
+	writel((0x2 << 24) | (t_rdata_en << 16) | (0x1 << 8) |
+	       (wr_latency << 0), &mctl_ctl->pitmg[0]);
+
+	/* set PHY timing, PTR0-2 use default */
+	writel(PTR3_TDINIT0(tdinit0) | PTR3_TDINIT1(tdinit1), &mctl_ctl->ptr[3]);
+	writel(PTR4_TDINIT2(tdinit2) | PTR4_TDINIT3(tdinit3), &mctl_ctl->ptr[4]);
+
+	/* set refresh timing */
+	writel(RFSHTMG_TREFI(trefi) | RFSHTMG_TRFC(trfc), &mctl_ctl->rfshtmg[0]);
+	writel((trefi / 2) << 16, &mctl_ctl->rfshtmg[1]);
+}
-- 
2.30.2

