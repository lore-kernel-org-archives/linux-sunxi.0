Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E602CA5
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Feb 2022 01:41:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E663F1424;
	Mon, 31 Jan 2022 17:41:41 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34B6B3F73B;
	Mon, 31 Jan 2022 17:41:40 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Icenowy Zheng <icenowy@aosc.io>,
	Jesse Taube <mr.bossman075@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 3/5] sunxi: move early "SRAM setup" into separate file
Date: Tue,  1 Feb 2022 01:41:14 +0000
Message-Id: <20220201014116.25864-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20220201014116.25864-1-andre.przywara@arm.com>
References: <20220201014116.25864-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Currently we do some magic "SRAM setup" MMIO writes in s_init(), copied
from the original BSP U-Boot. The comment speaks of this being required
before DRAM access gets enabled, but there is no indication that this
would actually be required that early.

Move this out of s_init(), into board_init_f(). Since this actually only
affects a very few older SoCs, the actual code goes into the cpu/armv7
directory, to move it out of the way for all other SoCs.

This also uses the opportunity to convert some #ifdefs over to the fancy
IS_ENABLED() macros used in actual C code.

We keep the s_init() stub around for now, since armv8's lowlevel_init
still relies on it.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
Tested-by: Simon Glass <sjg@chromium.org>
---
 arch/arm/cpu/armv7/sunxi/Makefile           |  3 ++
 arch/arm/cpu/armv7/sunxi/sram.c             | 40 +++++++++++++++++++++
 arch/arm/include/asm/arch-sunxi/cpu_sun4i.h |  1 +
 arch/arm/mach-sunxi/board.c                 | 38 ++++----------------
 4 files changed, 50 insertions(+), 32 deletions(-)
 create mode 100644 arch/arm/cpu/armv7/sunxi/sram.c

diff --git a/arch/arm/cpu/armv7/sunxi/Makefile b/arch/arm/cpu/armv7/sunxi/Makefile
index 1d40d6a18dc..ad11be78632 100644
--- a/arch/arm/cpu/armv7/sunxi/Makefile
+++ b/arch/arm/cpu/armv7/sunxi/Makefile
@@ -10,6 +10,9 @@ obj-y	+= timer.o
 obj-$(CONFIG_MACH_SUN6I)	+= tzpc.o
 obj-$(CONFIG_MACH_SUN8I_H3)	+= tzpc.o
 
+obj-$(CONFIG_MACH_SUN6I)	+= sram.o
+obj-$(CONFIG_MACH_SUN8I)	+= sram.o
+
 ifndef CONFIG_SPL_BUILD
 obj-$(CONFIG_ARMV7_PSCI)	+= psci.o
 endif
diff --git a/arch/arm/cpu/armv7/sunxi/sram.c b/arch/arm/cpu/armv7/sunxi/sram.c
new file mode 100644
index 00000000000..28564c2846a
--- /dev/null
+++ b/arch/arm/cpu/armv7/sunxi/sram.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * (C) Copyright 2012 Henrik Nordstrom <henrik@henriknordstrom.net>
+ *
+ * (C) Copyright 2007-2011
+ * Allwinner Technology Co., Ltd. <www.allwinnertech.com>
+ * Tom Cubie <tangliang@allwinnertech.com>
+ *
+ * SRAM init for older sunxi SoCs.
+ */
+
+#include <common.h>
+#include <init.h>
+#include <asm/io.h>
+
+void sunxi_sram_init(void)
+{
+	/*
+	 * Undocumented magic taken from boot0, without this DRAM
+	 * access gets messed up (seems cache related).
+	 * The boot0 sources describe this as: "config ema for cache sram"
+	 * Newer SoCs (A83T, H3 and anything beyond) don't need this anymore.
+	 */
+	if (IS_ENABLED(CONFIG_MACH_SUN6I))
+		setbits_le32(SUNXI_SRAMC_BASE + 0x44, 0x1800);
+
+	if (IS_ENABLED(CONFIG_MACH_SUN8I)) {
+		uint version = sunxi_get_sram_id();
+
+		if (IS_ENABLED(CONFIG_MACH_SUN8I_A23)) {
+			if (version == 0x1650)
+				setbits_le32(SUNXI_SRAMC_BASE + 0x44, 0x1800);
+			else /* 0x1661 ? */
+				setbits_le32(SUNXI_SRAMC_BASE + 0x44, 0xc0);
+		} else if (IS_ENABLED(CONFIG_MACH_SUN8I_A33)) {
+			if (version != 0x1667)
+				setbits_le32(SUNXI_SRAMC_BASE + 0x44, 0xc0);
+		}
+	}
+}
diff --git a/arch/arm/include/asm/arch-sunxi/cpu_sun4i.h b/arch/arm/include/asm/arch-sunxi/cpu_sun4i.h
index d4c795d89cb..4430013b6bc 100644
--- a/arch/arm/include/asm/arch-sunxi/cpu_sun4i.h
+++ b/arch/arm/include/asm/arch-sunxi/cpu_sun4i.h
@@ -226,6 +226,7 @@ void sunxi_board_init(void);
 void sunxi_reset(void);
 int sunxi_get_ss_bonding_id(void);
 int sunxi_get_sid(unsigned int *sid);
