Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C850C257D
	for <linux-sunxi@lists.linux.dev>; Wed, 10 Jul 2024 18:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720636387; cv=none; b=NzvbAHb8ib/b7fC5eD5EEy0tT69g45PlqJvfz8HI89SSxvK9AhtFjKhoghkNKCEstCncJMPEAfHS5he5/8giMI+pMxkaHypQHiRyLCTCJ8GEpK1lwSFyZ3rcyUeVnfwpVVpY/N3ccErEEoWqGpakHHdeGgowIpgCOXleqMyXbY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720636387; c=relaxed/simple;
	bh=e7ZBdPwnm5UYeLoiAw+/N6aw4q1vl8AkSLMbEod4nlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pLWvwUsCkko0N5Lr4tPz4cuA737syZdLH8u5ETSt4+aYNAmIu/c3yFUmChTVxnTqoCi9o10OeEvS5IyZkAxDYvFAQe//UjG2ZDk8XBaoLEWAIwMEMnDjU3+fRqeGLWwRgVBfvi8G3di9irZ8PoahfFG6b2oS5iIh4e5OIOha5l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JdYEPnQu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JdYEPnQu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F264C32781;
	Wed, 10 Jul 2024 18:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720636387;
	bh=e7ZBdPwnm5UYeLoiAw+/N6aw4q1vl8AkSLMbEod4nlE=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=JdYEPnQuD0vr7eZDxoIiYnQUbG4xhJ3yAxfapI0jjiwB6rMDowf58e6wbO5fMIrti
	 M8SsLnQrJEh1rCDLXhRZwVoXRn1ne7zmXBdL/C5N+Y2UyH7//PAD86wlF8uhoJLhoM
	 ZTzj9ImjAV59Hy0LiXFunR18/W62kENGOcbcRPbAiSTv0HAMLs7v9gJHXHcd0Wv50n
	 2TUPQvnO18Tq9+mGRztJn80Se9u2i+qcRmrr7HPNDAKeSicZOHm6+a1pu9pZz2by0S
	 /uxubTg0tMs/xC5r2SH9M1AaFnXR3IknUpuAQJI45vs4oi2xCg0DF3jXodxdZ8Kj6k
	 u+4I2ubGak1Lg==
Received: by wens.tw (Postfix, from userid 1000)
	id 4155E5F7C0; Thu, 11 Jul 2024 02:33:05 +0800 (CST)
Date: Thu, 11 Jul 2024 02:33:05 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner SoC driver changes for 6.11 part 2
Message-ID: <Zo7T4YsfamN0PbYK@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hogTjffGDKUpGoyc"
Content-Disposition: inline


--hogTjffGDKUpGoyc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

Here's a couple more Allwinner driver commits for 6.11. Both of them are
minor cleanups, marking regmap related variables as constant.

Please pull.


Thanks
ChenYu



The following changes since commit 3a6fb9025cdf975146b2f2e3771b67f03c4ca3dc:

  dt-bindings: sram: sunxi-sram: Add regulators child (2024-06-30 23:00:49 +0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-for-6.11-2

for you to fetch changes up to e4b5a39c2fca597f10f1aa4c12f8f90dcd9431bd:

  bus: sunxi-rsb: Constify struct regmap_bus (2024-07-11 02:15:19 +0800)

----------------------------------------------------------------
Allwinner SoC driver changes for 6.11 part 2

One additional minor cleanup

- Const-ify |struct regmap_config| in SRAM driver
- Const-ify |struct regmap_bus| in Allwinner RSB bus driver

----------------------------------------------------------------
Javier Carrasco (2):
      soc: sunxi: sram: Constify struct regmap_config
      bus: sunxi-rsb: Constify struct regmap_bus

 drivers/bus/sunxi-rsb.c        | 2 +-
 drivers/soc/sunxi/sunxi_sram.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--hogTjffGDKUpGoyc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmaO0+AACgkQOJpUIZwP
JDDyZxAAiIhd/LvhUwB/VyMO5NFRQPeGrCUL66xXj8Jx3El9ZZRCAY+d2vshaNYP
qvKhAHDgyIgllOaAoOYMe167EhmHhNZqCDPL9sJcqZxSV5TL9uv5jPk48mskbC7I
D/QbbmJDQUHUS4oaWEmihjCbtecDM6eTIpMIx98FExQRFknssKPAG0uhGFH/Vlf1
MmcKpSyysQyikjBpIiWWm4OmVLBbR0BVAKMzJUj/AaDkTz8+GAHpAcl/9TPJDrMR
vhkctrEiscgFL6xIfhMBd5jL1Oe3/kExwKrjzQJtEM3Wzt4iqSHBwBsJU7BuZZv7
eL0mzomFxC8urBJRNbmafM1hV97SMNaOgBKS9XMaS5vJaYwbE1d0+kmstsjvhRC1
Ujb8lkYJV5ebZ3P6Lqr4N6flgYp5stWW8wNnATtuTGuojReN8AqjHTBIulvbsPIM
JCN9MXte5qYgwkfR56X87XCDYOcSVqb/IyO2/m8wZNiWFsr73PvrzEiJ0SqIs0NA
5239SQBRTnynefvxc7cmAv3JhqhY/z8u1jBDOUow0b+d/DjShiqNWEcXR+K8QfFB
iXEc2s3ijc2Fckf9z1zzl3WdFqAwuiRa5ZmAvdn/45K/iIiQnW5RSp8Cf/ZBZQlC
PpIIuDZgfASXdbBEY77YGY9Si31lme5jW64fScVUaxcAdQr+NiE=
=FhWG
-----END PGP SIGNATURE-----

--hogTjffGDKUpGoyc--
