Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077642C9D
	for <linux-sunxi@lists.linux.dev>; Fri, 17 Dec 2021 09:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36DB4C36AE5;
	Fri, 17 Dec 2021 09:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639733881;
	bh=M9+aRLYLSI94aweeGhp3EP8hQCyg9BnUOP9PMSiitS4=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=e8nC4GqLl8mP/2DNHO9dLDvfUdfhZJecH/goyKCNqQzV0+aDD/G5wKfWAJQTR3ha6
	 UakPnPYZ8bq0UEFMGQfSnmNsDlCE3At8bcj1NP945yuKwT+f5OC6v9vToreGrlcycx
	 heBM25wLBI9ZomA3+aHYO/GCFLih0ZYzhXcUsIXOE/weNVJ0m+QYTu+wrJKdQQNNeP
	 z1kIzV5VBTxWTRVEzWUzJ4vQzUCfXHVF8mAjN+301v/B780fBKBFDe4sMPloxt5CCk
	 gwvm8e2SSKPGwJgorLm+W9v3VXaNwJ0tE1CtIM8wdhyZIeSKYvysk6sQ0t/F6wIf1R
	 gm7R5c7MHV1uw==
Date: Fri, 17 Dec 2021 10:37:59 +0100
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Drivers Changes for 5.17
Message-ID: <6f2f75ad-de62-49a4-82a4-8655a567a09e.lettre@localhost>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cCT0ubmj+fgakXSX"
Content-Disposition: inline


--cCT0ubmj+fgakXSX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull the following changes for the next release.

Thanks!
Maxime

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-drivers-for-5.17-1

for you to fetch changes up to 017a716e7b0e9d4ac06a4d7779bd04fca009bbc9:

  bus: sunxi-rsb: Fix shutdown (2021-11-22 10:02:57 +0100)

----------------------------------------------------------------
Some new drivers changes for the Allwinner SoCs, fixing the shutdown
path of the RSB driver

----------------------------------------------------------------
Jernej Skrabec (1):
      bus: sunxi-rsb: Fix shutdown


 drivers/bus/sunxi-rsb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)



--cCT0ubmj+fgakXSX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYbxadwAKCRDj7w1vZxhR
xUFdAP9V3PYYtaMb1n9YUxwr8t2987WsR49G3syAjOE3hA6k3AD9HaR/rPPxrp8n
PmRSOFjKVs0GQpwg2woSsvjC0g5mzgM=
=8qv7
-----END PGP SIGNATURE-----

--cCT0ubmj+fgakXSX--
