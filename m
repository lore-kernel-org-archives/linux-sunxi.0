Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D78B63A2
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Apr 2023 14:27:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0AD31691;
	Wed,  5 Apr 2023 07:28:25 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5675E3F762;
	Wed,  5 Apr 2023 07:27:40 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/2] sunxi: remove support for boot0 header reservation
Date: Wed,  5 Apr 2023 15:27:31 +0100
Message-Id: <20230405142731.1246503-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230405142731.1246503-1-andre.przywara@arm.com>
References: <20230405142731.1246503-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the early days of the Allwinner A64 U-Boot support, we relied on a
vendor provided "boot0" binary to perform the DRAM initialisation. This
replaced the SPL, and required to equip the U-Boot (proper) binary with
a vendor specific header to be recognised as a valid boot0 payload.
Fortunately these days are long gone (we gained SPL and DRAM support in
early 2017!), and we never needed to use that hack on any later 64-bit
Allwinner SoC.

Since this is highly obsolete by now, remove the Kconfig option and the
small pieces of "code" associated with it.

Provide some comments about the purpose of the remaining boot0 code on
the way.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/include/asm/arch-sunxi/boot0.h | 18 +++++++++++-------
 arch/arm/mach-sunxi/Kconfig             |  9 ---------
 configs/a64-olinuxino-emmc_defconfig    |  1 -
 configs/a64-olinuxino_defconfig         |  1 -
 configs/amarula_a64_relic_defconfig     |  1 -
 configs/bananapi_m64_defconfig          |  1 -
 configs/nanopi_a64_defconfig            |  1 -
 configs/oceanic_5205_5inmfd_defconfig   |  1 -
 configs/orangepi_win_defconfig          |  1 -
 configs/pine64_plus_defconfig           |  1 -
 configs/sopine_baseboard_defconfig      |  1 -
 11 files changed, 11 insertions(+), 25 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/boot0.h b/arch/arm/include/asm/arch-sunxi/boot0.h
index 59ea75a96b5..1a396f78488 100644
--- a/arch/arm/include/asm/arch-sunxi/boot0.h
+++ b/arch/arm/include/asm/arch-sunxi/boot0.h
@@ -1,13 +1,17 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * Configuration settings for the Allwinner A64 (sun50i) CPU
+ * Very early code for Allwinner 64-bit CPUs.
+ *
+ * The BROM runs entirely in AArch32 state, so the SPL is entered using this
+ * ISA. Depending on the rest of the firmware stack, this may also be true
+ * for U-Boot proper.
+ * Provide the "RMR reset into 64-bit" sequence, in AArch32 machine language,
+ * so that we can have all of U-Boot in AArch64. The first instruction is
+ * chosen so that if the CPU is already using AArch64, it will skip the code
+ * and jump straight to the reset vector.
  */
 
-#if defined(CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER) && !defined(CONFIG_SPL_BUILD)
-/* reserve space for BOOT0 header information */
-	b	reset
-	.space	1532
-#elif defined(CONFIG_ARM_BOOT_HOOK_RMR)
+#ifdef CONFIG_ARM_BOOT_HOOK_RMR
 /*
  * Switch into AArch64 if needed.
  * Refer to arch/arm/mach-sunxi/rmr_switch.S for the original source.
@@ -47,7 +51,7 @@
 	.word   CONFIG_TEXT_BASE
 #endif
 	.word	fel_stash - .
-#else
+#else	/* !CONFIG_ARM_BOOT_HOOK_RMR */
 /* normal execution */
 	b	reset
 #endif
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index b46667ce01e..0527b3863a7 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -386,15 +386,6 @@ config MACH_SUN8I
 	default y if MACH_SUN8I_R40
 	default y if MACH_SUN8I_V3S
 
-config RESERVE_ALLWINNER_BOOT0_HEADER
-	bool "reserve space for Allwinner boot0 header"
-	select ENABLE_ARM_SOC_BOOT0_HOOK
-	---help---
-	Prepend a 1536 byte (empty) header to the U-Boot image file, to be
-	filled with magic values post build. The Allwinner provided boot0
-	blob relies on this information to load and execute U-Boot.
-	Only needed on 64-bit Allwinner boards so far when using boot0.
-
 config ARM_BOOT_HOOK_RMR
 	bool
 	depends on ARM64
