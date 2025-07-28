Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA3428F1
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Jul 2025 00:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753664136; cv=none; b=hkrFMYOHHtgNDz3mEsAMNR/l4N3/kVpuW/IFZ1UgizQaBWQUUfAr+MYvq9ik8O00knagb8GBJa3bO7EfIblU17NJhpkMYddcb4S4i2/WWEu7PvRSOYFDB6KvCxctHQaqS4+fYVyADG3+nV9+Y+PsQnrOQhmblDU/VyGlupnLG2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753664136; c=relaxed/simple;
	bh=iCypCR8Tx+2dClTZKOBPQrodwbzhCfx6/gIZ2XylxUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PUS1fMzGiNXX+xLNAUcVqBmggrxt4fk92EpNSbcSsgQ/CfKhXNeXkDy7A+ducQwILheR4C3evIm1mYMUrgl/h7wYQV5gk+aVtutwlL5SUatORx2quA/92gDCtLwVGb57bHeM8Rlz6dWzJW4h7TUaX4aSaoHDWXxzvKKsb96XvJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C32691688;
	Sun, 27 Jul 2025 17:47:27 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6296F3F66E;
	Sun, 27 Jul 2025 17:47:34 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: [GIT PULL] u-boot-sunxi/master for v2025.10
Date: Mon, 28 Jul 2025 01:45:16 +0100
Message-ID: <20250728004516.19032-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull those sunxi changes into v2025.10: they add support for the
new Allwinner A523/A527/T527 SoC (all same die), alongside with defconfigs
for three boards using one of those SoCs. 
The patches are the usual combination of refactoring (of the SPL clock
code this time), tweaks to existing drivers to support peripherals in
their A523 versions, and new drivers for pincontrol and clocks. A big
chunk is of course the DRAM controller init routines, many thanks to
Jernej and Mikhail for providing this code, after a big reverse
engineering effort.
Since the DTs for the three supported boards have been merged into the
kernel repo recently, this is concluded by cherry-picks of those patches,
and the defconfig files to finally enable booting those boards.

The patches have been sitting around for a while, and folks are already
using them, so it's now time to get them into the tree.

Gitlab CI passed, and I booted that briefly on those three boards, plus
on some other SoCs to spot potential regressions.

Thanks,
Andre

===========================================================
The following changes since commit 4c3b5fcd810081bd7f3c51859fe1b5f0c159803c:

  Merge tag 'efi-2025-10-rc1' of https://source.denx.de/u-boot/custodians/u-boot-efi (2025-07-26 09:21:09 -0600)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to 0199794b30431fbf52ef2607c950de233e45b19e:

  sunxi: A523: add defconfigs for three boards (2025-07-27 23:12:20 +0100)

----------------------------------------------------------------
Andre Przywara (17):
      sunxi: clock: H6: unify PLL control bit definitions
      sunxi: clock: H6: factor out clock_set_pll()
      sunxi: clock: H6: factor out H6/H616 CPU clock setup
      sunxi: clock: H6: add A523 CPU PLL support
      sunxi: spl: add support for Allwinner A523 watchdog
      clk: sunxi: Add support for the A523 CCU
      clk: sunxi: Add support for the A523 -R CCU
      pinctrl: sunxi: add Allwinner A523 pinctrl description
      sunxi: mmc: add support for Allwinner A523 MMC mod clock
      power: regulator: add AXP323 support
      sunxi: update cpu_sunxi_ncat2.h
      sunxi: add basic A523 support
      arm64: dts: allwinner: Add Allwinner A523 .dtsi file
      arm64: dts: allwinner: a523: add X96Q-Pro+ support
      arm64: dts: allwinner: a523: add Radxa A5E support
      arm64: dts: allwinner: a523: add Avaota-A1 router support
      sunxi: A523: add defconfigs for three boards

Jernej Skrabec (2):
      sunxi: sun50i_h6: add A523 SPL clock setup code
      sunxi: A523: add DRAM initialisation routine

