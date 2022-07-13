Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0763646B2
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Jul 2022 16:21:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF7E615A1;
	Wed, 13 Jul 2022 09:21:57 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CC0D3F792;
	Wed, 13 Jul 2022 09:21:56 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/3] sunxi: remove CONFIG_MMC?_CD_PIN
Date: Wed, 13 Jul 2022 17:21:45 +0100
Message-Id: <20220713162145.95744-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713162145.95744-1-andre.przywara@arm.com>
References: <20220713162145.95744-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For legacy reasons we were defining the card detect GPIO for all sunxi
boards in each board's defconfig.
There is actually no need for a card-detect check in the SPL code (which
consequently has been removed already), and also in U-Boot proper we
have DM code to query the CD GPIO name from the device tree.

That means we don't have any user of that information left, so can
remove the definitions from the defconfigs.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-sunxi/Kconfig                  | 27 --------------------
 configs/A10-OLinuXino-Lime_defconfig         |  1 -
 configs/A10s-OLinuXino-M_defconfig           |  2 --
 configs/A13-OLinuXinoM_defconfig             |  1 -
 configs/A13-OLinuXino_defconfig              |  1 -
 configs/A20-OLinuXino-Lime2-eMMC_defconfig   |  1 -
 configs/A20-OLinuXino-Lime2_defconfig        |  1 -
 configs/A20-OLinuXino-Lime_defconfig         |  1 -
 configs/A20-OLinuXino_MICRO-eMMC_defconfig   |  1 -
 configs/A20-OLinuXino_MICRO_defconfig        |  2 --
 configs/A20-Olimex-SOM-EVB_defconfig         |  2 --
 configs/A20-Olimex-SOM204-EVB-eMMC_defconfig |  1 -
 configs/A20-Olimex-SOM204-EVB_defconfig      |  1 -
 configs/A33-OLinuXino_defconfig              |  1 -
 configs/Ainol_AW1_defconfig                  |  1 -
 configs/Ampe_A76_defconfig                   |  1 -
 configs/Bananapi_M2_Ultra_defconfig          |  1 -
 configs/Bananapi_m2m_defconfig               |  1 -
 configs/Cubieboard2_defconfig                |  1 -
 configs/Cubieboard4_defconfig                |  1 -
 configs/Cubieboard_defconfig                 |  1 -
 configs/Cubietruck_defconfig                 |  1 -
 configs/Empire_electronix_d709_defconfig     |  1 -
 configs/Empire_electronix_m712_defconfig     |  1 -
 configs/Itead_Ibox_A20_defconfig             |  1 -
 configs/Lamobo_R1_defconfig                  |  1 -
 configs/Mele_M3_defconfig                    |  1 -
 configs/Mele_M5_defconfig                    |  1 -
 configs/Merrii_A80_Optimus_defconfig         |  1 -
 configs/Orangepi_mini_defconfig              |  2 --
 configs/Sinlinx_SinA31s_defconfig            |  1 -
 configs/Sinlinx_SinA33_defconfig             |  1 -
 configs/Sunchip_CX-A99_defconfig             |  1 -
 configs/UTOO_P66_defconfig                   |  1 -
 configs/Wobo_i5_defconfig                    |  1 -
 configs/Yones_Toptech_BD1078_defconfig       |  2 --
 configs/Yones_Toptech_BS1078_V2_defconfig    |  1 -
 configs/bananapi_m2_berry_defconfig          |  1 -
 configs/bananapi_m2_zero_defconfig           |  1 -
 configs/bananapi_m64_defconfig               |  1 -
 configs/beelink_gs1_defconfig                |  1 -
 configs/colorfly_e708_q1_defconfig           |  1 -
 configs/difrnce_dit4350_defconfig            |  1 -
 configs/dserve_dsrv9703c_defconfig           |  1 -
 configs/gt90h_v4_defconfig                   |  1 -
 configs/iNet_3F_defconfig                    |  1 -
 configs/iNet_3W_defconfig                    |  1 -
 configs/iNet_D978_rev2_defconfig             |  1 -
 configs/icnova-a20-swac_defconfig            |  1 -
 configs/inet86dz_defconfig                   |  1 -
 configs/inet98v_rev2_defconfig               |  1 -
 configs/inet_q972_defconfig                  |  1 -
 configs/nanopi_m1_plus_defconfig             |  1 -
 configs/oceanic_5205_5inmfd_defconfig        |  1 -
 configs/orangepi_3_defconfig                 |  1 -
 configs/orangepi_lite2_defconfig             |  1 -
 configs/orangepi_one_plus_defconfig          |  1 -
 configs/orangepi_zero2_defconfig             |  1 -
 configs/orangepi_zero_plus2_defconfig        |  1 -
 configs/orangepi_zero_plus2_h3_defconfig     |  1 -
 configs/parrot_r16_defconfig                 |  1 -
 configs/pine64-lts_defconfig                 |  1 -
 configs/pine_h64_defconfig                   |  1 -
 configs/polaroid_mid2407pxe03_defconfig      |  1 -
 configs/polaroid_mid2809pxe04_defconfig      |  1 -
 configs/q8_a13_tablet_defconfig              |  1 -
 configs/q8_a23_tablet_800x480_defconfig      |  1 -
 configs/q8_a33_tablet_1024x600_defconfig     |  1 -
 configs/q8_a33_tablet_800x480_defconfig      |  1 -
 configs/sopine_baseboard_defconfig           |  1 -
 configs/tanix_tx6_defconfig                  |  1 -
 71 files changed, 102 deletions(-)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 71a7f8dcee..5378eed154 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -638,33 +638,6 @@ config MACPWR
 	  Set the pin used to power the MAC. This takes a string in the format
 	  understood by sunxi_name_to_gpio, e.g. PH1 for pin 1 of port H.
 
