Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40477EF
	for <linux-sunxi@lists.linux.dev>; Wed, 24 Apr 2024 00:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713917911; cv=none; b=LalQ7m1/D7V85KL4wjIqnI5Gwp4LjNc12vwIM6rVh/2f4zTHsyD46y+R5NFA+t9JKU0EbAMC4TW8rRd3YbJWJu4WqZrjFgXtAZ78tU5wZQz3D/XaSrKpFuvIojp/U0MuxOvurExINIgm2JyhX2AA8LUHj35Dsy4SQI84hZI1Dow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713917911; c=relaxed/simple;
	bh=7wjFrlFHZSByRTa3+AMyl3YaN0KZ0rT76yHwoHU3H08=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FlufIH5CvzWBKwnSPgio+m/Ma02huYQlT3Un5Y0dhPXxp/raJZGGBt0iajjDx/HTChpIm2fEuOd19lNpUDFugRGYBy6GOOaMLM/jQeol42RxWM66l9K4AWhnRap1RiHqKMS0oXV6c1HOYPCVN1A7g6ICPeITxW6FtB7tylzo2k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE3B71042;
	Tue, 23 Apr 2024 17:18:56 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FE2D3F7BD;
	Tue, 23 Apr 2024 17:18:28 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH 2/4] sunxi: a64: Add Remix Mini PC support
Date: Wed, 24 Apr 2024 01:18:06 +0100
Message-Id: <20240424001808.14388-3-andre.przywara@arm.com>
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

The Remix Mini PC is a "mini computer" using the Allwinner H64 SoC,
which appears to be just a relabelled A64. It was launched in 2015 by
the now defunct company Jide, and shipped with a desktop optimised
version of Android. Its appearance and feature set is close to a
typical TV box.

The devicetree file has been imported from the Linux tree already, so
just add a defconfig and enable the DTB build in the Makefile. The SoC
has the "secure boot" fuse burnt, so we need to generate a TOC0 image
instead of the standard Allwinner eGON image format for the SPL.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/dts/Makefile           |  3 ++-
 configs/remix-mini-pc_defconfig | 14 ++++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 configs/remix-mini-pc_defconfig

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index b1c9c6222e5..127345975ef 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -801,7 +801,8 @@ dtb-$(CONFIG_MACH_SUN50I) += \
 	sun50i-a64-pinephone-1.2.dtb \
 	sun50i-a64-pinetab.dtb \
 	sun50i-a64-sopine-baseboard.dtb \
-	sun50i-a64-teres-i.dtb
+	sun50i-a64-teres-i.dtb \
+	sun50i-h64-remix-mini-pc.dtb
 dtb-$(CONFIG_MACH_SUN9I) += \
 	sun9i-a80-optimus.dtb \
 	sun9i-a80-cubieboard4.dtb \
diff --git a/configs/remix-mini-pc_defconfig b/configs/remix-mini-pc_defconfig
new file mode 100644
index 00000000000..fa427a027f8
--- /dev/null
+++ b/configs/remix-mini-pc_defconfig
@@ -0,0 +1,14 @@
+CONFIG_ARM=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_DEFAULT_DEVICE_TREE="sun50i-h64-remix-mini-pc"
+CONFIG_SPL=y
+CONFIG_MACH_SUN50I=y
+CONFIG_DRAM_CLK=672
+CONFIG_DRAM_ZQ=4013533
+CONFIG_MMC_SUNXI_SLOT_EXTRA=2
+CONFIG_SPL_IMAGE_TYPE_SUNXI_TOC0=y
+# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
+CONFIG_CMD_POWEROFF=y
+CONFIG_SUPPORT_EMMC_BOOT=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
-- 
2.35.8

