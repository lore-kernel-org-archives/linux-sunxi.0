Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D8928EA
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 16:35:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A69216F3;
	Wed, 12 Oct 2022 09:35:17 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E7383F766;
	Wed, 12 Oct 2022 09:35:09 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Yifan Gu <me@yifangu.com>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	George Hilliard <thirtythreeforty@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/6] sunxi: Kconfig: introduce SUNXI_MINIMUM_DRAM_MB
Date: Wed, 12 Oct 2022 17:34:53 +0100
Message-Id: <20221012163458.1968900-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221012163458.1968900-1-andre.przywara@arm.com>
References: <20221012163458.1968900-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Traditionally we assumed that every Allwinner board would come with at
least 256 MB of DRAM, and set our DRAM layout accordingly. This affected
both the default load addresses, but also U-Boot's own address
expectations (like being loaded at 160 MB).

Some SoCs come with co-packaged DRAM, but only provide 32 or 64MB. So
far we special-cased those *chips*, as there was only one chip per DRAM
size. However new chips force us to take a more general approach.

Introduce a Kconfig symbol, which provides the minimum DRAM size of the
board. If nothing else is specified, we use 256 MB, and default to
smaller values for those co-packaged SoCs.
Then select the different DRAM maps according to this new symbol, so
that different SoCs with the same DRAM size can share those definitions.

Inspired by an idea from Icenowy.

This is just refactoring: compiled for all boards before and after this
patch: the binaries were identical.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Kconfig                        |  6 +++---
 arch/arm/mach-sunxi/Kconfig    | 12 ++++++++++++
 boot/Kconfig                   |  4 ++--
 include/configs/sunxi-common.h | 31 +++++++++++++++++--------------
 4 files changed, 34 insertions(+), 19 deletions(-)

diff --git a/Kconfig b/Kconfig
index 2ea735d38e4..d297513bac6 100644
--- a/Kconfig
+++ b/Kconfig
@@ -312,9 +312,9 @@ config SYS_MALLOC_LEN
 	default 0x4000000 if SANDBOX
 	default 0x2000000 if ARCH_ROCKCHIP || ARCH_OMAP2PLUS || ARCH_MESON
 	default 0x200000 if ARCH_BMIPS || X86
-	default 0x120000 if MACH_SUNIV
-	default 0x220000 if MACH_SUN8I_V3S
-	default 0x4020000 if ARCH_SUNXI
+	default 0x4020000 if SUNXI_MINIMUM_DRAM_MB >= 256
+	default 0x220000 if SUNXI_MINIMUM_DRAM_MB >= 64
+	default 0x120000 if SUNXI_MINIMUM_DRAM_MB >= 32
 	default 0x400000
 	help
 	  This defines memory to be allocated for Dynamic allocation
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 6b16f43494f..9aa66deb9fd 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -615,6 +615,18 @@ config SYS_BOARD
 config SYS_SOC
 	default "sunxi"
 
+config SUNXI_MINIMUM_DRAM_MB
+	int "minimum DRAM size"
+	default 32 if MACH_SUNIV
+	default 64 if MACH_SUN8I_V3S
+	default 256
+	---help---
+	Minimum DRAM size expected on the board. Traditionally we assumed
+	256 MB, so that U-Boot would load at 160MB. With co-packaged DRAM
+	we have smaller sizes, though, so that U-Boot's own load address and
+	the default payload addresses must be shifted down.
+	This is expected to be fixed by the SoC selection.
+
 config UART0_PORT_F
 	bool "UART0 on MicroSD breakout board"
 	---help---
diff --git a/boot/Kconfig b/boot/Kconfig
index 6b3b8f072cb..45f86e946cd 100644
--- a/boot/Kconfig
+++ b/boot/Kconfig
@@ -499,8 +499,8 @@ config SYS_TEXT_BASE
 	default 0x80800000 if ARCH_OMAP2PLUS || ARCH_K3
 	default 0x81700000 if MACH_SUNIV
 	default 0x2a000000 if MACH_SUN9I
