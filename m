Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68D170
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 08:07:36 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1lqABr-0000dm-Bv; Mon, 07 Jun 2021 10:00:55 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1lqABn-00033K-TW; Mon, 07 Jun 2021 10:00:51 +0200
Date: Mon, 7 Jun 2021 10:00:51 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Roman Beranek <roman.beranek@prusa3d.cz>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Emil Lenngren <emil.lenngren@gmail.com>,
	Pascal Roeleven <dev@pascalroeleven.nl>,
	Lee Jones <lee.jones@linaro.org>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 1/6] pwm: sun4i: enable clk prior to getting its rate
Message-ID: <20210607080051.anzdfywvbpu52e2f@pengutronix.de>
References: <20210531044608.1006024-1-roman.beranek@prusa3d.com>
 <20210531044608.1006024-2-roman.beranek@prusa3d.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fgvzcr2xl7qwtzjm"
Content-Disposition: inline
In-Reply-To: <20210531044608.1006024-2-roman.beranek@prusa3d.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev


--fgvzcr2xl7qwtzjm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 31, 2021 at 06:46:03AM +0200, Roman Beranek wrote:
> Ensure the PWM clock is enabled prior to retrieving its rate, as is
> already being done in sun4i_pwm_apply.
>=20
> Signed-off-by: Roman Beranek <roman.beranek@prusa3d.com>
> ---
>  drivers/pwm/pwm-sun4i.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
> index e01becd102c0..3721b9894cf6 100644
> --- a/drivers/pwm/pwm-sun4i.c
> +++ b/drivers/pwm/pwm-sun4i.c
> @@ -117,8 +117,15 @@ static void sun4i_pwm_get_state(struct pwm_chip *chi=
p,
>  	u64 clk_rate, tmp;
>  	u32 val;
>  	unsigned int prescaler;
> +	int ret;
> =20
> +	ret =3D clk_prepare_enable(sun4i_pwm->clk);
> +	if (ret) {
> +		dev_err(chip->dev, "failed to enable PWM clock\n");
> +		return;
> +	}
>  	clk_rate =3D clk_get_rate(sun4i_pwm->clk);
> +	clk_disable_unprepare(sun4i_pwm->clk);
> =20
>  	val =3D sun4i_pwm_readl(sun4i_pwm, PWM_CTRL_REG);

If the clock is off, does the PWM actually run? Assuming it doesn't the
right thing to do is to ensure the clock is enabled in .probe iff the
PWM is enabled.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fgvzcr2xl7qwtzjm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmC90jAACgkQwfwUeK3K
7AkTwQf/QHr6m8fTM/0AQ1Q9o6vzNcycIEHwD35swSOiuUM/FJD3zDMwbuaN5P8m
5+Huh5ZopP6VYTl4oRqlb41J2UUzGXVhGRu8XL07fHpps6TYZzxcuPk/oc2nnEfW
J+uEedwhAx/OrvWmZXxGx+0on1HpgBqY7SeGFkr/rB4Dm1uF1Wn+QDgM1J4QOiXt
OmjuMKQItgz7FirKHYyUFqjZ/8v1rseUfl5GjAQlgBQUjAlnxJbL1ZP7EnfGdmdG
5uaggsyAxgmwmEM/tigKDZjTswTKdXYjPthx6zk3MirPSb/EWxfyBGIG1Rd5pym4
faMhKKyIIwRhVAiq80W2occrz6IGGA==
=tXV6
-----END PGP SIGNATURE-----

--fgvzcr2xl7qwtzjm--
