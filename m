Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D9139768C
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Apr 2026 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777468097; cv=none; b=VR1Bo6F4+Eh7Jf7//RlVlNzwnBai+sgYMlJnMac30jWsRIqBl85hqqZeKwrDgrH3qcywffoXLC+EPJBHcuuU8YCz2yrRmkyzjt9h3LZvanPudV5QEs1D2jydrEdBBcDI0wkJMOxS8l3Az+PIj2XerZz5blW2SH4O/zd+cxCGeAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777468097; c=relaxed/simple;
	bh=y4ilU+X8x/qwO93MtMUf8tjmBZVycLjpMUIg8AXxeXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxO3nYAz+A3WDKpD8uYXJHRsqvcNAHou1WySF4IdOdxm4WYRrLnYbPT4SZeP45aaUh3xLGlCAev5L/42E+cLKEFaai8D7O2KzQEkmaF6ZT8/LRVrqS0Iv7WowvR3xpLjNN9UPsrKktHSJLQCC7f6tisCN3AMYTnORxEUWeMMDQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 62FC31F8005C
	for <linux-sunxi@lists.linux.dev>; Wed, 29 Apr 2026 13:08:04 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id A3937B404A1; Wed, 29 Apr 2026 13:08:02 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id BC82BB4049D;
	Wed, 29 Apr 2026 13:08:00 +0000 (UTC)
Date: Wed, 29 Apr 2026 15:07:58 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/3] sunxi: spl: fix SPL_SUNXI_LED active low
 configuration
Message-ID: <afICrnsK3Frmp7Hp@shepard>
References: <20260429092828.3076719-1-andre.przywara@arm.com>
 <20260429092828.3076719-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l3/hIRm247/+OaIU"
Content-Disposition: inline
In-Reply-To: <20260429092828.3076719-2-andre.przywara@arm.com>


--l3/hIRm247/+OaIU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andre,

On Wed 29 Apr 26, 11:28, Andre Przywara wrote:
> The newly introduced Allwinner SPL LED "framework" defined a
> SPL_SUNXI_LED_STATUS_STATE Kconfig symbol, that was supposed to denote
> the active-low vs. active-high polarity of the LED. However this is
> a bool symbol, so it will simply vanish if not defined, and we cannot use
> it directly inside a C statement.
>=20
> Filter the symbol through the IS_ENABLED() macro, which will return 0 if
> the symbol is not defined, which is the intended value here.
>=20
> Since the STATUS_STATE name is a bit confusing, rename it to ACTIVE_HIGH
> on the way, because that is its real meaning. Also the LED_STATUS_BIT
> name for the GPIO number is similarly a remnant of the old status LED
> code, so rename it to LED_STATUS_GPIO as well.
>=20
> This fixes configuring LEDs with active-low polarity.
>
> Fixes: 256557dd9aae ("sunxi: remove usage of legacy LED API")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Thanks for your work!

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>

All the best,

Paul