Mikhail Kalashnikov (1):
      sunxi: A523: add DDR3 DRAM support

 arch/arm/cpu/armv8/fel_utils.S                     |    5 +-
 arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h  |   49 +-
 arch/arm/include/asm/arch-sunxi/cpu_sunxi_ncat2.h  |   20 +
 arch/arm/include/asm/arch-sunxi/dram.h             |    2 +
 arch/arm/include/asm/arch-sunxi/dram_sun55i_a523.h |  153 ++
 arch/arm/include/asm/arch-sunxi/watchdog.h         |    2 +
 arch/arm/mach-sunxi/Kconfig                        |   54 +-
 arch/arm/mach-sunxi/Makefile                       |    2 +
 arch/arm/mach-sunxi/board.c                        |   11 +
 arch/arm/mach-sunxi/clock_sun50i_h6.c              |  153 +-
 arch/arm/mach-sunxi/cpu_info.c                     |    2 +
 arch/arm/mach-sunxi/dram_sun50i_a133.c             |   10 +-
 arch/arm/mach-sunxi/dram_sun50i_h6.c               |    6 +-
 arch/arm/mach-sunxi/dram_sun50i_h616.c             |    6 +-
 arch/arm/mach-sunxi/dram_sun55i_a523.c             | 1590 ++++++++++++++++++++
 arch/arm/mach-sunxi/dram_timings/Makefile          |    2 +
 arch/arm/mach-sunxi/dram_timings/a523_ddr3.c       |  113 ++
 arch/arm/mach-sunxi/dram_timings/a523_lpddr4.c     |  119 ++
 board/sunxi/MAINTAINERS                            |   15 +
 board/sunxi/board.c                                |    7 +-
 common/spl/Kconfig                                 |    4 +-
 configs/avaota-a1_defconfig                        |   31 +
 configs/radxa-cubie-a5e_defconfig                  |   32 +
 configs/x96q_pro_plus_defconfig                    |   32 +
 drivers/clk/sunxi/Kconfig                          |   14 +
 drivers/clk/sunxi/Makefile                         |    2 +
 drivers/clk/sunxi/clk_a523.c                       |   85 ++
 drivers/clk/sunxi/clk_a523_r.c                     |   39 +
 drivers/clk/sunxi/clk_sunxi.c                      |   10 +
 drivers/mmc/sunxi_mmc.c                            |   20 +-
 drivers/pinctrl/sunxi/Kconfig                      |   10 +
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |   50 +
 drivers/power/pmic/axp.c                           |    1 +
 drivers/power/regulator/axp_regulator.c            |    1 +
 dts/upstream/src/arm64/allwinner/sun55i-a523.dtsi  |  598 ++++++++
 .../src/arm64/allwinner/sun55i-a527-cubie-a5e.dts  |  299 ++++
 .../src/arm64/allwinner/sun55i-h728-x96qpro+.dts   |  287 ++++
 .../src/arm64/allwinner/sun55i-t527-avaota-a1.dts  |  308 ++++
 include/axp_pmic.h                                 |    1 +
 include/configs/sun55i.h                           |   11 +
 40 files changed, 4094 insertions(+), 62 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-sunxi/dram_sun55i_a523.h
 create mode 100644 arch/arm/mach-sunxi/dram_sun55i_a523.c
 create mode 100644 arch/arm/mach-sunxi/dram_timings/a523_ddr3.c
 create mode 100644 arch/arm/mach-sunxi/dram_timings/a523_lpddr4.c
 create mode 100644 configs/avaota-a1_defconfig
 create mode 100644 configs/radxa-cubie-a5e_defconfig
 create mode 100644 configs/x96q_pro_plus_defconfig
 create mode 100644 drivers/clk/sunxi/clk_a523.c
 create mode 100644 drivers/clk/sunxi/clk_a523_r.c
 create mode 100644 dts/upstream/src/arm64/allwinner/sun55i-a523.dtsi
 create mode 100644 dts/upstream/src/arm64/allwinner/sun55i-a527-cubie-a5e.dts
 create mode 100644 dts/upstream/src/arm64/allwinner/sun55i-h728-x96qpro+.dts
 create mode 100644 dts/upstream/src/arm64/allwinner/sun55i-t527-avaota-a1.dts
 create mode 100644 include/configs/sun55i.h
