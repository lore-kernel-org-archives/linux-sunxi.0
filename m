Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253CE72
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Jun 2021 14:56:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F64B60200;
	Fri, 11 Jun 2021 14:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623423390;
	bh=v49eswYzfxOiuLNJPex6gAUkVcyyd2R58vfPRyLPLgw=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=SXiX4EzoEu2tnFdWUn6dU6wz/FndQ9NUUxRYRfBtp+mcM3tsWmTHeqDfhScpoZszc
	 iIY5PwQ6qvIMKKn8ZjNIHY6VliwsOki1toOs0nZeYiZO5RtH/qYOMuHgMbeZPjuT2C
	 pghRxc9XquYWoyIvby8NMdjr1v1XdBqzjFGtU9+EzTOWTz9azqoHgBs4PIvLWo6W/M
	 jJLXKNEqePXUQLcmNAXpQhaTFPsWKBtkYtrFVAJzFKwN88D3gFdBsOA1thuUA0hWjq
	 cwQWzjzuR/Ta/gka2CgIsmtyQk38qs4ZnDkpnQw4dNJJhY/NVvWSNM/UFn6WofagFa
	 pxk3wfz0qs3ng==
Date: Fri, 11 Jun 2021 16:56:28 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Device Tree Changes for 5.14
Message-ID: <96cc77ec-139d-4685-8a66-a60964cf39fd.lettre@localhost>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nLrvI0CrUDil1gM+"
Content-Disposition: inline


--nLrvI0CrUDil1gM+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-dt-for-5.14-1

for you to fetch changes up to d42b3e045a34ec7c88c818ee057f7c2ecc8f9fdd:

  ARM: dts: sun8i: v3s: enable emac for zero Dock (2021-05-31 11:43:03 +0200)

----------------------------------------------------------------
Our usual bunch of patches to improve the Allwinner SoCs support,
mainly:
  - I2S Support for the V3
  - Audio Codec Support for the V3s
  - DMA support for the V3s
  - PWM support for the V3s
  - Support for Bluetooth Audio on the pinephone
  - Add A10-like timers to the A64 and R40
  - New boards: Forlinx OKA40i-C, Forlinx OKA40i-C, NanoPi R1S H5

----------------------------------------------------------------
Andreas Rehn (1):
      ARM: dts: sun8i: v3s: enable emac for zero Dock

Arnaud Ferraris (1):
      arm64: dts: allwinner: pinephone: Set audio card name

Chukun Pan (2):
      dt-bindings: arm: Add NanoPi R1S H5
      arm64: dts: allwinner: h5: Add NanoPi R1S H5 support

Ivan Uvarov (5):
      ARM: dts: sun8i: r40: add /omit-if-no-ref/ to pinmux nodes for UARTs 0&3
      ARM: dts: sun8i: r40: add pinmux settings for MMC3 and UARTs 2, 4, 5&7
      dt-bindings: add compatible vendor prefix for Forlinx
      dt-bindings: arm: add compatible for Forlinx OKA40i-C and FETA40i-C
      ARM: dts: sun8i: r40: add devicetree for Forlinx FETA40i-C & OKA40i-C

Jernej Skrabec (1):
      ARM: dts: sun8i: r40: Add timer node

Samuel Holland (10):
      dt-bindings: timer: Simplify conditional expressions
      dt-bindings: timer: Add compatibles for sun50i timers
      arm64: dts: allwinner: a64: Sort watchdog node
      arm64: dts: allwinner: Add sun4i MMIO timer nodes
      ASoC: dt-bindings: sun8i-codec: Increase #sound-dai-cells
      ARM: dts: sun8i-a33: Allow using multiple codec DAIs
      arm64: dts: allwinner: a64: Allow using multiple codec DAIs
      arm64: dts: allwinner: a64: Add pinmux nodes for AIF2/AIF3
      arm64: dts: allwinner: a64: Allow multiple DAI links
      arm64: dts: allwinner: pinephone: Add support for Bluetooth audio

Tobias Schramm (9):
      dt-bindings: pwm: allwinner: add v3s pwm compatible
      ARM: dts: sun8i: v3s: add pwm controller to v3s dts
      ARM: dts: sun8i: v3s: add DMA controller to v3s dts
      ARM: dts: sun8i: v3s: add DMA properties to peripherals supporting DMA
      ARM: dts: sun8i: v3s: add analog codec and frontend to v3s dts
      ASoC: dt-bindings: sun8i-a23-codec-analog: add compatible for Allwinner V3
      ARM: dts: sun8i: V3: add codec analog frontend to V3 dts
      dt-bindings: sound: sun4i-i2s: add Allwinner V3 I2S compatible
      ARM: dts: sun8i: V3: add I2S interface to V3 dts


 Documentation/devicetree/bindings/arm/sunxi.yaml                              |  11 ++++-
 Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml            |   3 +-
 Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml          |   3 +-
 Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml |   9 ++--
 Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml        |   8 ++-
 Documentation/devicetree/bindings/timer/allwinner,sun4i-a10-timer.yaml        |  42 +++++++----------
 Documentation/devicetree/bindings/vendor-prefixes.yaml                        |   2 +-
 arch/arm/boot/dts/Makefile                                                    |   1 +-
 arch/arm/boot/dts/sun8i-a33.dtsi                                              |   4 +-
 arch/arm/boot/dts/sun8i-r40-feta40i.dtsi                                      | 106 ++++++++++++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/sun8i-r40-oka40i-c.dts                                      | 203 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/sun8i-r40.dtsi                                              |  56 ++++++++++++++++++++++-
 arch/arm/boot/dts/sun8i-v3.dtsi                                               |  31 ++++++++++++-
 arch/arm/boot/dts/sun8i-v3s-licheepi-zero-dock.dts                            |  17 +++++--
 arch/arm/boot/dts/sun8i-v3s.dtsi                                              |  48 +++++++++++++++++++-
 arch/arm64/boot/dts/allwinner/Makefile                                        |   1 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi                       |  25 ++++++++++-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi                                 |  62 +++++++++++++++++-------
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts                     | 195 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi                                  |   9 ++++-
 20 files changed, 784 insertions(+), 52 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun8i-r40-feta40i.dtsi
 create mode 100644 arch/arm/boot/dts/sun8i-r40-oka40i-c.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts



--nLrvI0CrUDil1gM+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYMN5nAAKCRDj7w1vZxhR
xaNeAP4uB8ewTq3aQaH1eQKgE74woJec7ZNJerdJBjlpWkA/3wD9EItGOeOXILoi
3YpNZCjKXr2vIPbkvfq+OcY1EFXahQM=
=YXlM
-----END PGP SIGNATURE-----

--nLrvI0CrUDil1gM+--
