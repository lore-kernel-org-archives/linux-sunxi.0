Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31FC72
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Jul 2021 23:23:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DE4231B;
	Mon,  5 Jul 2021 16:23:58 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2AD33F5A1;
	Mon,  5 Jul 2021 16:23:56 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Simon Glass <sjg@chromium.org>
Cc: Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] cmd: ums: Enable by default for sunxi
Date: Tue,  6 Jul 2021 00:23:19 +0100
Message-Id: <20210705232319.15149-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

The ums command (presenting a U-Boot block device as a USB mass storage
device) is very useful for accessing eMMC devices via USB-OTG.

At the moment we enable USB fastboot by default for Allwinner devices,
so it makes sense to do the same with USB mass storage, which is
actually more versatile and can be accessed on any USB host easily.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 cmd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/cmd/Kconfig b/cmd/Kconfig
index a9fb4eead29..7b1c96910a8 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -1347,6 +1347,7 @@ config CMD_USB_MASS_STORAGE
 	bool "UMS usb mass storage"
 	select USB_FUNCTION_MASS_STORAGE
 	depends on BLK && USB_GADGET
+	default y if ARCH_SUNXI && USB_MUSB_GADGET
 	help
 	  Enables the command "ums" and the USB mass storage support to the
 	  export a block device: U-Boot, the USB device, acts as a simple
-- 
2.17.5

