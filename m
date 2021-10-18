Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D70029CA
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Oct 2021 08:01:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49B0D6103B;
	Mon, 18 Oct 2021 08:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634544087;
	bh=yflOJDMKWIfetXVUpp9ljl8knVOI7slXvw5raYckLkY=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=m604JwsGx+0+UOOMtfiAxQ7nAJpiZtl5qTrGbpeg2lPqB/a7H0vRXtwY3oMR023IE
	 Z9qrG9cm74IPU2DIKEGTVuysniSzBpPrFzgCgiC9Ob/e5sHBxFQaTKcgqalZ3lDI5O
	 HYvhLKhuEKFyIyfGoh7ZzE3rbcmCivZh1uedH4r7bfQETxaoY9czCBCqOTohSmTsV0
	 ar069hJIm8on14MbaKyiMQWbAE4h7hAikdEUTnYV6rnuo073iE5DMEch8zjWg8+KIP
	 bl5dENHvtQsdCPF8Acn4+acy9WDkV9chY80cHtGUySYCpM8i29K+H2sRW5inm7dhvX
	 RlCDUlXeewpCg==
Date: Mon, 18 Oct 2021 10:01:25 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Fixes for 5.15
Message-ID: <d4c41c71-f1ff-4464-a26f-1bfd4b52fd78.lettre@localhost>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EHQGxgoMwBtoyP0k"
Content-Disposition: inline


--EHQGxgoMwBtoyP0k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags=
/sunxi-fixes-for-5.15-1

for you to fetch changes up to 55dd7e059098ce4bd0a55c251cb78e74604abb57:

  ARM: dts: sun7i: A20-olinuxino-lime2: Fix ethernet phy-mode (2021-09-24 0=
9:29:00 +0200)

----------------------------------------------------------------
Two patches to fix the GMAC PHY mode on some boards.

----------------------------------------------------------------
Bastien Roucari=C3=A8s (1):
      ARM: dts: sun7i: A20-olinuxino-lime2: Fix ethernet phy-mode

Cl=C3=A9ment B=C5=93sch (1):
      arm64: dts: allwinner: h5: NanoPI Neo 2: Fix ethernet node


 arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts         | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h5-nanopi-neo2.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)



--EHQGxgoMwBtoyP0k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYW0p1QAKCRDj7w1vZxhR
xfhYAPwMflBg2xBO5WSajPwlxLfGksNhktpQJegp1yhNkryplAD/el1PA6rnoL4E
WLZsynHR78Pkxe1pgAFKLQ+/GJZJygQ=
=FQ8z
-----END PGP SIGNATURE-----

--EHQGxgoMwBtoyP0k--
