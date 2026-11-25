Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627314;
	b=VP4YuQb+IcOd5TF1kI+y2MeP6DHcDRDULK+wzddmLputZ541aN+Xw8lU0wV/w9rQ11VN
	 8C6RID/M37TqExv+U90mJTK2PL9KPGIj0BwQAirOzcnqFmLjfkfBd8992gj8l5q9M2cdi
	 Ao6VPUYoJqyo7erM2ye6xo04iucaBk9nqIgI8xHsIrQ6AwzvmkoNCcGpIDHLRDdiVNQsb
	 ZLL53VAx03bwZS24fGxS5cBphMfkBpQ02u8jUYBUiR8GpRRo96kAu+jYig5TbwzzvYXyO
	 KnLl3AA8bE5R3bYKPWO6Krv8vP0SRz3kTGm27q0rWA3kMLYrDFw4hnmpUnQrkGr3T+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ENdJgXbQROCmKdJO5EaJi6MoXgKwvTQsbT7XHtvuy1s=;
	b=0qoSCHEsz5mzxTOrS1HzTLYVarO9JwObUEOD/2NQVoN+L0HZQnGCECnmXccvJLZDCQRl
	 cMeTq3qjxOWPcbPQk7R/O3a82NbukoErtk3odQxju4rmI3NYhlM0ZDljlkfjfc1aoMHue
	 zoOe5nhlGyyJAv563lGwyyEJwWb24xHZEUPFwLZOcnqu5aEG0clYt/hdjTVVWisywSj6J
	 o5dMCXC2Y3UvG5N7p6pfwL8BARPqf4YMuo7H9z5Ktf1WnVpf+gTIt4CNwelWD9LLqmyna
	 MnAFBuESmYOnWAwiauJ9qGyHZ0AslhNR+BYU90cBGAxYzabwqyvzau2k2bRQkQxY9LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RUXZ3QaU;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924CA606A326
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 17:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 924CA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RUXZ3QaU
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso43471405e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 09:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795627312; x=1796232112; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ENdJgXbQROCmKdJO5EaJi6MoXgKwvTQsbT7XHtvuy1s=;
        b=RUXZ3QaUyR827duO7rIN7wHXxXCtYyIeYDYFFvuTrAZDKTjzZGlSvAM+h5dFrmu8J8
         O2PpIV0QOLWs/tCcdmf5H5tySLgg62Z1l26U488+j9yVMUmwqVD/0VSJAdQ7jFJwiDSo
         nVVOs6kAPyC97jPwkJ5I0t0C+nSFspldpHEFt0Ep2lCBG4QlUGVAaNlPHZYHjPXlvFep
         31bWKvZqIOt0XyuqaSMe6k/i+Bi316X1TCls3p8xUT7Rd+SFYmcweCnbR0b29PqaVWZ3
         G/4gluySotQUVYlxg4h7erGSBixUW1yyr5bkuBXBJa1i0RRMDOAe6ZTA7Ygh2CxstoHt
         1SNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627312; x=1796232112;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENdJgXbQROCmKdJO5EaJi6MoXgKwvTQsbT7XHtvuy1s=;
        b=CFGpgnlZBdPAIwHJyRgZaH5KE0hCjfP0rh16TyTqUl0EokWWW89yl/kfhr51LcEpcP
         YL9jYK/55eOvHTeJOBHLaSduHdfe9ESzE+zLdv24unndX3vnu9Pco2/1N5wPkueN4dJW
         biHuVZ+Feh+T/oUOmue5SjMU+Ylr5pyetDGVORjrFYWv6kpQDjd/aaME0Hh/er16MoJ9
         B06rXmXUPTzc7l1fN9/sdEAX/zkYvKD/Ab4IAUnyOxBvxfARX2mLUv3cNVq/WpTERR+K
         qlVna6XtlHLeERC3yMkW1eA2aHIk1YL3OoYcqxNMNRFASjfW5Y47g1EA/d1h7RpJ6Q9P
         nBzQ==
X-Forwarded-Encrypted: i=1; AL+hErHdrySsuUEAQNpwuOn062HjPxBqoN+b1kAEjP/4Q9c+xG9PxTUAYDI9AexAMghhNlGIhXdnVJDCFSW/uA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8EgejdEdCiwOnO2pzq933oMcPdmdbEctyglahSTq+nUdYveMsU
	0YqeaAIRidwRRF55FZk3z2GjDfXDxzttzc2OAYkQQOFi/0T/jD62rh5eqXzZHHJ5Avk=
