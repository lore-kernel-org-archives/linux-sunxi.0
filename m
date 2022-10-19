Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668805C87
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Oct 2022 23:55:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 403231424;
	Wed, 19 Oct 2022 16:55:56 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8C4A3F7D8;
	Wed, 19 Oct 2022 16:55:48 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <uwu@icenowy.me>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Pull request: u-boot-sunxi/master for 2023.01
Date: Thu, 20 Oct 2022 00:54:27 +0100
Message-Id: <20221019235427.8253-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull the first bunch of the sunxi pull request for this cycle.
Beside some rather unexciting sync of the DTs from the kernel tree, and
some Kconfig cleanup, there are some improvements for the ARMv5 Allwinner
family, to support boards with the F1C200s (64MB DRAM) better. We will
get actual board support as soon as the DTs have passed the Linux review
process.
There is also support for the X96 Mate TV Box, featuring the H616 SoC and
a full 4GB of DRAM.
Also we found the secret to enable SPI booting on the H616 (pin PC5 must
be pulled to GND), so the SPI boot support patch is now good to go.

Passed the gitlab CI, plus briefly tested on Pine64-LTS, LicheePi Nano,
X96 Mate and OrangePi Zero.

Thanks,
Andre

========================
The following changes since commit e2ff1d0fa777b11ad6b26432cb7613ab433b15d6:

  Merge tag 'efi-2023-01-rc1-3' of https://source.denx.de/u-boot/custodians/u-boot-efi (2022-10-16 20:23:47 -0400)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to 843ed983a07ee5d8d4e4ac5baa39fc53f12b5f33:

  suniv: add UART1 support (2022-10-19 14:15:02 +0100)

----------------------------------------------------------------
Andre Przywara (11):
      sunxi: dts: arm64: update devicetree files
      sunxi: dts: arm: update devicetree files
      sunxi: Kconfig: use SoC-wide values for some symbols
      sunxi: defconfig: drop redundant definitions
      sunxi: SPL SPI: Add SPI boot support for the Allwinner H616 SoC
      sunxi: OrangePi Zero 2: Enable SPI booting
      sunxi: defconfig: Add X96 Mate TV box
      sunxi: Kconfig: introduce SUNXI_MINIMUM_DRAM_MB
      sunxi: fix 32MB load address layout
      suniv: move SKIP_LOWLEVEL_INIT_ONLY into Kconfig
      suniv: add UART1 support

