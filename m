Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25DBF8C13
	for <linux-sunxi@lists.linux.dev>; Sun, 26 Nov 2023 17:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 472D2C15;
	Sun, 26 Nov 2023 09:18:39 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C0DF3F73F;
	Sun, 26 Nov 2023 09:17:50 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] sunxi: H616: OrangePi Zero 2: enable USB power supply
Date: Sun, 26 Nov 2023 17:16:36 +0000
Message-Id: <20231126171636.29076-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OrangePi Zero 2 has a USB VBUS regulator, controlled by pin PC16.
This is correctly described in the DT, but the patches for supporting
this are still pending.

Meanwhile add our good old CONFIG_USB1_VBUS_PIN to the defconfig file,
to enable power on the USB port and allow using a USB flash drive, for
instance.

Fixes: 6acc5fa581b4 ("sunxi: H616: enable USB support for H616 boards")
Reported-by: Mikhail Kalashnikov <iuncuim@gmail.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 configs/orangepi_zero2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_zero2_defconfig b/configs/orangepi_zero2_defconfig
index 127cf9e365a..98aed846f1f 100644
--- a/configs/orangepi_zero2_defconfig
+++ b/configs/orangepi_zero2_defconfig
@@ -8,6 +8,7 @@ CONFIG_DRAM_SUN50I_H616_CA_DRI=0x0e0e
 CONFIG_DRAM_SUN50I_H616_TPR10=0xf83438
 CONFIG_MACH_SUN50I_H616=y
 CONFIG_SUNXI_DRAM_H616_DDR3_1333=y
+CONFIG_USB1_VBUS_PIN="PC16"
 CONFIG_R_I2C_ENABLE=y
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-- 
2.35.8

