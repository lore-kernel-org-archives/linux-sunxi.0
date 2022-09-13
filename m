Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23A7671B
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Sep 2022 23:33:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D28E1A32;
	Tue, 13 Sep 2022 16:33:55 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 421E93F73B;
	Tue, 13 Sep 2022 16:33:44 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>,
	Jagan Teki <jagan@amarulasolutions.com>
Cc: Simon Glass <sjg@chromium.org>,
	Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/2] sunxi: defconfig: drop redundant definitions
Date: Wed, 14 Sep 2022 00:32:17 +0100
Message-Id: <20220913233217.24717-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220913233217.24717-1-andre.przywara@arm.com>
References: <20220913233217.24717-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When some configuration symbols were converted from header files to
Kconfig, their values were placed into *every* defconfig file.
Since we now have sensible per-SoC defaults defined in Kconfig, those
values are now redundant, and can just be removed.
This affects CONFIG_SPL_STACK, CONFIG_SYS_PBSIZE, CONFIG_SPL_MAX_SIZE,
and CONFIG_SYS_BOOTM_LEN.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 configs/A10-OLinuXino-Lime_defconfig           | 2 --
 configs/A10s-OLinuXino-M_defconfig             | 2 --
 configs/A13-OLinuXinoM_defconfig               | 2 --
 configs/A13-OLinuXino_defconfig                | 2 --
 configs/A20-OLinuXino-Lime2-eMMC_defconfig     | 2 --
 configs/A20-OLinuXino-Lime2_defconfig          | 2 --
 configs/A20-OLinuXino-Lime_defconfig           | 2 --
 configs/A20-OLinuXino_MICRO-eMMC_defconfig     | 2 --
 configs/A20-OLinuXino_MICRO_defconfig          | 2 --
 configs/A20-Olimex-SOM-EVB_defconfig           | 2 --
 configs/A20-Olimex-SOM204-EVB-eMMC_defconfig   | 2 --
 configs/A20-Olimex-SOM204-EVB_defconfig        | 2 --
 configs/A33-OLinuXino_defconfig                | 2 --
 configs/Ainol_AW1_defconfig                    | 2 --
 configs/Ampe_A76_defconfig                     | 2 --
 configs/Auxtek-T003_defconfig                  | 2 --
 configs/Auxtek-T004_defconfig                  | 2 --
 configs/Bananapi_M2_Ultra_defconfig            | 2 --
 configs/Bananapi_defconfig                     | 2 --
 configs/Bananapi_m2m_defconfig                 | 2 --
 configs/Bananapro_defconfig                    | 2 --
 configs/CHIP_defconfig                         | 2 --
 configs/CHIP_pro_defconfig                     | 2 --
 configs/CSQ_CS908_defconfig                    | 2 --
 configs/Chuwi_V7_CW0825_defconfig              | 2 --
 configs/Colombus_defconfig                     | 2 --
 configs/Cubieboard2_defconfig                  | 2 --
 configs/Cubieboard4_defconfig                  | 2 --
 configs/Cubieboard_defconfig                   | 2 --
 configs/Cubietruck_defconfig                   | 2 --
 configs/Cubietruck_plus_defconfig              | 2 --
 configs/Empire_electronix_d709_defconfig       | 2 --
 configs/Empire_electronix_m712_defconfig       | 2 --
 configs/Hummingbird_A31_defconfig              | 2 --
 configs/Hyundai_A7HD_defconfig                 | 2 --
 configs/Itead_Ibox_A20_defconfig               | 2 --
 configs/Lamobo_R1_defconfig                    | 2 --
 configs/LicheePi_Zero_defconfig                | 2 --
 configs/Linksprite_pcDuino3_Nano_defconfig     | 2 --
 configs/Linksprite_pcDuino3_defconfig          | 2 --
 configs/Linksprite_pcDuino_defconfig           | 2 --
 configs/MK808C_defconfig                       | 2 --
 configs/MSI_Primo73_defconfig                  | 2 --
 configs/MSI_Primo81_defconfig                  | 2 --
 configs/Marsboard_A10_defconfig                | 2 --
 configs/Mele_A1000G_quad_defconfig             | 2 --
 configs/Mele_A1000_defconfig                   | 2 --
 configs/Mele_I7_defconfig                      | 2 --
 configs/Mele_M3_defconfig                      | 2 --
 configs/Mele_M5_defconfig                      | 2 --
 configs/Mele_M9_defconfig                      | 2 --
 configs/Merrii_A80_Optimus_defconfig           | 2 --
 configs/Mini-X_defconfig                       | 2 --
 configs/Nintendo_NES_Classic_Edition_defconfig | 2 --
 configs/Orangepi_defconfig                     | 2 --
 configs/Orangepi_mini_defconfig                | 2 --
 configs/Sinlinx_SinA31s_defconfig              | 2 --
 configs/Sinlinx_SinA33_defconfig               | 2 --
 configs/Sinovoip_BPI_M2_defconfig              | 2 --
 configs/Sinovoip_BPI_M3_defconfig              | 2 --
 configs/Sunchip_CX-A99_defconfig               | 2 --
 configs/UTOO_P66_defconfig                     | 2 --
 configs/Wexler_TAB7200_defconfig               | 2 --
 configs/Wits_Pro_A20_DKT_defconfig             | 2 --
 configs/Wobo_i5_defconfig                      | 2 --
 configs/Yones_Toptech_BD1078_defconfig         | 2 --
 configs/Yones_Toptech_BS1078_V2_defconfig      | 2 --
 configs/a64-olinuxino-emmc_defconfig           | 3 ---
 configs/a64-olinuxino_defconfig                | 3 ---
 configs/amarula_a64_relic_defconfig            | 3 ---
 configs/ba10_tv_box_defconfig                  | 2 --
 configs/bananapi_m1_plus_defconfig             | 2 --
 configs/bananapi_m2_berry_defconfig            | 2 --
 configs/bananapi_m2_plus_h3_defconfig          | 2 --
 configs/bananapi_m2_plus_h5_defconfig          | 3 ---
 configs/bananapi_m2_zero_defconfig             | 2 --
 configs/bananapi_m64_defconfig                 | 3 ---
 configs/beelink_gs1_defconfig                  | 3 ---
 configs/beelink_x2_defconfig                   | 2 --
 configs/colorfly_e708_q1_defconfig             | 2 --
 configs/difrnce_dit4350_defconfig              | 2 --
 configs/dserve_dsrv9703c_defconfig             | 2 --
 configs/emlid_neutis_n5_devboard_defconfig     | 3 ---
 configs/ga10h_v1_1_defconfig                   | 2 --
 configs/gt90h_v4_defconfig                     | 2 --
 configs/h8_homlet_v2_defconfig                 | 2 --
 configs/i12-tvbox_defconfig                    | 2 --
 configs/iNet_3F_defconfig                      | 2 --
 configs/iNet_3W_defconfig                      | 2 --
 configs/iNet_86VS_defconfig                    | 2 --
 configs/iNet_D978_rev2_defconfig               | 2 --
 configs/icnova-a20-swac_defconfig              | 2 --
 configs/inet1_defconfig                        | 2 --
 configs/inet86dz_defconfig                     | 2 --
 configs/inet97fv2_defconfig                    | 2 --
 configs/inet98v_rev2_defconfig                 | 2 --
 configs/inet9f_rev03_defconfig                 | 2 --
 configs/inet_q972_defconfig                    | 2 --
 configs/jesurun_q5_defconfig                   | 2 --
 configs/libretech_all_h3_cc_h2_plus_defconfig  | 2 --
 configs/libretech_all_h3_cc_h3_defconfig       | 2 --
 configs/libretech_all_h3_cc_h5_defconfig       | 3 ---
 configs/libretech_all_h3_it_h5_defconfig       | 3 ---
 configs/libretech_all_h5_cc_h5_defconfig       | 3 ---
 configs/licheepi_nano_defconfig                | 2 --
 configs/mixtile_loftq_defconfig                | 2 --
 configs/mk802_a10s_defconfig                   | 2 --
 configs/mk802_defconfig                        | 2 --
 configs/mk802ii_defconfig                      | 2 --
 configs/nanopi_a64_defconfig                   | 3 ---
 configs/nanopi_m1_defconfig                    | 2 --
 configs/nanopi_m1_plus_defconfig               | 2 --
 configs/nanopi_neo2_defconfig                  | 3 ---
 configs/nanopi_neo_air_defconfig               | 2 --
 configs/nanopi_neo_defconfig                   | 2 --
 configs/nanopi_neo_plus2_defconfig             | 3 ---
 configs/nanopi_r1s_h5_defconfig                | 3 ---
 configs/oceanic_5205_5inmfd_defconfig          | 3 ---
 configs/orangepi_2_defconfig                   | 2 --
 configs/orangepi_3_defconfig                   | 3 ---
 configs/orangepi_lite2_defconfig               | 3 ---
 configs/orangepi_lite_defconfig                | 2 --
 configs/orangepi_one_defconfig                 | 2 --
 configs/orangepi_one_plus_defconfig            | 3 ---
 configs/orangepi_pc2_defconfig                 | 3 ---
 configs/orangepi_pc_defconfig                  | 2 --
 configs/orangepi_pc_plus_defconfig             | 2 --
 configs/orangepi_plus2e_defconfig              | 2 --
 configs/orangepi_plus_defconfig                | 2 --
 configs/orangepi_prime_defconfig               | 3 ---
 configs/orangepi_r1_defconfig                  | 2 --
 configs/orangepi_win_defconfig                 | 3 ---
 configs/orangepi_zero2_defconfig               | 4 ----
 configs/orangepi_zero_defconfig                | 2 --
 configs/orangepi_zero_plus2_defconfig          | 3 ---
 configs/orangepi_zero_plus2_h3_defconfig       | 2 --
 configs/orangepi_zero_plus_defconfig           | 3 ---
 configs/parrot_r16_defconfig                   | 2 --
 configs/pine64-lts_defconfig                   | 3 ---
 configs/pine64_plus_defconfig                  | 3 ---
 configs/pine_h64_defconfig                     | 3 ---
 configs/pinebook_defconfig                     | 3 ---
 configs/pinecube_defconfig                     | 2 --
 configs/pinephone_defconfig                    | 3 ---
 configs/pinetab_defconfig                      | 3 ---
 configs/polaroid_mid2407pxe03_defconfig        | 2 --
 configs/polaroid_mid2809pxe04_defconfig        | 2 --
 configs/pov_protab2_ips9_defconfig             | 2 --
 configs/q8_a13_tablet_defconfig                | 2 --
 configs/q8_a23_tablet_800x480_defconfig        | 2 --
 configs/q8_a33_tablet_1024x600_defconfig       | 2 --
 configs/q8_a33_tablet_800x480_defconfig        | 2 --
 configs/r7-tv-dongle_defconfig                 | 2 --
 configs/sopine_baseboard_defconfig             | 3 ---
 configs/sun8i_a23_evb_defconfig                | 2 --
 configs/sunxi_Gemei_G9_defconfig               | 2 --
 configs/tanix_tx6_defconfig                    | 3 ---
 configs/tbs_a711_defconfig                     | 2 --
 configs/teres_i_defconfig                      | 3 ---
 configs/zeropi_defconfig                       | 2 --
 160 files changed, 354 deletions(-)