-config MMC0_CD_PIN
-	string "Card detect pin for mmc0"
-	default "PF6" if MACH_SUN8I_A83T || MACH_SUNXI_H3_H5 || MACH_SUN50I
-	default ""
-	---help---
-	Set the card detect pin for mmc0, leave empty to not use cd. This
-	takes a string in the format understood by sunxi_name_to_gpio, e.g.
-	PH1 for pin 1 of port H.
-
-config MMC1_CD_PIN
-	string "Card detect pin for mmc1"
-	default ""
-	---help---
-	See MMC0_CD_PIN help text.
-
-config MMC2_CD_PIN
-	string "Card detect pin for mmc2"
-	default ""
-	---help---
-	See MMC0_CD_PIN help text.
-
-config MMC3_CD_PIN
-	string "Card detect pin for mmc3"
-	default ""
-	---help---
-	See MMC0_CD_PIN help text.
-
 config MMC1_PINS_PH
 	bool "Pins for mmc1 are on Port H"
 	depends on MACH_SUN4I || MACH_SUN7I || MACH_SUN8I_R40
diff --git a/configs/A10-OLinuXino-Lime_defconfig b/configs/A10-OLinuXino-Lime_defconfig
index 26a921279b..0b294707a7 100644
--- a/configs/A10-OLinuXino-Lime_defconfig
+++ b/configs/A10-OLinuXino-Lime_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN4I=y
 CONFIG_DRAM_CLK=480
 CONFIG_DRAM_EMR1=4
 CONFIG_SYS_CLK_FREQ=912000000
-CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_I2C1_ENABLE=y
 CONFIG_SATAPWR="PC3"
 CONFIG_AHCI=y
diff --git a/configs/A10s-OLinuXino-M_defconfig b/configs/A10s-OLinuXino-M_defconfig
index 7e9b92ee5e..8c6c1afc16 100644
--- a/configs/A10s-OLinuXino-M_defconfig
+++ b/configs/A10s-OLinuXino-M_defconfig
@@ -4,8 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun5i-a10s-olinuxino-micro"
 CONFIG_SPL=y
 CONFIG_MACH_SUN5I=y
 CONFIG_DRAM_CLK=432
-CONFIG_MMC0_CD_PIN="PG1"
-CONFIG_MMC1_CD_PIN="PG13"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=1
 CONFIG_USB1_VBUS_PIN="PB10"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
diff --git a/configs/A13-OLinuXinoM_defconfig b/configs/A13-OLinuXinoM_defconfig
index 625a331e44..ed31d2b8bc 100644
--- a/configs/A13-OLinuXinoM_defconfig
+++ b/configs/A13-OLinuXinoM_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN5I=y
 CONFIG_DRAM_CLK=408
 CONFIG_DRAM_EMR1=0
-CONFIG_MMC0_CD_PIN="PG0"
 CONFIG_USB1_VBUS_PIN="PG11"
 # CONFIG_VIDEO_HDMI is not set
 CONFIG_VIDEO_VGA_VIA_LCD=y
diff --git a/configs/A13-OLinuXino_defconfig b/configs/A13-OLinuXino_defconfig
index 5e0396c150..a79f98d620 100644
--- a/configs/A13-OLinuXino_defconfig
+++ b/configs/A13-OLinuXino_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN5I=y
 CONFIG_DRAM_CLK=408
 CONFIG_DRAM_EMR1=0
-CONFIG_MMC0_CD_PIN="PG0"
 CONFIG_USB0_VBUS_DET="PG1"
 CONFIG_USB1_VBUS_PIN="PG11"
 CONFIG_AXP_GPIO=y
diff --git a/configs/A20-OLinuXino-Lime2-eMMC_defconfig b/configs/A20-OLinuXino-Lime2-eMMC_defconfig
index b5802818ec..d3627cc761 100644
--- a/configs/A20-OLinuXino-Lime2-eMMC_defconfig
+++ b/configs/A20-OLinuXino-Lime2-eMMC_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-olinuxino-lime2-emmc"
 CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=384
-CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_USB0_VBUS_PIN="PC17"
 CONFIG_USB0_VBUS_DET="PH5"
diff --git a/configs/A20-OLinuXino-Lime2_defconfig b/configs/A20-OLinuXino-Lime2_defconfig
index de4f6311f2..841edb46ba 100644
--- a/configs/A20-OLinuXino-Lime2_defconfig
+++ b/configs/A20-OLinuXino-Lime2_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-olinuxino-lime2"
 CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=384
-CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_USB0_VBUS_PIN="PC17"
 CONFIG_USB0_VBUS_DET="PH5"
 CONFIG_I2C1_ENABLE=y
diff --git a/configs/A20-OLinuXino-Lime_defconfig b/configs/A20-OLinuXino-Lime_defconfig
index ebb3a02b82..761e14d861 100644
--- a/configs/A20-OLinuXino-Lime_defconfig
+++ b/configs/A20-OLinuXino-Lime_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-olinuxino-lime"
 CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=384
-CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_I2C1_ENABLE=y
 CONFIG_SATAPWR="PC3"
 CONFIG_AHCI=y
diff --git a/configs/A20-OLinuXino_MICRO-eMMC_defconfig b/configs/A20-OLinuXino_MICRO-eMMC_defconfig
index c8802435b4..cb350fe980 100644
--- a/configs/A20-OLinuXino_MICRO-eMMC_defconfig
+++ b/configs/A20-OLinuXino_MICRO-eMMC_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-olinuxino-micro-emmc"
 CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=384
-CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_I2C1_ENABLE=y
 CONFIG_VIDEO_VGA=y
