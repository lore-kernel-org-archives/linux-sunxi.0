Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0FD19A1F
	for <linux-sunxi@lists.linux.dev>; Fri, 21 Jul 2023 13:49:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47A182F4;
	Fri, 21 Jul 2023 06:50:34 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF4F43F6C4;
	Fri, 21 Jul 2023 06:49:49 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Pull request: u-boot-sunxi/master for 2023.10
Date: Fri, 21 Jul 2023 14:48:57 +0100
Message-Id: <20230721134857.4676-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull the first part of the sunxi pull request for this cycle:

For once this adds USB support for two SoCs: the H616 and the F1C100s
series. The rest is support for LPDDR3 DRAM chips on H616 boards.

Gitlab CI passed, and I booted that briefly on an H616 and an F1C200s
board. I don't have an H616 board with LPDDR3 DRAM, but reportedly that
works for Mikhail, and doesn't regress on my DDR3 boards.

Thanks,
Andre

=========================================================
The following changes since commit 0274eb61e1f2a8e053fb028b6c668c67c0b75b9c:

  Merge tag 'efi-2023-10-rc1-2' of https://source.denx.de/u-boot/custodians/u-boot-efi (2023-07-20 10:19:04 -0400)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to ecb896cec75e98d6e5f9bcbf0a87976119443985:

  sunxi: H616: add LPDDR3 DRAM support (2023-07-21 00:54:19 +0100)

----------------------------------------------------------------
Andre Przywara (10):
      phy: sun4i-usb: Fix of_xlate() argument check
      phy: sun4i-usb: add Allwinner F1C100s support
      sunxi: Kconfig: rework PHY_USB_SUN4I selection
      phy: sun4i-usb: Replace types with explicit quirk flags
      phy: sun4i-usb: Add H616 USB PHY quirk support
      phy: sun4i: Add H616 USB PHY support
      sunxi: H616: enable USB support for H616 boards
      sunxi: dram: make MBUS configuration functions static
      sunxi: H616: dram: const-ify DRAM function parameters
      sunxi: H616: dram: split struct dram_para

Mikhail Kalashnikov (2):
      sunxi: H616: add DRAM type selection
      sunxi: H616: add LPDDR3 DRAM support

 arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h |  12 +-
 arch/arm/mach-sunxi/Kconfig                        |  29 +-
 arch/arm/mach-sunxi/dram_sun50i_h6.c               |   3 +-
 arch/arm/mach-sunxi/dram_sun50i_h616.c             | 383 +++++++++++++--------
 arch/arm/mach-sunxi/dram_sunxi_dw.c                |  18 +-
 arch/arm/mach-sunxi/dram_timings/Makefile          |   4 +-
 arch/arm/mach-sunxi/dram_timings/h616_ddr3_1333.c  |   2 +-
 arch/arm/mach-sunxi/dram_timings/h616_lpddr3.c     |  95 +++++
 configs/orangepi_zero2_defconfig                   |   4 +
 configs/x96_mate_defconfig                         |   3 +
 drivers/phy/allwinner/Kconfig                      |   5 +-
 drivers/phy/allwinner/phy-sun4i-usb.c              | 111 ++++--
 drivers/usb/musb-new/Kconfig                       |   1 +
 13 files changed, 461 insertions(+), 209 deletions(-)
 create mode 100644 arch/arm/mach-sunxi/dram_timings/h616_lpddr3.c
