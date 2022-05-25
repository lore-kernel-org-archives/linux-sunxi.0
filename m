Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B056B802
	for <linux-sunxi@lists.linux.dev>; Wed, 25 May 2022 00:30:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C03D31FB;
	Tue, 24 May 2022 17:30:44 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71E0B3F66F;
	Tue, 24 May 2022 17:30:43 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Pull request: u-boot-sunxi/master fixes for v2022.07
Date: Wed, 25 May 2022 01:30:21 +0100
Message-Id: <20220525003021.31871-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull the master branch from u-boot-sunxi, containing fixes and
updates for 2022.07.
The bulk of it is (finally!) some DT sync from the kernel. We refrained
from syncing one incompatible change, as this would spoil booting Linux
kernels before v5.13 with U-Boot's DT (via UEFI, for instance).
I test booted Linux v5.18 and v5.4 with that new DT on some boards, and
the headless peripherals (MMC, USB, Ethernet) seemed to work.
The rest are fixes:
- silencing missing clock warnings due to the new pinctrl driver
- fixing "UART0 on PortF", allowing UART access through the SD card pins
- add an F1C100s clock driver, to enable MMC support (SPI comes later)
- some cleanups for CONS_INDEX_n in Kconfig

Tested on BananaPi-M1, Pine64-LTS, Pine-H64, X96-Mate (H616) and
OrangePi-Zero.

Thanks,
Andre

===============
The following changes since commit 6f00b97d7e5760d92566317dde6c4b9224790827:

  Merge https://source.denx.de/u-boot/custodians/u-boot-usb (2022-05-20 22:07:56 -0400)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to 7495051219b64ec0e8fac8930586dc10666530da:

  serial: Remove obsolete CONS_INDEX_n Kconfig options (2022-05-24 01:46:06 +0100)

----------------------------------------------------------------
Andre Przywara (5):
      sunxi: F1C100s: update DT files from Linux
      Revert "sunxi: f1c100s: Drop SYSRESET to enable reset functionality"
      clk: sunxi: add PIO bus gate clocks
      clk: sunxi: add and use dummy gate clocks
      sunxi: board: Fix UART PortF pinmux setup

George Hilliard (1):
      clk: sunxi: implement clock driver for suniv f1c100s

