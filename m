Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C34072
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Jul 2021 23:05:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1389E31B;
	Mon,  5 Jul 2021 16:05:20 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BC3A3F73B;
	Mon,  5 Jul 2021 16:05:19 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/3] sunxi: H616: SPI boot support
Date: Tue,  6 Jul 2021 00:04:42 +0100
Message-Id: <20210705230445.14834-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

The Allwinner H616 supports booting from SPI NOR flash, for which we
use our SPL specific SPI driver. Since this uses hardcoded values for
clocks, resets and pins, we need to extend it to cover the H616 SoC
as well.

Patch 1/3 extends the logic that determines the offset of the U-Boot
payload, from a fixed value to actually observing the SPL size.
Patch 2/3 piggy backs on the existing H6 SPI boot support, to cover
the (very similar) H616 as well. The only actual difference between the
two is one pin configuration.
Patch 3/3 enables SPI boot for the OrangePi Zero 2 board, which comes
with a 2MiB SPI flash chip soldered.

In my experiments I couldn't actually convince the BROM to load the SPL,
it always fell through to FEL mode. I post this series anyway, because:
1) We will need this code in any case, since it loads the rest of U-Boot
   (and TF-A) from SPI flash. By hacking sunxi-fel I could verify that
   this part works: the SPL code detected "SPI boot" and booted the rest
   of the firmware successfully from SPI flash.
2) I would encourage other people to try this, maybe it's just my board
   that is broken? (I dimly remember booting something some months ago.)
   The easiest way to flash U-Boot is via sunxi-fel:
   $ sunxi-fel -v -p spiflash-write 0 u-boot-sunxi-with-spl.bin

Cheers,
Andre

Andre Przywara (3):
  sunxi: SPL SPI: Allow larger SPL
  sunxi: SPL SPI: Add SPI boot support for the Allwinner H616 SoC
  sunxi: OrangePi Zero 2: Enable SPI booting

 arch/arm/mach-sunxi/Kconfig         |  2 +-
 arch/arm/mach-sunxi/spl_spi_sunxi.c | 37 +++++++++++++++++------------
 configs/orangepi_zero2_defconfig    |  1 +
 3 files changed, 24 insertions(+), 16 deletions(-)

-- 
2.17.5

