Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BBA2022F9
	for <linux-sunxi@lists.linux.dev>; Wed,  6 Nov 2024 15:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730908428; cv=none; b=J4stODPOKqq3fFYqrLsekdpnzqOti7oOsmsbF0uhQqXqu4EYZlzUGNDZhqMFS1mRmW9WveGhG7SqYVZhEKBwF8q8bzBLj57aBK+H5mWhuq38kVUV04Io9ZZdefjFYIeh9tre8Ga4oAUWXRSkmNipNR8uMZmjVUrm0UYQ+fRYjOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730908428; c=relaxed/simple;
	bh=Yr2XYRl/QEdKuVaJlW7cGh64FWbceGPSwehS2+4ZYYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uxPwzc8gBYcHSRpd7QHBA4le8Ai0MkO7A73YQ9ssblAVDkv+btYhylzotcgK1tAHzYJE+NN8mr1GoMl32fAuWCfS+Da19i7RNYf1L2Cj3d9d5k7TEp3FXRXObu/Pu2yF5ivqxtUDSjVdQHAZmcYQ8AJ8WJHyLz+4uX26U16OnFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OfFzh+gp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfFzh+gp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91842C4CEC6;
	Wed,  6 Nov 2024 15:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730908427;
	bh=Yr2XYRl/QEdKuVaJlW7cGh64FWbceGPSwehS2+4ZYYQ=;
	h=Date:From:To:Cc:Subject:From;
	b=OfFzh+gpMFce0Fw/iuVG9A/dYiMutG7db+ng9KugAl5GTmCnU2rqu/GltNtFi/J8a
	 m+vSiqNyhX7MC2j+6ntwv9Sd1Z0T5i+xIRiq9iwWdWYPBlfSpED6TqfghkY0x/jf5W
	 QltD5dbWEBOPgC/7O6AgYNttzob6cEXSHLcAJTec/ogxiaLG0w1oh2ZvuQuwZb0Y+c
	 HfiDT+ZB0CY4ovr0t+LPWpiQlVinrXmX90nT1jyPt79av7cmFuE2l/wlRy4COpklun
	 Httl/H0wn0R+h2NkIOaKl9ZcqkU3P+Tz/1yQXAid3E0wSi2AMAdrDCwcCk70Qdp1wl
	 YmuGdaANQrA5w==
Received: by wens.tw (Postfix, from userid 1000)
	id 326B95FB0F; Wed,  6 Nov 2024 23:53:45 +0800 (CST)
Date: Wed, 6 Nov 2024 23:53:45 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner fixes for 6.12
Message-ID: <ZyuRCalH2vhHXm0Q@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jHvUgcaLkj0lpz+u"
Content-Disposition: inline


--jHvUgcaLkj0lpz+u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi-fixes-for-6.12

for you to fetch changes up to dd36ad71ad65968f97630808bc8d605c929b128e:

  ARM: dts: cubieboard4: Fix DCDC5 regulator constraints (2024-10-25 23:27:34 +0800)

----------------------------------------------------------------
Allwinner fixes for 6.12

- Fix DCDC5 voltage range on Cubieboard 4

----------------------------------------------------------------
Andre Przywara (1):
      ARM: dts: cubieboard4: Fix DCDC5 regulator constraints

 arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--jHvUgcaLkj0lpz+u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmcrkQYACgkQOJpUIZwP
JDB6MQ//QVdW64jrLwkNDuuGxduDftgFwTMCo5z+d6T1YcO4MbupEBFBrgKF7ozC
BbtkG3jsauDDLNw/5vC6UKnF8b68JuTfCkTiJna9NwQ/wl0cYXcIBophtHw2oMW+
d1nE0CaIOOAVG5kfNbVH6V2bEP4xBkx6+QG2hxzTiyWPri3u1mUNS/vijkOG/PB/
Tg0XMDbORapVpof1BgDYBQMk4TjEGev3XITifaFbdYvOJSBu6iV1sM8vSw0V7kBP
B8gkYJe7f4ylDQDJuhlxW6muXgVgYFj1CyfeEzGeN0VGt1U0BScYElI/sOf8m7RP
RxYS5ay2zMciA5JJJL/+YGnYCEpOTXKGjOdWGRX95Zc05nx2TSk/6NK9e8XsUpRC
ewPDXNtsHiN8UzLYO8clVOWZnKgy+sWpBzL6CC7MmABo5jU4LYImKDqrHGnSfFCQ
lqgTpQ8b2jno8WDWHFLeoKaG8V18o07FYXhlCx518wOG8JiBrXLLiGshpldZDy8Y
57N4FjoLnU2YcOI4XEQ/YPPMcfQYm11akAeIOr4xUmuKdNts4nLmSeDOsSSYiq8d
76cyoKDI/BlnAjl1zfvJFhMma56vkDwsG3dH176dFPMJaAD47/YotL1FY8cpQp0b
F7It7eZtO4qgcMyLoKIDOiwt+IRzTm4MLDHV99Ju5nHqm3GOJCg=
=2lyZ
-----END PGP SIGNATURE-----

--jHvUgcaLkj0lpz+u--
