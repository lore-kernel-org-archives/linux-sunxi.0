Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C037F
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Jun 2023 07:04:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q9KYC-0000oB-KR; Wed, 14 Jun 2023 09:04:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q9KY9-007IK9-8z; Wed, 14 Jun 2023 09:04:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q9KY8-00E8Az-HT; Wed, 14 Jun 2023 09:04:12 +0200
Date: Wed, 14 Jun 2023 09:04:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-input@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 6/7] docs: update some straggling Documentation/arm
 references
Message-ID: <20230614070412.ts5yd47uefkvhlet@pengutronix.de>
References: <20230529144856.102755-1-corbet@lwn.net>
 <20230529144856.102755-7-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p4c3uocja4ru6qiz"
Content-Disposition: inline
In-Reply-To: <20230529144856.102755-7-corbet@lwn.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev


--p4c3uocja4ru6qiz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, May 29, 2023 at 08:48:55AM -0600, Jonathan Corbet wrote:
> The Arm documentation has moved to Documentation/arch/arm; update the
> last remaining references to match.
>=20
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: "Uwe Kleine-K=F6nig" <u.kleine-koenig@pengutronix.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-input@vger.kernel.org
> Cc: linux-sunxi@lists.linux.dev
> Cc: linux-pwm@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

If you respin this series, you can add my:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> # for pwm

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--p4c3uocja4ru6qiz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSJZmsACgkQj4D7WH0S
/k7I6Qf/RuLkOuJd0YIg1k8zFTfaS2bByaI7jkNapwz2cj6IM37CjKT8PnJl0khU
USzG5sc02bVd0COaO0E69Pv1+l86wxBMqx/wRW65PSkBz6krz2skusoIGek56vDe
LKz/YRIGjP3gcIx6fVKjPVgWb3pgQAJyi6iN+yEac+AAgBbK5NtjvRSqrjpKPSC8
+BSS5Tb7JmOthh3NMEwKUOeiBgsjuHCD//UNmenONHQBIWet3+5gOxB+sKVQQZmc
H+bw4c8bVF8elViKHnk/omalp7oIL4l2tFITkpcR0np44NRwr8D4MSsrlEkiSxuy
KAFqHYnkJtypcQQCYJ21VCVOBoU1ig==
=kqLy
-----END PGP SIGNATURE-----

--p4c3uocja4ru6qiz--
