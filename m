Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF5338B
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Dec 2023 01:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 782B0106F;
	Sun,  3 Dec 2023 17:02:00 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA8743F6C4;
	Sun,  3 Dec 2023 17:01:11 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Vignesh R <vigneshr@ti.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Mikhail Kalashnikov <iuncuim@gmail.com>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
	Bob McChesney <bob@electricworry.net>,
	Stephen Graf <stephen.graf@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/3] sunxi: add OrangePi Zero 3 board support
Date: Mon,  4 Dec 2023 00:59:51 +0000
Message-Id: <20231204005954.13201-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A small update for the OrangePi Zero 3 support series. This fixes
USB support, and upgrades the DRAM clock to 792, for better stability
(as the other DRAM parameters were tailored to that frequency). I added
the tags on the way.
Please test!

=================
The OrangePi Zero 3 is a small development board featuring the Allwinner
H618 SoC. Compared to its predecessor OrangePi Zero 2, the new board uses
LPDDR4 DRAM instead of DDR3 DRAM, and an X-Powers AXP313 PMIC instead of
the AXP305.
U-Boot gained support for both LPDDR4 DRAM and the new PMIC just
recently, so add a user for those features by adding a defconfig for the
new board.
To make this work, patch 1/3 introduces support for zBIT SPI NOR flash
chip, and patch 2/3 removes the default AXP305 PMIC selection when
compiling for H616 SoCs.
Patch 3/3 then adds the defconfig. The DT was already synced from the
Linux kernel repo a few weeks ago.

Cheers,
Andre

Changelog v1 .. v2:
- add tags
- set DRAM clock to 792 MHz (from the default 720 MHz)
- fix USB support by supplying USB VBUS enable GPIO

Andre Przywara (3):
  mtd: spi-nor: Add support for zBIT ZB25VQ128
  sunxi: H616: remove default AXP305 selection
  sunxi: H616: Add OrangePi Zero 3 board support

 arch/arm/dts/Makefile            |  1 +
 board/sunxi/MAINTAINERS          |  5 +++++
 configs/orangepi_zero2_defconfig |  1 +
 configs/orangepi_zero3_defconfig | 32 ++++++++++++++++++++++++++++++++
 configs/x96_mate_defconfig       |  1 +
 drivers/mtd/spi/Kconfig          |  5 +++++
 drivers/mtd/spi/spi-nor-ids.c    |  5 +++++
 drivers/power/Kconfig            |  1 -
 8 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 configs/orangepi_zero3_defconfig

-- 
2.35.8

