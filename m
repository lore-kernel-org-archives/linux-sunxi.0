Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19B8210D
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Aug 2023 07:15:08 +0000 (UTC)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1qSuRu-000883-Pg; Mon, 07 Aug 2023 09:14:42 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 1A506205885;
	Mon,  7 Aug 2023 07:14:39 +0000 (UTC)
Date: Mon, 7 Aug 2023 09:14:38 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: John Watts <contact@jookia.org>, linux-sunxi@lists.linux.dev,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Maksim Kiselev <bigunclemax@gmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Specify default CAN pins
Message-ID: <20230807-leverage-manatee-687c46db39f8-mkl@pengutronix.de>
References: <20230731023701.2581713-1-contact@jookia.org>
 <3248110.44csPzL39Z@jernej-laptop>
 <ZMyZ5kZSiiJHtdeS@titan>
 <5696365.DvuYhMxLoT@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xgydx3hdd5gawx7l"
Content-Disposition: inline
In-Reply-To: <5696365.DvuYhMxLoT@jernej-laptop>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev


--xgydx3hdd5gawx7l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 04.08.2023 16:39:41, Jernej =C5=A0krabec wrote:
> Dne petek, 04. avgust 2023 ob 08:25:42 CEST je John Watts napisal(a):
> > On Thu, Aug 03, 2023 at 10:59:30PM +0200, Jernej =C5=A0krabec wrote:
> > > pinctrl-names and pinctrl-0 are usually at the top. However, since th=
ere
> > > is no hard rule (I've seen it mixed), I'm fine with it.
> >=20
> > Happy to change if needed.
>=20
> If you don't mind, please do.
>=20
> >=20
> > > Since original DT node entry goes through netdev tree, this should be
> > > picked there or it can be dropped there and I pick both patches or I =
can
> > > pick patch for later kernel version.
> >=20
> > Do I have to do something based on this, like resend my patch?
>=20
> Nothing on your side.
>=20
> Marc, since you took original patch through netdev tree, what is your dec=
ision=20
> here?

I'll take the DT patches though linux-can-next to net-next.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--xgydx3hdd5gawx7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmTQmdoACgkQvlAcSiqK
BOgNigf/WQ0j4jhWfbYXaY/33E7hWV8x/a7lA0uFjqImrlzx6N9e9haXbCDz8Prm
wlqXv10RoPcam5UnDHoDmeg7RASAIkLBKAFiuTpWZnOEiV77CB8H7sHELLiT8hOg
W1R26KjIU0a3TFrBy3vfRZc+lRL3Jxcu7X/eh+dMUM9N+bMf0x7h+MW5Wx4CbC6k
SR0j4D5Cxgi5EcXjGl8SJxatOmfGxBkjlKgJmiw0vUI5ISgluQrZF3m9adflXAza
IoPSI+WPU7uMHIvMvRv0Ed4MvNhZabRATEAjOTvJsmq0grjT4rk9xYv4ZGEET/Rm
xSbfq22jvd65w0kOt5NvtJs/NzZxVQ==
=MX/Y
-----END PGP SIGNATURE-----

--xgydx3hdd5gawx7l--
