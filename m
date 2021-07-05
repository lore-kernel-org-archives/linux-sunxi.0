Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B795177
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Jul 2021 23:05:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A9151396;
	Mon,  5 Jul 2021 16:05:23 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 790EB3F73B;
	Mon,  5 Jul 2021 16:05:22 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/3] sunxi: OrangePi Zero 2: Enable SPI booting
Date: Tue,  6 Jul 2021 00:04:45 +0100
Message-Id: <20210705230445.14834-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210705230445.14834-1-andre.przywara@arm.com>
References: <20210705230445.14834-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

The OrangePi Zero 2 board comes with 2MB of SPI flash, from which the
BROM is supposed to be able to boot from.

Enable the SPL code responsible for finding and loading U-Boot proper and
friends, so that u-boot-sunxi-with-spl.bin can be written into the flash.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 configs/orangepi_zero2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_zero2_defconfig b/configs/orangepi_zero2_defconfig
index 72574a89a29..b99b624dcc3 100644
--- a/configs/orangepi_zero2_defconfig
+++ b/configs/orangepi_zero2_defconfig
@@ -9,6 +9,7 @@ CONFIG_DRAM_SUN50I_H616_WRITE_TRAINING=y
 CONFIG_MACH_SUN50I_H616=y
 CONFIG_MMC0_CD_PIN="PF6"
 CONFIG_R_I2C_ENABLE=y
+CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_I2C_SUPPORT=y
 CONFIG_PHY_REALTEK=y
-- 
2.17.5

