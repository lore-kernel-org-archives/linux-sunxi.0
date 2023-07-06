Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C92FA944
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Jul 2023 20:21:24 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHVTK-00079V-RD; Thu, 06 Jul 2023 22:21:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHVTG-00Ca44-Ox; Thu, 06 Jul 2023 22:20:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHVTG-002pmZ-02; Thu, 06 Jul 2023 22:20:58 +0200
Date: Thu, 6 Jul 2023 22:20:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: privatesub2@gmail.com, linux-kernel@vger.kernel.org,
	thierry.reding@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	p.zabel@pengutronix.de, cristian.ciocaltea@collabora.com,
	Greg KH <gregkh@linuxfoundation.org>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/3] Add support for Allwinner PWM on D1/T113s/R329
 SoCs
Message-ID: <20230706202057.k6rfwfhe3msfkrc4@pengutronix.de>
References: <20230627082334.1253020-1-privatesub2@gmail.com>
 <mhng-0cca3d46-6031-4e8a-8e8f-2c479a20b95d@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bwmf3jgjaq2y6ndf"
Content-Disposition: inline
In-Reply-To: <mhng-0cca3d46-6031-4e8a-8e8f-2c479a20b95d@palmer-ri-x1c9a>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev


--bwmf3jgjaq2y6ndf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jul 06, 2023 at 10:08:47AM -0700, Palmer Dabbelt wrote:
> On Tue, 27 Jun 2023 01:23:23 PDT (-0700), privatesub2@gmail.com wrote:
> > Hi,
> >=20
> > This series adds support for PWM controller on new
> > Allwinner's SoCs, such as D1, T113s and R329. The implemented driver
> > provides basic functionality for control PWM channels.
> >=20
> > v2:
> >  - fix dt-bindings
> >  - fix a remark in the driver
> >=20
> > v3:
> >  - fix dt-bindings
> >  - fix sunxi-d1s-t113.dtsi
> >=20
> > Aleksandr Shubin (3):
> >   dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
> >     controller
> >   pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
> >   riscv: dts: allwinner: d1: Add pwm node
> >=20
> >  .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  86 +++++
> >  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  11 +
> >  drivers/pwm/Kconfig                           |  10 +
> >  drivers/pwm/Makefile                          |   1 +
> >  drivers/pwm/pwm-sun20i.c                      | 322 ++++++++++++++++++
> >  5 files changed, 430 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun=
20i-pwm.yaml
> >  create mode 100644 drivers/pwm/pwm-sun20i.c
>=20
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> I'm not sure if this ended up somewhere, but I'm assuming it's not aimed =
at
> my tree.  LMK if you guys want me to pick it up, I'm dropping it from
> patchwork.

At least patch #2 should go via the pwm tree. It's on my list to review.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bwmf3jgjaq2y6ndf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSnIigACgkQj4D7WH0S
/k6gIwgArBV+EKUdCW1iBFu0o7FWEVZpy0poxb9iDyJN0csWczfWqJw3UbnGdVrq
l8Nt25eIW8lbOaL7Xl1hK49QCeuWFkt7IRk+ZYzD4coLOcK87MrJNJe43SDBOAXX
LiHvL22jR6y5aNpiAgTiXW6mYnX9qrz6cAUzTKqeOqm/s4bwuWR13jHpTQ6lOt1F
w3LuV9R5h38LqFjfPCbQxgstp5816SdoBIiwitKZfyBfCPt7yYDpAq2zn0OQmp2k
cKkqQEOGqE+IzH046/h0PdsmBc7wPqrG+5/GSvdPt6sa2aUkF2TO5nbjaaK/w+GJ
F+8Bd8vtafCPp+QmG+fV9IcYTEqZ6Q==
=VC6G
-----END PGP SIGNATURE-----

--bwmf3jgjaq2y6ndf--
