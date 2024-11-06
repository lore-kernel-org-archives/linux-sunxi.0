Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2EB190075
	for <linux-sunxi@lists.linux.dev>; Wed,  6 Nov 2024 15:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730908574; cv=none; b=qdLNN3gF59kd4VZD40vC2ffaF7qv7crsVeK1OnRMZRsS/lzsinez6a3gWSISCDLYMSvZpGVp7qzm87FpZ1iTmnS8d9I0OTQ+uCYzH1j0Isj0KiPeg1eewSOtzAcfgYMrOYnQbgFuQl4oJSkAzWr9EXO3/HAFTFJeSpT/8jbdR8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730908574; c=relaxed/simple;
	bh=o+O3AVjyw4V0rGoTz6Alsf+x7tFbW7A4EL9HlfoJqaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s/6llMD/EUoDQNgHlKVahc/6QvMgqKvpHZPO1FvkaspitdxxtX7poh+pH9dfkOmLflydC1OQgcSv2t2pa20woqixa/SMf47GPvzlk/9I20+9Z8gAKuH6czHCWtHQvhYTaLa0sHrHdvWCEciW0gEzrbcJRShBUZLSETxfUeWf1CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z3+2ebY6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z3+2ebY6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11AFC4CEC6;
	Wed,  6 Nov 2024 15:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730908574;
	bh=o+O3AVjyw4V0rGoTz6Alsf+x7tFbW7A4EL9HlfoJqaA=;
	h=Date:From:To:Cc:Subject:From;
	b=Z3+2ebY6w98hFl22Dlpx0YoZDGuyU9K2I1Pc1MYfgKZpQWGvgqkw8Q4mDrRhcBszg
	 6+S/jrIxqfL4kIaVrPNuXLpZGugxzycRK4t/K+YESAz1Ffxriy5jCeW8tMEM1eCPQ5
	 Zy39+Q4vaSW6EMZfaiD5JUkrRdnPBIN5rHJs1N/dA42py1faG++/69LLJWukthLhJG
	 i8gSbHueRHx0AGUxGvtnMAcuxoX4tE2SAIrLVy73Y2e/R6S5nASDMwCeEsnRCq/QIZ
	 N8ndc4S7rmGYQSqkgTD4xYsbdE5jk1KpUr+VfdHB8skEYRbuYR8L/y7dRdS68h2YtS
	 UN41G7KkHjo6A==
Received: by wens.tw (Postfix, from userid 1000)
	id 374985F8BA; Wed,  6 Nov 2024 23:56:11 +0800 (CST)
Date: Wed, 6 Nov 2024 23:56:11 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner device tree changes for 6.13 part 1
Message-ID: <ZyuRm-gvJX_12NMA@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V50nwjhcp48BVPt5"
Content-Disposition: inline


--V50nwjhcp48BVPt5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-dt-for-6.13-1

for you to fetch changes up to fcfbb8d9ec584c256c0a6e1ae3174a21b007f399:

  arm64: allwinner: a100: Add MMC related nodes (2024-11-02 19:32:40 +0800)

A second pull request will likely be sent by the end of the week or
early next week, once a couple stragglers are run through linux-next.

----------------------------------------------------------------
Allwinner device tree changes for 6.13 part 1

- Enabled audio codec for all H313/H616/H618/H700 boards
- Added audio codec node for H616 SoC
- Set disable-wp on MMC controllers with micro SD card slots
- Added RerVision A33-Vstar board
- Added A100 compatible string to USB and PHY bindings
- Added MMC, USB, PMU and watchdog device nodes for Allwinner A100 SoC

----------------------------------------------------------------
Cody Eksal (3):
      dt-bindings: phy: sun50i-a64: add a100 compatible
      dt-bindings: usb: Add A100 compatible string
      dt-bindings: usb: sunxi-musb: Add A100 compatible string

Icenowy Zheng (2):
      dt-bindings: arm: sunxi: document RerVision A33-Vstar board
      ARM: dts: sunxi: add support for RerVision A33-Vstar board

Kry=C5=A1tof =C4=8Cern=C3=BD (1):
      arm64: dts: allwinner: Add disable-wp for boards with micro SD card

Ryan Walklin (2):
      arm64: dts: allwinner: h616: Add audio codec node
      arm64: dts: allwinner: h313/h616/h618/h700: Enable audio codec for al=
l supported boards

