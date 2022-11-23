Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEBC2912
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Nov 2022 22:52:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F43F1FB;
	Wed, 23 Nov 2022 14:53:01 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 247DD3F73B;
	Wed, 23 Nov 2022 14:52:52 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>,
	Jagan Teki <jagan@amarulasolutions.com>
Cc: Simon Glass <sjg@chromium.org>,
	linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: [PATCH] sunxi: define SYS_MONITOR_LEN in Kconfig, not _defconfig
Date: Wed, 23 Nov 2022 22:51:17 +0000
Message-Id: <20221123225117.18760-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 08574ed339fb ("Convert CONFIG_SYS_MONITOR_LEN to Kconfig") moved
the definition of said config variable from the common sunxi header to
*every board's* defconfig.
This is a platform choice, not board specific, so remove the variable
from there, instead set the one value for all Allwinner boards in
Kconfig.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Kconfig                                        | 1 +
 configs/A10-OLinuXino-Lime_defconfig           | 1 -
 configs/A10s-OLinuXino-M_defconfig             | 1 -
 configs/A13-OLinuXinoM_defconfig               | 1 -
 configs/A13-OLinuXino_defconfig                | 1 -
 configs/A20-OLinuXino-Lime2-eMMC_defconfig     | 1 -
 configs/A20-OLinuXino-Lime2_defconfig          | 1 -
 configs/A20-OLinuXino-Lime_defconfig           | 1 -
 configs/A20-OLinuXino_MICRO-eMMC_defconfig     | 1 -
 configs/A20-OLinuXino_MICRO_defconfig          | 1 -
 configs/A20-Olimex-SOM-EVB_defconfig           | 1 -
 configs/A20-Olimex-SOM204-EVB-eMMC_defconfig   | 1 -
 configs/A20-Olimex-SOM204-EVB_defconfig        | 1 -
 configs/A33-OLinuXino_defconfig                | 1 -
 configs/Ainol_AW1_defconfig                    | 1 -
 configs/Ampe_A76_defconfig                     | 1 -
 configs/Auxtek-T003_defconfig                  | 1 -
 configs/Auxtek-T004_defconfig                  | 1 -
 configs/Bananapi_M2_Ultra_defconfig            | 1 -
 configs/Bananapi_defconfig                     | 1 -
 configs/Bananapi_m2m_defconfig                 | 1 -
 configs/Bananapro_defconfig                    | 1 -
 configs/CHIP_defconfig                         | 1 -
 configs/CHIP_pro_defconfig                     | 1 -
 configs/CSQ_CS908_defconfig                    | 1 -
 configs/Chuwi_V7_CW0825_defconfig              | 1 -
 configs/Colombus_defconfig                     | 1 -
 configs/Cubieboard2_defconfig                  | 1 -
 configs/Cubieboard4_defconfig                  | 1 -
 configs/Cubieboard_defconfig                   | 1 -
 configs/Cubietruck_defconfig                   | 1 -
 configs/Cubietruck_plus_defconfig              | 1 -
 configs/Empire_electronix_d709_defconfig       | 1 -
 configs/Empire_electronix_m712_defconfig       | 1 -
 configs/Hummingbird_A31_defconfig              | 1 -
 configs/Hyundai_A7HD_defconfig                 | 1 -
 configs/Itead_Ibox_A20_defconfig               | 1 -
 configs/Lamobo_R1_defconfig                    | 1 -
 configs/LicheePi_Zero_defconfig                | 1 -
 configs/Linksprite_pcDuino3_Nano_defconfig     | 1 -
 configs/Linksprite_pcDuino3_defconfig          | 1 -
 configs/Linksprite_pcDuino_defconfig           | 1 -
 configs/MK808C_defconfig                       | 1 -
 configs/MSI_Primo73_defconfig                  | 1 -
 configs/MSI_Primo81_defconfig                  | 1 -
 configs/Marsboard_A10_defconfig                | 1 -
 configs/Mele_A1000G_quad_defconfig             | 1 -
 configs/Mele_A1000_defconfig                   | 1 -
 configs/Mele_I7_defconfig                      | 1 -
 configs/Mele_M3_defconfig                      | 1 -
 configs/Mele_M5_defconfig                      | 1 -
 configs/Mele_M9_defconfig                      | 1 -
 configs/Merrii_A80_Optimus_defconfig           | 1 -
 configs/Mini-X_defconfig                       | 1 -
 configs/Nintendo_NES_Classic_Edition_defconfig | 1 -
 configs/Orangepi_defconfig                     | 1 -
 configs/Orangepi_mini_defconfig                | 1 -
 configs/Sinlinx_SinA31s_defconfig              | 1 -
 configs/Sinlinx_SinA33_defconfig               | 1 -
 configs/Sinovoip_BPI_M2_defconfig              | 1 -
 configs/Sinovoip_BPI_M3_defconfig              | 1 -
 configs/Sunchip_CX-A99_defconfig               | 1 -
 configs/UTOO_P66_defconfig                     | 1 -
 configs/Wexler_TAB7200_defconfig               | 1 -
 configs/Wits_Pro_A20_DKT_defconfig             | 1 -
 configs/Wobo_i5_defconfig                      | 1 -
 configs/Yones_Toptech_BD1078_defconfig         | 1 -
 configs/Yones_Toptech_BS1078_V2_defconfig      | 1 -
 configs/a64-olinuxino-emmc_defconfig           | 1 -
 configs/a64-olinuxino_defconfig                | 1 -
 configs/amarula_a64_relic_defconfig            | 1 -
 configs/ba10_tv_box_defconfig                  | 1 -
 configs/bananapi_m1_plus_defconfig             | 1 -
 configs/bananapi_m2_berry_defconfig            | 1 -
 configs/bananapi_m2_plus_h3_defconfig          | 1 -
 configs/bananapi_m2_plus_h5_defconfig          | 1 -
 configs/bananapi_m2_zero_defconfig             | 1 -
 configs/bananapi_m64_defconfig                 | 1 -
 configs/beelink_gs1_defconfig                  | 1 -
 configs/beelink_x2_defconfig                   | 1 -
 configs/colorfly_e708_q1_defconfig             | 1 -
 configs/difrnce_dit4350_defconfig              | 1 -
 configs/dserve_dsrv9703c_defconfig             | 1 -
 configs/emlid_neutis_n5_devboard_defconfig     | 1 -
 configs/ga10h_v1_1_defconfig                   | 1 -
 configs/gt90h_v4_defconfig                     | 1 -
 configs/h8_homlet_v2_defconfig                 | 1 -
 configs/i12-tvbox_defconfig                    | 1 -
 configs/iNet_3F_defconfig                      | 1 -
 configs/iNet_3W_defconfig                      | 1 -
 configs/iNet_86VS_defconfig                    | 1 -
 configs/iNet_D978_rev2_defconfig               | 1 -
 configs/icnova-a20-swac_defconfig              | 1 -
 configs/inet1_defconfig                        | 1 -
 configs/inet86dz_defconfig                     | 1 -
 configs/inet97fv2_defconfig                    | 1 -
 configs/inet98v_rev2_defconfig                 | 1 -
 configs/inet9f_rev03_defconfig                 | 1 -
 configs/inet_q972_defconfig                    | 1 -
 configs/jesurun_q5_defconfig                   | 1 -
 configs/libretech_all_h3_cc_h2_plus_defconfig  | 1 -
 configs/libretech_all_h3_cc_h3_defconfig       | 1 -
 configs/libretech_all_h3_cc_h5_defconfig       | 1 -
 configs/libretech_all_h3_it_h5_defconfig       | 1 -
 configs/libretech_all_h5_cc_h5_defconfig       | 1 -
 configs/licheepi_nano_defconfig                | 1 -
 configs/mixtile_loftq_defconfig                | 1 -
 configs/mk802_a10s_defconfig                   | 1 -
 configs/mk802_defconfig                        | 1 -
 configs/mk802ii_defconfig                      | 1 -
 configs/nanopi_a64_defconfig                   | 1 -
 configs/nanopi_m1_defconfig                    | 1 -
 configs/nanopi_m1_plus_defconfig               | 1 -
 configs/nanopi_neo2_defconfig                  | 1 -
 configs/nanopi_neo_air_defconfig               | 1 -
 configs/nanopi_neo_defconfig                   | 1 -
 configs/nanopi_neo_plus2_defconfig             | 1 -
 configs/nanopi_r1s_h5_defconfig                | 1 -
 configs/oceanic_5205_5inmfd_defconfig          | 1 -
 configs/orangepi_2_defconfig                   | 1 -
 configs/orangepi_3_defconfig                   | 1 -
 configs/orangepi_lite2_defconfig               | 1 -
 configs/orangepi_lite_defconfig                | 1 -
 configs/orangepi_one_defconfig                 | 1 -
 configs/orangepi_one_plus_defconfig            | 1 -
 configs/orangepi_pc2_defconfig                 | 1 -
 configs/orangepi_pc_defconfig                  | 1 -
 configs/orangepi_pc_plus_defconfig             | 1 -
 configs/orangepi_plus2e_defconfig              | 1 -
 configs/orangepi_plus_defconfig                | 1 -
 configs/orangepi_prime_defconfig               | 1 -
 configs/orangepi_r1_defconfig                  | 1 -
 configs/orangepi_win_defconfig                 | 1 -
 configs/orangepi_zero2_defconfig               | 1 -
 configs/orangepi_zero_defconfig                | 1 -
 configs/orangepi_zero_plus2_defconfig          | 1 -
 configs/orangepi_zero_plus2_h3_defconfig       | 1 -
 configs/orangepi_zero_plus_defconfig           | 1 -
 configs/parrot_r16_defconfig                   | 1 -
 configs/pine64-lts_defconfig                   | 1 -
 configs/pine64_plus_defconfig                  | 1 -
 configs/pine_h64_defconfig                     | 1 -
 configs/pinebook_defconfig                     | 1 -
 configs/pinecube_defconfig                     | 1 -
 configs/pinephone_defconfig                    | 1 -
 configs/pinetab_defconfig                      | 1 -
 configs/polaroid_mid2407pxe03_defconfig        | 1 -
 configs/polaroid_mid2809pxe04_defconfig        | 1 -
 configs/pov_protab2_ips9_defconfig             | 1 -
 configs/q8_a13_tablet_defconfig                | 1 -
 configs/q8_a23_tablet_800x480_defconfig        | 1 -
 configs/q8_a33_tablet_1024x600_defconfig       | 1 -
 configs/q8_a33_tablet_800x480_defconfig        | 1 -
 configs/r7-tv-dongle_defconfig                 | 1 -
 configs/sopine_baseboard_defconfig             | 1 -
 configs/sun8i_a23_evb_defconfig                | 1 -
 configs/sunxi_Gemei_G9_defconfig               | 1 -
 configs/tanix_tx6_defconfig                    | 1 -
 configs/tbs_a711_defconfig                     | 1 -
 configs/teres_i_defconfig                      | 1 -
 configs/x96_mate_defconfig                     | 1 -
 configs/zeropi_defconfig                       | 1 -
 162 files changed, 1 insertion(+), 161 deletions(-)

