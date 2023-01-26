Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91601173
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jan 2023 04:57:38 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 8C2295C013C;
	Wed, 25 Jan 2023 23:57:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 25 Jan 2023 23:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1674709057; x=1674795457; bh=1AV7+tKxCnaIrwhMWoEs1PWFI
	x0nCKGXy0BDPsy2f4g=; b=STDsQzj0bJLwPDRBXF5j/HZBXl9m0ysK2UojW1RDO
	933BtriP9ncRv8j8FI6QQgCHy5GLLD2yOewpxa1GuGemupLyB4swP/MZ1GZzvoeM
	wTwli04Gz5U4C8RJVm21SbCCJhYmJoojB5FNuPt8fIAfJd3kECF9qjfB4g5kTkIw
	Ol0KEsb6wOqoa5jbt/5y2yu3f4i4jnbyQzH8VlYA9y0pXVOSRj9n1MxxD8FocUT3
	irb5fopLmW16ungbuD95gYY5m/QRk9/G8vkvsUszjNGaW5YjsVWIojblylMbHsyG
	gUB4zq66HluwQBsw8cOsBeorFlYmidMNsSSNoyllnd1SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1674709057; x=1674795457; bh=1AV7+tKxCnaIrwhMWoEs1PWFIx0nCKGXy0B
	DPsy2f4g=; b=Lty/DH7XsXFIzp0XwlA5QmxND0IfHheyoy/UYgyN3gUc0f2/JZF
	DFvOFj3CUQa6dHJHD4jXxINMp+Gc/0bWc3jkdo1H85NKmOtmvyh8AoFw6JD/UCS8
	UtjBq7JtuCYrpQIba5Tym7P1XrGf9LNAVgfn5oK8jwtjAsySFPsS7/gvP6AwE8e1
	kgv9kZg8ic8m2sp/qUj6pRKxMCF7S1dj3zsjI75YtGfC+J2tIVNDxaX1Jul6osI1
	LH/NqSykBJ7snICPknb/Pc4ivL52fp7c6VXrjlaWzCe20dRqfW+DxArRlS7l8av2
	r4esibNKmbL4az4qD+qTqLhv0wfqmp6hriQ==
X-ME-Sender: <xms:QAjSY-aK3dJlsL9T0W6tmoX1lk-rDem2pc2kKwLE82B_o1KE50wslw>
    <xme:QAjSYxbkHJtNZEiLRrKJ9Aizm5qrmvtDSAFLsI2oHxcIXw9C1DM2NuWLbPx156d7A
    2gZxFExhhrormFWZg>
X-ME-Received: <xmr:QAjSY4854U-lDNXe4gIl7NIfukKXNNbIUbxrtekpm90pKxjaf8bzmX0bjkkekSdNF0oHcqxYz6jWLq3zav5J3VOowXbqDTq34Ev0oHFWNgNtMZEcycKN90PcJM87qywisHsHXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvfedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepkeevlefhjeeuleeltedvjedvfeefteegleehueejffehgffffeekhefh
    hfekkeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:QAjSYwpoU7Mfv7cr01k06J_BTN_HGwgVkACh0NT6ePcQDAV6eq8ihA>
    <xmx:QAjSY5oMeBvb1tWa8r99QSiuwketYaS6lMBIvHQZkc5CYaIxQfDVfA>
    <xmx:QAjSY-RVTjhqC4tfsRUojMWne6TzedFErAJ3EFn5uZYQcqnfYxwnSw>
    <xmx:QQjSY67cc6ZJv0DIfD7ZA5eh0x73xBwdO5yhdSHe5SxWhtFU6TwM3A>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jan 2023 23:57:36 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev
Cc: linux-riscv@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v5 00/11] riscv: Allwinner D1/D1s platform support
Date: Wed, 25 Jan 2023 22:57:27 -0600
Message-Id: <20230126045738.47903-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the Kconfig/defconfig plumbing and devicetrees for a
range of Allwinner D1 and D1s-based boards. Many features are already
enabled, including USB, Ethernet, and WiFi.

