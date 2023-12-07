Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9A03EA7E
	for <linux-sunxi@lists.linux.dev>; Thu,  7 Dec 2023 13:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99E3812FC;
	Thu,  7 Dec 2023 05:53:42 -0800 (PST)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31CF63F6C4;
	Thu,  7 Dec 2023 05:52:55 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Bob McChesney <bob@electricworry.net>,
	Stephen Graf <stephen.graf@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: Pull request: u-boot-sunxi/master for v2024.01
Date: Thu,  7 Dec 2023 13:52:40 +0000
Message-Id: <20231207135240.2070795-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull the hopefully final sunxi changes for this cycle:

the first four patches are actual fixes. The last three patches add
support for the apparently popular OrangePi Zero 3 board: multiple
people seem to be champing at the bit, so I'd rather give them
something real instead of people using random trees they found on the
Internet. It's actually mostly the new defconfig file anyway, so the
chances for regressions are very slim.

Gitlab CI passed, and multiple people booted that on the Zero 3 board.

Thanks,
Andre

=========================================================
The following changes since commit 2f0282922b2c458eea7f85c500a948a587437b63:

  Prepare v2024.01-rc4 (2023-12-04 13:46:56 -0500)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to d2e1cc69a24719e9939a84dc42bdf281af6ec35d:

  sunxi: H616: Add OrangePi Zero 3 board support (2023-12-06 23:09:17 +0000)

----------------------------------------------------------------
Andre Przywara (5):
      sunxi: H616: OrangePi Zero 2: enable USB power supply
      sunxi: h616: (really) lower SPL stack address to avoid BROM data
      mtd: spi-nor: Add support for zBIT ZB25VQ128
      sunxi: H616: remove default AXP305 selection
      sunxi: H616: Add OrangePi Zero 3 board support

Chukun Pan (1):
      sunxi: dts: arm64: update emac for Orange Pi Zero 3

Stephen Graf (1):
      sunxi: correct documentation for SPI flashing

 arch/arm/dts/Makefile                       |  1 +
 arch/arm/dts/sun50i-h616-orangepi-zero.dtsi |  3 ---
 arch/arm/dts/sun50i-h616-orangepi-zero2.dts |  3 +++
 arch/arm/dts/sun50i-h618-orangepi-zero3.dts |  2 ++
 board/sunxi/MAINTAINERS                     |  5 +++++
 common/spl/Kconfig                          |  2 +-
 configs/orangepi_zero2_defconfig            |  2 ++
 configs/orangepi_zero3_defconfig            | 32 +++++++++++++++++++++++++++++
 configs/x96_mate_defconfig                  |  1 +
 doc/board/allwinner/sunxi.rst               |  3 +--
 drivers/mtd/spi/Kconfig                     |  5 +++++
 drivers/mtd/spi/spi-nor-ids.c               |  5 +++++
 drivers/power/Kconfig                       |  1 -
 13 files changed, 58 insertions(+), 7 deletions(-)
 create mode 100644 configs/orangepi_zero3_defconfig