diff --git a/Kconfig b/Kconfig
index 67f46467b17..0cdc9658f79 100644
--- a/Kconfig
+++ b/Kconfig
@@ -586,6 +586,7 @@ config SYS_SRAM_SIZE
 config SYS_MONITOR_LEN
 	int "Maximum size in bytes reserved for U-Boot in memory"
 	default 1048576 if X86
+	default 786432 if ARCH_SUNXI
 	default 0
 	help
 	  Size of memory reserved for monitor code, used to determine
diff --git a/configs/A10-OLinuXino-Lime_defconfig b/configs/A10-OLinuXino-Lime_defconfig
index ee92ac45fbc..6727932f7fe 100644
--- a/configs/A10-OLinuXino-Lime_defconfig
+++ b/configs/A10-OLinuXino-Lime_defconfig
@@ -11,7 +11,6 @@ CONFIG_I2C1_ENABLE=y
 CONFIG_SATAPWR="PC3"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/A10s-OLinuXino-M_defconfig b/configs/A10s-OLinuXino-M_defconfig
index 2ac68039b0e..99f57857517 100644
--- a/configs/A10s-OLinuXino-M_defconfig
+++ b/configs/A10s-OLinuXino-M_defconfig
@@ -9,7 +9,6 @@ CONFIG_MMC1_CD_PIN="PG13"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=1
 CONFIG_USB1_VBUS_PIN="PB10"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/A13-OLinuXinoM_defconfig b/configs/A13-OLinuXinoM_defconfig
index 8f390cb83f8..f9d17b19500 100644
--- a/configs/A13-OLinuXinoM_defconfig
+++ b/configs/A13-OLinuXinoM_defconfig
@@ -13,7 +13,6 @@ CONFIG_VIDEO_VGA_VIA_LCD_FORCE_SYNC_ACTIVE_HIGH=y
 CONFIG_VIDEO_LCD_POWER="PB10"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/A13-OLinuXino_defconfig b/configs/A13-OLinuXino_defconfig
index ec11da5f061..8c9043559bd 100644
--- a/configs/A13-OLinuXino_defconfig
+++ b/configs/A13-OLinuXino_defconfig
@@ -15,7 +15,6 @@ CONFIG_VIDEO_VGA_VIA_LCD_FORCE_SYNC_ACTIVE_HIGH=y
 CONFIG_VIDEO_LCD_POWER="AXP0-0"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_CMD_DFU=y
 CONFIG_CMD_USB_MASS_STORAGE=y
diff --git a/configs/A20-OLinuXino-Lime2-eMMC_defconfig b/configs/A20-OLinuXino-Lime2-eMMC_defconfig
index 8ce10d6f75b..bccadcc7b4a 100644
--- a/configs/A20-OLinuXino-Lime2-eMMC_defconfig
+++ b/configs/A20-OLinuXino-Lime2-eMMC_defconfig
@@ -13,7 +13,6 @@ CONFIG_SATAPWR="PC3"
 CONFIG_SPL_SPI_SUNXI=y
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_CMD_DFU=y
 CONFIG_CMD_USB_MASS_STORAGE=y
diff --git a/configs/A20-OLinuXino-Lime2_defconfig b/configs/A20-OLinuXino-Lime2_defconfig
index e38110b030b..0a9de5ee671 100644
--- a/configs/A20-OLinuXino-Lime2_defconfig
+++ b/configs/A20-OLinuXino-Lime2_defconfig
@@ -11,7 +11,6 @@ CONFIG_I2C1_ENABLE=y
 CONFIG_SATAPWR="PC3"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_CMD_DFU=y
 CONFIG_CMD_USB_MASS_STORAGE=y
diff --git a/configs/A20-OLinuXino-Lime_defconfig b/configs/A20-OLinuXino-Lime_defconfig
index 4e4804748ef..38daf33b95b 100644
--- a/configs/A20-OLinuXino-Lime_defconfig
+++ b/configs/A20-OLinuXino-Lime_defconfig
@@ -9,7 +9,6 @@ CONFIG_I2C1_ENABLE=y
 CONFIG_SATAPWR="PC3"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/A20-OLinuXino_MICRO-eMMC_defconfig b/configs/A20-OLinuXino_MICRO-eMMC_defconfig
index 113d54dc0b9..d73e64c4605 100644
--- a/configs/A20-OLinuXino_MICRO-eMMC_defconfig
+++ b/configs/A20-OLinuXino_MICRO-eMMC_defconfig
@@ -11,7 +11,6 @@ CONFIG_VIDEO_VGA=y
 CONFIG_SATAPWR="PB8"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/A20-OLinuXino_MICRO_defconfig b/configs/A20-OLinuXino_MICRO_defconfig
index 1e1c30ef303..8a6bb885e9c 100644
--- a/configs/A20-OLinuXino_MICRO_defconfig
+++ b/configs/A20-OLinuXino_MICRO_defconfig
@@ -12,7 +12,6 @@ CONFIG_VIDEO_VGA=y
 CONFIG_SATAPWR="PB8"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/A20-Olimex-SOM-EVB_defconfig b/configs/A20-Olimex-SOM-EVB_defconfig
index e76e6dd0932..5de6c2d9a9e 100644
--- a/configs/A20-Olimex-SOM-EVB_defconfig
+++ b/configs/A20-Olimex-SOM-EVB_defconfig
@@ -12,7 +12,6 @@ CONFIG_USB0_VBUS_DET="PH5"
 CONFIG_SATAPWR="PC3"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig b/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig
index 1d3cf311952..6e9bdc27d98 100644
--- a/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig
+++ b/configs/A20-Olimex-SOM204-EVB-eMMC_defconfig
@@ -13,7 +13,6 @@ CONFIG_SATAPWR="PC3"
 CONFIG_GMAC_TX_DELAY=4
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/A20-Olimex-SOM204-EVB_defconfig b/configs/A20-Olimex-SOM204-EVB_defconfig
index 97d0b9cee75..e0517459ee6 100644
--- a/configs/A20-Olimex-SOM204-EVB_defconfig
+++ b/configs/A20-Olimex-SOM204-EVB_defconfig
@@ -12,7 +12,6 @@ CONFIG_SATAPWR="PC3"
 CONFIG_GMAC_TX_DELAY=4
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/A33-OLinuXino_defconfig b/configs/A33-OLinuXino_defconfig
index 49c9250092e..351a454339b 100644
--- a/configs/A33-OLinuXino_defconfig
+++ b/configs/A33-OLinuXino_defconfig
@@ -16,6 +16,5 @@ CONFIG_VIDEO_LCD_DCLK_PHASE=0
 CONFIG_VIDEO_LCD_BL_EN="PB2"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_AXP_DCDC1_VOLT=3300
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/Ainol_AW1_defconfig b/configs/Ainol_AW1_defconfig
index 4f01188fcf8..9a18af8c6e1 100644
--- a/configs/Ainol_AW1_defconfig
+++ b/configs/Ainol_AW1_defconfig
@@ -14,7 +14,6 @@ CONFIG_VIDEO_LCD_POWER="PH8"
 CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/Ampe_A76_defconfig b/configs/Ampe_A76_defconfig
index d5cf1f42e5d..7bf3dfcd8a5 100644
--- a/configs/Ampe_A76_defconfig
+++ b/configs/Ampe_A76_defconfig
@@ -15,7 +15,6 @@ CONFIG_VIDEO_LCD_POWER="AXP0-0"
 CONFIG_VIDEO_LCD_BL_EN="AXP0-1"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/Auxtek-T003_defconfig b/configs/Auxtek-T003_defconfig
index 2b9d3a88ab6..7d81f12f766 100644
--- a/configs/Auxtek-T003_defconfig
+++ b/configs/Auxtek-T003_defconfig
@@ -8,7 +8,6 @@ CONFIG_DRAM_EMR1=0
 CONFIG_USB1_VBUS_PIN="PB10"
 CONFIG_VIDEO_COMPOSITE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/Auxtek-T004_defconfig b/configs/Auxtek-T004_defconfig
index f3e6944b14e..4c7154b04c4 100644
--- a/configs/Auxtek-T004_defconfig
+++ b/configs/Auxtek-T004_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN5I=y
 CONFIG_DRAM_CLK=432
 CONFIG_USB1_VBUS_PIN="PG13"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/Bananapi_M2_Ultra_defconfig b/configs/Bananapi_M2_Ultra_defconfig
