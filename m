Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427102F80
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Aug 2021 08:35:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6345660FBF;
	Tue, 17 Aug 2021 08:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629189306;
	bh=NKFYA+fa7Qcc2Xyvdm0W96T36wN+FrI2t8d2lzA69Zs=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=JeVg16b0nWJ4KzqBX/6+h1gUo7H7fj1kD7I9eqdgNq0c6i6DTLI2Fq9nbRY8DmU9c
	 gCEY186RDOUMORRJjBpmkHijDBga8rV+N+2OfbJhxuK98P7jrKUHl1TyS1S9hly3N7
	 ALhcp8lyZxv2YkLjQBXf8OtV4nTZ0n/0UgjihPGxENevZ/gqWPMaAPa50Dv1J2kzTe
	 DEzZyDcZkWckAIzKQUV5tEQi4W1hqZheRy3xna8mLyp0TKHIF+nsBSjkDvJZZIGUr1
	 AOlQCbQMRfPYz4lcaJl1H+FlQfEoOIHR5Mk8uLNSwN+5R0+gxbLqAZSm5LHz5uvETw
	 v+IaW9hTCg0LQ==
Date: Tue, 17 Aug 2021 10:35:04 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Device Tree Changes for 5.15
Message-ID: <39cd7be5-a9a7-42b6-bc29-f895b9a3448a.lettre@localhost>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aA5SJjhAhrKtAKL4"
Content-Disposition: inline


--aA5SJjhAhrKtAKL4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

It's been a fairly quiet merge window for us, but please pull the
following changes for the next release.

Thanks!
Maxime

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-dt-for-5.15-1

for you to fetch changes up to 9d3ef21dca2c80fd9567869e28fa2a992a5e2c4b:

  arm64: dts: allwinner: h6: tanix-tx6: enable emmc (2021-07-26 09:11:49 +0200)

----------------------------------------------------------------
Our usual round of DT patches for the 5.15 merge window, with some
Tanix TX6 improvements this time.

----------------------------------------------------------------
Jernej Skrabec (3):
      arm64: dts: allwinner: h6: tanix-tx6: Fix regulator node names
      arm64: dts: allwinner: h6: tanix-tx6: Add PIO power supplies
      arm64: dts: allwinner: h6: tanix-tx6: enable emmc


 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts | 27 ++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)



--aA5SJjhAhrKtAKL4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYRt0uAAKCRDj7w1vZxhR
xeIdAPsGVzRlj8kV1L70ZM0mRTJXPOhhiGiKCYjvbT8emWvY1QD9EjuKu0PihFN/
dnV0GmbcbmHt/WGJCjNbSjnKt1dHWAg=
=qsSS
-----END PGP SIGNATURE-----

--aA5SJjhAhrKtAKL4--
