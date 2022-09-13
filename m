Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16DB3C10
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Sep 2022 16:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D1DC433C1;
	Tue, 13 Sep 2022 16:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663085071;
	bh=6Tb1sUxJd8dJSLR0kzh76bNzgOnCELvZEdTlXBGdo74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PheyAgfTkCSP3WusJLXvYkxhsvdu5x7NwAb77YJp6uTLsFzMXhfPj5sL/UkcNBYlJ
	 igl+prwhPZ8shp+dhWpY5Unxz2BzCpBSiZsxZQSe6dwXpPGFxf6PKcR5pl9jIhZbDY
	 Kw1LFol0B4iu2dKWbOCou+G7BrbXvAUKD3Y6w8WCN+LuN2L3gxutkJDjpR2FNoLAYR
	 KIwb7oDhgeHYnXcjcvnUSlh9Vm7lc5jfmcLJgx5yYMrzmp0YH6Qb3VbP0OzI1fR2VD
	 WGhQa57ASkwWj8RlzeKHeRHiRazD2+A087uFkiGjqqiKAhhP7ILqfHXpWSuWdpnC9S
	 gfilQsh4igr4g==
Date: Tue, 13 Sep 2022 17:04:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: sunxi: sun4i-codec: set debugfs_prefix for CPU
 DAI component
Message-ID: <YyCqC2EypxnoJFk7@sirena.org.uk>
References: <20220911145713.55199-1-mike.rudenko@gmail.com>
 <20220911145713.55199-2-mike.rudenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tnCcChlqU0Imzw0K"
Content-Disposition: inline
In-Reply-To: <20220911145713.55199-2-mike.rudenko@gmail.com>
X-Cookie: ... I have read the INSTRUCTIONS ...


--tnCcChlqU0Imzw0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 11, 2022 at 05:57:12PM +0300, Mikhail Rudenko wrote:
> At present, succesfull probing of H3 Codec results in an error
>=20
>     debugfs: Directory '1c22c00.codec' with parent 'H3 Audio Codec' alrea=
dy present!
>=20
> This is caused by a directory name conflict between codec
> components. Fix it by setting debugfs_prefix for the CPU DAI
> component.

This doesn't apply against current code, please check and resend.

--tnCcChlqU0Imzw0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMgqgoACgkQJNaLcl1U
h9BpWAf+JC1VIGpEuZdvAM6o78KE4CJpeeq0Ui9NrveL6c7kukJdKu+CocTWndfh
i3O+dtlkWNqZgOk7sOs4LRx651un/NqsygQkWr25B4CjGXoxJCf6YpaMXE7TGVuf
gJ6HYi2zSWoK7Yni6uScEU7D2HtnCQnwfI33jWM2GK6pwGZOTby86HtC/p1wnT+q
QFUTx54l0bYUkVfq+FLuPyQRmbMGQ4A8XFsQ9TQOlXC69sWna9yc5APBNXOcPR/6
lEUm8A0MZJJ8jZbUqOaG/PBZitXZ0r3vVNnLauiJaIOBHjwj6BW2Ut8oRZMoRDvG
x+5GTQ058lJw4SZvzZl5908v44s69A==
=2cfA
-----END PGP SIGNATURE-----

--tnCcChlqU0Imzw0K--
