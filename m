Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F69420B02
	for <linux-sunxi@lists.linux.dev>; Fri, 13 Oct 2023 19:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eieYSk+X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58102C433C7;
	Fri, 13 Oct 2023 19:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697226128;
	bh=yFjcgfyV87BKrvcHoDa+1ShbWAW68Ug14kruJEKcHPM=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=eieYSk+Xxu7RVN4fIy437leAx7jmwvO1bjGm3FblMym8CcowHpdfhg6w3zAyvx5sW
	 /3j5Yatp4Y5AWgi17RApBo5O8D6p6xfFJbI0tiLmGSlYZyBtaI5fbuE1qrotZYBSWb
	 4/vP9NSQmaDVlEwWRZhiKBzg3VIUNf80AeyoeNZGRNKK0RWveioeI1LopDggbLCUjV
	 Vw2SuZtZR/zzK1GxdkKG2aa3hS0QvX+YdyOnmIYPCgUzwCHFgL7UgaT7ggwx/Uf+TG
	 wow1LL/ZSMeLUYbZlQXG4nTzIb+iD48aVEdSi89VXnJq8dO/07a5iJF5eCFUJEKXqD
	 q1JaQ2xLdj86A==
Date: Fri, 13 Oct 2023 21:42:03 +0200
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner device tree changes for 6.7
Message-ID: <20231013194203.GA2155816@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following device tree changes for 6.7.

Best regards,
Jernej

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.7-1

for you to fetch changes up to c3f7c14856ebbeb8e9e19439b9f5ec66f88744b9:

  riscv: dts: allwinner: convert isa detection to new properties (2023-10-13 21:19:25 +0200)

----------------------------------------------------------------
- Added V3s nodes for PWM pinctrl, EHCI and OHCI
- RISC-V DT cleanups
- Added new ISA property and PMU node to Allwinner D1
- Added interconnect to R40 video codec node
- New boards: Anbernic RG-Nano, BigTreeTech Pi, BigTreeTech CB1 SOM

----------------------------------------------------------------
Chris Morgan (4):
      arm: dts: sun8i: V3s: Add pinctrl for pwm
      ARM: dts: sun8i: v3s: add EHCI and OHCI to v3s dts
      dt-bindings: arm: sunxi: add Anbernic RG-Nano
      ARM: dts: sunxi: add support for Anbernic RG-Nano

Conor Dooley (2):
      riscv: dts: allwinner: remove address-cells from intc node
      riscv: dts: allwinner: convert isa detection to new properties

Inochi Amaoto (1):
      riscv: dts: allwinner: d1: Add PMU event node

Jernej Skrabec (1):
      ARM: dts: sun8i-r40: Add interconnect to video-codec

Krzysztof Kozlowski (1):
      riscv: dts: use capital "OR" for multiple licenses in SPDX

Martin Botka (6):
      dt-bindings: nvmem: SID: Add binding for H616 SID controller
      arm64: dts: allwinner: h616: Add SID controller node
      dt-bindings: vendor-prefixes: Add BigTreeTech
      dt-bindings: arm: sunxi: Add BigTreeTech boards
      arm64: dts: allwinner: h616: Add BigTreeTech CB1 SoM & boards support
      arm64: dts: allwinner: h616: Add BigTreeTech Pi support

 Documentation/devicetree/bindings/arm/sunxi.yaml   |  16 ++
 .../bindings/nvmem/allwinner,sun4i-a10-sid.yaml    |   4 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/allwinner/Makefile               |   1 +
 arch/arm/boot/dts/allwinner/sun8i-r40.dtsi         |   2 +
 .../dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts   | 276 +++++++++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi         |  35 +++
 arch/arm64/boot/dts/allwinner/Makefile             |   2 +
 .../sun50i-h616-bigtreetech-cb1-manta.dts          |  35 +++
 .../dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi | 138 +++++++++++
 .../dts/allwinner/sun50i-h616-bigtreetech-pi.dts   |  63 +++++
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |   7 +
 .../dts/allwinner/sun20i-common-regulators.dtsi    |   2 +-
 .../dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts |   2 +-
 .../sun20i-d1-lichee-rv-86-panel-480p.dts          |   2 +-
 .../sun20i-d1-lichee-rv-86-panel-720p.dts          |   2 +-
 .../allwinner/sun20i-d1-lichee-rv-86-panel.dtsi    |   2 +-
 .../dts/allwinner/sun20i-d1-lichee-rv-dock.dts     |   2 +-
 .../boot/dts/allwinner/sun20i-d1-lichee-rv.dts     |   2 +-
 .../dts/allwinner/sun20i-d1-mangopi-mq-pro.dts     |   2 +-
 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts  |   2 +-
 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi       |   2 +-
 .../boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts   |   2 +-
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi      |  45 +++-
 arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi   |   2 +-
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi  |   2 +-
 26 files changed, 636 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
