Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B30EA8
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Jun 2023 23:33:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32087C14;
	Sun, 11 Jun 2023 16:34:17 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 074943F663;
	Sun, 11 Jun 2023 16:33:29 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Samuel Holland <samuel@sholland.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Sam Edwards <cfsworks@gmail.com>,
	=?UTF-8?q?=E8=B7=AF=E8=BE=89?= <luhux76@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 3/7] sunxi: Kconfig: rework PHY_USB_SUN4I selection
Date: Mon, 12 Jun 2023 00:32:37 +0100
Message-Id: <20230611233241.14235-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20230611233241.14235-1-andre.przywara@arm.com>
References: <20230611233241.14235-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At the moment we use "select" in each Allwinner SoC's Kconfig section to
include the USB PHY driver in the build. This means it cannot be disabled
via Kconfig, although USB is not really a strictly required core
functionality, and a particular board might not even include USB ports.

Rework the Kconfig part by removing the "select" lines for each SoC's
section, and instead letting it default to "y" in the PHY driver section
itself. We use "depends on !" to exclude the few SoCs we don't support
(yet). The Allwinner V3s does not enable USB (PHY) support at the moment,
even though it should work: let the PHY default to "n" to keep the
current behaviour.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/mach-sunxi/Kconfig   | 11 -----------
 drivers/phy/allwinner/Kconfig |  6 +++++-
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 6dcbb096f74..e0b1bde35a9 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -207,7 +207,6 @@ endif
 
 config MACH_SUNXI_H3_H5
 	bool
-	select PHY_SUN4I_USB
 	select SUNXI_DE2
 	select SUNXI_DRAM_DW
 	select SUNXI_DRAM_DW_32BIT
@@ -236,7 +235,6 @@ config MACH_SUNIV
 config MACH_SUN4I
 	bool "sun4i (Allwinner A10)"
 	select CPU_V7A
-	select PHY_SUN4I_USB
 	select DRAM_SUN4I
 	select SUNXI_GEN_SUN4I
 	select SUPPORT_SPL
@@ -247,7 +245,6 @@ config MACH_SUN5I
 	bool "sun5i (Allwinner A13)"
 	select CPU_V7A
 	select DRAM_SUN4I
-	select PHY_SUN4I_USB
 	select SUNXI_GEN_SUN4I
 	select SUPPORT_SPL
 	imply SPL_SYS_I2C_LEGACY
@@ -261,7 +258,6 @@ config MACH_SUN6I
 	select ARCH_SUPPORT_PSCI
 	select SPL_ARMV7_SET_CORTEX_SMPEN
 	select DRAM_SUN6I
-	select PHY_SUN4I_USB
 	select SPL_I2C
 	select SUN6I_PRCM
 	select SUNXI_GEN_SUN6I
@@ -277,7 +273,6 @@ config MACH_SUN7I
 	select ARCH_SUPPORT_PSCI
 	select SPL_ARMV7_SET_CORTEX_SMPEN
 	select DRAM_SUN4I
-	select PHY_SUN4I_USB
 	select SUNXI_GEN_SUN4I
 	select SUPPORT_SPL
 	select ARMV7_BOOT_SEC_DEFAULT if OLD_SUNXI_KERNEL_COMPAT
@@ -291,7 +286,6 @@ config MACH_SUN8I_A23
 	select CPU_V7_HAS_VIRT
 	select ARCH_SUPPORT_PSCI
 	select DRAM_SUN8I_A23
-	select PHY_SUN4I_USB
 	select SPL_I2C
 	select SUNXI_GEN_SUN6I
 	select SUPPORT_SPL
@@ -305,7 +299,6 @@ config MACH_SUN8I_A33
 	select CPU_V7_HAS_VIRT
 	select ARCH_SUPPORT_PSCI
 	select DRAM_SUN8I_A33
-	select PHY_SUN4I_USB
 	select SPL_I2C
 	select SUNXI_GEN_SUN6I
 	select SUPPORT_SPL
@@ -316,7 +309,6 @@ config MACH_SUN8I_A83T
 	bool "sun8i (Allwinner A83T)"
 	select CPU_V7A
 	select DRAM_SUN8I_A83T
-	select PHY_SUN4I_USB
 	select SPL_I2C
 	select SUNXI_GEN_SUN6I
 	select MMC_SUNXI_HAS_NEW_MODE
@@ -344,7 +336,6 @@ config MACH_SUN8I_R40
 	select SUPPORT_SPL
 	select SUNXI_DRAM_DW
 	select SUNXI_DRAM_DW_32BIT
-	select PHY_SUN4I_USB
 	imply SPL_SYS_I2C_LEGACY
 
 config MACH_SUN8I_V3S
@@ -372,7 +363,6 @@ config MACH_SUN9I
 config MACH_SUN50I
 	bool "sun50i (Allwinner A64)"
 	select ARM64
-	select PHY_SUN4I_USB
 	select SUN6I_PRCM
 	select SUNXI_DE2
 	select SUNXI_GEN_SUN6I
@@ -395,7 +385,6 @@ config MACH_SUN50I_H5
 config MACH_SUN50I_H6
 	bool "sun50i (Allwinner H6)"
 	select ARM64
-	select PHY_SUN4I_USB
 	select DRAM_SUN50I_H6
 	select SUN50I_GEN_H6
 
diff --git a/drivers/phy/allwinner/Kconfig b/drivers/phy/allwinner/Kconfig
index f8f1e99c4f5..565b4617b01 100644
--- a/drivers/phy/allwinner/Kconfig
+++ b/drivers/phy/allwinner/Kconfig
@@ -4,6 +4,10 @@
 config PHY_SUN4I_USB
 	bool "Allwinner Sun4I USB PHY driver"
 	depends on ARCH_SUNXI
+	depends on !MACH_SUN9I
+	depends on !MACH_SUN50I_H616
+	default n if MACH_SUN8I_V3S
+	default y
 	select DM_REGULATOR
 	select PHY
 	help
@@ -11,7 +15,7 @@ config PHY_SUN4I_USB
 	  sunxi SoCs.
 
 	  This driver controls the entire USB PHY block, both the USB OTG
-	  parts, as well as the 2 regular USB 2 host PHYs.
+	  parts, as well as the regular USB HCI host PHYs.
 
 config INITIAL_USB_SCAN_DELAY
 	int "Delay initial USB scan by x ms to allow builtin devices to init"
-- 
2.35.8

