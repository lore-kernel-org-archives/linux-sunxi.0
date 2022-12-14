Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1607C
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Dec 2022 00:24:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E62101692;
	Tue, 13 Dec 2022 16:25:25 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58B4F3F71E;
	Tue, 13 Dec 2022 16:24:44 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Tom Rini <trini@konsulko.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 4/4] sunxi: move arch timer setup out of board/ directory
Date: Wed, 14 Dec 2022 00:22:44 +0000
Message-Id: <20221214002244.31479-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20221214002244.31479-1-andre.przywara@arm.com>
References: <20221214002244.31479-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At the moment we have an #ifdef-protected routine in
board/sunxi/board.c, which sets up the arch timer CNTFRQ register, if
that hasn't been done already.
This only applies to ARMv7 SoCs running in secure state, and so is
much better located in the arch/arm/mach-sunxi directory.

Move that routine into a separate function and file in said directory,
which also allows to trigger the compilation for ARMv7 in the Makefile.
Also move the call to it into the arch/arm version of board.c.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/Makefile     |  4 ++++
 arch/arm/mach-sunxi/arch_timer.c | 39 ++++++++++++++++++++++++++++++++
 arch/arm/mach-sunxi/board.c      | 14 ++++++++----
 board/sunxi/board.c              | 34 +---------------------------
 4 files changed, 54 insertions(+), 37 deletions(-)
 create mode 100644 arch/arm/mach-sunxi/arch_timer.c

diff --git a/arch/arm/mach-sunxi/Makefile b/arch/arm/mach-sunxi/Makefile
index 58f807cb82d..335c44476e9 100644
--- a/arch/arm/mach-sunxi/Makefile
+++ b/arch/arm/mach-sunxi/Makefile
@@ -26,8 +26,12 @@ obj-$(CONFIG_MACH_SUN8I)	+= clock_sun6i.o
 endif
 obj-$(CONFIG_MACH_SUN9I)	+= clock_sun9i.o gtbus_sun9i.o
 obj-$(CONFIG_SUN50I_GEN_H6)	+= clock_sun50i_h6.o
+
 ifndef CONFIG_ARM64
 obj-y	+= timer.o
+ifndef CONFIG_MACH_SUNIV
+obj-y	+= arch_timer.o
+endif
 endif
 
 ifdef CONFIG_SPL_BUILD
diff --git a/arch/arm/mach-sunxi/arch_timer.c b/arch/arm/mach-sunxi/arch_timer.c
new file mode 100644
index 00000000000..c0e4310741f
--- /dev/null
+++ b/arch/arm/mach-sunxi/arch_timer.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * ARM Generic Timer CNTFRQ setup
+ *
+ * (C) Copyright 2013 Oliver Schinagl <oliver@schinagl.nl>
+ */
+
+#include <stdint.h>
+#include <log.h>
+#include <asm/armv7.h>
+
+void setup_arch_timer(void)
+{
+	uint32_t id_pfr1, freq;
+
+	asm volatile("mrc p15, 0, %0, c0, c1, 1" : "=r"(id_pfr1));
+	debug("id_pfr1: 0x%08x\n", id_pfr1);
+	/* Generic Timer Extension available? */
+	if (((id_pfr1 >> CPUID_ARM_GENTIMER_SHIFT) & 0xf) == 0)
+		return;
+
+	/*
+	 * CNTFRQ is a secure register, so we will crash if we try to
+	 * write this from the non-secure world (read is OK, though).
+	 * In case some bootcode has already set the correct value,
+	 * we avoid the risk of writing to it.
+	 */
+	asm volatile("mrc p15, 0, %0, c14, c0, 0" : "=r"(freq));
+	if (freq == CONFIG_COUNTER_FREQUENCY)
+		return;
+
+	debug("arch timer frequency is %d Hz, should be %d, fixing ...\n",
+	      freq, CONFIG_COUNTER_FREQUENCY);
+	if (IS_ENABLED(CONFIG_NON_SECURE))
+		printf("arch timer frequency is wrong, but cannot adjust it\n");
+	else
+		asm volatile("mcr p15, 0, %0, c14, c0, 0"
+			     : : "r"(CONFIG_COUNTER_FREQUENCY));
+}
diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
index 0c4b6dd1ca3..943f89eaa78 100644
--- a/arch/arm/mach-sunxi/board.c
+++ b/arch/arm/mach-sunxi/board.c
@@ -347,10 +347,6 @@ u32 spl_boot_device(void)
 	return sunxi_get_boot_device();
 }
 
-__weak void sunxi_sram_init(void)
-{
-}
-
 /*
  * When booting from an eMMC boot partition, the SPL puts the same boot
  * source code into SRAM A1 as when loading the SPL from the normal
@@ -434,10 +430,20 @@ u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
 	return result;
 }
 
+__weak void sunxi_sram_init(void)
+{
+}
+
+__weak void setup_arch_timer(void)
+{
+}
+
 void board_init_f(ulong dummy)
 {
 	sunxi_sram_init();
 
+	setup_arch_timer();
+
 #if defined CONFIG_MACH_SUN6I || defined CONFIG_MACH_SUN8I_H3
 	/* Enable non-secure access to some peripherals */
 	tzpc_init();
diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index 827e545032e..55501fafc38 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -34,9 +34,6 @@
 #include <asm/global_data.h>
 #include <linux/delay.h>
 #include <u-boot/crc.h>
-#ifndef CONFIG_ARM64
-#include <asm/armv7.h>
-#endif
 #include <asm/gpio.h>
 #include <asm/io.h>
 #include <u-boot/crc.h>
@@ -187,39 +184,10 @@ enum env_location env_get_location(enum env_operation op, int prio)
 /* add board specific code here */
 int board_init(void)
 {
-	__maybe_unused int id_pfr1, ret, satapwr_pin, macpwr_pin;
+	int ret, satapwr_pin, macpwr_pin;
 
 	gd->bd->bi_boot_params = (PHYS_SDRAM_0 + 0x100);
 
-#if !defined(CONFIG_ARM64) && !defined(CONFIG_MACH_SUNIV)
-	asm volatile("mrc p15, 0, %0, c0, c1, 1" : "=r"(id_pfr1));
-	debug("id_pfr1: 0x%08x\n", id_pfr1);
-	/* Generic Timer Extension available? */
-	if ((id_pfr1 >> CPUID_ARM_GENTIMER_SHIFT) & 0xf) {
-		uint32_t freq;
-
-		debug("Setting CNTFRQ\n");
-
-		/*
-		 * CNTFRQ is a secure register, so we will crash if we try to
-		 * write this from the non-secure world (read is OK, though).
-		 * In case some bootcode has already set the correct value,
-		 * we avoid the risk of writing to it.
-		 */
-		asm volatile("mrc p15, 0, %0, c14, c0, 0" : "=r"(freq));
-		if (freq != CONFIG_COUNTER_FREQUENCY) {
-			debug("arch timer frequency is %d Hz, should be %d, fixing ...\n",
-			      freq, CONFIG_COUNTER_FREQUENCY);
-#ifdef CONFIG_NON_SECURE
-			printf("arch timer frequency is wrong, but cannot adjust it\n");
-#else
-			asm volatile("mcr p15, 0, %0, c14, c0, 0"
-				     : : "r"(CONFIG_COUNTER_FREQUENCY));
-#endif
-		}
-	}
-#endif /* !CONFIG_ARM64 && !CONFIG_MACH_SUNIV */
-
 	ret = axp_gpio_init();
 	if (ret)
 		return ret;
-- 
2.35.5