diff --git a/configs/A10-OLinuXino-Lime_defconfig b/configs/A10-OLinuXino-Lime_defconfig
index 26a921279b5..6727932f7fe 100644
--- a/configs/A10-OLinuXino-Lime_defconfig
+++ b/configs/A10-OLinuXino-Lime_defconfig
@@ -11,9 +11,7 @@ CONFIG_I2C1_ENABLE=y
 CONFIG_SATAPWR="PC3"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/A10s-OLinuXino-M_defconfig b/configs/A10s-OLinuXino-M_defconfig
index 7e9b92ee5ee..99f57857517 100644
--- a/configs/A10s-OLinuXino-M_defconfig
+++ b/configs/A10s-OLinuXino-M_defconfig
@@ -9,9 +9,7 @@ CONFIG_MMC1_CD_PIN="PG13"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=1
 CONFIG_USB1_VBUS_PIN="PB10"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/A13-OLinuXinoM_defconfig b/configs/A13-OLinuXinoM_defconfig
index 625a331e445..f9d17b19500 100644
--- a/configs/A13-OLinuXinoM_defconfig
+++ b/configs/A13-OLinuXinoM_defconfig
@@ -13,8 +13,6 @@ CONFIG_VIDEO_VGA_VIA_LCD_FORCE_SYNC_ACTIVE_HIGH=y
 CONFIG_VIDEO_LCD_POWER="PB10"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/A13-OLinuXino_defconfig b/configs/A13-OLinuXino_defconfig
index 5e0396c150f..8c9043559bd 100644
--- a/configs/A13-OLinuXino_defconfig
+++ b/configs/A13-OLinuXino_defconfig
@@ -15,9 +15,7 @@ CONFIG_VIDEO_VGA_VIA_LCD_FORCE_SYNC_ACTIVE_HIGH=y
 CONFIG_VIDEO_LCD_POWER="AXP0-0"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_CMD_DFU=y
 CONFIG_CMD_USB_MASS_STORAGE=y
 CONFIG_DFU_RAM=y
diff --git a/configs/A20-OLinuXino-Lime2-eMMC_defconfig b/configs/A20-OLinuXino-Lime2-eMMC_defconfig
index b5802818ec3..bccadcc7b4a 100644
--- a/configs/A20-OLinuXino-Lime2-eMMC_defconfig
+++ b/configs/A20-OLinuXino-Lime2-eMMC_defconfig
@@ -13,9 +13,7 @@ CONFIG_SATAPWR="PC3"
 CONFIG_SPL_SPI_SUNXI=y
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_CMD_DFU=y
 CONFIG_CMD_USB_MASS_STORAGE=y
 CONFIG_SCSI_AHCI=y
diff --git a/configs/A20-OLinuXino-Lime2_defconfig b/configs/A20-OLinuXino-Lime2_defconfig
index de4f6311f2d..0a9de5ee671 100644
--- a/configs/A20-OLinuXino-Lime2_defconfig
+++ b/configs/A20-OLinuXino-Lime2_defconfig
@@ -11,9 +11,7 @@ CONFIG_I2C1_ENABLE=y
 CONFIG_SATAPWR="PC3"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_CMD_DFU=y
 CONFIG_CMD_USB_MASS_STORAGE=y
 CONFIG_SCSI_AHCI=y
diff --git a/configs/A20-OLinuXino-Lime_defconfig b/configs/A20-OLinuXino-Lime_defconfig
index ebb3a02b824..38daf33b95b 100644
--- a/configs/A20-OLinuXino-Lime_defconfig
+++ b/configs/A20-OLinuXino-Lime_defconfig
@@ -9,9 +9,7 @@ CONFIG_I2C1_ENABLE=y
 CONFIG_SATAPWR="PC3"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/A20-OLinuXino_MICRO-eMMC_defconfig b/configs/A20-OLinuXino_MICRO-eMMC_defconfig
index c8802435b41..d73e64c4605 100644
--- a/configs/A20-OLinuXino_MICRO-eMMC_defconfig
+++ b/configs/A20-OLinuXino_MICRO-eMMC_defconfig
@@ -11,9 +11,7 @@ CONFIG_VIDEO_VGA=y
 CONFIG_SATAPWR="PB8"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/A20-OLinuXino_MICRO_defconfig b/configs/A20-OLinuXino_MICRO_defconfig
index f4496412456..8a6bb885e9c 100644
--- a/configs/A20-OLinuXino_MICRO_defconfig
+++ b/configs/A20-OLinuXino_MICRO_defconfig
@@ -12,9 +12,7 @@ CONFIG_VIDEO_VGA=y
 CONFIG_SATAPWR="PB8"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/A20-Olimex-SOM-EVB_defconfig b/configs/A20-Olimex-SOM-EVB_defconfig
index 67b47f51f1b..5de6c2d9a9e 100644
--- a/configs/A20-Olimex-SOM-EVB_defconfig
+++ b/configs/A20-Olimex-SOM-EVB_defconfig
@@ -12,9 +12,7 @@ CONFIG_USB0_VBUS_DET="PH5"
 CONFIG_SATAPWR="PC3"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig b/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig
index e02d67da5e7..6e9bdc27d98 100644
--- a/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig
+++ b/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig
@@ -13,9 +13,7 @@ CONFIG_SATAPWR="PC3"
 CONFIG_GMAC_TX_DELAY=4
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
diff --git a/configs/A20-Olimex-SOM204-EVB_defconfig b/configs/A20-Olimex-SOM204-EVB_defconfig
index 317a1e695d8..e0517459ee6 100644
--- a/configs/A20-Olimex-SOM204-EVB_defconfig
+++ b/configs/A20-Olimex-SOM204-EVB_defconfig
@@ -12,9 +12,7 @@ CONFIG_SATAPWR="PC3"
 CONFIG_GMAC_TX_DELAY=4
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
diff --git a/configs/A33-OLinuXino_defconfig b/configs/A33-OLinuXino_defconfig
index c9eec1f8879..351a454339b 100644
--- a/configs/A33-OLinuXino_defconfig
+++ b/configs/A33-OLinuXino_defconfig
@@ -16,7 +16,5 @@ CONFIG_VIDEO_LCD_DCLK_PHASE=0
 CONFIG_VIDEO_LCD_BL_EN="PB2"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_AXP_DCDC1_VOLT=3300
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/Ainol_AW1_defconfig b/configs/Ainol_AW1_defconfig
index 8cd38f7905b..9a18af8c6e1 100644
--- a/configs/Ainol_AW1_defconfig
+++ b/configs/Ainol_AW1_defconfig
@@ -14,9 +14,7 @@ CONFIG_VIDEO_LCD_POWER="PH8"
 CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/Ampe_A76_defconfig b/configs/Ampe_A76_defconfig
index 68707ed3e95..7bf3dfcd8a5 100644
--- a/configs/Ampe_A76_defconfig
+++ b/configs/Ampe_A76_defconfig
@@ -15,9 +15,7 @@ CONFIG_VIDEO_LCD_POWER="AXP0-0"
 CONFIG_VIDEO_LCD_BL_EN="AXP0-1"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/Auxtek-T003_defconfig b/configs/Auxtek-T003_defconfig
index 703df186b27..7d81f12f766 100644
--- a/configs/Auxtek-T003_defconfig
+++ b/configs/Auxtek-T003_defconfig
@@ -8,9 +8,7 @@ CONFIG_DRAM_EMR1=0
 CONFIG_USB1_VBUS_PIN="PB10"
 CONFIG_VIDEO_COMPOSITE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/Auxtek-T004_defconfig b/configs/Auxtek-T004_defconfig
index a8d236eaf9d..4c7154b04c4 100644
--- a/configs/Auxtek-T004_defconfig
+++ b/configs/Auxtek-T004_defconfig
@@ -6,9 +6,7 @@ CONFIG_MACH_SUN5I=y
 CONFIG_DRAM_CLK=432
 CONFIG_USB1_VBUS_PIN="PG13"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/Bananapi_M2_Ultra_defconfig b/configs/Bananapi_M2_Ultra_defconfig
