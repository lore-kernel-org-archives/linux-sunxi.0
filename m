Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2282017F
	for <linux-sunxi@lists.linux.dev>; Mon, 24 May 2021 23:30:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D8096D;
	Mon, 24 May 2021 16:30:50 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3F653F73D;
	Mon, 24 May 2021 16:30:48 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: u-boot@lists.denx.de,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ondrej Jirman <megous@megous.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/8] sunxi: mmc: Fixes and speed increase
Date: Tue, 25 May 2021 00:30:21 +0100
Message-Id: <20210524233029.16417-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

While debugging some eMMC problem on the H616 SoC, I stumbled upon some
weird code in the Allwinner MMC driver. Some closer inspection and some
help from Ondrej later this series of fixes emerged:
Some patches remove part of the #ifdef hell we needlessly had in the
driver.
A big chunk is around the "new timing mode", which all "newer" SoCs
(since around 2015) have, and which requires some extra bit to be set. We
didn't enable this mode for all SoCs, this is now fixed in patches 3-6.
Patch 7 fixes a big performance problem we had due to using MMIO accesses
for the actual data transfer, as opposed to DMA transfers used in Linux.
Short from adding a lot of code to use DMA as well, we can actually halve
the number of MMIO accesses on reads, effectively doubling the bus
transfer performance. This helps the H6 a lot, but also improves the eMMC
read performance.
The final patch makes use of some generic MMC DT code, to parse generic
DT properties. This allows us to remove sunxi specific code, but also
adds support for "broken-cd" and more advanced MMC speed modes.

Please have a look and test this code on as many boards as possible.
While a performance increase is nice, we don't want to risk data
integrity over this, so please try to verify that it still works for
you.

Cheers,
Andre.

P.S. Patches 5 and 6 use different approaches to differentiate between
SoCs specific quirks: Patch 5/8 selects an explicit symbol from the
SoC specific sections in our Kconfig file, while patch 6/8 compares
the selected SoC type in the C code. Please let me know which approach
is better, I can then use this for both patches (and in the future).

Andre Przywara (8):
  mmc: sunxi: Avoid #ifdefs in delay and width setup
  mmc: sunxi: Fix warnings with CONFIG_PHYS_64BIT
  mmc: sunxi: Fix MMC clock parent selection
  mmc: sunxi: Cleanup "new timing mode" selection
  mmc: sunxi: Enable "new timing mode" on all new SoCs
  mmc: sunxi: Cleanup and fix self-calibration code
  mmc: sunxi: Increase MMIO FIFO read performance
  mmc: sunxi: Use mmc_of_parse()

 .../include/asm/arch-sunxi/clock_sun50i_h6.h  |   2 +-
 arch/arm/include/asm/arch-sunxi/mmc.h         |   1 +
 arch/arm/mach-sunxi/Kconfig                   |   3 +
 drivers/mmc/sunxi_mmc.c                       | 160 +++++++++++-------
 4 files changed, 102 insertions(+), 64 deletions(-)

-- 
2.17.5

