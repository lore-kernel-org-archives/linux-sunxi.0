Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC16A35E949
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Apr 2026 22:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775601305; cv=none; b=oZdKfkLDRLIOCwOTK0EprvTPywhZDrEHnxkfuUKm7FUuzdXZiMcu31h42zzP2FCN1AJbMR555f2O/27DiYQYJ+taMFEuD/G6upR/6C2rFTgxz+nNHVOYPScS6aIrKLTOzOD3Fmg/Mgzn+1ru8uQVQJrwtBqCI14sP7ZijgFW3R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775601305; c=relaxed/simple;
	bh=6iSubdnYP9CJiM8NfOJBSq3KCcye7gvbMT4QpGfrlC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oiEkEk264s6T9xYz4nntUznfMEE1Ck1VfVzLaiHfz7yA92pHbuXn95HvRvQhGQQXbb79lAmFtkyMA1U+ZFoACQxg31yUhGBEIWmJEvwhATHMxdhsWwTqjoBDvi4cJaGDIOzqB7pByPwzWdQKUyIU4ZjoOiUFz5GGtdjhraFC40E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MEnmCy3J; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MEnmCy3J"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F5E339E7;
	Tue,  7 Apr 2026 15:34:57 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFFC83F632;
	Tue,  7 Apr 2026 15:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775601303; bh=6iSubdnYP9CJiM8NfOJBSq3KCcye7gvbMT4QpGfrlC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MEnmCy3Jp1J09PTUMrAEhjLCZao4in+vBqi5WuSOgLR8f7fKJHBpgfqsEy5PXP/Pm
	 VLXY578ajxy9oH+0CZy9pKIO2XUA8o9v/sC1iXt4GRChzWTyRcqJNGxQNb6DNQ5qWQ
	 CTvEJCxOMU+OWfA1wyHvIRNOURsmqvX0AKNnCeTE=
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <contact@paulk.fr>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/3] sunxi: configs: enable power LEDs on 64-bit boards
Date: Wed,  8 Apr 2026 00:34:47 +0200
Message-ID: <20260407223447.4956-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20260407223447.4956-1-andre.przywara@arm.com>
References: <20260407223447.4956-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We recently gained a simple way to enable a power LED very early in the
SPL boot, through simple Kconfig variables.

Add those symbols to those boards' defconfigs where the DT indicates a
default-on power LED. The number used is <port bank> * 32 + <pin no>,
an active low setup means CONFIG_SPL_SUNXI_LED_STATUS_STATE must be
undefined.

This will light up the power LED very early in the (SPL) boot phase on
those 64-bit boards.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 configs/anbernic_rg35xx_h700_defconfig | 3 +++
 configs/bananapi_m64_defconfig         | 3 +++
 configs/beelink_gs1_defconfig          | 3 +++
 configs/liontron-h-a133l_defconfig     | 3 +++
 configs/nanopi_neo2_defconfig          | 3 +++
 configs/nanopi_neo_plus2_defconfig     | 3 +++
 configs/orangepi_3_defconfig           | 3 +++
 configs/orangepi_lite2_defconfig       | 3 +++
 configs/orangepi_pc2_defconfig         | 3 +++
 configs/orangepi_prime_defconfig       | 3 +++
 configs/orangepi_zero2_defconfig       | 3 +++
 configs/orangepi_zero_plus2_defconfig  | 3 +++
 configs/orangepi_zero_plus_defconfig   | 3 +++
 configs/radxa-cubie-a5e_defconfig      | 3 +++
 configs/tanix_tx1_defconfig            | 3 +++
 15 files changed, 45 insertions(+)

diff --git a/configs/anbernic_rg35xx_h700_defconfig b/configs/anbernic_rg35xx_h700_defconfig
index 2fa57cbecce..fb3df175521 100644
--- a/configs/anbernic_rg35xx_h700_defconfig
+++ b/configs/anbernic_rg35xx_h700_defconfig
@@ -16,6 +16,9 @@ CONFIG_DRAM_SUNXI_PHY_ADDR_MAP_1=y
 CONFIG_MACH_SUN50I_H616=y
 CONFIG_SUNXI_DRAM_H616_LPDDR4=y
 CONFIG_R_I2C_ENABLE=y