index be5be9ae2fb..18ee81b6378 100644
--- a/configs/Bananapi_M2_Ultra_defconfig
+++ b/configs/Bananapi_M2_Ultra_defconfig
@@ -12,9 +12,7 @@ CONFIG_USB2_VBUS_PIN="PH23"
 # CONFIG_HAS_ARMV7_SECURE_BASE is not set
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/Bananapi_defconfig b/configs/Bananapi_defconfig
index 053ba137652..6c2a1f630e8 100644
--- a/configs/Bananapi_defconfig
+++ b/configs/Bananapi_defconfig
@@ -9,9 +9,7 @@ CONFIG_VIDEO_COMPOSITE=y
 CONFIG_GMAC_TX_DELAY=3
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_NETCONSOLE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/Bananapi_m2m_defconfig b/configs/Bananapi_m2m_defconfig
index 6a07f26c02c..bad38a66568 100644
--- a/configs/Bananapi_m2m_defconfig
+++ b/configs/Bananapi_m2m_defconfig
@@ -10,8 +10,6 @@ CONFIG_MMC0_CD_PIN="PB4"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_USB0_ID_DET="PH8"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/Bananapro_defconfig b/configs/Bananapro_defconfig
index 36f9bf8b32e..94fd74754ea 100644
--- a/configs/Bananapro_defconfig
+++ b/configs/Bananapro_defconfig
@@ -11,9 +11,7 @@ CONFIG_VIDEO_COMPOSITE=y
 CONFIG_GMAC_TX_DELAY=3
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_NETCONSOLE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/CHIP_defconfig b/configs/CHIP_defconfig
index 40d2c5b668a..cd9bdbfd36f 100644
--- a/configs/CHIP_defconfig
+++ b/configs/CHIP_defconfig
@@ -7,9 +7,7 @@ CONFIG_DRAM_TIMINGS_DDR3_800E_1066G_1333J=y
 CONFIG_USB0_VBUS_PIN="PB10"
 CONFIG_VIDEO_COMPOSITE=y
 CONFIG_CHIP_DIP_SCAN=y
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_CMD_DFU=y
 CONFIG_DFU_RAM=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/CHIP_pro_defconfig b/configs/CHIP_pro_defconfig
index 90168010bb8..29179601907 100644
--- a/configs/CHIP_pro_defconfig
+++ b/configs/CHIP_pro_defconfig
@@ -5,9 +5,7 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN5I=y
 CONFIG_DRAM_TIMINGS_DDR3_800E_1066G_1333J=y
 CONFIG_USB0_VBUS_PIN="PB10"
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 # CONFIG_CMD_FLASH is not set
 CONFIG_CMD_MTDPARTS=y
 CONFIG_MTDIDS_DEFAULT="nand0=sunxi-nand.0"
diff --git a/configs/CSQ_CS908_defconfig b/configs/CSQ_CS908_defconfig
index 49be3fc4a2d..1cd39d498f2 100644
--- a/configs/CSQ_CS908_defconfig
+++ b/configs/CSQ_CS908_defconfig
@@ -7,8 +7,6 @@ CONFIG_DRAM_CLK=432
 CONFIG_USB1_VBUS_PIN=""
 CONFIG_USB2_VBUS_PIN=""
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_PHY_REALTEK=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
diff --git a/configs/Chuwi_V7_CW0825_defconfig b/configs/Chuwi_V7_CW0825_defconfig
index b59d1786e6e..02b3e69584f 100644
--- a/configs/Chuwi_V7_CW0825_defconfig
+++ b/configs/Chuwi_V7_CW0825_defconfig
@@ -14,9 +14,7 @@ CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 CONFIG_VIDEO_LCD_PANEL_HITACHI_TX18D42VM=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/Colombus_defconfig b/configs/Colombus_defconfig
index 24b55bfa8cc..270bd7d351a 100644
--- a/configs/Colombus_defconfig
+++ b/configs/Colombus_defconfig
@@ -15,8 +15,6 @@ CONFIG_VIDEO_LCD_BL_EN="PM1"
 CONFIG_VIDEO_LCD_BL_PWM="PH13"
 CONFIG_VIDEO_LCD_PANEL_EDP_4_LANE_1620M_VIA_ANX9804=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/Cubieboard2_defconfig b/configs/Cubieboard2_defconfig
index 315c52f3448..ab5e53fb62e 100644
--- a/configs/Cubieboard2_defconfig
+++ b/configs/Cubieboard2_defconfig
@@ -8,9 +8,7 @@ CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_SATAPWR="PB8"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/Cubieboard4_defconfig b/configs/Cubieboard4_defconfig
index 928299e8a51..04ed79afb6d 100644
--- a/configs/Cubieboard4_defconfig
+++ b/configs/Cubieboard4_defconfig
@@ -12,7 +12,5 @@ CONFIG_USB0_ID_DET="PH16"
 CONFIG_USB1_VBUS_PIN="PH14"
 CONFIG_USB3_VBUS_PIN="PH15"
 CONFIG_AXP_GPIO=y
-CONFIG_SPL_STACK=0x18000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_SUN8I_RSB=y
 CONFIG_AXP809_POWER=y
diff --git a/configs/Cubieboard_defconfig b/configs/Cubieboard_defconfig
index 49eb0186953..c017b126b8c 100644
--- a/configs/Cubieboard_defconfig
+++ b/configs/Cubieboard_defconfig
@@ -8,9 +8,7 @@ CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_SATAPWR="PB8"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/Cubietruck_defconfig b/configs/Cubietruck_defconfig
index 62668df01ec..c85468e5827 100644
--- a/configs/Cubietruck_defconfig
+++ b/configs/Cubietruck_defconfig
@@ -13,9 +13,7 @@ CONFIG_SATAPWR="PH12"
 CONFIG_GMAC_TX_DELAY=1
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_CMD_DFU=y
 CONFIG_CMD_USB_MASS_STORAGE=y
 CONFIG_SCSI_AHCI=y
diff --git a/configs/Cubietruck_plus_defconfig b/configs/Cubietruck_plus_defconfig
index 8119b8b9cf6..13f958977be 100644
--- a/configs/Cubietruck_plus_defconfig
+++ b/configs/Cubietruck_plus_defconfig
@@ -16,8 +16,6 @@ CONFIG_I2C0_ENABLE=y
 CONFIG_AXP_GPIO=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_CONSOLE_MUX=y
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/Empire_electronix_d709_defconfig b/configs/Empire_electronix_d709_defconfig
index 0187b896f87..a9bbe8bcffa 100644
--- a/configs/Empire_electronix_d709_defconfig
+++ b/configs/Empire_electronix_d709_defconfig
@@ -16,9 +16,7 @@ CONFIG_VIDEO_LCD_POWER="AXP0-0"
 CONFIG_VIDEO_LCD_BL_EN="AXP0-1"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/Empire_electronix_m712_defconfig b/configs/Empire_electronix_m712_defconfig
index 6570b97ca4c..fc1f26b7a99 100644
--- a/configs/Empire_electronix_m712_defconfig
+++ b/configs/Empire_electronix_m712_defconfig
@@ -15,9 +15,7 @@ CONFIG_VIDEO_LCD_POWER="AXP0-0"
 CONFIG_VIDEO_LCD_BL_EN="AXP0-1"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/Hummingbird_A31_defconfig b/configs/Hummingbird_A31_defconfig
index 3afe4c56ae4..24e8b5be1b5 100644
--- a/configs/Hummingbird_A31_defconfig
+++ b/configs/Hummingbird_A31_defconfig
@@ -9,8 +9,6 @@ CONFIG_USB2_VBUS_PIN=""
 CONFIG_VIDEO_VGA_VIA_LCD=y
 CONFIG_VIDEO_VGA_EXTERNAL_DAC_EN="PH25"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_PHY_REALTEK=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_RGMII=y
diff --git a/configs/Hyundai_A7HD_defconfig b/configs/Hyundai_A7HD_defconfig
index 8bf7d1efba6..482e0fb7a83 100644
--- a/configs/Hyundai_A7HD_defconfig
+++ b/configs/Hyundai_A7HD_defconfig
@@ -15,9 +15,7 @@ CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_VIDEO_LCD_BL_PWM_ACTIVE_LOW is not set
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/Itead_Ibox_A20_defconfig b/configs/Itead_Ibox_A20_defconfig
index 1a161555842..99df9cff24f 100644
--- a/configs/Itead_Ibox_A20_defconfig
+++ b/configs/Itead_Ibox_A20_defconfig
@@ -8,9 +8,7 @@ CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_SATAPWR="PB8"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/Lamobo_R1_defconfig b/configs/Lamobo_R1_defconfig
index 3627e4dd3af..f97dc131f28 100644
--- a/configs/Lamobo_R1_defconfig
+++ b/configs/Lamobo_R1_defconfig
@@ -10,9 +10,7 @@ CONFIG_SATAPWR="PB3"
 CONFIG_GMAC_TX_DELAY=4
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/LicheePi_Zero_defconfig b/configs/LicheePi_Zero_defconfig
index 2e0b0b71e14..9815348badd 100644
--- a/configs/LicheePi_Zero_defconfig
+++ b/configs/LicheePi_Zero_defconfig
@@ -5,6 +5,4 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_V3S=y
 CONFIG_DRAM_CLK=360
 # CONFIG_HAS_ARMV7_SECURE_BASE is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 # CONFIG_NETDEVICES is not set
diff --git a/configs/Linksprite_pcDuino3_Nano_defconfig b/configs/Linksprite_pcDuino3_Nano_defconfig
index 41ed46a7b5a..e3e30a49490 100644
--- a/configs/Linksprite_pcDuino3_Nano_defconfig
+++ b/configs/Linksprite_pcDuino3_Nano_defconfig
@@ -10,9 +10,7 @@ CONFIG_SATAPWR="PH2"
 CONFIG_GMAC_TX_DELAY=3
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/Linksprite_pcDuino3_defconfig b/configs/Linksprite_pcDuino3_defconfig
index 44a3901e22d..1fda0db4c9d 100644
--- a/configs/Linksprite_pcDuino3_defconfig
+++ b/configs/Linksprite_pcDuino3_defconfig
@@ -8,9 +8,7 @@ CONFIG_DRAM_ZQ=122
 CONFIG_SATAPWR="PH2"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/Linksprite_pcDuino_defconfig b/configs/Linksprite_pcDuino_defconfig
