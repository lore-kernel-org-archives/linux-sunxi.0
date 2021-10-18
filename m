Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4542C88
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Oct 2021 08:02:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F34D361050;
	Mon, 18 Oct 2021 08:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634544162;
	bh=BdkWGAx269FXd8NJj1ZdIeBOhpIj9kgTKpkTG3i3X54=;
	h=Date:From:To:Cc:Subject:From;
	b=F6nyDjQf/nK4Q2ehHm1kiHbmO8HROiQEDTShm0lV25zVEkKiRHkaXRTPxlt/0mFL4
	 16gQEm44sd9JYFJq8NtV/A4IdpWQOZpL93tgATu3KRS2bdP9UJBXiq4I45Iprlqsmr
	 MUW8Iy2NfVjbWmr/SctmIJbQuMtDSjH6SrqrH/hPSQYnt0CF7p1rX5IjsFMtC9nYfN
	 gZZZG+ACWrMHDQivf5DEK+dhLVMdczznxe3htLq8k9h6TxUZMUmHDYAdL4SjE8sdwy
	 dwL38hQdbHBxJvwQuZIXzHRuUK/VIC1f7zycXSwx/luewQjKbkRCQcPm9NdEN3yzZn
	 wUae0CYFTdemA==
Date: Mon, 18 Oct 2021 10:02:40 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Clock Changes for 5.16
Message-ID: <f7f3c718-eab3-4d8e-a8f3-8d1ef986a5dc.lettre@localhost>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ib1gpXeIVE6pa8+r"
Content-Disposition: inline


--Ib1gpXeIVE6pa8+r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-clk-for-5.16-1

for you to fetch changes up to e65d38e3d2d0e61ca464b46ad804f7a94e1ae45f:

  clk: sunxi: sun8i-apb0: Make use of the helper function devm_platform_ioremap_resource() (2021-09-13 09:03:24 +0200)

----------------------------------------------------------------
Our usual PR for the Allwinner SoCs, this time improving the module
support and converting to more helpers.

----------------------------------------------------------------
Cai Huoqing (13):
      clk: sunxi: clk-mod0: Make use of the helper function devm_platform_ioremap_resource()
      clk: sunxi-ng: ccu-sun50i-a64: Make use of the helper function devm_platform_ioremap_resource()
      clk: sunxi-ng: ccu-sun50i-h6: Make use of the helper function devm_platform_ioremap_resource()
      clk: sunxi-ng: ccu-sun8i-a83t: Make use of the helper function devm_platform_ioremap_resource()
      clk: sunxi-ng: ccu-sun8i-de2: Make use of the helper function devm_platform_ioremap_resource()
      clk: sunxi-ng: ccu-sun8i-r40: Make use of the helper function devm_platform_ioremap_resource()
      clk: sunxi-ng: ccu-sun9i-a80: Make use of the helper function devm_platform_ioremap_resource()
      clk: sunxi-ng: ccu-sun9i-a80-de: Make use of the helper function devm_platform_ioremap_resource()
      clk: sunxi-ng: ccu-sun9i-a80-usb: Make use of the helper function devm_platform_ioremap_resource()
      clk: sunxi: sun6i-apb0: Make use of the helper function devm_platform_ioremap_resource()
      clk: sunxi: sun6i-apb0-gates: Make use of the helper function devm_platform_ioremap_resource()
      clk: sunxi: sun6i-ar100: Make use of the helper function devm_platform_ioremap_resource()
      clk: sunxi: sun8i-apb0: Make use of the helper function devm_platform_ioremap_resource()

Maxime Ripard (1):
      dt-bindings: clocks: Fix typo in the H6 compatible

Samuel Holland (5):
      clk: sunxi-ng: mux: Remove unused 'reg' field
      clk: sunxi-ng: Add machine dependency to A83T CCU
      clk: sunxi-ng: Unregister clocks/resets when unbinding
      clk: sunxi-ng: Prevent unbinding CCUs via sysfs
      clk: sunxi-ng: Use a separate lock for each CCU instance


 Documentation/devicetree/bindings/clock/allwinner,sun8i-a83t-de2-clk.yaml |  2 +-
 drivers/clk/sunxi-ng/Kconfig                                              |  1 +-
 drivers/clk/sunxi-ng/ccu-sun4i-a10.c                                      |  2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c                                  |  3 ++-
 drivers/clk/sunxi-ng/ccu-sun50i-a100.c                                    |  3 ++-
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c                                     |  7 ++----
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c                                    |  2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c                                      |  7 ++----
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c                                    |  4 +---
 drivers/clk/sunxi-ng/ccu-sun5i.c                                          |  2 +-
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c                                      |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c                                      |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c                                      |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c                                     |  7 ++----
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c                                      |  6 +----
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                                       |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-r.c                                        |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c                                      |  7 ++----
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c                                      |  2 +-
 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c                                   |  8 ++-----
 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c                                  |  7 +-----
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c                                      |  7 ++----
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c                                  |  2 +-
 drivers/clk/sunxi-ng/ccu_common.c                                         | 96 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------
 drivers/clk/sunxi-ng/ccu_common.h                                         |  6 +++--
 drivers/clk/sunxi-ng/ccu_mux.h                                            |  1 +-
 drivers/clk/sunxi/clk-mod0.c                                              |  4 +---
 drivers/clk/sunxi/clk-sun6i-apb0-gates.c                                  |  4 +---
 drivers/clk/sunxi/clk-sun6i-apb0.c                                        |  4 +---
 drivers/clk/sunxi/clk-sun6i-ar100.c                                       |  4 +---
 drivers/clk/sunxi/clk-sun8i-apb0.c                                        |  4 +---
 31 files changed, 127 insertions(+), 85 deletions(-)



--Ib1gpXeIVE6pa8+r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYW0qIAAKCRDj7w1vZxhR
xYRiAQC6a0/cmekem6LHgKeEUraJlj5G6KvlyzjvUoKTQK/6jAD/bSJNVYIZqsVF
a+aufFfvQ4FuNw0QEkr33EAjJ05zWwM=
=32yW
-----END PGP SIGNATURE-----

--Ib1gpXeIVE6pa8+r--
