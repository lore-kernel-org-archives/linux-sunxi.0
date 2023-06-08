Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F4EA2A
	for <linux-sunxi@lists.linux.dev>; Thu,  8 Jun 2023 00:31:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1A9FAB6;
	Wed,  7 Jun 2023 17:31:56 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 599A13F71E;
	Wed,  7 Jun 2023 17:31:10 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Sam Edwards <CFSworks@gmail.com>
Subject: Pull request: u-boot-sunxi/master for 2023.07
Date: Thu,  8 Jun 2023 01:30:36 +0100
Message-Id: <20230608003036.12179-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

a small late pull request for Allwinner. The main feature is just a DT
update, matching the v6.4 Linux kernel DT files. This also enables a board
(LCTech Pi F1C200s) which got its .dts file merged into Linux. Plus a tiny
typo fix from Sam.

Gitlab CI passed, briefly tested on an H616 board and the new LCTech Pi.

Thanks,
Andre

========================
The following changes since commit 0a8a4b86422650d6955a2382796089735453902d:

  Merge tag 'u-boot-amlogic-20230607' of https://source.denx.de/u-boot/custodians/u-boot-amlogic (2023-06-07 12:17:06 -0400)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to 9bc6f1a4d08261032d60836ea1dd6f2e98889060:

  sunxi: Fix typo in include guard (2023-06-07 22:45:02 +0100)

----------------------------------------------------------------
Andre Przywara (2):
      sunxi: dts: arm/arm64: update devicetree files from Linux-v6.4-rc2
      sunxi: defconfig: Add Lctech Pi F1C200s board

Sam Edwards (1):
      sunxi: Fix typo in include guard

 arch/arm/dts/axp22x.dtsi                     |  6 +++
 arch/arm/dts/axp809.dtsi                     |  7 +++
 arch/arm/dts/axp81x.dtsi                     | 14 -----
 arch/arm/dts/sun50i-a64.dtsi                 |  1 +
 arch/arm/dts/sun50i-h5-orangepi-pc2.dts      |  1 +
 arch/arm/dts/sun5i-gr8-chip-pro.dts          |  2 +-
 arch/arm/dts/sun5i-r8-chip.dts               |  2 +-
 arch/arm/dts/sun6i-a31.dtsi                  | 12 ++---
 arch/arm/dts/sun6i-a31s-sina31s.dts          |  2 +-
 arch/arm/dts/sun8i-a23-a33.dtsi              | 10 ++--
 arch/arm/dts/sun8i-a33.dtsi                  |  1 +
 arch/arm/dts/sun8i-a83t-bananapi-m3.dts      | 15 ++++++
 arch/arm/dts/sun8i-h3-beelink-x2.dts         |  2 +-
 arch/arm/dts/sun8i-h3-nanopi-duo2.dts        |  2 +-
 arch/arm/dts/sun8i-v3s.dtsi                  |  6 +--
 arch/arm/dts/suniv-f1c100s-licheepi-nano.dts | 16 ++++++
 arch/arm/dts/suniv-f1c100s.dtsi              | 32 +++++++++++
 arch/arm/dts/suniv-f1c200s-lctech-pi.dts     | 76 ++++++++++++++++++++++++++
 arch/arm/dts/suniv-f1c200s-popstick-v1.1.dts | 81 ++++++++++++++++++++++++++++
 arch/arm/dts/sunxi-h3-h5.dtsi                |  8 +--
 arch/arm/include/asm/arch-sunxi/pmic_bus.h   |  2 +-
 configs/lctech_pi_f1c200s_defconfig          | 11 ++++
 22 files changed, 271 insertions(+), 38 deletions(-)
 create mode 100644 arch/arm/dts/suniv-f1c200s-lctech-pi.dts
 create mode 100644 arch/arm/dts/suniv-f1c200s-popstick-v1.1.dts
 create mode 100644 configs/lctech_pi_f1c200s_defconfig