index 279641551b3..49dcfa098ee 100644
--- a/configs/Linksprite_pcDuino_defconfig
+++ b/configs/Linksprite_pcDuino_defconfig
@@ -6,9 +6,7 @@ CONFIG_MACH_SUN4I=y
 CONFIG_USB1_VBUS_PIN=""
 CONFIG_USB2_VBUS_PIN=""
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/MK808C_defconfig b/configs/MK808C_defconfig
index 4e678bdf051..3ed962d7cd9 100644
--- a/configs/MK808C_defconfig
+++ b/configs/MK808C_defconfig
@@ -5,9 +5,7 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=384
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/MSI_Primo73_defconfig b/configs/MSI_Primo73_defconfig
index 7a4b224bf2a..071169fd298 100644
--- a/configs/MSI_Primo73_defconfig
+++ b/configs/MSI_Primo73_defconfig
@@ -10,9 +10,7 @@ CONFIG_VIDEO_LCD_POWER="PH8"
 CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/MSI_Primo81_defconfig b/configs/MSI_Primo81_defconfig
index bb820fd0a39..e77b0072923 100644
--- a/configs/MSI_Primo81_defconfig
+++ b/configs/MSI_Primo81_defconfig
@@ -13,8 +13,6 @@ CONFIG_VIDEO_LCD_BL_EN="PA25"
 CONFIG_VIDEO_LCD_BL_PWM="PH13"
 CONFIG_VIDEO_LCD_PANEL_MIPI_4_LANE_513_MBPS_VIA_SSD2828=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_AXP_DLDO1_VOLT=3300
 # CONFIG_REQUIRE_SERIAL_CONSOLE is not set
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/Marsboard_A10_defconfig b/configs/Marsboard_A10_defconfig
index 1584778dc74..3c5312d8824 100644
--- a/configs/Marsboard_A10_defconfig
+++ b/configs/Marsboard_A10_defconfig
@@ -5,8 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN4I=y
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/Mele_A1000G_quad_defconfig b/configs/Mele_A1000G_quad_defconfig
index acd751b19c8..c697d286dc1 100644
--- a/configs/Mele_A1000G_quad_defconfig
+++ b/configs/Mele_A1000G_quad_defconfig
@@ -7,8 +7,6 @@ CONFIG_DRAM_ZQ=120
 CONFIG_USB1_VBUS_PIN="PC27"
 CONFIG_USB2_VBUS_PIN=""
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_PHY_REALTEK=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
diff --git a/configs/Mele_A1000_defconfig b/configs/Mele_A1000_defconfig
index eb3e7988005..f5b6d908cdc 100644
--- a/configs/Mele_A1000_defconfig
+++ b/configs/Mele_A1000_defconfig
@@ -8,9 +8,7 @@ CONFIG_VIDEO_VGA=y
 CONFIG_VIDEO_COMPOSITE=y
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/Mele_I7_defconfig b/configs/Mele_I7_defconfig
index 48dad606b88..2b9bca13d08 100644
--- a/configs/Mele_I7_defconfig
+++ b/configs/Mele_I7_defconfig
@@ -7,8 +7,6 @@ CONFIG_DRAM_ZQ=120
 CONFIG_USB1_VBUS_PIN="PC27"
 CONFIG_USB2_VBUS_PIN=""
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_PHY_REALTEK=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
diff --git a/configs/Mele_M3_defconfig b/configs/Mele_M3_defconfig
index ce962395a25..77cb464c932 100644
--- a/configs/Mele_M3_defconfig
+++ b/configs/Mele_M3_defconfig
@@ -9,9 +9,7 @@ CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_VIDEO_VGA=y
 CONFIG_VIDEO_COMPOSITE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/Mele_M5_defconfig b/configs/Mele_M5_defconfig
index 2e6d5dd4604..b07dbbde2e4 100644
--- a/configs/Mele_M5_defconfig
+++ b/configs/Mele_M5_defconfig
@@ -9,9 +9,7 @@ CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_VIDEO_COMPOSITE=y
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/Mele_M9_defconfig b/configs/Mele_M9_defconfig
index b84a2aebe20..be6dd417545 100644
--- a/configs/Mele_M9_defconfig
+++ b/configs/Mele_M9_defconfig
@@ -7,8 +7,6 @@ CONFIG_DRAM_ZQ=120
 CONFIG_USB1_VBUS_PIN="PC27"
 CONFIG_USB2_VBUS_PIN=""
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_PHY_REALTEK=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
diff --git a/configs/Merrii_A80_Optimus_defconfig b/configs/Merrii_A80_Optimus_defconfig
index 3709a11ec03..c5d1f40df39 100644
--- a/configs/Merrii_A80_Optimus_defconfig
+++ b/configs/Merrii_A80_Optimus_defconfig
@@ -12,7 +12,5 @@ CONFIG_USB0_ID_DET="PH3"
 CONFIG_USB1_VBUS_PIN="PH4"
 CONFIG_USB3_VBUS_PIN="PH5"
 CONFIG_AXP_GPIO=y
-CONFIG_SPL_STACK=0x18000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_SUN8I_RSB=y
 CONFIG_AXP809_POWER=y
diff --git a/configs/Mini-X_defconfig b/configs/Mini-X_defconfig
index 76b6b7d2bce..e8bc1485766 100644
--- a/configs/Mini-X_defconfig
+++ b/configs/Mini-X_defconfig
@@ -6,9 +6,7 @@ CONFIG_MACH_SUN4I=y
 CONFIG_USB0_VBUS_PIN="PB9"
 CONFIG_VIDEO_COMPOSITE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/Nintendo_NES_Classic_Edition_defconfig b/configs/Nintendo_NES_Classic_Edition_defconfig
index 5b1a1d40614..b66023418ae 100644
--- a/configs/Nintendo_NES_Classic_Edition_defconfig
+++ b/configs/Nintendo_NES_Classic_Edition_defconfig
@@ -9,8 +9,6 @@ CONFIG_DRAM_ODT_EN=y
 CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
 CONFIG_AXP_GPIO=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 # CONFIG_CMD_FLASH is not set
 CONFIG_CMD_MTDPARTS=y
 # CONFIG_MMC is not set
diff --git a/configs/Orangepi_defconfig b/configs/Orangepi_defconfig
index ba976f8f5f3..c89a9a1f9dd 100644
--- a/configs/Orangepi_defconfig
+++ b/configs/Orangepi_defconfig
@@ -12,9 +12,7 @@ CONFIG_VIDEO_COMPOSITE=y
 CONFIG_GMAC_TX_DELAY=3
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/Orangepi_mini_defconfig b/configs/Orangepi_mini_defconfig
index 720e9e5df4c..8757dcb461c 100644
--- a/configs/Orangepi_mini_defconfig
+++ b/configs/Orangepi_mini_defconfig
@@ -14,9 +14,7 @@ CONFIG_VIDEO_COMPOSITE=y
 CONFIG_GMAC_TX_DELAY=3
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/Sinlinx_SinA31s_defconfig b/configs/Sinlinx_SinA31s_defconfig
index 2d33331f3d3..238b0073e79 100644
--- a/configs/Sinlinx_SinA31s_defconfig
+++ b/configs/Sinlinx_SinA31s_defconfig
@@ -10,8 +10,6 @@ CONFIG_MMC_SUNXI_SLOT_EXTRA=3
 CONFIG_USB1_VBUS_PIN=""
 CONFIG_USB2_VBUS_PIN=""
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_PHY_REALTEK=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
diff --git a/configs/Sinlinx_SinA33_defconfig b/configs/Sinlinx_SinA33_defconfig
index fcee14b5462..4eb5300b046 100644
--- a/configs/Sinlinx_SinA33_defconfig
+++ b/configs/Sinlinx_SinA33_defconfig
@@ -13,8 +13,6 @@ CONFIG_VIDEO_LCD_DCLK_PHASE=0
 CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_CMD_DFU=y
 CONFIG_DFU_RAM=y
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
diff --git a/configs/Sinovoip_BPI_M2_defconfig b/configs/Sinovoip_BPI_M2_defconfig
index c080a247105..aba95270eb2 100644
--- a/configs/Sinovoip_BPI_M2_defconfig
+++ b/configs/Sinovoip_BPI_M2_defconfig
@@ -7,8 +7,6 @@ CONFIG_DRAM_CLK=432
 CONFIG_USB1_VBUS_PIN=""
 CONFIG_USB2_VBUS_PIN=""
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_PHY_REALTEK=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_RGMII=y
diff --git a/configs/Sinovoip_BPI_M3_defconfig b/configs/Sinovoip_BPI_M3_defconfig
index 9760f9fdf4a..5116fab52d7 100644
--- a/configs/Sinovoip_BPI_M3_defconfig
+++ b/configs/Sinovoip_BPI_M3_defconfig
@@ -16,8 +16,6 @@ CONFIG_AXP_GPIO=y
 CONFIG_SATAPWR="PD25"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_CONSOLE_MUX=y
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_PHY_REALTEK=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_INITIAL_USB_SCAN_DELAY=500
diff --git a/configs/Sunchip_CX-A99_defconfig b/configs/Sunchip_CX-A99_defconfig
index 749bf1cff9d..bb62ae9a7a9 100644
--- a/configs/Sunchip_CX-A99_defconfig
+++ b/configs/Sunchip_CX-A99_defconfig
@@ -12,5 +12,3 @@ CONFIG_USB0_VBUS_PIN="PH15"
 CONFIG_USB1_VBUS_PIN="PL7"
 CONFIG_USB3_VBUS_PIN="PL8"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x18000
