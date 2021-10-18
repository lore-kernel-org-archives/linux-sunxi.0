Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B852C88
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Oct 2021 08:03:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C17F61076;
	Mon, 18 Oct 2021 08:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634544205;
	bh=jaRhVaaILmiksOarnXdu6B73cKiBj0r9Uzn6kzshOf0=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=tD9GnRJbfYHWmaRRE4miJQH/ryiJQXA2oHdC6Nuw1gGhrB0/dHlsh60EcWbcRWzAL
	 VLCIOvO1IsiCEt4tky7KaRUp37e9+DxuOllBEWv26Op0GZTnqwtm1dVS4StizRfK2W
	 Al8EpRTX3BEA3dMPbtiFaProPuNhETmObFMC7FE8/W6UWU3bp5Z4IT40I3mB6Gcqwv
	 PYtLfS1zv1b1EneX7MypK03t2ae3Mf1RUo+uwN2NWDhFhp3GBTNLkzOF6W02fAp+05
	 pcUHPxT2TLnZej0GjeO0hRwA8ZBBJ10V/dMQhF3ZpS+8lH8SBNNldkrDA8c6+s1LxU
	 nUFnA7fbtkrmA==
Date: Mon, 18 Oct 2021 10:03:23 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Platform Changes for 5.16
Message-ID: <a2a51d7b-66ad-4c94-beb1-e793ae62766a.lettre@localhost>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tH84veD4Dn/9IDHz"
Content-Disposition: inline


--tH84veD4Dn/9IDHz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-core-for-5.16-1

for you to fetch changes up to 5923ddaa95a7e61e827a3d9b1d9c749963d8db90:

  ARM: sunxi: Add a missing SPDX license header (2021-09-13 09:03:47 +0200)

----------------------------------------------------------------
Platform core changes for the Allwinner SoCs, this time adding SPDX
headers to our files.

----------------------------------------------------------------
Jason Wang (2):
      ARM: sunxi: Add a missing SPDX license header
      ARM: sunxi: Add a missing SPDX license header


 arch/arm/mach-sunxi/platsmp.c | 4 +---
 arch/arm/mach-sunxi/sunxi.c   | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)



--tH84veD4Dn/9IDHz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYW0qSwAKCRDj7w1vZxhR
xc1vAQCD8MyC1auExfRAgRfY0U2M6EjIVv7YVfp8Oawjy1Y1xwEAhlGb7av5rhOl
pGnph29e1aT2axf2ijOFcX+43BhYQAw=
=Kbn4
-----END PGP SIGNATURE-----

--tH84veD4Dn/9IDHz--
