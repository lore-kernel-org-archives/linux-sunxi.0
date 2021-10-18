Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232302C88
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Oct 2021 08:02:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FB6D610C7;
	Mon, 18 Oct 2021 08:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634544123;
	bh=AvLNrPDnBptHpt5KfRV1jAK/+wjfKKr0GVw4Qdgq0aw=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=GWtrfWMlVm8+FFVPULJUwlOtSyEUkAwG8EMjrpdVuA8dBrrzY2WQjAywF/skt9TN+
	 oYKLdoDsDoZf/R/JneVAmjOyd6+gyWQ8wMsmVt/VLV4a7qKFskfHa67ycDDjzOW7tz
	 BVWaIwpdczxEbUQ0ymPyAOKpXa1ZsOCze8zwdHyWU3S6ekz8t/vq8ZwFY9RK8Xw/hT
	 Vs5jRMFYJGbr/+C/hT0wm3dNzMnQswllJeCXltMXpXNHNSzp//XhcjLePSMbwodbhx
	 afbHQWEc/D6OZBUnXCs9eVmRXlh7i9WxbfaF4hcXNLnd0qMC+pwOVtPQEpWcD9Gz9G
	 5mM18aoy958Ig==
Date: Mon, 18 Oct 2021 10:02:01 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Drivers Changes for 5.16
Message-ID: <ad0aa469-9e1b-4bb6-a116-92648ed774fa.lettre@localhost>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WfXQXILWtMqAGP2e"
Content-Disposition: inline


--WfXQXILWtMqAGP2e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-drivers-for-5.16-1

for you to fetch changes up to 50ac48ae3e80359a475216de8c3b0ec12374fa66:

  bus: sun50i-de2: Adjust printing error message (2021-10-13 14:48:48 +0200)

----------------------------------------------------------------
Some new drivers changes for the Allwinner SoCs, converting to a helper
and improving logging.

----------------------------------------------------------------
Cai Huoqing (1):
      soc: sunxi_sram: Make use of the helper function devm_platform_ioremap_resource()

Jernej Skrabec (1):
      bus: sun50i-de2: Adjust printing error message


 drivers/bus/sun50i-de2.c       | 7 +++----
 drivers/soc/sunxi/sunxi_sram.c | 4 +---
 2 files changed, 4 insertions(+), 7 deletions(-)



--WfXQXILWtMqAGP2e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYW0p+QAKCRDj7w1vZxhR
xU3gAQC16OPLctLQl2toe9hzer/GO5+K7mLkO1s+ro9OobQzSAD/TnUwDP/XP0hn
N5fQFwHnAXnJ6ioOQ2Ui06OWfIolkwI=
=DO6y
-----END PGP SIGNATURE-----

--WfXQXILWtMqAGP2e--