This version drops all boards/nodes with missing YAML bindings, so at
least some support can get merged for v6.3.

$ make ARCH=riscv CROSS_COMPILE=riscv64-linux-musl- dtbs_check
  LINT    Documentation/devicetree/bindings
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb
  DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb
  DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb
  DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dtb
  DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dtb
  DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dtb
  DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb
  DTC_CHK arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb
$

Note that validation requires dt-schema v2022.12 or newer.

I thoroughly tested earlier versions of this series (DMIC, Ethernet,
LEDs, MMC, PMIC, touch, and USB, where available) on several boards.
v4/v5 have trivial changes, and I boot-tested them on sun20i-d1-nezha.

Changes in v5:
 - Drop system LDOs because the binding is still not merged
 - Drop the configuration for LDOA and LDOB
 - Drop the ClockworkPi and DevTerm DTS, since it needs the system LDOs

Changes in v4:
 - Rebase on v6.2-rc1 + soc2arch-immutable
 - Drop the now-redundant 'select SIFIVE_PLIC'

Changes in v3:
 - Drop dummy DCXO clock-frequency property
 - Decrease the PLIC's riscv,ndev property to 175
 - Fix `make W=1 dtbs` warnings (unnecessary #address/#size-cells)
 - Drop mmc aliases
 - Change LED_FUNCTION_BACKLIGHT to LED_FUNCTION_STATUS (the backlight
   regulator is disconnected by default, so this is a standalone LED)
 - Fix `make W=1 dtbs` warnings (missing reg properties)
 - ARCH_SUNXI depends on MMU && !XIP_KERNEL

Changes in v2:
 - Add MangoPi MQ (non-Pro) board
 - Split into separate files for sharing with D1s/R528/T113
 - Use SOC_PERIPHERAL_IRQ macro for interrupts
 - Rename osc24M to dcxo and move the frequency to the board DTs
 - Drop analog LDOs due to the missing binding
 - Correct tcon_top DSI clock reference
 - Add DMIC, DSI controller, and DPHY (bindings are in linux-next)
 - Add CPU OPP table
 - Common regulators moved to MangoPi MQ patch, removed analog LDOs
 - Removed LRADC (depends on analog LDOs)
 - Added XR829 host-wake interrupt
 - Added DMIC sound card to Lichee RV dock and Lichee RV 86 Panel
 - Removed LRADC (depends on analog LDOs)
 - Added LED (GPIO shared between onboard LED and backlight regulator)
 - Sort Kconfig as if we had done s/SOC_/ARCH_/ for future-proofing

Samuel Holland (11):
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
  riscv: defconfig: Enable the Allwinner D1 platform and drivers

 .../devicetree/bindings/riscv/sunxi.yaml      |  69 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
 MAINTAINERS                                   |   2 +-
 arch/riscv/Kconfig.socs                       |   9 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/allwinner/Makefile        |   9 +
 .../allwinner/sun20i-common-regulators.dtsi   |  28 +
 .../sun20i-d1-dongshan-nezha-stu.dts          | 117 +++
 .../sun20i-d1-lichee-rv-86-panel-480p.dts     |  29 +
 .../sun20i-d1-lichee-rv-86-panel-720p.dts     |  10 +
 .../sun20i-d1-lichee-rv-86-panel.dtsi         | 119 +++
 .../allwinner/sun20i-d1-lichee-rv-dock.dts    |  97 ++
 .../dts/allwinner/sun20i-d1-lichee-rv.dts     |  87 ++
 .../allwinner/sun20i-d1-mangopi-mq-pro.dts    | 142 +++
 .../boot/dts/allwinner/sun20i-d1-nezha.dts    | 166 ++++
 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi  |  66 ++
 .../dts/allwinner/sun20i-d1s-mangopi-mq.dts   | 128 +++
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi |  76 ++
 .../boot/dts/allwinner/sunxi-d1-t113.dtsi     |  15 +
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 826 ++++++++++++++++++
 arch/riscv/configs/defconfig                  |  22 +-
 21 files changed, 2020 insertions(+), 2 deletions(-)
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

-- 
2.37.4

