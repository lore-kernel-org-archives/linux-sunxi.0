Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62942C2F8
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Apr 2023 12:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F174C433D2;
	Sat,  8 Apr 2023 12:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680958321;
	bh=t2cV3pWQB/RnAF/elwKV9OHBVQZQkp6dQdvYKbNrxQQ=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=h6f6l6QNYBIb34sMdraIEbi67lWnU5hW5b8mFJH3OzP7Yd7+ivpWvcW+TrGg5I32p
	 QRvtdhKMHwkBr5VnvF0D3vzGgRTqjR4p+MO9nwY5Tg3xtNbSpYcs0grea5vrXOrzpX
	 EDXjK3FVGQP9i75kZK8OI4zhqr9YTPS9+uw/j8Y3l9ImpsT/+B3ZVYXpodrFxmQeTx
	 DwAmtZjrrnFdHPmwCB3ZdZ1gJcfRGrs+GfGVVUz+Dm2GdrtUmbhoncjZxvhU0dQwgj
	 VjHfCRD8QXuys3OfoB13GiCpXi4IvXmp7PhsvbRKcnamIGeOZToYpy7IfAboMN6AAY
	 Dv6qr6eeQYqNg==
Date: Sat, 8 Apr 2023 14:51:56 +0200
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner device tree changes for 6.4
Message-ID: <20230408125156.GA17050@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following DT changes for 6.4.

Best regards,
Jernej

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.4-1

for you to fetch changes up to a140b18f0cc79f5c302ecedbde8364d49effa67f:

  riscv: dts: allwinner: d1: Switch dma-names order for snps,dw-apb-uart nodes (2023-04-08 14:34:29 +0200)

----------------------------------------------------------------
- added D1 crypto node
- enabled DVFS on OrangePi PC2 board
- added GPIO line names on Nezha D1 board
- added suniv USB nodes and enabled on licheepi-nano
- new suniv boards: PopStick v1.1 and Lctech Pi
- added Allwinner T113-s DTSI
- added MangoPi MQ-R T113-s board variant
- swapped DMA names for A23, A31, A33, D1, H3, H5, V3s

----------------------------------------------------------------
Andre Przywara (6):
      arm64: dts: allwinner: h5: OrangePi PC2: add OPP table to enable DVFS
      ARM: dts: suniv: Add Lctech Pi F1C200s devicetree
      dts: add riscv include prefix link
      ARM: dts: sunxi: add Allwinner T113-s SoC .dtsi
      dt-bindings: arm: sunxi: document MangoPi MQ-R board names
      ARM: dts: sunxi: add MangoPi MQ-R-T113 board

Cristian Ciocaltea (5):
      ARM: dts: sun6i: a31: Switch dma-names order for snps,dw-apb-uart nodes
      ARM: dts: sun8i: a23/a33: Switch dma-names order for snps,dw-apb-uart nodes
      ARM: dts: sun8i: v3s: Switch dma-names order for snps,dw-apb-uart nodes
      ARM: dts: sunxi: h3/h5: Switch dma-names order for snps,dw-apb-uart nodes
      riscv: dts: allwinner: d1: Switch dma-names order for snps,dw-apb-uart nodes

Icenowy Zheng (5):
      ARM: dts: suniv: add USB-related device nodes
      ARM: dts: suniv: licheepi-nano: enable USB
      dt-bindings: vendor-prefixes: add Source Parts and Lctech names
      dt-binding: arm: sunxi: add two board compatible strings
      ARM: dts: suniv: add device tree for PopStick v1.1

Samuel Holland (1):
      riscv: dts: allwinner: d1: Add crypto engine node

Trevor Woerner (1):
      riscv: dts: nezha-d1: add gpio-line-names

 Documentation/devicetree/bindings/arm/sunxi.yaml   |  18 +++
 Documentation/devicetree/bindings/riscv/sunxi.yaml |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 arch/arm/boot/dts/Makefile                         |   5 +-
 arch/arm/boot/dts/sun6i-a31.dtsi                   |  12 +-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi               |  10 +-
 .../arm/boot/dts/sun8i-t113s-mangopi-mq-r-t113.dts |  35 ++++++
 arch/arm/boot/dts/sun8i-t113s.dtsi                 |  59 ++++++++++
 arch/arm/boot/dts/sun8i-v3s.dtsi                   |   6 +-
 arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts  |  16 +++
 arch/arm/boot/dts/suniv-f1c100s.dtsi               |  32 ++++++
 arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts      |  76 +++++++++++++
 arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts  |  81 +++++++++++++
 arch/arm/boot/dts/sunxi-d1s-t113-mangopi-mq-r.dtsi | 126 +++++++++++++++++++++
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                 |   8 +-
 .../boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts  |   1 +
 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts  |  72 ++++++++++++
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi  |  24 +++-
 scripts/dtc/include-prefixes/riscv                 |   1 +
 19 files changed, 566 insertions(+), 25 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun8i-t113s-mangopi-mq-r-t113.dts
 create mode 100644 arch/arm/boot/dts/sun8i-t113s.dtsi
 create mode 100644 arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts
 create mode 100644 arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
 create mode 100644 arch/arm/boot/dts/sunxi-d1s-t113-mangopi-mq-r.dtsi
 create mode 120000 scripts/dtc/include-prefixes/riscv
