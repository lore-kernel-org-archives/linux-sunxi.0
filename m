Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70CB2FB4
	for <linux-sunxi@lists.linux.dev>; Thu, 27 May 2021 00:44:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 243B811D4;
	Wed, 26 May 2021 17:44:59 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BB3B3F719;
	Wed, 26 May 2021 17:44:57 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/3] sunxi: dts: Update H3/H5/H6 devicetree from Linux
Date: Thu, 27 May 2021 01:44:35 +0100
Message-Id: <20210527004438.19783-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

This syncs the SoC .dtsi and board .dts files from the Linux 5.12 release.
For the H3 and H5 this brings us the proper RGMII modes for the boards
with Gigabit Ethernet PHYs.
The rest are smaller updates, but bring us port 0 USB support on the
H6 boards in U-Boot.

I know it's a bit late in the game, but those changes look innocent
enough to make it into the v2021.07 release still. This way we have all
64-bit boards using Linux 5.12 DTs.

Cheers,
Andre

Andre Przywara (3):
  arm: dts: sunxi: h6: Update DT files
  arm: dts: sunxi: h5: Update DT files
  arm: dts: sunxi: h3: Update DT files

 .../dts/sun50i-h5-bananapi-m2-plus-v1.2.dts   |  1 +
 arch/arm/dts/sun50i-h5-cpu-opp.dtsi           | 79 +++++++++++++++
 .../arm/dts/sun50i-h5-libretech-all-h3-cc.dts |  1 +
 .../arm/dts/sun50i-h5-libretech-all-h5-cc.dts |  2 +-
 arch/arm/dts/sun50i-h5-nanopi-neo-plus2.dts   |  6 +-
 arch/arm/dts/sun50i-h5-nanopi-neo2.dts        |  4 +-
 arch/arm/dts/sun50i-h5-orangepi-pc2.dts       | 27 +++++-
 arch/arm/dts/sun50i-h5-orangepi-prime.dts     |  6 +-
 arch/arm/dts/sun50i-h5-orangepi-zero-plus.dts |  4 +-
 .../arm/dts/sun50i-h5-orangepi-zero-plus2.dts | 38 ++++++++
 arch/arm/dts/sun50i-h5.dtsi                   | 61 ++++++++++--
 arch/arm/dts/sun50i-h6-beelink-gs1.dts        |  6 +-
 arch/arm/dts/sun50i-h6-cpu-opp.dtsi           | 20 ++--
 arch/arm/dts/sun50i-h6-orangepi-3.dts         |  4 +-
 arch/arm/dts/sun50i-h6-orangepi.dtsi          |  4 +-
 arch/arm/dts/sun50i-h6-pine-h64.dts           |  7 +-
 arch/arm/dts/sun50i-h6.dtsi                   | 26 +++++
 .../dts/sun8i-h2-plus-bananapi-m2-zero.dts    | 96 ++++++++++++++++++-
 arch/arm/dts/sun8i-h3-beelink-x2.dts          |  4 +-
 arch/arm/dts/sun8i-h3-nanopi-duo2.dts         |  4 +-
 arch/arm/dts/sun8i-h3-nanopi-neo-air.dts      |  4 +-
 arch/arm/dts/sun8i-h3-nanopi.dtsi             |  4 +-
 arch/arm/dts/sun8i-h3-orangepi-pc-plus.dts    |  5 -
 arch/arm/dts/sun8i-h3-orangepi-plus2e.dts     |  2 +-
 arch/arm/dts/sun8i-h3-orangepi-zero-plus2.dts | 38 ++++++++
 arch/arm/dts/sun8i-h3.dtsi                    | 49 +++++++++-
 arch/arm/dts/sunxi-h3-h5.dtsi                 | 42 +++++++-
 27 files changed, 483 insertions(+), 61 deletions(-)
 create mode 100644 arch/arm/dts/sun50i-h5-cpu-opp.dtsi

-- 
2.17.5

