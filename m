Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB9D70
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Apr 2021 13:52:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D987C61029;
	Fri,  2 Apr 2021 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617371558;
	bh=BjmiQtDOTt1N3g8KZzsk+p2yMAhjSkJoKDEVC+4tDjE=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=rPWoqUHFj1gfU7Qo6tiCxqP9WwUd2EPdJRvJ8YOJ+n2a6uR6xALcg3kbMdfdw9HvU
	 3YTi5US3ksGxxsy0gpumIkxm5V/aqOwypHUQnf4z6vbJfsztxheSHDXt1ozyBqf9zW
	 mGvMbj6aySqsR1xEa4i+vHeIQfLisV//QPRUjWBBfuIA2qzA/x19KLZgvfTM5qjyQ5
	 xgiAG0vwRR20Fmw2Bbu0lDsukrKQI5voPoPfh7z5WeMNP6NFXucn+urW13TtIPYoOS
	 zZfCAGWmHsmiKfOSKTEkhnL+kGX9wNyE/AiPkAGAuAStgXz3B8RkABS4sV6FT+p+uU
	 Vnw7XBdr9fqOA==
Date: Fri, 2 Apr 2021 15:52:36 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Device Tree Changes for 5.13
Message-ID: <8a3e3271-bebe-4d27-a9e7-7b7a6311a38d.lettre@localhost>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V0foJ2CtgLcZAjcW"
Content-Disposition: inline


--V0foJ2CtgLcZAjcW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arnd, Olof,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags=
/sunxi-dt-for-5.13-1

for you to fetch changes up to d580e6f0ec3ab42e81f3825ef4438836ead88c5f:

  ARM: dts: sun8i: h3: beelink-x2: Add power button (2021-03-24 10:25:37 +0=
100)

----------------------------------------------------------------
Our usual bunch of patches to support the Allwinner SoCs, this time
adding:
  - New secondary interrupt controller binding to support the wake-up=20
  - Use the RSB bus instead of I2C for the PMIC on the H6
  - HDMI support for the BananaPi M2-Zero
  - New board: Topwise A721

----------------------------------------------------------------
Jernej Skrabec (1):
      ARM: dts: sun8i: h3: beelink-x2: Add power button

Pascal Roeleven (2):
      dt-bindings: arm: Add Topwise A721
      ARM: dts: sun4i: Add support for Topwise A721 tablet

Pieter Beers (1):
      ARM: dts: sunxi: h2-plus-bananapi-m2-zero: Add HDMI out

Samuel Holland (6):
      ARM: dts: sunxi: Use the new r_intc binding
      ARM: dts: sunxi: h3/h5: Add r_intc node
      ARM: dts: sunxi: Move wakeup-capable IRQs to r_intc
      arm64: dts: allwinner: Use the new r_intc binding
      arm64: dts: allwinner: Move wakeup-capable IRQs to r_intc
      arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection


 Documentation/devicetree/bindings/arm/sunxi.yaml           |   5 +-
 arch/arm/boot/dts/Makefile                                 |   3 +-
 arch/arm/boot/dts/sun4i-a10-topwise-a721.dts               | 242 +++++++++=
+++++-
 arch/arm/boot/dts/sun6i-a31-hummingbird.dts                |   2 +-
 arch/arm/boot/dts/sun6i-a31-m9.dts                         |   2 +-
 arch/arm/boot/dts/sun6i-a31-mele-a1000g-quad.dts           |   2 +-
 arch/arm/boot/dts/sun6i-a31.dtsi                           |   6 +-
 arch/arm/boot/dts/sun6i-a31s-primo81.dts                   |   2 +-
 arch/arm/boot/dts/sun6i-a31s-sina31s-core.dtsi             |   2 +-
 arch/arm/boot/dts/sun6i-a31s-sinovoip-bpi-m2.dts           |   2 +-
 arch/arm/boot/dts/sun6i-a31s-yones-toptech-bs1078-v2.dts   |   2 +-
 arch/arm/boot/dts/sun6i-reference-design-tablet.dtsi       |   2 +-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi                       |   6 +-
 arch/arm/boot/dts/sun8i-a33-olinuxino.dts                  |   2 +-
 arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts             |   2 +-
 arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts     |   4 +-
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts               |   4 +-
 arch/arm/boot/dts/sun8i-a83t-cubietruck-plus.dts           |   4 +-
 arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts                  |   4 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi                          |   5 +-
 arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts       |  25 +-
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts                  |  11 +-
 arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts               |   2 +-
 arch/arm/boot/dts/sun8i-r16-parrot.dts                     |   2 +-
 arch/arm/boot/dts/sun8i-reference-design-tablet.dtsi       |   2 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                         |  12 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts  |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts    |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts     |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts  |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts        |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts      |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi    |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts       |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi       |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts       |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi              |   6 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts    |  40 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts     |  16 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi      |  24 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts       |   4 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi               |   8 +-
 43 files changed, 395 insertions(+), 82 deletions(-)
 create mode 100644 arch/arm/boot/dts/sun4i-a10-topwise-a721.dts



--V0foJ2CtgLcZAjcW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYGchpAAKCRDj7w1vZxhR
xZrQAQCtCJFpKz93E8gfAbsFHzj45li7qsIqcPSm5x8pu6rzbAD7BOFZ7K9EbUwU
3zp+QTala2qklh/cbk9Hvk47sTWgMAc=
=Ui0h
-----END PGP SIGNATURE-----

--V0foJ2CtgLcZAjcW--