diff --git a/configs/A20-OLinuXino_MICRO_defconfig b/configs/A20-OLinuXino_MICRO_defconfig
index f449641245..e3d675ff71 100644
--- a/configs/A20-OLinuXino_MICRO_defconfig
+++ b/configs/A20-OLinuXino_MICRO_defconfig
@@ -4,8 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-olinuxino-micro"
 CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=384
-CONFIG_MMC0_CD_PIN="PH1"
-CONFIG_MMC3_CD_PIN="PH11"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=3
 CONFIG_I2C1_ENABLE=y
 CONFIG_VIDEO_VGA=y
diff --git a/configs/A20-Olimex-SOM-EVB_defconfig b/configs/A20-Olimex-SOM-EVB_defconfig
index 67b47f51f1..edaad3b4bd 100644
--- a/configs/A20-Olimex-SOM-EVB_defconfig
+++ b/configs/A20-Olimex-SOM-EVB_defconfig
@@ -4,8 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-olimex-som-evb"
 CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=384
-CONFIG_MMC0_CD_PIN="PH1"
-CONFIG_MMC3_CD_PIN="PH0"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=3
 CONFIG_USB0_VBUS_PIN="PB9"
 CONFIG_USB0_VBUS_DET="PH5"
diff --git a/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig b/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig
index e02d67da5e..0312e40761 100644
--- a/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig
+++ b/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-olimex-som204-evb-emmc"
 CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=384
-CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_USB0_VBUS_PIN="PC17"
 CONFIG_USB0_VBUS_DET="PH5"
diff --git a/configs/A20-Olimex-SOM204-EVB_defconfig b/configs/A20-Olimex-SOM204-EVB_defconfig
index 317a1e695d..f5f4f66439 100644
--- a/configs/A20-Olimex-SOM204-EVB_defconfig
+++ b/configs/A20-Olimex-SOM204-EVB_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-olimex-som204-evb"
 CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=384
-CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_USB0_VBUS_PIN="PC17"
 CONFIG_USB0_VBUS_DET="PH5"
 CONFIG_I2C1_ENABLE=y
diff --git a/configs/A33-OLinuXino_defconfig b/configs/A33-OLinuXino_defconfig
index c9eec1f887..7f17c2d7ac 100644
--- a/configs/A33-OLinuXino_defconfig
+++ b/configs/A33-OLinuXino_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN8I_A33=y
 CONFIG_DRAM_CLK=432
 CONFIG_DRAM_ZQ=15291
 CONFIG_DRAM_ODT_EN=y
-CONFIG_MMC0_CD_PIN="PB4"
 CONFIG_USB0_VBUS_PIN="AXP0-VBUS-ENABLE"
 CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
 CONFIG_USB0_ID_DET="PB3"
diff --git a/configs/Ainol_AW1_defconfig b/configs/Ainol_AW1_defconfig
index 8cd38f7905..c25e7948dc 100644
--- a/configs/Ainol_AW1_defconfig
+++ b/configs/Ainol_AW1_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=432
 CONFIG_DRAM_ZQ=123
-CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_USB0_VBUS_PIN="PB9"
 CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
 CONFIG_AXP_GPIO=y
diff --git a/configs/Ampe_A76_defconfig b/configs/Ampe_A76_defconfig
index 68707ed3e9..f58356f337 100644
--- a/configs/Ampe_A76_defconfig
+++ b/configs/Ampe_A76_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun5i-a13-ampe-a76"
 CONFIG_SPL=y
 CONFIG_MACH_SUN5I=y
 CONFIG_DRAM_CLK=432
-CONFIG_MMC0_CD_PIN="PG0"
 CONFIG_USB0_VBUS_PIN="PG12"
 CONFIG_USB0_VBUS_DET="PG1"
 CONFIG_USB0_ID_DET="PG2"
diff --git a/configs/Bananapi_M2_Ultra_defconfig b/configs/Bananapi_M2_Ultra_defconfig
index be5be9ae2f..5a462cd1be 100644
--- a/configs/Bananapi_M2_Ultra_defconfig
+++ b/configs/Bananapi_M2_Ultra_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_R40=y
 CONFIG_DRAM_CLK=576
 CONFIG_MACPWR="PA17"
-CONFIG_MMC0_CD_PIN="PH13"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_USB1_VBUS_PIN="PH23"
 CONFIG_USB2_VBUS_PIN="PH23"
diff --git a/configs/Bananapi_m2m_defconfig b/configs/Bananapi_m2m_defconfig
index 6a07f26c02..9d933a89fe 100644
--- a/configs/Bananapi_m2m_defconfig
+++ b/configs/Bananapi_m2m_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN8I_A33=y
 CONFIG_DRAM_CLK=600
 CONFIG_DRAM_ZQ=15291
 CONFIG_DRAM_ODT_EN=y
-CONFIG_MMC0_CD_PIN="PB4"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_USB0_ID_DET="PH8"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
diff --git a/configs/Cubieboard2_defconfig b/configs/Cubieboard2_defconfig
index 315c52f344..c1617b7031 100644
--- a/configs/Cubieboard2_defconfig
+++ b/configs/Cubieboard2_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-cubieboard2"
 CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=480
-CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_SATAPWR="PB8"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
diff --git a/configs/Cubieboard4_defconfig b/configs/Cubieboard4_defconfig
index 928299e8a5..d947c52961 100644
--- a/configs/Cubieboard4_defconfig
+++ b/configs/Cubieboard4_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun9i-a80-cubieboard4"
 CONFIG_SPL=y
 CONFIG_MACH_SUN9I=y
 CONFIG_DRAM_CLK=672
-CONFIG_MMC0_CD_PIN="PH18"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_USB0_VBUS_PIN="AXP0-VBUS-ENABLE"
 CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
