Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8A52ECD0A
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Aug 2025 10:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754996188; cv=none; b=sijAcVS36Ka91u4XXyH3TNEq85nB4gBcLsmc8fB+IUKw7x6Mkt5k6jrokE7EC7160Lpq18gghPiKAeuTwjGc1dQ3eMux/97Za77a8jaw69aD/R7c8WqIZybYLfUBBQnolPLAqZJFkOy5+g+5HJ7iU5amzLJ/vWpesaPV1uH+XYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754996188; c=relaxed/simple;
	bh=qTHHtUA/A2HE7xxnbG6ePuhVeiiquEG5xMw2t3BFPes=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YSlY+K7u6HIByN4bXnV2UXvXiLNuk6Vw+yd3amNhB0J/G/QJ9MCz+aohjcC+ax3DvOwHu8Shs9yXBpv0NOOcMq93eOv6ukllfHTixlHYuMRJ23X7wCQnzqP8EAQ5cdf52dxiZK3WkdDofL685J2y9eb/WVbSNIhe9Dz5lfln3GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18E171A32;
	Tue, 12 Aug 2025 03:56:18 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 037653F63F;
	Tue, 12 Aug 2025 03:56:24 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <contact@paulk.fr>,
	Eric Anderson <ejona86@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: [GIT PULL] u-boot-sunxi/master for v2025.10
Date: Tue, 12 Aug 2025 11:56:05 +0100
Message-Id: <20250812105605.1344927-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tom,

please pull these sunxi changes into v2025.10. It's mostly smaller fixes,
and some additions that were dependent on recent DT updates:
We switch the S3/V3/V3s over to OF_UPSTREAM, the DTs were already
identical anyway. While at it, Paul sent more fixes for this SoC, I am
pulling in two easy fixes that were ready and low risk. Apart from other
assorted fixes, this PR also enables Ethernet on the new A527/T527 boards,
made possible by the DT update from the DT rebasing repository.

This passed the CI, and was boot tested on boards with Allwinner A10, A20,
A33, V40, A80, A83T, T113s3, F1C100s, H3, A64, H6, H616, A133 and T527 SoCs.

Thanks,
Andre

===========================================================
The following changes since commit acfacf452441d0a659e3afbd55fd6061aa17e647:

  Prepare v2025.10-rc2 (2025-08-11 13:47:46 -0600)

are available in the Git repository at:

  https://source.denx.de/u-boot/custodians/u-boot-sunxi.git master

for you to fetch changes up to 553c5a69a5f1e36c8c6cd654e48601322979b8fb:

  sunxi: H616: dram: fix LPDDR3 mode register settings (2025-08-12 00:50:57 +0100)

----------------------------------------------------------------
Andre Przywara (5):
      pinctrl: sunxi: a523: change Ethernet pin function name
      sunxi: a527: radxa/avaota: enable Ethernet
      sunxi: a133: dram: fix data type for address variable
      sunxi: spl: initialise timer before clocks
      sunxi: H616: dram: fix LPDDR3 mode register settings

Eric Anderson (1):
      sunxi: Enable SPL/SPI boot for OLinuXino Lime2

Paul Kocialkowski (3):
      sunxi: Switch V3/V3s device-tree source to OF_UPSTREAM
      sunxi: Kconfig: Fix default order for V3s DRAM clock
      sunxi: pinecube: Enable EMAC and network support

 arch/arm/dts/Makefile                         |   5 -
 arch/arm/dts/sun8i-s3-elimo-impetus.dtsi      |  44 --
 arch/arm/dts/sun8i-s3-elimo-initium.dts       |  29 --
 arch/arm/dts/sun8i-s3-lichee-zero-plus.dts    |  53 ---
 arch/arm/dts/sun8i-s3-pinecube.dts            | 228 ---------
 arch/arm/dts/sun8i-v3-sl631-imx179.dts        |  12 -
 arch/arm/dts/sun8i-v3-sl631.dtsi              | 138 ------
 arch/arm/dts/sun8i-v3.dtsi                    |  63 ---
 arch/arm/dts/sun8i-v3s-anbernic-rg-nano.dts   | 276 -----------
 arch/arm/dts/sun8i-v3s-licheepi-zero-dock.dts | 105 -----
 arch/arm/dts/sun8i-v3s-licheepi-zero.dts      | 101 ----
 arch/arm/dts/sun8i-v3s.dtsi                   | 656 --------------------------
 arch/arm/mach-sunxi/Kconfig                   |   3 +-
 arch/arm/mach-sunxi/board.c                   |   2 +-
 arch/arm/mach-sunxi/dram_sun50i_a133.c        |   2 +-
 arch/arm/mach-sunxi/dram_sun50i_h616.c        |  12 +-
 configs/A20-OLinuXino-Lime2_defconfig         |   1 +
 configs/LicheePi_Zero_defconfig               |   3 +-
 configs/avaota-a1_defconfig                   |   2 +
 configs/pinecube_defconfig                    |   4 +-
 configs/radxa-cubie-a5e_defconfig             |   2 +
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         |   2 +-
 22 files changed, 19 insertions(+), 1724 deletions(-)
 delete mode 100644 arch/arm/dts/sun8i-s3-elimo-impetus.dtsi
 delete mode 100644 arch/arm/dts/sun8i-s3-elimo-initium.dts
 delete mode 100644 arch/arm/dts/sun8i-s3-lichee-zero-plus.dts
 delete mode 100644 arch/arm/dts/sun8i-s3-pinecube.dts
 delete mode 100644 arch/arm/dts/sun8i-v3-sl631-imx179.dts
 delete mode 100644 arch/arm/dts/sun8i-v3-sl631.dtsi
 delete mode 100644 arch/arm/dts/sun8i-v3.dtsi
 delete mode 100644 arch/arm/dts/sun8i-v3s-anbernic-rg-nano.dts
 delete mode 100644 arch/arm/dts/sun8i-v3s-licheepi-zero-dock.dts
 delete mode 100644 arch/arm/dts/sun8i-v3s-licheepi-zero.dts
 delete mode 100644 arch/arm/dts/sun8i-v3s.dtsi
