Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248E849641
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jul 2025 23:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752796640; cv=none; b=S7oRhhBYlrlACTor71WPdiqx3tv2AcPSM6y0yhEagSow2RGpoaFZQKVtgUBaO+mi7l+a1ycLhJ6pT8hA/oztK3s4vQ0sWirbJFvNbE6BUAp+0tQTzqYIsRNGBXXggohosUEYIIg8Oq78SCUlUHPGrlqeZfGYoVTP3I22kxwueAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752796640; c=relaxed/simple;
	bh=/t2h+O3D9+cGR0/A6BRBZ68TCA59hhJkMDfH1aoQbS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ro9x9FW2PC4MmMDlScNCqZdzhhC+ciihkoP/O3ovo96J+M8N3kL46WjpGpr8yZdlTxD+zxaYBMfFCFQEhtPvMoik6ScwOg7ansG8vH6nhJE3bPw7U8e+Lkyka1slIX0kiyTPHpILk6miCedyEIgkNjrIuSi5Nj5hpcdZWjY3q6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F8EE1762;
	Thu, 17 Jul 2025 16:57:11 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC9773F694;
	Thu, 17 Jul 2025 16:57:17 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-sunxi@lists.linux.dev,
	Tom Rini <trini@konsulko.com>
Subject: [PATCH v2 20/20] sunxi: A523: add defconfigs for three boards
Date: Fri, 18 Jul 2025 00:54:55 +0100
Message-ID: <20250717235455.32528-21-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250717235455.32528-1-andre.przywara@arm.com>
References: <20250717235455.32528-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far developers seem to use three popular boards:
- Avaota A1: dev board with USB 3.0, dual Ethernet, small display
- X96QPro+: TV box with Gigabit Ethernet, USB 3.0, eMMC
- Radxa A5E: small dev board with USB3/M.2 2230 (muxed), dual Ethernet

Add the defconfig files for those boards, containing the DRAM parameters
and the usual Kconfig options.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 board/sunxi/MAINTAINERS         | 15 +++++++++++++++
 configs/avaota-a1_defconfig     | 31 +++++++++++++++++++++++++++++++
 configs/radxa-a5e_defconfig     | 30 ++++++++++++++++++++++++++++++
 configs/x96q_pro_plus_defconfig | 32 ++++++++++++++++++++++++++++++++
 4 files changed, 108 insertions(+)
 create mode 100644 configs/avaota-a1_defconfig
 create mode 100644 configs/radxa-a5e_defconfig
 create mode 100644 configs/x96q_pro_plus_defconfig

diff --git a/board/sunxi/MAINTAINERS b/board/sunxi/MAINTAINERS
index 1b4b7d87163..66e6a8ff962 100644
--- a/board/sunxi/MAINTAINERS
+++ b/board/sunxi/MAINTAINERS
@@ -137,6 +137,11 @@ M:	Chris Morgan <macromorgan@hotmail.com>
 S:	Maintained
 F:	configs/anbernic_rg35xx_h700_defconfig
 
+AVAOTA A1 BOARD
+M:	Andre Przywara <andre.przywara@arm.com>
+S:	Maintained
+F:	configs/avaota-a1_defconfig
+
 BANANAPI M1 PLUS
 M:	Jagan Teki <jagan@amarulasolutions.com>
 S:	Maintained
@@ -531,6 +536,11 @@ M:	Quentin Schulz <quentin.schulz@free-electrons.com>
 S:	Maintained
 F:	configs/parrot_r16_defconfig
 
+RADXA CUBIE A5E BOARD
+M:	Andre Przywara <andre.przywara@arm.com>
+S:	Maintained
+F:	configs/radxa-a5e_defconfig
+
 SINLINX SINA31s BOARD
 M:	Chen-Yu Tsai <wens@csie.org>
 S:	Maintained
@@ -591,6 +601,11 @@ M:	Andre Przywara <andre.przywara@arm.com>
 S:	Maintained
 F:	configs/x96_mate_defconfig
 
+X96Q PRO+ TV BOX
+M:	Andre Przywara <andre.przywara@arm.com>
+S:	Maintained
+F:	configs/x96q_pro_plus_defconfig
+
 YONES TOPTECH BD1078 BOARD
 M:	Paul Kocialkowski <contact@paulk.fr>
 S:	Maintained