index 0bd163afdd7..18ee81b6378 100644
--- a/configs/Bananapi_M2_Ultra_defconfig
+++ b/configs/Bananapi_M2_Ultra_defconfig
@@ -12,7 +12,6 @@ CONFIG_USB2_VBUS_PIN="PH23"
 # CONFIG_HAS_ARMV7_SECURE_BASE is not set
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/Bananapi_defconfig b/configs/Bananapi_defconfig
index 2814d77c187..6c2a1f630e8 100644
--- a/configs/Bananapi_defconfig
+++ b/configs/Bananapi_defconfig
@@ -9,7 +9,6 @@ CONFIG_VIDEO_COMPOSITE=y
 CONFIG_GMAC_TX_DELAY=3
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_NETCONSOLE=y
 CONFIG_SCSI_AHCI=y
diff --git a/configs/Bananapi_m2m_defconfig b/configs/Bananapi_m2m_defconfig
index 0e73265abb5..bad38a66568 100644
--- a/configs/Bananapi_m2m_defconfig
+++ b/configs/Bananapi_m2m_defconfig
@@ -10,7 +10,6 @@ CONFIG_MMC0_CD_PIN="PB4"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_USB0_ID_DET="PH8"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/Bananapro_defconfig b/configs/Bananapro_defconfig
index 11375991c81..94fd74754ea 100644
--- a/configs/Bananapro_defconfig
+++ b/configs/Bananapro_defconfig
@@ -11,7 +11,6 @@ CONFIG_VIDEO_COMPOSITE=y
 CONFIG_GMAC_TX_DELAY=3
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_NETCONSOLE=y
 CONFIG_SCSI_AHCI=y
diff --git a/configs/CHIP_defconfig b/configs/CHIP_defconfig
index 03b2e03963e..cd9bdbfd36f 100644
--- a/configs/CHIP_defconfig
+++ b/configs/CHIP_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_TIMINGS_DDR3_800E_1066G_1333J=y
 CONFIG_USB0_VBUS_PIN="PB10"
 CONFIG_VIDEO_COMPOSITE=y
 CONFIG_CHIP_DIP_SCAN=y
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_CMD_DFU=y
 CONFIG_DFU_RAM=y
diff --git a/configs/CHIP_pro_defconfig b/configs/CHIP_pro_defconfig
index 0e7d5e7c96f..5a12fbb8cda 100644
--- a/configs/CHIP_pro_defconfig
+++ b/configs/CHIP_pro_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN5I=y
 CONFIG_DRAM_TIMINGS_DDR3_800E_1066G_1333J=y
 CONFIG_USB0_VBUS_PIN="PB10"
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 # CONFIG_CMD_FLASH is not set
 CONFIG_CMD_MTDPARTS=y
diff --git a/configs/CSQ_CS908_defconfig b/configs/CSQ_CS908_defconfig
index 73983b1f97d..1cd39d498f2 100644
--- a/configs/CSQ_CS908_defconfig
+++ b/configs/CSQ_CS908_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_CLK=432
 CONFIG_USB1_VBUS_PIN=""
 CONFIG_USB2_VBUS_PIN=""
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_PHY_REALTEK=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
diff --git a/configs/Chuwi_V7_CW0825_defconfig b/configs/Chuwi_V7_CW0825_defconfig
index 4f964f19f07..02b3e69584f 100644
--- a/configs/Chuwi_V7_CW0825_defconfig
+++ b/configs/Chuwi_V7_CW0825_defconfig
@@ -14,7 +14,6 @@ CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 CONFIG_VIDEO_LCD_PANEL_HITACHI_TX18D42VM=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/Colombus_defconfig b/configs/Colombus_defconfig
index 470d3f3ea01..270bd7d351a 100644
--- a/configs/Colombus_defconfig
+++ b/configs/Colombus_defconfig
@@ -15,7 +15,6 @@ CONFIG_VIDEO_LCD_BL_EN="PM1"
 CONFIG_VIDEO_LCD_BL_PWM="PH13"
 CONFIG_VIDEO_LCD_PANEL_EDP_4_LANE_1620M_VIA_ANX9804=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/Cubieboard2_defconfig b/configs/Cubieboard2_defconfig
index 2c1b3d27aa0..ab5e53fb62e 100644
--- a/configs/Cubieboard2_defconfig
+++ b/configs/Cubieboard2_defconfig
@@ -8,7 +8,6 @@ CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_SATAPWR="PB8"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/Cubieboard4_defconfig b/configs/Cubieboard4_defconfig
index c17edba90e0..04ed79afb6d 100644
--- a/configs/Cubieboard4_defconfig
+++ b/configs/Cubieboard4_defconfig
@@ -12,6 +12,5 @@ CONFIG_USB0_ID_DET="PH16"
 CONFIG_USB1_VBUS_PIN="PH14"
 CONFIG_USB3_VBUS_PIN="PH15"
 CONFIG_AXP_GPIO=y
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SYS_I2C_SUN8I_RSB=y
 CONFIG_AXP809_POWER=y
diff --git a/configs/Cubieboard_defconfig b/configs/Cubieboard_defconfig
index 008167509d3..c017b126b8c 100644
--- a/configs/Cubieboard_defconfig
+++ b/configs/Cubieboard_defconfig
@@ -8,7 +8,6 @@ CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_SATAPWR="PB8"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/Cubietruck_defconfig b/configs/Cubietruck_defconfig
index a4246343706..c85468e5827 100644
--- a/configs/Cubietruck_defconfig
+++ b/configs/Cubietruck_defconfig
@@ -13,7 +13,6 @@ CONFIG_SATAPWR="PH12"
 CONFIG_GMAC_TX_DELAY=1
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_CMD_DFU=y
 CONFIG_CMD_USB_MASS_STORAGE=y
diff --git a/configs/Cubietruck_plus_defconfig b/configs/Cubietruck_plus_defconfig
index b44b9a71ac2..13f958977be 100644
--- a/configs/Cubietruck_plus_defconfig
+++ b/configs/Cubietruck_plus_defconfig
@@ -15,7 +15,6 @@ CONFIG_USB2_VBUS_PIN="PL6"
 CONFIG_I2C0_ENABLE=y
 CONFIG_AXP_GPIO=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_CONSOLE_MUX=y
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/Empire_electronix_d709_defconfig b/configs/Empire_electronix_d709_defconfig
index d31e867be30..a9bbe8bcffa 100644
--- a/configs/Empire_electronix_d709_defconfig
+++ b/configs/Empire_electronix_d709_defconfig
@@ -16,7 +16,6 @@ CONFIG_VIDEO_LCD_POWER="AXP0-0"
 CONFIG_VIDEO_LCD_BL_EN="AXP0-1"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/Empire_electronix_m712_defconfig b/configs/Empire_electronix_m712_defconfig
index 3e15d774336..fc1f26b7a99 100644
--- a/configs/Empire_electronix_m712_defconfig
+++ b/configs/Empire_electronix_m712_defconfig
@@ -15,7 +15,6 @@ CONFIG_VIDEO_LCD_POWER="AXP0-0"
 CONFIG_VIDEO_LCD_BL_EN="AXP0-1"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/Hummingbird_A31_defconfig b/configs/Hummingbird_A31_defconfig
index 0617192632a..24e8b5be1b5 100644
--- a/configs/Hummingbird_A31_defconfig
+++ b/configs/Hummingbird_A31_defconfig
@@ -9,7 +9,6 @@ CONFIG_USB2_VBUS_PIN=""
 CONFIG_VIDEO_VGA_VIA_LCD=y
 CONFIG_VIDEO_VGA_EXTERNAL_DAC_EN="PH25"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_PHY_REALTEK=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_RGMII=y
diff --git a/configs/Hyundai_A7HD_defconfig b/configs/Hyundai_A7HD_defconfig
index d745a680289..482e0fb7a83 100644
--- a/configs/Hyundai_A7HD_defconfig
+++ b/configs/Hyundai_A7HD_defconfig
@@ -15,7 +15,6 @@ CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_VIDEO_LCD_BL_PWM_ACTIVE_LOW is not set
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/Itead_Ibox_A20_defconfig b/configs/Itead_Ibox_A20_defconfig
index 6474c9e90a7..99df9cff24f 100644
--- a/configs/Itead_Ibox_A20_defconfig
+++ b/configs/Itead_Ibox_A20_defconfig
@@ -8,7 +8,6 @@ CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_SATAPWR="PB8"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/Lamobo_R1_defconfig b/configs/Lamobo_R1_defconfig
index c943fd3c06e..f97dc131f28 100644
--- a/configs/Lamobo_R1_defconfig
+++ b/configs/Lamobo_R1_defconfig
@@ -10,7 +10,6 @@ CONFIG_SATAPWR="PB3"
 CONFIG_GMAC_TX_DELAY=4
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/LicheePi_Zero_defconfig b/configs/LicheePi_Zero_defconfig
index 5e9732e62e6..9815348badd 100644
--- a/configs/LicheePi_Zero_defconfig
+++ b/configs/LicheePi_Zero_defconfig
@@ -5,5 +5,4 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_V3S=y
 CONFIG_DRAM_CLK=360
 # CONFIG_HAS_ARMV7_SECURE_BASE is not set
-CONFIG_SYS_MONITOR_LEN=786432
 # CONFIG_NETDEVICES is not set
