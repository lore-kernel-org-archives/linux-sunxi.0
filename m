Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC597A
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Jul 2022 18:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B034C341C0;
	Fri,  8 Jul 2022 18:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657306285;
	bh=VR8FPPMpBY+pTYliZgtPIoY/ab888J8I4dJXTJHYwnU=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=iljhaRGFuPhBHzhpih0w+FveDgytaXwI/HMNFBV7ojfhcsn7omGv7MAtue7cyfwZZ
	 Q5s7S1vfqjJO8lKO9ihDsILObilih+ZfcbZBcux7Xhi9tmI2BFakfopVMQcY/WCAQl
	 ePoQ2RLXzBidXI4ZtU5W4yIIehZSE9E3qikDTbbN32qw9ZqRKQbCEUJfMIbjshE9ix
	 IaFKAtuZbi2hBQENFrWeKgOBDtKRq3msQzZYdmMyUuKsOuMv8LedE8feVD++QCDRlC
	 DocQIUqRBf9gzTFEEm1Vltl68nMRJe0lfeZ5hjQPuTi0RtXJXmpNfxjcZTdYedO6py
	 thHkY3aEe5MlQ==
Date: Fri, 8 Jul 2022 20:51:21 +0200
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner device tree changes for 5.20
Message-ID: <Ysh8qRH0Q5Xv9Qhf@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull follwing device tree changes for 5.20. Note that last commit
aab941b8c3cf ("arm64: dts: allwinner: pinephone: Enable internal HMIC
bias") relies on property for which dt bindings change is going through
asoc tree. I hope that's not a problem.

Best regards,
Jernej

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-5.20-1

for you to fetch changes up to aab941b8c3cfb020baf2218e9e39706e05bf4877:

  arm64: dts: allwinner: pinephone: Enable internal HMIC bias (2022-07-08 18:52:08 +0200)

----------------------------------------------------------------
- whitespace fixes
- replaced RTC indexes with constants
- gpio-key nodes aligned with dtschema
- fixed LED node for Orange Pi Win
- added OPP table for R40 CPU and thermal points
- updated I2C controller compatibles
- added compatibles for MBUS, D1 DE2 clocks, D1 USB
- enable internal HMIC bias on Pinephone

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: dts: sun5i: adjust whitespace around '='
      arm64: dts: allwinner: align gpio-key node names with dtschema
      ARM: dts: allwinner: align gpio-key node names with dtschema

Samuel Holland (12):
      ARM: dts: sunxi: Use constants for RTC clock indexes
      arm64: dts: allwinner: Use constants for RTC clock indexes
      dt-bindings: clock: Add compatible for D1 DE2 clocks
      arm64: dts: allwinner: a64: orangepi-win: Fix LED node name
      dt-bindings: i2c: mv64xxx: Add variants with offload support
      arm64: dts: allwinner: a100: Update I2C controller fallback
      dt-bindings: usb: sunxi-musb: Add Allwinner D1 compatible
      dt-bindings: usb: generic-ehci: Add Allwinner D1 compatible
      dt-bindings: usb: generic-ohci: Add Allwinner D1 compatible
      dt-bindings: arm: sunxi: Default to the full MBUS binding
      dt-bindings: arm: sunxi: Add several MBUS compatibles
      arm64: dts: allwinner: pinephone: Enable internal HMIC bias

qianfan Zhao (3):
      ARM: dts: sun8i-r40: Add "cpu-supply" node for sun8i-r40 based board
      ARM: dts: sun8i-r40: add opp table for cpu
      ARM: dts: sun8i-r40: Add thermal trip points/cooling maps

 .../arm/sunxi/allwinner,sun4i-a10-mbus.yaml        | 24 +++++++---
 .../clock/allwinner,sun8i-a83t-de2-clk.yaml        |  3 ++
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml          | 10 ++++-
 .../bindings/usb/allwinner,sun4i-a10-musb.yaml     |  1 +
 .../devicetree/bindings/usb/generic-ehci.yaml      |  1 +
 .../devicetree/bindings/usb/generic-ohci.yaml      |  1 +
 arch/arm/boot/dts/sun4i-a10-inet9f-rev03.dts       | 40 ++++++++---------
 arch/arm/boot/dts/sun4i-a10-pcduino.dts            |  6 +--
 arch/arm/boot/dts/sun5i-a13-licheepi-one.dts       |  6 +--
 arch/arm/boot/dts/sun6i-a31.dtsi                   | 12 ++---
 arch/arm/boot/dts/sun7i-a20-pcduino3.dts           |  6 +--
 arch/arm/boot/dts/sun8i-a23-a33.dtsi               |  8 ++--
 .../boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts    |  8 ++--
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts          |  6 +--
 arch/arm/boot/dts/sun8i-h3-mapleboard-mp130.dts    |  6 +--
 arch/arm/boot/dts/sun8i-h3-nanopi-duo2.dts         |  8 ++--
 arch/arm/boot/dts/sun8i-h3-nanopi-neo-air.dts      |  2 +-
 arch/arm/boot/dts/sun8i-h3-nanopi-r1.dts           |  4 +-
 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi             |  4 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts          |  6 +--
 arch/arm/boot/dts/sun8i-h3-orangepi-lite.dts       |  4 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-one.dts        |  4 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts         |  4 +-
 arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts       |  4 +-
 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts  |  5 +++
 arch/arm/boot/dts/sun8i-r40-cpu-opp.dtsi           | 52 ++++++++++++++++++++++
 arch/arm/boot/dts/sun8i-r40-feta40i.dtsi           |  5 +++
 arch/arm/boot/dts/sun8i-r40.dtsi                   | 44 ++++++++++++++++--
 arch/arm/boot/dts/sun8i-t3-cqa3t-bv3.dts           |  5 +++
 arch/arm/boot/dts/sun8i-v3s.dtsi                   |  6 ++-
 arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts  |  5 +++
 arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi      |  8 ++--
 arch/arm/boot/dts/sunxi-h3-h5-emlid-neutis.dtsi    |  4 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                 | 13 +++---
 arch/arm/boot/dts/sunxi-libretech-all-h3-cc.dtsi   |  4 +-
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     |  6 +++
 .../dts/allwinner/sun50i-a64-amarula-relic.dts     |  2 +-
 .../boot/dts/allwinner/sun50i-a64-bananapi-m64.dts |  4 +-
 .../boot/dts/allwinner/sun50i-a64-nanopi-a64.dts   |  2 +-
 .../boot/dts/allwinner/sun50i-a64-orangepi-win.dts |  6 +--
 .../boot/dts/allwinner/sun50i-a64-pinebook.dts     |  4 +-
 .../dts/allwinner/sun50i-a64-pinephone-1.0.dts     |  4 ++
 .../dts/allwinner/sun50i-a64-pinephone-1.1.dts     |  4 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      | 10 +++--
 .../boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts |  4 +-
 .../boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts  |  4 +-
 .../dts/allwinner/sun50i-h5-orangepi-prime.dts     |  4 +-
 .../boot/dts/allwinner/sun50i-h6-orangepi-3.dts    |  4 +-
 .../dts/allwinner/sun50i-h6-orangepi-lite2.dts     |  4 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi |  2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       | 12 ++---
 51 files changed, 283 insertions(+), 122 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun8i-r40-cpu-opp.dtsi
