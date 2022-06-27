Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA5317CB
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Jun 2022 00:47:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B2E6D6E;
	Sun, 26 Jun 2022 17:47:39 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FC4D3F5A1;
	Sun, 26 Jun 2022 17:47:37 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Samuel Holland <samuel@sholland.org>,
	qianfan Zhao <qianfanguijin@163.com>,
	linux-sunxi@lists.linux.dev,
	Chris Morgan <macroalpha82@gmail.com>,
	=?UTF-8?q?Milan=20P=20=2E=20Stani=C4=87?= <mps@arvanta.net>
Subject: Pull request: u-boot-sunxi/master fixes for v2022.07
Date: Mon, 27 Jun 2022 01:46:38 +0100
Message-Id: <20220627004638.517-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull the master branch from u-boot-sunxi, containing final sunxi
fixes for 2022.07. The main attraction are two regressions, plus a fix
for a long standing bug:
- Fix USB support on boards with a switched VBUS regulator.
- Fix failing boot due to env loading on boards without MMC (CHIP).
- Fix PSCI CPU_OFF operation on R40 boards.
The rest are smaller fixes, and the forgotten DT sync for sun4i boards.
The gitlab CI passed without problems.

Thanks,
Andre
===============

The following changes since commit 75967970850a932a2359e167fd9950b01e9b99d3:

  Merge tag 'video-20220625' of https://source.denx.de/u-boot/custodians/u-boot-video (2022-06-25 08:38:00 -0400)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to 47ca7b574faaa514677457e23a7197c47b0b597c:

  sunxi: psci: Fix sunxi_power_switch on sun8i-r40 platform (2022-06-26 11:22:54 +0100)

----------------------------------------------------------------
Andre Przywara (1):
      sunxi: usb: convert PHY GPIO functions to DM

Samuel Holland (4):
      ARM: dts: sun4i: Sync from Linux v5.18-rc1
      gpio: sunxi: Fix build with CONFIG_SPL_SERIAL=n
      clk: sunxi: Add additional RTC compatible strings
      sunxi: fix initial environment loading without MMC

qianfan Zhao (1):
      sunxi: psci: Fix sunxi_power_switch on sun8i-r40 platform

 arch/arm/cpu/armv7/sunxi/psci.c                 |   2 +-
 arch/arm/dts/Makefile                           |   3 +-
 arch/arm/dts/axp209.dtsi                        |   6 +-
 arch/arm/dts/sun4i-a10-a1000.dts                |  31 ++-
 arch/arm/dts/sun4i-a10-ba10-tvbox.dts           |   2 +-
 arch/arm/dts/sun4i-a10-chuwi-v7-cw0825.dts      |  20 +-
 arch/arm/dts/sun4i-a10-cubieboard.dts           |  16 +-
 arch/arm/dts/sun4i-a10-dserve-dsrv9703c.dts     |  21 +-
 arch/arm/dts/sun4i-a10-hackberry.dts            |   2 +-
 arch/arm/dts/sun4i-a10-hyundai-a7hd.dts         |  20 +-
 arch/arm/dts/sun4i-a10-inet1.dts                |  21 +-
 arch/arm/dts/sun4i-a10-inet9f-rev03.dts         |  74 +++-----
 arch/arm/dts/sun4i-a10-itead-iteaduino-plus.dts |   2 +-
 arch/arm/dts/sun4i-a10-jesurun-q5.dts           |   4 +-
 arch/arm/dts/sun4i-a10-marsboard.dts            |  22 +--
 arch/arm/dts/sun4i-a10-olinuxino-lime.dts       |  33 +---
 arch/arm/dts/sun4i-a10-pcduino.dts              |  20 +-
 arch/arm/dts/sun4i-a10-pov-protab2-ips9.dts     |  21 +-
 arch/arm/dts/sun4i-a10-topwise-a721.dts         | 242 ++++++++++++++++++++++++
 arch/arm/dts/sun4i-a10.dtsi                     | 135 +++++++++++--
 board/sunxi/board.c                             |  49 +++--
 drivers/clk/sunxi/clk_sun6i_rtc.c               |   2 +
 drivers/gpio/Kconfig                            |   1 +
 drivers/phy/allwinner/phy-sun4i-usb.c           |  59 +++---
 24 files changed, 525 insertions(+), 283 deletions(-)
 create mode 100644 arch/arm/dts/sun4i-a10-topwise-a721.dts