diff --git a/configs/Linksprite_pcDuino3_Nano_defconfig b/configs/Linksprite_pcDuino3_Nano_defconfig
index 469dcc11f12..e3e30a49490 100644
--- a/configs/Linksprite_pcDuino3_Nano_defconfig
+++ b/configs/Linksprite_pcDuino3_Nano_defconfig
@@ -10,7 +10,6 @@ CONFIG_SATAPWR="PH2"
 CONFIG_GMAC_TX_DELAY=3
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/Linksprite_pcDuino3_defconfig b/configs/Linksprite_pcDuino3_defconfig
index c4a3f2db963..1fda0db4c9d 100644
--- a/configs/Linksprite_pcDuino3_defconfig
+++ b/configs/Linksprite_pcDuino3_defconfig
@@ -8,7 +8,6 @@ CONFIG_DRAM_ZQ=122
 CONFIG_SATAPWR="PH2"
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/Linksprite_pcDuino_defconfig b/configs/Linksprite_pcDuino_defconfig
index 80eb661e779..49dcfa098ee 100644
--- a/configs/Linksprite_pcDuino_defconfig
+++ b/configs/Linksprite_pcDuino_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN4I=y
 CONFIG_USB1_VBUS_PIN=""
 CONFIG_USB2_VBUS_PIN=""
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/MK808C_defconfig b/configs/MK808C_defconfig
index 0a4681b5578..3ed962d7cd9 100644
--- a/configs/MK808C_defconfig
+++ b/configs/MK808C_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN7I=y
 CONFIG_DRAM_CLK=384
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/MSI_Primo73_defconfig b/configs/MSI_Primo73_defconfig
index 915a74d92a5..071169fd298 100644
--- a/configs/MSI_Primo73_defconfig
+++ b/configs/MSI_Primo73_defconfig
@@ -10,7 +10,6 @@ CONFIG_VIDEO_LCD_POWER="PH8"
 CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/MSI_Primo81_defconfig b/configs/MSI_Primo81_defconfig
index d01532fe753..e77b0072923 100644
--- a/configs/MSI_Primo81_defconfig
+++ b/configs/MSI_Primo81_defconfig
@@ -13,7 +13,6 @@ CONFIG_VIDEO_LCD_BL_EN="PA25"
 CONFIG_VIDEO_LCD_BL_PWM="PH13"
 CONFIG_VIDEO_LCD_PANEL_MIPI_4_LANE_513_MBPS_VIA_SSD2828=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_AXP_DLDO1_VOLT=3300
 # CONFIG_REQUIRE_SERIAL_CONSOLE is not set
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/Marsboard_A10_defconfig b/configs/Marsboard_A10_defconfig
index e3ada32b2ff..3c5312d8824 100644
--- a/configs/Marsboard_A10_defconfig
+++ b/configs/Marsboard_A10_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN4I=y
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/Mele_A1000G_quad_defconfig b/configs/Mele_A1000G_quad_defconfig
index d1bc200ab8e..c697d286dc1 100644
--- a/configs/Mele_A1000G_quad_defconfig
+++ b/configs/Mele_A1000G_quad_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_ZQ=120
 CONFIG_USB1_VBUS_PIN="PC27"
 CONFIG_USB2_VBUS_PIN=""
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_PHY_REALTEK=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
diff --git a/configs/Mele_A1000_defconfig b/configs/Mele_A1000_defconfig
index 3424b976772..f5b6d908cdc 100644
--- a/configs/Mele_A1000_defconfig
+++ b/configs/Mele_A1000_defconfig
@@ -8,7 +8,6 @@ CONFIG_VIDEO_VGA=y
 CONFIG_VIDEO_COMPOSITE=y
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/Mele_I7_defconfig b/configs/Mele_I7_defconfig
index 11ba7862382..2b9bca13d08 100644
--- a/configs/Mele_I7_defconfig
+++ b/configs/Mele_I7_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_ZQ=120
 CONFIG_USB1_VBUS_PIN="PC27"
 CONFIG_USB2_VBUS_PIN=""
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_PHY_REALTEK=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
diff --git a/configs/Mele_M3_defconfig b/configs/Mele_M3_defconfig
index 1b04ebc22a6..77cb464c932 100644
--- a/configs/Mele_M3_defconfig
+++ b/configs/Mele_M3_defconfig
@@ -9,7 +9,6 @@ CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_VIDEO_VGA=y
 CONFIG_VIDEO_COMPOSITE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/Mele_M5_defconfig b/configs/Mele_M5_defconfig
index 114c2fe827f..b07dbbde2e4 100644
--- a/configs/Mele_M5_defconfig
+++ b/configs/Mele_M5_defconfig
@@ -9,7 +9,6 @@ CONFIG_MMC0_CD_PIN="PH1"
 CONFIG_VIDEO_COMPOSITE=y
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/Mele_M9_defconfig b/configs/Mele_M9_defconfig
index b24ef02f8a2..be6dd417545 100644
--- a/configs/Mele_M9_defconfig
+++ b/configs/Mele_M9_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_ZQ=120
 CONFIG_USB1_VBUS_PIN="PC27"
 CONFIG_USB2_VBUS_PIN=""
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_PHY_REALTEK=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
diff --git a/configs/Merrii_A80_Optimus_defconfig b/configs/Merrii_A80_Optimus_defconfig
index 2b96f6be120..c5d1f40df39 100644
--- a/configs/Merrii_A80_Optimus_defconfig
+++ b/configs/Merrii_A80_Optimus_defconfig
@@ -12,6 +12,5 @@ CONFIG_USB0_ID_DET="PH3"
 CONFIG_USB1_VBUS_PIN="PH4"
 CONFIG_USB3_VBUS_PIN="PH5"
 CONFIG_AXP_GPIO=y
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SYS_I2C_SUN8I_RSB=y
 CONFIG_AXP809_POWER=y
diff --git a/configs/Mini-X_defconfig b/configs/Mini-X_defconfig
index 72745f2b532..e8bc1485766 100644
--- a/configs/Mini-X_defconfig
+++ b/configs/Mini-X_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN4I=y
 CONFIG_USB0_VBUS_PIN="PB9"
 CONFIG_VIDEO_COMPOSITE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/Nintendo_NES_Classic_Edition_defconfig b/configs/Nintendo_NES_Classic_Edition_defconfig
index 94060ab107a..89fb441cc73 100644
--- a/configs/Nintendo_NES_Classic_Edition_defconfig
+++ b/configs/Nintendo_NES_Classic_Edition_defconfig
@@ -9,7 +9,6 @@ CONFIG_DRAM_ODT_EN=y
 CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
 CONFIG_AXP_GPIO=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 # CONFIG_CMD_FLASH is not set
 CONFIG_CMD_MTDPARTS=y
 # CONFIG_MMC is not set
diff --git a/configs/Orangepi_defconfig b/configs/Orangepi_defconfig
index b4d5feff309..c89a9a1f9dd 100644
--- a/configs/Orangepi_defconfig
+++ b/configs/Orangepi_defconfig
@@ -12,7 +12,6 @@ CONFIG_VIDEO_COMPOSITE=y
 CONFIG_GMAC_TX_DELAY=3
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/Orangepi_mini_defconfig b/configs/Orangepi_mini_defconfig
index 43197381114..8757dcb461c 100644
--- a/configs/Orangepi_mini_defconfig
+++ b/configs/Orangepi_mini_defconfig
@@ -14,7 +14,6 @@ CONFIG_VIDEO_COMPOSITE=y
 CONFIG_GMAC_TX_DELAY=3
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/Sinlinx_SinA31s_defconfig b/configs/Sinlinx_SinA31s_defconfig
index a1d62fce7c1..238b0073e79 100644
--- a/configs/Sinlinx_SinA31s_defconfig
+++ b/configs/Sinlinx_SinA31s_defconfig
@@ -10,7 +10,6 @@ CONFIG_MMC_SUNXI_SLOT_EXTRA=3
 CONFIG_USB1_VBUS_PIN=""
 CONFIG_USB2_VBUS_PIN=""
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_PHY_REALTEK=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_MII=y
diff --git a/configs/Sinlinx_SinA33_defconfig b/configs/Sinlinx_SinA33_defconfig
index eb172c70de8..4eb5300b046 100644
--- a/configs/Sinlinx_SinA33_defconfig
+++ b/configs/Sinlinx_SinA33_defconfig
@@ -13,7 +13,6 @@ CONFIG_VIDEO_LCD_DCLK_PHASE=0
 CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_CMD_DFU=y
 CONFIG_DFU_RAM=y
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
diff --git a/configs/Sinovoip_BPI_M2_defconfig b/configs/Sinovoip_BPI_M2_defconfig
index fa967bcc0c1..aba95270eb2 100644
--- a/configs/Sinovoip_BPI_M2_defconfig
+++ b/configs/Sinovoip_BPI_M2_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_CLK=432
 CONFIG_USB1_VBUS_PIN=""
 CONFIG_USB2_VBUS_PIN=""
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_PHY_REALTEK=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_RGMII=y
diff --git a/configs/Sinovoip_BPI_M3_defconfig b/configs/Sinovoip_BPI_M3_defconfig
index ab70eff68eb..5116fab52d7 100644
--- a/configs/Sinovoip_BPI_M3_defconfig
+++ b/configs/Sinovoip_BPI_M3_defconfig
@@ -15,7 +15,6 @@ CONFIG_USB1_VBUS_PIN="PD24"
 CONFIG_AXP_GPIO=y
 CONFIG_SATAPWR="PD25"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_CONSOLE_MUX=y
 CONFIG_PHY_REALTEK=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/Sunchip_CX-A99_defconfig b/configs/Sunchip_CX-A99_defconfig
index 53cead29762..bb62ae9a7a9 100644
--- a/configs/Sunchip_CX-A99_defconfig
+++ b/configs/Sunchip_CX-A99_defconfig
@@ -12,4 +12,3 @@ CONFIG_USB0_VBUS_PIN="PH15"
 CONFIG_USB1_VBUS_PIN="PL7"
 CONFIG_USB3_VBUS_PIN="PL8"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
