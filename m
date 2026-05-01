Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1643B27EC
	for <linux-sunxi@lists.linux.dev>; Fri,  1 May 2026 13:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777643995; cv=none; b=HehvMadiQBdA///2rhGbJTcp3HFAyp76MhMZQyQLNmARF6qI6w30LUM2E8/iTvl51sv9avjtih1E3AcVvP+hbTsMcPufJx8u+cKDCphic669te3El6nWszxzQbpwNhoIcooUkbqBBUFDxcl7gHwRReImzYA1YSPbRTZnSOUPRno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777643995; c=relaxed/simple;
	bh=HbZ92LwyzvHwo5mOloPFhGGIZvN0/Mi3JiCkSfFgbPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WjQk3aZSeptI6nribdfnuyWgjrIAm8Bqz3hW2LzybT0yHOW71foMydhUswTHDknnJYWDH0dFNFKFELw+//wkYbEriaTj6O6lGQ8mOVvOLFAiASCTyFQAxRf5uwBXWDktJWYGzetrNgFSvmh11nrzXQK0dpoZn2afpvxQN26SlKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SuZ8ZU78; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SuZ8ZU78"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33B9B176B;
	Fri,  1 May 2026 06:59:48 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38EE03F62B;
	Fri,  1 May 2026 06:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777643993; bh=HbZ92LwyzvHwo5mOloPFhGGIZvN0/Mi3JiCkSfFgbPw=;
	h=From:To:Cc:Subject:Date:From;
	b=SuZ8ZU78BcrqNcS4RLFxTYuhz64nnXKavzJjRp1clz5WdO/U/imlQVeEFbxBJ7MEv
	 xeqvMtNDtm85c7CfgthbnhvgdfMKtB7dOFRYR20VqtQJm8bkF7fMx8sdBu0a9Fn6a1
	 AeFuCqAQDIK42uYH5EUduRJDLW3OYfuNgYKZ3p3A=
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [GIT PULL] u-boot-sunxi/master for v2026.07
Date: Fri,  1 May 2026 15:59:17 +0200
Message-ID: <20260501135917.9276-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

apologies for the delay, but please pull those sunxi changes into
v2026.07. Nothing earth shattering, mostly minor improvements like
better SPL power LED support, and fixes to some H616 DRAM setup. Also
some more forward looking enhancement for the SPI code. I also pulled in
Richard's raw NAND flash improvements for the H6/H616 SoC, though this
lacks proper peer testing due to the lack of mainline support for any board
actually employing those chips.

Gitlab CI passed, and I booted that briefly on some boards.

Thanks,
Andre

===========================================================
The following changes since commit 8ef8dee4f3a2b2021decfefd853dbd2a1632b77f:

  scripts/dtc: drop yaml in DT validation (2026-04-30 12:21:47 -0600)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to 4c8d2a633ed22e90c6b1954b10b0f74fd678cb23:

  mtd: nand: raw: sunxi_spl: remove user data length reset (2026-05-01 14:49:44 +0200)

----------------------------------------------------------------
Andre Przywara (4):
      sunxi: spl: fix SPL_SUNXI_LED active low configuration
      sunxi: configs: enable power LEDs on 32-bit boards
      sunxi: configs: enable power LEDs on 64-bit boards
      sunxi: H616: dram: drop default TPR6 Kconfig value

Heinrich Schuchardt (1):
      sunxi: use vendor prefix for $fdtfile on RISC-V too

Jernej Skrabec (1):
      sunxi: H616: dram: fix LPDDR3 TPR6 parsing

Lukas Schmid (1):
      pinctrl: sunxi: add I2C3 mux for D1/T113-s3 (PG10/PG11)

Richard Genoud (5):
      mtd: rawnand: sunxi: Replace hard coded value by a define
      mtd: rawnand: sunxi: make the code mode self-explanatory
      mtd: rawnand: sunxi: clean sunxi_nand_chip_init()
      mtd: rawnand: sunxi: introduce variable user data length
      mtd: nand: raw: sunxi_spl: remove user data length reset

Yixun Lan (1):
      spi: sunxi: wait for TX/RX fifo reset done

 arch/arm/mach-sunxi/Kconfig              |  11 +-
 arch/arm/mach-sunxi/dram_sun50i_h616.c   |   2 +-
 board/sunxi/board.c                      |   4 +-
 configs/A13-OLinuXinoM_defconfig         |   2 +
 configs/Bananapi_M2_Ultra_defconfig      |   2 +
 configs/Bananapi_m2m_defconfig           |   3 +
 configs/Mele_A1000G_quad_defconfig       |   2 +
 configs/Mele_A1000_defconfig             |   2 +
 configs/Mele_M9_defconfig                |   2 +
 configs/anbernic_rg35xx_h700_defconfig   |   2 +
 configs/bananapi_m1_plus_defconfig       |   2 +
 configs/bananapi_m2_berry_defconfig      |   2 +
 configs/bananapi_m2_zero_defconfig       |   3 +
 configs/bananapi_m64_defconfig           |   2 +
 configs/beelink_gs1_defconfig            |   2 +
 configs/beelink_x2_defconfig             |   2 +
 configs/icnova-a20-adb4006_defconfig     |   2 +
 configs/liontron-h-a133l_defconfig       |   3 +
 configs/nanopi_duo2_defconfig            |   2 +
 configs/nanopi_neo2_defconfig            |   2 +
 configs/nanopi_neo_air_defconfig         |   2 +
 configs/nanopi_neo_plus2_defconfig       |   2 +
 configs/orangepi_2_defconfig             |   2 +
 configs/orangepi_3_defconfig             |   2 +
 configs/orangepi_lite2_defconfig         |   2 +
 configs/orangepi_lite_defconfig          |   2 +
 configs/orangepi_one_defconfig           |   2 +
 configs/orangepi_pc2_defconfig           |   2 +
 configs/orangepi_pc_defconfig            |   2 +
 configs/orangepi_prime_defconfig         |   2 +
 configs/orangepi_zero2_defconfig         |   3 +
 configs/orangepi_zero_defconfig          |   2 +
 configs/orangepi_zero_plus2_defconfig    |   2 +
 configs/orangepi_zero_plus2_h3_defconfig |   2 +
 configs/orangepi_zero_plus_defconfig     |   2 +
 configs/pinephone_defconfig              |   3 +-
 configs/radxa-cubie-a5e_defconfig        |   3 +
 configs/tanix_tx1_defconfig              |   2 +
 configs/transpeed-8k618-t_defconfig      |   1 +
 configs/x96_mate_defconfig               |   1 +
 configs/x96q_defconfig                   |   1 +
 drivers/mtd/nand/raw/sunxi_nand.c        | 291 +++++++++++++++++++++++--------
 drivers/mtd/nand/raw/sunxi_nand.h        |   3 +
 drivers/mtd/nand/raw/sunxi_nand_spl.c    | 129 +++++++++++---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c    |   1 +
 drivers/spi/spi-sunxi.c                  |   9 +-
 include/configs/sunxi-common.h           |   2 +-
 47 files changed, 418 insertions(+), 113 deletions(-)
