Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3974D1E888
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Jul 2024 12:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721132653; cv=none; b=nMspavJm6I96cPFp3ANKymB9h1Yr5ELz0NAUZvx+QgMZUSzS9FY/15gyNy9Q3qDEr10rPDqmEzOS0NDBNUCPo00SEC3G7tS2qPsj3bUOinmKSdvx9c/IuHMG93uNmgKYtCW0UsHAnd1kcPSrdp4wlouM7SoTzSfOr+sxSfkNyWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721132653; c=relaxed/simple;
	bh=/fNiYzNK5uopMSGNIUb9gKmqyzKjTgYJz7rttDRTHU4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XAu9dH8pYmcObhCXWDAtBCkairSptcFSLXcTXAm5uuMkpXOI80TZ3C+njBdO33973BlYyDjc9eHDtGwc4gkGYN203Y2gkvZIoMPaIPehWyAHsph3DahgJQXpXMiw33ze6UMTguflIBD+eMYVEVa1abhg7TXTG/EXbd6F+VBCpe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC9F11063;
	Tue, 16 Jul 2024 05:24:35 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 715DC3F766;
	Tue, 16 Jul 2024 05:24:09 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de,
	Jagan Teki <jagan@amarulasolutions.com>,
	Michael Walle <mwalle@kernel.org>,
	linux-sunxi@lists.linux.dev,
	Ryan Walklin <ryan@testtoast.com>,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Pull request: u-boot-sunxi/master for v2024.10
Date: Tue, 16 Jul 2024 13:24:05 +0100
Message-Id: <20240716122405.78613-1-andre.przywara@arm.com>
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
2024.10 changes.
Nothing really major here, some rework of the SPL PMIC drivers, adding
support for the AXP717 on the way, which is showing up on newer boards
now, most prominently some Anbernic handheld gaming devices.
The rest is enabling Ethernet and SPI boot on the Allwinner V3s SoC,
plus two fixes.
This also updates the "traditional U-Boot" DTs to that of kernel v6.9.
I will look into upgrading some SoCs to dts/upstream in the coming cycle,
though this will not cover all SoCs for now, as we carry some non-mainline
fix to improve compatibility with older kernels. Will see how it goes,
but for now we stick with the "old way".

The branch survived the gitlab CI run, and Linux boot testing on some
selected boards.

Please pull!

Cheers,
Andre

============================================================
The following changes since commit b182816c1fb436916661949213c543bf4d42250b:

  turris_1x: Normalize Kconfig usage (2024-07-13 10:42:15 -0600)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to 674e4f994f5da537cab62ad86bc8bdf5acaae88c:

  spi: sunxi: drop max_hz handling (2024-07-16 01:40:40 +0100)

----------------------------------------------------------------
Andre Przywara (8):
      power: regulator: add AXP717 support
      power: pmic: sunxi: only build AXP drivers for SPL
      power: pmic: sunxi: introduce generic SPL AXP DC/DC driver
      power: pmic: sunxi: add AXP717 SPL support
      power: pmic: sunxi: use generic AXP SPL driver for AXP313
      power: pmic: sunxi: use generic AXP SPL driver for AXP305
      sunxi: dts: arm/arm64: update devicetree files from Linux-v6.9
      sunxi: spl: h616: fix booting from high MMC offset

Michael Walle (4):
      clk: sunxi: add EMAC and EPHY clocks and resets for the V3s SoC
      net: sun8i_emac: add support for the V3s
      sunxi: SPL SPI: add support for the V3s SoC
      spi: sunxi: drop max_hz handling

 arch/arm/dts/sun50i-h6-beelink-gs1.dts             |   2 +
 arch/arm/dts/sun50i-h6-tanix.dtsi                  |   2 +
 arch/arm/dts/sun50i-h6.dtsi                        |   7 +-
 arch/arm/dts/sun50i-h616-bigtreetech-cb1-manta.dts |   2 +-
 arch/arm/dts/sun50i-h616-bigtreetech-cb1.dtsi      |   4 +-
 arch/arm/dts/sun50i-h616-bigtreetech-pi.dts        |   2 +-
 arch/arm/dts/sun50i-h616.dtsi                      | 155 +++++++++
 arch/arm/dts/sun50i-h618-longan-module-3h.dtsi     |  75 +++++
 arch/arm/dts/sun50i-h618-longanpi-3h.dts           | 144 +++++++++
 arch/arm/dts/sun50i-h618-transpeed-8k618-t.dts     |  23 ++
 arch/arm/dts/sun50i-h64-remix-mini-pc.dts          | 356 +++++++++++++++++++++
 arch/arm/dts/sun8i-r40-feta40i.dtsi                |   7 +
 arch/arm/mach-sunxi/Kconfig                        |   2 +-
 arch/arm/mach-sunxi/board.c                        |   5 +-
 arch/arm/mach-sunxi/pmic_bus.c                     |   3 +
 arch/arm/mach-sunxi/spl_spi_sunxi.c                |   3 +-
 board/sunxi/board.c                                |   2 +-
 drivers/clk/sunxi/clk_v3s.c                        |   6 +
 drivers/net/sun8i_emac.c                           |   7 +
 drivers/power/Kconfig                              |  17 +-
 drivers/power/Makefile                             |   9 +-
 drivers/power/axp305.c                             |  82 -----
 drivers/power/axp313.c                             | 133 --------
 drivers/power/axp_spl.c                            | 173 ++++++++++
 drivers/power/pmic/axp.c                           |   1 +
 drivers/power/regulator/axp_regulator.c            |  28 ++
 drivers/spi/spi-sunxi.c                            |  21 +-
 include/axp_pmic.h                                 |   1 +
 28 files changed, 1026 insertions(+), 246 deletions(-)
 create mode 100644 arch/arm/dts/sun50i-h618-longan-module-3h.dtsi
 create mode 100644 arch/arm/dts/sun50i-h618-longanpi-3h.dts
 create mode 100644 arch/arm/dts/sun50i-h64-remix-mini-pc.dts
 delete mode 100644 drivers/power/axp305.c
 delete mode 100644 drivers/power/axp313.c
 create mode 100644 drivers/power/axp_spl.c
