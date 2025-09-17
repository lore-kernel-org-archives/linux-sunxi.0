Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF2028312D;
	Wed, 17 Sep 2025 17:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758129596; cv=none; b=Ck4wyXszp4Ah3dyPjZk7NpNQkM6MwBx5SEsEpGzINIEs4g098u2B28qWoEg/sUveQgQMx8ltoxhshzDjvqBXhbCd2Vpvr3yw10tG7AYLCeEaA94cvMJ4bMINjJtrScUxp1cHgec2cmKhq5yL6xkVQqechZYQzYaEvsEULHLNlyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758129596; c=relaxed/simple;
	bh=PaQc8EUNl7CQtcyysbGlpZNQUgJZzBiTvE4agvsSPa8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EJ947JVBXcEggflKdKPgv7Iil1IaED8r3fiEep3Bl1feq/lTMlhLdu//BOc+44F/gEh/CNaLFhuLfVFbgLikSwyqPc92vckfbPdoasjiOVttUHmph+Wa6EEBQxkg5NbvRlDLsD1SNb921WMNz0NpFW7Nh+GVvmZdTYFwHDO/1qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4kufLm3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4kufLm3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8B5C4CEE7;
	Wed, 17 Sep 2025 17:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758129595;
	bh=PaQc8EUNl7CQtcyysbGlpZNQUgJZzBiTvE4agvsSPa8=;
	h=Date:From:To:Cc:Subject:From;
	b=R4kufLm3DABZvpjbm0zHczD0JiihXYiw4z07kFCIgX0wrm/yZ13NQcOc7ZOcwlQ9n
	 QOJxC5nD9L/yAnbtJWY/fkcoLbZ/mqotCWfKxP7gUumrj58/lgm5riTHGXI9Qejj9a
	 uWLzIY2U6noLvIRjSZpIrCof6+7sxvYuBaPQKb/3LDGZlRc22DGnVWiWpqrEgLTjhU
	 BUxN+z+if1W2BrB6JnBYiuDzNSPdbu1pJXcKT8o54zaO+A007t6U5bN7zDbR1UaTIN
	 18TTBCLKVOGw5bD10waxcHETpLOGLRXNJrzC8yS657QXwDK8NnEhskRA9Iiv187ZZi
	 xiW/v9ckPrERg==
Received: by wens.tw (Postfix, from userid 1000)
	id 9FF465FDA7; Thu, 18 Sep 2025 01:19:53 +0800 (CST)
Date: Thu, 18 Sep 2025 01:19:53 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [GIT PULL] Allwinner Device Tree changes for 6.18
Message-ID: <aMrtuZg8HlR--TAt@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.18

for you to fetch changes up to cca07ac2b5f7838b8ff612b53b9f82ac8cb58312:

  arm64: dts: allwinner: sun55i: Complete AXP717A sub-functions (2025-09-15 00:04:32 +0800)

----------------------------------------------------------------
Allwinner Device Tree changes for 6.18

This tag contains two DT binding header changes that are shared with
the clk tree.

In this cycle we gained support for the MCU PRCM clock and reset
controller on the A523/A527/T527 family of SoCs, the NPU which is a
Vivante GC9000 IP block, and the NPU clock that was missing. The other
PRCM clock controller gained default bus clock rate settings. These
were not configured in the upstream U-boot bootloader, leading to them
running at slower rates. The assigned rates are from the user manual.

There is also a new board, the NetCube Systems Nagami SoM and two of
its carrier boards.

The A523 family development boards now have their internal RTC clocks
configured correctly, so that the RTC does not drift wildly. The missing
functions for the AXP717 on these boards are added. Missing reset GPIOs
and delays for Ethernet PHYs are added. Last, the Cubie A5E now has its
LEDs described and usable.

An overlay for the Orange Pi Zero interface (addon) board was added.
This can be used with the Orange Pi Zero and Zero Plus 2. Default audio
routing for these two boards (to be used with the addon) were added to
complement the overlay.

----------------------------------------------------------------
Chen-Yu Tsai (13):
      arm64: dts: allwinner: a527: cubie-a5e: Add LEDs
      arm64: dts: allwinner: a527: cubie-a5e: Add ethernet PHY reset setting
      arm64: dts: allwinner: t527: avaota-a1: Add ethernet PHY reset setting
      dt-bindings: clock: sun55i-a523-ccu: Add missing NPU module clock
      dt-bindings: clock: sun55i-a523-ccu: Add A523 MCU CCU clock controller
      Merge branch 'sunxi/shared-dt-headers-for-6.18' into sunxi/dt-for-6.18
      arm64: dts: allwinner: a523: Add MCU PRCM CCU node
      arm64: dts: allwinner: a523: Add NPU device node
      arm64: dts: sun55i: a523: Assign standard clock rates to PRCM bus clocks
      arm64: dts: allwinner: a527: cubie-a5e: Drop external 32.768 KHz crystal
      arm64: dts: allwinner: t527: avaota-a1: hook up external 32k crystal
      arm64: dts: allwinner: t527: orangepi-4a: hook up external 32k crystal
      arm64: dts: allwinner: sun55i: Complete AXP717A sub-functions

J. Neuschäfer (3):
      ARM: dts: allwinner: orangepi-zero: Add default audio routing
      ARM: dts: allwinner: orangepi-zero-plus2: Add default audio routing
      ARM: dts: allwinner: Add Orange Pi Zero Interface Board overlay

Lukas Schmid (5):
      dt-bindings: arm: sunxi: Add NetCube Systems Nagami SoM and carrier board bindings
      riscv: dts: allwinner: d1s-t113: Add pinctrl's required by NetCube Systems Nagami SoM
      ARM: dts: sunxi: add support for NetCube Systems Nagami SoM
      ARM: dts: sunxi: add support for NetCube Systems Nagami Basic Carrier
      ARM: dts: sunxi: add support for NetCube Systems Nagami Keypad Carrier

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   8 +
 .../bindings/clock/allwinner,sun55i-a523-ccu.yaml  |  37 ++-
 arch/arm/boot/dts/allwinner/Makefile               |  10 +
 .../dts/allwinner/sun8i-h2-plus-orangepi-zero.dts  |  14 ++
 .../dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts |  14 ++
 .../sun8i-orangepi-zero-interface-board.dtso       |  46 ++++
 .../sun8i-t113s-netcube-nagami-basic-carrier.dts   |  67 ++++++
 .../sun8i-t113s-netcube-nagami-keypad-carrier.dts  | 129 +++++++++++
 .../dts/allwinner/sun8i-t113s-netcube-nagami.dtsi  | 250 +++++++++++++++++++++
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     |  41 ++++
 .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts   |  46 +++-
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts   |  34 +++
 .../boot/dts/allwinner/sun55i-t527-orangepi-4a.dts |  31 +++
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi  |  48 ++++
 include/dt-bindings/clock/sun55i-a523-ccu.h        |   1 +
 include/dt-bindings/clock/sun55i-a523-mcu-ccu.h    |  54 +++++
 include/dt-bindings/reset/sun55i-a523-mcu-ccu.h    |  30 +++
 17 files changed, 853 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-orangepi-zero-interface-board.dtso
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-basic-carrier.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi
 create mode 100644 include/dt-bindings/clock/sun55i-a523-mcu-ccu.h
 create mode 100644 include/dt-bindings/reset/sun55i-a523-mcu-ccu.h
