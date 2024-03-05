Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D998410A1B
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Mar 2024 11:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709637352; cv=none; b=LdiBAwJ3Wl34XZSup0pnBXTre1Y0qQIKs69hAqdYBQ+AFGUtxFYv45EFN2c6SVx+rd+gdiMJnF1vVJ+4hQ2lSiPvPBpx7e4VWjgd7ApE+mmXbLk2+/+Pq9SGyy/CsadMXMpl9q25i/mFEGgLXtiQsC6A413lQdTvNPBIaJ179QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709637352; c=relaxed/simple;
	bh=qJBQKGXjt9LR8Zy2gkW605JUY6dMcWjhBByal76Bt+w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CMpqs4jTwB3hW5NlQki42KOyEWZKZC/w8cFSucoPgNOl/rj+ZbictBTprkBdhtlQXRaGu7AolsutUNOcU86biQV4wFprWRbpD3R9/0BrMhtdo0HYNA+35qC9uyNq4vKQEg0z/74AdY2xuENhNn/BFtQDXD1Z+7hmaLoW2oT8D7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A60611FB;
	Tue,  5 Mar 2024 03:16:26 -0800 (PST)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C39303F762;
	Tue,  5 Mar 2024 03:15:48 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de,
	Jagan Teki <jagan@amarulasolutions.com>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Philippe Coval <rzr@users.sf.net>,
	Ludwig Kormann <ludwig.kormann@ict42.de>,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: Pull request: u-boot-sunxi/master for v2024.04
Date: Tue,  5 Mar 2024 11:15:41 +0000
Message-Id: <20240305111541.2369415-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull the sunxi/master branch, containing some fixes and smaller
changes for 2024.04.
One fix makes the reboot more robust on some older board, another one
stabilises the initial clock setup on the A10/A20.
Two patches make sure our DRAM init does not actually change the content
of the DRAM array, which allows to use DRAM for Linux' pstore
functionality.
We get SPI support for U-Boot proper for one more SoC, that patch was
lingering around for a while, and should not affect other SoCs, so I am
merging this now.
As an added bonus, we get the defconfig file for a new board, the DT was
already synced from the kernel tree.

The CI looked happy with changes, and I tested them on five different
boards with different SoCs.

Please pull!

Cheers,
Andre

==================
The following changes since commit eac52e4be4e234d563d6911737ee7ccdc0ada1f1:

  Merge patch series "ARM: renesas: Rename R-Mobile to Renesas" (2024-03-02 14:30:25 -0500)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to f1e6a718ebab0682d80601db404e8d842767becf:

  sunxi: restore modified memory (2024-03-05 01:16:56 +0000)

----------------------------------------------------------------
Andre Przywara (1):
      sunxi: H616: Add OrangePi Zero 2W board support

Andrey Skvortsov (2):
      sunxi: reorganize mctl_mem_matches_* functions
      sunxi: restore modified memory

Ludwig Kormann (1):
      sunxi: sun4i: add missing sdelay() to clock_init_safe()

Maksim Kiselev (1):
      spi: sunxi: Add support for R329/D1/R528/T113 SPI controller

Philippe Coval (1):
      arm: sunxi: Reduce inrush current on Olimex A20-OLinuXino_MICRO configs

 arch/arm/dts/Makefile                      |  1 +
 arch/arm/include/asm/arch-sunxi/dram.h     |  1 +
 arch/arm/mach-sunxi/clock_sun4i.c          |  2 ++
 arch/arm/mach-sunxi/dram_helpers.c         | 32 ++++++++++++++++++++++------
 arch/arm/mach-sunxi/dram_sunxi_dw.c        | 13 ------------
 board/sunxi/MAINTAINERS                    |  5 +++++
 configs/A20-OLinuXino_MICRO-eMMC_defconfig |  1 +
 configs/A20-OLinuXino_MICRO_defconfig      |  1 +
 configs/orangepi_zero2w_defconfig          | 30 ++++++++++++++++++++++++++
 drivers/spi/spi-sunxi.c                    | 34 +++++++++++++++++++++++++++++-
 10 files changed, 100 insertions(+), 20 deletions(-)
 create mode 100644 configs/orangepi_zero2w_defconfig
