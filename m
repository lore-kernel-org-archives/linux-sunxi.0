Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BAC372
	for <linux-sunxi@lists.linux.dev>; Wed,  5 May 2021 12:52:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A08EED1;
	Wed,  5 May 2021 05:52:15 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B2043F718;
	Wed,  5 May 2021 05:52:13 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Marek Vasut <marex@denx.de>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>,
	Jagan Teki <jagan@amarulasolutions.com>,
	u-boot@lists.denx.de,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2] usb: musb-new: Extend and move Allwinner quirk into Kconfig
Date: Wed,  5 May 2021 13:51:03 +0100
Message-Id: <20210505125103.20467-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

All newer Allwinner SoCs (since about 2013) miss the CONFIGDATA register
in their MUSB implementation, so they need a quirk to hardcode this.

Currently this quirk depends on listing the SoCs affected in musb_reg.h,
which means that this list needs to grow with every new chip.

Move the quirk feature into Kconfig, next to PIO_ONLY, and change the
default to y (for Allwinner builds), while listing the early
implementations as exceptions.

This fixes USB peripheral operation on some newer SoCs, which were not
explicitly listed before.

Tested on H6, H616, R40 (which were broken before), and also on the H5
and A20, for regressions.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

a bit more elaborate than the first version, but hopefully cleaner and
more robust this time: we should never need to add anything to get new
SoCs covered.

Cheers,
Andre

Changelog v1 .. v2:
- Add Kconfig variable
- Switch to listing the exceptions instead of all affected SoCs

 drivers/usb/musb-new/Kconfig     | 10 ++++++++++
 drivers/usb/musb-new/musb_regs.h |  3 +--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb-new/Kconfig b/drivers/usb/musb-new/Kconfig
index 6cf8a2b60b6..fd6f4109b0e 100644
--- a/drivers/usb/musb-new/Kconfig
+++ b/drivers/usb/musb-new/Kconfig
@@ -89,3 +89,13 @@ config USB_MUSB_PIO_ONLY
 	help
 	  All data is copied between memory and FIFO by the CPU.
 	  DMA controllers are ignored.
+
+config USB_MUSB_FIXED_CONFIGDATA
+	bool "Hardcode MUSB CONFIGDATA register"
+	depends on USB_MUSB_SUNXI
+	default n if MACH_SUN4I || MACH_SUN5I || MACH_SUN6I || MACH_SUN7I || MACH_SUN8I_A23
+	default y
+	help
+	  Newer Allwinner SoCs do not implement the MUSB_CONFIGDATA register,
+	  so it always reads 0. Select this option to override this and
+	  return a hardcoded value instead.
diff --git a/drivers/usb/musb-new/musb_regs.h b/drivers/usb/musb-new/musb_regs.h
index c4d7203b851..e9362f6def3 100644
--- a/drivers/usb/musb-new/musb_regs.h
+++ b/drivers/usb/musb-new/musb_regs.h
@@ -431,8 +431,7 @@ static inline u8 musb_read_ulpi_buscontrol(void __iomem *mbase)
 
 static inline u8 musb_read_configdata(void __iomem *mbase)
 {
-#if defined CONFIG_MACH_SUN8I_A33 || defined CONFIG_MACH_SUN8I_A83T || \
-		defined CONFIG_MACH_SUNXI_H3_H5 || defined CONFIG_MACH_SUN50I
+#ifdef CONFIG_USB_MUSB_FIXED_CONFIGDATA
 	/* <Sigh> allwinner saves a reg, and we need to hardcode this */
 	return 0xde;
 #else
-- 
2.17.5