diff --git a/configs/avaota-a1_defconfig b/configs/avaota-a1_defconfig
new file mode 100644
index 00000000000..55457edd3b3
--- /dev/null
+++ b/configs/avaota-a1_defconfig
@@ -0,0 +1,31 @@
+CONFIG_ARM=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_DEFAULT_DEVICE_TREE="allwinner/sun55i-t527-avaota-a1"
+CONFIG_SPL=y
+CONFIG_DRAM_SUNXI_DX_ODT=0x07070707
+CONFIG_DRAM_SUNXI_DX_DRI=0x0d0d0d0d
+CONFIG_DRAM_SUNXI_CA_DRI=0x0e0e
+CONFIG_DRAM_SUNXI_ODT_EN=0x84848484
+CONFIG_DRAM_SUNXI_TPR0=0x80808080
+CONFIG_DRAM_SUNXI_TPR1=0x06060606
+CONFIG_DRAM_SUNXI_TPR6=0x38000000
+CONFIG_DRAM_SUNXI_TPR10=0x802f3333
+CONFIG_DRAM_SUNXI_TPR11=0xc7c5c4c2
+CONFIG_DRAM_SUNXI_TPR12=0x3533302f
+CONFIG_MACH_SUN55I_A523=y
+CONFIG_MMC_SUNXI_SLOT_EXTRA=2
+CONFIG_R_I2C_ENABLE=y
+# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
+CONFIG_SPL_I2C=y
+CONFIG_SPL_SYS_I2C_LEGACY=y
+CONFIG_SYS_I2C_MVTWSI=y
+CONFIG_SYS_I2C_SLAVE=0x7f
+CONFIG_SYS_I2C_SPEED=400000
+CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_REGULATOR_AXP=y
+CONFIG_AXP717_POWER=y
+CONFIG_AXP_I2C_ADDRESS=0x35
+CONFIG_AXP_DCDC2_VOLT=920
+CONFIG_AXP_DCDC3_VOLT=1160
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
diff --git a/configs/radxa-a5e_defconfig b/configs/radxa-a5e_defconfig
new file mode 100644
index 00000000000..012e7b4eeaf
--- /dev/null
+++ b/configs/radxa-a5e_defconfig
@@ -0,0 +1,30 @@
+CONFIG_ARM=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_DEFAULT_DEVICE_TREE="allwinner/sun55i-a527-cubie-a5e"
+CONFIG_SPL=y
+CONFIG_DRAM_SUNXI_DX_ODT=0x07070707
+CONFIG_DRAM_SUNXI_DX_DRI=0x0d0d0d0d
+CONFIG_DRAM_SUNXI_CA_DRI=0x0e0e
+CONFIG_DRAM_SUNXI_ODT_EN=0x84848484
+CONFIG_DRAM_SUNXI_TPR0=0x80808080
+CONFIG_DRAM_SUNXI_TPR1=0x06060606
+CONFIG_DRAM_SUNXI_TPR6=0x38000000
+CONFIG_DRAM_SUNXI_TPR10=0x802f3333
+CONFIG_DRAM_SUNXI_TPR11=0xc7c5c4c2
+CONFIG_DRAM_SUNXI_TPR12=0x3533302f
+# BSP value: CONFIG_DRAM_SUNXI_TPR11=0xc6c4c2c0
+# BSP value: CONFIG_DRAM_SUNXI_TPR12=0x3a373233
+CONFIG_MACH_SUN55I_A523=y
+CONFIG_R_I2C_ENABLE=y
+# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
+CONFIG_SPL_I2C=y
+CONFIG_SPL_SYS_I2C_LEGACY=y
+CONFIG_SYS_I2C_MVTWSI=y
+CONFIG_SYS_I2C_SLAVE=0x7f
+CONFIG_SYS_I2C_SPEED=400000
+CONFIG_REGULATOR_AXP=y
+CONFIG_AXP717_POWER=y
+CONFIG_AXP_DCDC2_VOLT=920
+CONFIG_AXP_DCDC3_VOLT=1100
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
diff --git a/configs/x96q_pro_plus_defconfig b/configs/x96q_pro_plus_defconfig
new file mode 100644
index 00000000000..07d3b078bef
--- /dev/null
+++ b/configs/x96q_pro_plus_defconfig
@@ -0,0 +1,32 @@
+CONFIG_ARM=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_DEFAULT_DEVICE_TREE="allwinner/sun55i-h728-x96qpro+"
+CONFIG_SPL=y
+CONFIG_DRAM_SUNXI_DX_ODT=0x07070707
+CONFIG_DRAM_SUNXI_DX_DRI=0x0c0c0c0c
+CONFIG_DRAM_SUNXI_CA_DRI=0x0e0e
+CONFIG_DRAM_SUNXI_ODT_EN=0x90909090
+CONFIG_DRAM_SUNXI_TPR0=0x80808080
+CONFIG_DRAM_SUNXI_TPR1=0x06060606
+CONFIG_DRAM_SUNXI_TPR6=0x3380807e
+CONFIG_DRAM_SUNXI_TPR10=0x802f7788
+CONFIG_DRAM_SUNXI_TPR11=0x8f919190
+CONFIG_DRAM_SUNXI_TPR12=0x22222723
+CONFIG_MACH_SUN55I_A523=y
+CONFIG_SUNXI_DRAM_A523_DDR3=y
+CONFIG_DRAM_CLK=792
+CONFIG_MMC_SUNXI_SLOT_EXTRA=2
+CONFIG_R_I2C_ENABLE=y
+# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
+CONFIG_SPL_I2C=y
+CONFIG_SPL_SYS_I2C_LEGACY=y
+CONFIG_SYS_I2C_MVTWSI=y
+CONFIG_SYS_I2C_SLAVE=0x7f
+CONFIG_SYS_I2C_SPEED=400000
+CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_REGULATOR_AXP=y
+CONFIG_AXP717_POWER=y
+CONFIG_AXP_DCDC2_VOLT=920
+CONFIG_AXP_DCDC3_VOLT=1360
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
-- 
2.46.3

