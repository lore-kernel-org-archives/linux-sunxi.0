Received: from smtpbg.qq.com (smtpbg127.qq.com [109.244.180.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7A029D6
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 06:32:05 +0000 (UTC)
X-QQ-mid: bizesmtp46t1626935418tmisq8ou
Received: from localhost.localdomain (unknown [14.154.30.9])
	by esmtp6.qq.com (ESMTP) with 
	id ; Thu, 22 Jul 2021 14:30:17 +0800 (CST)
X-QQ-SSF: 01100000002000004000B00A0000000
X-QQ-FEAT: b7h7rI6D0oR6aMeHbDq1CIcDvKIryFWeKZVGwCnSS1TEorcoUpBKpgBJRqPGt
	xgUGSbD89Mto/Q6aF7DgbBHl522ZCCKGl2PK6j3yHRf291Sn1387zeK7X7A68f9X2yWnYlS
	t0srHkm0N3lVj9TF4g8w44VlZIxJoo/BuZVEXc1bVRC+7wB25Gksk2KUi791O1HbpsGHPB3
	twl/XGaGttF2oSbubjeNKl+gBBTXRXbSg/q7/8CnG/KZ9v2dtCn6UkC+d3mVozs20gibM/L
	V0j42g69ooG62ArhrP8W/fSPKU/zwU45R3ANUG6jjz4Y5dyupshcoR+lICt7QrmrDLaQ==
X-QQ-GoodBg: 0
From: Icenowy Zheng <icenowy@sipeed.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@sipeed.com>
Subject: [RFC PATCH 00/13] Add support for Allwinner R329
Date: Thu, 22 Jul 2021 14:30:02 +0800
Message-Id: <20210722063015.421923-1-icenowy@sipeed.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam1

This patchset adds Allwinner R329 support to U-Boot.

First, some code refactors happen for SoCs w/o SCP/MMC2.

Then the basical support for R329 come as several parts (memory map,
clocks, pinmux, DRAM, final Kconfig option).

Then, as the RFC part of this patchset, some device tree related
changes.

Finally it comes the defconfig file for a R329 board, Sipeed Maix IIA
Dock.

This patchset is RFC mainly because of the DT-related part, as no DT
binding is mainlined in Linux now (it's still WIP). All other patches
are ready for being reviewed and, if proper, merged.

Icenowy Zheng (13):
  sunxi: decide the inclusion of SCP by SCP_ADDR existence
  sunxi: only include alias for eMMC when mmc2 used
  mmc: sunxi: conditionally include MMC2 initialization code
  sunxi: add memory addresses for R329 SoC
  sunxi: add support for R329 clocks
  sunxi: add support for basical pinmux setup on R329
  sunxi: add support for R329 DRAM controller
  sunxi: add Kconfig option for R329
  sunxi: sync R329 CCU binding headers from internal WIP kernel tree
  clk: sunxi: add support for R329 in sunxi DM clock driver
  mmc: sunxi: add support for R329 MMC controller
  sunxi: sync R329 DTs from internal WIP kernel tree
  sunxi: add support for Sipeed Maix IIA Dock board

 arch/arm/cpu/armv8/fel_utils.S                |   2 +-
 arch/arm/dts/Makefile                         |   2 +
 arch/arm/dts/sun50i-r329-maix-iia-dock.dts    |  36 ++
 arch/arm/dts/sun50i-r329-maix-iia.dtsi        |  45 +++
 arch/arm/dts/sun50i-r329.dtsi                 | 225 +++++++++++
 arch/arm/dts/sunxi-u-boot.dtsi                |   8 +-
 arch/arm/include/asm/arch-sunxi/boot0.h       |   4 +-
 .../include/asm/arch-sunxi/clock_sun50i_h6.h  |  17 +
 arch/arm/include/asm/arch-sunxi/cpu.h         |   3 +
 .../include/asm/arch-sunxi/cpu_sun50i_r329.h  |  58 +++
 arch/arm/include/asm/arch-sunxi/dram.h        |   2 +
 .../include/asm/arch-sunxi/dram_sun50i_r329.h | 232 +++++++++++
 arch/arm/include/asm/arch-sunxi/gpio.h        |   3 +
 arch/arm/include/asm/arch-sunxi/prcm_sun50i.h |  33 ++
 arch/arm/mach-sunxi/Kconfig                   |  37 +-
 arch/arm/mach-sunxi/Makefile                  |   2 +
 arch/arm/mach-sunxi/board.c                   |   4 +
 arch/arm/mach-sunxi/clock_sun50i_h6.c         |  49 ++-
 arch/arm/mach-sunxi/cpu_info.c                |   2 +
 arch/arm/mach-sunxi/dram_sun50i_r329.c        | 377 ++++++++++++++++++
 arch/arm/mach-sunxi/dram_timings/Makefile     |   1 +
 arch/arm/mach-sunxi/dram_timings/ddr3_r329.c  |  89 +++++
 board/sunxi/MAINTAINERS                       |   5 +
 board/sunxi/board.c                           |  20 +
 common/spl/Kconfig                            |   1 +
 configs/sipeed_maix_iia_dock_defconfig        |   8 +
 drivers/clk/sunxi/Kconfig                     |   7 +
 drivers/clk/sunxi/Makefile                    |   1 +
 drivers/clk/sunxi/clk_r329.c                  |  94 +++++
 drivers/mmc/sunxi_mmc.c                       |   3 +
 include/configs/sunxi-common.h                |   3 +
 include/dt-bindings/clock/sun50i-r329-ccu.h   |  73 ++++
 include/dt-bindings/clock/sun50i-r329-r-ccu.h |  32 ++
 include/dt-bindings/reset/sun50i-r329-ccu.h   |  45 +++
 include/dt-bindings/reset/sun50i-r329-r-ccu.h |  23 ++
 35 files changed, 1535 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/dts/sun50i-r329-maix-iia-dock.dts
 create mode 100644 arch/arm/dts/sun50i-r329-maix-iia.dtsi
 create mode 100644 arch/arm/dts/sun50i-r329.dtsi
 create mode 100644 arch/arm/include/asm/arch-sunxi/cpu_sun50i_r329.h
 create mode 100644 arch/arm/include/asm/arch-sunxi/dram_sun50i_r329.h
 create mode 100644 arch/arm/mach-sunxi/dram_sun50i_r329.c
 create mode 100644 arch/arm/mach-sunxi/dram_timings/ddr3_r329.c
 create mode 100644 configs/sipeed_maix_iia_dock_defconfig
 create mode 100644 drivers/clk/sunxi/clk_r329.c
 create mode 100644 include/dt-bindings/clock/sun50i-r329-ccu.h
 create mode 100644 include/dt-bindings/clock/sun50i-r329-r-ccu.h
 create mode 100644 include/dt-bindings/reset/sun50i-r329-ccu.h
 create mode 100644 include/dt-bindings/reset/sun50i-r329-r-ccu.h

-- 
2.30.2