-CONFIG_SYS_PBSIZE=1024
diff --git a/configs/UTOO_P66_defconfig b/configs/UTOO_P66_defconfig
index 4e6652db18f..b021b0a8865 100644
--- a/configs/UTOO_P66_defconfig
+++ b/configs/UTOO_P66_defconfig
@@ -20,9 +20,7 @@ CONFIG_VIDEO_LCD_BL_EN="AXP0-1"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 CONFIG_VIDEO_LCD_TL059WV5C0=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/Wexler_TAB7200_defconfig b/configs/Wexler_TAB7200_defconfig
index f63d18c327f..101ce57aa44 100644
--- a/configs/Wexler_TAB7200_defconfig
+++ b/configs/Wexler_TAB7200_defconfig
@@ -13,9 +13,7 @@ CONFIG_VIDEO_LCD_POWER="PH8"
 CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/Wits_Pro_A20_DKT_defconfig b/configs/Wits_Pro_A20_DKT_defconfig
index c9d22534d5c..f401ac74ef4 100644
--- a/configs/Wits_Pro_A20_DKT_defconfig
+++ b/configs/Wits_Pro_A20_DKT_defconfig
@@ -12,9 +12,7 @@ CONFIG_VIDEO_LCD_BL_PWM="PB2"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/Wobo_i5_defconfig b/configs/Wobo_i5_defconfig
index ab919c0795a..e0687bf887d 100644
--- a/configs/Wobo_i5_defconfig
+++ b/configs/Wobo_i5_defconfig
@@ -7,9 +7,7 @@ CONFIG_DRAM_CLK=432
 CONFIG_MMC0_CD_PIN="PB3"
 CONFIG_USB1_VBUS_PIN="PG12"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/Yones_Toptech_BD1078_defconfig b/configs/Yones_Toptech_BD1078_defconfig
index 1117e147cc1..f1ceb8b5527 100644
--- a/configs/Yones_Toptech_BD1078_defconfig
+++ b/configs/Yones_Toptech_BD1078_defconfig
@@ -19,9 +19,7 @@ CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_VIDEO_LCD_BL_PWM_ACTIVE_LOW is not set
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/Yones_Toptech_BS1078_V2_defconfig b/configs/Yones_Toptech_BS1078_V2_defconfig
index ef30aee8281..6701ecce2fe 100644
--- a/configs/Yones_Toptech_BS1078_V2_defconfig
+++ b/configs/Yones_Toptech_BS1078_V2_defconfig
@@ -16,7 +16,5 @@ CONFIG_VIDEO_LCD_BL_EN="PA25"
 CONFIG_VIDEO_LCD_BL_PWM="PH13"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/a64-olinuxino-emmc_defconfig b/configs/a64-olinuxino-emmc_defconfig
index afa0c24b688..8ec9eb3e9c2 100644
--- a/configs/a64-olinuxino-emmc_defconfig
+++ b/configs/a64-olinuxino-emmc_defconfig
@@ -6,9 +6,6 @@ CONFIG_MACH_SUN50I=y
 CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/a64-olinuxino_defconfig b/configs/a64-olinuxino_defconfig
index ccb5abc9845..16cef18beef 100644
--- a/configs/a64-olinuxino_defconfig
+++ b/configs/a64-olinuxino_defconfig
@@ -6,9 +6,6 @@ CONFIG_MACH_SUN50I=y
 CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/amarula_a64_relic_defconfig b/configs/amarula_a64_relic_defconfig
index 72f97cee4de..ae44b66d109 100644
--- a/configs/amarula_a64_relic_defconfig
+++ b/configs/amarula_a64_relic_defconfig
@@ -7,9 +7,6 @@ CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_VIDEO_DE2 is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_MUSB_GADGET=y
diff --git a/configs/ba10_tv_box_defconfig b/configs/ba10_tv_box_defconfig
index 66c444fc750..b89dd8ea62b 100644
--- a/configs/ba10_tv_box_defconfig
+++ b/configs/ba10_tv_box_defconfig
@@ -9,9 +9,7 @@ CONFIG_USB0_VBUS_PIN="PB9"
 CONFIG_USB2_VBUS_PIN="PH12"
 CONFIG_VIDEO_COMPOSITE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/bananapi_m1_plus_defconfig b/configs/bananapi_m1_plus_defconfig
index 290e9c17e21..0fbb619d623 100644
--- a/configs/bananapi_m1_plus_defconfig
+++ b/configs/bananapi_m1_plus_defconfig
@@ -9,9 +9,7 @@ CONFIG_VIDEO_COMPOSITE=y
 CONFIG_GMAC_TX_DELAY=3
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_NETCONSOLE=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/bananapi_m2_berry_defconfig b/configs/bananapi_m2_berry_defconfig
index e6b8f0f8a3f..588eea2a27d 100644
--- a/configs/bananapi_m2_berry_defconfig
+++ b/configs/bananapi_m2_berry_defconfig
@@ -9,9 +9,7 @@ CONFIG_USB1_VBUS_PIN="PH23"
 # CONFIG_HAS_ARMV7_SECURE_BASE is not set
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/bananapi_m2_plus_h3_defconfig b/configs/bananapi_m2_plus_h3_defconfig
index d0981f6481a..26ced59fb02 100644
--- a/configs/bananapi_m2_plus_h3_defconfig
+++ b/configs/bananapi_m2_plus_h3_defconfig
@@ -7,8 +7,6 @@ CONFIG_DRAM_CLK=672
 CONFIG_MACPWR="PD6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/bananapi_m2_plus_h5_defconfig b/configs/bananapi_m2_plus_h5_defconfig
index a68742e9d6a..fb6c945919a 100644
--- a/configs/bananapi_m2_plus_h5_defconfig
+++ b/configs/bananapi_m2_plus_h5_defconfig
@@ -7,9 +7,6 @@ CONFIG_DRAM_CLK=672
 CONFIG_MACPWR="PD6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/bananapi_m2_zero_defconfig b/configs/bananapi_m2_zero_defconfig
index 6a3594c0938..ac3f8f5ab8b 100644
--- a/configs/bananapi_m2_zero_defconfig
+++ b/configs/bananapi_m2_zero_defconfig
@@ -6,5 +6,3 @@ CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=408
 CONFIG_MMC0_CD_PIN=""
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
diff --git a/configs/bananapi_m64_defconfig b/configs/bananapi_m64_defconfig
index 36aa80a09ba..5463b046fdb 100644
--- a/configs/bananapi_m64_defconfig
+++ b/configs/bananapi_m64_defconfig
@@ -7,9 +7,6 @@ CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_MMC0_CD_PIN="PH13"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/beelink_gs1_defconfig b/configs/beelink_gs1_defconfig
index 2c440e44f5d..42925eabcb0 100644
--- a/configs/beelink_gs1_defconfig
+++ b/configs/beelink_gs1_defconfig
@@ -8,9 +8,6 @@ CONFIG_MMC0_CD_PIN="PF6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_PSCI_RESET is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x118000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_LED=y
 CONFIG_LED_GPIO=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/beelink_x2_defconfig b/configs/beelink_x2_defconfig
index 4065e64d523..6206d909003 100644
--- a/configs/beelink_x2_defconfig
+++ b/configs/beelink_x2_defconfig
@@ -6,7 +6,5 @@ CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=567
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/colorfly_e708_q1_defconfig b/configs/colorfly_e708_q1_defconfig
index f17083310a2..5d3636e34e8 100644
--- a/configs/colorfly_e708_q1_defconfig
+++ b/configs/colorfly_e708_q1_defconfig
@@ -16,8 +16,6 @@ CONFIG_VIDEO_LCD_BL_EN="PA25"
 CONFIG_VIDEO_LCD_BL_PWM="PH13"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_AXP_DLDO2_VOLT=1800
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/difrnce_dit4350_defconfig b/configs/difrnce_dit4350_defconfig
index a3917eaf179..e1067b66eec 100644
--- a/configs/difrnce_dit4350_defconfig
+++ b/configs/difrnce_dit4350_defconfig
@@ -15,9 +15,7 @@ CONFIG_VIDEO_LCD_POWER="AXP0-0"
 CONFIG_VIDEO_LCD_BL_EN="AXP0-1"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/dserve_dsrv9703c_defconfig b/configs/dserve_dsrv9703c_defconfig
index c737cdb4d99..60910c3ce35 100644
--- a/configs/dserve_dsrv9703c_defconfig
+++ b/configs/dserve_dsrv9703c_defconfig
@@ -14,9 +14,7 @@ CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/emlid_neutis_n5_devboard_defconfig b/configs/emlid_neutis_n5_devboard_defconfig
index 73121f2f4eb..a3b43dffc63 100644
--- a/configs/emlid_neutis_n5_devboard_defconfig
+++ b/configs/emlid_neutis_n5_devboard_defconfig
@@ -8,7 +8,4 @@ CONFIG_DRAM_ZQ=3881977
 # CONFIG_DRAM_ODT_EN is not set
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SUPPORT_EMMC_BOOT=y
diff --git a/configs/ga10h_v1_1_defconfig b/configs/ga10h_v1_1_defconfig
index 7cdb6c56755..599eeb96b4f 100644
--- a/configs/ga10h_v1_1_defconfig
+++ b/configs/ga10h_v1_1_defconfig
@@ -17,8 +17,6 @@ CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/gt90h_v4_defconfig b/configs/gt90h_v4_defconfig
index c81f0f6c5eb..1a5fe06bbe1 100644
--- a/configs/gt90h_v4_defconfig
+++ b/configs/gt90h_v4_defconfig
@@ -16,8 +16,6 @@ CONFIG_VIDEO_LCD_POWER="PH7"
 CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/h8_homlet_v2_defconfig b/configs/h8_homlet_v2_defconfig
