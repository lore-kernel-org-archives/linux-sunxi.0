Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B791622
	for <linux-sunxi@lists.linux.dev>; Sat, 17 Dec 2022 01:52:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E81631042;
	Fri, 16 Dec 2022 17:53:31 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0BFE3F5A1;
	Fri, 16 Dec 2022 17:52:49 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Samuel Holland <samuel@sholland.org>,
	Mark Kettenis <kettenis@openbsd.org>
Subject: Pull request: u-boot-sunxi/master for 2023.01
Date: Sat, 17 Dec 2022 01:51:14 +0000
Message-Id: <20221217015114.1264-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull some fixes for sunxi.
This cleans up each board's defconfig, and fixes the serial console on
some Olimex board. Also we lose another legacy config variable.
The rest are minor cleanups, that actually shouldn't change anything
in the build.

Passed the gitlab CI, plus briefly tested on Pine64-LTS, LicheePi Nano,
and BananaPi M1.

Thanks,
Andre
========================
The following changes since commit c917865c7fd14420d25388bb3c8c24cb03911caf:

  Merge https://source.denx.de/u-boot/custodians/u-boot-marvell (2022-12-12 09:00:58 -0500)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to 64531496f990c2a63211c72b953dfc084b4c2589:

  sunxi: board: annotate #endif lines (2022-12-14 22:31:33 +0000)

----------------------------------------------------------------
Andre Przywara (4):
      sunxi: define SYS_MONITOR_LEN in Kconfig, not _defconfig
      sunxi: remove unused CONFIG_MMC_SUNXI_SLOT
      sunxi: remove bogus mmc_pinmux_setup() prototype
      sunxi: board: annotate #endif lines

Mark Kettenis (1):
      sunxi: Fix serial console for A10s-OLinuXino-MICRO

