Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313FF2C9D
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Dec 2021 09:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878AEC36AE5;
	Fri, 17 Dec 2021 09:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639733919;
	bh=7yReAoDGVIbTjZA2nEM044WCC4ccguKERnbN4BryHqI=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=J91v6fOIWfq1wn6Mon6wIPZsntdoOegX5SD80WxOPgk39w+79kvykH2gQcxZOKZYN
	 p+J6Dhd5ICPmhZTp/KYjzjav+1vXT8Mkk5LZixykUHhB38fTphEBs8YA8XcoftiwUd
	 9raRWZ3J96joRIjtpcYiLplmD1rKOhKoAn+bhw/0SduvOWSx42lxmRNdQ/2UzsDQkG
	 N+imUX70ZbwUUnHLKP9Rd/kMpo2/+967aznaNQvp0LJU92GDJxoE6LaJ3GUnfesYR9
	 d24dVLd/puaexHsmze0virU2z/kynFKCw17/GY97k5+XZ02l3K06bmwD3o5+MkfLFG
	 TOWBPtiKD2cwQ==
Date: Fri, 17 Dec 2021 10:38:36 +0100
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Fixes for 5.16
Message-ID: <e295f1f7-cd24-4a7a-ae83-aafb2a3263b6.lettre@localhost>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6JTfa2X1VT+/LTI8"
Content-Disposition: inline


--6JTfa2X1VT+/LTI8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-fixes-for-5.16-1

for you to fetch changes up to 08d2061ff9c5319a07bf9ca6bbf11fdec68f704a:

  arm64: dts: allwinner: orangepi-zero-plus: fix PHY mode (2021-11-17 16:40:50 +0100)

----------------------------------------------------------------
One patch to fix the GMAC PHY mode on the OrangePi Zero Plus

----------------------------------------------------------------
Robert Marko (1):
      arm64: dts: allwinner: orangepi-zero-plus: fix PHY mode


 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)



--6JTfa2X1VT+/LTI8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYbxanAAKCRDj7w1vZxhR
xWTeAP9XhEFDX6jtPbd3oRqVcYWM73ytvzlukOmYWxDY+wW3zQD/blRGhnPpF+2A
S+3p5jzmnQPdigKWqRV3d6dbNFqFfQI=
=A608
-----END PGP SIGNATURE-----

--6JTfa2X1VT+/LTI8--
