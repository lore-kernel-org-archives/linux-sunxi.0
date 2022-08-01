Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9B47F
	for <linux-sunxi@lists.linux.dev>; Mon,  1 Aug 2022 16:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945BEC433D6;
	Mon,  1 Aug 2022 16:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659369820;
	bh=K8PZRhgkYG3cNsoiyYsSqxmzC5S5rbdYFqDxKPBWgag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=idMcUm3VwOTAalLuTRvxJl4kr1d7Jpt26SetaJhhkPVQ8BX0HxfeHwJTeCGOIPKpX
	 Bt9vOq8TcQE2pnaecmKNy75kxJeSE8b9fHP9CKFQFq8V/djjMlP9b8zkiG4lr7hKp2
	 2fmsL4OT3uC6S9iQ1q5TfK0ifvwq3Xi/G2VgvmnLQTkXaDMnUGHwT+jJleJYXaI6Fi
	 ohXxmEQMCgarm5SE6ZP70fF7/6QY75dkRAs4wiQmkYm2/vMVGjqhBS7py2eIVhF3sL
	 23N3q4BYQRmJxZXZftGX+kvzp2ptWQDi6eIaH2Bp5yvwH6wt50eiI4EsCJfKDXfPX+
	 d+1rLe++PThoQ==
Date: Mon, 1 Aug 2022 17:03:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] regulator: sun20i: Add support for Allwinner D1 LDOs
Message-ID: <Yuf5VQNrBHi7xG81@sirena.org.uk>
References: <20220801044758.12679-1-samuel@sholland.org>
 <20220801044758.12679-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yUJqW8Kc38GtV6bu"
Content-Disposition: inline
In-Reply-To: <20220801044758.12679-2-samuel@sholland.org>
X-Cookie: Dieters live life in the fasting lane.


--yUJqW8Kc38GtV6bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 31, 2022 at 11:47:58PM -0500, Samuel Holland wrote:

> +static const struct regulator_desc sun20i_d1_analog_ldo_descs[] = {
> +	{
> +		.name		= "aldo",
> +		.supply_name	= "vdd33",
> +		.of_match	= "aldo",
> +		.ops		= &sun20i_d1_analog_ldo_ops,
> +		.type		= REGULATOR_VOLTAGE,
> +		.owner		= THIS_MODULE,
> +		.n_voltages	= BIT(3),

I'm really unconvinced that using BIT() is clearer than just writing the
number of voltages directly as a number.

--yUJqW8Kc38GtV6bu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLn+VQACgkQJNaLcl1U
h9BlqQf/VyorEumLx9DM246SpPg5dho5RS+QCt5MT3miehmIayT0RTVcEQzLPx0P
BrxsBsvfEMpglkiW/NjFZ5aQ5nsqRNOe5f67MMt1gLXhps0tU/4szWEIzrtyoN8Z
lCOeUmVhd5+savX5s1DdAHg+YvbKZ9idn0xUY+Bm85R+vttFj8zB56i3tLP5proz
w/+jgHUD0VCu+1yYTXpxHEHdwzxKMh0aWsDWFzC6C+bvbf5smqucs2lhc75Vc/CS
EPPiFY9/7uhX7TjqqaePvChkKpBlF5NShk59rmjawuiNVHowAMQW74OtP1VtA3WO
KPyaTH1QC3JrujzDBEKK026dd6Artw==
=TkpN
-----END PGP SIGNATURE-----

--yUJqW8Kc38GtV6bu--
