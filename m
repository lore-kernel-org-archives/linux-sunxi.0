Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52865EC3
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Jan 2023 02:01:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D95964B3;
	Tue, 24 Jan 2023 18:02:21 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFED33F64C;
	Tue, 24 Jan 2023 18:01:38 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Pull request: u-boot-sunxi/master for 2023.04
Date: Wed, 25 Jan 2023 01:59:40 +0000
Message-Id: <20230125015940.16995-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull the first part of the sunxi pull request for this cycle.
This contains some fixes, and the first bunch of some clean up patches
to get rid of legacy GPIO and PMIC code.
Highlight is the DM AXP PMIC driver, which is required to convert some
drivers over to use DM regulators, and also is required to get rid
of some less optimal PMIC setup code in Trusted Firmware. This isn't
enabled by any defconfig yet, but can be enabled manually and works. For
the full glory some patches are still missing, and this requires more
testing, which would be simpler if the core code is upstream.

I couldn't get the gitlab CI to pass, it seemed to time out in the last
step, when building all ARM(32) boards. I built all sunxi boards with
buildman locally, without issues, so this should be fine.
Tested on an H3, A64, R40, A20 and H6 board.

If everything goes well, I will send a second part later this week, some
patches still need some review and testing.

Thanks,
Andre

========================
The following changes since commit dd31cd58b02729807934cb699b164b1f8736620f:

  Merge tag 'efi-2023-04-rc1-2' of https://source.denx.de/u-boot/custodians/u-boot-efi (2023-01-20 14:23:20 -0500)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to cd108f2795777d3cca1d0f00c50bb92f766f6591:

  video: sunxi: dw-hdmi: Read address from DT node (2023-01-23 01:18:31 +0000)

----------------------------------------------------------------
Andre Przywara (9):
      sunxi: f1c100s: re-enable SYSRESET
      sunxi: f1c100s: Drop no-MMC hack
      sunxi: armv8: fel: load only 32-bit values
      sunxi: h616: lower SPL stack address to avoid BROM data
      sunxi: fel: drop redundant "control register" save/restore
      sunxi: mmc: ignore card detect in SPL
      sunxi: mmc: group non-DM specific functions
      sunxi: remove CONFIG_MMC?_CD_PIN
      sunxi: eMMC: support TOC0 on boot partitions

Jernej Skrabec (2):
      video: sunxi: dw-hdmi: Probe driver by compatible
      video: sunxi: dw-hdmi: Read address from DT node