+CONFIG_SPL_SUNXI_LED_STATUS=y
+CONFIG_SPL_SUNXI_LED_STATUS_BIT=268
+CONFIG_SPL_SUNXI_LED_STATUS_STATE=y
 CONFIG_SPL_I2C=y
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/bananapi_m64_defconfig b/configs/bananapi_m64_defconfig
index d957071cb13..413de4919d5 100644
--- a/configs/bananapi_m64_defconfig
+++ b/configs/bananapi_m64_defconfig
@@ -4,6 +4,9 @@ CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-bananapi-m64"
 CONFIG_SPL=y
 CONFIG_MACH_SUN50I=y
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
+CONFIG_SPL_SUNXI_LED_STATUS=y
+CONFIG_SPL_SUNXI_LED_STATUS_BIT=120
+CONFIG_SPL_SUNXI_LED_STATUS_STATE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/beelink_gs1_defconfig b/configs/beelink_gs1_defconfig
index de46d205453..6a1af7f9b3a 100644
--- a/configs/beelink_gs1_defconfig
+++ b/configs/beelink_gs1_defconfig
@@ -5,6 +5,9 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN50I_H6=y
 CONFIG_SUNXI_DRAM_H6_LPDDR3=y
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
+CONFIG_SPL_SUNXI_LED_STATUS=y
+CONFIG_SPL_SUNXI_LED_STATUS_BIT=356
+CONFIG_SPL_SUNXI_LED_STATUS_STATE=y
 # CONFIG_PSCI_RESET is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_LED=y
diff --git a/configs/liontron-h-a133l_defconfig b/configs/liontron-h-a133l_defconfig
index 831d5b56e3a..f7bb994509f 100644
--- a/configs/liontron-h-a133l_defconfig
+++ b/configs/liontron-h-a133l_defconfig
@@ -23,6 +23,9 @@ CONFIG_MACH_SUN50I_A133=y
 CONFIG_SUNXI_DRAM_A133_LPDDR4=y
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_R_I2C_ENABLE=y
+CONFIG_SPL_SUNXI_LED_STATUS=y
+CONFIG_SPL_SUNXI_LED_STATUS_BIT=240
+# CONFIG_SPL_SUNXI_LED_STATUS_STATE is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_I2C=y
 CONFIG_SPL_SYS_I2C_LEGACY=y
diff --git a/configs/nanopi_neo2_defconfig b/configs/nanopi_neo2_defconfig
index 6704a24a880..83bf0326bd4 100644
--- a/configs/nanopi_neo2_defconfig
+++ b/configs/nanopi_neo2_defconfig
@@ -6,6 +6,9 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN50I_H5=y
 CONFIG_DRAM_ZQ=3881977
 # CONFIG_DRAM_ODT_EN is not set
+CONFIG_SPL_SUNXI_LED_STATUS=y
+CONFIG_SPL_SUNXI_LED_STATUS_BIT=362
+CONFIG_SPL_SUNXI_LED_STATUS_STATE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/nanopi_neo_plus2_defconfig b/configs/nanopi_neo_plus2_defconfig
index e80e32a63d4..024301f990c 100644
--- a/configs/nanopi_neo_plus2_defconfig
+++ b/configs/nanopi_neo_plus2_defconfig
@@ -7,6 +7,9 @@ CONFIG_MACH_SUN50I_H5=y
 CONFIG_DRAM_ZQ=3881977
 # CONFIG_DRAM_ODT_EN is not set
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
+CONFIG_SPL_SUNXI_LED_STATUS=y
+CONFIG_SPL_SUNXI_LED_STATUS_BIT=362
+CONFIG_SPL_SUNXI_LED_STATUS_STATE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/orangepi_3_defconfig b/configs/orangepi_3_defconfig
index 125137bc321..1fa1676e091 100644
--- a/configs/orangepi_3_defconfig
+++ b/configs/orangepi_3_defconfig
@@ -6,6 +6,9 @@ CONFIG_MACH_SUN50I_H6=y
 CONFIG_SUNXI_DRAM_H6_LPDDR3=y
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_BLUETOOTH_DT_DEVICE_FIXUP="brcm,bcm4345c5"
+CONFIG_SPL_SUNXI_LED_STATUS=y
+CONFIG_SPL_SUNXI_LED_STATUS_BIT=356
+CONFIG_SPL_SUNXI_LED_STATUS_STATE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_PHY_SUN50I_USB3=y
 CONFIG_USB_XHCI_HCD=y
diff --git a/configs/orangepi_lite2_defconfig b/configs/orangepi_lite2_defconfig
index 577f7436c15..10864827adf 100644
--- a/configs/orangepi_lite2_defconfig
+++ b/configs/orangepi_lite2_defconfig
@@ -4,6 +4,9 @@ CONFIG_DEFAULT_DEVICE_TREE="sun50i-h6-orangepi-lite2"
 CONFIG_SPL=y
 CONFIG_MACH_SUN50I_H6=y
 CONFIG_SUNXI_DRAM_H6_LPDDR3=y
