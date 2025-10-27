Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36AF2C15A8
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 14:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761576320; cv=none; b=PXM66vPcFSAdjtf/5rLx4Dw5gPpBFW8udW4e2HBxXrh18rTweC/4jyEDGzFdCFSjORT/FpAHM9CuuMjlZMAmmVFVKizGVospS/nHR+1WeQ775/UUws6PfFNtHX1XxLGW+Wz4nrIDz3kMKKjgUw7MfJPfoGfbWuHg9CHlseV1MSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761576320; c=relaxed/simple;
	bh=v7GE6eNpnRrUGpOLkS5AAF/8pUeo2+jEgximjpAXOtE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r1OAbDzVN6oAup4q9szwoNKZrY+NTsfAXVrMOVKYSHEnJ7nT1jbNckf0f6UNINxqSvegz4DUnJL9eaQh2RPT23zYS8xy91L7Pv/lM1pgwX5RIVseD4KddJWdgjr1J21f7CPopsp7HOosFS4RGHCepQ5WDQtQH3mk6n8RPrvC2f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C29D169E;
	Mon, 27 Oct 2025 07:45:09 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.33.8.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28D4F3F63F;
	Mon, 27 Oct 2025 07:45:16 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Paul Kocialkowski <contact@paulk.fr>
Subject: [GIT PULL] u-boot-sunxi/master for v2026.01
Date: Mon, 27 Oct 2025 14:45:12 +0000
Message-Id: <20251027144512.3199406-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull these sunxi changes for v2026.01. No big features this time,
mostly a collection of patches that have been lying around for a bit.
There are some DT updates, for those SoCs that do not use OF_UPSTREAM yet,
hopefully that's the last time we need to do this exercise. And that's
offset by switching over two more SoCs to OF_UPSTREAM.
Two new boards get a defconfig, and some improvements for the sun8i-emac
Ethernet driver. Finally a patch that fixes occassional DRAM size
misdetection for new A523 boards.

There are a few outstanding patches that just wait for getting some
details confirmed, which I might send then later.

CI passed, and I tested this briefly on affected boards.

Thanks,
Andre

================================
The following changes since commit 9094482ca7576877b2bfaa57c8e73cfeb536f8b9:

  Merge tag 'efi-2026-01-rc1-2' of https://source.denx.de/u-boot/custodians/u-boot-efi (2025-10-26 09:03:36 -0600)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git HEAD

for you to fetch changes up to fa4dfe870c16a90ed14be92f5f3a3822a7ecfe9a:

  sunxi: dts: arm: update devicetree files from Linux kernel tree (2025-10-27 11:12:57 +0000)

----------------------------------------------------------------
Andre Przywara (5):
      sunxi: a523: Re-use H6/H616 DRAM size detection method
      sunxi: switch the Allwinner T113 SoC to OF_UPSTREAM
      sunxi: switch Allwinner A80 boards to OF_UPSTREAM
      sunxi: dts: arm64: update devicetree files from Linux kernel tree
      sunxi: dts: arm: update devicetree files from Linux kernel tree

Chen-Yu Tsai (1):
      sunxi: a523: Add OrangePi 4A defconfig

James Hilliard (1):
      Makefile: pass KEYDIR when set to sunxi-spl.bin mkimage

Lukas Schmid (1):
      sunxi: add support for NetCube Systems Kumquat