diff --git a/configs/a64-olinuxino-emmc_defconfig b/configs/a64-olinuxino-emmc_defconfig
index 8ec9eb3e9c2..a5989fab1c6 100644
--- a/configs/a64-olinuxino-emmc_defconfig
+++ b/configs/a64-olinuxino-emmc_defconfig
@@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=y
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-olinuxino-emmc"
 CONFIG_SPL=y
 CONFIG_MACH_SUN50I=y
-CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SUPPORT_EMMC_BOOT=y
diff --git a/configs/a64-olinuxino_defconfig b/configs/a64-olinuxino_defconfig
index 16cef18beef..0b469c25d0d 100644
--- a/configs/a64-olinuxino_defconfig
+++ b/configs/a64-olinuxino_defconfig
@@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=y
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-olinuxino"
 CONFIG_SPL=y
 CONFIG_MACH_SUN50I=y
-CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/amarula_a64_relic_defconfig b/configs/amarula_a64_relic_defconfig
index ae44b66d109..292af6e372e 100644
--- a/configs/amarula_a64_relic_defconfig
+++ b/configs/amarula_a64_relic_defconfig
@@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=y
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-amarula-relic"
 CONFIG_SPL=y
 CONFIG_MACH_SUN50I=y
-CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_VIDEO_DE2 is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
diff --git a/configs/bananapi_m64_defconfig b/configs/bananapi_m64_defconfig
index 99dc2f7d209..d957071cb13 100644
--- a/configs/bananapi_m64_defconfig
+++ b/configs/bananapi_m64_defconfig
@@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=y
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-bananapi-m64"
 CONFIG_SPL=y
 CONFIG_MACH_SUN50I=y
-CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SUPPORT_EMMC_BOOT=y
diff --git a/configs/nanopi_a64_defconfig b/configs/nanopi_a64_defconfig
index 70fc257eebd..608238757ba 100644
--- a/configs/nanopi_a64_defconfig
+++ b/configs/nanopi_a64_defconfig
@@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=y
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-nanopi-a64"
 CONFIG_SPL=y
 CONFIG_MACH_SUN50I=y
-CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/oceanic_5205_5inmfd_defconfig b/configs/oceanic_5205_5inmfd_defconfig
index 2ebca673808..6cdcf782bee 100644
--- a/configs/oceanic_5205_5inmfd_defconfig
+++ b/configs/oceanic_5205_5inmfd_defconfig
@@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=y
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-oceanic-5205-5inmfd"
 CONFIG_SPL=y
 CONFIG_MACH_SUN50I=y
-CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_SUNXI_DRAM_LPDDR3_STOCK=y
 CONFIG_DRAM_CLK=552
 CONFIG_DRAM_ZQ=3881949
diff --git a/configs/orangepi_win_defconfig b/configs/orangepi_win_defconfig
index 3b78ad7e52d..df11ad8c8fd 100644
--- a/configs/orangepi_win_defconfig
+++ b/configs/orangepi_win_defconfig
@@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=y
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-orangepi-win"
 CONFIG_SPL=y
 CONFIG_MACH_SUN50I=y
-CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_MACPWR="PD14"
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
diff --git a/configs/pine64_plus_defconfig b/configs/pine64_plus_defconfig
index f42f4e5923a..08c13b58a1e 100644
--- a/configs/pine64_plus_defconfig
+++ b/configs/pine64_plus_defconfig
@@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=y
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-pine64-plus"
 CONFIG_SPL=y
 CONFIG_MACH_SUN50I=y
-CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_PINE64_DT_SELECTION=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_OF_LIST="sun50i-a64-pine64 sun50i-a64-pine64-plus"
diff --git a/configs/sopine_baseboard_defconfig b/configs/sopine_baseboard_defconfig
index a5e1478c117..d9b0eb37c54 100644
--- a/configs/sopine_baseboard_defconfig
+++ b/configs/sopine_baseboard_defconfig
@@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=y
 CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-sopine-baseboard"
 CONFIG_SPL=y
 CONFIG_MACH_SUN50I=y
-CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_SUNXI_DRAM_LPDDR3_STOCK=y
 CONFIG_DRAM_CLK=552
 CONFIG_DRAM_ZQ=3881949
-- 
2.25.1

