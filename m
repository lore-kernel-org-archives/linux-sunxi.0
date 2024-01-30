Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFEB6D1BA
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Jan 2024 14:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706624221; cv=none; b=iXDmjAVC81kn7LQIh2Lxr7d0rHVWhpmT1IiQGvjl7WkRlVelBUM4CMlZdc1way+rzjV4Vp4VV0LpcG8k+QXGUFbjAGBO66C3kKUXYPmwoY0eFLGZTriJBNjc9TR4is/vvHtEI5qaroBDXBq87qA8Q27l8bHpj9HfPlq67b1h/bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706624221; c=relaxed/simple;
	bh=ZirbeBgbKUGOQhE2NSueTtTcHfUsNyn5n1v88kap3Ig=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GdZ2H0QzGn9Ikx4ZeCTunieZZFw5DJhpNtFN115VNqZrj6xz7PZtA40gf8Ra6+xDGLcR1KaJmq2LyD44yZc6Z1ZgtyqBMo/a1CebAbawMDk63KPbaSUIiV4XFn3/5yCSHVniZPfZTRQWAKIk5YPN5BMf1ASABsP4sVDUVSjtsq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5667DDA7;
	Tue, 30 Jan 2024 06:17:37 -0800 (PST)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF05F3F762;
	Tue, 30 Jan 2024 06:16:51 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	linux-sunxi@lists.linux.dev
Cc: u-boot@lists.denx.de,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Marc Zyngier <maz@kernel.org>,
	James McGregor <james.mcgregor2@arm.com>
Subject: [PATCH] sunxi: H616: Add OrangePi Zero 2W board support
Date: Tue, 30 Jan 2024 14:16:42 +0000
Message-Id: <20240130141642.2714470-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OrangePi Zero 2W is a tiny development board featuring the Allwinner
H618 SoC, shipping with up to 4GB of LPDDR4 DRAM, a mini-HDMI connector,
two USB Type-C sockets and a 16MB SPI NOR flash.
There is an FPC connector to connect an expansion board, which sports
two more USB Type-A sockets and a 100MBit Ethernet port. Support for
the expansion board is not in the DT yet, probably a DT overlay would
cover this in the future.

Add a defconfig file selecting the right drivers and DRAM options.
Since the .dts file was synced from the Linux kernel repo already, we
just need to add one line to the Makefile to actually build the .dtb.

The DRAM parameters were derived from the values found in the BSP DRAM
drivers on the SPI NOR flash.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/dts/Makefile             |  1 +
 board/sunxi/MAINTAINERS           |  5 +++++
 configs/orangepi_zero2w_defconfig | 30 ++++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+)
 create mode 100644 configs/orangepi_zero2w_defconfig

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 0d4b917fb3b..ed3978037ed 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -837,6 +837,7 @@ dtb-$(CONFIG_MACH_SUN50I_H6) += \
 	sun50i-h6-tanix-tx6-mini.dtb
 dtb-$(CONFIG_MACH_SUN50I_H616) += \
 	sun50i-h616-orangepi-zero2.dtb \
+	sun50i-h618-orangepi-zero2w.dtb \
 	sun50i-h618-orangepi-zero3.dtb \
 	sun50i-h618-transpeed-8k618-t.dtb \
 	sun50i-h616-x96-mate.dtb
diff --git a/board/sunxi/MAINTAINERS b/board/sunxi/MAINTAINERS
index a2da6a4a7a2..4bcd9b9af7f 100644
--- a/board/sunxi/MAINTAINERS
+++ b/board/sunxi/MAINTAINERS
@@ -460,6 +460,11 @@ M:	Jernej Skrabec <jernej.skrabec@siol.net>
 S:	Maintained
 F:	configs/orangepi_zero2_defconfig
 
+ORANGEPI ZERO 2W BOARD
+M:	Andre Przywara <andre.przywara@arm.com>
+S:	Maintained
+F:	configs/orangepi_zero2w_defconfig
+
 ORANGEPI ZERO 3 BOARD
 M:	Andre Przywara <andre.przywara@arm.com>
 S:	Maintained
diff --git a/configs/orangepi_zero2w_defconfig b/configs/orangepi_zero2w_defconfig
new file mode 100644
index 00000000000..5734d9d839c
--- /dev/null
+++ b/configs/orangepi_zero2w_defconfig
@@ -0,0 +1,30 @@
+CONFIG_ARM=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_DEFAULT_DEVICE_TREE="sun50i-h618-orangepi-zero2w"
+CONFIG_SPL=y
+CONFIG_DRAM_SUN50I_H616_DX_ODT=0x07070707
+CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
+CONFIG_DRAM_SUN50I_H616_CA_DRI=0x0e0e
+CONFIG_DRAM_SUN50I_H616_ODT_EN=0xaaaaeeee
+CONFIG_DRAM_SUN50I_H616_TPR6=0x48808080
+CONFIG_DRAM_SUN50I_H616_TPR10=0x402f6663
+CONFIG_DRAM_SUN50I_H616_TPR11=0x26262524
+CONFIG_DRAM_SUN50I_H616_TPR12=0x100f100f
+CONFIG_MACH_SUN50I_H616=y
+CONFIG_SUNXI_DRAM_H616_LPDDR4=y
+CONFIG_DRAM_CLK=792
+CONFIG_R_I2C_ENABLE=y
+CONFIG_SPL_SPI_SUNXI=y
+# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
+CONFIG_SPL_I2C=y
+CONFIG_SPL_SYS_I2C_LEGACY=y
+CONFIG_SYS_I2C_MVTWSI=y
+CONFIG_SYS_I2C_SLAVE=0x7f
+CONFIG_SYS_I2C_SPEED=400000
+CONFIG_MTD=y
+CONFIG_SPI_FLASH_ZBIT=y
+CONFIG_AXP313_POWER=y
+CONFIG_SPI=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_MUSB_GADGET=y
-- 
2.25.1

