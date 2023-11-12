Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D0C1A58D
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Nov 2023 21:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A27CDA7;
	Sun, 12 Nov 2023 13:26:57 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 144EF3F641;
	Sun, 12 Nov 2023 13:26:10 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Ludwig Kormann <ludwig.kormann@ict42.de>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Pull request: u-boot-sunxi/master for 2024.01
Date: Sun, 12 Nov 2023 21:24:50 +0000
Message-Id: <20231112212450.882-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull some more sunxi changes for this cycle:

the first few patches are some easy refactorings and fixes, most of them
actually don't change the generated binaries at all. Then there is a
defconfig for a new board, for which we just gained the .dts file from
the last kernel DT sync.
On top there is support for a new PMIC (AXP313), and LPDDR4 support for
the Allwinner H616 SoC, both of which are needed to support new devices
that appeared lately, especially cheap TV boxes.

While those are technically new features, they don't affect existing boards,
for instance the LPDDR4 support code is guarded by a new DRAM type Kconfig
variable. So the risk for regressions is very slim.

Gitlab CI passed, and I booted that briefly on some boards, including an
H616 and an H618 one (with LPDDR4).

Thanks,
Andre

=========================================================
The following changes since commit da2e3196e4dc28298b58a018ace07f85eecd1652:

  Merge patch series "arm: dts: k3-am6: Fix Ethernet/DMA" (2023-11-10 15:25:47 -0500)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to 4b02f0120a4bb2a5d7081aef8cef6a4ca57e9db2:

  sunxi: H616: add LPDDR4 DRAM support (2023-11-12 18:04:32 +0000)

----------------------------------------------------------------
Andre Przywara (4):
      sunxi: board: simplify early PMIC setup conditions
      power: pmic: sunxi: add AXP313 SPL driver
      power: regulator: add AXP313 support
      sunxi: H616: DRAM: refactor mctl_phy_configure_odt()

Ludwig Kormann (1):
      arm: dts: icnova-a20-adb4006: Add board support

Mikhail Kalashnikov (1):
      sunxi: H616: add LPDDR4 DRAM support

Samuel Holland (5):
      net: sun8i_emac: Drop DM_GPIO checks
      sunxi: mmc: Move header to the driver directory
      clk: sunxi: Use the right symbol in the Makefile
      sunxi: mmc: Sort compatible strings numerically
      pinctrl: sunxi: Avoid using .bss for SPL

Tom Rini (1):
      arm: sunxi: Correct warning in board_fit_config_name_match

 arch/arm/dts/Makefile                              |   1 +
 arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h |   2 +
 arch/arm/include/asm/arch-sunxi/mmc.h              | 139 +---------
 arch/arm/mach-sunxi/Kconfig                        |  17 ++
 arch/arm/mach-sunxi/dram_sun50i_h616.c             | 294 +++++++++++++++------
 arch/arm/mach-sunxi/dram_timings/Makefile          |   1 +
 .../arm/mach-sunxi/dram_timings/h616_lpddr4_2133.c |  95 +++++++
 arch/arm/mach-sunxi/pmic_bus.c                     |   3 +
 board/sunxi/MAINTAINERS                            |   5 +
 board/sunxi/board.c                                |  38 ++-
 configs/icnova-a20-adb4006_defconfig               |  21 ++
 drivers/clk/Makefile                               |   2 +-
 drivers/mmc/sunxi_mmc.c                            |   6 +-
 drivers/mmc/sunxi_mmc.h                            | 138 ++++++++++
 drivers/net/sun8i_emac.c                           |  10 -
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |   2 +-
 drivers/power/Kconfig                              |  19 +-
 drivers/power/Makefile                             |   1 +
 drivers/power/axp313.c                             | 134 ++++++++++
 drivers/power/pmic/axp.c                           |   1 +
 drivers/power/regulator/axp_regulator.c            |  17 ++
 include/axp_pmic.h                                 |   1 +
 22 files changed, 688 insertions(+), 259 deletions(-)
 create mode 100644 arch/arm/mach-sunxi/dram_timings/h616_lpddr4_2133.c
 create mode 100644 configs/icnova-a20-adb4006_defconfig
 create mode 100644 drivers/mmc/sunxi_mmc.h
 create mode 100644 drivers/power/axp313.c