+unsigned int sunxi_get_sram_id(void);
 #endif /* __ASSEMBLY__ */
 
 #endif /* _SUNXI_CPU_SUN4I_H */
diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index 261af9d7bf4..fab38f50898 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -186,38 +186,6 @@ SPL_LOAD_IMAGE_METHOD("FEL", 0, BOOT_DEVICE_BOARD, spl_board_load_image);
 
 void s_init(void)
 {
-	/*
-	 * Undocumented magic taken from boot0, without this DRAM
-	 * access gets messed up (seems cache related).
-	 * The boot0 sources describe this as: "config ema for cache sram"
-	 */
-#if defined CONFIG_MACH_SUN6I
-	setbits_le32(SUNXI_SRAMC_BASE + 0x44, 0x1800);
-#elif defined CONFIG_MACH_SUN8I
-	__maybe_unused uint version;
-
-	/* Unlock sram version info reg, read it, relock */
-	setbits_le32(SUNXI_SRAMC_BASE + 0x24, (1 << 15));
-	version = readl(SUNXI_SRAMC_BASE + 0x24) >> 16;
-	clrbits_le32(SUNXI_SRAMC_BASE + 0x24, (1 << 15));
-
-	/*
-	 * Ideally this would be a switch case, but we do not know exactly
-	 * which versions there are and which version needs which settings,
-	 * so reproduce the per SoC code from the BSP.
-	 */
-#if defined CONFIG_MACH_SUN8I_A23
-	if (version == 0x1650)
-		setbits_le32(SUNXI_SRAMC_BASE + 0x44, 0x1800);
-	else /* 0x1661 ? */
-		setbits_le32(SUNXI_SRAMC_BASE + 0x44, 0xc0);
-#elif defined CONFIG_MACH_SUN8I_A33
-	if (version != 0x1667)
-		setbits_le32(SUNXI_SRAMC_BASE + 0x44, 0xc0);
-#endif
-	/* A83T BSP never modifies SUNXI_SRAMC_BASE + 0x44 */
-	/* No H3 BSP, boot0 seems to not modify SUNXI_SRAMC_BASE + 0x44 */
-#endif
 }
 
 #define SUNXI_INVALID_BOOT_SOURCE	-1
@@ -312,8 +280,14 @@ u32 spl_boot_device(void)
 	return sunxi_get_boot_device();
 }
 
+__weak void sunxi_sram_init(void)
+{
+}
+
 void board_init_f(ulong dummy)
 {
+	sunxi_sram_init();
+
 #if defined CONFIG_MACH_SUN6I || defined CONFIG_MACH_SUN8I_H3
 	/* Enable non-secure access to some peripherals */
 	tzpc_init();
-- 
2.17.6

