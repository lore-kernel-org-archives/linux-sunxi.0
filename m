Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD69F4681
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Jul 2022 16:21:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64E7A15A1;
	Wed, 13 Jul 2022 09:21:54 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 170D23F792;
	Wed, 13 Jul 2022 09:21:52 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/3] sunxi: remove CONFIG_MMC?_CD_PIN
Date: Wed, 13 Jul 2022 17:21:42 +0100
Message-Id: <20220713162145.95744-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the dawn of time we had CONFIG_MMC?_CD_PIN defines for each
Allwinner board, which held the name for the respective MMC card
detect GPIO. These days we don't use that in U-Boot proper anymore
(and rely on DT for that, instead), so it's just for the SPL loading.
However the card detect is actually not needed there:
- We continue loading from the same boot media that the BootROM booted
  us from, so when we get to load from MMC, there is surely a card in
  the slot.
- The BROM already spoiled all efforts by unconditionally accessing the
  MMC bus, regardless of any card presence or not. We can't do more harm
  by doing the same.

This series removes the code checking the CD pin, and also the definition
from Kconfig and all defconfigs. On top there is a cleanup for the MMC
driver, which explains the reason for still also implementing the legacy
MMC interface.

Please have a look and test!

Thanks,
Andre

Andre Przywara (3):
  sunxi: mmc: ignore card detect in SPL
  sunxi: mmc: group non-DM specific functions
  sunxi: remove CONFIG_MMC?_CD_PIN

 arch/arm/mach-sunxi/Kconfig                  |  27 ----
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
 drivers/mmc/sunxi_mmc.c                      | 152 ++++++++-----------
 72 files changed, 62 insertions(+), 192 deletions(-)

-- 
2.25.1

