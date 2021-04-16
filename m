Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB086D3D
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Apr 2021 09:31:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7BF0106F;
	Fri, 16 Apr 2021 02:22:24 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F5513FA35;
	Fri, 16 Apr 2021 02:22:22 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Icenowy Zheng <icenowy@aosc.io>,
	Arnaud Ferraris <arnaud.ferraris@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev
Subject: [GIT PULL] sunxi: First changes for v2021.07 merge window
Date: Fri, 16 Apr 2021 10:22:00 +0100
Message-Id: <20210416092200.7752-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>


Hi Tom,

please pull this branch, containing the first part of the 2021.07 changes.

This adds support for devices with R40 dual rank DRAM, and asymmetric
A64 DRAM devices like the Pinephone/3GB.
Also we enable automatic gzipped kernel support, and allow scripted
DT overlay support. The rest of the patches are cleanups, but also
some sunxi-specific preparatory patches for USB3.0 and improved HDMI
support. The bulk of those changes will go through other trees, though.

Build-tested for all 156 sunxi boards, and boot tested on a A64, A20, R40,
H5, H6 and H616 board. USB, SD card, eMMC, HDMI and Ethernet all work
there (where applicable), with the exception of Ethernet on the H5. Since
this is already broken in v2021.04, I will send a separate fix.

Thanks,
Andre

==============

The following changes since commit 45b3cf88da24206a6cb847efe837fddc120af3e8:

  Merge https://gitlab.denx.de/u-boot/custodians/u-boot-fsl-qoriq (2021-04-15 13:11:19 -0400)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to 599177ed5139dbab112d0c9603e18382d0c642ba:

  sunxi: video: select dw-hdmi in Kconfig, not Makefile (2021-04-16 01:12:59 +0100)

----------------------------------------------------------------
Arnaud Ferraris (1):
      sunxi: arm64: Add addresses for compressed kernel load

Icenowy Zheng (2):
      sunxi: support asymmetric dual rank DRAM on A64/R40
      sunxi: enable dual rank memory on R40

Jernej Skrabec (2):
      sunxi: add fdtoverlay_addr_r environment variable
      sunxi: video: select dw-hdmi in Kconfig, not Makefile

Samuel Holland (4):
      clk: sunxi: Add a dummy clock driver for the RTC
      clk: sunxi: h6: Add XHCI clocks
      sunxi: binman: Respect the default FIT configuration
      sunxi: binman: Do not hardcode U-Boot load address

 arch/arm/dts/sunxi-u-boot.dtsi                  |   4 +-
 arch/arm/include/asm/arch-sunxi/dram_sunxi_dw.h |  11 +-
 arch/arm/mach-sunxi/Kconfig                     |   1 +
 arch/arm/mach-sunxi/dram_sunxi_dw.c             | 149 +++++++++++++++++++-----
 drivers/clk/sunxi/Makefile                      |   2 +
 drivers/clk/sunxi/clk_h6.c                      |   2 +
 drivers/clk/sunxi/clk_sun6i_rtc.c               |  35 ++++++
 drivers/video/sunxi/Makefile                    |   2 +-
 include/configs/sunxi-common.h                  |  64 ++++++----
 9 files changed, 215 insertions(+), 55 deletions(-)
 create mode 100644 drivers/clk/sunxi/clk_sun6i_rtc.c
