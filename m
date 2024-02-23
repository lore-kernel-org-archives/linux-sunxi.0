Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CC285265
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Feb 2024 21:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708722252; cv=none; b=NNylmsVFpzUg/k4lAf/ABLUz/1Hmcc2jM+bRdY1S+BIbtffuaE/765MZi8Ae5tew9hPBbQdXtf0dtG08/m8IvHrx+PbvFDJYhpnft/XmPm+n1yj+k2uFD+tp+lIopkBmucQJuJVIpezoQ6xGb+2DZK7/RmRXWJoeuCpfqOQoxds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708722252; c=relaxed/simple;
	bh=Dvr3RS4CtEmLQbVnCXOVnxhJwcHZMsjrUAXywuI9zDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M7A33HUlT2LHfPjsUP9Ce2DnzZacRghPNptJATlNZR+acTA0Esd/SqHyh6JDUFjnaSfvhBkB8yWmtiNGSPxkpirTKAQTNeARwXu1lFSBOPO5b8fmDpfeUKYijk4aOy7WhRuVj7xiFSRk1QB43516P1ZSRY5lbZCQjdJoycbmwI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVVg786V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVVg786V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC2AC433F1;
	Fri, 23 Feb 2024 21:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708722252;
	bh=Dvr3RS4CtEmLQbVnCXOVnxhJwcHZMsjrUAXywuI9zDA=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=HVVg786VePdlCHjJT9WANqoGOR70aaoZIAzkd+R3jaSfmd6UdugzS6OPgSsPrUq3l
	 VyO2EEHdo+WRbcTO9NUjZD/UjpFJ8aXvFocOpAcJtymBH+pW8R9+eeDwkynhEvlgLg
	 W+T97MU27RkM8+kphriiTmMy+u1eFYOXPPOQBe8rusJPDnxEbQWJn6TveMUH4+TpeI
	 2ow1AAqBESCh7aaPaQpS2FlkMMYGNokKItC41SZYBZQwwzqsh8PS0l46DRRdk4uWiC
	 fSRkVFGDSbsAC/IIGvccnw+YSI2ixd3U1RxuqAK2AWkumyKlguihknDvq0aZa4mpHC
	 qCQYQI3hkwiYQ==
Date: Fri, 23 Feb 2024 22:04:08 +0100
From: Jernej Skrabec <jernej@kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner device tree changes for 6.9
Message-ID: <20240223210408.GA9248@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following device tree changes for 6.9.

Note that this is based on top of fixes for 6.8:
https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-6.8-1

Best regards,
Jernej

The following changes since commit cbec657208bdd4bff4ff31cac5924aa18817027c:

  arm64: dts: allwinner: h616: Add Orange Pi Zero 2W to Makefile (2024-02-23 21:02:51 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.9-1

for you to fetch changes up to f4318af40544b8e7ff5a6b667ede60e6cf808262:

  arm64: dts: allwinner: h616: Add thermal sensor and zones (2024-02-23 21:38:21 +0100)

----------------------------------------------------------------
- new H616 peripherals: SPDIF, DMA, THS
- H616 fanout pin configuration
- H6 SPDIF node update
- minor cleanups
- enabled regulator on FETA40i board
- added wifi to Transpeed 8K618-T board
- new boards: Jide Remix Mini PC, Sipeed Longan Module 3H and
  Longan Pi 3H

----------------------------------------------------------------
Andre Przywara (5):
      dt-bindings: vendor-prefixes: add Jide
      dt-bindings: arm: sunxi: document Remix Mini PC name
      arm64: dts: allwinner: Add Jide Remix Mini PC support
      arm64: dts: allwinner: h616: Add 32K fanout pin
      arm64: dts: allwinner: Transpeed 8K618-T: add WiFi nodes

Chen-Yu Tsai (3):
      arm64: dts: allwinner: h6: Add RX DMA channel for SPDIF
      arm64: dts: allwinner: h616: Add DMA controller and DMA channels
      arm64: dts: allwinner: h616: Add SPDIF device node

Fuyao Kashizuku (1):
      ARM: dts: sun8i: Open FETA40i-C regulator aldo1

Jisheng Zhang (2):
      dt-bindings: arm: sunxi: Add Sipeed Longan Module 3H and Longan Pi 3H
      arm64: dts: allwinner: h616: Add Sipeed Longan SoM 3H and Pi 3H board support

Krzysztof Kozlowski (3):
      dt-bindings: sram: narrow regex for unit address to hex numbers
      arm64: dts: allwinner: use capital "OR" for multiple licenses in SPDX
      arm64: dts: allwinner: h616: minor whitespace cleanup

Martin Botka (1):
      arm64: dts: allwinner: h616: Add thermal sensor and zones

 Documentation/devicetree/bindings/arm/sunxi.yaml   |  12 +
 .../sram/allwinner,sun4i-a10-system-control.yaml   |   2 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/allwinner/sun8i-r40-feta40i.dtsi |   7 +
 arch/arm64/boot/dts/allwinner/Makefile             |   2 +
 .../boot/dts/allwinner/sun50i-h6-beelink-gs1.dts   |   2 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi |   2 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |   7 +-
 .../sun50i-h616-bigtreetech-cb1-manta.dts          |   2 +-
 .../dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi |   4 +-
 .../dts/allwinner/sun50i-h616-bigtreetech-pi.dts   |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 155 +++++++++
 .../allwinner/sun50i-h618-longan-module-3h.dtsi    |  75 +++++
 .../boot/dts/allwinner/sun50i-h618-longanpi-3h.dts | 144 +++++++++
 .../allwinner/sun50i-h618-transpeed-8k618-t.dts    |  23 ++
 .../dts/allwinner/sun50i-h64-remix-mini-pc.dts     | 356 +++++++++++++++++++++
 16 files changed, 788 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-longan-module-3h.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts
