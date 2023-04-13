Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD5933CC
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Apr 2023 10:20:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 689F34B3;
	Thu, 13 Apr 2023 03:21:43 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED5103F6C4;
	Thu, 13 Apr 2023 03:20:57 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Pull request: u-boot-sunxi/master for v2023.07
Date: Thu, 13 Apr 2023 11:20:48 +0100
Message-Id: <20230413102048.1627141-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull the sunxi/master branch, containing the first part of the
2023.07 changes.

The biggest change is some refactoring of the H616 DRAM driver, which
allows better fine-tuning for each board, and is the base for pending
LPDDR3 and LPDDR4 support, needed by new boards.
The sun8i-emac Ethernet driver sees some refactoring that enables it for
the Allwinner D1 EMAC IP. The sunxi HDMI driver is now using more DT
properties. Also the early SPL code now supports some odd H616 SoC
variant.

There are some more patches pending, that require the final review
touches and some testing, I will send a separate PR for them later.

The gitlab CI completed successfully, and I boot tested a few boards with
different SoCs, via FEL and SD card, into Linux.

Thanks,
Andre

===========================
The following changes since commit 9e804638bfe2693a908abf066ff66c251572afa7:

  Merge tag 'for-v2023-07-rc1' of https://source.denx.de/u-boot/custodians/u-boot-i2c (2023-04-11 09:29:28 -0400)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to 5fc892e83f34a0b082ff46d3cc411d6813c1f726:

  sunxi: A64: drop boot0 header reservation (2023-04-12 00:17:22 +0100)

----------------------------------------------------------------
Andre Przywara (3):
      sunxi: boot0.h: allow RVBAR MMIO address customisation
      sunxi: arm64: boot0.h: runtime check for RVBAR address
      sunxi: A64: drop boot0 header reservation

Jernej Skrabec (10):
      sunxi: Fix write to H616 DRAM CR register
      sunxi: cosmetic: Fix H616 DRAM driver code style
      sunxi: parameterize H616 DRAM ODT values
      sunxi: Convert H616 DRAM options to single setting
      sunxi: Always configure ODT on H616 DRAM
      sunxi: Make bit delay function in H616 DRAM code void
      sunxi: Parameterize bit delay code in H616 DRAM driver
      sunxi: Parameterize "unknown feature" in H616 DRAM driver
      sunxi: Parameterize some of H616 DDR3 timings
      sunxi: Add TPR2 parameter for H616 DRAM driver

Samuel Holland (8):
      video: sunxi: dw-hdmi: Use DM for clock gates and resets
      video: sunxi: dw-hdmi: Use DM for HVCC regulator
      net: sun8i-emac: Add a structure for variant data
      net: sun8i-emac: Add a flag for RMII support
      net: sun8i-emac: Add a flag for the internal PHY switch
      net: sun8i-emac: Use common syscon setup for R40
      net: sun8i-emac: Remove the SoC variant ID
      ARM: dts: sun6i: mixtile-loftq: Add USB1 VBUS regulator

 arch/arm/dts/sun6i-a31-mixtile-loftq.dts           |  17 +
 arch/arm/include/asm/arch-sunxi/boot0.h            |  21 +-
 arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h |  17 +
 arch/arm/mach-sunxi/Kconfig                        |  99 ++--
 arch/arm/mach-sunxi/dram_sun50i_h616.c             | 508 ++++++++++++++-------
 arch/arm/mach-sunxi/dram_timings/h616_ddr3_1333.c  |  20 +-
 configs/a64-olinuxino-emmc_defconfig               |   1 -
 configs/a64-olinuxino_defconfig                    |   1 -
 configs/amarula_a64_relic_defconfig                |   1 -
 configs/bananapi_m64_defconfig                     |   1 -
 configs/nanopi_a64_defconfig                       |   1 -
 configs/oceanic_5205_5inmfd_defconfig              |   1 -
 configs/orangepi_win_defconfig                     |   1 -
 configs/orangepi_zero2_defconfig                   |   8 +-
 configs/pine64_plus_defconfig                      |   1 -
 configs/sopine_baseboard_defconfig                 |   1 -
 configs/x96_mate_defconfig                         |   7 +
 drivers/net/sun8i_emac.c                           |  96 ++--
 drivers/video/sunxi/sunxi_dw_hdmi.c                |  36 +-
 19 files changed, 564 insertions(+), 274 deletions(-)
