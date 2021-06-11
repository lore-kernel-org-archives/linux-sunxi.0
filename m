Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA1272
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Jun 2021 14:54:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7EBF611CD;
	Fri, 11 Jun 2021 14:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623423271;
	bh=jxHTWV3FElGfy8OMvqBt7d6sjtvxkidSgk8uWrYmKb4=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=Mv0LaHDuo/Ml2376NBHv80WUUuJSHTfxJNziiPSP4DxecOzcTNHraM1UoAHvIuwD7
	 IRGPR2AdYe7UfxDigTIJic1dfQ+JlmotdGk2wFnvfszRMa2gZs31SjWcZFGglVjlAZ
	 zdtPEgomw9MtxZC/iN7hyAG63jm44Z9oqNDR+R45R7Gzi9bczxgmLax132kn5cnT2/
	 tEjzema7CEbxidmHvpegxAtb5p9R1fZgogOgHL2CS6Dr/F03C9m/JzYmGcfTvz/KTL
	 PHR/fZoVEefVq0z5LUBkJiM5giBAXIfSDjOs0IdNaHEogO0YXHn79BfQrxsIYdqoLg
	 t19MW3zdtsYkQ==
Date: Fri, 11 Jun 2021 16:54:29 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Fixes for 5.13
Message-ID: <ad7ba352-315c-4201-b922-4bf914a00d98.lettre@localhost>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IbiEmVdNhj52aTiM"
Content-Disposition: inline


--IbiEmVdNhj52aTiM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-fixes-for-5.13-1

for you to fetch changes up to bd5431b2f9b30a70f6ed964dd5ee9a6d1c397c06:

  arm64: dts: allwinner: a64-sopine-baseboard: change RGMII mode to TXID (2021-06-10 14:51:53 +0200)

----------------------------------------------------------------
Two patches to fix the GMAC PHY mode on some boards.

----------------------------------------------------------------
Icenowy Zheng (1):
      arm64: dts: allwinner: a64-sopine-baseboard: change RGMII mode to TXID

Salvatore Bonaccorso (1):
      ARM: dts: sun8i: h3: orangepi-plus: Fix ethernet phy-mode


 arch/arm/boot/dts/sun8i-h3-orangepi-plus.dts                  | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)



--IbiEmVdNhj52aTiM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYMN5JAAKCRDj7w1vZxhR
xfKdAP9DP2gxkghiwsDVwqUVay66TLRmsDbDrXkT+PPTWBp3VgD/fjADN2OSCPlR
yq33OpJqiAXAo99FRLJMDD8XPTteBQs=
=O3V/
-----END PGP SIGNATURE-----

--IbiEmVdNhj52aTiM--
