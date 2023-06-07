Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF64B7C
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Jun 2023 00:08:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7F5315DB;
	Tue,  6 Jun 2023 17:09:10 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09A6D3F587;
	Tue,  6 Jun 2023 17:08:23 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 4/5] sunxi: H616: add DRAM type selection
Date: Wed,  7 Jun 2023 01:07:44 +0100
Message-Id: <20230607000745.10245-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20230607000745.10245-1-andre.przywara@arm.com>
References: <20230607000745.10245-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: iuncuim <iuncuim@gmail.com>

Allwinner H616 SoC supports several types of DRAM memory. To further
integrate other types of memory, we need to add this delimitation.
---
 arch/arm/mach-sunxi/Kconfig               | 10 +++++++++-
 arch/arm/mach-sunxi/dram_timings/Makefile |  3 +--
 configs/orangepi_zero2_defconfig          |  1 +
 configs/x96_mate_defconfig                |  1 +
 4 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 6dcbb096f74..197d77ea658 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -442,7 +442,7 @@ config ARM_BOOT_HOOK_RMR
 	This allows both the SPL and the U-Boot proper to be entered in
 	either mode and switch to AArch64 if needed.
 
-if SUNXI_DRAM_DW || DRAM_SUN50I_H6
+if SUNXI_DRAM_DW || DRAM_SUN50I_H6 || DRAM_SUN50I_H616
 config SUNXI_DRAM_DDR3
 	bool
 
@@ -487,6 +487,14 @@ config SUNXI_DRAM_H6_DDR3_1333
 	This option is the DDR3 timing used by the boot0 on H6 TV boxes
 	which use a DDR3-1333 timing.
 
+config SUNXI_DRAM_H616_DDR3_1333
+	bool "DDR3-1333 boot0 timings on the H616 DRAM controller"
+	select SUNXI_DRAM_DDR3
+	depends on DRAM_SUN50I_H616
+	---help---
+	This option is the DDR3 timing used by the boot0 on H616 TV boxes
+	which use a DDR3-1333 timing.
+
 config SUNXI_DRAM_DDR2_V3S
 	bool "DDR2 found in V3s chip"
 	select SUNXI_DRAM_DDR2
diff --git a/arch/arm/mach-sunxi/dram_timings/Makefile b/arch/arm/mach-sunxi/dram_timings/Makefile
index 39a8756c297..4d78c04c9ae 100644
--- a/arch/arm/mach-sunxi/dram_timings/Makefile
+++ b/arch/arm/mach-sunxi/dram_timings/Makefile
@@ -3,5 +3,4 @@ obj-$(CONFIG_SUNXI_DRAM_LPDDR3_STOCK)	+= lpddr3_stock.o
 obj-$(CONFIG_SUNXI_DRAM_DDR2_V3S)	+= ddr2_v3s.o
 obj-$(CONFIG_SUNXI_DRAM_H6_LPDDR3)	+= h6_lpddr3.o
 obj-$(CONFIG_SUNXI_DRAM_H6_DDR3_1333)	+= h6_ddr3_1333.o
-# currently only DDR3 is supported on H616
-obj-$(CONFIG_MACH_SUN50I_H616)		+= h616_ddr3_1333.o
+obj-$(CONFIG_SUNXI_DRAM_H616_DDR3_1333)	+= h616_ddr3_1333.o
diff --git a/configs/orangepi_zero2_defconfig b/configs/orangepi_zero2_defconfig
index 6cb942f511a..e38cc20ac72 100644
--- a/configs/orangepi_zero2_defconfig
+++ b/configs/orangepi_zero2_defconfig
@@ -7,6 +7,7 @@ CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
 CONFIG_DRAM_SUN50I_H616_CA_DRI=0x0e0e
 CONFIG_DRAM_SUN50I_H616_TPR10=0xf83438
 CONFIG_MACH_SUN50I_H616=y
+CONFIG_SUNXI_DRAM_H616_DDR3_1333=y
 CONFIG_R_I2C_ENABLE=y
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
diff --git a/configs/x96_mate_defconfig b/configs/x96_mate_defconfig
index 122c1a99e32..c86cf43771c 100644
--- a/configs/x96_mate_defconfig
+++ b/configs/x96_mate_defconfig
@@ -10,6 +10,7 @@ CONFIG_DRAM_SUN50I_H616_TPR10=0x2f0007
 CONFIG_DRAM_SUN50I_H616_TPR11=0xffffdddd
 CONFIG_DRAM_SUN50I_H616_TPR12=0xfedf7557
 CONFIG_MACH_SUN50I_H616=y
+CONFIG_SUNXI_DRAM_H616_DDR3_1333=y
 CONFIG_R_I2C_ENABLE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_I2C=y
-- 
2.35.8