diff --git a/configs/UTOO_P66_defconfig b/configs/UTOO_P66_defconfig
index d7912e18eae..b021b0a8865 100644
--- a/configs/UTOO_P66_defconfig
+++ b/configs/UTOO_P66_defconfig
@@ -20,7 +20,6 @@ CONFIG_VIDEO_LCD_BL_EN="AXP0-1"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 CONFIG_VIDEO_LCD_TL059WV5C0=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/Wexler_TAB7200_defconfig b/configs/Wexler_TAB7200_defconfig
index 8e729b8dc9c..101ce57aa44 100644
--- a/configs/Wexler_TAB7200_defconfig
+++ b/configs/Wexler_TAB7200_defconfig
@@ -13,7 +13,6 @@ CONFIG_VIDEO_LCD_POWER="PH8"
 CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/Wits_Pro_A20_DKT_defconfig b/configs/Wits_Pro_A20_DKT_defconfig
index 2eb1331e4d3..f401ac74ef4 100644
--- a/configs/Wits_Pro_A20_DKT_defconfig
+++ b/configs/Wits_Pro_A20_DKT_defconfig
@@ -12,7 +12,6 @@ CONFIG_VIDEO_LCD_BL_PWM="PB2"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/Wobo_i5_defconfig b/configs/Wobo_i5_defconfig
index fb8774786ec..e0687bf887d 100644
--- a/configs/Wobo_i5_defconfig
+++ b/configs/Wobo_i5_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_CLK=432
 CONFIG_MMC0_CD_PIN="PB3"
 CONFIG_USB1_VBUS_PIN="PG12"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/Yones_Toptech_BD1078_defconfig b/configs/Yones_Toptech_BD1078_defconfig
index 31e79ac6e34..f1ceb8b5527 100644
--- a/configs/Yones_Toptech_BD1078_defconfig
+++ b/configs/Yones_Toptech_BD1078_defconfig
@@ -19,7 +19,6 @@ CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_VIDEO_LCD_BL_PWM_ACTIVE_LOW is not set
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/Yones_Toptech_BS1078_V2_defconfig b/configs/Yones_Toptech_BS1078_V2_defconfig
index 625f72903a3..6701ecce2fe 100644
--- a/configs/Yones_Toptech_BS1078_V2_defconfig
+++ b/configs/Yones_Toptech_BS1078_V2_defconfig
@@ -16,6 +16,5 @@ CONFIG_VIDEO_LCD_BL_EN="PA25"
 CONFIG_VIDEO_LCD_BL_PWM="PH13"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/a64-olinuxino-emmc_defconfig b/configs/a64-olinuxino-emmc_defconfig
index c3eaaa75858..8ec9eb3e9c2 100644
--- a/configs/a64-olinuxino-emmc_defconfig
+++ b/configs/a64-olinuxino-emmc_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN50I=y
 CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/a64-olinuxino_defconfig b/configs/a64-olinuxino_defconfig
index 76323024523..16cef18beef 100644
--- a/configs/a64-olinuxino_defconfig
+++ b/configs/a64-olinuxino_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN50I=y
 CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/amarula_a64_relic_defconfig b/configs/amarula_a64_relic_defconfig
index 66c245ff0ae..ae44b66d109 100644
--- a/configs/amarula_a64_relic_defconfig
+++ b/configs/amarula_a64_relic_defconfig
@@ -7,7 +7,6 @@ CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_VIDEO_DE2 is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_MUSB_GADGET=y
diff --git a/configs/ba10_tv_box_defconfig b/configs/ba10_tv_box_defconfig
index 9268cebed64..b89dd8ea62b 100644
--- a/configs/ba10_tv_box_defconfig
+++ b/configs/ba10_tv_box_defconfig
@@ -9,7 +9,6 @@ CONFIG_USB0_VBUS_PIN="PB9"
 CONFIG_USB2_VBUS_PIN="PH12"
 CONFIG_VIDEO_COMPOSITE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/bananapi_m1_plus_defconfig b/configs/bananapi_m1_plus_defconfig
index 12ea6a3236a..0fbb619d623 100644
--- a/configs/bananapi_m1_plus_defconfig
+++ b/configs/bananapi_m1_plus_defconfig
@@ -9,7 +9,6 @@ CONFIG_VIDEO_COMPOSITE=y
 CONFIG_GMAC_TX_DELAY=3
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_NETCONSOLE=y
 CONFIG_SCSI_AHCI=y
diff --git a/configs/bananapi_m2_berry_defconfig b/configs/bananapi_m2_berry_defconfig
index 63f9c149827..588eea2a27d 100644
--- a/configs/bananapi_m2_berry_defconfig
+++ b/configs/bananapi_m2_berry_defconfig
@@ -9,7 +9,6 @@ CONFIG_USB1_VBUS_PIN="PH23"
 # CONFIG_HAS_ARMV7_SECURE_BASE is not set
 CONFIG_AHCI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SCSI_AHCI=y
 CONFIG_SYS_64BIT_LBA=y
diff --git a/configs/bananapi_m2_plus_h3_defconfig b/configs/bananapi_m2_plus_h3_defconfig
index 2bd5a70a2d0..26ced59fb02 100644
--- a/configs/bananapi_m2_plus_h3_defconfig
+++ b/configs/bananapi_m2_plus_h3_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_CLK=672
 CONFIG_MACPWR="PD6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/bananapi_m2_plus_h5_defconfig b/configs/bananapi_m2_plus_h5_defconfig
index 926cf6f5a4d..fb6c945919a 100644
--- a/configs/bananapi_m2_plus_h5_defconfig
+++ b/configs/bananapi_m2_plus_h5_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_CLK=672
 CONFIG_MACPWR="PD6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/bananapi_m2_zero_defconfig b/configs/bananapi_m2_zero_defconfig
index b351d505a41..ac3f8f5ab8b 100644
--- a/configs/bananapi_m2_zero_defconfig
+++ b/configs/bananapi_m2_zero_defconfig
@@ -6,4 +6,3 @@ CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=408
 CONFIG_MMC0_CD_PIN=""
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
diff --git a/configs/bananapi_m64_defconfig b/configs/bananapi_m64_defconfig
index 74fa637fd3c..5463b046fdb 100644
--- a/configs/bananapi_m64_defconfig
+++ b/configs/bananapi_m64_defconfig
@@ -7,7 +7,6 @@ CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_MMC0_CD_PIN="PH13"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/beelink_gs1_defconfig b/configs/beelink_gs1_defconfig
index 7d8f2160c85..42925eabcb0 100644
--- a/configs/beelink_gs1_defconfig
+++ b/configs/beelink_gs1_defconfig
@@ -8,7 +8,6 @@ CONFIG_MMC0_CD_PIN="PF6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_PSCI_RESET is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_LED=y
 CONFIG_LED_GPIO=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/beelink_x2_defconfig b/configs/beelink_x2_defconfig
index 68acb6b2633..6206d909003 100644
--- a/configs/beelink_x2_defconfig
+++ b/configs/beelink_x2_defconfig
@@ -6,6 +6,5 @@ CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=567
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/colorfly_e708_q1_defconfig b/configs/colorfly_e708_q1_defconfig
index a7496c8a0b9..5d3636e34e8 100644
--- a/configs/colorfly_e708_q1_defconfig
+++ b/configs/colorfly_e708_q1_defconfig
@@ -16,7 +16,6 @@ CONFIG_VIDEO_LCD_BL_EN="PA25"
 CONFIG_VIDEO_LCD_BL_PWM="PH13"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_AXP_DLDO2_VOLT=1800
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/difrnce_dit4350_defconfig b/configs/difrnce_dit4350_defconfig
index 1b292644d17..e1067b66eec 100644
--- a/configs/difrnce_dit4350_defconfig
+++ b/configs/difrnce_dit4350_defconfig
@@ -15,7 +15,6 @@ CONFIG_VIDEO_LCD_POWER="AXP0-0"
 CONFIG_VIDEO_LCD_BL_EN="AXP0-1"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/dserve_dsrv9703c_defconfig b/configs/dserve_dsrv9703c_defconfig
index d81782f727d..60910c3ce35 100644
--- a/configs/dserve_dsrv9703c_defconfig
+++ b/configs/dserve_dsrv9703c_defconfig
@@ -14,7 +14,6 @@ CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/emlid_neutis_n5_devboard_defconfig b/configs/emlid_neutis_n5_devboard_defconfig
index e482f3cb19e..a3b43dffc63 100644
--- a/configs/emlid_neutis_n5_devboard_defconfig
+++ b/configs/emlid_neutis_n5_devboard_defconfig
@@ -8,5 +8,4 @@ CONFIG_DRAM_ZQ=3881977
 # CONFIG_DRAM_ODT_EN is not set
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUPPORT_EMMC_BOOT=y
diff --git a/configs/ga10h_v1_1_defconfig b/configs/ga10h_v1_1_defconfig
index 03ba9dd26bf..599eeb96b4f 100644
--- a/configs/ga10h_v1_1_defconfig
+++ b/configs/ga10h_v1_1_defconfig
@@ -17,7 +17,6 @@ CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/gt90h_v4_defconfig b/configs/gt90h_v4_defconfig
index 4069cf14b08..1a5fe06bbe1 100644
--- a/configs/gt90h_v4_defconfig
+++ b/configs/gt90h_v4_defconfig
@@ -16,7 +16,6 @@ CONFIG_VIDEO_LCD_POWER="PH7"
 CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/h8_homlet_v2_defconfig b/configs/h8_homlet_v2_defconfig
index cf3e7ce73aa..29f965200e1 100644
--- a/configs/h8_homlet_v2_defconfig
+++ b/configs/h8_homlet_v2_defconfig
@@ -10,7 +10,6 @@ CONFIG_USB0_VBUS_PIN="PL5"
 CONFIG_USB1_VBUS_PIN="PL6"
 CONFIG_AXP_GPIO=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_CONSOLE_MUX=y
 CONFIG_AXP_DLDO4_VOLT=3300
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/i12-tvbox_defconfig b/configs/i12-tvbox_defconfig
index d75a7992a82..257dd89af45 100644
--- a/configs/i12-tvbox_defconfig
+++ b/configs/i12-tvbox_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_CLK=384
 CONFIG_MACPWR="PH21"
 CONFIG_VIDEO_COMPOSITE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/iNet_3F_defconfig b/configs/iNet_3F_defconfig
