Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88DE47E
	for <linux-sunxi@lists.linux.dev>; Wed,  3 Jan 2024 00:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68666C15;
	Tue,  2 Jan 2024 16:14:23 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E2143F5A1;
	Tue,  2 Jan 2024 16:13:36 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: [PATCH 07/19] sunxi: simplify U-Boot proper only builds
Date: Wed,  3 Jan 2024 00:12:27 +0000
Message-Id: <20240103001239.17482-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20240103001239.17482-1-andre.przywara@arm.com>
References: <20240103001239.17482-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At the moment every Allwinner board builds and requires an SPL, even
though we select this individually in each _defconfig file.
For experiments and for early bringup of new SoCs it would be beneficial
to only build U-Boot proper, for instance to postpone a tedious SPL port
(including DRAM support) in the initial phase.

Protect some SPL related symbols that we unconditionally select at the
moment with "if SPL", to avoid Kconfig conflicts when CONFIG_SPL is
disabled.

This alone does not cleanly build U-Boot proper only yet, but gets it
far enough so that the binary can be harvested.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/Kconfig            |  4 ++--
 arch/arm/mach-sunxi/Kconfig | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index d812685c984..adce50c66a4 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1143,14 +1143,14 @@ config ARCH_SUNXI
 	select SPL_SEPARATE_BSS if SPL
 	select SPL_STACK_R if SPL
 	select SPL_SYS_MALLOC_SIMPLE if SPL
-	select SPL_SYS_THUMB_BUILD if !ARM64
+	select SPL_SYS_THUMB_BUILD if SPL && !ARM64
 	select SUNXI_GPIO
 	select SYS_NS16550
 	select SYS_THUMB_BUILD if !ARM64
 	select USB if DISTRO_DEFAULTS
 	select USB_KEYBOARD if DISTRO_DEFAULTS && USB_HOST
 	select USB_STORAGE if DISTRO_DEFAULTS && USB_HOST
-	select SPL_USE_TINY_PRINTF
+	select SPL_USE_TINY_PRINTF if SPL
 	select USE_PREBOOT
 	select SYS_RELOC_GD_ENV_ADDR
 	imply BOARD_LATE_INIT
diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index a4a8d8e9445..421a48bc357 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -182,7 +182,7 @@ config SUNXI_GEN_SUN6I
 config SUN50I_GEN_H6
 	bool
 	select FIT
-	select SPL_LOAD_FIT
+	select SPL_LOAD_FIT if SPL
 	select MMC_SUNXI_HAS_NEW_MODE
 	select SUPPORT_SPL
 	---help---
@@ -272,7 +272,7 @@ config MACH_SUN6I
 	select ARCH_SUPPORT_PSCI
 	select SPL_ARMV7_SET_CORTEX_SMPEN
 	select DRAM_SUN6I
-	select SPL_I2C
+	select SPL_I2C if SPL
 	select SUN6I_PRCM
 	select SUNXI_GEN_SUN6I
 	select SUPPORT_SPL
@@ -300,7 +300,7 @@ config MACH_SUN8I_A23
 	select CPU_V7_HAS_VIRT
 	select ARCH_SUPPORT_PSCI
 	select DRAM_SUN8I_A23
-	select SPL_I2C
+	select SPL_I2C if SPL
 	select SUNXI_GEN_SUN6I
 	select SUPPORT_SPL
 	select SYS_I2C_SUN8I_RSB
@@ -313,7 +313,7 @@ config MACH_SUN8I_A33
 	select CPU_V7_HAS_VIRT
 	select ARCH_SUPPORT_PSCI
 	select DRAM_SUN8I_A33
-	select SPL_I2C
+	select SPL_I2C if SPL
 	select SUNXI_GEN_SUN6I
 	select SUPPORT_SPL
 	select SYS_I2C_SUN8I_RSB
@@ -323,7 +323,7 @@ config MACH_SUN8I_A83T
 	bool "sun8i (Allwinner A83T)"
 	select CPU_V7A
 	select DRAM_SUN8I_A83T
-	select SPL_I2C
+	select SPL_I2C if SPL
 	select SUNXI_GEN_SUN6I
 	select MMC_SUNXI_HAS_NEW_MODE
 	select MMC_SUNXI_HAS_MODE_SWITCH
@@ -382,7 +382,7 @@ config MACH_SUN9I
 	select CPU_V7A
 	select SPL_ARMV7_SET_CORTEX_SMPEN
 	select DRAM_SUN9I
-	select SPL_I2C
+	select SPL_I2C if SPL
 	select SUN6I_PRCM
 	select SUNXI_GEN_SUN6I
 	select SUPPORT_SPL
@@ -398,7 +398,7 @@ config MACH_SUN50I
 	select SUNXI_DRAM_DW
 	select SUNXI_DRAM_DW_32BIT
 	select FIT
-	select SPL_LOAD_FIT
+	select SPL_LOAD_FIT if SPL
 	select SUNXI_A64_TIMER_ERRATUM
 
 config MACH_SUN50I_H5
@@ -407,7 +407,7 @@ config MACH_SUN50I_H5
 	select MACH_SUNXI_H3_H5
 	select MMC_SUNXI_HAS_NEW_MODE
 	select FIT
-	select SPL_LOAD_FIT
+	select SPL_LOAD_FIT if SPL
 
 config MACH_SUN50I_H6
 	bool "sun50i (Allwinner H6)"
-- 
2.35.8