Samuel Holland (17):
      dt-bindings: sunxi: Update clock/reset binding headers
      ARM: dts: sunxi: Remove unused devicetree headers
      ARM: dts: sun7i: Sync from Linux v5.18-rc1
      ARM: dts: sun4i: Sync from Linux v5.18-rc1
      ARM: dts: sunxi: A13/A31/A23/A33: Sync from Linux v5.18-rc1
      ARM: dts: sun9i: Sync from Linux v5.18-rc1
      ARM: dts: sun8i: A83T: Sync from Linux v5.18-rc1
      ARM: dts: sunxi: H2+/H3/H5: Sync from Linux v5.18-rc1
      ARM: dts: sun8i: V3/V3s/S3: Sync from Linux v5.18-rc1
      ARM: dts: sun8i: R40/T3: Sync from Linux v5.18-rc1
      ARM: dts: sun50i: A64: Sync from Linux v5.18-rc1
      ARM: dts: sun50i: H6: Sync from Linux v5.18-rc1
      sunxi: Skip MMC0 init when its pinmux conflicts with UART0
      mmc: sunxi: Remove unnecessary pinmux option dependency
      clk: sunxi: h6_r: Correct the driver name
      sunxi: Remove obsolete Kconfig selections
      serial: Remove obsolete CONS_INDEX_n Kconfig options

 arch/arm/dts/Makefile                              |  22 +-
 arch/arm/dts/axp22x.dtsi                           |  11 +-
 arch/arm/dts/axp803.dtsi                           |  10 +-
 arch/arm/dts/axp81x.dtsi                           |  15 +-
 arch/arm/dts/sun4i-a10-inet97fv2.dts               |  22 +-
 arch/arm/dts/sun50i-a64-cpu-opp.dtsi               |   2 +-
 arch/arm/dts/sun50i-a64-orangepi-win.dts           |   2 +-
 arch/arm/dts/sun50i-a64-pinebook.dts               |   1 +
 arch/arm/dts/sun50i-a64-pinephone.dtsi             |  27 ++
 arch/arm/dts/sun50i-a64-pinetab.dts                |  29 +-
 arch/arm/dts/sun50i-a64-teres-i.dts                |   4 +-
 arch/arm/dts/sun50i-a64.dtsi                       |  93 ++++--
 arch/arm/dts/sun50i-h5-cpu-opp.dtsi                |   2 +-
 arch/arm/dts/sun50i-h5-nanopi-r1s-h5.dts           |   9 +-
 arch/arm/dts/sun50i-h5.dtsi                        |   6 +-
 arch/arm/dts/sun50i-h6-beelink-gs1.dts             |  38 +--
 arch/arm/dts/sun50i-h6-cpu-opp.dtsi                |   2 +-
 arch/arm/dts/sun50i-h6-orangepi-3.dts              |  14 +-
 arch/arm/dts/sun50i-h6-orangepi.dtsi               |  22 +-
 arch/arm/dts/sun50i-h6-pine-h64-model-b.dts        |  51 ++++
 arch/arm/dts/sun50i-h6-tanix-tx6-mini.dts          |  15 +
 arch/arm/dts/sun50i-h6-tanix-tx6.dts               | 115 +------
 arch/arm/dts/sun50i-h6-tanix.dtsi                  | 189 ++++++++++++
 arch/arm/dts/sun50i-h6.dtsi                        |  26 +-
 arch/arm/dts/sun5i-a10s-auxtek-t003.dts            |  16 +-
 arch/arm/dts/sun5i-a10s-auxtek-t004.dts            |  35 +--
 arch/arm/dts/sun5i-a10s-mk802.dts                  |  31 +-
 arch/arm/dts/sun5i-a10s-olinuxino-micro.dts        |  68 +----
 arch/arm/dts/sun5i-a10s-r7-tv-dongle.dts           |  22 +-
 arch/arm/dts/sun5i-a10s-wobo-i5.dts                |  34 +--
 arch/arm/dts/sun5i-a10s.dtsi                       |  30 +-
 arch/arm/dts/sun5i-a13-ampe-a76.dts                |   2 +-
 arch/arm/dts/sun5i-a13-empire-electronix-d709.dts  |  41 +--
 arch/arm/dts/sun5i-a13-hsg-h702.dts                |  37 +--
 arch/arm/dts/sun5i-a13-inet-86vs.dts               |   2 +-
 ...i-q8-common.dtsi => sun5i-a13-licheepi-one.dts} | 146 +++++----
 arch/arm/dts/sun5i-a13-olinuxino-micro.dts         |  50 +---
 arch/arm/dts/sun5i-a13-olinuxino.dts               |  56 +---
 arch/arm/dts/sun5i-a13-pocketbook-touch-lux-3.dts  | 258 ++++++++++++++++
 arch/arm/dts/sun5i-a13-q8-tablet.dts               |  18 +-
 arch/arm/dts/sun5i-a13-utoo-p66.dts                |  26 +-
 arch/arm/dts/sun5i-a13.dtsi                        |  23 +-
 arch/arm/dts/sun5i-gr8-chip-pro.dts                |  38 +--
 arch/arm/dts/sun5i-gr8-evb.dts                     | 333 +++++++++++++++++++++
 arch/arm/dts/sun5i-gr8.dtsi                        |  12 +-
 arch/arm/dts/sun5i-r8-chip.dts                     |  52 +---
 arch/arm/dts/sun5i-reference-design-tablet.dtsi    |  57 +---
 arch/arm/dts/sun5i.dtsi                            | 209 ++++++++-----
 arch/arm/dts/sun6i-a31-app4-evb1.dts               |  10 +-
 arch/arm/dts/sun6i-a31-colombus.dts                |  57 +---
 arch/arm/dts/sun6i-a31-hummingbird.dts             |  75 ++---
 arch/arm/dts/sun6i-a31-i7.dts                      |  47 +--
 arch/arm/dts/sun6i-a31-m9.dts                      |  46 +--
 arch/arm/dts/sun6i-a31-mele-a1000g-quad.dts        |  46 +--
 arch/arm/dts/sun6i-a31-mixtile-loftq.dts           |   6 +-
 arch/arm/dts/sun6i-a31.dtsi                        | 218 ++++++++------
 arch/arm/dts/sun6i-a31s-colorfly-e708-q1.dts       |   2 +-
 arch/arm/dts/sun6i-a31s-cs908.dts                  |  17 +-
 arch/arm/dts/sun6i-a31s-inet-q972.dts              |   8 +-
 arch/arm/dts/sun6i-a31s-primo81.dts                |  32 +-
 arch/arm/dts/sun6i-a31s-sina31s-core.dtsi          |   4 +-
 arch/arm/dts/sun6i-a31s-sina31s.dts                |  39 +--
 arch/arm/dts/sun6i-a31s-sinovoip-bpi-m2.dts        | 144 +++++----
 .../arm/dts/sun6i-a31s-yones-toptech-bs1078-v2.dts |  22 +-
 arch/arm/dts/sun6i-reference-design-tablet.dtsi    |  22 +-
 arch/arm/dts/sun7i-a20-bananapi-m1-plus.dts        |  16 +-
 arch/arm/dts/sun7i-a20-bananapi.dts                |  41 ++-
 arch/arm/dts/sun7i-a20-bananapro.dts               |  16 +-
 arch/arm/dts/sun7i-a20-cubieboard2.dts             |  28 +-
 arch/arm/dts/sun7i-a20-cubietruck.dts              |  20 +-
 arch/arm/dts/sun7i-a20-haoyu-marsboard.dts         | 182 +++++++++++
 arch/arm/dts/sun7i-a20-hummingbird.dts             |  21 +-
 arch/arm/dts/sun7i-a20-i12-tvbox.dts               |  16 +-
 arch/arm/dts/sun7i-a20-icnova-swac.dts             |  15 +-
 arch/arm/dts/sun7i-a20-itead-ibox.dts              |   8 +-
 arch/arm/dts/sun7i-a20-lamobo-r1.dts               |  16 +-
 arch/arm/dts/sun7i-a20-linutronix-testbox-v2.dts   |  47 +++
 arch/arm/dts/sun7i-a20-m3.dts                      |  14 +-
 arch/arm/dts/sun7i-a20-m5.dts                      |   2 +
 arch/arm/dts/sun7i-a20-olimex-som-evb.dts          |  14 +-
 arch/arm/dts/sun7i-a20-olimex-som204-evb.dts       |  30 +-
 arch/arm/dts/sun7i-a20-olinuxino-lime-emmc.dts     |  32 ++
 arch/arm/dts/sun7i-a20-olinuxino-lime.dts          |  32 +-
 arch/arm/dts/sun7i-a20-olinuxino-lime2.dts         |  46 +--
 arch/arm/dts/sun7i-a20-olinuxino-micro.dts         |  32 +-
 arch/arm/dts/sun7i-a20-orangepi-mini.dts           |  28 +-
 arch/arm/dts/sun7i-a20-orangepi.dts                |  26 +-
 arch/arm/dts/sun7i-a20-pcduino3-nano.dts           |  32 +-
 arch/arm/dts/sun7i-a20-pcduino3.dts                |  28 +-
 arch/arm/dts/sun7i-a20-wexler-tab7200.dts          |  13 +-
 arch/arm/dts/sun7i-a20-wits-pro-a20-dkt.dts        |  24 +-
 arch/arm/dts/sun7i-a20.dtsi                        | 254 ++++++++++++++--
 arch/arm/dts/sun8i-a23-a33.dtsi                    | 308 +++++++++++++++----
 arch/arm/dts/sun8i-a23-evb.dts                     |  20 +-
 arch/arm/dts/sun8i-a23-gt90h-v4.dts                |   2 +-
 ...-q8-common.dtsi => sun8i-a23-ippo-q8h-v1.2.dts} |  54 ++--
 arch/arm/dts/sun8i-a23-ippo-q8h-v5.dts             |  73 +++++
 arch/arm/dts/sun8i-a23-polaroid-mid2407pxe03.dts   |  15 +-
 arch/arm/dts/sun8i-a23-polaroid-mid2809pxe04.dts   |  15 +-
 arch/arm/dts/sun8i-a23-q8-tablet.dts               |  10 +
 arch/arm/dts/sun8i-a23.dtsi                        |  26 +-
 ...lassic-edition.dts => sun8i-a33-et-q8-v1.6.dts} |  32 +-
 arch/arm/dts/sun8i-a33-ga10h-v1.1.dts              |   4 +-
 arch/arm/dts/sun8i-a33-inet-d978-rev2.dts          |  14 +-
 arch/arm/dts/sun8i-a33-ippo-q8h-v1.2.dts           |  57 ++++
 arch/arm/dts/sun8i-a33-olinuxino.dts               |  12 +-
 arch/arm/dts/sun8i-a33-q8-tablet.dts               |   7 +
 arch/arm/dts/sun8i-a33-sinlinx-sina33.dts          |  34 +--
 arch/arm/dts/sun8i-a33.dtsi                        | 270 ++++++-----------
 arch/arm/dts/sun8i-a83t-allwinner-h8homlet-v2.dts  |  12 +
 arch/arm/dts/sun8i-a83t-bananapi-m3.dts            |  55 +++-
 arch/arm/dts/sun8i-a83t-cubietruck-plus.dts        |  77 ++++-
 arch/arm/dts/sun8i-a83t-tbs-a711.dts               | 101 ++++++-
 arch/arm/dts/sun8i-a83t.dtsi                       | 311 ++++++++++++++++---
 arch/arm/dts/sun8i-h2-plus-bananapi-m2-zero.dts    |  28 +-
 arch/arm/dts/sun8i-h3-beelink-x2.dts               |  27 +-
 arch/arm/dts/sun8i-h3-nanopi-neo-air.dts           |  28 ++
 arch/arm/dts/sun8i-h3-nanopi-r1.dts                | 169 +++++++++++
 arch/arm/dts/sun8i-h3-nanopi.dtsi                  |   1 +
 arch/arm/dts/sun8i-h3-orangepi-2.dts               |   3 +-
 arch/arm/dts/sun8i-h3-orangepi-pc.dts              |   3 +-
 arch/arm/dts/sun8i-h3.dtsi                         |  10 +-
 arch/arm/dts/sun8i-q8-common.dtsi                  |  31 +-
 arch/arm/dts/sun8i-r16-bananapi-m2m.dts            |  55 ++--
 arch/arm/dts/sun8i-r16-nintendo-nes-classic.dts    |  54 ++++
 .../dts/sun8i-r16-nintendo-super-nes-classic.dts   |  11 +
 arch/arm/dts/sun8i-r16-parrot.dts                  |  62 +---
 arch/arm/dts/sun8i-r40-feta40i.dtsi                | 106 +++++++
 arch/arm/dts/sun8i-r40-oka40i-c.dts                | 203 +++++++++++++
 arch/arm/dts/sun8i-r40.dtsi                        | 118 +++++++-
 arch/arm/dts/sun8i-reference-design-tablet.dtsi    |  33 +-
 arch/arm/dts/sun8i-s3-elimo-impetus.dtsi           |  44 +++
 arch/arm/dts/sun8i-s3-elimo-initium.dts            |  29 ++
 arch/arm/dts/sun8i-s3-pinecube.dts                 |  13 +-
 arch/arm/dts/sun8i-t3-cqa3t-bv3.dts                | 226 ++++++++++++++
 arch/arm/dts/sun8i-v3-sl631-imx179.dts             |  12 +
 arch/arm/dts/sun8i-v3-sl631.dtsi                   | 138 +++++++++
 arch/arm/dts/sun8i-v3.dtsi                         |  36 +++
 arch/arm/dts/sun8i-v3s-licheepi-zero-dock.dts      |  17 +-
 arch/arm/dts/sun8i-v3s.dtsi                        |  93 +++++-
 arch/arm/dts/sun9i-a80-cubieboard4.dts             |  67 +++--
 arch/arm/dts/sun9i-a80-optimus.dts                 |  50 +++-
 arch/arm/dts/sun9i-a80.dtsi                        | 195 +++++++-----
 arch/arm/dts/suniv-f1c100s-licheepi-nano.dts       |  31 ++
 arch/arm/dts/suniv-f1c100s.dtsi                    | 104 ++++++-
 arch/arm/dts/sunxi-bananapi-m2-plus-v1.2.dtsi      |  18 +-
 arch/arm/dts/sunxi-bananapi-m2-plus.dtsi           |   4 +-
 arch/arm/dts/sunxi-common-regulators.dtsi          |  39 ---
 arch/arm/dts/sunxi-h3-h5.dtsi                      |  42 ++-
 arch/arm/dts/sunxi-libretech-all-h3-cc.dtsi        |  13 +
 arch/arm/dts/sunxi-libretech-all-h3-it.dtsi        |   2 +-
 arch/arm/dts/sunxi-reference-design-tablet.dtsi    |  11 +-
 arch/arm/mach-sunxi/Kconfig                        |   5 +-
 arch/arm/mach-sunxi/board.c                        |  13 +-
 board/sunxi/board.c                                |  22 +-
 configs/Nintendo_NES_Classic_Edition_defconfig     |   2 +-
 configs/licheepi_nano_defconfig                    |   1 -
 drivers/clk/sunxi/Kconfig                          |   7 +
 drivers/clk/sunxi/Makefile                         |   1 +
 drivers/clk/sunxi/clk_a10.c                        |   2 +
 drivers/clk/sunxi/clk_a10s.c                       |   2 +
 drivers/clk/sunxi/clk_a23.c                        |   2 +
 drivers/clk/sunxi/clk_a31.c                        |   2 +
 drivers/clk/sunxi/clk_a64.c                        |   4 +
 drivers/clk/sunxi/clk_a80.c                        |   2 +
 drivers/clk/sunxi/clk_a83t.c                       |   2 +
 drivers/clk/sunxi/clk_f1c100s.c                    |  74 +++++
 drivers/clk/sunxi/clk_h3.c                         |   4 +
 drivers/clk/sunxi/clk_h6.c                         |   4 +
 drivers/clk/sunxi/clk_h616.c                       |   4 +
 drivers/clk/sunxi/clk_h6_r.c                       |   6 +-
 drivers/clk/sunxi/clk_r40.c                        |   2 +
 drivers/clk/sunxi/clk_sunxi.c                      |   3 +
 drivers/clk/sunxi/clk_v3s.c                        |   2 +
 drivers/mmc/Kconfig                                |   2 +-
 drivers/serial/Kconfig                             |  26 --
 include/clk/sunxi.h                                |   5 +
 include/dt-bindings/clock/sun50i-a64-ccu.h         |   2 +-
 include/dt-bindings/clock/sun5i-ccu.h              |  13 +-
 include/dt-bindings/clock/sun6i-a31-ccu.h          |   2 +
 include/dt-bindings/clock/sun8i-a23-a33-ccu.h      |   2 +
 include/dt-bindings/clock/sun8i-h3-ccu.h           |   2 +-
 include/dt-bindings/clock/sun8i-v3s-ccu.h          |   4 +
 include/dt-bindings/reset/sun5i-ccu.h              |  11 +-
 include/dt-bindings/reset/sun8i-v3s-ccu.h          |   3 +
 185 files changed, 5516 insertions(+), 2508 deletions(-)
 create mode 100644 arch/arm/dts/sun50i-h6-pine-h64-model-b.dts
 create mode 100644 arch/arm/dts/sun50i-h6-tanix-tx6-mini.dts
 create mode 100644 arch/arm/dts/sun50i-h6-tanix.dtsi
 rename arch/arm/dts/{sun5i-q8-common.dtsi => sun5i-a13-licheepi-one.dts} (62%)
 create mode 100644 arch/arm/dts/sun5i-a13-pocketbook-touch-lux-3.dts
 create mode 100644 arch/arm/dts/sun5i-gr8-evb.dts
 create mode 100644 arch/arm/dts/sun7i-a20-haoyu-marsboard.dts
 create mode 100644 arch/arm/dts/sun7i-a20-linutronix-testbox-v2.dts
 create mode 100644 arch/arm/dts/sun7i-a20-olinuxino-lime-emmc.dts
 rename arch/arm/dts/{sunxi-q8-common.dtsi => sun8i-a23-ippo-q8h-v1.2.dts} (75%)
 create mode 100644 arch/arm/dts/sun8i-a23-ippo-q8h-v5.dts
 rename arch/arm/dts/{sun8i-r16-nintendo-nes-classic-edition.dts => sun8i-a33-et-q8-v1.6.dts} (81%)
 create mode 100644 arch/arm/dts/sun8i-a33-ippo-q8h-v1.2.dts
 create mode 100644 arch/arm/dts/sun8i-h3-nanopi-r1.dts
 create mode 100644 arch/arm/dts/sun8i-r16-nintendo-nes-classic.dts
 create mode 100644 arch/arm/dts/sun8i-r16-nintendo-super-nes-classic.dts
 create mode 100644 arch/arm/dts/sun8i-r40-feta40i.dtsi
 create mode 100644 arch/arm/dts/sun8i-r40-oka40i-c.dts
 create mode 100644 arch/arm/dts/sun8i-s3-elimo-impetus.dtsi
 create mode 100644 arch/arm/dts/sun8i-s3-elimo-initium.dts
 create mode 100644 arch/arm/dts/sun8i-t3-cqa3t-bv3.dts
 create mode 100644 arch/arm/dts/sun8i-v3-sl631-imx179.dts
 create mode 100644 arch/arm/dts/sun8i-v3-sl631.dtsi
 create mode 100644 drivers/clk/sunxi/clk_f1c100s.c
