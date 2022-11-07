Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383AD122AC
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 20:09:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1os8R1-0004nx-VZ; Mon, 07 Nov 2022 21:09:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1os8Qx-002uxN-3v; Mon, 07 Nov 2022 21:09:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1os8Qx-00F2UB-90; Mon, 07 Nov 2022 21:09:27 +0100
Date: Mon, 7 Nov 2022 21:09:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	=?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 01/10] dt-bindings: pwm: allwinner,sun4i-a10: Add
 F1C100s compatible
Message-ID: <20221107200925.ybrxyvlgn4bmth6g@pengutronix.de>
References: <20221107005433.11079-1-andre.przywara@arm.com>
 <20221107005433.11079-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ctwhlbxxw6thwo6y"
Content-Disposition: inline
In-Reply-To: <20221107005433.11079-2-andre.przywara@arm.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sunxi@lists.linux.dev


--ctwhlbxxw6thwo6y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2022 at 12:54:24AM +0000, Andre Przywara wrote:
> The PWM controller in the Allwinner F1C100s series of SoCs is the same
> as in the A20 SoCs, so allow using that as the fallback name.
>=20
> Join the V3s compatible string in an enum on the way.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml      | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pw=
m.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
> index 4cc3cc7c50be..66e400f2a3a4 100644
> --- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
> @@ -25,7 +25,9 @@ properties:
>            - const: allwinner,sun8i-a83t-pwm
>            - const: allwinner,sun8i-h3-pwm
>        - items:
> -          - const: allwinner,sun8i-v3s-pwm
> +          - enum:
> +              - allwinner,suniv-f1c100s-pwm
> +              - allwinner,sun8i-v3s-pwm

LGTM

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ctwhlbxxw6thwo6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmNpZfMACgkQwfwUeK3K
7AkanQf/TOE+zguKbxcD3MlFfApcbGDqejLVCz9lJedUELLCCUtJ8xiKVT8pcVSa
GaUKAuV5OSFYtM9tNxOQBmLnYdilKqxKqBuLGrl0GkgWfMrFRzEpcPy+E1EZz2CQ
YHDvR/AsjWPPDKfnL9chCO7lRTKqlv1lWuIukbYwvSeY0VM12MYsu6YpFKdMz1VO
YiMFhqw3l7mDgShb5VecAW7nGMsO5KGfGuteHvb3SkpK8yQmO5k+Ts+Se/7YKfzS
7nrCM0Ucuvba5iFv9a3V23fu4lTTP7MfkOGnjSthE2tRWkRTnWhwGMOh0N5vEnnT
IMxafQhBqpKVeCP8bm9ExGaXX3f88Q==
=mPTD
-----END PGP SIGNATURE-----

--ctwhlbxxw6thwo6y--
