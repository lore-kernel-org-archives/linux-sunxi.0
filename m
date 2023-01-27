Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E998E522D
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Jan 2023 23:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1890FC433EF;
	Fri, 27 Jan 2023 23:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674861166;
	bh=vi3ZceZ3pdycR5rTiwDSs/5+2rD75k7VH5lgfUIbptA=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=YbaUhqpKdngLsbSwgYJWuaXhdfmANiryUbhyAK1UkKq3KKLCCFEznCKHfANg6PWjz
	 Eii5JiZN2xfluUambcNLdM7ZploaXZO+qFsLAxnF9/Eg2HzhBmooVslExmLuYOaQRK
	 WxTIu+CEWnYb40SCvzUAsSsaOAmZ4HbpRJjOMzREe/MYDEbaXfmpaDGbrT/fBgj1xX
	 sI/fI6FLDAnF3qKe6lKQOuPUQYyGPVQnEb8rvjFTNJuVZLrQ8rpO8AhZ6uePGmeypW
	 G8clVxC/voShPESveYFkZs041paJ2B6+KSsp8WJhxEUOI+EzODaGmOjEK7t0J28YgI
	 iWP84gu3aUCCg==
Date: Sat, 28 Jan 2023 00:12:42 +0100
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner device tree changes for 6.3
Message-ID: <Y9Raak4mhdtL0L8e@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following device tree changes for 6.3. Note that this PR
depends on following immutable tag:

https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git soc2arch-immutable

Let me know if I should split this PR into two, one for ARM and another
for RISC-V.

Best regards,
Jernej

The following changes since commit 3af577f9826fdddefac42b35fc5eb3912c5b7d85:

  RISC-V: stop directly selecting drivers for SOC_CANAAN (2022-12-27 18:01:40 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.3-1

for you to fetch changes up to dca36f7b3dd7eb574f0958484d3d21cfd8af2651:

  riscv: dts: allwinner: d1: Add power controller node (2023-01-27 23:21:06 +0100)

----------------------------------------------------------------
- introduce Allwinner D1 DTSI
- add boards: Dongshan Nezha STU, MangoPi MQ (Pro), Sipeed Lichee RV,
  Nezha
- add D1 power controller node
- Add SATA regulator to Bananapi M3
- fix regulator reference for nanopi-duo2
- fix GPIO node names
- align HDMI CEC node name for h3-beelink-x2
- add DPHY interrupt to A64 and A33

----------------------------------------------------------------
Andre Przywara (1):
      ARM: dts: sun8i: a83t: bananapi-m3: describe SATA disk regulator

Krzysztof Kozlowski (1):
      ARM: dts: sun8i: h3-beelink-x2: align HDMI CEC node names with dtschema

Samuel Holland (15):
      ARM: dts: sun8i: a33: Add DPHY interrupt
      arm64: dts: allwinner: a64: Add DPHY interrupt
      ARM: dts: sunxi: Fix GPIO LED node names
      ARM: dts: sun8i: nanopi-duo2: Fix regulator GPIO reference
      MAINTAINERS: Match the sun20i family of Allwinner SoCs
      dt-bindings: vendor-prefixes: Add Allwinner D1/D1s board vendors
      dt-bindings: riscv: Add Allwinner D1/D1s board compatibles
      riscv: dts: allwinner: Add the D1/D1s SoC devicetree
      riscv: dts: allwinner: Add MangoPi MQ devicetree
      riscv: dts: allwinner: Add Allwinner D1 Nezha devicetree
      riscv: dts: allwinner: Add Sipeed Lichee RV devicetrees
      riscv: dts: allwinner: Add MangoPi MQ Pro devicetree
      riscv: dts: allwinner: Add Dongshan Nezha STU devicetree
      riscv: Add the Allwinner SoC family Kconfig option
      riscv: dts: allwinner: d1: Add power controller node

 Documentation/devicetree/bindings/riscv/sunxi.yaml |  69 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 MAINTAINERS                                        |   2 +-
 arch/arm/boot/dts/sun5i-gr8-chip-pro.dts           |   2 +-
 arch/arm/boot/dts/sun5i-r8-chip.dts                |   2 +-
 arch/arm/boot/dts/sun6i-a31s-sina31s.dts           |   2 +-
 arch/arm/boot/dts/sun8i-a33.dtsi                   |   1 +
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts       |  15 +
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts          |   2 +-
 arch/arm/boot/dts/sun8i-h3-nanopi-duo2.dts         |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |   1 +
 arch/riscv/Kconfig.socs                            |   9 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/allwinner/Makefile             |   9 +
 .../dts/allwinner/sun20i-common-regulators.dtsi    |  28 +
 .../dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts | 117 +++
 .../sun20i-d1-lichee-rv-86-panel-480p.dts          |  29 +
 .../sun20i-d1-lichee-rv-86-panel-720p.dts          |  10 +
 .../allwinner/sun20i-d1-lichee-rv-86-panel.dtsi    | 119 +++
 .../dts/allwinner/sun20i-d1-lichee-rv-dock.dts     |  97 +++
 .../boot/dts/allwinner/sun20i-d1-lichee-rv.dts     |  87 +++
 .../dts/allwinner/sun20i-d1-mangopi-mq-pro.dts     | 142 ++++
 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts  | 166 ++++
 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi       |  66 ++
 .../boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts   | 128 ++++
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi      |  76 ++
 arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi   |  15 +
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi  | 834 +++++++++++++++++++++
 28 files changed, 2029 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/sunxi.yaml
 create mode 100644 arch/riscv/boot/dts/allwinner/Makefile
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts
 create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
 create mode 100644 arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
 create mode 100644 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