Yangtao Li (4):
      arm64: dts: allwinner: A100: Add PMU mode
      arm64: dts: allwinner: a100: add watchdog node
      arm64: dts: allwinner: a100: add usb related nodes
      arm64: allwinner: a100: Add MMC related nodes

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   6 +
 .../bindings/phy/allwinner,sun50i-a64-usb-phy.yaml |  10 +-
 .../bindings/usb/allwinner,sun4i-a10-musb.yaml     |   1 +
 .../devicetree/bindings/usb/generic-ehci.yaml      |   1 +
 .../devicetree/bindings/usb/generic-ohci.yaml      |   1 +
 arch/arm/boot/dts/allwinner/Makefile               |   1 +
 .../boot/dts/allwinner/sun8i-a33-vstar-core1.dtsi  |  96 ++++++++++
 arch/arm/boot/dts/allwinner/sun8i-a33-vstar.dts    | 205 +++++++++++++++++=
++++
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     | 185 +++++++++++++++++=
+-
 .../boot/dts/allwinner/sun50i-h313-tanix-tx1.dts   |   5 +
 .../dts/allwinner/sun50i-h5-nanopi-neo-plus2.dts   |   1 +
 .../boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts   |   1 +
 .../boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts |   1 +
 .../boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts  |   1 +
 .../dts/allwinner/sun50i-h5-orangepi-prime.dts     |   1 +
 .../dts/allwinner/sun50i-h5-orangepi-zero-plus.dts |   1 +
 .../allwinner/sun50i-h5-orangepi-zero-plus2.dts    |   1 +
 .../boot/dts/allwinner/sun50i-h6-beelink-gs1.dts   |   1 +
 .../boot/dts/allwinner/sun50i-h6-orangepi-3.dts    |   1 +
 .../boot/dts/allwinner/sun50i-h6-orangepi.dtsi     |   1 +
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts      |   1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi |   1 +
 .../dts/allwinner/sun50i-h616-orangepi-zero.dtsi   |   6 +
 .../boot/dts/allwinner/sun50i-h616-x96-mate.dts    |   6 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  44 +++--
 .../boot/dts/allwinner/sun50i-h618-longanpi-3h.dts |   1 +
 .../dts/allwinner/sun50i-h618-orangepi-zero2w.dts  |   5 +
 .../allwinner/sun50i-h618-transpeed-8k618-t.dts    |   6 +
 .../allwinner/sun50i-h700-anbernic-rg35xx-2024.dts |  13 +-
 29 files changed, 581 insertions(+), 23 deletions(-)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a33-vstar-core1.dtsi
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a33-vstar.dts

--V50nwjhcp48BVPt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmcrkZoACgkQOJpUIZwP
JDDPcBAAo1ztG2mpEqv60U3/VvivQib4VmMPKoQMn91NMsvM/yIjw1OhqeqeUwcJ
LrPdSaWl1sxtIsp+6RZG8431DJzzMqXIIVX03T3kkz6Rc3mSq3BfAW7PbCDAwFZO
yEIFDIwIp5jFn6qLpdrvK+CXitvzP0VK4j3jikLjISTJffNsv5wz7rfRb6HLF0iZ
drSMEVa3HK2gKHDjHOlVKRQXWU1RQUcsj8clOmuoPbJZ774ywwoFSkGm3c5qQn+q
9lTQOLDpO8Y91+qMNv0Bf03k4cJYRaLSYEFkZpOguQVAuC3n2Pvb9S8YCVis0OvD
pRYNJK1JYNA52WAHQUkmT3vm06tJTlyea3hAsU84Omn4h42cByIRek74vw/Hnw7j
rJXa0Vmwuso/ck1+1mDnBo9WMTszRryV4xAJFBcz/X86m7HBX62jMI4fkTISSaf6
PevDApsjus3Z/KBTH3cbpQVcVUZft3wLjmXKjdqOmw3qzne9c2QgXVQTlM50QjH4
It27+69a2xoG8SAKl/29TrgCRf3Y6thWfu8xL0bMin76n3uaPbMVn1fqDheK27q1
5yA5IFESDsqLDPCFJ2Sc8WqDoan1QSp8Kjj6jSptYYsxb1cHlU9pGXB7Cj/SqCIB
eZDWoP0JoLQOEYKAm2jCtScfABmLiAoR3wdq3Q7e/wc3BdyzQsM=
=AEf3
-----END PGP SIGNATURE-----

--V50nwjhcp48BVPt5--