diff --git a/configs/Cubieboard_defconfig b/configs/Cubieboard_defconfig
index 49eb018695..4e3ebd8b51 100644
--- a/configs/Cubieboard_defconfig
+++ b/configs/Cubieboard_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-cubieboard"
 CONFIG_SPL=y
 CONFIG_MACH_SUN4I=y
 CONFIG_DRAM_CLK=480
-CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_SATAPWR="PB8"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
diff --git a/configs/Cubietruck_defconfig b/configs/Cubietruck_defconfig
index 62668df01e..5a45fd08af 100644
--- a/configs/Cubietruck_defconfig
+++ b/configs/Cubietruck_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-cubietruck"
 CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=432
-CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_USB0_VBUS_PIN="PH17"
 CONFIG_USB0_VBUS_DET="PH22"
 CONFIG_USB0_ID_DET="PH19"
diff --git a/configs/Empire_electronix_d709_defconfig b/configs/Empire_electronix_d709_defconfig
index 0187b896f8..9f1d91c8e2 100644
--- a/configs/Empire_electronix_d709_defconfig
+++ b/configs/Empire_electronix_d709_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN5I=y
 CONFIG_DRAM_CLK=432
 CONFIG_DRAM_EMR1=0
-CONFIG_MMC0_CD_PIN="PG0"
 CONFIG_USB0_VBUS_PIN="PG12"
 CONFIG_USB0_VBUS_DET="PG1"
 CONFIG_USB0_ID_DET="PG2"
diff --git a/configs/Empire_electronix_m712_defconfig b/configs/Empire_electronix_m712_defconfig
index 6570b97ca4..8b8e92ef80 100644
--- a/configs/Empire_electronix_m712_defconfig
+++ b/configs/Empire_electronix_m712_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun5i-a13-empire-electronix-m712"
 CONFIG_SPL=y
 CONFIG_MACH_SUN5I=y
 CONFIG_DRAM_CLK=408
-CONFIG_MMC0_CD_PIN="PG0"
 CONFIG_USB0_VBUS_PIN="PG12"
 CONFIG_USB0_VBUS_DET="PG1"
 CONFIG_USB0_ID_DET="PG2"
diff --git a/configs/Itead_Ibox_A20_defconfig b/configs/Itead_Ibox_A20_defconfig
index 1a16155584..88f8865b28 100644
--- a/configs/Itead_Ibox_A20_defconfig
+++ b/configs/Itead_Ibox_A20_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-itead-ibox"
 CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=480
-CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_SATAPWR="PB8"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
diff --git a/configs/Lamobo_R1_defconfig b/configs/Lamobo_R1_defconfig
index 3627e4dd3a..1a93b43fbb 100644
--- a/configs/Lamobo_R1_defconfig
+++ b/configs/Lamobo_R1_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=432
 CONFIG_MACPWR="PH23"
-CONFIG_MMC0_CD_PIN="PH10"
 CONFIG_SATAPWR="PB3"
 CONFIG_GMAC_TX_DELAY=4
 CONFIG_AHCI=y
diff --git a/configs/Mele_M3_defconfig b/configs/Mele_M3_defconfig
index ce962395a2..94e4be627c 100644
--- a/configs/Mele_M3_defconfig
+++ b/configs/Mele_M3_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-m3"
 CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=384
-CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_VIDEO_VGA=y
 CONFIG_VIDEO_COMPOSITE=y
diff --git a/configs/Mele_M5_defconfig b/configs/Mele_M5_defconfig
index 2e6d5dd460..4c0bae9815 100644
--- a/configs/Mele_M5_defconfig
+++ b/configs/Mele_M5_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=432
 CONFIG_DRAM_ZQ=122
-CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_VIDEO_COMPOSITE=y
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
diff --git a/configs/Merrii_A80_Optimus_defconfig b/configs/Merrii_A80_Optimus_defconfig
index 3709a11ec0..10bef3d621 100644
--- a/configs/Merrii_A80_Optimus_defconfig
+++ b/configs/Merrii_A80_Optimus_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun9i-a80-optimus"
 CONFIG_SPL=y
 CONFIG_MACH_SUN9I=y
 CONFIG_DRAM_CLK=672
-CONFIG_MMC0_CD_PIN="PH18"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_USB0_VBUS_PIN="AXP0-VBUS-ENABLE"
 CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
diff --git a/configs/Orangepi_mini_defconfig b/configs/Orangepi_mini_defconfig
index 720e9e5df4..b1d41898d1 100644
--- a/configs/Orangepi_mini_defconfig
+++ b/configs/Orangepi_mini_defconfig
@@ -5,8 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=432
 CONFIG_MACPWR="PH23"
-CONFIG_MMC0_CD_PIN="PH10"
-CONFIG_MMC3_CD_PIN="PH11"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=3
 CONFIG_USB1_VBUS_PIN="PH26"
 CONFIG_USB2_VBUS_PIN="PH22"
diff --git a/configs/Sinlinx_SinA31s_defconfig b/configs/Sinlinx_SinA31s_defconfig
index 2d33331f3d..c2935ac83a 100644
--- a/configs/Sinlinx_SinA31s_defconfig
+++ b/configs/Sinlinx_SinA31s_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN6I=y
 CONFIG_DRAM_CLK=432
 CONFIG_DRAM_ZQ=251
-CONFIG_MMC0_CD_PIN="PA4"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=3
 CONFIG_USB1_VBUS_PIN=""
 CONFIG_USB2_VBUS_PIN=""
diff --git a/configs/Sinlinx_SinA33_defconfig b/configs/Sinlinx_SinA33_defconfig
index fcee14b546..0452275450 100644
--- a/configs/Sinlinx_SinA33_defconfig
+++ b/configs/Sinlinx_SinA33_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_A33=y
 CONFIG_DRAM_CLK=552
 CONFIG_DRAM_ZQ=15291
