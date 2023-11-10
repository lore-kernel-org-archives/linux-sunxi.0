Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B3513ADA
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Nov 2023 10:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 153F7106F;
	Fri, 10 Nov 2023 02:18:58 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 566393F6C4;
	Fri, 10 Nov 2023 02:18:12 -0800 (PST)
Date: Fri, 10 Nov 2023 10:18:09 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 06/12] bus: sun50i-de2: Convert to platform remove
 callback returning void
Message-ID: <20231110101809.78f64217@donnerap.manchester.arm.com>
In-Reply-To: <20231109202830.4124591-7-u.kleine-koenig@pengutronix.de>
References: <20231109202830.4124591-1-u.kleine-koenig@pengutronix.de>
	<20231109202830.4124591-7-u.kleine-koenig@pengutronix.de>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu,  9 Nov 2023 21:28:36 +0100
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

Hi,

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>=20
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/bus/sun50i-de2.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/bus/sun50i-de2.c b/drivers/bus/sun50i-de2.c
> index 414f29cdedf0..3339311ce068 100644
> --- a/drivers/bus/sun50i-de2.c
> +++ b/drivers/bus/sun50i-de2.c
> @@ -24,10 +24,9 @@ static int sun50i_de2_bus_probe(struct platform_device=
 *pdev)
>  	return 0;
>  }
> =20
> -static int sun50i_de2_bus_remove(struct platform_device *pdev)
> +static void sun50i_de2_bus_remove(struct platform_device *pdev)
>  {
>  	sunxi_sram_release(&pdev->dev);
> -	return 0;
>  }
> =20
>  static const struct of_device_id sun50i_de2_bus_of_match[] =3D {
> @@ -37,7 +36,7 @@ static const struct of_device_id sun50i_de2_bus_of_matc=
h[] =3D {
> =20
>  static struct platform_driver sun50i_de2_bus_driver =3D {
>  	.probe =3D sun50i_de2_bus_probe,
> -	.remove =3D sun50i_de2_bus_remove,
> +	.remove_new =3D sun50i_de2_bus_remove,
>  	.driver =3D {
>  		.name =3D "sun50i-de2-bus",
>  		.of_match_table =3D sun50i_de2_bus_of_match,