index 67474a8e62b..436e3a8c209 100644
--- a/configs/iNet_3F_defconfig
+++ b/configs/iNet_3F_defconfig
@@ -14,7 +14,6 @@ CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/iNet_3W_defconfig b/configs/iNet_3W_defconfig
index 23d41b796dc..6978f8b0aab 100644
--- a/configs/iNet_3W_defconfig
+++ b/configs/iNet_3W_defconfig
@@ -14,7 +14,6 @@ CONFIG_VIDEO_LCD_POWER="PH8"
 CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/iNet_86VS_defconfig b/configs/iNet_86VS_defconfig
index d51561eacc6..2c8ecb51de0 100644
--- a/configs/iNet_86VS_defconfig
+++ b/configs/iNet_86VS_defconfig
@@ -13,7 +13,6 @@ CONFIG_VIDEO_LCD_POWER="AXP0-0"
 CONFIG_VIDEO_LCD_BL_EN="AXP0-1"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/iNet_D978_rev2_defconfig b/configs/iNet_D978_rev2_defconfig
index 8057df5ef11..9a90252dbd7 100644
--- a/configs/iNet_D978_rev2_defconfig
+++ b/configs/iNet_D978_rev2_defconfig
@@ -17,7 +17,6 @@ CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_AXP_DLDO1_VOLT=3300
 # CONFIG_REQUIRE_SERIAL_CONSOLE is not set
 CONFIG_CONS_INDEX=5
diff --git a/configs/icnova-a20-swac_defconfig b/configs/icnova-a20-swac_defconfig
index 80441b32baa..c759d7e2357 100644
--- a/configs/icnova-a20-swac_defconfig
+++ b/configs/icnova-a20-swac_defconfig
@@ -17,7 +17,6 @@ CONFIG_VIDEO_LCD_MODE="x:800,y:480,depth:24,pclk_khz:33000,le:45,ri:209,up:22,lo
 CONFIG_VIDEO_LCD_POWER="PH22"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_CMD_UNZIP=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/inet1_defconfig b/configs/inet1_defconfig
index 64f77873441..f81120b1197 100644
--- a/configs/inet1_defconfig
+++ b/configs/inet1_defconfig
@@ -14,7 +14,6 @@ CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/inet86dz_defconfig b/configs/inet86dz_defconfig
index 086098e5f4c..3ade9fea824 100644
--- a/configs/inet86dz_defconfig
+++ b/configs/inet86dz_defconfig
@@ -16,7 +16,6 @@ CONFIG_VIDEO_LCD_POWER="PH7"
 CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/inet97fv2_defconfig b/configs/inet97fv2_defconfig
index 0f70e95233e..d5d2dc32c93 100644
--- a/configs/inet97fv2_defconfig
+++ b/configs/inet97fv2_defconfig
@@ -13,7 +13,6 @@ CONFIG_VIDEO_LCD_POWER="PH8"
 CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/inet98v_rev2_defconfig b/configs/inet98v_rev2_defconfig
index 5c61766fe94..bd6c45bd661 100644
--- a/configs/inet98v_rev2_defconfig
+++ b/configs/inet98v_rev2_defconfig
@@ -15,7 +15,6 @@ CONFIG_VIDEO_LCD_POWER="AXP0-0"
 CONFIG_VIDEO_LCD_BL_EN="AXP0-1"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/inet9f_rev03_defconfig b/configs/inet9f_rev03_defconfig
index d21d17fb984..4485f930236 100644
--- a/configs/inet9f_rev03_defconfig
+++ b/configs/inet9f_rev03_defconfig
@@ -13,7 +13,6 @@ CONFIG_VIDEO_LCD_POWER="PH8"
 CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/inet_q972_defconfig b/configs/inet_q972_defconfig
index a6148219253..1769256b7d1 100644
--- a/configs/inet_q972_defconfig
+++ b/configs/inet_q972_defconfig
@@ -15,7 +15,6 @@ CONFIG_VIDEO_LCD_DCLK_PHASE=0
 CONFIG_VIDEO_LCD_BL_EN="PA25"
 CONFIG_VIDEO_LCD_BL_PWM="PH13"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/jesurun_q5_defconfig b/configs/jesurun_q5_defconfig
index 2e6b045b549..0ff666b2ee5 100644
--- a/configs/jesurun_q5_defconfig
+++ b/configs/jesurun_q5_defconfig
@@ -8,7 +8,6 @@ CONFIG_MACPWR="PH19"
 CONFIG_USB0_VBUS_PIN="PB9"
 CONFIG_VIDEO_COMPOSITE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/libretech_all_h3_cc_h2_plus_defconfig b/configs/libretech_all_h3_cc_h2_plus_defconfig
index d19e3371410..8725fe64cdc 100644
--- a/configs/libretech_all_h3_cc_h2_plus_defconfig
+++ b/configs/libretech_all_h3_cc_h2_plus_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=672
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/libretech_all_h3_cc_h3_defconfig b/configs/libretech_all_h3_cc_h3_defconfig
index 4f3ab902d1e..5275fdc36da 100644
--- a/configs/libretech_all_h3_cc_h3_defconfig
+++ b/configs/libretech_all_h3_cc_h3_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=672
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/libretech_all_h3_cc_h5_defconfig b/configs/libretech_all_h3_cc_h5_defconfig
index a912829be5c..96274019499 100644
--- a/configs/libretech_all_h3_cc_h5_defconfig
+++ b/configs/libretech_all_h3_cc_h5_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN50I_H5=y
 CONFIG_DRAM_CLK=672
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/libretech_all_h3_it_h5_defconfig b/configs/libretech_all_h3_it_h5_defconfig
index f1f177c6815..cb7ffb4d7da 100644
--- a/configs/libretech_all_h3_it_h5_defconfig
+++ b/configs/libretech_all_h3_it_h5_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_CLK=672
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPI_FLASH_XMC=y
 CONFIG_SPI=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/libretech_all_h5_cc_h5_defconfig b/configs/libretech_all_h5_cc_h5_defconfig
index 1dbcaa8c75f..c3aa4b10617 100644
--- a/configs/libretech_all_h5_cc_h5_defconfig
+++ b/configs/libretech_all_h5_cc_h5_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_CLK=672
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPI_FLASH_XMC=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_SPI=y
diff --git a/configs/licheepi_nano_defconfig b/configs/licheepi_nano_defconfig
index e7663e1d1ba..12a43c1ec10 100644
--- a/configs/licheepi_nano_defconfig
+++ b/configs/licheepi_nano_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_CLK=156
 CONFIG_DRAM_ZQ=0
 # CONFIG_VIDEO_SUNXI is not set
 CONFIG_SPL_SPI_SUNXI=y
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_SPI_FLASH_XTX=y
 CONFIG_SPI=y
diff --git a/configs/mixtile_loftq_defconfig b/configs/mixtile_loftq_defconfig
index 646594b6e07..0e4cdc44670 100644
--- a/configs/mixtile_loftq_defconfig
+++ b/configs/mixtile_loftq_defconfig
@@ -9,7 +9,6 @@ CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_USB1_VBUS_PIN="PH24"
 CONFIG_USB2_VBUS_PIN=""
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_PHY_REALTEK=y
 CONFIG_ETH_DESIGNWARE=y
 CONFIG_RGMII=y
diff --git a/configs/mk802_a10s_defconfig b/configs/mk802_a10s_defconfig
index ffcb9329742..21f7a6e535d 100644
--- a/configs/mk802_a10s_defconfig
+++ b/configs/mk802_a10s_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_CLK=432
 CONFIG_DRAM_EMR1=0
 CONFIG_USB1_VBUS_PIN="PB10"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/mk802_defconfig b/configs/mk802_defconfig
index 1186a5361e9..416565e5af2 100644
--- a/configs/mk802_defconfig
+++ b/configs/mk802_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN4I=y
 CONFIG_USB2_VBUS_PIN="PH12"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
 CONFIG_SYS_I2C_SPEED=400000
diff --git a/configs/mk802ii_defconfig b/configs/mk802ii_defconfig
index 9c31b33c43c..965a9cd5c4b 100644
--- a/configs/mk802ii_defconfig
+++ b/configs/mk802ii_defconfig
@@ -4,7 +4,6 @@ CONFIG_DEFAULT_DEVICE_TREE="sun4i-a10-mk802ii"
 CONFIG_SPL=y
 CONFIG_MACH_SUN4I=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/nanopi_a64_defconfig b/configs/nanopi_a64_defconfig
index ed11e0a6308..70fc257eebd 100644
--- a/configs/nanopi_a64_defconfig
+++ b/configs/nanopi_a64_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN50I=y
 CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/nanopi_m1_defconfig b/configs/nanopi_m1_defconfig
index 9419eaf5511..dc2dbd62900 100644
--- a/configs/nanopi_m1_defconfig
+++ b/configs/nanopi_m1_defconfig
@@ -5,6 +5,5 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=408
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/nanopi_m1_plus_defconfig b/configs/nanopi_m1_plus_defconfig
index 89065f0411a..37b7817d869 100644
--- a/configs/nanopi_m1_plus_defconfig
+++ b/configs/nanopi_m1_plus_defconfig
@@ -8,7 +8,6 @@ CONFIG_MACPWR="PD6"
 CONFIG_MMC0_CD_PIN="PH13"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/nanopi_neo2_defconfig b/configs/nanopi_neo2_defconfig
index d76d37f271e..95dd56aa04c 100644
--- a/configs/nanopi_neo2_defconfig
+++ b/configs/nanopi_neo2_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_CLK=672
 CONFIG_DRAM_ZQ=3881977
 # CONFIG_DRAM_ODT_EN is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/nanopi_neo_air_defconfig b/configs/nanopi_neo_air_defconfig