Icenowy Zheng (2):
      sunxi: fix SUNIV build when enabling D-Cache
      configs: sunxi: licheepi_nano: enable D-Cache

 Kconfig                                         |   6 +-
 arch/arm/dts/Makefile                           |   3 +-
 arch/arm/dts/sun4i-a10-inet9f-rev03.dts         |  40 ++--
 arch/arm/dts/sun4i-a10-pcduino.dts              |   6 +-
 arch/arm/dts/sun50i-a64-amarula-relic.dts       |   2 +-
 arch/arm/dts/sun50i-a64-bananapi-m64.dts        |   4 +-
 arch/arm/dts/sun50i-a64-nanopi-a64.dts          |   2 +-
 arch/arm/dts/sun50i-a64-olinuxino.dts           |  30 +++
 arch/arm/dts/sun50i-a64-orangepi-win.dts        |   6 +-
 arch/arm/dts/sun50i-a64-pinebook.dts            |   4 +-
 arch/arm/dts/sun50i-a64-pinephone-1.0.dts       |   4 +
 arch/arm/dts/sun50i-a64-pinephone-1.1.dts       |   4 +
 arch/arm/dts/sun50i-a64-teres-i.dts             |   8 +
 arch/arm/dts/sun50i-a64.dtsi                    |  10 +-
 arch/arm/dts/sun50i-h5-nanopi-r1s-h5.dts        |   4 +-
 arch/arm/dts/sun50i-h5-orangepi-pc2.dts         |   4 +-
 arch/arm/dts/sun50i-h5-orangepi-prime.dts       |   4 +-
 arch/arm/dts/sun50i-h6-orangepi-3.dts           |   4 +-
 arch/arm/dts/sun50i-h6-orangepi-lite2.dts       |   4 +-
 arch/arm/dts/sun50i-h6-tanix.dtsi               |   2 +-
 arch/arm/dts/sun50i-h6.dtsi                     |  12 +-
 arch/arm/dts/sun50i-h616-orangepi-zero2.dts     |  55 ++---
 arch/arm/dts/sun50i-h616-x96-mate.dts           | 177 +++++++++++++++
 arch/arm/dts/sun50i-h616.dtsi                   | 286 ++++++------------------
 arch/arm/dts/sun5i-a13-licheepi-one.dts         |   6 +-
 arch/arm/dts/sun6i-a31.dtsi                     |  13 +-
 arch/arm/dts/sun7i-a20-pcduino3.dts             |   6 +-
 arch/arm/dts/sun8i-a23-a33.dtsi                 |   9 +-
 arch/arm/dts/sun8i-a23-ippo-q8h-v1.2.dts        |  74 +-----
 arch/arm/dts/sun8i-a23-ippo-q8h-v5.dts          |  74 +-----
 arch/arm/dts/sun8i-a33-et-q8-v1.6.dts           |  58 +----
 arch/arm/dts/sun8i-a33-ippo-q8h-v1.2.dts        |  58 +----
 arch/arm/dts/sun8i-h2-plus-bananapi-m2-zero.dts |   8 +-
 arch/arm/dts/sun8i-h2-plus-orangepi-zero.dts    |   2 +-
 arch/arm/dts/sun8i-h3-beelink-x2.dts            |   6 +-
 arch/arm/dts/sun8i-h3-mapleboard-mp130.dts      |   6 +-
 arch/arm/dts/sun8i-h3-nanopi-duo2.dts           |   8 +-
 arch/arm/dts/sun8i-h3-nanopi-neo-air.dts        |   2 +-
 arch/arm/dts/sun8i-h3-nanopi-r1.dts             |   4 +-
 arch/arm/dts/sun8i-h3-nanopi.dtsi               |   5 +-
 arch/arm/dts/sun8i-h3-orangepi-2.dts            |   6 +-
 arch/arm/dts/sun8i-h3-orangepi-lite.dts         |   4 +-
 arch/arm/dts/sun8i-h3-orangepi-one.dts          |   4 +-
 arch/arm/dts/sun8i-h3-orangepi-pc.dts           |   4 +-
 arch/arm/dts/sun8i-r16-bananapi-m2m.dts         |   4 +-
 arch/arm/dts/sun8i-r40-bananapi-m2-ultra.dts    |   5 +
 arch/arm/dts/sun8i-r40-cpu-opp.dtsi             |  52 +++++
 arch/arm/dts/sun8i-r40-feta40i.dtsi             |   5 +
 arch/arm/dts/sun8i-r40.dtsi                     |  44 +++-
 arch/arm/dts/sun8i-t3-cqa3t-bv3.dts             |   5 +
 arch/arm/dts/sun8i-v3s.dtsi                     |   6 +-
 arch/arm/dts/sun8i-v40-bananapi-m2-berry.dts    |   5 +
 arch/arm/dts/sun9i-a80.dtsi                     |   1 -
 arch/arm/dts/sunxi-bananapi-m2-plus.dtsi        |   8 +-
 arch/arm/dts/sunxi-h3-h5-emlid-neutis.dtsi      |   4 +-
 arch/arm/dts/sunxi-h3-h5.dtsi                   |  13 +-
 arch/arm/dts/sunxi-libretech-all-h3-cc.dtsi     |   4 +-
 arch/arm/mach-sunxi/Kconfig                     |  16 +-
 arch/arm/mach-sunxi/board.c                     |   6 +-
 arch/arm/mach-sunxi/spl_spi_sunxi.c             |  27 ++-
 board/sunxi/MAINTAINERS                         |   5 +
 boot/Kconfig                                    |   4 +-
 cmd/Kconfig                                     |   1 +
 common/spl/Kconfig                              |   6 +
 configs/A10-OLinuXino-Lime_defconfig            |   2 -
 configs/A10s-OLinuXino-M_defconfig              |   2 -
 configs/A13-OLinuXinoM_defconfig                |   2 -
 configs/A13-OLinuXino_defconfig                 |   2 -
 configs/A20-OLinuXino-Lime2-eMMC_defconfig      |   2 -
 configs/A20-OLinuXino-Lime2_defconfig           |   2 -
 configs/A20-OLinuXino-Lime_defconfig            |   2 -
 configs/A20-OLinuXino_MICRO-eMMC_defconfig      |   2 -
 configs/A20-OLinuXino_MICRO_defconfig           |   2 -
 configs/A20-Olimex-SOM-EVB_defconfig            |   2 -
 configs/A20-Olimex-SOM204-EVB-eMMC_defconfig    |   2 -
 configs/A20-Olimex-SOM204-EVB_defconfig         |   2 -
 configs/A33-OLinuXino_defconfig                 |   2 -
 configs/Ainol_AW1_defconfig                     |   2 -
 configs/Ampe_A76_defconfig                      |   2 -
 configs/Auxtek-T003_defconfig                   |   2 -
 configs/Auxtek-T004_defconfig                   |   2 -
 configs/Bananapi_M2_Ultra_defconfig             |   2 -
 configs/Bananapi_defconfig                      |   2 -
 configs/Bananapi_m2m_defconfig                  |   2 -
 configs/Bananapro_defconfig                     |   2 -
 configs/CHIP_defconfig                          |   2 -
 configs/CHIP_pro_defconfig                      |   2 -
 configs/CSQ_CS908_defconfig                     |   2 -
 configs/Chuwi_V7_CW0825_defconfig               |   2 -
 configs/Colombus_defconfig                      |   2 -
 configs/Cubieboard2_defconfig                   |   2 -
 configs/Cubieboard4_defconfig                   |   2 -
 configs/Cubieboard_defconfig                    |   2 -
 configs/Cubietruck_defconfig                    |   2 -
 configs/Cubietruck_plus_defconfig               |   2 -
 configs/Empire_electronix_d709_defconfig        |   2 -
 configs/Empire_electronix_m712_defconfig        |   2 -
 configs/Hummingbird_A31_defconfig               |   2 -
 configs/Hyundai_A7HD_defconfig                  |   2 -
 configs/Itead_Ibox_A20_defconfig                |   2 -
 configs/Lamobo_R1_defconfig                     |   2 -
 configs/LicheePi_Zero_defconfig                 |   2 -
 configs/Linksprite_pcDuino3_Nano_defconfig      |   2 -
 configs/Linksprite_pcDuino3_defconfig           |   2 -
 configs/Linksprite_pcDuino_defconfig            |   2 -
 configs/MK808C_defconfig                        |   2 -
 configs/MSI_Primo73_defconfig                   |   2 -
 configs/MSI_Primo81_defconfig                   |   2 -
 configs/Marsboard_A10_defconfig                 |   2 -
 configs/Mele_A1000G_quad_defconfig              |   2 -
 configs/Mele_A1000_defconfig                    |   2 -
 configs/Mele_I7_defconfig                       |   2 -
 configs/Mele_M3_defconfig                       |   2 -
 configs/Mele_M5_defconfig                       |   2 -
 configs/Mele_M9_defconfig                       |   2 -
 configs/Merrii_A80_Optimus_defconfig            |   2 -
 configs/Mini-X_defconfig                        |   2 -
 configs/Nintendo_NES_Classic_Edition_defconfig  |   2 -
 configs/Orangepi_defconfig                      |   2 -
 configs/Orangepi_mini_defconfig                 |   2 -
 configs/Sinlinx_SinA31s_defconfig               |   2 -
 configs/Sinlinx_SinA33_defconfig                |   2 -
 configs/Sinovoip_BPI_M2_defconfig               |   2 -
 configs/Sinovoip_BPI_M3_defconfig               |   2 -
 configs/Sunchip_CX-A99_defconfig                |   2 -
 configs/UTOO_P66_defconfig                      |   2 -
 configs/Wexler_TAB7200_defconfig                |   2 -
 configs/Wits_Pro_A20_DKT_defconfig              |   2 -
 configs/Wobo_i5_defconfig                       |   2 -
 configs/Yones_Toptech_BD1078_defconfig          |   2 -
 configs/Yones_Toptech_BS1078_V2_defconfig       |   2 -
 configs/a64-olinuxino-emmc_defconfig            |   3 -
 configs/a64-olinuxino_defconfig                 |   3 -
 configs/amarula_a64_relic_defconfig             |   3 -
 configs/ba10_tv_box_defconfig                   |   2 -
 configs/bananapi_m1_plus_defconfig              |   2 -
 configs/bananapi_m2_berry_defconfig             |   2 -
 configs/bananapi_m2_plus_h3_defconfig           |   2 -
 configs/bananapi_m2_plus_h5_defconfig           |   3 -
 configs/bananapi_m2_zero_defconfig              |   2 -
 configs/bananapi_m64_defconfig                  |   3 -
 configs/beelink_gs1_defconfig                   |   3 -
 configs/beelink_x2_defconfig                    |   2 -
 configs/colorfly_e708_q1_defconfig              |   2 -
 configs/difrnce_dit4350_defconfig               |   2 -
 configs/dserve_dsrv9703c_defconfig              |   2 -
 configs/emlid_neutis_n5_devboard_defconfig      |   3 -
 configs/ga10h_v1_1_defconfig                    |   2 -
 configs/gt90h_v4_defconfig                      |   2 -
 configs/h8_homlet_v2_defconfig                  |   2 -
 configs/i12-tvbox_defconfig                     |   2 -
 configs/iNet_3F_defconfig                       |   2 -
 configs/iNet_3W_defconfig                       |   2 -
 configs/iNet_86VS_defconfig                     |   2 -
 configs/iNet_D978_rev2_defconfig                |   2 -
 configs/icnova-a20-swac_defconfig               |   2 -
 configs/inet1_defconfig                         |   2 -
 configs/inet86dz_defconfig                      |   2 -
 configs/inet97fv2_defconfig                     |   2 -
 configs/inet98v_rev2_defconfig                  |   2 -
 configs/inet9f_rev03_defconfig                  |   2 -
 configs/inet_q972_defconfig                     |   2 -
 configs/jesurun_q5_defconfig                    |   2 -
 configs/libretech_all_h3_cc_h2_plus_defconfig   |   2 -
 configs/libretech_all_h3_cc_h3_defconfig        |   2 -
 configs/libretech_all_h3_cc_h5_defconfig        |   3 -
 configs/libretech_all_h3_it_h5_defconfig        |   3 -
 configs/libretech_all_h5_cc_h5_defconfig        |   3 -
 configs/licheepi_nano_defconfig                 |   5 -
 configs/mixtile_loftq_defconfig                 |   2 -
 configs/mk802_a10s_defconfig                    |   2 -
 configs/mk802_defconfig                         |   2 -
 configs/mk802ii_defconfig                       |   2 -
 configs/nanopi_a64_defconfig                    |   3 -
 configs/nanopi_m1_defconfig                     |   2 -
 configs/nanopi_m1_plus_defconfig                |   2 -
 configs/nanopi_neo2_defconfig                   |   3 -
 configs/nanopi_neo_air_defconfig                |   2 -
 configs/nanopi_neo_defconfig                    |   2 -
 configs/nanopi_neo_plus2_defconfig              |   3 -
 configs/nanopi_r1s_h5_defconfig                 |   3 -
 configs/oceanic_5205_5inmfd_defconfig           |   3 -
 configs/orangepi_2_defconfig                    |   2 -
 configs/orangepi_3_defconfig                    |   3 -
 configs/orangepi_lite2_defconfig                |   3 -
 configs/orangepi_lite_defconfig                 |   2 -
 configs/orangepi_one_defconfig                  |   2 -
 configs/orangepi_one_plus_defconfig             |   3 -
 configs/orangepi_pc2_defconfig                  |   3 -
 configs/orangepi_pc_defconfig                   |   2 -
 configs/orangepi_pc_plus_defconfig              |   2 -
 configs/orangepi_plus2e_defconfig               |   2 -
 configs/orangepi_plus_defconfig                 |   2 -
 configs/orangepi_prime_defconfig                |   3 -
 configs/orangepi_r1_defconfig                   |   2 -
 configs/orangepi_win_defconfig                  |   3 -
 configs/orangepi_zero2_defconfig                |   5 +-
 configs/orangepi_zero_defconfig                 |   2 -
 configs/orangepi_zero_plus2_defconfig           |   3 -
 configs/orangepi_zero_plus2_h3_defconfig        |   2 -
 configs/orangepi_zero_plus_defconfig            |   3 -
 configs/parrot_r16_defconfig                    |   2 -
 configs/pine64-lts_defconfig                    |   3 -
 configs/pine64_plus_defconfig                   |   3 -
 configs/pine_h64_defconfig                      |   3 -
 configs/pinebook_defconfig                      |   3 -
 configs/pinecube_defconfig                      |   2 -
 configs/pinephone_defconfig                     |   3 -
 configs/pinetab_defconfig                       |   3 -
 configs/polaroid_mid2407pxe03_defconfig         |   2 -
 configs/polaroid_mid2809pxe04_defconfig         |   2 -
 configs/pov_protab2_ips9_defconfig              |   2 -
 configs/q8_a13_tablet_defconfig                 |   2 -
 configs/q8_a23_tablet_800x480_defconfig         |   2 -
 configs/q8_a33_tablet_1024x600_defconfig        |   2 -
 configs/q8_a33_tablet_800x480_defconfig         |   2 -
 configs/r7-tv-dongle_defconfig                  |   2 -
 configs/sopine_baseboard_defconfig              |   3 -
 configs/sun8i_a23_evb_defconfig                 |   2 -
 configs/sunxi_Gemei_G9_defconfig                |   2 -
 configs/tanix_tx6_defconfig                     |   3 -
 configs/tbs_a711_defconfig                      |   2 -
 configs/teres_i_defconfig                       |   3 -
 configs/x96_mate_defconfig                      |  15 ++
 configs/zeropi_defconfig                        |   2 -
 drivers/pinctrl/sunxi/pinctrl-sunxi.c           |   1 +
 include/configs/sunxi-common.h                  |  49 ++--
 include/dt-bindings/clock/sun50i-h6-r-ccu.h     |   1 +
 include/dt-bindings/clock/sun50i-h616-ccu.h     |   1 +
 include/dt-bindings/clock/sun6i-rtc.h           |  10 +
 230 files changed, 657 insertions(+), 1037 deletions(-)
 create mode 100644 arch/arm/dts/sun50i-h616-x96-mate.dts
 mode change 100644 => 120000 arch/arm/dts/sun8i-a23-ippo-q8h-v1.2.dts
 mode change 100644 => 120000 arch/arm/dts/sun8i-a23-ippo-q8h-v5.dts
 mode change 100644 => 120000 arch/arm/dts/sun8i-a33-et-q8-v1.6.dts
 mode change 100644 => 120000 arch/arm/dts/sun8i-a33-ippo-q8h-v1.2.dts
 create mode 100644 arch/arm/dts/sun8i-r40-cpu-opp.dtsi
 create mode 100644 configs/x96_mate_defconfig
 create mode 100644 include/dt-bindings/clock/sun6i-rtc.h