-CONFIG_MMC0_CD_PIN="PB4"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_USB0_ID_DET="PH8"
 CONFIG_VIDEO_LCD_MODE="x:1024,y:600,depth:18,pclk_khz:66000,le:90,ri:160,up:3,lo:127,hs:70,vs:20,sync:3,vmode:0"
diff --git a/configs/Sunchip_CX-A99_defconfig b/configs/Sunchip_CX-A99_defconfig
index 749bf1cff9..4828bab92a 100644
--- a/configs/Sunchip_CX-A99_defconfig
+++ b/configs/Sunchip_CX-A99_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN9I=y
 CONFIG_DRAM_CLK=600
 CONFIG_DRAM_ZQ=3881915
 CONFIG_DRAM_ODT_EN=y
-CONFIG_MMC0_CD_PIN="PH17"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_USB0_VBUS_PIN="PH15"
 CONFIG_USB1_VBUS_PIN="PL7"
diff --git a/configs/UTOO_P66_defconfig b/configs/UTOO_P66_defconfig
index 4e6652db18..03ab5c06eb 100644
--- a/configs/UTOO_P66_defconfig
+++ b/configs/UTOO_P66_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN5I=y
 CONFIG_DRAM_CLK=432
 CONFIG_DRAM_EMR1=0
-CONFIG_MMC0_CD_PIN="PG0"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_USB0_VBUS_PIN="PB04"
 CONFIG_USB0_VBUS_DET="PG01"
diff --git a/configs/Wobo_i5_defconfig b/configs/Wobo_i5_defconfig
index ab919c0795..309a2f265f 100644
--- a/configs/Wobo_i5_defconfig
+++ b/configs/Wobo_i5_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun5i-a10s-wobo-i5"
 CONFIG_SPL=y
 CONFIG_MACH_SUN5I=y
 CONFIG_DRAM_CLK=432
-CONFIG_MMC0_CD_PIN="PB3"
 CONFIG_USB1_VBUS_PIN="PG12"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_STACK=0x8000
diff --git a/configs/Yones_Toptech_BD1078_defconfig b/configs/Yones_Toptech_BD1078_defconfig
index 1117e147cc..b5c1e6845b 100644
--- a/configs/Yones_Toptech_BD1078_defconfig
+++ b/configs/Yones_Toptech_BD1078_defconfig
@@ -4,8 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun7i-a20-yones-toptech-bd1078"
 CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=408
-CONFIG_MMC0_CD_PIN="PH1"
-CONFIG_MMC1_CD_PIN="PH2"
 CONFIG_MMC1_PINS_PH=y
 CONFIG_MMC_SUNXI_SLOT_EXTRA=1
 CONFIG_USB0_VBUS_PIN="PB9"
diff --git a/configs/Yones_Toptech_BS1078_V2_defconfig b/configs/Yones_Toptech_BS1078_V2_defconfig
index ef30aee828..a178fdda6f 100644
--- a/configs/Yones_Toptech_BS1078_V2_defconfig
+++ b/configs/Yones_Toptech_BS1078_V2_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN6I=y
 CONFIG_DRAM_CLK=420
 CONFIG_DRAM_ZQ=251
-CONFIG_MMC0_CD_PIN="PA8"
 CONFIG_USB0_VBUS_PIN="AXP0-VBUS-ENABLE"
 CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
 CONFIG_USB0_ID_DET="PA15"
diff --git a/configs/bananapi_m2_berry_defconfig b/configs/bananapi_m2_berry_defconfig
index e6b8f0f8a3..39bd81abca 100644
--- a/configs/bananapi_m2_berry_defconfig
+++ b/configs/bananapi_m2_berry_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun8i-v40-bananapi-m2-berry"
 CONFIG_SPL=y
 CONFIG_MACH_SUN8I_R40=y
 CONFIG_DRAM_CLK=576
-CONFIG_MMC0_CD_PIN="PH13"
 CONFIG_USB1_VBUS_PIN="PH23"
 # CONFIG_HAS_ARMV7_SECURE_BASE is not set
 CONFIG_AHCI=y
diff --git a/configs/bananapi_m2_zero_defconfig b/configs/bananapi_m2_zero_defconfig
index 6a3594c093..96437ca1fe 100644
--- a/configs/bananapi_m2_zero_defconfig
+++ b/configs/bananapi_m2_zero_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun8i-h2-plus-bananapi-m2-zero"
 CONFIG_SPL=y
 CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=408
-CONFIG_MMC0_CD_PIN=""
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_STACK=0x8000
 CONFIG_SYS_PBSIZE=1024
diff --git a/configs/bananapi_m64_defconfig b/configs/bananapi_m64_defconfig
index 36aa80a09b..558075ef70 100644
--- a/configs/bananapi_m64_defconfig
+++ b/configs/bananapi_m64_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun50i-a64-bananapi-m64"
 CONFIG_SPL=y
 CONFIG_MACH_SUN50I=y
 CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
-CONFIG_MMC0_CD_PIN="PH13"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_STACK=0x54000
diff --git a/configs/beelink_gs1_defconfig b/configs/beelink_gs1_defconfig
index 2c440e44f5..680e045ccd 100644
--- a/configs/beelink_gs1_defconfig
+++ b/configs/beelink_gs1_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun50i-h6-beelink-gs1"
 CONFIG_SPL=y
 CONFIG_MACH_SUN50I_H6=y
 CONFIG_SUNXI_DRAM_H6_LPDDR3=y
-CONFIG_MMC0_CD_PIN="PF6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_PSCI_RESET is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
diff --git a/configs/colorfly_e708_q1_defconfig b/configs/colorfly_e708_q1_defconfig
index f17083310a..6e4fdf7065 100644
--- a/configs/colorfly_e708_q1_defconfig
+++ b/configs/colorfly_e708_q1_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN6I=y
 CONFIG_DRAM_CLK=432
 CONFIG_DRAM_ZQ=251
