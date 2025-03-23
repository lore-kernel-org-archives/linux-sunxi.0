Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA022045BA
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 11:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742729815; cv=none; b=TlCw431HZC6dzce5bp0PwHd9ovkKOByeZcubGmbGPodf8Zs5x849LmyXG5+icL3phmVgpdg8fwhRWYdoUIRjAicuWOF3vFrc/A9uyVl9EB1rHbZhLJfh8HHnfkGFSuj4M1rkYRgBrPlKgiDmZjfCyG14p14TD/jpIytj1eEOAB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742729815; c=relaxed/simple;
	bh=hBeqMwsIGHurJIemLpazAIBqydHqnPzeSawkbJX54gQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VjIiqCwoeZU1kIgGRioqlgbcSP34Efj2qtf8hQF39XVsoSRo0+QS9pJ+dQit5VFt/WH3jVzK/ko6ML8KY8RFTt2IxiqrmfVzZXgfzmLGb7WaBtKGo47PHQmkdBIQA32VMVIjcH7eNxbdZZeogeteXX9G+L131I2bsawQOaiYwRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9694D106F;
	Sun, 23 Mar 2025 04:37:00 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD7D53F694;
	Sun, 23 Mar 2025 04:36:52 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 34/34] sunxi: A523: add defconfigs for three boards
Date: Sun, 23 Mar 2025 11:35:44 +0000
Message-ID: <20250323113544.7933-35-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250323113544.7933-1-andre.przywara@arm.com>
References: <20250323113544.7933-1-andre.przywara@arm.com>
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
 configs/avaota-a1_defconfig     | 31 +++++++++++++++++++++++++++++++
 configs/radxa-a5e_defconfig     | 30 ++++++++++++++++++++++++++++++
 configs/x96q_pro_plus_defconfig | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+)
 create mode 100644 configs/avaota-a1_defconfig
 create mode 100644 configs/radxa-a5e_defconfig
 create mode 100644 configs/x96q_pro_plus_defconfig

diff --git a/configs/avaota-a1_defconfig b/configs/avaota-a1_defconfig
new file mode 100644
index 00000000000..8721f2f5d1d
--- /dev/null
+++ b/configs/avaota-a1_defconfig
@@ -0,0 +1,31 @@
+CONFIG_ARM=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_DEFAULT_DEVICE_TREE="sun55i-t527-avaota-a1"
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
index 00000000000..47c02fef7bd
--- /dev/null
+++ b/configs/radxa-a5e_defconfig
@@ -0,0 +1,30 @@
+CONFIG_ARM=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_DEFAULT_DEVICE_TREE="sun55i-a527-radxa-a5e"
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
index 00000000000..b6bb18860f9
--- /dev/null
+++ b/configs/x96q_pro_plus_defconfig
@@ -0,0 +1,33 @@
+CONFIG_ARM=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_DEFAULT_DEVICE_TREE="sun55i-h728-x96qpro+"
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
+CONFIG_USB1_VBUS_PIN="PI12"
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

