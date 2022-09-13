Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1A2671B
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Sep 2022 23:33:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51BCD1A32;
	Tue, 13 Sep 2022 16:33:48 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E61E3F73B;
	Tue, 13 Sep 2022 16:33:39 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>,
	Jagan Teki <jagan@amarulasolutions.com>
Cc: Simon Glass <sjg@chromium.org>,
	Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/2] sunxi: defconfig: use Kconfig defaults
Date: Wed, 14 Sep 2022 00:32:15 +0100
Message-Id: <20220913233217.24717-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some recent patches from Tom (thanks for that!) were converting some
configuration options from header files to Kconfig symbols.
For sunxi, this moved their value definition into every *board*
defconfig, although they are actual per-SoC choices.

Make this obvious by defining per-SoC default values in the Kconfig
stanza, and removing the now redundant explicit defconfig definitions.

Apart from using the opportunity to upgrading the uncompressed arm64
kernel size to 64MB, this does not change configs otherwise.

Patch 1 adds the default definitions, patch 2 removes the defconfig
definitions.

Thanks,
Andre

Andre Przywara (2):
  sunxi: Kconfig: use SoC-wide values for some symbols
  sunxi: defconfig: drop redundant definitions

 cmd/Kconfig                                    | 1 +
 common/spl/Kconfig                             | 6 ++++++
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
 162 files changed, 7 insertions(+), 354 deletions(-)

-- 
2.35.3

