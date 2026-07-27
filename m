Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F773191CE
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Jul 2026 17:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785174503; cv=none; b=Qs/fKd2J4cVhb1zrPTyAXSoasslMSgknWGkVxhAB+/gDAaExwJJwAGyuFVRlHy9AzHB0ZxQukeEn+rU44gPfvHStBEWii96TAKlZ6lmNnoaD5Cg7H2hhkziCgqXFwixNmR6Di5PmyaydaMYVsJA1FTlTpU2zvHm+oF4P0EIIt/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785174503; c=relaxed/simple;
	bh=EH6izdmRU6juO6PplM7nIJkFuZyzHgPoahx5WL/2rhM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ud0B19dBlRqMVaAJ7N4DoXfA8rdMdjwX+quLHnllrvpEH8DjJ6p2Ee1/Tw1BKRTo8YMilD5r2Eko2Wj3f0P1ME7NxWQQrqLCQxigDoNMSNs5Q4NzR30IDSLKdgbuFb8ten+OkV5XupoHIn6qLjkg2llaGg0oCCM09XfG80Os+hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VoCJ+8F5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VoCJ+8F5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 481CE1682;
	Mon, 27 Jul 2026 10:48:07 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35CED3F763;
	Mon, 27 Jul 2026 10:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785174491; bh=EH6izdmRU6juO6PplM7nIJkFuZyzHgPoahx5WL/2rhM=;
	h=From:To:Cc:Subject:Date:From;
	b=VoCJ+8F5LZxqXTwemiuJezLBSXxVjjjVBzlGmOZHz+3UVbRco6xiC4htqskoR4kii
	 or/MWHeD1eprSt+aWI6dwJ/e0nSZitYo5yd5vcYL3ptNzbMI9WFZrEO3ps4VhNZGSV
	 7o4yDfF1tvtQQYfm31EbZ0Vbh5IezZ2XwgIqJSA0=
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.u-boot-project.org,
	Omar Ivan Fardjoume <ivan.fardjoume@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-sunxi@lists.linux.dev
Subject: Pull request: u-boot-sunxi/main for 2026.10
Date: Mon, 27 Jul 2026 19:44:14 +0200
Message-ID: <20260727174414.22152-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull these sunxi changes into main:

Beside a fix for a long standing bug in the A80 eMMC code, this adds
SPI booting support for the Allwinner A523/A527/T527 class of boards.
The second major feature is support for the secondary Ethernet controller
on that same SoC. This might not be as important as for the kernel (I
doubt that U-Boot acts as a router), but for once some boards only connect
the secondary EMAC, and on others people might have the boot server only
reachable via this port.
There are some smaller fixes and improvements still queued up, but they
need some more testing and are minor, so can land a bit later.

The world build timed out, but the rest passed, and I booted that briefly
on an A523 board with two Ethernet ports.

Thanks,
Andre
===========================================================
The following changes since commit b635d43bca429500cb8ef20aa151cb5773b9a8a5:

  Merge patch series "fs/squashfs: fix symlink load failure on large images" (2026-07-25 07:55:35 -0600)

are available in the Git repository at:

  https://git.u-boot-project.org/u-boot/custodians/u-boot-sunxi.git main

for you to fetch changes up to 59edf9a3427c13f05d450fe84f42ef00dc7096c9:

  configs: radxa-cubie-a5e: enable the gmac1 controller (2026-07-27 01:18:35 +0200)

----------------------------------------------------------------
Andre Przywara (5):
      spi: sunxi: add support for A523 SPI controller
      sunxi: spl: spi: Clean up SPI0 pinmux setting
      sunxi: spl: spi: Add support for Allwinner A523
      sunxi: configs: Radxa Cubie A5E: enable SPI
      sunxi: configs: OrangePi 4A: enable SPI

Junhui Liu (5):
      pinctrl: sunxi: a523: add gmac1 support
      clk: sunxi: a523: add MBUS_EMAC1 clock gate
      arm: mach-sunxi: add syscon driver for system-control nodes
      net: dwc_eth_qos: add support for sun55i platform
      configs: radxa-cubie-a5e: enable the gmac1 controller

Omar Ivan Fardjoume (1):
      mmc: sunxi: fix MACH_SUN9I typo in get_mclk_offset()

 arch/arm/mach-sunxi/Kconfig           |   7 +
 arch/arm/mach-sunxi/Makefile          |   1 +
 arch/arm/mach-sunxi/spl_spi_sunxi.c   |  48 +++----
 arch/arm/mach-sunxi/syscon.c          |  28 ++++
 configs/orangepi_4a_defconfig         |   4 +
 configs/radxa-cubie-a5e_defconfig     |   9 ++
 drivers/clk/sunxi/clk_a523.c          |   1 +
 drivers/mmc/sunxi_mmc.c               |   6 +-
 drivers/net/Kconfig                   |   9 ++
 drivers/net/Makefile                  |   1 +
 drivers/net/dwc_eth_qos.c             |   6 +
 drivers/net/dwc_eth_qos.h             |   1 +
 drivers/net/dwc_eth_qos_sunxi.c       | 254 ++++++++++++++++++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.c |   3 +-
 drivers/spi/spi-sunxi.c               |   4 +
 15 files changed, 352 insertions(+), 30 deletions(-)
 create mode 100644 arch/arm/mach-sunxi/syscon.c
 create mode 100644 drivers/net/dwc_eth_qos_sunxi.c
