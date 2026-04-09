Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79362BEC43
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Apr 2026 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750218; cv=none; b=prwj5TfGgkEpnp85g8rMGwewn4+MoKijtO71LI59aqQ2+eESsnYD7fXn2uZNAHRgTDghV5VSBnauoJN4AwNHXpZmuVxNeBzw/XR3qf9CVSlJxGMBOAu2RjXXEYIbVR6q6LBBO33Y493lQobYzNtd4YocNHmr6sqzJ8abT9+bxcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750218; c=relaxed/simple;
	bh=L4oBPpb6zF+cwKGgFkUACA1XKFZuNbZNq1o6ZrV9ZZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8saxXGxkZw6Sj0hOG7jEwKcytiTILXbpGkvPWjbRNa7J2YW+8adMzfih3cBrfLDpRnbs15V0z+1lX4SQaqqoDpz3OuFkpF+iQqG0TgvH5lrmKUKaIOD+eG0zkHOWDpqvBpi8P9racH5jeawjidfJ+nOX5vUKnACcS/mwSOQwSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 585441F8005A
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Apr 2026 15:56:53 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 81849B401B9; Thu,  9 Apr 2026 15:56:51 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 74E86B401B3;
	Thu,  9 Apr 2026 15:56:50 +0000 (UTC)
Date: Thu, 9 Apr 2026 17:56:48 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/3] sunxi: spl: fix SPL_SUNXI_LED active low
 configuration
Message-ID: <adfMQBPdntWy1KIq@shepard>
References: <20260407223447.4956-1-andre.przywara@arm.com>
 <20260407223447.4956-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Jn4+F60Kq+ARpK2Q"
Content-Disposition: inline
In-Reply-To: <20260407223447.4956-2-andre.przywara@arm.com>


--Jn4+F60Kq+ARpK2Q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed 08 Apr 26, 00:34, Andre Przywara wrote:
> The newly introduced Allwinner SPL LED "framework" defined a
> SPL_SUNXI_LED_STATUS_STATE Kconfig symbol, that was supposed to denote
> the active-low vs. active-high polarity of the LED. However this is
> a bool symbol, so it will simply vanish if not defined, and we cannot use
> it directly inside a C statement.
>=20
> Filter the symbol through the IS_ENABLED() macro, which will return 0 if
> the symbol is not defined, which is the intended value here.
>=20
> This fixes configuring LEDs with active-low polarity.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  board/sunxi/board.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> index d7722d1858a..80dcae9c1a4 100644
> --- a/board/sunxi/board.c
> +++ b/board/sunxi/board.c
> @@ -563,7 +563,7 @@ static void sunxi_spl_store_dram_size(phys_addr_t dra=
m_size)
>  static void status_led_init(void)
>  {
>  #if CONFIG_IS_ENABLED(SUNXI_LED_STATUS)
> -	unsigned int state =3D CONFIG_SPL_SUNXI_LED_STATUS_STATE;
> +	unsigned int state =3D IS_ENABLED(CONFIG_SPL_SUNXI_LED_STATUS_STATE);

Sorry I didn't react to the initial submission, but it feels like the
CONFIG_SPL_SUNXI_LED_STATUS_STATE symbol really means active-high if enabled
and active-low if disabled. The name would suggest that it's an int with a =
value
of either 0 or 1 instead.

I think it would be less confusing to call the symbol
CONFIG_SPL_SUNXI_LED_STATUS_ACTIVE_LOW and reverse its meaning, so that we =
can
spare defining it in most configs (that will be active-high).
Also the description currently mentions "initial state" which may be confus=
ing
as it could refer to the state inherited after reset (e.g. due to some pull
resistor) or the state we do set in the SPL.

>  	unsigned int gpio =3D CONFIG_SPL_SUNXI_LED_STATUS_BIT;

And while at it I would rename this to something like:
CONFIG_SPL_SUNXI_LED_STATUS_GPIO since it indicates the GPIO number, not a
specific bit in a sunxi-specific kind of register.

What do you think?

All the best,

Paul

> =20
>  	gpio_request(gpio, "gpio_led");
> --=20
> 2.46.4
>=20

--=20
Paul Kocialkowski,

Free software developer - https://www.paulk.fr/
Independent contractor - sys-base - https://www.sys-base.io/

Contributor to fully free software support for selected hardware.

--Jn4+F60Kq+ARpK2Q
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnXzEAACgkQhP3B6o/u
lQy5aQ//YNwc9uQr5RXULI4XnctXJPcIxT/qiZtaUVp8okRMSqpQ7ZE1wM+NnWgw
gHO36vV3LolXrH59PqdMGSweXm7WTGgZcgvYr0uuSAAMMZZHIXeU/ysNs5NWy+iX
RMSbJLqL400uz4pbPchtQ3Khz/yzN3Ey8dello8ZcqzEqm2iQB7XJ7jux4AS9DPS
eSk5ZzFm0elhv6RfjfhxJGqhtl+7MCb+NTBu3Mozp1lj6tvMO2T/zIVoxNAMDDCw
0pSodkPGhxu1NCHk7aiV7oJuaYNXjsfrvO/otKNOmebZPFJBtxrbSVYn1u4PNeVt
Ix+J+OHEB40hIASV4mxwSRzYi2W6/jgcwNh30XJX0Q0KRuGdcUK+hUGNqxfbKF9u
YOXF1ogZNccNhYWam1BElrXiuRtColdLrAyuE5Xz+NYZbpTTXAMPR4q3A5G+LmyV
BYdtsb0uQUkPzbca6GjUG8RluMSLoLIpyWwx3DHkqCf0fJrcTWjvsMRpEOSUznmO
s1gT/EiINEV9LsgGdZxmCqFADf5Ydm75ZeAEMIQrtt2zecxkVckrDwMMJ7MTDBsK
9oTnMNXKSDjDJsvjecIbXMfIyUvYsthiDS8u4aYWdrLLDrhcfyQUZ85x0KDe+bVb
r5NdU20d06mMjDuSncd6CyGa547W7xV023wItcgjrsVI2F/qPvA=
=mNpH
-----END PGP SIGNATURE-----

--Jn4+F60Kq+ARpK2Q--
