Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3FF268FCF
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Mar 2025 15:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741880046; cv=none; b=mLJgWqZkYLu1yx6ys46BsQqAv3/YaHY1zsgEf9sbs6mFzSkm1YKPD2QgS5THQL54v0oRk8sn9IBbTtSYdJurkAySlvpa2KvWptI5Q1kFgjQ4gCv8/y+58dfyANLziAcZrQxxfSH3R2uWjhMf11AIWjc8Xkh0oc+CRRzbUyEgHm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741880046; c=relaxed/simple;
	bh=Toz2VTcsyobehQEDG0cJrm5RPXMUb2+0ksBhaQGMR1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rpmgznjOkOhF4hqSuD8x4bg0CFur8sertLgcy5L3wIl9E6xPdHDaZb+5iLkQ+Zjj+0FW48zCKTKU+z50x6NGwNmzo6Do5cQYBjgjWYTXtSLiVhhPWKMKijTIxJCMmoOrlcDO6lQ7MqtA/jw5Ni2NURuT5uH53U/NnRiOzIxfXCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Po+cLDjd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Po+cLDjd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A77C4CEDD;
	Thu, 13 Mar 2025 15:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741880046;
	bh=Toz2VTcsyobehQEDG0cJrm5RPXMUb2+0ksBhaQGMR1s=;
	h=Date:From:To:Cc:Subject:From;
	b=Po+cLDjd3M11/1oitHJkKxim2mkT8imMEMuE+OdnPMUgOK9QKYXlkNiXEt8ud59GX
	 xuFWFKGrTFQ1n0NBdKCP5tIFRGitLCYNX8af311yYSr/nc1uN0WqGT/NWmwFMLIXDt
	 31HENkgVdVQcmrs9vn7jq8A3M+JoXJQyO5RNMLQ5lh+6XI7UBokSqMkc7Q9q7Bn6/l
	 Rd7uY8uF8TcCtMWPfQe1PRZ5Fq5KXQJo4DAfitfv418Ivquyl8lWN6Gt+jbJNYGTvK
	 CJp/WeZJRV4HPyMEwzR9yvN5YZJl8jWZK6H7wzMsGJz4IMhui+Y+ymHY+tewEEP0Fq
	 iTOZ/9kUhwPnQ==
Received: by wens.tw (Postfix, from userid 1000)
	id BE0BC5FBF4; Thu, 13 Mar 2025 20:44:40 +0800 (CST)
Date: Thu, 13 Mar 2025 20:44:40 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner device tree changes for 6.15
Message-ID: <Z9LTOHJDY2p0lNG0@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V5GzvCGLWhTVTWN3"
Content-Disposition: inline


--V5GzvCGLWhTVTWN3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi-dt-for-6.15

for you to fetch changes up to a8181e6861fec3068f393d77ff81b2aaf4ea4203:

  arm64: dts: allwinner: a100: Add CPU Operating Performance Points table (2025-02-22 21:17:50 +0800)

----------------------------------------------------------------
Allwinner device tree changes for 6.15

- New board support: NetCube Systems Kumquat
- Enable USB and LED on Anbernic RG35XX
- Fix reboot GPIO detection logic on Anbernic RG35XX
- Disable (non-existent) battery thermistor on Anbernic RG35XX
- Add CPU OPP table for A100

----------------------------------------------------------------
Chris Morgan (4):
      arm64: dts: allwinner: h700: Set cpusldo to always-on for RG35XX
      arm64: dts: allwinner: h700: Add LED1 for Anbernic RG35XX
      arm64: dts: allwinner: h700: Add USB Host for RG35XX-H
      arm64: dts: allwinner: rg35xx: Add no-thermistor property for battery

Lukas Schmid (4):
      dt-bindings: vendor-prefixes: Add NetCube Systems Austria name
      dt-bindings: arm: sunxi: Add NetCube Systems Kumquat board
      ARM: dts: sunxi: add uart1_pe pinctrl for sun8i-v3s
      ARM: dts: sunxi: add support for NetCube Systems Kumquat

Shuosheng Huang (1):
      arm64: dts: allwinner: a100: Add CPU Operating Performance Points table

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/allwinner/Makefile               |   2 +
 .../dts/allwinner/sun8i-v3s-netcube-kumquat.dts    | 276 +++++++++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi         |   6 +
 .../dts/allwinner/sun50i-a100-allwinner-perf1.dts  |   5 +
 .../boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi    |  90 +++++++
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     |   8 +
 .../allwinner/sun50i-h700-anbernic-rg35xx-2024.dts |  18 +-
 .../allwinner/sun50i-h700-anbernic-rg35xx-h.dts    |  23 ++
 10 files changed, 434 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi

--V5GzvCGLWhTVTWN3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmfS0zYACgkQOJpUIZwP
JDAj3A/+OXZAJYwn40wiIZodHuTKJ8g7AvWwn3yxuc4ocKPjYcbmCGFCCP2Szd8u
hblBU6JZsJ6JUU0OhonF8Xum96pVCR/xTS14AaU7XzFLZothIynoKKmv9whyZ71k
QVna86mkhROAWxNvO/HXrNkzXxXZUkYuDZ1yAu16mu3CesJ+hS3BSPEDovvETGDt
NU0S2APZ610L0aA2odAq5B7MeROLfgv9cSIgTKRzRWA12G6a9yW4bZuSwnPXBi7U
XiWYAD/yYjAZ0d5WfATamAQ8bixrPoHnQowHqQiNyRLh1gndKubOUAOM35VlrVFG
ehqWj1H17pXSqqvIbQlTc3lxN1Sh3E8pxwhb5MHpvKCwfS2eRuZf5WNhGxorWkJK
Xb/ks/vXgJsxr4TuYVW88Kl2j/V0WXVb1goFcqNMIXFkU0XNQrGpWgTXd4ErBRRs
TQPZrINDX4/gwZieNBjA+WO7A7usTTp22vITs5XBXiUXOIoDsL0g1aP3DHj/9arG
yPss8fgBfftvuNvpdCC7EoK6adF2Dny2qFxztmtUseP4/wk83R19v5eu6k/Zqpa4
zAZ8XicEpd7l8lVrt7KXRpY1TUIG3ldNNI/vgP/t/GMlKh7uNMN8lGF92CXbc4X3
cS2MB3vkGoJPya4U0zSq4FJvCylaAOXAWr/KC/k/gwcAeF8iles=
=0w4i
-----END PGP SIGNATURE-----

--V5GzvCGLWhTVTWN3--