Samuel Holland (1):
      pinctrl: sunxi: Add P2WI and RSB pinmuxes

 Kconfig                                        |  1 +
 arch/arm/mach-sunxi/board.c                    |  8 ++++----
 arch/arm/mach-sunxi/clock_sun6i.c              |  4 ++--
 board/sunxi/board.c                            | 24 ++++++++++++------------
 configs/A10-OLinuXino-Lime_defconfig           |  1 -
 configs/A10s-OLinuXino-M_defconfig             |  2 --
 configs/A13-OLinuXinoM_defconfig               |  1 -
 configs/A13-OLinuXino_defconfig                |  1 -
 configs/A20-OLinuXino-Lime2-eMMC_defconfig     |  1 -
 configs/A20-OLinuXino-Lime2_defconfig          |  1 -
 configs/A20-OLinuXino-Lime_defconfig           |  1 -
 configs/A20-OLinuXino_MICRO-eMMC_defconfig     |  1 -
 configs/A20-OLinuXino_MICRO_defconfig          |  1 -
 configs/A20-Olimex-SOM-EVB_defconfig           |  1 -
 configs/A20-Olimex-SOM204-EVB-eMMC_defconfig   |  1 -
 configs/A20-Olimex-SOM204-EVB_defconfig        |  1 -
 configs/A33-OLinuXino_defconfig                |  1 -
 configs/Ainol_AW1_defconfig                    |  1 -
 configs/Ampe_A76_defconfig                     |  1 -
 configs/Auxtek-T003_defconfig                  |  1 -
 configs/Auxtek-T004_defconfig                  |  1 -
 configs/Bananapi_M2_Ultra_defconfig            |  1 -
 configs/Bananapi_defconfig                     |  1 -
 configs/Bananapi_m2m_defconfig                 |  1 -
 configs/Bananapro_defconfig                    |  1 -
 configs/CHIP_defconfig                         |  1 -
 configs/CHIP_pro_defconfig                     |  1 -
 configs/CSQ_CS908_defconfig                    |  1 -
 configs/Chuwi_V7_CW0825_defconfig              |  1 -
 configs/Colombus_defconfig                     |  1 -
 configs/Cubieboard2_defconfig                  |  1 -
 configs/Cubieboard4_defconfig                  |  1 -
 configs/Cubieboard_defconfig                   |  1 -
 configs/Cubietruck_defconfig                   |  1 -
 configs/Cubietruck_plus_defconfig              |  1 -
 configs/Empire_electronix_d709_defconfig       |  1 -
 configs/Empire_electronix_m712_defconfig       |  1 -
 configs/Hummingbird_A31_defconfig              |  1 -
 configs/Hyundai_A7HD_defconfig                 |  1 -
 configs/Itead_Ibox_A20_defconfig               |  1 -
 configs/Lamobo_R1_defconfig                    |  1 -
 configs/LicheePi_Zero_defconfig                |  1 -
 configs/Linksprite_pcDuino3_Nano_defconfig     |  1 -
 configs/Linksprite_pcDuino3_defconfig          |  1 -
 configs/Linksprite_pcDuino_defconfig           |  1 -
 configs/MK808C_defconfig                       |  1 -
 configs/MSI_Primo73_defconfig                  |  1 -
 configs/MSI_Primo81_defconfig                  |  1 -
 configs/Marsboard_A10_defconfig                |  1 -
 configs/Mele_A1000G_quad_defconfig             |  1 -
 configs/Mele_A1000_defconfig                   |  1 -
 configs/Mele_I7_defconfig                      |  1 -
 configs/Mele_M3_defconfig                      |  1 -
 configs/Mele_M5_defconfig                      |  1 -
 configs/Mele_M9_defconfig                      |  1 -
 configs/Merrii_A80_Optimus_defconfig           |  1 -
 configs/Mini-X_defconfig                       |  1 -
 configs/Nintendo_NES_Classic_Edition_defconfig |  1 -
 configs/Orangepi_defconfig                     |  1 -
 configs/Orangepi_mini_defconfig                |  1 -
 configs/Sinlinx_SinA31s_defconfig              |  1 -
 configs/Sinlinx_SinA33_defconfig               |  1 -
 configs/Sinovoip_BPI_M2_defconfig              |  1 -
 configs/Sinovoip_BPI_M3_defconfig              |  1 -
 configs/Sunchip_CX-A99_defconfig               |  1 -
 configs/UTOO_P66_defconfig                     |  1 -
 configs/Wexler_TAB7200_defconfig               |  1 -
 configs/Wits_Pro_A20_DKT_defconfig             |  1 -
 configs/Wobo_i5_defconfig                      |  1 -
 configs/Yones_Toptech_BD1078_defconfig         |  1 -
 configs/Yones_Toptech_BS1078_V2_defconfig      |  1 -
 configs/a64-olinuxino-emmc_defconfig           |  1 -
 configs/a64-olinuxino_defconfig                |  1 -
 configs/amarula_a64_relic_defconfig            |  1 -
 configs/ba10_tv_box_defconfig                  |  1 -
 configs/bananapi_m1_plus_defconfig             |  1 -
 configs/bananapi_m2_berry_defconfig            |  1 -
 configs/bananapi_m2_plus_h3_defconfig          |  1 -
 configs/bananapi_m2_plus_h5_defconfig          |  1 -
 configs/bananapi_m2_zero_defconfig             |  1 -
 configs/bananapi_m64_defconfig                 |  1 -
 configs/beelink_gs1_defconfig                  |  1 -
 configs/beelink_x2_defconfig                   |  1 -
 configs/colorfly_e708_q1_defconfig             |  1 -
 configs/difrnce_dit4350_defconfig              |  1 -
 configs/dserve_dsrv9703c_defconfig             |  1 -
 configs/emlid_neutis_n5_devboard_defconfig     |  1 -
 configs/ga10h_v1_1_defconfig                   |  1 -
 configs/gt90h_v4_defconfig                     |  1 -
 configs/h8_homlet_v2_defconfig                 |  1 -
 configs/i12-tvbox_defconfig                    |  1 -
 configs/iNet_3F_defconfig                      |  1 -
 configs/iNet_3W_defconfig                      |  1 -
 configs/iNet_86VS_defconfig                    |  1 -
 configs/iNet_D978_rev2_defconfig               |  1 -
 configs/icnova-a20-swac_defconfig              |  1 -
 configs/inet1_defconfig                        |  1 -
 configs/inet86dz_defconfig                     |  1 -
 configs/inet97fv2_defconfig                    |  1 -
 configs/inet98v_rev2_defconfig                 |  1 -
 configs/inet9f_rev03_defconfig                 |  1 -
 configs/inet_q972_defconfig                    |  1 -
 configs/jesurun_q5_defconfig                   |  1 -
 configs/libretech_all_h3_cc_h2_plus_defconfig  |  1 -
 configs/libretech_all_h3_cc_h3_defconfig       |  1 -
 configs/libretech_all_h3_cc_h5_defconfig       |  1 -
 configs/libretech_all_h3_it_h5_defconfig       |  1 -
 configs/libretech_all_h5_cc_h5_defconfig       |  1 -
 configs/licheepi_nano_defconfig                |  1 -
 configs/mixtile_loftq_defconfig                |  1 -
 configs/mk802_a10s_defconfig                   |  1 -
 configs/mk802_defconfig                        |  1 -
 configs/mk802ii_defconfig                      |  1 -
 configs/nanopi_a64_defconfig                   |  1 -
 configs/nanopi_m1_defconfig                    |  1 -
 configs/nanopi_m1_plus_defconfig               |  1 -
 configs/nanopi_neo2_defconfig                  |  1 -
 configs/nanopi_neo_air_defconfig               |  1 -
 configs/nanopi_neo_defconfig                   |  1 -
 configs/nanopi_neo_plus2_defconfig             |  1 -
 configs/nanopi_r1s_h5_defconfig                |  1 -
 configs/oceanic_5205_5inmfd_defconfig          |  1 -
 configs/orangepi_2_defconfig                   |  1 -
 configs/orangepi_3_defconfig                   |  1 -
 configs/orangepi_lite2_defconfig               |  1 -
 configs/orangepi_lite_defconfig                |  1 -
 configs/orangepi_one_defconfig                 |  1 -
 configs/orangepi_one_plus_defconfig            |  1 -
 configs/orangepi_pc2_defconfig                 |  1 -
 configs/orangepi_pc_defconfig                  |  1 -
 configs/orangepi_pc_plus_defconfig             |  1 -
 configs/orangepi_plus2e_defconfig              |  1 -
 configs/orangepi_plus_defconfig                |  1 -
 configs/orangepi_prime_defconfig               |  1 -
 configs/orangepi_r1_defconfig                  |  1 -
 configs/orangepi_win_defconfig                 |  1 -
 configs/orangepi_zero2_defconfig               |  1 -
 configs/orangepi_zero_defconfig                |  1 -
 configs/orangepi_zero_plus2_defconfig          |  1 -
 configs/orangepi_zero_plus2_h3_defconfig       |  1 -
 configs/orangepi_zero_plus_defconfig           |  1 -
 configs/parrot_r16_defconfig                   |  1 -
 configs/pine64-lts_defconfig                   |  1 -
 configs/pine64_plus_defconfig                  |  1 -
 configs/pine_h64_defconfig                     |  1 -
 configs/pinebook_defconfig                     |  1 -
 configs/pinecube_defconfig                     |  1 -
 configs/pinephone_defconfig                    |  1 -
 configs/pinetab_defconfig                      |  1 -
 configs/polaroid_mid2407pxe03_defconfig        |  1 -
 configs/polaroid_mid2809pxe04_defconfig        |  1 -
 configs/pov_protab2_ips9_defconfig             |  1 -
 configs/q8_a13_tablet_defconfig                |  1 -
 configs/q8_a23_tablet_800x480_defconfig        |  1 -
 configs/q8_a33_tablet_1024x600_defconfig       |  1 -
 configs/q8_a33_tablet_800x480_defconfig        |  1 -
 configs/r7-tv-dongle_defconfig                 |  1 -
 configs/sopine_baseboard_defconfig             |  1 -
 configs/sun8i_a23_evb_defconfig                |  1 -
 configs/sunxi_Gemei_G9_defconfig               |  1 -
 configs/tanix_tx6_defconfig                    |  1 -
 configs/tbs_a711_defconfig                     |  1 -
 configs/teres_i_defconfig                      |  1 -
 configs/x96_mate_defconfig                     |  1 -
 configs/zeropi_defconfig                       |  1 -
 drivers/pinctrl/sunxi/pinctrl-sunxi.c          |  7 +++++++
 include/configs/sunxi-common.h                 |  3 ---
 scripts/config_whitelist.txt                   |  1 -
 168 files changed, 26 insertions(+), 184 deletions(-)