index 09a6bfa2e06..806d95c1cc7 100644
--- a/configs/nanopi_neo_air_defconfig
+++ b/configs/nanopi_neo_air_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=408
 # CONFIG_VIDEO_DE2 is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_CONSOLE_MUX=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/nanopi_neo_defconfig b/configs/nanopi_neo_defconfig
index 6110cfd4953..c0255196384 100644
--- a/configs/nanopi_neo_defconfig
+++ b/configs/nanopi_neo_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=408
 # CONFIG_VIDEO_DE2 is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_CONSOLE_MUX=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/nanopi_neo_plus2_defconfig b/configs/nanopi_neo_plus2_defconfig
index d462b63e944..924ff38f17c 100644
--- a/configs/nanopi_neo_plus2_defconfig
+++ b/configs/nanopi_neo_plus2_defconfig
@@ -9,7 +9,6 @@ CONFIG_DRAM_ZQ=3881977
 CONFIG_MACPWR="PD6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/nanopi_r1s_h5_defconfig b/configs/nanopi_r1s_h5_defconfig
index 5c332ca5261..27cf172d72a 100644
--- a/configs/nanopi_r1s_h5_defconfig
+++ b/configs/nanopi_r1s_h5_defconfig
@@ -9,7 +9,6 @@ CONFIG_DRAM_ZQ=3881977
 CONFIG_MACPWR="PD6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/oceanic_5205_5inmfd_defconfig b/configs/oceanic_5205_5inmfd_defconfig
index ca3139431fe..7ce63ba665d 100644
--- a/configs/oceanic_5205_5inmfd_defconfig
+++ b/configs/oceanic_5205_5inmfd_defconfig
@@ -10,7 +10,6 @@ CONFIG_DRAM_ZQ=3881949
 CONFIG_MMC0_CD_PIN=""
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUN8I_EMAC=y
 CONFIG_SPI=y
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/orangepi_2_defconfig b/configs/orangepi_2_defconfig
index 000ab3e672c..7aaa5190b3a 100644
--- a/configs/orangepi_2_defconfig
+++ b/configs/orangepi_2_defconfig
@@ -7,7 +7,6 @@ CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=672
 CONFIG_USB1_VBUS_PIN="PG13"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/orangepi_3_defconfig b/configs/orangepi_3_defconfig
index 3debe90cb66..ebecf49ebda 100644
--- a/configs/orangepi_3_defconfig
+++ b/configs/orangepi_3_defconfig
@@ -8,7 +8,6 @@ CONFIG_MMC0_CD_PIN="PF6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_BLUETOOTH_DT_DEVICE_FIXUP="brcm,bcm4345c5"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_PHY_SUN50I_USB3=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_DWC3=y
diff --git a/configs/orangepi_lite2_defconfig b/configs/orangepi_lite2_defconfig
index 37d3cf7d7dc..75c97d6b897 100644
--- a/configs/orangepi_lite2_defconfig
+++ b/configs/orangepi_lite2_defconfig
@@ -7,6 +7,5 @@ CONFIG_SUNXI_DRAM_H6_LPDDR3=y
 CONFIG_MMC0_CD_PIN="PF6"
 # CONFIG_PSCI_RESET is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_lite_defconfig b/configs/orangepi_lite_defconfig
index 25f5a4fe6f0..96bbd1bab6f 100644
--- a/configs/orangepi_lite_defconfig
+++ b/configs/orangepi_lite_defconfig
@@ -5,6 +5,5 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=672
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_one_defconfig b/configs/orangepi_one_defconfig
index 094f8d1dfa2..1064b4a39de 100644
--- a/configs/orangepi_one_defconfig
+++ b/configs/orangepi_one_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=672
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_one_plus_defconfig b/configs/orangepi_one_plus_defconfig
index 9a2abfa1028..55a8b003fb5 100644
--- a/configs/orangepi_one_plus_defconfig
+++ b/configs/orangepi_one_plus_defconfig
@@ -7,6 +7,5 @@ CONFIG_SUNXI_DRAM_H6_LPDDR3=y
 CONFIG_MMC0_CD_PIN="PF6"
 # CONFIG_PSCI_RESET is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index 356ae7ce476..777af8c60ea 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -8,7 +8,6 @@ CONFIG_DRAM_ZQ=3881977
 CONFIG_MACPWR="PD6"
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
index 4d3fa7799c0..905ff7b1271 100644
--- a/configs/orangepi_pc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -5,7 +5,6 @@ CONFIG_SPL=y
 CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=624
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/orangepi_pc_plus_defconfig b/configs/orangepi_pc_plus_defconfig
index dcdec8d0883..f845138153d 100644
--- a/configs/orangepi_pc_plus_defconfig
+++ b/configs/orangepi_pc_plus_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN8I_H3=y
 CONFIG_DRAM_CLK=624
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/orangepi_plus2e_defconfig b/configs/orangepi_plus2e_defconfig
index e27b329b0a9..138a6a72b8c 100644
--- a/configs/orangepi_plus2e_defconfig
+++ b/configs/orangepi_plus2e_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_CLK=672
 CONFIG_MACPWR="PD6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/orangepi_plus_defconfig b/configs/orangepi_plus_defconfig
index 5c7f0731d90..76de72aa228 100644
--- a/configs/orangepi_plus_defconfig
+++ b/configs/orangepi_plus_defconfig
@@ -9,7 +9,6 @@ CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_USB1_VBUS_PIN="PG13"
 CONFIG_SATAPWR="PG11"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/orangepi_prime_defconfig b/configs/orangepi_prime_defconfig
index 80de7da021f..95a82e20f3e 100644
--- a/configs/orangepi_prime_defconfig
+++ b/configs/orangepi_prime_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_CLK=672
 CONFIG_DRAM_ZQ=3881977
 # CONFIG_DRAM_ODT_EN is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_r1_defconfig b/configs/orangepi_r1_defconfig
index d645168d7c4..4496aa4a45c 100644
--- a/configs/orangepi_r1_defconfig
+++ b/configs/orangepi_r1_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_CLK=624
 # CONFIG_VIDEO_DE2 is not set
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_CONSOLE_MUX=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/orangepi_win_defconfig b/configs/orangepi_win_defconfig
index 1e26970230f..3b78ad7e52d 100644
--- a/configs/orangepi_win_defconfig
+++ b/configs/orangepi_win_defconfig
@@ -7,7 +7,6 @@ CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_MACPWR="PD14"
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_PHY_REALTEK=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/orangepi_zero2_defconfig b/configs/orangepi_zero2_defconfig
index 877eccf31bd..ceef51b3db6 100644
--- a/configs/orangepi_zero2_defconfig
+++ b/configs/orangepi_zero2_defconfig
@@ -11,7 +11,6 @@ CONFIG_MMC0_CD_PIN="PF6"
 CONFIG_R_I2C_ENABLE=y
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index 5700c1bd006..f7f3bfbcc41 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_CLK=624
 # CONFIG_VIDEO_DE2 is not set
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_CONSOLE_MUX=y
 CONFIG_SPI_FLASH_MACRONIX=y
 CONFIG_SPI_FLASH_WINBOND=y
diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 6a02624cd05..9583d24c8d6 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -9,7 +9,6 @@ CONFIG_DRAM_ZQ=3881977
 CONFIG_MMC0_CD_PIN="PH13"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_zero_plus2_h3_defconfig b/configs/orangepi_zero_plus2_h3_defconfig
index d003612d50d..55a251374a1 100644
--- a/configs/orangepi_zero_plus2_h3_defconfig
+++ b/configs/orangepi_zero_plus2_h3_defconfig
@@ -8,7 +8,6 @@ CONFIG_DRAM_CLK=672
 CONFIG_MMC0_CD_PIN="PH13"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/orangepi_zero_plus_defconfig b/configs/orangepi_zero_plus_defconfig
index 16280994489..f3ecf35eee1 100644
--- a/configs/orangepi_zero_plus_defconfig
+++ b/configs/orangepi_zero_plus_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_CLK=624
 CONFIG_DRAM_ZQ=3881977
 # CONFIG_DRAM_ODT_EN is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/parrot_r16_defconfig b/configs/parrot_r16_defconfig
index b5c60da9f10..d56c4504b6a 100644
--- a/configs/parrot_r16_defconfig
+++ b/configs/parrot_r16_defconfig
@@ -11,7 +11,6 @@ CONFIG_USB0_ID_DET="PD10"
 CONFIG_USB1_VBUS_PIN="PD12"
 CONFIG_AXP_GPIO=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_CONS_INDEX=5
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/pine64-lts_defconfig b/configs/pine64-lts_defconfig
index d8f718809b0..7e7c2d79104 100644
--- a/configs/pine64-lts_defconfig
+++ b/configs/pine64-lts_defconfig
@@ -10,7 +10,6 @@ CONFIG_MMC0_CD_PIN=""
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/pine64_plus_defconfig b/configs/pine64_plus_defconfig
index 0fd24b5c5b3..f42f4e5923a 100644
--- a/configs/pine64_plus_defconfig
+++ b/configs/pine64_plus_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN50I=y
 CONFIG_RESERVE_ALLWINNER_BOOT0_HEADER=y
 CONFIG_PINE64_DT_SELECTION=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_OF_LIST="sun50i-a64-pine64 sun50i-a64-pine64-plus"
 CONFIG_PHY_REALTEK=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/pine_h64_defconfig b/configs/pine_h64_defconfig
