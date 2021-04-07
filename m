Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0E26D00
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Apr 2021 11:45:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABB1961284;
	Wed,  7 Apr 2021 11:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617795932;
	bh=htpMIDDNOkdHMPI+auzfjyShElJLBZPacfzsX+qtWAc=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=rSrTkCwpWi7VBknJSxijgIuHmyKtnhAuOdritl+glGfTug74FTSQGwyLZf78F0Cxg
	 JBCM3yRgDVwiSVfMndRWuWT/HGYHeWzalUBZJhRUJwfWSgmTueH2Vv3tPwnsdTHFZV
	 UzaTtK6j9aa7jzYpf+5e01u6zlKdXSYr3MSMdxRUPLyP7PvZPA16rlFwbWdmBGshSu
	 A3eHE6QEi9Njj+mt9TltzMReEfPKs10mThQ4cGKCeUyX+0dgZb4THHIpg6Exwz4ttm
	 QT1POUrGFnUFrFuD+XKmgUfnGEl8Av9Dgs01Z95uRpPNh9khtTrw8VixLiGFFvE2o6
	 iIoOXSmmJQ8FQ==
Date: Wed, 7 Apr 2021 13:45:29 +0200
From: Maxime Ripard <mripard@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [GIT PULL] Allwinner Fixes for 5.12
Message-ID: <9972a85e-60b7-49f4-a246-db3396dd4764.lettre@localhost>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HNihV8g0zMosw/Hu"
Content-Disposition: inline


--HNihV8g0zMosw/Hu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd, Olof,

Here's the fixes PR rebase with my SoB added

Please pull the following changes for the current release.

Thanks!
Maxime

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/tags/sunxi-fixes-for-5.12-1

for you to fetch changes up to 7a2f6e69e9c1060a7a09c1f8322ccb8d942b3078:

  arm64: dts: allwinner: h6: beelink-gs1: Remove ext. 32 kHz osc reference (2021-04-07 13:41:47 +0200)

----------------------------------------------------------------
One 32kHz clock fix for the beelink gs1, a CD polarity fix for the SoPine, some
MAINTAINERS maintainance, and a clk / reset switch to our headers.

----------------------------------------------------------------
Andre Przywara (1):
      arm64: dts: allwinner: Fix SD card CD GPIO for SOPine systems

Chen-Yu Tsai (1):
      arm64: dts: allwinner: h6: Switch to macros for RSB clock/reset indices

Jernej Skrabec (1):
      arm64: dts: allwinner: h6: beelink-gs1: Remove ext. 32 kHz osc reference

Maxime Ripard (2):
      MAINTAINERS: Add our new mailing-list
      MAINTAINERS: Match on allwinner keyword


 MAINTAINERS                                             | 2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dts | 4 ++++
 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi    | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 4 ----
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi            | 4 ++--
 5 files changed, 9 insertions(+), 7 deletions(-)



--HNihV8g0zMosw/Hu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYG2bWQAKCRDj7w1vZxhR
xUb7AP9yjaWNRc7IWRVAZ59uumWykv5kJmUJmEdzw+Jma47FtgEA6p1C8AJK+HzX
P+2ndknt1BFYNq+NebBD5aQf3K9X1wE=
=h8na
-----END PGP SIGNATURE-----

--HNihV8g0zMosw/Hu--