X-Gm-Gg: AZFdTZc8YFXsRmK5aS5EyM+YZ6RwCcGscKEjAq3zPH90sMV5c5+Rxh9k4Qly/t8Q04E
	8XqKXl72BgzDEvCiFlpa+/+eQGBzq3radF8rqIVVQ9sjAbU8LZ7YCBKKkdrDlS9ojJNRHNUMiET
	6yHZqBfHi2UpzXC9P5MYe9Ryxkp1Op4ZTvEpvyPfSOz6YNS426c81ujwZdFohs6Ud5cLxTOewxW
	vjDrLsEEXktIGJ+us5wmkZwEdww293RUfFfYHvaQrqRVtaZitye6HejSn9sk3Q5QXWi9n6AlAEt
	YHqfDcQ1IRk+HxyULltTjGDEY6+EKgqCnT0tOYmyp2ZkieH290+YWT8L3j/niar36TyfxDmMhik
	DhPOuHc31TxgismrUHwuT4lknwJcs6YZNW4A4JKcQtTj5Q8RVz9LKumnzJlDnEfgUBhRNa+CaXE
	eUd94vzzoIPR3fM8RKoC+dopa7mfKB46A0Sk3sLkDHpIbgLo4BgOUKATi2qyGdzZZ2BR/TXEfv9
	6WCNYc5fmSRdBBeUj6T2JOzHV/gwBAhmYgR6IaiYfZZ/jf7RCqNl0EnYR1oT2o7sM4AX3vj+bw5
	4Xc9a867CV7PIudnQhYsFcbN+oIG1IIfkecO8kdVNP0huIOYrvjyWJ1uSz3PvXx0HIDpLYwev1H
	S/Ne3z8zRccrU/dRr
X-Received: by 2002:a05:600c:1547:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb8880974amr419686485e9.8.1795627311811;
        Wed, 25 Nov 2026 09:21:51 -0800 (PST)
Received: from localhost (p200300f65f19a904452474b9d670397a.dip0.t-ipconnect.de. [2003:f6:5f19:a904:4524:74b9:d670:397a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb853b216esm590410475e9.12.2026.11.25.09.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:21:50 -0800 (PST)
Date: Wed, 25 Nov 2026 18:21:50 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Takahiro Kuwano <takahiro.kuwano@infineon.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Alexander Usyskin <alexander.usyskin@intel.com>, 
	Joern Engel <joern@lazybastard.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Michal Simek <michal.simek@amd.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Brian Norris <computersforpeace@gmail.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, William Zhang <william.zhang@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 04/10] mtd: spi-nor: Unify of_device_id list terminator
Message-ID: <awcY_FIcD-Lt0_am@monoceros>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
 <20261125-acpi-mtd-v1-4-42ad2f645bee@thegoodpenguin.co.uk>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vscxo3nc4bzujlaw"
Content-Disposition: inline
In-Reply-To: <20261125-acpi-mtd-v1-4-42ad2f645bee@thegoodpenguin.co.uk>


--vscxo3nc4bzujlaw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 04/10] mtd: spi-nor: Unify of_device_id list terminator
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 04:28:30PM +0000, Pawel Zalewski wrote:
> Unify the list terminator to have a single space between the brackets and
> no trailing comma. This change doesn't introduce any diffs between
> pre/post to the compiled binaries of the modified drivers and just aligns
> these to the common style with other *_device_id arrays.
>=20
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> ---
>  drivers/mtd/spi-nor/controllers/hisi-sfc.c  | 2 +-
>  drivers/mtd/spi-nor/controllers/nxp-spifi.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi=
-nor/controllers/hisi-sfc.c
> index 4f6631950a5b..01048ca46a60 100644
> --- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
> +++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
> @@ -474,7 +474,7 @@ static void hisi_spi_nor_remove(struct platform_devic=
e *pdev)
> =20
>  static const struct of_device_id hisi_spi_nor_dt_ids[] =3D {
>  	{ .compatible =3D "hisilicon,fmc-spi-nor"},
> -	{ /* sentinel */ }
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(of, hisi_spi_nor_dt_ids);
> =20
> diff --git a/drivers/mtd/spi-nor/controllers/nxp-spifi.c b/drivers/mtd/sp=
i-nor/controllers/nxp-spifi.c
> index 30fe2d414f07..71ee50eb1a71 100644
> --- a/drivers/mtd/spi-nor/controllers/nxp-spifi.c
> +++ b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
> @@ -440,7 +440,7 @@ static void nxp_spifi_remove(struct platform_device *=
pdev)
> =20
>  static const struct of_device_id nxp_spifi_match[] =3D {
>  	{.compatible =3D "nxp,lpc1773-spifi"},

If you touch this struct you can also add spaces after { and before }.
But that's a nitpick, ignore at will.

> -	{ /* sentinel */ }
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(of, nxp_spifi_match);

Best regards
Uwe

--vscxo3nc4bzujlaw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsHGSsACgkQj4D7WH0S
/k73ogf7BALXlCQ8r5M8ZULyZTCXZBckvup39sfY/19fBNNwXXunI63allBA3oeS
J2HDGz0wNdZ2/y1iggGBavEtOaE6mVsBVcm3jdJ97l/vwZ/DzZ18bG17D+lOa6o0
Kukj1hQ5Q2qvFM8u49aHT99Zp8isHlf3GpEqLzOnphUzqGPj4/9xiIWC887HPgq0
Nfab1Mu6GBOwgze0VnJbpJfJ4rOA6Bz+tZOVjrFqShym3ZSG1ADwwM4HkOixY93y
2Z/oy3nqZHXEeEEg9uml7t299pECJEma5xTr5gSqY9g8tcQXvO8QVWh+dTUSYLTO
i5jse6iRjG93iBKa+gKKv3oEi8y83Q==
=PjDZ
-----END PGP SIGNATURE-----

--vscxo3nc4bzujlaw--
