Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CEAC2FB1
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 00:37:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 885D612FC;
	Sun, 23 May 2021 17:37:11 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EA933F73D;
	Sun, 23 May 2021 17:37:09 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Simon Glass <sjg@chromium.org>,
	Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Patrick Delaunay <patrick.delaunay@foss.st.com>,
	Sean Anderson <sean.anderson@seco.com>,
	Heiko Schocher <hs@denx.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: [RFC PATCH 3/3] sunxi: Drop sunxi FASTBOOT_FLASH_MMC_DEV defaults
Date: Mon, 24 May 2021 01:36:50 +0100
Message-Id: <20210524003650.24469-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210524003650.24469-1-andre.przywara@arm.com>
References: <20210524003650.24469-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Now that we have a runtime function to decide the default MMC device to
use on Allwinner boards, we don't need the hardcoded Kconfig variable
anymore (we do the same logic at runtime now).

Drop the sunxi defaults, and since there is only one other user left,
use one generic default of 0 now. An "int" type KConfig variable needs a
default anyway, (even when this is never used), otherwise *every* user
has to specify one.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/fastboot/Kconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/fastboot/Kconfig b/drivers/fastboot/Kconfig
index 2d1836a80e0..06536e249c4 100644
--- a/drivers/fastboot/Kconfig
+++ b/drivers/fastboot/Kconfig
@@ -98,9 +98,7 @@ endchoice
 config FASTBOOT_FLASH_MMC_DEV
 	int "Define FASTBOOT MMC FLASH default device"
 	depends on FASTBOOT_FLASH_MMC
-	default 0 if ARCH_ROCKCHIP
-	default 0 if ARCH_SUNXI && MMC_SUNXI_SLOT_EXTRA = -1
-	default 1 if ARCH_SUNXI && MMC_SUNXI_SLOT_EXTRA != -1
+	default 0
 	help
 	  The fastboot "flash" command requires additional information
 	  regarding the non-volatile storage device. Define this to
-- 
2.17.5

