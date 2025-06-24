Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26EB2512DE
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Jun 2025 19:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793346; cv=none; b=Uo/u1w6H/b9OC3Xleg88TUuPktEmhA2I+kvoj7mV9gBOR2QSlC3Zp68hBbtBd1M6JjlMH/RlEhqynqXwgTK1Z7rIcDi0VbMzk6ZJc7P0qb+KIfrbKII6PGHZFG/oQYqR30ieRN8IkEkvttdxzni6GMVVgwldyu3NE3R7CIIi5kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793346; c=relaxed/simple;
	bh=4xrVt4XyhCE6DSrXH/UPIZetEGGyoJFHZx2O8Q9j3Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SzosO10G4d+VQ0uIP8APdNFPY7T+Y7yBMdA1MR+y1ELwOThgO4Vftl6AZnX8Om+xCdQ55HQJcE5dMvK1PCV2UftYT2Ou7SyMxcQnNyd3fG4HY8YFW51vIxFo2bX6RsV3tKeDy6MgCfbIZXpFAknQy/JOMV6L3W0wziyON1kG6/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C697B1AC1;
	Tue, 24 Jun 2025 12:28:44 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA4F63F66E;
	Tue, 24 Jun 2025 12:29:01 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>,
	Paul Kocialkowski <contact@paulk.fr>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [GIT PULL] u-boot-sunxi/next
Date: Tue, 24 Jun 2025 20:27:38 +0100
Message-ID: <20250624192738.13062-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull these sunxi changes into next:
This concludes support for the Allwinner A133 SoC, the biggest chunk of
which is the DRAM init code. Also includes support for a devboard using
this SoC, the DT of which  got added to the kernel only recently. The same
is true for another H618 devboard, so add the respective devconfig as well.

Gitlab CI passed, and I booted that briefly on those two boards.

Thanks,
Andre

===========================================================
The following changes since commit 184e7d0bb211b8885f6715fdd6149ce96a4d1037:

  Merge tag 'v2025.07-rc5' into next (2025-06-23 16:15:23 -0600)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git next

for you to fetch changes up to babf74be60e7a257ac7539f719017daf7b2129e7:

  sunxi: H616: add support for YuzukiHD Chameleon board (2025-06-24 13:44:52 +0100)

----------------------------------------------------------------
Andre Przywara (6):
      sunxi: add support for the Allwinner A100/A133 SoC
      arm64: dts: allwinner: a100: set maximum MMC frequency
      arm64: dts: allwinner: a100: add Liontron H-A133L board support
      sunxi: add support for Liontron H-A133L board
      arm64: dts: allwinner: h616: add YuzukiHD Chameleon support
      sunxi: H616: add support for YuzukiHD Chameleon board

Cody Eksal (1):
      sunxi: A133: add DRAM init code

 arch/arm/cpu/armv8/fel_utils.S                     |    2 +-
 arch/arm/include/asm/arch-sunxi/clock_sun50i_h6.h  |    7 +
 arch/arm/include/asm/arch-sunxi/cpu_sun50i_h6.h    |    4 +
 arch/arm/include/asm/arch-sunxi/dram.h             |    2 +
 arch/arm/include/asm/arch-sunxi/dram_sun50i_a133.h |  230 ++++
 arch/arm/mach-sunxi/Kconfig                        |  114 +-
 arch/arm/mach-sunxi/Makefile                       |    2 +
 arch/arm/mach-sunxi/board.c                        |    4 +
 arch/arm/mach-sunxi/clock_sun50i_h6.c              |    3 +-
 arch/arm/mach-sunxi/cpu_info.c                     |    2 +
 arch/arm/mach-sunxi/dram_sun50i_a133.c             | 1204 ++++++++++++++++++++
 arch/arm/mach-sunxi/dram_timings/Makefile          |    2 +
 arch/arm/mach-sunxi/dram_timings/a133_ddr4.c       |   80 ++
 arch/arm/mach-sunxi/dram_timings/a133_lpddr4.c     |  102 ++
 board/sunxi/MAINTAINERS                            |   10 +
 board/sunxi/board.c                                |    4 +-
 common/spl/Kconfig                                 |    4 +-
 configs/liontron-h-a133l_defconfig                 |   37 +
 configs/yuzukihd-chameleon_defconfig               |   30 +
 dts/upstream/src/arm64/allwinner/sun50i-a100.dtsi  |    3 +
 .../allwinner/sun50i-a133-liontron-h-a133l.dts     |  211 ++++
 .../allwinner/sun50i-h618-yuzukihd-chameleon.dts   |  222 ++++
 22 files changed, 2263 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm/include/asm/arch-sunxi/dram_sun50i_a133.h
 create mode 100644 arch/arm/mach-sunxi/dram_sun50i_a133.c
 create mode 100644 arch/arm/mach-sunxi/dram_timings/a133_ddr4.c
 create mode 100644 arch/arm/mach-sunxi/dram_timings/a133_lpddr4.c
 create mode 100644 configs/liontron-h-a133l_defconfig
 create mode 100644 configs/yuzukihd-chameleon_defconfig
 create mode 100644 dts/upstream/src/arm64/allwinner/sun50i-a133-liontron-h-a133l.dts
 create mode 100644 dts/upstream/src/arm64/allwinner/sun50i-h618-yuzukihd-chameleon.dts
