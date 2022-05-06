Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00CEA5B
	for <linux-sunxi@lists.linux.dev>; Fri,  6 May 2022 17:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C090C385A8;
	Fri,  6 May 2022 17:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651856541;
	bh=DUmBSMBO+YjF8O5rG8Uwm6n1B0rRX46v4PPFKryIJhI=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=BMd5tymAMwgIvPGBxpTCYckAQ9JAKJbFLcUN0Nk8WdAxopb3c0xDYlCv31iKGS4hl
	 0OokVXcbqrxftfRxfwZaVHmjhenPgcg4xQlchMNiZIhWo6x9+WAuTiE+3T6VJ4kzFj
	 b/BVJYoyeMjsKqGi6xecUZ+Wd2n/9sifQkIJvJ2gRpP9D70o72jWH0Er0tn6462Yxv
	 HlU6+38j/Y2mvsDNmmG3seGHWh0n35xrp05ShFHGwgKEAKVxvsUQewiIVTlIisjhIa
	 ODNxWc1UWJh5K660om/beZwbtgiPmRvRCVxR5DPrpvpZ56N9zOCqwsf0ReM1ITXGHz
	 VO3cbuQOq8rmA==
Date: Fri, 6 May 2022 19:02:17 +0200
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner DT changes for 5.19
Message-ID: <YnVUmSLE1MZFkApt@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following DT changes for 5.19.

Best regards,
Jernej

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-5.19-1

for you to fetch changes up to 50612cf9e05d111c21e84096e50a31d0c35d5825:

  arm64: dts: allwinner: teres-i: Add GPIO port regulators (2022-05-03 19:00:24 +0200)

----------------------------------------------------------------
- F1C100 improvements (SPI, MMC, timer, cpu, watchdog)
- SPI flash node for licheepi-nano
- enabled analogue audio on olinuxino-a64
- GPIO port regulators on teres-i

----------------------------------------------------------------
Andre Przywara (9):
      dt-bindings: watchdog: sunxi: fix F1C100s compatible
      dt-bindings: watchdog: sunxi: clarify clock support
      ARM: dts: suniv: F1C100: fix watchdog compatible
      dt-bindings: arm: sunxi: document LicheePi Nano name
      ARM: dts: suniv: F1C100: fix CPU node
      ARM: dts: suniv: F1C100: fix timer node
      dt-bindings: spi: sunxi: document F1C100 controllers
      ARM: dts: suniv: F1C100: add SPI support
      ARM: dts: suniv: licheepi-nano: add SPI flash

Harald Geyer (1):
      arm64: dts: allwinner: teres-i: Add GPIO port regulators

Jesse Taube (3):
      ARM: dts: suniv: F1C100: add clock and reset macros
      ARM: dts: suniv: F1C100: add MMC controllers
      ARM: dts: suniv: licheepi-nano: add microSD card

Philip Rinn (1):
      arm64: dts: allwinner: a64: olinuxino: Enable audio

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
 .../bindings/spi/allwinner,sun6i-a31-spi.yaml      |   1 +
 .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml |  24 ++---
 arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts  |  31 ++++++
 arch/arm/boot/dts/suniv-f1c100s.dtsi               | 104 +++++++++++++++++++--
 .../boot/dts/allwinner/sun50i-a64-olinuxino.dts    |  30 ++++++
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts      |   8 ++
 7 files changed, 178 insertions(+), 25 deletions(-)