-CONFIG_MMC0_CD_PIN="PA8"
 CONFIG_USB0_VBUS_PIN="AXP0-VBUS-ENABLE"
 CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
 CONFIG_USB0_ID_DET="PA15"
diff --git a/configs/difrnce_dit4350_defconfig b/configs/difrnce_dit4350_defconfig
index a3917eaf17..72139324a5 100644
--- a/configs/difrnce_dit4350_defconfig
+++ b/configs/difrnce_dit4350_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun5i-a13-difrnce-dit4350"
 CONFIG_SPL=y
 CONFIG_MACH_SUN5I=y
 CONFIG_DRAM_CLK=408
-CONFIG_MMC0_CD_PIN="PG0"
 CONFIG_USB0_VBUS_PIN="PG12"
 CONFIG_USB0_VBUS_DET="PG1"
 CONFIG_USB0_ID_DET="PG2"
diff --git a/configs/dserve_dsrv9703c_defconfig b/configs/dserve_dsrv9703c_defconfig
index c737cdb4d9..82c3e3da97 100644
--- a/configs/dserve_dsrv9703c_defconfig
+++ b/configs/dserve_dsrv9703c_defconfig
@@ -3,7 +3,6 @@ CONFIG_ARCH_SUNXI=y
 CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-dserve-dsrv9703c"
 CONFIG_SPL=y
 CONFIG_MACH_SUN4I=y
-CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_USB0_VBUS_PIN="PB9"
 CONFIG_USB0_VBUS_DET="PH5"
 CONFIG_USB0_ID_DET="PH4"
diff --git a/configs/gt90h_v4_defconfig b/configs/gt90h_v4_defconfig
index c81f0f6c5e..422e2a81b8 100644
--- a/configs/gt90h_v4_defconfig
+++ b/configs/gt90h_v4_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_A23=y
 CONFIG_DRAM_CLK=480
 CONFIG_DRAM_ZQ=32767
-CONFIG_MMC0_CD_PIN="PB4"
 CONFIG_USB0_VBUS_PIN="AXP0-VBUS-ENABLE"
 CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
 CONFIG_USB0_ID_DET="PH8"
diff --git a/configs/iNet_3F_defconfig b/configs/iNet_3F_defconfig
index 8b6936497f..0c8d8f3d91 100644
--- a/configs/iNet_3F_defconfig
+++ b/configs/iNet_3F_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN4I=y
 CONFIG_DRAM_CLK=432
 CONFIG_DRAM_EMR1=4
-CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_USB0_VBUS_PIN="PB9"
 CONFIG_USB0_VBUS_DET="PH5"
 CONFIG_VIDEO_LCD_MODE="x:1024,y:768,depth:18,pclk_khz:100000,le:799,ri:260,up:15,lo:16,hs:1,vs:1,sync:3,vmode:0"
diff --git a/configs/iNet_3W_defconfig b/configs/iNet_3W_defconfig
index a05876a18f..340208f9ae 100644
--- a/configs/iNet_3W_defconfig
+++ b/configs/iNet_3W_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN4I=y
 CONFIG_DRAM_CLK=408
 CONFIG_DRAM_ZQ=127
 CONFIG_DRAM_EMR1=4
-CONFIG_MMC0_CD_PIN="PH20"
 CONFIG_USB0_VBUS_PIN="PB9"
 CONFIG_USB0_VBUS_DET="PH5"
 CONFIG_VIDEO_LCD_MODE="x:1024,y:768,depth:24,pclk_khz:65000,le:159,ri:160,up:22,lo:15,hs:1,vs:1,sync:3,vmode:0"
diff --git a/configs/iNet_D978_rev2_defconfig b/configs/iNet_D978_rev2_defconfig
index 664745c9f1..d29eb30224 100644
--- a/configs/iNet_D978_rev2_defconfig
+++ b/configs/iNet_D978_rev2_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_A33=y
 CONFIG_DRAM_CLK=456
 CONFIG_DRAM_ZQ=15291
-CONFIG_MMC0_CD_PIN="PB4"
 CONFIG_USB0_VBUS_PIN="AXP0-VBUS-ENABLE"
 CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
 CONFIG_USB0_ID_DET="PH8"
diff --git a/configs/icnova-a20-swac_defconfig b/configs/icnova-a20-swac_defconfig
index afe5b28e66..0708ece5c7 100644
--- a/configs/icnova-a20-swac_defconfig
+++ b/configs/icnova-a20-swac_defconfig
@@ -11,7 +11,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=384
 CONFIG_OLD_SUNXI_KERNEL_COMPAT=y
-CONFIG_MMC0_CD_PIN="PI5"
 CONFIG_USB0_VBUS_PIN="PG11"
 CONFIG_USB0_VBUS_DET="PH7"
 CONFIG_USB1_VBUS_PIN="PG10"
diff --git a/configs/inet86dz_defconfig b/configs/inet86dz_defconfig
index 0382a4a054..3ae52cb25e 100644
--- a/configs/inet86dz_defconfig
+++ b/configs/inet86dz_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_A23=y
 CONFIG_DRAM_CLK=552
 CONFIG_DRAM_ZQ=63351
-CONFIG_MMC0_CD_PIN="PB4"
 CONFIG_USB0_VBUS_PIN="AXP0-VBUS-ENABLE"
 CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
 CONFIG_USB0_ID_DET="PH8"
diff --git a/configs/inet98v_rev2_defconfig b/configs/inet98v_rev2_defconfig
index c392fc2bb8..21b60cc60a 100644
--- a/configs/inet98v_rev2_defconfig
+++ b/configs/inet98v_rev2_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun5i-a13-inet-98v-rev2"
 CONFIG_SPL=y
 CONFIG_MACH_SUN5I=y
 CONFIG_DRAM_CLK=432
