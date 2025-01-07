Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF541F757F;
	Tue,  7 Jan 2025 23:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736293751; cv=none; b=tQcrH6HoY/eKr49jTK/u3f7JYE6wTl0YeIl6GI2+w4//h3WSKOS/MsrOyTp8XTbUY/ac28ktUMJ1qk8C6938Kb84/rfddw4KpY6oX9jj+iYxMurA24bkYIi+1/ftoVe073aTr8ESZI2wHsJt69xMyOSYWucsdbtE8UDuaidqrg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736293751; c=relaxed/simple;
	bh=LczHp8RpVOiFlyTZ3Oz4yPH8gsV6c5/fOmHG8eOWGdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oILKBWeFdGw5xQfUbr7FQwOu4WfPFjd58+YZpaVsnh8Ji2hmmxgCvskorfUAJC8uo/DbFRT20eD7rOpIE4U8BRs3Uw+JINDH3vCDmp7Mgu46EMtmIuY1QjODObGEDLCfnB8aTZzrSeQOMRKJg7R0u0Gpkz2ik+HDqh25aLAM3MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfmIc5ec; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfmIc5ec"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E30C4CED6;
	Tue,  7 Jan 2025 23:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736293751;
	bh=LczHp8RpVOiFlyTZ3Oz4yPH8gsV6c5/fOmHG8eOWGdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lfmIc5ecaMNktVJj7MSY6txtAGqBKAnuAgx4KWAx0bY7yG4pw/jBTbh3+WlDJGDwU
	 Rn4ti9DEZJdxN4BH7NZ0i5ZBIKcFCqnzGWoap7WKQsHSZejh15sgyUwguK/buJXceT
	 AndABK5ttVmmOWhA89+13CoGeyaH3fDI5va2lZ161RdJsuZeTEsR7qGlN8KLJHKSHP
	 qbO/4jW2toMHqtNGA+ySf/X9u2JGnFrrTUWhBknrzlr5VbCwPbsLFdPwVBjDJMfASM
	 aeZRANukpHHHYot/5/wTL3n0FNqmh1P1h9Rd38YBjANOZ/Nx9nPrFbE3oBG0coVIS5
	 Klq8SJ4JUw9nA==
Date: Tue, 7 Jan 2025 23:49:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] ASoC: sun4i-codec: Use new devm clk and reset APIs
Message-ID: <ddbbc928-f199-44df-918f-9a87b489718c@sirena.org.uk>
References: <20241211222205.1915027-1-csokas.bence@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dbL+kc+XH+pXK2/U"
Content-Disposition: inline
In-Reply-To: <20241211222205.1915027-1-csokas.bence@prolan.hu>
X-Cookie: PIZZA!!


--dbL+kc+XH+pXK2/U
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 11:22:05PM +0100, Bence Cs=C3=B3k=C3=A1s wrote:
> Clean up error handling by using the new devm_
> clock and reset functions. This should make it
> easier to add new code, as we can eliminate the
> "goto ladder" in probe().

This breaks an allmodconfig build:

/build/stage/linux/sound/soc/sunxi/sun4i-codec.c: In function =E2=80=98sun4=
i_codec_remove=E2=80=99:
/build/stage/linux/sound/soc/sunxi/sun4i-codec.c:2380:29: error: unused var=
iable =E2=80=98scodec=E2=80=99 [-Werror=3Dunused-variable]
 2380 |         struct sun4i_codec *scodec =3D snd_soc_card_get_drvdata(car=
d);
      |                             ^~~~~~


--dbL+kc+XH+pXK2/U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd9vXEACgkQJNaLcl1U
h9A+Ewf9GH4JvV4Z1eko/2GDCGSQg7y9scEjSf913yOI+6KzSRt/ofI/NvOhR8QP
tBCqaxKJiFO1D6ceQstMjMBJ09kPgb08ObVGmMI1atakf/2bcPrIKPSblZ5BGYKt
nO50q018u+/KN/hJ8NbeyOLZyEsfN4YejJRgTd6JQJEJoTdSAjCQcFK+C2//QsX7
x9W7WecdOzxIRuN7g60uxH79ccb1Evtszgf9hB9QD+ApbAHU5Bh0fTVEaFbIYMRq
l2T6KIRNUKXjQdKAurJmz3n04OZM5GNxlmYLiKIxb6YhUT3m9Kse7ASM4zANtACV
ScrTP6HW3nfvnPLwHlz96PLTFlA7Rg==
=41hA
-----END PGP SIGNATURE-----

--dbL+kc+XH+pXK2/U--