+CONFIG_SPL_SUNXI_LED_STATUS=y
+CONFIG_SPL_SUNXI_LED_STATUS_BIT=356
+CONFIG_SPL_SUNXI_LED_STATUS_STATE=y
 # CONFIG_PSCI_RESET is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index d856a25814b..1e9a7cdaf7a 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -6,6 +6,9 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN50I_H5=y
 CONFIG_DRAM_ZQ=3881977
 CONFIG_SPL_SPI_SUNXI=y
+CONFIG_SPL_SUNXI_LED_STATUS=y
+CONFIG_SPL_SUNXI_LED_STATUS_BIT=362
+CONFIG_SPL_SUNXI_LED_STATUS_STATE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_I2C=y
 CONFIG_SPL_SYS_I2C_LEGACY=y
diff --git a/configs/orangepi_prime_defconfig b/configs/orangepi_prime_defconfig
index e93154cc0e9..7f622fe70f1 100644
--- a/configs/orangepi_prime_defconfig
+++ b/configs/orangepi_prime_defconfig
@@ -6,6 +6,9 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN50I_H5=y
 CONFIG_DRAM_ZQ=3881977
 # CONFIG_DRAM_ODT_EN is not set
+CONFIG_SPL_SUNXI_LED_STATUS=y
+CONFIG_SPL_SUNXI_LED_STATUS_BIT=362
+CONFIG_SPL_SUNXI_LED_STATUS_STATE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/orangepi_zero2_defconfig b/configs/orangepi_zero2_defconfig
index 831bfe66e25..942b751e181 100644
--- a/configs/orangepi_zero2_defconfig
+++ b/configs/orangepi_zero2_defconfig
@@ -10,6 +10,9 @@ CONFIG_MACH_SUN50I_H616=y
 CONFIG_SUNXI_DRAM_H616_DDR3_1333=y
 CONFIG_R_I2C_ENABLE=y
 CONFIG_SPL_SPI_SUNXI=y
+CONFIG_SPL_SUNXI_LED_STATUS=y
+CONFIG_SPL_SUNXI_LED_STATUS_BIT=76
+CONFIG_SPL_SUNXI_LED_STATUS_STATE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_I2C=y
 CONFIG_SPL_SYS_I2C_LEGACY=y
diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index c4d9800975c..945379533ab 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -7,6 +7,9 @@ CONFIG_MACH_SUN50I_H5=y
 CONFIG_DRAM_ZQ=3881977
 # CONFIG_DRAM_ODT_EN is not set
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
+CONFIG_SPL_SUNXI_LED_STATUS=y
+CONFIG_SPL_SUNXI_LED_STATUS_BIT=362
+CONFIG_SPL_SUNXI_LED_STATUS_STATE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/orangepi_zero_plus_defconfig b/configs/orangepi_zero_plus_defconfig
index 4b6491dc846..2979c9f7f7b 100644
--- a/configs/orangepi_zero_plus_defconfig
+++ b/configs/orangepi_zero_plus_defconfig
@@ -6,6 +6,9 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN50I_H5=y
 CONFIG_DRAM_ZQ=3881977
 # CONFIG_DRAM_ODT_EN is not set
+CONFIG_SPL_SUNXI_LED_STATUS=y
+CONFIG_SPL_SUNXI_LED_STATUS_BIT=362
+CONFIG_SPL_SUNXI_LED_STATUS_STATE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/radxa-cubie-a5e_defconfig b/configs/radxa-cubie-a5e_defconfig
index 9d204ef5548..88e9a0879f7 100644
--- a/configs/radxa-cubie-a5e_defconfig
+++ b/configs/radxa-cubie-a5e_defconfig
@@ -15,6 +15,9 @@ CONFIG_DRAM_SUNXI_TPR12=0x3533302f
 CONFIG_MACH_SUN55I_A523=y
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_R_I2C_ENABLE=y
+CONFIG_SPL_SUNXI_LED_STATUS=y
+CONFIG_SPL_SUNXI_LED_STATUS_BIT=356
+# CONFIG_SPL_SUNXI_LED_STATUS_STATE is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_I2C=y
 CONFIG_SPL_SYS_I2C_LEGACY=y
diff --git a/configs/tanix_tx1_defconfig b/configs/tanix_tx1_defconfig
index 1bd167ce0f6..0b5c57b93b9 100644
--- a/configs/tanix_tx1_defconfig
+++ b/configs/tanix_tx1_defconfig
@@ -14,6 +14,9 @@ CONFIG_MACH_SUN50I_H616=y
 CONFIG_SUNXI_DRAM_H616_LPDDR3=y
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_R_I2C_ENABLE=y
+CONFIG_SPL_SUNXI_LED_STATUS=y
+CONFIG_SPL_SUNXI_LED_STATUS_BIT=231
+CONFIG_SPL_SUNXI_LED_STATUS_STATE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_I2C=y
 CONFIG_SPL_SYS_I2C_LEGACY=y
-- 
2.46.4

