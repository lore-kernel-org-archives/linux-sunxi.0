Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C3A2C80
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Feb 2022 01:33:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54C6B147A;
	Thu,  3 Feb 2022 17:33:32 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 722523F73B;
	Thu,  3 Feb 2022 17:33:30 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Simon Glass <sjg@chromium.org>,
	Samuel Holland <samuel@sholland.org>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	George Hilliard <thirtythreeforty@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Pull request: u-boot-sunxi/master for 2022.04 (part 2)
Date: Fri,  4 Feb 2022 01:33:11 +0000
Message-Id: <20220204013311.3235-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Hi Tom,

this is the promised second part of the sunxi PR for 2022.04, albeit
technially outside of the merge window. We were working on this full
steam since the beginning of the year, and it deserves to be merged,
I think.
The main attraction is support for the F1C100s SoC, which sports a
venerable ARM926 core. Support for this SoC and the LicheePi Nano board
has been in Linux for years, and U-Boot patches were posted mid last
year already.
The new SoC using ARMv5 also means that the bulk of the new code should
not touch any existing boards, although we did some refactorings first,
of course, which actually cleans up some existing sunxi code.

Compile tested for all 160 sunxi boards, and briefly tested on BananaPi M1,
OrangePi Zero, Pine64 and Pine-H64. Tested by others on their boards,
including F1C100s and F1C200s devices.

Thanks,
Andre

======================================
The following changes since commit 006fddde01da7e8b3c7cad4a35f3245edc894ab4:

  Merge https://gitlab.denx.de/u-boot/custodians/u-boot-fsl-qoriq (2022-02-02 09:16:49 -0500)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to b6ffd58e45043b822844345d4ca9b2cb1e2917b7:

  configs: sunxi: Add support for Lichee Pi Nano (2022-02-04 00:09:57 +0000)

----------------------------------------------------------------
Andre Przywara (5):
      sunxi: move non-essential code out of s_init()
      sunxi: move Cortex SMPEN setting into start.S
      sunxi: move early "SRAM setup" into separate file
      armv8: remove no longer needed lowlevel_init.S
      sunxi-common.h: remove pointless #ifdefs

Icenowy Zheng (9):
      arm: arm926ej-s: start.S: port save_boot_params support from armv7 code
      arm: arm926ej-s: Add sunxi code
      ARM: sunxi: Add clock and uart to sunxi headers
      sunxi: Add F1C100s DRAM initial support
      sunxi: board: Add support for SUNIV
      configs: sunxi: Add common SUNIV header
      mach-sunxi: Add support for SUNIV architecture
      ARM: dts: suniv: Add device tree files and bindings for F1C100s
      configs: sunxi: Add support for Lichee Pi Nano

Jesse Taube (1):
      mach-sunxi: Move timer code to mach folder

 Kconfig                                          |   8 +-
 arch/arm/Kconfig                                 |   3 -
 arch/arm/cpu/arm926ejs/Makefile                  |   1 +
 arch/arm/cpu/arm926ejs/cpu.c                     |  13 +
 arch/arm/cpu/arm926ejs/start.S                   |  19 +
 arch/arm/cpu/arm926ejs/sunxi/Makefile            |   5 +
 arch/arm/cpu/arm926ejs/sunxi/config.mk           |   6 +
 arch/arm/cpu/arm926ejs/sunxi/fel_utils.S         |  33 ++
 arch/arm/cpu/arm926ejs/sunxi/u-boot-spl.lds      |  48 +++
 arch/arm/cpu/armv7/Kconfig                       |   5 +
 arch/arm/cpu/armv7/start.S                       |  11 +
 arch/arm/cpu/armv7/sunxi/Makefile                |   4 +-
 arch/arm/cpu/armv7/sunxi/sram.c                  |  40 +++
 arch/arm/cpu/armv8/Makefile                      |   1 -
 arch/arm/cpu/armv8/lowlevel_init.S               |  43 ---
 arch/arm/dts/Makefile                            |   2 +
 arch/arm/dts/suniv-f1c100s-licheepi-nano.dts     |  26 ++
 arch/arm/dts/suniv-f1c100s.dtsi                  | 144 ++++++++
 arch/arm/dts/sunxi-u-boot.dtsi                   |   2 +
 arch/arm/include/asm/arch-sunxi/clock.h          |   2 +-
 arch/arm/include/asm/arch-sunxi/clock_sun6i.h    |  13 +
 arch/arm/include/asm/arch-sunxi/cpu_sun4i.h      |   7 +
 arch/arm/include/asm/arch-sunxi/dram.h           |   2 +
 arch/arm/include/asm/arch-sunxi/dram_suniv.h     |  46 +++
 arch/arm/include/asm/arch-sunxi/gpio.h           |   1 +
 arch/arm/mach-sunxi/Kconfig                      |  18 +-
 arch/arm/mach-sunxi/Makefile                     |   5 +
 arch/arm/mach-sunxi/board.c                      | 109 +++---
 arch/arm/mach-sunxi/clock.c                      |   3 +-
 arch/arm/mach-sunxi/clock_sun6i.c                |  86 +++--
 arch/arm/mach-sunxi/cpu_info.c                   |   2 +
 arch/arm/mach-sunxi/dram_helpers.c               |   4 +
 arch/arm/mach-sunxi/dram_suniv.c                 | 420 +++++++++++++++++++++++
 arch/arm/{cpu/armv7/sunxi => mach-sunxi}/timer.c |   7 +-
 board/sunxi/board.c                              |   4 +-
 boot/Kconfig                                     |   7 +-
 configs/licheepi_nano_defconfig                  |  11 +
 include/configs/suniv.h                          |  14 +
 include/configs/sunxi-common.h                   |  64 ++--
 include/dt-bindings/clock/suniv-ccu-f1c100s.h    |  70 ++++
 include/dt-bindings/reset/suniv-ccu-f1c100s.h    |  38 ++
 41 files changed, 1174 insertions(+), 173 deletions(-)
 create mode 100644 arch/arm/cpu/arm926ejs/sunxi/Makefile
 create mode 100644 arch/arm/cpu/arm926ejs/sunxi/config.mk
 create mode 100644 arch/arm/cpu/arm926ejs/sunxi/fel_utils.S
 create mode 100644 arch/arm/cpu/arm926ejs/sunxi/u-boot-spl.lds
 create mode 100644 arch/arm/cpu/armv7/sunxi/sram.c
 delete mode 100644 arch/arm/cpu/armv8/lowlevel_init.S
 create mode 100644 arch/arm/dts/suniv-f1c100s-licheepi-nano.dts
 create mode 100644 arch/arm/dts/suniv-f1c100s.dtsi
 create mode 100644 arch/arm/include/asm/arch-sunxi/dram_suniv.h
 create mode 100644 arch/arm/mach-sunxi/dram_suniv.c
 rename arch/arm/{cpu/armv7/sunxi => mach-sunxi}/timer.c (97%)
 create mode 100644 configs/licheepi_nano_defconfig
 create mode 100644 include/configs/suniv.h
 create mode 100644 include/dt-bindings/clock/suniv-ccu-f1c100s.h
 create mode 100644 include/dt-bindings/reset/suniv-ccu-f1c100s.h