index 578bd92f6a3..09a4275f0e7 100644
--- a/configs/pine_h64_defconfig
+++ b/configs/pine_h64_defconfig
@@ -11,7 +11,6 @@ CONFIG_USB3_VBUS_PIN="PL5"
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_PSCI_RESET is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/pinebook_defconfig b/configs/pinebook_defconfig
index 75999b2fdcc..26918dd3875 100644
--- a/configs/pinebook_defconfig
+++ b/configs/pinebook_defconfig
@@ -8,7 +8,6 @@ CONFIG_DRAM_CLK=552
 CONFIG_DRAM_ZQ=3881949
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_R_I2C_ENABLE=y
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_DM_REGULATOR_FIXED=y
diff --git a/configs/pinecube_defconfig b/configs/pinecube_defconfig
index 3386eda8862..28e347b4d95 100644
--- a/configs/pinecube_defconfig
+++ b/configs/pinecube_defconfig
@@ -8,7 +8,6 @@ CONFIG_DRAM_CLK=504
 CONFIG_DRAM_ODT_EN=y
 CONFIG_I2C0_ENABLE=y
 # CONFIG_HAS_ARMV7_SECURE_BASE is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/pinephone_defconfig b/configs/pinephone_defconfig
index 373c8c8d14c..9d39204a439 100644
--- a/configs/pinephone_defconfig
+++ b/configs/pinephone_defconfig
@@ -10,7 +10,6 @@ CONFIG_DRAM_ZQ=3881949
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_PINEPHONE_DT_SELECTION=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_OF_LIST="sun50i-a64-pinephone-1.1 sun50i-a64-pinephone-1.2"
 CONFIG_LED_STATUS=y
 CONFIG_LED_STATUS_GPIO=y
diff --git a/configs/pinetab_defconfig b/configs/pinetab_defconfig
index f5790108241..0cc24146b39 100644
--- a/configs/pinetab_defconfig
+++ b/configs/pinetab_defconfig
@@ -8,4 +8,3 @@ CONFIG_DRAM_CLK=552
 CONFIG_DRAM_ZQ=3881949
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
diff --git a/configs/polaroid_mid2407pxe03_defconfig b/configs/polaroid_mid2407pxe03_defconfig
index 9b7ee4c9c6f..17fffeb1e26 100644
--- a/configs/polaroid_mid2407pxe03_defconfig
+++ b/configs/polaroid_mid2407pxe03_defconfig
@@ -16,7 +16,6 @@ CONFIG_VIDEO_LCD_POWER="PH7"
 CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/polaroid_mid2809pxe04_defconfig b/configs/polaroid_mid2809pxe04_defconfig
index e4b2797304e..e542b711132 100644
--- a/configs/polaroid_mid2809pxe04_defconfig
+++ b/configs/polaroid_mid2809pxe04_defconfig
@@ -16,7 +16,6 @@ CONFIG_VIDEO_LCD_POWER="PH7"
 CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/pov_protab2_ips9_defconfig b/configs/pov_protab2_ips9_defconfig
index e2ebf2ba0b1..a62c9f8fa37 100644
--- a/configs/pov_protab2_ips9_defconfig
+++ b/configs/pov_protab2_ips9_defconfig
@@ -14,7 +14,6 @@ CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/q8_a13_tablet_defconfig b/configs/q8_a13_tablet_defconfig
index 2505822b668..f269b8a5889 100644
--- a/configs/q8_a13_tablet_defconfig
+++ b/configs/q8_a13_tablet_defconfig
@@ -15,7 +15,6 @@ CONFIG_VIDEO_LCD_POWER="AXP0-0"
 CONFIG_VIDEO_LCD_BL_EN="AXP0-1"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/q8_a23_tablet_800x480_defconfig b/configs/q8_a23_tablet_800x480_defconfig
index dfa220b7c7c..dda1a0c51f6 100644
--- a/configs/q8_a23_tablet_800x480_defconfig
+++ b/configs/q8_a23_tablet_800x480_defconfig
@@ -16,7 +16,6 @@ CONFIG_VIDEO_LCD_POWER="PH7"
 CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/q8_a33_tablet_1024x600_defconfig b/configs/q8_a33_tablet_1024x600_defconfig
index 79a0fc52e1a..7925677d30e 100644
--- a/configs/q8_a33_tablet_1024x600_defconfig
+++ b/configs/q8_a33_tablet_1024x600_defconfig
@@ -16,7 +16,6 @@ CONFIG_VIDEO_LCD_POWER="PH7"
 CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/q8_a33_tablet_800x480_defconfig b/configs/q8_a33_tablet_800x480_defconfig
index b2d37122fc5..f3335f9d233 100644
--- a/configs/q8_a33_tablet_800x480_defconfig
+++ b/configs/q8_a33_tablet_800x480_defconfig
@@ -16,7 +16,6 @@ CONFIG_VIDEO_LCD_POWER="PH7"
 CONFIG_VIDEO_LCD_BL_EN="PH6"
 CONFIG_VIDEO_LCD_BL_PWM="PH0"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_AXP_DLDO1_VOLT=3300
 CONFIG_CONS_INDEX=5
 CONFIG_USB_MUSB_HOST=y
diff --git a/configs/r7-tv-dongle_defconfig b/configs/r7-tv-dongle_defconfig
index 60d8d7d3739..8875a09b2c9 100644
--- a/configs/r7-tv-dongle_defconfig
+++ b/configs/r7-tv-dongle_defconfig
@@ -6,7 +6,6 @@ CONFIG_MACH_SUN5I=y
 CONFIG_DRAM_CLK=384
 CONFIG_USB1_VBUS_PIN="PG13"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/sopine_baseboard_defconfig b/configs/sopine_baseboard_defconfig
index 84890d8f5ac..fbbef7a9f9a 100644
--- a/configs/sopine_baseboard_defconfig
+++ b/configs/sopine_baseboard_defconfig
@@ -11,7 +11,6 @@ CONFIG_MMC0_CD_PIN=""
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_SPL_SPI_SUNXI=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SUPPORT_EMMC_BOOT=y
 CONFIG_SPI_FLASH_WINBOND=y
 CONFIG_SUN8I_EMAC=y
diff --git a/configs/sun8i_a23_evb_defconfig b/configs/sun8i_a23_evb_defconfig
index 148015813b2..a3b1d76d8bb 100644
--- a/configs/sun8i_a23_evb_defconfig
+++ b/configs/sun8i_a23_evb_defconfig
@@ -9,7 +9,6 @@ CONFIG_USB0_VBUS_PIN="axp_drivebus"
 CONFIG_USB0_VBUS_DET="axp_vbus_detect"
 CONFIG_USB1_VBUS_PIN="PH7"
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_CONS_INDEX=5
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
diff --git a/configs/sunxi_Gemei_G9_defconfig b/configs/sunxi_Gemei_G9_defconfig
index b67d1fb114d..3fee7c2e50c 100644
--- a/configs/sunxi_Gemei_G9_defconfig
+++ b/configs/sunxi_Gemei_G9_defconfig
@@ -11,7 +11,6 @@ CONFIG_VIDEO_LCD_BL_EN="PH7"
 CONFIG_VIDEO_LCD_BL_PWM="PB2"
 CONFIG_VIDEO_LCD_PANEL_LVDS=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SYS_I2C_MVTWSI=y
 CONFIG_SYS_I2C_SLAVE=0x7f
diff --git a/configs/tanix_tx6_defconfig b/configs/tanix_tx6_defconfig
index d8095d0d423..0390347415c 100644
--- a/configs/tanix_tx6_defconfig
+++ b/configs/tanix_tx6_defconfig
@@ -8,4 +8,3 @@ CONFIG_DRAM_CLK=648
 CONFIG_MMC0_CD_PIN="PF6"
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
diff --git a/configs/tbs_a711_defconfig b/configs/tbs_a711_defconfig
index 6c3d5d49cda..b3c2e69d6cd 100644
--- a/configs/tbs_a711_defconfig
+++ b/configs/tbs_a711_defconfig
@@ -13,7 +13,6 @@ CONFIG_USB0_VBUS_DET="AXP0-VBUS-DETECT"
 CONFIG_USB0_ID_DET="PH11"
 CONFIG_AXP_GPIO=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_AXP_DCDC5_VOLT=1200
 CONFIG_USB_EHCI_HCD=y
diff --git a/configs/teres_i_defconfig b/configs/teres_i_defconfig
index 64fa2a9761f..e7de85eb506 100644
--- a/configs/teres_i_defconfig
+++ b/configs/teres_i_defconfig
@@ -8,7 +8,6 @@ CONFIG_DRAM_ZQ=3881949
 CONFIG_MMC_SUNXI_SLOT_EXTRA=2
 CONFIG_USB1_VBUS_PIN="PL7"
 CONFIG_I2C0_ENABLE=y
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_PREBOOT="setenv usb_pgood_delay 2000; usb start"
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/x96_mate_defconfig b/configs/x96_mate_defconfig
index 41a1c47bd7d..4276f4f543b 100644
--- a/configs/x96_mate_defconfig
+++ b/configs/x96_mate_defconfig
@@ -7,7 +7,6 @@ CONFIG_MACH_SUN50I_H616=y
 CONFIG_MMC0_CD_PIN="PF6"
 CONFIG_R_I2C_ENABLE=y
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_SPL_I2C=y
 CONFIG_SPL_SYS_I2C_LEGACY=y
 CONFIG_SYS_I2C_MVTWSI=y
diff --git a/configs/zeropi_defconfig b/configs/zeropi_defconfig
index 8365da2c472..11f3715e6dc 100644
--- a/configs/zeropi_defconfig
+++ b/configs/zeropi_defconfig
@@ -7,7 +7,6 @@ CONFIG_DRAM_CLK=408
 CONFIG_MACPWR="PD6"
 # CONFIG_VIDEO_DE2 is not set
 # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
-CONFIG_SYS_MONITOR_LEN=786432
 CONFIG_CONSOLE_MUX=y
 CONFIG_SUN8I_EMAC=y
 CONFIG_USB_EHCI_HCD=y
-- 
2.35.5

