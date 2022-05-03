Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8116633C9
	for <linux-sunxi@lists.linux.dev>; Tue,  3 May 2022 21:21:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 651F412FC;
	Tue,  3 May 2022 14:20:58 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A92613FA53;
	Tue,  3 May 2022 14:20:56 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jesse Taube <mr.bossman075@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>,
	Yifan Gu <me@yifangu.com>,
	Giulio Benetti <giulio.benetti@benettiengineering.com>,
	George Hilliard <thirtythreeforty@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	u-boot@lists.denx.de
Subject: [PATCH 0/7] sunxi: F1C100s: enable MMC and SPI in U-Boot proper
Date: Tue,  3 May 2022 22:20:33 +0100
Message-Id: <20220503212040.27884-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far the U-Boot proper support for the Allwinner F1C100 family of SoCs
was really limited: we could realistically only deal with FEL booting,
as there was no storage or network device acessible from U-Boot proper.

This series enables the MMC and SPI controller, to be able to actually
load something from the device. This is made possible by the updates
to the devicetree in Linux, which now describes those devices.

The first patch is taken from George's/Yifan's older series, and adds
DM_CLK support for the F1C100s. The DM_PINCTRL support was already added
with the DM conversion a few weeks back.
Patches 2-4 fix the SPI driver clock setup, and add support for the
differing SPI clock on the F1C100.
Patch 5 updates the devicetree files, freshly synced from linux-next.
Patch 6 reverts a hack we introduced back then to fix the reset
functionality, with the DT update this is now no longer needed.
The final patch adds SPI flash support to the Licheepi Nano defconfig,
as these boards mostly ship with SPI flash soldered.

Please have a look and test!

Cheers,
Andre

Andre Przywara (6):
  spi: sunxi: refactor SPI speed/mode programming
  spi: sunxi: improve SPI clock calculation
  spi: sunxi: Add support for F1C100s SPI controller
  sunxi: F1C100s: update DT files from Linux
  Revert "sunxi: f1c100s: Drop SYSRESET to enable reset functionality"
  sunxi: licheepi_nano: enable SPI flash

George Hilliard (1):
  clk: sunxi: implement clock driver for suniv f1c100s

 arch/arm/dts/suniv-f1c100s-licheepi-nano.dts |  31 ++++++
 arch/arm/dts/suniv-f1c100s.dtsi              | 104 ++++++++++++++++--
 configs/licheepi_nano_defconfig              |   4 +-
 drivers/clk/sunxi/Kconfig                    |   7 ++
 drivers/clk/sunxi/Makefile                   |   1 +
 drivers/clk/sunxi/clk_f1c100s.c              |  74 +++++++++++++
 drivers/spi/spi-sunxi.c                      | 109 +++++++++++--------
 7 files changed, 275 insertions(+), 55 deletions(-)
 create mode 100644 drivers/clk/sunxi/clk_f1c100s.c

-- 
2.35.3