-CONFIG_MMC0_CD_PIN="PG0"
 CONFIG_USB0_VBUS_PIN="PG12"
 CONFIG_USB0_VBUS_DET="PG1"
 CONFIG_USB0_ID_DET="PG2"
diff --git a/configs/inet_q972_defconfig b/configs/inet_q972_defconfig
index a4a828c70a..11cbe4f8dc 100644
--- a/configs/inet_q972_defconfig
+++ b/configs/inet_q972_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN6I=y
 CONFIG_DRAM_CLK=384
 CONFIG_DRAM_ZQ=251
-CONFIG_MMC0_CD_PIN="PA8"
 CONFIG_USB0_VBUS_PIN="AXP0-VBUS-ENABLE"
 CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
 CONFIG_USB0_ID_DET="PA15"
diff --git a/configs/nanopi_m1_plus_defconfig b/configs/nanopi_m1_plus_defconfig
index c71d721f74..888cabc2f0 100644
--- a/configs/nanopi_m1_plus_defconfig
+++ b/configs/nanopi_m1_plus_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=408
 CONFIG_MACPWR="PD6"
-CONFIG_MMC0_CD_PIN="PH13"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_STACK=0x8000
diff --git a/configs/oceanic_5205_5inmfd_defconfig b/configs/oceanic_5205_5inmfd_defconfig
index 1cd8e9f2b6..ea63376073 100644
--- a/configs/oceanic_5205_5inmfd_defconfig
+++ b/configs/oceanic_5205_5inmfd_defconfig
@@ -7,7 +7,6 @@ CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_SUNXI_DRAM_LPDDR3_STOCK=y
 CONFIG_DRAM_CLK=552
 CONFIG_DRAM_ZQ=3881949
-CONFIG_MMC0_CD_PIN=""
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_STACK=0x54000
diff --git a/configs/orangepi_3_defconfig b/configs/orangepi_3_defconfig
index dbca66d142..5b7459f63d 100644
--- a/configs/orangepi_3_defconfig
+++ b/configs/orangepi_3_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun50i-h6-orangepi-3"
 CONFIG_SPL=y
 CONFIG_MACH_SUN50I_H6=y
 CONFIG_SUNXI_DRAM_H6_LPDDR3=y
-CONFIG_MMC0_CD_PIN="PF6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_BLUETOOTH_DT_DEVICE_FIXUP="brcm,bcm4345c5"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
diff --git a/configs/orangepi_lite2_defconfig b/configs/orangepi_lite2_defconfig
index 14c8806281..3cb94150aa 100644
--- a/configs/orangepi_lite2_defconfig
+++ b/configs/orangepi_lite2_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun50i-h6-orangepi-lite2"
 CONFIG_SPL=y
 CONFIG_MACH_SUN50I_H6=y
 CONFIG_SUNXI_DRAM_H6_LPDDR3=y
-CONFIG_MMC0_CD_PIN="PF6"
 # CONFIG_PSCI_RESET is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_STACK=0x118000
diff --git a/configs/orangepi_one_plus_defconfig b/configs/orangepi_one_plus_defconfig
index a4336332fc..da77dc6cef 100644
--- a/configs/orangepi_one_plus_defconfig
+++ b/configs/orangepi_one_plus_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun50i-h6-orangepi-one-plus"
 CONFIG_SPL=y
 CONFIG_MACH_SUN50I_H6=y
 CONFIG_SUNXI_DRAM_H6_LPDDR3=y
-CONFIG_MMC0_CD_PIN="PF6"
 # CONFIG_PSCI_RESET is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_STACK=0x118000
diff --git a/configs/orangepi_zero2_defconfig b/configs/orangepi_zero2_defconfig
index cad7a7bb06..6996a073fb 100644
--- a/configs/orangepi_zero2_defconfig
+++ b/configs/orangepi_zero2_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_SUN50I_H616_READ_CALIBRATION=y
 CONFIG_DRAM_SUN50I_H616_READ_TRAINING=y
 CONFIG_DRAM_SUN50I_H616_WRITE_TRAINING=y
 CONFIG_MACH_SUN50I_H616=y
-CONFIG_MMC0_CD_PIN="PF6"
 CONFIG_R_I2C_ENABLE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_MAX_SIZE=0xbfa0
diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 02f70ccf0c..34f1c71d2f 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN50I_H5=y
 CONFIG_DRAM_CLK=672
 CONFIG_DRAM_ZQ=3881977
 # CONFIG_DRAM_ODT_EN is not set
-CONFIG_MMC0_CD_PIN="PH13"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_STACK=0x54000
diff --git a/configs/orangepi_zero_plus2_h3_defconfig b/configs/orangepi_zero_plus2_h3_defconfig
index b2d4f3f8e0..eb52a3d3cc 100644
--- a/configs/orangepi_zero_plus2_h3_defconfig
+++ b/configs/orangepi_zero_plus2_h3_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=672
 # CONFIG_DRAM_ODT_EN is not set
-CONFIG_MMC0_CD_PIN="PH13"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_STACK=0x8000
diff --git a/configs/parrot_r16_defconfig b/configs/parrot_r16_defconfig
index 14e9b455fe..68674ea2c7 100644
--- a/configs/parrot_r16_defconfig
+++ b/configs/parrot_r16_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_A33=y
 CONFIG_DRAM_CLK=600
 CONFIG_DRAM_ZQ=15291
-CONFIG_MMC0_CD_PIN="PD14"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_USB0_ID_DET="PD10"
 CONFIG_USB1_VBUS_PIN="PD12"