Samuel Holland (4):
      power: pmic: axp: Provide a variant ID in the driver data
      power: regulator: Add a driver for AXP PMIC regulators
      power: pmic: axp: Bind regulators from the DT
      clk: sunxi: Add DE2 display-related clocks/resets

 arch/arm/cpu/armv7/sunxi/fel_utils.S         |   4 -
 arch/arm/cpu/armv8/fel_utils.S               |   8 +-
 arch/arm/dts/sunxi-u-boot.dtsi               |   2 -
 arch/arm/mach-sunxi/Kconfig                  |  27 ---
 arch/arm/mach-sunxi/board.c                  |  12 +-
 configs/A10-OLinuXino-Lime_defconfig         |   1 -
 configs/A10s-OLinuXino-M_defconfig           |   2 -
 configs/A13-OLinuXinoM_defconfig             |   1 -
 configs/A13-OLinuXino_defconfig              |   1 -
 configs/A20-OLinuXino-Lime2-eMMC_defconfig   |   1 -
 configs/A20-OLinuXino-Lime2_defconfig        |   1 -
 configs/A20-OLinuXino-Lime_defconfig         |   1 -
 configs/A20-OLinuXino_MICRO-eMMC_defconfig   |   1 -
 configs/A20-OLinuXino_MICRO_defconfig        |   2 -
 configs/A20-Olimex-SOM-EVB_defconfig         |   2 -
 configs/A20-Olimex-SOM204-EVB-eMMC_defconfig |   1 -
 configs/A20-Olimex-SOM204-EVB_defconfig      |   1 -
 configs/A33-OLinuXino_defconfig              |   1 -
 configs/Ainol_AW1_defconfig                  |   1 -
 configs/Ampe_A76_defconfig                   |   1 -
 configs/Bananapi_M2_Ultra_defconfig          |   1 -
 configs/Bananapi_m2m_defconfig               |   1 -
 configs/Cubieboard2_defconfig                |   1 -
 configs/Cubieboard4_defconfig                |   1 -
 configs/Cubieboard_defconfig                 |   1 -
 configs/Cubietruck_defconfig                 |   1 -
 configs/Empire_electronix_d709_defconfig     |   1 -
 configs/Empire_electronix_m712_defconfig     |   1 -
 configs/Itead_Ibox_A20_defconfig             |   1 -
 configs/Lamobo_R1_defconfig                  |   1 -
 configs/Mele_M3_defconfig                    |   1 -
 configs/Mele_M5_defconfig                    |   1 -
 configs/Merrii_A80_Optimus_defconfig         |   1 -
 configs/Orangepi_mini_defconfig              |   2 -
 configs/Sinlinx_SinA31s_defconfig            |   1 -
 configs/Sinlinx_SinA33_defconfig             |   1 -
 configs/Sunchip_CX-A99_defconfig             |   1 -
 configs/UTOO_P66_defconfig                   |   1 -
 configs/Wobo_i5_defconfig                    |   1 -
 configs/Yones_Toptech_BD1078_defconfig       |   2 -
 configs/Yones_Toptech_BS1078_V2_defconfig    |   1 -
 configs/bananapi_m2_berry_defconfig          |   1 -
 configs/bananapi_m2_zero_defconfig           |   1 -
 configs/bananapi_m64_defconfig               |   1 -
 configs/beelink_gs1_defconfig                |   1 -
 configs/colorfly_e708_q1_defconfig           |   1 -
 configs/difrnce_dit4350_defconfig            |   1 -
 configs/dserve_dsrv9703c_defconfig           |   1 -
 configs/gt90h_v4_defconfig                   |   1 -
 configs/iNet_3F_defconfig                    |   1 -
 configs/iNet_3W_defconfig                    |   1 -
 configs/iNet_D978_rev2_defconfig             |   1 -
 configs/icnova-a20-swac_defconfig            |   1 -
 configs/inet86dz_defconfig                   |   1 -
 configs/inet98v_rev2_defconfig               |   1 -
 configs/inet_q972_defconfig                  |   1 -
 configs/licheepi_nano_defconfig              |   1 -
 configs/nanopi_m1_plus_defconfig             |   1 -
 configs/oceanic_5205_5inmfd_defconfig        |   1 -
 configs/orangepi_3_defconfig                 |   1 -
 configs/orangepi_lite2_defconfig             |   1 -
 configs/orangepi_one_plus_defconfig          |   1 -
 configs/orangepi_zero2_defconfig             |   1 -
 configs/orangepi_zero_plus2_defconfig        |   1 -
 configs/orangepi_zero_plus2_h3_defconfig     |   1 -
 configs/parrot_r16_defconfig                 |   1 -
 configs/pine64-lts_defconfig                 |   1 -
 configs/pine_h64_defconfig                   |   1 -
 configs/polaroid_mid2407pxe03_defconfig      |   1 -
 configs/polaroid_mid2809pxe04_defconfig      |   1 -
 configs/q8_a13_tablet_defconfig              |   1 -
 configs/q8_a23_tablet_800x480_defconfig      |   1 -
 configs/q8_a33_tablet_1024x600_defconfig     |   1 -
 configs/q8_a33_tablet_800x480_defconfig      |   1 -
 configs/sopine_baseboard_defconfig           |   1 -
 configs/tanix_tx6_defconfig                  |   1 -
 configs/x96_mate_defconfig                   |   1 -
 drivers/clk/sunxi/clk_a64.c                  |  22 ++
 drivers/clk/sunxi/clk_a83t.c                 |  22 ++
 drivers/clk/sunxi/clk_h3.c                   |  17 ++
 drivers/clk/sunxi/clk_h6.c                   |  21 ++
 drivers/clk/sunxi/clk_h616.c                 |  21 ++
 drivers/clk/sunxi/clk_r40.c                  |  29 +++
 drivers/clk/sunxi/clk_v3s.c                  |   9 +
 drivers/mmc/sunxi_mmc.c                      | 152 ++++++-------
 drivers/power/pmic/axp.c                     |  36 +++-
 drivers/power/regulator/Kconfig              |  14 ++
 drivers/power/regulator/Makefile             |   1 +
 drivers/power/regulator/axp_regulator.c      | 312 +++++++++++++++++++++++++++
 drivers/video/sunxi/sunxi_dw_hdmi.c          |  57 +++--
 include/axp_pmic.h                           |  12 ++
 include/configs/sunxi-common.h               |   2 +-
 92 files changed, 617 insertions(+), 240 deletions(-)
 create mode 100644 drivers/power/regulator/axp_regulator.c