index 8af0b3c3332..29f965200e1 100644
--- a/configs/h8_homlet_v2_defconfig
+++ b/configs/h8_homlet_v2_defconfig
@@ -11,8 +11,6 @@ CONFIG_USB1_VBUS_PIN="PL6"
 CONFIG_AXP_GPIO=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_CONSOLE_MUX=y
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_AXP_DLDO4_VOLT=3300
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/i12-tvbox_defconfig b/configs/i12-tvbox_defconfig
index 29cea180201..257dd89af45 100644
--- a/configs/i12-tvbox_defconfig
+++ b/configs/i12-tvbox_defconfig
@@ -7,9 +7,7 @@ CONFIG_DRAM_CLK=384
 CONFIG_MACPWR="PH21"
 CONFIG_VIDEO_COMPOSITE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/iNet_3F_defconfig b/configs/iNet_3F_defconfig
index 8b6936497fd..436e3a8c209 100644
--- a/configs/iNet_3F_defconfig
+++ b/configs/iNet_3F_defconfig
@@ -14,9 +14,7 @@ CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/iNet_3W_defconfig b/configs/iNet_3W_defconfig
index a05876a18f3..6978f8b0aab 100644
--- a/configs/iNet_3W_defconfig
+++ b/configs/iNet_3W_defconfig
@@ -14,9 +14,7 @@ CONFIG_VIDEO_LCD_POWER="PH8"
 CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/iNet_86VS_defconfig b/configs/iNet_86VS_defconfig
index 3a9f30877b0..2c8ecb51de0 100644
--- a/configs/iNet_86VS_defconfig
+++ b/configs/iNet_86VS_defconfig
@@ -13,9 +13,7 @@ CONFIG_VIDEO_LCD_POWER="AXP0-0"
 CONFIG_VIDEO_LCD_BL_EN="AXP0-1"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/iNet_D978_rev2_defconfig b/configs/iNet_D978_rev2_defconfig
index 664745c9f13..9a90252dbd7 100644
--- a/configs/iNet_D978_rev2_defconfig
+++ b/configs/iNet_D978_rev2_defconfig
@@ -17,8 +17,6 @@ CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_AXP_DLDO1_VOLT=3300
 # CONFIG_REQUIRE_SERIAL_CONSOLE is not set
 CONFIG_CONS_INDEX=5
diff --git a/configs/icnova-a20-swac_defconfig b/configs/icnova-a20-swac_defconfig
index e50db015cdc..c759d7e2357 100644
--- a/configs/icnova-a20-swac_defconfig
+++ b/configs/icnova-a20-swac_defconfig
@@ -17,9 +17,7 @@ CONFIG_VIDEO_LCD_MODE="x:800,y:480,depth:24,pclk_khz:33000,le:45,ri:209,up:22,lo
 CONFIG_VIDEO_LCD_POWER="PH22"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_CMD_UNZIP=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/inet1_defconfig b/configs/inet1_defconfig
index dae6b23a936..f81120b1197 100644
--- a/configs/inet1_defconfig
+++ b/configs/inet1_defconfig
@@ -14,9 +14,7 @@ CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/inet86dz_defconfig b/configs/inet86dz_defconfig
index 0382a4a0541..3ade9fea824 100644
--- a/configs/inet86dz_defconfig
+++ b/configs/inet86dz_defconfig
@@ -16,8 +16,6 @@ CONFIG_VIDEO_LCD_POWER="PH7"
 CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/inet97fv2_defconfig b/configs/inet97fv2_defconfig
index f3e374c2e34..d5d2dc32c93 100644
--- a/configs/inet97fv2_defconfig
+++ b/configs/inet97fv2_defconfig
@@ -13,9 +13,7 @@ CONFIG_VIDEO_LCD_POWER="PH8"
 CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/inet98v_rev2_defconfig b/configs/inet98v_rev2_defconfig
index c392fc2bb87..bd6c45bd661 100644
--- a/configs/inet98v_rev2_defconfig
+++ b/configs/inet98v_rev2_defconfig
@@ -15,9 +15,7 @@ CONFIG_VIDEO_LCD_POWER="AXP0-0"
 CONFIG_VIDEO_LCD_BL_EN="AXP0-1"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/inet9f_rev03_defconfig b/configs/inet9f_rev03_defconfig
index 81a1c9940fd..4485f930236 100644
--- a/configs/inet9f_rev03_defconfig
+++ b/configs/inet9f_rev03_defconfig
@@ -13,9 +13,7 @@ CONFIG_VIDEO_LCD_POWER="PH8"
 CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/inet_q972_defconfig b/configs/inet_q972_defconfig
index a4a828c70a3..1769256b7d1 100644
--- a/configs/inet_q972_defconfig
+++ b/configs/inet_q972_defconfig
@@ -15,8 +15,6 @@ CONFIG_VIDEO_LCD_DCLK_PHASE=0
 CONFIG_VIDEO_LCD_BL_EN="PA25"
 CONFIG_VIDEO_LCD_BL_PWM="PH13"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/jesurun_q5_defconfig b/configs/jesurun_q5_defconfig
index 5fce5836c9c..0ff666b2ee5 100644
--- a/configs/jesurun_q5_defconfig
+++ b/configs/jesurun_q5_defconfig
@@ -8,9 +8,7 @@ CONFIG_MACPWR="PH19"
 CONFIG_USB0_VBUS_PIN="PB9"
 CONFIG_VIDEO_COMPOSITE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/libretech_all_h3_cc_h2_plus_defconfig b/configs/libretech_all_h3_cc_h2_plus_defconfig
index ca995568024..8725fe64cdc 100644
--- a/configs/libretech_all_h3_cc_h2_plus_defconfig
+++ b/configs/libretech_all_h3_cc_h2_plus_defconfig
@@ -6,8 +6,6 @@ CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=672
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/libretech_all_h3_cc_h3_defconfig b/configs/libretech_all_h3_cc_h3_defconfig
index 7ca312c8fbc..5275fdc36da 100644
--- a/configs/libretech_all_h3_cc_h3_defconfig
+++ b/configs/libretech_all_h3_cc_h3_defconfig
@@ -6,8 +6,6 @@ CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=672
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/libretech_all_h3_cc_h5_defconfig b/configs/libretech_all_h3_cc_h5_defconfig
index 13ff7582124..96274019499 100644
--- a/configs/libretech_all_h3_cc_h5_defconfig
+++ b/configs/libretech_all_h3_cc_h5_defconfig
@@ -6,9 +6,6 @@ CONFIG_MACH_SUN50I_H5=y
 CONFIG_DRAM_CLK=672
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/libretech_all_h3_it_h5_defconfig b/configs/libretech_all_h3_it_h5_defconfig
index 75280ee1e3b..cb7ffb4d7da 100644
--- a/configs/libretech_all_h3_it_h5_defconfig
+++ b/configs/libretech_all_h3_it_h5_defconfig
@@ -7,9 +7,6 @@ CONFIG_DRAM_CLK=672
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SPI_FLASH_XMC=y
 CONFIG_SPI=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/libretech_all_h5_cc_h5_defconfig b/configs/libretech_all_h5_cc_h5_defconfig
index f42747e9466..c3aa4b10617 100644
--- a/configs/libretech_all_h5_cc_h5_defconfig
+++ b/configs/libretech_all_h5_cc_h5_defconfig
@@ -7,9 +7,6 @@ CONFIG_DRAM_CLK=672
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SPI_FLASH_XMC=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_SPI=y
diff --git a/configs/licheepi_nano_defconfig b/configs/licheepi_nano_defconfig
index a9776bbcace..14e6bcda927 100644
--- a/configs/licheepi_nano_defconfig
+++ b/configs/licheepi_nano_defconfig
@@ -10,8 +10,6 @@ CONFIG_DRAM_CLK=156
 CONFIG_DRAM_ZQ=0
 # CONFIG_VIDEO_SUNXI is not set
 CONFIG_SPL_SPI_SUNXI=y
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_SPI_FLASH_XTX=y
 CONFIG_SPI=y
diff --git a/configs/mixtile_loftq_defconfig b/configs/mixtile_loftq_defconfig
index 11e3dfcf4ba..0e4cdc44670 100644
--- a/configs/mixtile_loftq_defconfig
+++ b/configs/mixtile_loftq_defconfig
@@ -9,8 +9,6 @@ CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_USB1_VBUS_PIN="PH24"
 CONFIG_USB2_VBUS_PIN=""
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_PHY_REALTEK=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_RGMII=y
diff --git a/configs/mk802_a10s_defconfig b/configs/mk802_a10s_defconfig
index 3ce7e5f1d68..21f7a6e535d 100644
--- a/configs/mk802_a10s_defconfig
+++ b/configs/mk802_a10s_defconfig
@@ -7,9 +7,7 @@ CONFIG_DRAM_CLK=432
 CONFIG_DRAM_EMR1=0
 CONFIG_USB1_VBUS_PIN="PB10"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/mk802_defconfig b/configs/mk802_defconfig
index 0fd8d3adbd2..416565e5af2 100644
--- a/configs/mk802_defconfig
+++ b/configs/mk802_defconfig
@@ -5,8 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN4I=y
 CONFIG_USB2_VBUS_PIN="PH12"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/mk802ii_defconfig b/configs/mk802ii_defconfig
index 942911bddba..965a9cd5c4b 100644
--- a/configs/mk802ii_defconfig
+++ b/configs/mk802ii_defconfig
@@ -4,9 +4,7 @@ CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-mk802ii"
 CONFIG_SPL=y
 CONFIG_MACH_SUN4I=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/nanopi_a64_defconfig b/configs/nanopi_a64_defconfig
index 226ccaa12ff..70fc257eebd 100644
--- a/configs/nanopi_a64_defconfig
+++ b/configs/nanopi_a64_defconfig
@@ -5,9 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN50I=y
 CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/nanopi_m1_defconfig b/configs/nanopi_m1_defconfig
