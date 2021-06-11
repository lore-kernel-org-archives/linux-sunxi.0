Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C8F72
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Jun 2021 14:55:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B20A7611CD;
	Fri, 11 Jun 2021 14:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623423305;
	bh=tyRd2iKhXdWd2APAupfUWzpcuCFBRtPPHsVq01oaevE=;
	h=Date:From:To:Cc:Subject:From;
	b=kBdpO+auuA3t53ipU10LCIFGI4o9CuWzW5RzIJjj3hqbHN4Oc8PohBSFsNR0eW0f6
	 cOp7ERS2GsWDAnLvU/cQ+SienY0+H7RPJRtZ7gRElHl6UuEwdCLNym2UDsah4r7P7P
	 +hS4V1KByg3T4E/WeQgiPjMcPwtzWCDo3kg97ew6g/YrRV4/ORiodJnZ/RUWhR5uzX
	 yBTOZhPSzcFjJlOmN8e6zwz9XiRdm9JWBboNdj3xxIWvdiao+fXD4BURlRjsgamj81
	 IbQGFaiELm+rDaz7DB/Q0nUqw+r54lZn7SmW7AMMyzo43styFohhROKUjo/6yddS5Q
	 ZDRy6jSqHvUmQ==
Date: Fri, 11 Jun 2021 16:55:02 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Clock Fixes for 5.13
Message-ID: <eede2490-c702-4a9d-97d0-217424727a09.lettre@localhost>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o8HGiXk6Ix1TOh80"
Content-Disposition: inline


--o8HGiXk6Ix1TOh80
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags=
/sunxi-clk-fixes-for-5.13-1

for you to fetch changes up to 47e4dc4e63e1dcb8eec01c4214bcefc248eb72ed:

  clk: sunxi-ng: v3s: fix incorrect postdivider on pll-audio (2021-05-24 13=
:57:37 +0200)

----------------------------------------------------------------
One patch to fix a divider on the v3s Audio PLL=20

----------------------------------------------------------------
Tobias Schramm (1):
      clk: sunxi-ng: v3s: fix incorrect postdivider on pll-audio


 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)



--o8HGiXk6Ix1TOh80
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYMN5RgAKCRDj7w1vZxhR
xUirAP9D82H/lTcHzXATNKSz83j/HMY0+xNK2KKtm8jctmSSEwEA8dKmXFRGoUFN
6qdAcFR/AU0lyUNa0TefTUt2dXLMSwE=
=u/n1
-----END PGP SIGNATURE-----

--o8HGiXk6Ix1TOh80--
