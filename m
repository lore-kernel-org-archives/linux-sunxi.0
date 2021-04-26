Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACCF72
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Apr 2021 10:51:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5518C1FB;
	Mon, 26 Apr 2021 03:51:31 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92BFC3F73B;
	Mon, 26 Apr 2021 03:51:29 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Icenowy Zheng <icenowy@aosc.io>,
	Ivan Uvarov <i.uvarov@cognitivepilot.com>,
	u-boot@lists.denx.de,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev
Subject: [GIT PULL] sunxi: Remaining v2021.07 merge window changes
Date: Mon, 26 Apr 2021 11:50:58 +0100
Message-Id: <20210426105058.6237-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>


Hi Tom,

please pull this branch, containing the late part of the 2021.07 changes.

This fixes the broken H5 Ethernet and updates the R40 and A64 DT files,
so nothing really critical.

Build-tested for all 156 sunxi boards, and boot tested on a A64, R40, H5
and H616 board. USB, SD card, eMMC, HDMI and Ethernet all work there
(where applicable).

Thanks,
Andre

=========================
The following changes since commit 4dda435131251a94b29afd52f010cf1ec5a7ceb2:

  Merge tag 'mips-pull-2021-04-24' of https://source.denx.de/u-boot/custodians/u-boot-mips (2021-04-24 19:39:14 -0400)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to 647b392bf20614006917d5fcd3390347a668eee5:

  sunxi: DT: A64: Update devicetree files from Linux 5.12 (2021-04-26 10:12:35 +0100)

----------------------------------------------------------------
Andre Przywara (2):
      net: sun8i-emac: Fix pinmux setup for Allwinner H5
      sunxi: DT: A64: Update devicetree files from Linux 5.12

Ivan Uvarov (1):
      sunxi: DT: R40: Update device tree files from Linux 5.12

 arch/arm/dts/sun50i-a64-bananapi-m64.dts           |  16 +-
 arch/arm/dts/sun50i-a64-nanopi-a64.dts             |   2 +-
 arch/arm/dts/sun50i-a64-orangepi-win.dts           |  10 +-
 arch/arm/dts/sun50i-a64-pine64-lts.dts             |  15 +
 arch/arm/dts/sun50i-a64-pine64-plus.dts            |   2 +-
 arch/arm/dts/sun50i-a64-pine64.dts                 |   8 +-
 arch/arm/dts/sun50i-a64-pinebook.dts               |  13 +-
 arch/arm/dts/sun50i-a64-pinephone-1.0.dts          |   7 +-
 arch/arm/dts/sun50i-a64-pinephone-1.1.dts          |   7 +-
 arch/arm/dts/sun50i-a64-pinephone-1.2.dts          |  16 +-
 arch/arm/dts/sun50i-a64-pinephone.dtsi             |  90 ++++-
 arch/arm/dts/sun50i-a64-pinetab-early-adopter.dts  |  26 ++
 arch/arm/dts/sun50i-a64-pinetab.dts                |  13 +-
 arch/arm/dts/sun50i-a64-sopine-baseboard.dts       |  11 +-
 arch/arm/dts/sun50i-a64-sopine.dtsi                |   3 +-
 arch/arm/dts/sun50i-a64-teres-i.dts                |  12 +-
 arch/arm/dts/sun50i-a64.dtsi                       |  40 ++-
 arch/arm/dts/sun8i-r40-bananapi-m2-ultra.dts       |  23 +-
 arch/arm/dts/sun8i-r40.dtsi                        | 375 +++++++++++++++++++--
 arch/arm/dts/sun8i-v40-bananapi-m2-berry.dts       |  12 +-
 drivers/net/sun8i_emac.c                           |   8 +-
 include/dt-bindings/clock/sun8i-r40-ccu.h          |   6 +-
 include/dt-bindings/interrupt-controller/arm-gic.h |   5 +-
 include/dt-bindings/thermal/thermal.h              |   3 +-
 24 files changed, 596 insertions(+), 127 deletions(-)
 create mode 100644 arch/arm/dts/sun50i-a64-pinetab-early-adopter.dts