-	default 0x42e00000 if MACH_SUN8I_V3S
-	default 0x4a000000 if ARCH_SUNXI
+	default 0x4a000000 if SUNXI_MINIMUM_DRAM_MB >= 256
+	default 0x42e00000 if SUNXI_MINIMUM_DRAM_MB >= 64
 	hex "Text Base"
 	help
 	  The address in memory that U-Boot will be running from, initially.
diff --git a/include/configs/sunxi-common.h b/include/configs/sunxi-common.h
index 0f0ef4f64bb..416a0422861 100644
--- a/include/configs/sunxi-common.h
+++ b/include/configs/sunxi-common.h
@@ -135,7 +135,21 @@
 #define FDTOVERLAY_ADDR_R __stringify(SDRAM_OFFSET(FE00000))
 #define RAMDISK_ADDR_R    __stringify(SDRAM_OFFSET(FF00000))
 
-#elif defined(CONFIG_MACH_SUN8I_V3S)
+#elif (CONFIG_SUNXI_MINIMUM_DRAM_MB >= 256)
+/*
+ * 160M RAM (256M minimum minus 64MB heap + 32MB for u-boot, stack, fb, etc.
+ * 32M uncompressed kernel, 16M compressed kernel, 1M fdt,
+ * 1M script, 1M pxe, 1M dt overlay and the ramdisk at the end.
+ */
+#define BOOTM_SIZE        __stringify(0xa000000)
+#define KERNEL_ADDR_R     __stringify(SDRAM_OFFSET(2000000))
+#define FDT_ADDR_R        __stringify(SDRAM_OFFSET(3000000))
+#define SCRIPT_ADDR_R     __stringify(SDRAM_OFFSET(3100000))
+#define PXEFILE_ADDR_R    __stringify(SDRAM_OFFSET(3200000))
+#define FDTOVERLAY_ADDR_R __stringify(SDRAM_OFFSET(3300000))
+#define RAMDISK_ADDR_R    __stringify(SDRAM_OFFSET(3400000))
+
+#elif (CONFIG_SUNXI_MINIMUM_DRAM_MB >= 64)
 /*
  * 64M RAM minus 2MB heap + 16MB for u-boot, stack, fb, etc.
  * 16M uncompressed kernel, 8M compressed kernel, 1M fdt,
@@ -149,7 +163,7 @@
 #define FDTOVERLAY_ADDR_R __stringify(SDRAM_OFFSET(1B00000))
 #define RAMDISK_ADDR_R    __stringify(SDRAM_OFFSET(1C00000))
 
-#elif defined(CONFIG_MACH_SUNIV)
+#elif (CONFIG_SUNXI_MINIMUM_DRAM_MB >= 32)
 /*
  * 32M RAM minus 1MB heap + 8MB for u-boot, stack, fb, etc.
  * 8M uncompressed kernel, 4M compressed kernel, 512K fdt,
@@ -164,18 +178,7 @@
 #define RAMDISK_ADDR_R    __stringify(SDRAM_OFFSET(0D60000))
 
 #else
-/*
- * 160M RAM (256M minimum minus 64MB heap + 32MB for u-boot, stack, fb, etc.
- * 32M uncompressed kernel, 16M compressed kernel, 1M fdt,
- * 1M script, 1M pxe, 1M dt overlay and the ramdisk at the end.
- */
-#define BOOTM_SIZE        __stringify(0xa000000)
-#define KERNEL_ADDR_R     __stringify(SDRAM_OFFSET(2000000))
-#define FDT_ADDR_R        __stringify(SDRAM_OFFSET(3000000))
-#define SCRIPT_ADDR_R     __stringify(SDRAM_OFFSET(3100000))
-#define PXEFILE_ADDR_R    __stringify(SDRAM_OFFSET(3200000))
-#define FDTOVERLAY_ADDR_R __stringify(SDRAM_OFFSET(3300000))
-#define RAMDISK_ADDR_R    __stringify(SDRAM_OFFSET(3400000))
+#error Need at least 32MB of DRAM. Please adjust load addresses.
 #endif
 
 #define MEM_LAYOUT_ENV_SETTINGS \
-- 
2.25.1

