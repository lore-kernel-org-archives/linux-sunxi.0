Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4916E6FD7
	for <linux-sunxi@lists.linux.dev>; Thu,  1 Dec 2022 15:48:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1p0lnW-0003Yb-1w; Thu, 01 Dec 2022 16:48:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p0lnT-001c1s-6G; Thu, 01 Dec 2022 16:48:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p0lnS-001pRK-QQ; Thu, 01 Dec 2022 16:48:22 +0100
Date: Thu, 1 Dec 2022 16:48:22 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] pwm: sun4i: Propagate errors in .get_state() to the
 caller
Message-ID: <20221201154822.mx7jafj3tyxes5ab@pengutronix.de>
References: <20221201152223.3133-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pvzzkh5g6gs7wysj"
Content-Disposition: inline
In-Reply-To: <20221201152223.3133-1-andre.przywara@arm.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev


--pvzzkh5g6gs7wysj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2022 at 03:22:23PM +0000, Andre Przywara wrote:
> .get_state() can return an error indication now. Make use of it to
> propagate an impossible prescaler encoding, should that have sneaked in
> somehow.
> Also check the return value of clk_get_rate(). That's unlikely to fail,
> but we use that in two divide operations down in the code, so let's
> avoid a divide-by-zero condition on the way.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
>=20
> this goes on top of Uwe's series to introduce and observe .get_state
> failures: https://lore.kernel.org/linux-pwm/20221130152148.2769768-12-u.k=
leine-koenig@pengutronix.de/T/#m9af39aa03bbd9bb7b31b3600f110c65ee0e8e70b
> Actually it only relies on patch 01/11 from that.

I recommend to put this info in machine-readable form into your patch.
If you applied my patch #1 on v6.1-rc1 and this on top, you'd do

	git format-patch -1 --base v6.1-rc1

This results in two additional lines that the build bots can evaluate,
to find the right setup to test your patch.

Apart from that:

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

and thanks to pick up on this topic,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--pvzzkh5g6gs7wysj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmOIzMMACgkQwfwUeK3K
7AmPYQf/VRLlVm87HsOU2kfflZl+lqtTUd7MlJ7BwKXnoZsV/+jaa0fyh5Qpj7uR
ajDzWrjYS22y5ec6BtJLSaVRSqrwXaW95RIJa4TUL9SH2vbSMNxqjFvhhRY85Ej3
kwXqmAPojkmpjIjgEsu7MMQLla1idHqZu1ltfLS5WMPZ6fLgtXWq1S4Ba27ebiZo
ymH89B/4P+3wEjUYnZggZmWW4H6jtoE3FfJUzKpeUt7+Ol8gFFSRj55bDmf490uS
UcHRYaLkK+dNfGRhhr+A2QGNDOaE131UOVutxbUAnR7xvD2I+eYgUo/22f+pvwHR
fe3ytW37idP6SAae/HZsPz3yfE8Jlw==
=ZiZt
-----END PGP SIGNATURE-----

--pvzzkh5g6gs7wysj--
