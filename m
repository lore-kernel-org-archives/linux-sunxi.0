Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56F7239E75
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Jun 2025 23:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749770400; cv=none; b=srCKYruP/3cYfEDtJGgtrFYSCA1v0yoMA64p0mQdId+JuiqixIThQAIyFVCRRshtqtV1ar3+ugFyZ6+6C+9QeMLT7UGYmKrzLhFU+MEg+n5FScx0I1F2bO2FLl34/4pv8idIGe4/QXL/JqreIF6aweCm7OO4vqm44bOkZ5IpLpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749770400; c=relaxed/simple;
	bh=UQ4ETyskigECl7m4l1E+qN8BJncTLlbCXA0RDn94Ovw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jke95iW0/Klj+HCMi35Kk7JauPqIDmRn61m8KnnljhnghRgdn0Bw6NmmnZ6keNYeFHeXzSFTTOJGjK+T9LkahZbGg5lwQ+SWegNKC8bI8Kuq8Dcf7OIx3Resp3V3nOAbNyhwYsp+bop+DPr/9uYTy/XgbsUVc4EP5lKCY7GOQgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F5E31D31;
	Thu, 12 Jun 2025 16:19:37 -0700 (PDT)
Received: from e134369.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0040F3F59E;
	Thu, 12 Jun 2025 16:19:55 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Tom Rini <trini@konsulko.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/2] sunxi: H616: add support for YuzukiHD Chameleon board
Date: Fri, 13 Jun 2025 00:19:45 +0100
Message-ID: <20250612231945.981893-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612231945.981893-1-andre.przywara@arm.com>
References: <20250612231945.981893-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Chameleon board is an OpenHardware devboard made by YuzukiTsuru,
featuring an Allwinner H616 SoC. The form factor resembles the Raspberry
Pi Model A boards, though it differs significantly in its features.
Apart from the usual peripherals of those kind of boards (SD card, eMMC,
WiFi, HDMI), it features four USB-C 2.0 ports.

Add a defconfig for the board, the DRAM parameters have been extracted
from the firmware shipped with the board.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 configs/yuzukihd-chameleon_defconfig | 30 ++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 configs/yuzukihd-chameleon_defconfig

diff --git a/configs/yuzukihd-chameleon_defconfig b/configs/yuzukihd-chameleon_defconfig
new file mode 100644
index 00000000000..883be12c4ef
--- /dev/null
+++ b/configs/yuzukihd-chameleon_defconfig
@@ -0,0 +1,30 @@
+CONFIG_ARM=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_DEFAULT_DEVICE_TREE="allwinner/sun50i-h618-yuzukihd-chameleon"
+CONFIG_SPL=y
+CONFIG_DRAM_SUNXI_DX_ODT=0x03030303
+CONFIG_DRAM_SUNXI_DX_DRI=0x0e0e0e0e
+CONFIG_DRAM_SUNXI_CA_DRI=0x1c12
+CONFIG_DRAM_SUNXI_ODT_EN=0x1
+CONFIG_DRAM_SUNXI_TPR6=0x33808080
+CONFIG_DRAM_SUNXI_TPR10=0x002f0006
+CONFIG_DRAM_SUNXI_TPR11=0xddddcccc
+CONFIG_DRAM_SUNXI_TPR12=0xeddc7564
+CONFIG_MACH_SUN50I_H616=y
+CONFIG_SUNXI_DRAM_H616_DDR3_1333=y
+CONFIG_DRAM_CLK=648
+CONFIG_MMC_SUNXI_SLOT_EXTRA=2
+CONFIG_R_I2C_ENABLE=y
+CONFIG_SPL_SPI_SUNXI=y
+# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
+CONFIG_SPL_I2C=y
+CONFIG_SPL_SYS_I2C_LEGACY=y
+CONFIG_SYS_I2C_MVTWSI=y
+CONFIG_SYS_I2C_SLAVE=0x7f
+CONFIG_SYS_I2C_SPEED=400000
+CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_AXP313_POWER=y
+CONFIG_AXP_DCDC3_VOLT=1500
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
+CONFIG_USB_MUSB_GADGET=y
-- 
2.43.0

