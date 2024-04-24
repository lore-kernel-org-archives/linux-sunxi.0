Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0437FF
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 00:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713917914; cv=none; b=YsYj5J+xvvyKvSD4AaVQAlmMWPDhKLdUPaPdfAyfNbFlHUprOTIu73GOm+Ph6gYzdYbqx7RseaOYGQzu9i9iqZs1fj2BCvUXC+MRye5VdtP3Vb4taFJVm+pd/nI4WQzUP+BOl+JDifbFZAHQXUIKy/295ZUWFIedEAgmZBDQs0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713917914; c=relaxed/simple;
	bh=/si1hQZ6xgY+33rgQKNe6hEDtbU8unAt6GDsbxNB12k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lNYlcrdyk7F5ayPL9ag/zKJK0KqofD/xW8Kanc3hFXXr9sCSXAQFsRcvquAqowvWfbtDYtMAooxTppG/sagMpFBnQ75h1dpDs8RO62HW8tAFHGQfwC/Mxv1IjFuPOBzAn99AVseS/NpuRx8+e004hwj6BTjJo2lrMCK9FMy3b9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF948339;
	Tue, 23 Apr 2024 17:18:58 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D9493F7BD;
	Tue, 23 Apr 2024 17:18:30 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH 4/4] sunxi: H616: add Tanix TX1 support
Date: Wed, 24 Apr 2024 01:18:08 +0100
Message-Id: <20240424001808.14388-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20240424001808.14388-1-andre.przywara@arm.com>
References: <20240424001808.14388-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tanix TX1 is a tiny TV box, featuring the Allwinner H313 SoC with up
to 2GB of DRAM and 16GB of eMMC. There is no SD card or Ethernet port on
this small device, but it can be booted via the USB debug "FEL" mode.
The bootloader could then be written to the eMMC.

Add the defconfig for that board, and add the devicetree file to the
Makefile, for it to be built.
The DRAM parameters were taken from the vendor firmware on the eMMC.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/dts/Makefile       |  1 +
 configs/tanix_tx1_defconfig | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 configs/tanix_tx1_defconfig

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 127345975ef..69b0d6a9ad7 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -779,6 +779,7 @@ dtb-$(CONFIG_MACH_SUN50I_H6) += \
 	sun50i-h6-tanix-tx6.dtb \
 	sun50i-h6-tanix-tx6-mini.dtb
 dtb-$(CONFIG_MACH_SUN50I_H616) += \
+	sun50i-h313-tanix-tx1.dtb \
 	sun50i-h616-orangepi-zero2.dtb \
 	sun50i-h618-orangepi-zero2w.dtb \
 	sun50i-h618-orangepi-zero3.dtb \
diff --git a/configs/tanix_tx1_defconfig b/configs/tanix_tx1_defconfig
new file mode 100644
index 00000000000..9915fff4a00
--- /dev/null
+++ b/configs/tanix_tx1_defconfig
@@ -0,0 +1,25 @@
+CONFIG_ARM=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_DEFAULT_DEVICE_TREE="sun50i-h313-tanix-tx1"
+CONFIG_SPL=y
+CONFIG_DRAM_SUN50I_H616_DX_ODT=0x06060606
+CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0d0d0d0d
+CONFIG_DRAM_SUN50I_H616_CA_DRI=0x1919
+CONFIG_DRAM_SUN50I_H616_ODT_EN=0x9988eeee
+CONFIG_DRAM_SUN50I_H616_TPR6=0x2fb08080
+CONFIG_DRAM_SUN50I_H616_TPR10=0x402f4469
+CONFIG_DRAM_SUN50I_H616_TPR11=0x0e0f0d0d
+CONFIG_DRAM_SUN50I_H616_TPR12=0x11131213
+CONFIG_MACH_SUN50I_H616=y
+CONFIG_SUNXI_DRAM_H616_LPDDR3=y
+CONFIG_R_I2C_ENABLE=y
+# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
+CONFIG_SPL_I2C=y
+CONFIG_SPL_SYS_I2C_LEGACY=y
+CONFIG_SYS_I2C_MVTWSI=y
+CONFIG_SYS_I2C_SLAVE=0x7f
+CONFIG_SYS_I2C_SPEED=400000
+CONFIG_AXP313_POWER=y
+CONFIG_AXP_DCDC3_VOLT=1200
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
-- 
2.35.8