Paul Kocialkowski (2):
      net: sun8i-emac: Remove internal PHY config default value
      net: sun8i-emac: Add support for active-low leds with internal PHY

 arch/arm/dts/Makefile                              |    4 -
 arch/arm/dts/sun50i-a64-pine64-lts.dts             |    2 +-
 arch/arm/dts/sun50i-a64-pine64-plus.dts            |    2 +-
 arch/arm/dts/sun50i-a64-pine64.dts                 |   14 +-
 arch/arm/dts/sun50i-a64-pinebook.dts               |    4 +-
 arch/arm/dts/sun50i-a64-pinephone.dtsi             |   21 +
 arch/arm/dts/sun50i-a64-pinetab-early-adopter.dts  |    2 +-
 arch/arm/dts/sun50i-a64-pinetab.dts                |    2 +-
 arch/arm/dts/sun50i-a64-sopine-baseboard.dts       |   21 +-
 arch/arm/dts/sun50i-a64-teres-i.dts                |    2 +
 arch/arm/dts/sun50i-a64.dtsi                       |   55 +-
 arch/arm/dts/sun50i-h5-nanopi-neo-plus2.dts        |   38 +
 arch/arm/dts/sun50i-h5-nanopi-neo2.dts             |    1 +
 arch/arm/dts/sun50i-h5-nanopi-r1s-h5.dts           |    1 +
 arch/arm/dts/sun50i-h5-orangepi-pc2.dts            |    1 +
 arch/arm/dts/sun50i-h5-orangepi-prime.dts          |    1 +
 arch/arm/dts/sun50i-h5-orangepi-zero-plus.dts      |    1 +
 arch/arm/dts/sun50i-h5-orangepi-zero-plus2.dts     |    1 +
 arch/arm/dts/sun50i-h5.dtsi                        |    6 +-
 arch/arm/dts/sun50i-h6-beelink-gs1.dts             |   39 +-
 arch/arm/dts/sun50i-h6-orangepi-3.dts              |   17 +-
 arch/arm/dts/sun50i-h6-orangepi-lite2.dts          |    2 +-
 arch/arm/dts/sun50i-h6-orangepi.dtsi               |   23 +-
 arch/arm/dts/sun50i-h6-pine-h64-model-b.dts        |    2 +-
 arch/arm/dts/sun50i-h6-pine-h64.dts                |    3 +-
 arch/arm/dts/sun50i-h6-tanix.dtsi                  |    1 +
 arch/arm/dts/sun50i-h6.dtsi                        |   41 +-
 arch/arm/dts/sun7i-a20-bananapi.dts                |   27 +
 arch/arm/dts/sun8i-a23-a33.dtsi                    |   20 +
 arch/arm/dts/sun8i-a33-vstar-core1.dtsi            |   96 ++
 arch/arm/dts/sun8i-a33-vstar.dts                   |  205 ++++
 arch/arm/dts/sun8i-a83t.dtsi                       |    4 +-
 arch/arm/dts/sun8i-h2-plus-orangepi-zero.dts       |   14 +
 arch/arm/dts/sun8i-h3-nanopi-neo-air.dts           |    2 +-
 arch/arm/dts/sun8i-h3-orangepi-zero-plus2.dts      |   14 +
 arch/arm/dts/sun8i-h3.dtsi                         |    2 +-
 .../dts/sun8i-orangepi-zero-interface-board.dtso   |   46 +
 arch/arm/dts/sun8i-q8-common.dtsi                  |    2 +-
 arch/arm/dts/sun8i-r40.dtsi                        |    4 +-
 arch/arm/dts/sun8i-t113s-mangopi-mq-r-t113.dts     |   35 -
 arch/arm/dts/sun8i-t113s.dtsi                      |   59 -
 arch/arm/dts/sun9i-a80-cubieboard4.dts             |  508 --------
 arch/arm/dts/sun9i-a80-optimus.dts                 |  510 --------
 arch/arm/dts/sun9i-a80.dtsi                        | 1253 --------------------
 arch/arm/mach-sunxi/Kconfig                        |    2 +
 arch/arm/mach-sunxi/Makefile                       |    2 +-
 arch/arm/mach-sunxi/dram_sun55i_a523.c             |   82 +-
 arch/riscv/dts/sunxi-d1-t113.dtsi                  |   15 -
 arch/riscv/dts/sunxi-d1s-t113.dtsi                 |  927 ---------------
 board/sunxi/MAINTAINERS                            |   10 +
 configs/Cubieboard4_defconfig                      |    2 +-
 configs/Merrii_A80_Optimus_defconfig               |    2 +-
 configs/Sunchip_CX-A99_defconfig                   |    1 +
 configs/mangopi_mq_r_defconfig                     |    2 +-
 configs/netcube_kumquat_defconfig                  |   43 +
 configs/orangepi_4a_defconfig                      |   32 +
 drivers/net/sun8i_emac.c                           |   40 +-
 scripts/Makefile.xpl                               |    3 +-
 58 files changed, 784 insertions(+), 3487 deletions(-)
 create mode 100644 arch/arm/dts/sun8i-a33-vstar-core1.dtsi
 create mode 100644 arch/arm/dts/sun8i-a33-vstar.dts
 create mode 100644 arch/arm/dts/sun8i-orangepi-zero-interface-board.dtso
 delete mode 100644 arch/arm/dts/sun8i-t113s-mangopi-mq-r-t113.dts
 delete mode 100644 arch/arm/dts/sun8i-t113s.dtsi
 delete mode 100644 arch/arm/dts/sun9i-a80-cubieboard4.dts
 delete mode 100644 arch/arm/dts/sun9i-a80-optimus.dts
 delete mode 100644 arch/arm/dts/sun9i-a80.dtsi
 delete mode 100644 arch/riscv/dts/sunxi-d1-t113.dtsi
 delete mode 100644 arch/riscv/dts/sunxi-d1s-t113.dtsi
 create mode 100644 configs/netcube_kumquat_defconfig
 create mode 100644 configs/orangepi_4a_defconfig