index 47a6b7804e3..dc2dbd62900 100644
--- a/configs/nanopi_m1_defconfig
+++ b/configs/nanopi_m1_defconfig
@@ -5,7 +5,5 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=408
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/nanopi_m1_plus_defconfig b/configs/nanopi_m1_plus_defconfig
index c71d721f743..37b7817d869 100644
--- a/configs/nanopi_m1_plus_defconfig
+++ b/configs/nanopi_m1_plus_defconfig
@@ -8,8 +8,6 @@ CONFIG_MACPWR="PD6"
 CONFIG_MMC0_CD_PIN="PH13"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/nanopi_neo2_defconfig b/configs/nanopi_neo2_defconfig
index 6fedf056ff7..95dd56aa04c 100644
--- a/configs/nanopi_neo2_defconfig
+++ b/configs/nanopi_neo2_defconfig
@@ -7,9 +7,6 @@ CONFIG_DRAM_CLK=672
 CONFIG_DRAM_ZQ=3881977
 # CONFIG_DRAM_ODT_EN is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/nanopi_neo_air_defconfig b/configs/nanopi_neo_air_defconfig
index b83b6a3499d..806d95c1cc7 100644
--- a/configs/nanopi_neo_air_defconfig
+++ b/configs/nanopi_neo_air_defconfig
@@ -7,7 +7,5 @@ CONFIG_DRAM_CLK=408
 # CONFIG_VIDEO_DE2 is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_CONSOLE_MUX=y
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/nanopi_neo_defconfig b/configs/nanopi_neo_defconfig
index f8377535e97..c0255196384 100644
--- a/configs/nanopi_neo_defconfig
+++ b/configs/nanopi_neo_defconfig
@@ -7,8 +7,6 @@ CONFIG_DRAM_CLK=408
 # CONFIG_VIDEO_DE2 is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_CONSOLE_MUX=y
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/nanopi_neo_plus2_defconfig b/configs/nanopi_neo_plus2_defconfig
index 3f834b756df..924ff38f17c 100644
--- a/configs/nanopi_neo_plus2_defconfig
+++ b/configs/nanopi_neo_plus2_defconfig
@@ -9,9 +9,6 @@ CONFIG_DRAM_ZQ=3881977
 CONFIG_MACPWR="PD6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/nanopi_r1s_h5_defconfig b/configs/nanopi_r1s_h5_defconfig
index a0cf8ff0442..27cf172d72a 100644
--- a/configs/nanopi_r1s_h5_defconfig
+++ b/configs/nanopi_r1s_h5_defconfig
@@ -9,9 +9,6 @@ CONFIG_DRAM_ZQ=3881977
 CONFIG_MACPWR="PD6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/oceanic_5205_5inmfd_defconfig b/configs/oceanic_5205_5inmfd_defconfig
index 1cd8e9f2b68..7ce63ba665d 100644
--- a/configs/oceanic_5205_5inmfd_defconfig
+++ b/configs/oceanic_5205_5inmfd_defconfig
@@ -10,9 +10,6 @@ CONFIG_DRAM_ZQ=3881949
 CONFIG_MMC0_CD_PIN=""
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SUN8I_EMAC=y
 CONFIG_SPI=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/orangepi_2_defconfig b/configs/orangepi_2_defconfig
index e18b8610847..7aaa5190b3a 100644
--- a/configs/orangepi_2_defconfig
+++ b/configs/orangepi_2_defconfig
@@ -7,9 +7,7 @@ CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=672
 CONFIG_USB1_VBUS_PIN="PG13"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/orangepi_3_defconfig b/configs/orangepi_3_defconfig
index dbca66d1429..ebecf49ebda 100644
--- a/configs/orangepi_3_defconfig
+++ b/configs/orangepi_3_defconfig
@@ -8,9 +8,6 @@ CONFIG_MMC0_CD_PIN="PF6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_BLUETOOTH_DT_DEVICE_FIXUP="brcm,bcm4345c5"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x118000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_PHY_SUN50I_USB3=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_DWC3=y
diff --git a/configs/orangepi_lite2_defconfig b/configs/orangepi_lite2_defconfig
index 14c88062812..75c97d6b897 100644
--- a/configs/orangepi_lite2_defconfig
+++ b/configs/orangepi_lite2_defconfig
@@ -7,8 +7,5 @@ CONFIG_SUNXI_DRAM_H6_LPDDR3=y
 CONFIG_MMC0_CD_PIN="PF6"
 # CONFIG_PSCI_RESET is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x118000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_lite_defconfig b/configs/orangepi_lite_defconfig
index c7174170dbf..96bbd1bab6f 100644
--- a/configs/orangepi_lite_defconfig
+++ b/configs/orangepi_lite_defconfig
@@ -5,7 +5,5 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=672
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_one_defconfig b/configs/orangepi_one_defconfig
index 112ff5e5b6a..1064b4a39de 100644
--- a/configs/orangepi_one_defconfig
+++ b/configs/orangepi_one_defconfig
@@ -5,8 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=672
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_one_plus_defconfig b/configs/orangepi_one_plus_defconfig
index a4336332fc7..55a8b003fb5 100644
--- a/configs/orangepi_one_plus_defconfig
+++ b/configs/orangepi_one_plus_defconfig
@@ -7,8 +7,5 @@ CONFIG_SUNXI_DRAM_H6_LPDDR3=y
 CONFIG_MMC0_CD_PIN="PF6"
 # CONFIG_PSCI_RESET is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x118000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index d0cad2a7461..777af8c60ea 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -8,10 +8,7 @@ CONFIG_DRAM_ZQ=3881977
 CONFIG_MACPWR="PD6"
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SPI_FLASH_MACRONIX=y
diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
index 28107ad5f7a..905ff7b1271 100644
--- a/configs/orangepi_pc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -5,9 +5,7 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=624
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/orangepi_pc_plus_defconfig b/configs/orangepi_pc_plus_defconfig
index 30638679bc6..f845138153d 100644
--- a/configs/orangepi_pc_plus_defconfig
+++ b/configs/orangepi_pc_plus_defconfig
@@ -6,9 +6,7 @@ CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=624
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/orangepi_plus2e_defconfig b/configs/orangepi_plus2e_defconfig
index 85b25ddd167..138a6a72b8c 100644
--- a/configs/orangepi_plus2e_defconfig
+++ b/configs/orangepi_plus2e_defconfig
@@ -7,9 +7,7 @@ CONFIG_DRAM_CLK=672
 CONFIG_MACPWR="PD6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/orangepi_plus_defconfig b/configs/orangepi_plus_defconfig
index dff0a2fd6e9..76de72aa228 100644
--- a/configs/orangepi_plus_defconfig
+++ b/configs/orangepi_plus_defconfig
@@ -9,9 +9,7 @@ CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_USB1_VBUS_PIN="PG13"
 CONFIG_SATAPWR="PG11"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/orangepi_prime_defconfig b/configs/orangepi_prime_defconfig
index 690a5f195b6..95a82e20f3e 100644
--- a/configs/orangepi_prime_defconfig
+++ b/configs/orangepi_prime_defconfig
@@ -7,9 +7,6 @@ CONFIG_DRAM_CLK=672
 CONFIG_DRAM_ZQ=3881977
 # CONFIG_DRAM_ODT_EN is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_r1_defconfig b/configs/orangepi_r1_defconfig
index e15069c048e..4496aa4a45c 100644
--- a/configs/orangepi_r1_defconfig
+++ b/configs/orangepi_r1_defconfig
@@ -8,8 +8,6 @@ CONFIG_DRAM_CLK=624
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_CONSOLE_MUX=y
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_SPI=y
diff --git a/configs/orangepi_win_defconfig b/configs/orangepi_win_defconfig
index 7a9ca8e88a8..3b78ad7e52d 100644
--- a/configs/orangepi_win_defconfig
+++ b/configs/orangepi_win_defconfig
@@ -7,9 +7,6 @@ CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_MACPWR="PD14"
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_REALTEK=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/orangepi_zero2_defconfig b/configs/orangepi_zero2_defconfig
index cad7a7bb064..54faf6aba2c 100644
--- a/configs/orangepi_zero2_defconfig
+++ b/configs/orangepi_zero2_defconfig
@@ -10,11 +10,7 @@ CONFIG_MACH_SUN50I_H616=y
 CONFIG_MMC0_CD_PIN="PF6"
 CONFIG_R_I2C_ENABLE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_MAX_SIZE=0xbfa0
-CONFIG_SPL_STACK=0x58000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index b6de0b9aa26..f7f3bfbcc41 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -8,8 +8,6 @@ CONFIG_DRAM_CLK=624
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_CONSOLE_MUX=y
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SPI_FLASH_MACRONIX=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 02f70ccf0c0..9583d24c8d6 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -9,9 +9,6 @@ CONFIG_DRAM_ZQ=3881977
 CONFIG_MMC0_CD_PIN="PH13"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_zero_plus2_h3_defconfig b/configs/orangepi_zero_plus2_h3_defconfig
index b2d4f3f8e07..55a251374a1 100644
--- a/configs/orangepi_zero_plus2_h3_defconfig
+++ b/configs/orangepi_zero_plus2_h3_defconfig
@@ -8,8 +8,6 @@ CONFIG_DRAM_CLK=672
 CONFIG_MMC0_CD_PIN="PH13"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_zero_plus_defconfig b/configs/orangepi_zero_plus_defconfig
index 15520955f5e..f3ecf35eee1 100644
--- a/configs/orangepi_zero_plus_defconfig
+++ b/configs/orangepi_zero_plus_defconfig
@@ -7,9 +7,6 @@ CONFIG_DRAM_CLK=624
 CONFIG_DRAM_ZQ=3881977
 # CONFIG_DRAM_ODT_EN is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/parrot_r16_defconfig b/configs/parrot_r16_defconfig
