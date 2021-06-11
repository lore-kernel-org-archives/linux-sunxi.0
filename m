Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F2872
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Jun 2021 14:55:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE3BC60200;
	Fri, 11 Jun 2021 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623423355;
	bh=w/BG8YY3jV6/GlxIobZ63Z5fE/8mHTGyBhH25xHGwj8=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=QZhjhvoGArMOy7qS3fi/xFRfkciJLVE8AN/sCKVlkD4OcxRdFiwbHNmaHggtwry1R
	 aJrPKTqbBfkWqOnwKL81OltzwOX2qpd965MjpkpDGreBaRS9y/GvQ2BsCMr8n6GyYL
	 uy9xRjL+X+JsUxc0XaHCK/MNUiYn5QlSSraWy48QZ7G9TWCvIe1Wj7+hMxhmwzgUxX
	 VrwtF3Fm4gaKRpXZoHepcsu5zUvoEBPFwFPXhvEtkrAL5QerMB2GFVO4GKYfggLJYD
	 8sU4AEFVBzdsU1UvtFBKcynz+V8SmQBQEOqfwwd1h2I7Lc7IsdBuP4sjR8YoSCpLV4
	 dNJSY//5sVesQ==
Date: Fri, 11 Jun 2021 16:55:53 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Platform Changes for 5.14
Message-ID: <bf3431f6-2196-425c-9b43-0bf4de0b6d30.lettre@localhost>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DwZuxS5b5A0Qc9+5"
Content-Disposition: inline


--DwZuxS5b5A0Qc9+5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-core-for-5.14-1

for you to fetch changes up to cbccad664927e98db0f12adb7434fdfe51d3073a:

  arm64: sunxi: Build the sun4i timer driver (2021-05-10 09:15:09 +0200)

----------------------------------------------------------------
One patch to select one of our timer in the arm64 Kconfig option.

----------------------------------------------------------------
Samuel Holland (1):
      arm64: sunxi: Build the sun4i timer driver


 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)



--DwZuxS5b5A0Qc9+5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYMN5eQAKCRDj7w1vZxhR
xd6jAQDbl7BSRmL174s2Qk1CxnZVVZac8/jWZssuvMSSyyp1xQEA8uJNRquAY6FT
7C/eiWK7xrZinzbfYoe1sV0xpoAHogY=
=+rTJ
-----END PGP SIGNATURE-----

--DwZuxS5b5A0Qc9+5--
