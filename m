Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7406168
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Oct 2021 08:06:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0805A61050;
	Mon, 18 Oct 2021 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634544389;
	bh=jTUl3KwTRWwxK2lXal9peOo0jxqD71yxYfz3L7DgLHE=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=sCY/UNONO+ZQpGoe42+GaAKoYpB1nhcAKxvA9SB1v4bkNnC3upQ+MP/zC0UqyB8U5
	 blCOlTy2UkLj6kQiYqa0cwsB/tYAqEBA47FUUrjxA5GlYOIOO5THrDG9YuRqx6te2u
	 lTQUBQnIa7JR2MZBzIVcj85DjhSIo1kYGh5q0mHSrCXfJVdrdKVwTDOrNioQtLPPzs
	 U0KMUDk6H/Y0JVt8AzLm5RaXP8zxRulIPJA0r2f2S4oZVvSsCdWWwyV7PNhcFKAB9O
	 llR6ebNn5GRHpawYwyoj2sIT2QUIFiO2OCfEy4hjRG0OGiVmYbnVHrk7+SBETzJtIJ
	 SqXINKG21/zDg==
Date: Mon, 18 Oct 2021 10:06:27 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Platform Changes for 5.16
Message-ID: <0ceaad3e-dc26-4be6-b98f-d25e51a41b81.lettre@localhost>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Kd0IKDMep6tgZnxs"
Content-Disposition: inline


--Kd0IKDMep6tgZnxs
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



--Kd0IKDMep6tgZnxs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYW0rAwAKCRDj7w1vZxhR
xTh0AQDKmtP1Ho6aBM3yN2W9tObqf+TTy50JQfdmYArWZY3UkQD+MPWHAomx0pDD
NA38CGAAZXW9azRK9wD4/i4Dzr3h4Ac=
=Ut1f
-----END PGP SIGNATURE-----

--Kd0IKDMep6tgZnxs--