index 14e9b455feb..d56c4504b6a 100644
--- a/configs/parrot_r16_defconfig
+++ b/configs/parrot_r16_defconfig
@@ -11,8 +11,6 @@ CONFIG_USB0_ID_DET="PD10"
 CONFIG_USB1_VBUS_PIN="PD12"
 CONFIG_AXP_GPIO=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_CONS_INDEX=5
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/pine64-lts_defconfig b/configs/pine64-lts_defconfig
index 3f9ea1e329f..7e7c2d79104 100644
--- a/configs/pine64-lts_defconfig
+++ b/configs/pine64-lts_defconfig
@@ -10,9 +10,6 @@ CONFIG_MMC0_CD_PIN=""
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/pine64_plus_defconfig b/configs/pine64_plus_defconfig
index 62608f93bdb..f42f4e5923a 100644
--- a/configs/pine64_plus_defconfig
+++ b/configs/pine64_plus_defconfig
@@ -6,9 +6,6 @@ CONFIG_MACH_SUN50I=y
 CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_PINE64_DT_SELECTION=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_OF_LIST="sun50i-a64-pine64 sun50i-a64-pine64-plus"
 CONFIG_PHY_REALTEK=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/pine_h64_defconfig b/configs/pine_h64_defconfig
index 2f511c80517..09a4275f0e7 100644
--- a/configs/pine_h64_defconfig
+++ b/configs/pine_h64_defconfig
@@ -11,9 +11,6 @@ CONFIG_USB3_VBUS_PIN="PL5"
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_PSCI_RESET is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x118000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/pinebook_defconfig b/configs/pinebook_defconfig
index 982f68143b9..26918dd3875 100644
--- a/configs/pinebook_defconfig
+++ b/configs/pinebook_defconfig
@@ -8,9 +8,6 @@ CONFIG_DRAM_CLK=552
 CONFIG_DRAM_ZQ=3881949
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_R_I2C_ENABLE=y
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_DM_REGULATOR_FIXED=y
diff --git a/configs/pinecube_defconfig b/configs/pinecube_defconfig
index 531cf0f83b6..28e347b4d95 100644
--- a/configs/pinecube_defconfig
+++ b/configs/pinecube_defconfig
@@ -8,9 +8,7 @@ CONFIG_DRAM_CLK=504
 CONFIG_DRAM_ODT_EN=y
 CONFIG_I2C0_ENABLE=y
 # CONFIG_HAS_ARMV7_SECURE_BASE is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/pinephone_defconfig b/configs/pinephone_defconfig
index 905b47d29e6..9d39204a439 100644
--- a/configs/pinephone_defconfig
+++ b/configs/pinephone_defconfig
@@ -10,9 +10,6 @@ CONFIG_DRAM_ZQ=3881949
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_PINEPHONE_DT_SELECTION=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_OF_LIST="sun50i-a64-pinephone-1.1 sun50i-a64-pinephone-1.2"
 CONFIG_LED_STATUS=y
 CONFIG_LED_STATUS_GPIO=y
diff --git a/configs/pinetab_defconfig b/configs/pinetab_defconfig
index e20d20a2fd5..0cc24146b39 100644
--- a/configs/pinetab_defconfig
+++ b/configs/pinetab_defconfig
@@ -8,6 +8,3 @@ CONFIG_DRAM_CLK=552
 CONFIG_DRAM_ZQ=3881949
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
diff --git a/configs/polaroid_mid2407pxe03_defconfig b/configs/polaroid_mid2407pxe03_defconfig
index 74ffaf1d011..17fffeb1e26 100644
--- a/configs/polaroid_mid2407pxe03_defconfig
+++ b/configs/polaroid_mid2407pxe03_defconfig
@@ -16,8 +16,6 @@ CONFIG_VIDEO_LCD_POWER="PH7"
 CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/polaroid_mid2809pxe04_defconfig b/configs/polaroid_mid2809pxe04_defconfig
index 10057ade9a5..e542b711132 100644
--- a/configs/polaroid_mid2809pxe04_defconfig
+++ b/configs/polaroid_mid2809pxe04_defconfig
@@ -16,8 +16,6 @@ CONFIG_VIDEO_LCD_POWER="PH7"
 CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/pov_protab2_ips9_defconfig b/configs/pov_protab2_ips9_defconfig
index 523de63fc27..a62c9f8fa37 100644
--- a/configs/pov_protab2_ips9_defconfig
+++ b/configs/pov_protab2_ips9_defconfig
@@ -14,9 +14,7 @@ CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/q8_a13_tablet_defconfig b/configs/q8_a13_tablet_defconfig
index 83981d3ac74..f269b8a5889 100644
--- a/configs/q8_a13_tablet_defconfig
+++ b/configs/q8_a13_tablet_defconfig
@@ -15,9 +15,7 @@ CONFIG_VIDEO_LCD_POWER="AXP0-0"
 CONFIG_VIDEO_LCD_BL_EN="AXP0-1"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/q8_a23_tablet_800x480_defconfig b/configs/q8_a23_tablet_800x480_defconfig
index 11d208a34a0..dda1a0c51f6 100644
--- a/configs/q8_a23_tablet_800x480_defconfig
+++ b/configs/q8_a23_tablet_800x480_defconfig
@@ -16,8 +16,6 @@ CONFIG_VIDEO_LCD_POWER="PH7"
 CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/q8_a33_tablet_1024x600_defconfig b/configs/q8_a33_tablet_1024x600_defconfig
index c848e62d73c..7925677d30e 100644
--- a/configs/q8_a33_tablet_1024x600_defconfig
+++ b/configs/q8_a33_tablet_1024x600_defconfig
@@ -16,8 +16,6 @@ CONFIG_VIDEO_LCD_POWER="PH7"
 CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/q8_a33_tablet_800x480_defconfig b/configs/q8_a33_tablet_800x480_defconfig
index ee5654185b1..f3335f9d233 100644
--- a/configs/q8_a33_tablet_800x480_defconfig
+++ b/configs/q8_a33_tablet_800x480_defconfig
@@ -16,8 +16,6 @@ CONFIG_VIDEO_LCD_POWER="PH7"
 CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/r7-tv-dongle_defconfig b/configs/r7-tv-dongle_defconfig
index f5adbd3686c..8875a09b2c9 100644
--- a/configs/r7-tv-dongle_defconfig
+++ b/configs/r7-tv-dongle_defconfig
@@ -6,9 +6,7 @@ CONFIG_MACH_SUN5I=y
 CONFIG_DRAM_CLK=384
 CONFIG_USB1_VBUS_PIN="PG13"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/sopine_baseboard_defconfig b/configs/sopine_baseboard_defconfig
index 55116f72d0d..fbbef7a9f9a 100644
--- a/configs/sopine_baseboard_defconfig
+++ b/configs/sopine_baseboard_defconfig
@@ -11,9 +11,6 @@ CONFIG_MMC0_CD_PIN=""
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/sun8i_a23_evb_defconfig b/configs/sun8i_a23_evb_defconfig
index 59315cdb05d..a3b1d76d8bb 100644
--- a/configs/sun8i_a23_evb_defconfig
+++ b/configs/sun8i_a23_evb_defconfig
@@ -9,8 +9,6 @@ CONFIG_USB0_VBUS_PIN="axp_drivebus"
 CONFIG_USB0_VBUS_DET="axp_vbus_detect"
 CONFIG_USB1_VBUS_PIN="PH7"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_CONS_INDEX=5
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/sunxi_Gemei_G9_defconfig b/configs/sunxi_Gemei_G9_defconfig
index b77c4e7a3cb..3fee7c2e50c 100644
--- a/configs/sunxi_Gemei_G9_defconfig
+++ b/configs/sunxi_Gemei_G9_defconfig
@@ -11,9 +11,7 @@ CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
 CONFIG_SPL_I2C=y
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/tanix_tx6_defconfig b/configs/tanix_tx6_defconfig
index 84dbf106d49..0390347415c 100644
--- a/configs/tanix_tx6_defconfig
+++ b/configs/tanix_tx6_defconfig
@@ -8,6 +8,3 @@ CONFIG_DRAM_CLK=648
 CONFIG_MMC0_CD_PIN="PF6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x118000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
diff --git a/configs/tbs_a711_defconfig b/configs/tbs_a711_defconfig
index 3dd9252a742..b3c2e69d6cd 100644
--- a/configs/tbs_a711_defconfig
+++ b/configs/tbs_a711_defconfig
@@ -13,8 +13,6 @@ CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
 CONFIG_USB0_ID_DET="PH11"
 CONFIG_AXP_GPIO=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_AXP_DCDC5_VOLT=1200
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/teres_i_defconfig b/configs/teres_i_defconfig
index 6f202dc8a43..e7de85eb506 100644
--- a/configs/teres_i_defconfig
+++ b/configs/teres_i_defconfig
@@ -9,9 +9,6 @@ CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_USB1_VBUS_PIN="PL7"
 CONFIG_I2C0_ENABLE=y
 CONFIG_PREBOOT="setenv usb_pgood_delay 2000; usb start"
-CONFIG_SPL_STACK=0x54000
-CONFIG_SYS_PBSIZE=1024
-CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_DM_REGULATOR_FIXED=y
diff --git a/configs/zeropi_defconfig b/configs/zeropi_defconfig
index 7d45440c0cc..11f3715e6dc 100644
--- a/configs/zeropi_defconfig
+++ b/configs/zeropi_defconfig
@@ -8,8 +8,6 @@ CONFIG_MACPWR="PD6"
 # CONFIG_VIDEO_DE2 is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
 CONFIG_CONSOLE_MUX=y
-CONFIG_SPL_STACK=0x8000
-CONFIG_SYS_PBSIZE=1024
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
-- 
2.35.3

