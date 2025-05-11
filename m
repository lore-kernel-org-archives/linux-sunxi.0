Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB52A3BBC9
	for <linux-sunxi@lists.linux.dev>; Sun, 11 May 2025 01:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746925822; cv=none; b=pmSKm5KTUqKw9p42zSAa2hu/mhtxtdC/W0GTF1TbFtuzqZG+gMCudOwouR5nb6PKBaMFN8QZDbSVams/wJqepm2fk4asW2tWfQ3H/rvH6FGnxyQNnRCUHvUWJiW/a/Fw1ADstEX4LRvEwnDviaZVm5ZfRRPfzGCTJUQMqvrbOjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746925822; c=relaxed/simple;
	bh=0qf2z2d2N3SW6AdS5iw2t+TX5jrMt5KPIf2j0N75gBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BhoIiwXlO5vFWDpEMQVAafH/LRrZzm+J3WDwWzObcoXWRFMXw4YtTjLdf9HyotNk1VS9h2IcjyClG4HE1ZNmogaSUJ//rYMCIcQWI9ATwelOmWjuKraT6k1xWk2X3CIfehGFmjmZJ5HqWFJws2H/yRqs6idmWCLFlcjukympdT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B12CB1516;
	Sat, 10 May 2025 18:10:09 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 759853F58B;
	Sat, 10 May 2025 18:10:19 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: u-boot@lists.denx.de
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	Philippe Simons <simons.philippe@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	linux-sunxi@lists.linux.dev,
	Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 6/6] sunxi: add support for Liontron H-A133L board
Date: Sun, 11 May 2025 02:10:03 +0100
Message-ID: <20250511011003.15654-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250511011003.15654-1-andre.przywara@arm.com>
References: <20250511011003.15654-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Liontron H-A133L is an industrial development board based on the
Allwinner A133 SoC. It uses LPDDR4 DRAM, eMMC, and an AXP707 PMIC.

Add a defconfig with the required DRAM settings.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 configs/liontron-h-a133l_defconfig | 37 ++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 configs/liontron-h-a133l_defconfig

diff --git a/configs/liontron-h-a133l_defconfig b/configs/liontron-h-a133l_defconfig
new file mode 100644
index 00000000000..4b769768e5f
--- /dev/null
+++ b/configs/liontron-h-a133l_defconfig
@@ -0,0 +1,37 @@
+CONFIG_ARM=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_DEFAULT_DEVICE_TREE="allwinner/sun50i-a133-liontron-h-a133l"
+CONFIG_SPL=y
+CONFIG_DRAM_SUNXI_DX_ODT=0x7070707
+CONFIG_DRAM_SUNXI_DX_DRI=0xd0d0d0d
+CONFIG_DRAM_SUNXI_CA_DRI=0xe0e
+CONFIG_DRAM_SUNXI_PARA0=0xd0a050c
+CONFIG_DRAM_SUNXI_MR11=0x4
+CONFIG_DRAM_SUNXI_MR12=0x72
+CONFIG_DRAM_SUNXI_MR13=0x0
+CONFIG_DRAM_SUNXI_MR14=0x7
+CONFIG_DRAM_SUNXI_TPR1=0x26
+CONFIG_DRAM_SUNXI_TPR2=0x6060606
+CONFIG_DRAM_SUNXI_TPR3=0x84040404
+CONFIG_DRAM_SUNXI_TPR6=0x48000000
+CONFIG_DRAM_SUNXI_TPR10=0x273333
+CONFIG_DRAM_SUNXI_TPR11=0x231d151c
+CONFIG_DRAM_SUNXI_TPR12=0x1212110e
+CONFIG_DRAM_SUNXI_TPR13=0x7521
+CONFIG_DRAM_SUNXI_TPR14=0x2023211f
+CONFIG_MACH_SUN50I_A133=y
+CONFIG_DRAM_CLK=792
+CONFIG_MMC_SUNXI_SLOT_EXTRA=2
+CONFIG_SUNXI_DRAM_A133_LPDDR4=y
+CONFIG_R_I2C_ENABLE=y
+# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
+CONFIG_SPL_I2C=y
+CONFIG_SPL_SYS_I2C_LEGACY=y
+CONFIG_SYS_I2C_MVTWSI=y
+CONFIG_SYS_I2C_SLAVE=0x7f
+CONFIG_SYS_I2C_SPEED=400000
+CONFIG_AXP803_POWER=y
+CONFIG_AXP_DCDC5_VOLT=1100
+CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
-- 
2.46.3

