Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A48B4378
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Mar 2022 16:24:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FE841424;
	Thu, 17 Mar 2022 09:24:04 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.196.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C86B3F7B4;
	Thu, 17 Mar 2022 09:24:02 -0700 (PDT)
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
Subject: [PATCH v2 00/12] ARM: suniv: dts: update Allwinner F1C100
Date: Thu, 17 Mar 2022 16:23:37 +0000
Message-Id: <20220317162349.739636-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

an update to the F1C100 DT update series. I dropped the defconfig
patches for now, there is more to them than it seems, and they warrant a
separate series and discussion. Also I dropped the MMC binding patch
(v1 07/14), since Ulf already applied that.
Other than that this tries to clarify the watchdog clock situation in a
new patch (02/12), and fixes some smaller issues, as pointed out by
Samuel (many thanks for that!).

----------

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
- Patches 01/12 and 03/12 fix the watchdog, which allows to properly
  reboot the system.
- Patches 04-07 fix some shortcomings of the existing DT files, to make
  them DT binding compliant.
- Patches 08-09 are Jesse's recent MMC patches, with the comments from
  the last version addressed [1].
- Patches 10-12 add SPI support, to enable access to the SPI flash on
  the LicheePi Nano board.

Cheers,
Andre

Changelog v1 ... v2:
- drop multi_v5_defconfig patches (v1 13/14 and 14/14)
- drop MMC bindings patch (v1 07/14): already applied
- dt-binding: move watchdog compatible string among the others
- dt-binding: new patch to clarify watchdog clock source
- dtsi: add missing @0 to cpu node
- add Acks and R-b's
- dtsi: fix ordering of SPI nodes (plus typo in commit message)

Changelog for the MMC patches [1]:
- bindings doc: extend commit message
- .dtsi: extend commit message, re-order mmc0_pins node, add
  drive-strength
- .dts: extend commit message, add alias, regulator and disable-wp

[1] https://lore.kernel.org/linux-arm-kernel/20220130220325.1983918-1-Mr.Bossman075@gmail.com/
[2] https://lore.kernel.org/linux-usb/20200331170219.267732-1-thirtythreeforty@gmail.com/

Andre Przywara (9):
  dt-bindings: watchdog: sunxi: fix F1C100s compatible
  dt-bindings: watchdog: sunxi: clarify clock support
  ARM: dts: suniv: F1C100: fix watchdog compatible
  dt-bindings: arm: sunxi: document LicheePi Nano name
  ARM: dts: suniv: F1C100: fix CPU node
  ARM: dts: suniv: F1C100: fix timer node
  dt-bindings: spi: sunxi: document F1C100 controllers
  ARM: dts: suniv: F1C100: add SPI support
  ARM: dts: suniv: licheepi-nano: add SPI flash

Jesse Taube (3):
  ARM: dts: suniv: F1C100: add clock and reset macros
  ARM: dts: suniv: F1C100: add MMC controllers
  ARM: dts: suniv: licheepi-nano: add microSD card

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../bindings/spi/allwinner,sun6i-a31-spi.yaml |   1 +
 .../watchdog/allwinner,sun4i-a10-wdt.yaml     |  24 ++--
 .../boot/dts/suniv-f1c100s-licheepi-nano.dts  |  31 ++++++
 arch/arm/boot/dts/suniv-f1c100s.dtsi          | 104 ++++++++++++++++--
 5 files changed, 140 insertions(+), 25 deletions(-)

-- 
2.25.1