> ---
>  arch/arm/mach-sunxi/Kconfig | 10 ++++++----
>  board/sunxi/board.c         |  4 ++--
>  configs/pinephone_defconfig |  3 +--
>  3 files changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index 89f0e77bcdb..07d7ea2b7ad 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -1245,15 +1245,17 @@ config SPL_SUNXI_LED_STATUS
> =20
>  if SPL_SUNXI_LED_STATUS
> =20
> -config SPL_SUNXI_LED_STATUS_BIT
> +config SPL_SUNXI_LED_STATUS_GPIO
>  	int "GPIO number for GPIO status LED"
>  	help
>  	  GPIO number for the GPIO controlling the GPIO status LED in SPL.
> =20
> -config SPL_SUNXI_LED_STATUS_STATE
> -	bool "GPIO status LED initial state is on"
> +config SPL_SUNXI_LED_STATUS_ACTIVE_HIGH
> +	bool "GPIO status LED is active high"
> +	default y
>  	help
> -	  Whether the initial state of the status LED in SPL must be on or off.
> +	  Whether the GPIO of the status LED must be set high or low to turn
> +	  the LED on.
> =20
>  endif # SPL_SUNXI_LED_STATUS
> =20
> diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> index d7722d1858a..3d1afec7c66 100644
> --- a/board/sunxi/board.c
> +++ b/board/sunxi/board.c
> @@ -563,8 +563,8 @@ static void sunxi_spl_store_dram_size(phys_addr_t dra=
m_size)
>  static void status_led_init(void)
>  {
>  #if CONFIG_IS_ENABLED(SUNXI_LED_STATUS)
> -	unsigned int state =3D CONFIG_SPL_SUNXI_LED_STATUS_STATE;
> -	unsigned int gpio =3D CONFIG_SPL_SUNXI_LED_STATUS_BIT;
> +	unsigned int state =3D IS_ENABLED(CONFIG_SPL_SUNXI_LED_STATUS_ACTIVE_HI=
GH);
> +	unsigned int gpio =3D CONFIG_SPL_SUNXI_LED_STATUS_GPIO;
> =20
>  	gpio_request(gpio, "gpio_led");
>  	gpio_direction_output(gpio, state);
> diff --git a/configs/pinephone_defconfig b/configs/pinephone_defconfig
> index ed7dbc1852b..3a4f4ec51cf 100644
> --- a/configs/pinephone_defconfig
> +++ b/configs/pinephone_defconfig
> @@ -9,8 +9,7 @@ CONFIG_DRAM_ZQ=3D3881949
>  CONFIG_MMC_SUNXI_SLOT_EXTRA=3D2
>  CONFIG_PINEPHONE_DT_SELECTION=3Dy
>  CONFIG_SPL_SUNXI_LED_STATUS=3Dy
> -CONFIG_SPL_SUNXI_LED_STATUS_BIT=3D114
> -CONFIG_SPL_SUNXI_LED_STATUS_STATE=3Dy
> +CONFIG_SPL_SUNXI_LED_STATUS_GPIO=3D114
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
>  CONFIG_CMD_PSTORE=3Dy
>  CONFIG_CMD_PSTORE_MEM_ADDR=3D0x61000000
> --=20
> 2.43.0
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--l3/hIRm247/+OaIU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnyAq4ACgkQhP3B6o/u
lQweBw/9FExtC6hps+5dTSc7XP1GphCFA5ObGS/SHeBB6FX0e6x1owTrMo2tgo1t
Ecxeosenphxj4fxYmiV50f+7dgRz238ox3wHNq3QKXFpm0Gb8bLxEBFFG6YwiSwv
crIVfQtFIiQ5Ii5mipHRG3fsha/p30Og1XuhCVw6Wps/bLJx1HDj2PHlcwWLv8nH
4RWAgqDYv5LogStjo+j4GWPm2CHF6oCcNYYAs9cc3zJYGbLSjCDgQgx9E/DUM9lQ
FX/cBXqepZ/XoclFkmVugXl68MAK8lMGfCJpPFtqL6rGE/Cx8aAbJ2SclpolKna+
AAsZekQtmYT49HZT6F3ghR8ydx/9ZIJj1I8FZ5/aNSu94QFhnQ26lpPy0XiwPC78
TfxRaI7e4k0UPjbiBEva9SM3ZqW0cwA3yx+3dt7uUVUTdd59mo1IwjdSKNgYaHWM
R2m+qqswg3qzChrYd9qZ9HEUIm/9rxKGrT1saKCG4iEKHiQfP3CuGt32TwUK4sg7
7qlDO2EzDCf0mEAqEMUrHr/oKoxcu1fPGxqIM4iPS8gjHpxfQPF3IGKv7KsdfCHH
/ecNiG5BjO8DZshJOA4TH1ds+xkDHOHR0ojQNmUGhNB+agEaC7VX5uisvSslsnp8
zUJSsw8KST+Be7QaXJ3tNhADKvRS3O9yKNT4d9hTL0F2/awjGmg=
=JYf0
-----END PGP SIGNATURE-----

--l3/hIRm247/+OaIU--
