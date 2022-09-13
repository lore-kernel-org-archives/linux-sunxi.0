Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5673A6AAC
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Sep 2022 23:41:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 095A61A32;
	Tue, 13 Sep 2022 16:41:46 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 086303F73B;
	Tue, 13 Sep 2022 16:41:37 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/2] sunxi: update devicetree files from the kernel
Date: Wed, 14 Sep 2022 00:40:02 +0100
Message-Id: <20220913234004.24850-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This syncs the .dts and .dtsi files from the Linux kernel repository
as of v6.0-rc4 into U-Boot. As before, we skip the r_intc change, as
this breaks older kernels.
The first patch handles the 64-bit parts, the second one the 32-bit
SoCs.

Thanks,
Andre

Andre Przywara (2):
  sunxi: dts: arm64: update devicetree files
  sunxi: dts: arm: update devicetree files

 arch/arm/dts/Makefile                         |   3 +-
 arch/arm/dts/sun4i-a10-inet9f-rev03.dts       |  40 +--
 arch/arm/dts/sun4i-a10-pcduino.dts            |   6 +-
 arch/arm/dts/sun50i-a64-amarula-relic.dts     |   2 +-
 arch/arm/dts/sun50i-a64-bananapi-m64.dts      |   4 +-
 arch/arm/dts/sun50i-a64-nanopi-a64.dts        |   2 +-
 arch/arm/dts/sun50i-a64-olinuxino.dts         |  30 ++
 arch/arm/dts/sun50i-a64-orangepi-win.dts      |   6 +-
 arch/arm/dts/sun50i-a64-pinebook.dts          |   4 +-
 arch/arm/dts/sun50i-a64-pinephone-1.0.dts     |   4 +
 arch/arm/dts/sun50i-a64-pinephone-1.1.dts     |   4 +
 arch/arm/dts/sun50i-a64-teres-i.dts           |   8 +
 arch/arm/dts/sun50i-a64.dtsi                  |  10 +-
 arch/arm/dts/sun50i-h5-nanopi-r1s-h5.dts      |   4 +-
 arch/arm/dts/sun50i-h5-orangepi-pc2.dts       |   4 +-
 arch/arm/dts/sun50i-h5-orangepi-prime.dts     |   4 +-
 arch/arm/dts/sun50i-h6-orangepi-3.dts         |   4 +-
 arch/arm/dts/sun50i-h6-orangepi-lite2.dts     |   4 +-
 arch/arm/dts/sun50i-h6-tanix.dtsi             |   2 +-
 arch/arm/dts/sun50i-h6.dtsi                   |  12 +-
 arch/arm/dts/sun50i-h616-orangepi-zero2.dts   |  55 +---
 arch/arm/dts/sun50i-h616-x96-mate.dts         | 177 +++++++++++
 arch/arm/dts/sun50i-h616.dtsi                 | 286 +++++-------------
 arch/arm/dts/sun5i-a13-licheepi-one.dts       |   6 +-
 arch/arm/dts/sun6i-a31.dtsi                   |  13 +-
 arch/arm/dts/sun7i-a20-pcduino3.dts           |   6 +-
 arch/arm/dts/sun8i-a23-a33.dtsi               |   9 +-
 arch/arm/dts/sun8i-a23-ippo-q8h-v1.2.dts      |  74 +----
 arch/arm/dts/sun8i-a23-ippo-q8h-v5.dts        |  74 +----
 arch/arm/dts/sun8i-a33-et-q8-v1.6.dts         |  58 +---
 arch/arm/dts/sun8i-a33-ippo-q8h-v1.2.dts      |  58 +---
 .../dts/sun8i-h2-plus-bananapi-m2-zero.dts    |   8 +-
 arch/arm/dts/sun8i-h2-plus-orangepi-zero.dts  |   2 +-
 arch/arm/dts/sun8i-h3-beelink-x2.dts          |   6 +-
 arch/arm/dts/sun8i-h3-mapleboard-mp130.dts    |   6 +-
 arch/arm/dts/sun8i-h3-nanopi-duo2.dts         |   8 +-
 arch/arm/dts/sun8i-h3-nanopi-neo-air.dts      |   2 +-
 arch/arm/dts/sun8i-h3-nanopi-r1.dts           |   4 +-
 arch/arm/dts/sun8i-h3-nanopi.dtsi             |   5 +-
 arch/arm/dts/sun8i-h3-orangepi-2.dts          |   6 +-
 arch/arm/dts/sun8i-h3-orangepi-lite.dts       |   4 +-
 arch/arm/dts/sun8i-h3-orangepi-one.dts        |   4 +-
 arch/arm/dts/sun8i-h3-orangepi-pc.dts         |   4 +-
 arch/arm/dts/sun8i-r16-bananapi-m2m.dts       |   4 +-
 arch/arm/dts/sun8i-r40-bananapi-m2-ultra.dts  |   5 +
 arch/arm/dts/sun8i-r40-cpu-opp.dtsi           |  52 ++++
 arch/arm/dts/sun8i-r40-feta40i.dtsi           |   5 +
 arch/arm/dts/sun8i-r40.dtsi                   |  44 ++-
 arch/arm/dts/sun8i-t3-cqa3t-bv3.dts           |   5 +
 arch/arm/dts/sun8i-v3s.dtsi                   |   6 +-
 arch/arm/dts/sun8i-v40-bananapi-m2-berry.dts  |   5 +
 arch/arm/dts/sun9i-a80.dtsi                   |   1 -
 arch/arm/dts/sunxi-bananapi-m2-plus.dtsi      |   8 +-
 arch/arm/dts/sunxi-h3-h5-emlid-neutis.dtsi    |   4 +-
 arch/arm/dts/sunxi-h3-h5.dtsi                 |  13 +-
 arch/arm/dts/sunxi-libretech-all-h3-cc.dtsi   |   4 +-
 include/dt-bindings/clock/sun50i-h6-r-ccu.h   |   1 +
 include/dt-bindings/clock/sun50i-h616-ccu.h   |   1 +
 include/dt-bindings/clock/sun6i-rtc.h         |  10 +
 59 files changed, 562 insertions(+), 638 deletions(-)
 create mode 100644 arch/arm/dts/sun50i-h616-x96-mate.dts
 mode change 100644 => 120000 arch/arm/dts/sun8i-a23-ippo-q8h-v1.2.dts
 mode change 100644 => 120000 arch/arm/dts/sun8i-a23-ippo-q8h-v5.dts
 mode change 100644 => 120000 arch/arm/dts/sun8i-a33-et-q8-v1.6.dts
 mode change 100644 => 120000 arch/arm/dts/sun8i-a33-ippo-q8h-v1.2.dts
 create mode 100644 arch/arm/dts/sun8i-r40-cpu-opp.dtsi
 create mode 100644 include/dt-bindings/clock/sun6i-rtc.h

-- 
2.35.3

