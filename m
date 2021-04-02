Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2935D70
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Apr 2021 13:36:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56799610C7;
	Fri,  2 Apr 2021 13:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617370595;
	bh=z1mZZbiYPkrM5r/aJtAh5y5kh0CVn1HL7j6A7kJl6jk=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=SoHfM20ukked8FQCAMZm3yT3vwA9DLDEOH0yl7UPHILC99x/+6JXNZfevm0WDJdA3
	 YXn50cHwSGoE0yp/p2k+v3E02CRB8Hs4K4bw1KlhkLUEImN6jIP1wvoUNQQCId+Zio
	 D15aQbOqmaowWH/LwXJHHsa/hGznk6tCF3GROty4JlEjpeftfgvJJ7Ek/mx7WbxsqE
	 kPqIlU3QwG/ZZwQDlffqcBARNtwt8Q+vVN62xRCnVKl2xIfDh5Ll254cF7TdrjQfzb
	 JN8DvzoZMiIVCoOby25+JHdwl2VAgwQXwdlo762h9c2rXOva7eBY/OCSEnzlpJfSWx
	 zOmOpmqnlUu2A==
Date: Fri, 2 Apr 2021 15:36:33 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner Fixes for 5.12
Message-ID: <9df637a0-945e-4469-8e6d-0903cc9d3196.lettre@localhost>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MX/URsAQkQzfTyEc"
Content-Disposition: inline


--MX/URsAQkQzfTyEc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd, Olof,

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-fixes-for-5.12

for you to fetch changes up to a3797571964d80ff3abebb1cd5047d4ae6d8db4e:

  arm64: dts: allwinner: h6: beelink-gs1: Remove ext. 32 kHz osc reference (2021-04-01 10:22:33 +0200)

----------------------------------------------------------------
One 32kHz clock fix for the beelink gs1, a CD polarity fix for the SoPine, some
MAINTAINERS maintainance, and a clk / reset switch to our headers.

----------------------------------------------------------------
Andre Przywara (1):
      arm64: dts: allwinner: Fix SD card CD GPIO for SOPine systems

Chen-Yu Tsai (1):
      arm64: dts: allwinner: h6: Switch to macros for RSB clock/reset indices

Jernej Skrabec (1):
      arm64: dts: allwinner: h6: beelink-gs1: Remove ext. 32 kHz osc reference

Maxime Ripard (2):
      MAINTAINERS: Add our new mailing-list
      MAINTAINERS: Match on allwinner keyword


 MAINTAINERS                                             | 2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dts | 4 ++++
 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi    | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 4 ----
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi            | 4 ++--
 5 files changed, 9 insertions(+), 7 deletions(-)



--MX/URsAQkQzfTyEc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYGcd4QAKCRDj7w1vZxhR
xcriAP4vE+LS7aFvNyrmIr0eQFC7wlNEj18vGm1Sc4KKj/FBXQD/XCZS2SUfQqNa
pfCXC+Lm5eKdjyHewU4l/PaaF7FQ6Qs=
=kmjh
-----END PGP SIGNATURE-----

--MX/URsAQkQzfTyEc--
