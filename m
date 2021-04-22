Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A2370
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Apr 2021 07:46:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1200F6145A;
	Thu, 22 Apr 2021 07:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619077588;
	bh=FcUdqMuC8KKZgy8ctbdx6jxvSoxE1r7Gn97aaxBoKuQ=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=FL+zIb6RGN/HUKyzE+6QyPWvK3ChNhpkxvGEv1VV904Olu6ZNwytYrwH5xFr3pw6a
	 BKc28DQ4WFSKScJpRTZPTxGY/J4sJAG2513y9nVYohu0xz3JH8kNGMssyCWRYxj9C4
	 bMbvi73N7m5ZGWwVPhMWrHlRZaDcp/X8UOU1q5AEmQQXqgWI3mu6tBfty13mjrrPdQ
	 STov2NvU+xjr8pLJuV9IX7/DrexPpnMEQ9iSXcI6iwg9faXj8HVYrutZfKL5nU0Eng
	 3fRKG+glhMqO23HBVLs0tlNlZ3r+NHpS9S19L0yCHDiwLEUy/vYYvanOkEgqSMnlLW
	 FUbTG2e++Bt1g==
Date: Thu, 22 Apr 2021 09:46:26 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Fixes for 5.12, Take 2
Message-ID: <45fc5e4d-ef48-4729-a869-79a8f288bb83.lettre@localhost>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ipD16zsVR+YD7JtW"
Content-Disposition: inline


--ipD16zsVR+YD7JtW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd, Olof,

Here's a late fix for 5.12.

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit 7a2f6e69e9c1060a7a09c1f8322ccb8d942b3078:

  arm64: dts: allwinner: h6: beelink-gs1: Remove ext. 32 kHz osc reference (2021-04-07 13:41:47 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-fixes-for-5.12-2

for you to fetch changes up to 4d09ccc4a81e7de6b002482af554d8b5626f5041:

  arm64: dts: allwinner: Revert SD card CD GPIO for Pine64-LTS (2021-04-22 09:43:15 +0200)

----------------------------------------------------------------
One fix for the MMC card detect on the Pine H64 board

----------------------------------------------------------------
Andre Przywara (1):
      arm64: dts: allwinner: Revert SD card CD GPIO for Pine64-LTS


 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)



--ipD16zsVR+YD7JtW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYIEp0QAKCRDj7w1vZxhR
xRVBAPwJo8aDYgHueY2UYhIDNcJoWvFtxyWWucxJoQQDXgvBxAD/V2iELZiOvi7u
Sn+BzLrrqSx7/1ZUxOVPteFLlDX9FwM=
=W1Fu
-----END PGP SIGNATURE-----

--ipD16zsVR+YD7JtW--
