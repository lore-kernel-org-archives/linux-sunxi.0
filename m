Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758072C9D
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Dec 2021 09:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18BCC36AE1;
	Fri, 17 Dec 2021 09:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639733788;
	bh=4kY/PQRXV0BIQNdA4zUqk26o6qvZsLW1dr7i/Q+Oewk=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=AVpittejpCf9JHWPNGTWJDYFxALhb7dthbTOhH6wLUcQOrp0PijhyZrzPUAYL7Wpe
	 nphQRckGwrMGNsIoOOt6a4YuARpaw4p/X1GipENbaPiW+PMbFIetKRROe3lu3ETT7B
	 /6yORUrJ9+yM8zAfXI6W0BEUYLo78GhoHKMu5iLAq7qPBimw9phY3R/UpX/12ZoPFz
	 wcm2crJnenTPp5AkmvOO9tyXkfgEuaosqEYQJSjUzQDbzn7hc+7ZBoR3xUeHzDe4Cq
	 /i/57Avv1PpVl7Szrp1fZ6V8wO1nSPOLHKj4SlvS3rGwbAHK0TyJEJQPxawOcfr1rj
	 V78pHS97qMCvg==
Date: Fri, 17 Dec 2021 10:36:25 +0100
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Device Tree Changes for 5.17
Message-ID: <ef385139-6fd4-42d2-9bfe-a4dda7ac76c9.lettre@localhost>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aGiJq1V+8pfxen2B"
Content-Disposition: inline


--aGiJq1V+8pfxen2B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-dt-for-5.17-1

for you to fetch changes up to 0baddea60e8d536fd240008882128fc32eda74d6:

  arm64: dts: allwinner: h6: Add Hantro G2 node (2021-12-16 08:47:17 +0100)

----------------------------------------------------------------
Our usual round of DT patches for the 5.17 merge window, with:
  - Introduction of the chassis-type property
  - I2C, SPDIF support for the Tanix TX6
  - Memory frequency scaling for the A64 and H5
  - Hantro G2 support for the H6
  - New Board: Tanix TX6 Mini

----------------------------------------------------------------
Arnaud Ferraris (1):
      arm64: dts: allwinner: add 'chassis-type' property

Jernej Skrabec (13):
      arm64: dts: allwinner: h6: tanix-tx6: Add SPDIF
      arm64: dts: allwinner: h6: tanix-tx6: Add I2C node
      ARM: dts: sun8i: h3: beelink-x2: Sort nodes
      arm64: dts: allwinner: a64: Add CEC clock to HDMI
      ARM: dts: sunxi: Add CEC clock to DW-HDMI
      ARM: dts: sun8i: h3: beelink-x2: Add GPIO CEC node
      ARM: dts: sun8i: Adjust power key nodes
      arm64: dts: allwinner: h6: tanix-tx6: Split to DT and DTSI
      dt-bindings: arm: sunxi: Add Tanix TX6 mini
      arm64: dts: allwinner: h6: Add Tanix TX6 mini dts
      arm64: dts: allwinner: h6: tanix: Add MMC1 node
      arm64: dts: allwinner: h6: tanix-tx6: Enable bluetooth
      arm64: dts: allwinner: h6: Add Hantro G2 node

Maxime Ripard (1):
      dt-bindings: crypto: Add optional dma properties

Samuel Holland (5):
      dt-bindings: clock: sunxi: Export CLK_DRAM for devfreq
      dt-bindings: arm: sunxi: Expand MBUS binding
      dt-bindings: arm: sunxi: Add H5 MBUS compatible
      ARM: dts: sunxi: h3/h5: Update MBUS node
      arm64: dts: allwinner: a64: Update MBUS node


 Documentation/devicetree/bindings/arm/sunxi.yaml                          |   5 ++-
 Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml |  91 +++++++++++++++++++++++++++++++++++++--
 Documentation/devicetree/bindings/crypto/allwinner,sun4i-a10-crypto.yaml  |  10 ++++-
 arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts                      |   3 +-
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts                                 |  34 ++++++++------
 arch/arm/boot/dts/sun8i-h3-nanopi.dtsi                                    |   1 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-2.dts                                 |   3 +-
 arch/arm/boot/dts/sun8i-h3-orangepi-pc.dts                                |   3 +-
 arch/arm/boot/dts/sun8i-h3.dtsi                                           |   4 ++-
 arch/arm/boot/dts/sun8i-r40.dtsi                                          |   4 +-
 arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi                             |   3 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                                        |  15 ++++--
 arch/arm/boot/dts/sunxi-libretech-all-h3-cc.dtsi                          |   1 +-
 arch/arm64/boot/dts/allwinner/Makefile                                    |   1 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts                     |   1 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi                   |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts                      |   1 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts                      |   1 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi                             |  14 ++++--
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi                              |   4 ++-
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6-mini.dts                |  15 ++++++-
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts                     | 138 ++++------------------------------------------------------
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi                        | 189 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi                              |   9 ++++-
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h                                     |   2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.h                                       |   2 +-
 include/dt-bindings/clock/sun50i-a64-ccu.h                                |   2 +-
 include/dt-bindings/clock/sun8i-h3-ccu.h                                  |   2 +-
 28 files changed, 394 insertions(+), 166 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6-mini.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi



--aGiJq1V+8pfxen2B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYbxaGQAKCRDj7w1vZxhR
xX1OAQC3chinGhLlbclv3UBzpXJxq1fwMxNTMF/uhQQA/r1CZwEA381zHuZPJT1D
JrsPT0ALfrh8s3ULzi+5Nz1QSIwlgAs=
=qCN6
-----END PGP SIGNATURE-----

--aGiJq1V+8pfxen2B--
