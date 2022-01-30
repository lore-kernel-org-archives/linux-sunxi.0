Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2CF29CA
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 22:11:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66972D6E;
	Sun, 30 Jan 2022 14:11:11 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8AA93F718;
	Sun, 30 Jan 2022 14:11:09 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Daniel Wagenknecht <dwagenk@mailbox.org>,
	Icenowy Zheng <icenowy@aosc.io>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Pull request: u-boot-sunxi/master for 2022.04
Date: Sun, 30 Jan 2022 22:10:56 +0000
Message-Id: <20220130221056.6659-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Hi Tom,

a bit delayed, the first batch of the sunxi pull request for this cycle.
This is mostly collecting some patches that were lying around for a while,
plus some recent fixes. Nothing too exciting at this point, but of course
they should be merged nevertheless.
There is the much bigger F1C100s SoC support coming up, which I hope to be
able to send in the next few days, along with the removal of sunxi's
lowlevel_init usage.

Compile tested for all 159 sunxi boards, plus briefly tested on BananaPi M1,
OrangePi Zero, Pine64 and Pine-H64.

Thanks,
Andre

========================
The following changes since commit 98a90b2730696c1ba773359b7944f6685ae13344:

  Merge branch '2022-01-28-assorted-fixes' (2022-01-29 13:42:58 -0500)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to 50d5c6428fc280c095b0edd1a612b3661b5db77d:

  mkimage: sunxi_egon: Allow overriding the padding size (2022-01-30 01:25:00 +0000)

----------------------------------------------------------------
Andre Przywara (2):
      sunxi: gpio: Fix up pointer arithmetic
      pmic: axp: define ALDO_IN startup bit

Chris Morgan (2):
      i2c: mvtwsi: Add compatible string for allwinner, sun4i-a10-i2c
      sunxi: Add option to prevent booting on power plug-in

Daniel Wagenknecht (1):
      sunxi: SPI: fix pinmuxing for Allwinner H6 SoCs

Giulio Benetti (1):
      sunxi: dram_sun4i/5i: use DRAM_MEMORY_TYPE_DDR3 instead of magic number 3

Icenowy Zheng (1):
      sunxi: call fdt_fixup_ethernet again to set macaddr for more aliases

Jernej Skrabec (2):
      sunxi: fix H616 DRAM ODT support
      sunxi: Fix H616 DRAM read calibration for dual rank

Samuel Holland (5):
      sunxi: gpio: Return void from setter functions
      sunxi: gpio: Add per-bank drive and pull setters
      gpio: sunxi: Implement .set_flags
      mmc: sunxi: Use DM_GPIO flags to set pull-up
      mkimage: sunxi_egon: Allow overriding the padding size

 arch/arm/include/asm/arch-sunxi/gpio.h |  6 ++--
 arch/arm/mach-sunxi/Kconfig            | 10 ++++++
 arch/arm/mach-sunxi/dram_sun50i_h616.c |  4 +--
 arch/arm/mach-sunxi/pinmux.c           | 32 +++++++++++-------
 board/sunxi/board.c                    | 17 ++++++++--
 board/sunxi/dram_sun4i_auto.c          |  2 +-
 board/sunxi/dram_sun5i_auto.c          |  2 +-
 drivers/gpio/sunxi_gpio.c              | 62 +++++++++++++++-------------------
 drivers/i2c/mvtwsi.c                   |  1 +
 drivers/mmc/sunxi_mmc.c                |  8 ++---
 drivers/spi/spi-sunxi.c                |  3 +-
 include/axp152.h                       |  2 ++
 include/axp209.h                       |  3 +-
 include/axp221.h                       |  3 +-
 include/axp305.h                       |  3 ++
 include/axp809.h                       |  3 +-
 include/axp818.h                       |  3 +-
 tools/sunxi_egon.c                     |  9 +++--
 18 files changed, 104 insertions(+), 69 deletions(-)
