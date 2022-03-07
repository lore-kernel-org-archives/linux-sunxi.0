Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E419728E0
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Mar 2022 14:34:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DB53ED1;
	Mon,  7 Mar 2022 06:34:28 -0800 (PST)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.196.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55C763F66F;
	Mon,  7 Mar 2022 06:34:26 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Mesih Kilinc <mesihkilinc@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	George Hilliard <thirtythreeforty@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 00/14] ARM: suniv: dts: update Allwinner F1C100
Date: Mon,  7 Mar 2022 14:34:07 +0000
Message-Id: <20220307143421.1106209-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner F1C100 SoC didn't see much love since its initial merge in
2018: the originally submitted .dts files were very basic, and didn't
cover such simple peripherals as MMC and SPI.
On top of that the watchdog compatible string was wrong, leading to a
non-functional watchdog and reset functionality.

This series aims to fix that, after the series MMC and SPI work, and
make dtbs_check comes back clean.
This was tested with mounting a filesystem on /dev/mmcblk0 on a
LicheePi Nano, also with accessing the SPI flash through /dev/mtdblock
and mtd_debug. Reboot and watchdog now also work.

Mainline U-Boot recently gained F1C100 support, and those DT updates are
needed there as well to get full MMC and SPI access.

The series is structured as follows:
- Patches 01/14 and 02/14 fix the watchdog, which allows to properly
  reboot the system.
- Patches 03-06 fix some shortcomings of the existing DT files, to make
  them DT binding compliant.
- Patches 07-09 are Jesse's recent MMC patches, with the comments from
  the last version addressed [1].
- Patches 10-12 add SPI support, to enable access to the SPI flash on
  the LicheePi Nano board.
- The final two patches (13/14 and 14/14) add the F1C100 platform to
  the multi_v5_defconfig, since it was not covered by any other
  defconfig before, and an ARMv5 compliant kernel is not commonly
  offered by distributions.

I saw George's series from two years ago to add USB support[2], that
looks good on the first glance, I will comment on that once I did some
testing on that.

Cheers,
Andre

Changelog for the MMC patches [1]:
- bindings doc: extend commit message
- .dtsi: extend commit message, re-order mmc0_pins node, add
  drive-strength
- .dts: extend commit message, add alias, regulator and disable-wp

[1] https://lore.kernel.org/linux-arm-kernel/20220130220325.1983918-1-Mr.Bossman075@gmail.com/
[2] https://lore.kernel.org/linux-usb/20200331170219.267732-1-thirtythreeforty@gmail.com/

Andre Przywara (10):
  dt-bindings: watchdog: sunxi: fix F1C100s compatible
  ARM: dts: suniv: F1C100: fix watchdog compatible
  dt-bindings: arm: sunxi: document LicheePi Nano name
  ARM: dts: suniv: F1C100: fix CPU node
  ARM: dts: suniv: F1C100: fix timer node
  dt-bindings: spi: sunxi: document F1C100 controllers
  ARM: dts: suniv: F1C100: add SPI support
  ARM: dts: suniv: licheepi-nano: add SPI flash
  ARM: configs: sync multi_v5_defconfig from savedefconfig
  ARM: configs: multi_v5: Enable Allwinner F1C100

Jesse Taube (4):
  ARM: dts: suniv: F1C100: add clock and reset macros
  dt-bindings: mmc: sunxi: add Allwinner F1c100s compatible
  ARM: dts: suniv: F1C100: add MMC controllers
  ARM: dts: suniv: licheepi-nano: add microSD card

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../bindings/mmc/allwinner,sun4i-a10-mmc.yaml |   3 +
 .../bindings/spi/allwinner,sun6i-a31-spi.yaml |   1 +
 .../watchdog/allwinner,sun4i-a10-wdt.yaml     |   2 +-
 .../boot/dts/suniv-f1c100s-licheepi-nano.dts  |  31 ++++++
 arch/arm/boot/dts/suniv-f1c100s.dtsi          | 102 ++++++++++++++++--
 arch/arm/configs/multi_v5_defconfig           |  25 ++---
 7 files changed, 140 insertions(+), 29 deletions(-)

-- 
2.25.1

