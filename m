Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E6B1C04
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Jul 2022 13:51:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E7A41576;
	Tue, 19 Jul 2022 06:51:08 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D97D73F73D;
	Tue, 19 Jul 2022 06:51:06 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de,
	Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev,
	Markus Hoffrogge <mhoffrogge@gmail.com>,
	Michal Suchanek <msuchanek@suse.de>
Subject: Pull request: u-boot-sunxi/master for v2022.10
Date: Tue, 19 Jul 2022 14:51:02 +0100
Message-Id: <20220719135102.1497678-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull the sunxi/master branch, containing the first part of the
2022.10 changes.

One prominent feature is the restructering of the clock driver, which
allows to end up with one actual driver for all variants, although we
still only compile in support for one SoC.
Also contained are some initial SPI fixes, which should fix some
problems, and enable SPI flash support for the F1C100s SoC. Those
patches revealed more problems, I will queue fixes later on, but for
now it should at least still work.
Apart from some smaller fixes (for instance for NAND operation), there
is also preparation for the upcoming Allwinner D1 support, in form of
the USB PHY driver. There are more driver support patches to come.

The gitlab CI completed successfully, including the build test for all
160 sunxi boards. I also boot tested on a few boards, but didn't have
time for more elaborate tests this time.

Thanks,
Andre

===========================
The following changes since commit 26f6f7fb5c0651d65afdee6d8ed36063606179a8:

  Merge branch '2022-07-14-migrate-wiki-to-sphinx' (2022-07-14 18:43:51 -0400)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to 25ba5be1c2b6324917254f0c22df1ad9d3d3c9e7:

  phy: sun4i-usb: Add D1 variant (2022-07-18 23:48:37 +0100)

----------------------------------------------------------------
Andre Przywara (6):
      sunxi: configs: streamline include/configs/sun*.h wrappers
      spi: sunxi: refactor SPI speed/mode programming
      spi: sunxi: improve SPI clock calculation
      spi: sunxi: Add support for F1C100s SPI controller
      sunxi: licheepi_nano: enable SPI flash
      phy: sun4i-usb: Rework HCI PHY (aka "pmu_unk1") handling

Icenowy Zheng (1):
      spi: sunxi: use XCH status to detect in-progress transfer

Markus Hoffrogge (1):
      sunxi-nand: fix the PIO instead of DMA implementation

Michal Suchanek (2):
      sunxi: lcd: Move range from kconfig description to definition.
      configs: sunxi: OrangePi Zero: enable Macronix flash support

Samuel Holland (12):
      clk: sunxi: Store the array sizes in the CCU descriptor
      clk: sunxi: Prevent out-of-bounds gate array access
      reset: sunxi: Get the reset count from the CCU descriptor
      clk: sunxi: Use a single driver for all variants
      clk: sunxi: Convert driver private data to platform data
      reset: sunxi: Convert driver private data to platform data
      reset: sunxi: Reuse the platform data from the clock driver
      net: sun8i-emac: Downgrade printf during probe to debug
      net: sun8i-emac: Drop use of arch-specific header
      sunxi: Move INITIAL_USB_SCAN_DELAY to driver Kconfig
      phy: sun4i-usb: Drop use of arch-specific headers
      phy: sun4i-usb: Add D1 variant

 arch/arm/mach-sunxi/Kconfig           |  12 +--
 configs/licheepi_nano_defconfig       |   3 +
 configs/orangepi_zero_defconfig       |   1 +
 drivers/clk/sunxi/clk_a10.c           |  27 +-----
 drivers/clk/sunxi/clk_a10s.c          |  27 +-----
 drivers/clk/sunxi/clk_a23.c           |  27 +-----
 drivers/clk/sunxi/clk_a31.c           |  25 +----
 drivers/clk/sunxi/clk_a31_r.c         |  29 +-----
 drivers/clk/sunxi/clk_a64.c           |  25 +----
 drivers/clk/sunxi/clk_a80.c           |  36 ++-----
 drivers/clk/sunxi/clk_a83t.c          |  25 +----
 drivers/clk/sunxi/clk_f1c100s.c       |  25 +----
 drivers/clk/sunxi/clk_h3.c            |  27 +-----
 drivers/clk/sunxi/clk_h6.c            |  25 +----
 drivers/clk/sunxi/clk_h616.c          |  25 +----
 drivers/clk/sunxi/clk_h6_r.c          |  27 +-----
 drivers/clk/sunxi/clk_r40.c           |  25 +----
 drivers/clk/sunxi/clk_sunxi.c         | 175 ++++++++++++++++++++++++++++++----
 drivers/clk/sunxi/clk_v3s.c           |  27 +-----
 drivers/mtd/nand/raw/sunxi_nand_spl.c |   2 +-
 drivers/net/sun8i_emac.c              |   3 +-
 drivers/phy/allwinner/Kconfig         |  10 ++
 drivers/phy/allwinner/phy-sun4i-usb.c |  44 +++++----
 drivers/reset/reset-sunxi.c           |  55 ++---------
 drivers/spi/spi-sunxi.c               | 123 ++++++++++++++----------
 include/clk/sunxi.h                   |  21 +---
 include/configs/sun4i.h               |  10 +-
 include/configs/sun50i.h              |  19 +---
 include/configs/sun5i.h               |  10 +-
 include/configs/sun6i.h               |   7 +-
 include/configs/sun7i.h               |   6 +-
 include/configs/sun8i.h               |  13 +--
 include/configs/sun9i.h               |  11 +--
 include/configs/suniv.h               |   7 +-
 34 files changed, 345 insertions(+), 589 deletions(-)
