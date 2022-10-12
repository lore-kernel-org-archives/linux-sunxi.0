Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBB0256E
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 16:26:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF97F165C;
	Wed, 12 Oct 2022 09:26:21 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 983573F766;
	Wed, 12 Oct 2022 09:26:14 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH] sunxi: defconfig: Add X96 Mate TV box
Date: Wed, 12 Oct 2022 17:26:10 +0100
Message-Id: <20221012162610.1968666-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X96 Mate TV box is a TV box with the Allwinner H616 SoC. It is
available with up to 4GB of DRAM and 64GB eMMC.
The DRAM chips require a different configuration when compared to the
OrangePi Zero2, we must not use read/write training and write leveling.

Add a defconfig for the box, so that we can easily build U-Boot for it.
We synced the .dts file already from the kernel tree.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 configs/x96_mate_defconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 configs/x96_mate_defconfig

diff --git a/configs/x96_mate_defconfig b/configs/x96_mate_defconfig
new file mode 100644
index 00000000000..4276f4f543b
--- /dev/null
+++ b/configs/x96_mate_defconfig
@@ -0,0 +1,15 @@
+CONFIG_ARM=y
+CONFIG_ARCH_SUNXI=y
+CONFIG_DEFAULT_DEVICE_TREE="sun50i-h616-x96-mate"
+CONFIG_SPL=y
+CONFIG_DRAM_SUN50I_H616_READ_CALIBRATION=y
+CONFIG_MACH_SUN50I_H616=y
+CONFIG_MMC0_CD_PIN="PF6"
+CONFIG_R_I2C_ENABLE=y
+# CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
+CONFIG_SPL_I2C=y
+CONFIG_SPL_SYS_I2C_LEGACY=y
+CONFIG_SYS_I2C_MVTWSI=y
+CONFIG_SYS_I2C_SLAVE=0x7f
+CONFIG_SYS_I2C_SPEED=400000
+CONFIG_SUPPORT_EMMC_BOOT=y
-- 
2.25.1

