Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34591320385
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jan 2026 17:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769103840; cv=none; b=AhgRyokhqTfL9FLEgnsCfLlwO29HygG7BAiXqs3L/ESxPKxQEj40w0Oap4WzBab+gA6dXs9uc5w9t3Z5HYShRmBak38RUSNJkvsFY0ZoIyzEPuGTovUgMzQgpg1HJ4NEcVCMh55JxTqXB2xhjWCN5pxy4FZucl49skkPuXUDaLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769103840; c=relaxed/simple;
	bh=wbRigpjM8ddoQDGvi5G72zIe79wSife/9VBP5HYvlkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AVQaWNUD9W5F+ATznUgaW4JybVjBjTtgEqgoUceSiYc9qXDjdUoGcVHg/sC6bbnrWCkXsJIlxDNnTzHN+vn5W6ozwBc0KwfejBEdGVorpc7Z1hCswr95rXT9Z9R+zEFG2yggmbyWGUWuOzba9+TLdB2pAFd6NjoYcMiIexrBCMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0rjVAo8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0rjVAo8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDA8C116C6;
	Thu, 22 Jan 2026 17:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769103838;
	bh=wbRigpjM8ddoQDGvi5G72zIe79wSife/9VBP5HYvlkQ=;
	h=Date:From:To:Cc:Subject:From;
	b=b0rjVAo8lp0Tq/aoSqiafnJGQXFrBmA1VCu3hS0/sDVf4yKqvNQxExS76DJUIjOBA
	 Vsf+BXzsVoEfyXWbxO4jjmQEJQlaJ1b14FEN/Cquux8zfoQ+Z1n161z/s330bEKv8s
	 ekr5BTDlIVm1ue8RIJOueXCudSYfgGiWRNpi/0GlpN8YIefJW1W8rlic0PSl52cCQa
	 9WPGPXdS3iIL7gCNq0jvHYUG7j3Q343dHDKsWGxGYzInmEe2oo/OLGVzffwKIQj9YT
	 cZ3EINk3576foSnkoVAnB/7P5CsawKexcoHhOdU2fWzi5Q/3O9a+/76pJpYwzhegkk
	 +De6HBnsTmGtg==
Received: by wens.tw (Postfix, from userid 1000)
	id C73305FBF7; Fri, 23 Jan 2026 01:43:55 +0800 (CST)
Date: Fri, 23 Jan 2026 01:43:55 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner Device Tree Changes for 6.20
Message-ID: <aXJh2xBXDWFFREMX@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wG/y4cY9mUj2iJDb"
Content-Disposition: inline


--wG/y4cY9mUj2iJDb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.20

for you to fetch changes up to f36e738549d483878ebf4cc9826c46d9dc4aa496:

  riscv: dts: allwinner: d1: Add CPU thermal sensor and zone (2026-01-22 22:40:20 +0800)

----------------------------------------------------------------
Allwinner device tree changes for 6.20

Not many changes this cycle.

- The A523 family of SoCs gained support for SPI controllers.
- Some cleanup of old ARM device tree files to fix DT binding validation
  errors.
- D1 and A100 SoCs gained support for their LED controller. This was
  from a couple years ago. The driver made it in, but the DT patches
  were missed.
- D1 and T113 SoCs gained support for the internal thermal sensor.

----------------------------------------------------------------
Alex Studer (1):
      riscv: dts: allwinner: d1: Add CPU thermal sensor and zone

Chen-Yu Tsai (4):
      arm64: dts: allwinner: sun55i: Add SPI controllers
      arm64: dts: allwinner: t527: orangepi-4a: Enable SPI-NOR flash
      ARM: dts: allwinner: sun5i-a13-utoo-p66: delete "power-gpios" property
      ARM: dts: allwinner: Replace status "failed" with "fail"

Samuel Holland (3):
      arm64: dts: allwinner: a100: Add LED controller node
      riscv: dts: allwinner: d1: Add LED controller node
      riscv: dts: allwinner: d1: Add RGB LEDs to boards

 .../dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts   |  2 +-
 .../dts/allwinner/sun4i-a10-pov-protab2-ips9.dts   |  2 +-
 arch/arm/boot/dts/allwinner/sun5i-a13-utoo-p66.dts |  1 +
 .../boot/dts/allwinner/sun6i-a31-hummingbird.dts   |  2 +-
 arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts |  2 +-
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi       | 33 ++++++++
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     | 14 ++++
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     | 94 ++++++++++++++++++++++
 .../boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 15 ++++
 .../dts/allwinner/sun20i-d1-lichee-rv-dock.dts     | 12 +++
 arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts  | 13 +++
 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi       |  6 ++
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi      | 31 +++++++
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi  | 31 +++++++
 14 files changed, 254 insertions(+), 4 deletions(-)

--wG/y4cY9mUj2iJDb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmlyYdsACgkQOJpUIZwP
JDAZsA//dLHDour+H8TNtM9QdlPNSAgpDbCE9KpA8zVbXepxBPNCcH/y2LR0VV86
lveUwC3Eabh7FbWWoCLJWmSV7LZBav2NgonwNTBsp/K+cOu+PzN/d9L2KZyZscoo
2EVdhFFGJ+PMelUYSk3P7Ifya4olDnb+hDS0trMofq627zxgfvpSgOEiriZ2WvRi
T+qyYZwpHON7rvVR11Vhro1EKmnzEbBo63Sy/YM0y+cORyuaZqKezD0T4NNpmrMb
FBlcRVgjQaRK0oqBDG2QLJXIEscx8LKoqwpSwt6xcZE1oYjaEVx0xlo+bYGAjJjm
rdm6xCyERyp4k0wG6QyeHq4JDs8WWHMglu3Brp56TE4CeB9A2Gt6f/KsQ0yw/fdG
BpDZnM4LQNj5Yb00H1MAa/097xoWoOj8YKK97uzD6HusQ5p998NLv9uu0e+tROyQ
cfH+AFSIcseC/VhNJmDOooVQ7/V4Vw576Kn/ts+qkTuQcnJo58gwWoV1IrpUTWP7
W0jpIpaqjG3V9EZipLKlrN/0TDZBI3lpCmVTGw2SqH5JyJB7G1TsRFETyD1EkKYP
hQArbWyAkyPxVImivOGeO+Y0tA/gYtFgCtpUapjy0p7faiUjZsADT6wIF9IEUJec
5CHPi+iApKrUrkyQSNbm4ow6JuAryD742Dj8AruxryBwtun/pZc=
=tA0q
-----END PGP SIGNATURE-----

--wG/y4cY9mUj2iJDb--