diff --git a/configs/pine64-lts_defconfig b/configs/pine64-lts_defconfig
index 3f9ea1e329..9fd2e3d807 100644
--- a/configs/pine64-lts_defconfig
+++ b/configs/pine64-lts_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN50I=y
 CONFIG_SUNXI_DRAM_LPDDR3_STOCK=y
 CONFIG_DRAM_CLK=552
 CONFIG_DRAM_ZQ=3881949
-CONFIG_MMC0_CD_PIN=""
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
diff --git a/configs/pine_h64_defconfig b/configs/pine_h64_defconfig
index 2f511c8051..2d3dedcc56 100644
--- a/configs/pine_h64_defconfig
+++ b/configs/pine_h64_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN50I_H6=y
 CONFIG_SUNXI_DRAM_H6_LPDDR3=y
 CONFIG_MACPWR="PC16"
-CONFIG_MMC0_CD_PIN="PF6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_USB3_VBUS_PIN="PL5"
 CONFIG_SPL_SPI_SUNXI=y
diff --git a/configs/polaroid_mid2407pxe03_defconfig b/configs/polaroid_mid2407pxe03_defconfig
index 74ffaf1d01..46538d63f6 100644
--- a/configs/polaroid_mid2407pxe03_defconfig
+++ b/configs/polaroid_mid2407pxe03_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_A23=y
 CONFIG_DRAM_CLK=432
 CONFIG_DRAM_ZQ=63351
-CONFIG_MMC0_CD_PIN="PB4"
 CONFIG_USB0_VBUS_PIN="AXP0-VBUS-ENABLE"
 CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
 CONFIG_USB0_ID_DET="PH8"
diff --git a/configs/polaroid_mid2809pxe04_defconfig b/configs/polaroid_mid2809pxe04_defconfig
index 10057ade9a..b2019aa476 100644
--- a/configs/polaroid_mid2809pxe04_defconfig
+++ b/configs/polaroid_mid2809pxe04_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_A23=y
 CONFIG_DRAM_CLK=432
 CONFIG_DRAM_ZQ=63351
-CONFIG_MMC0_CD_PIN="PB4"
 CONFIG_USB0_VBUS_PIN="AXP0-VBUS-ENABLE"
 CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
 CONFIG_USB0_ID_DET="PH8"
diff --git a/configs/q8_a13_tablet_defconfig b/configs/q8_a13_tablet_defconfig
index 83981d3ac7..4717d2f97f 100644
--- a/configs/q8_a13_tablet_defconfig
+++ b/configs/q8_a13_tablet_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun5i-a13-q8-tablet"
 CONFIG_SPL=y
 CONFIG_MACH_SUN5I=y
 CONFIG_DRAM_CLK=384
-CONFIG_MMC0_CD_PIN="PG0"
 CONFIG_USB0_VBUS_PIN="PG12"
 CONFIG_USB0_VBUS_DET="PG1"
 CONFIG_USB0_ID_DET="PG2"
diff --git a/configs/q8_a23_tablet_800x480_defconfig b/configs/q8_a23_tablet_800x480_defconfig
index 11d208a34a..da9c77167e 100644
--- a/configs/q8_a23_tablet_800x480_defconfig
+++ b/configs/q8_a23_tablet_800x480_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_A23=y
 CONFIG_DRAM_CLK=432
 CONFIG_DRAM_ZQ=63306
-CONFIG_MMC0_CD_PIN="PB4"
 CONFIG_USB0_VBUS_PIN="AXP0-VBUS-ENABLE"
 CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
 CONFIG_USB0_ID_DET="PH8"
diff --git a/configs/q8_a33_tablet_1024x600_defconfig b/configs/q8_a33_tablet_1024x600_defconfig
index c848e62d73..4d8ba26d1e 100644
--- a/configs/q8_a33_tablet_1024x600_defconfig
+++ b/configs/q8_a33_tablet_1024x600_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_A33=y
 CONFIG_DRAM_CLK=456
 CONFIG_DRAM_ZQ=15291
-CONFIG_MMC0_CD_PIN="PB4"
 CONFIG_USB0_VBUS_PIN="AXP0-VBUS-ENABLE"
 CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
 CONFIG_USB0_ID_DET="PH8"
diff --git a/configs/q8_a33_tablet_800x480_defconfig b/configs/q8_a33_tablet_800x480_defconfig
index ee5654185b..c19b057e35 100644
--- a/configs/q8_a33_tablet_800x480_defconfig
+++ b/configs/q8_a33_tablet_800x480_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_A33=y
 CONFIG_DRAM_CLK=456
 CONFIG_DRAM_ZQ=15291
-CONFIG_MMC0_CD_PIN="PB4"
 CONFIG_USB0_VBUS_PIN="AXP0-VBUS-ENABLE"
 CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
 CONFIG_USB0_ID_DET="PH8"
diff --git a/configs/sopine_baseboard_defconfig b/configs/sopine_baseboard_defconfig
index 55116f72d0..cbabd10f06 100644
--- a/configs/sopine_baseboard_defconfig
+++ b/configs/sopine_baseboard_defconfig
@@ -7,7 +7,6 @@ CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_SUNXI_DRAM_LPDDR3_STOCK=y
 CONFIG_DRAM_CLK=552
 CONFIG_DRAM_ZQ=3881949
-CONFIG_MMC0_CD_PIN=""
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
diff --git a/configs/tanix_tx6_defconfig b/configs/tanix_tx6_defconfig
index 84dbf106d4..c854d546aa 100644
--- a/configs/tanix_tx6_defconfig
+++ b/configs/tanix_tx6_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN50I_H6=y
 CONFIG_SUNXI_DRAM_H6_DDR3_1333=y
 CONFIG_DRAM_CLK=648
-CONFIG_MMC0_CD_PIN="PF6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_SPL_STACK=0x118000
-- 
2.25.1

