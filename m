Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945971FA1
	for <linux-sunxi@lists.linux.dev>; Fri,  3 Mar 2023 17:29:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1E5F106F;
	Fri,  3 Mar 2023 09:30:13 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FA503F67D;
	Fri,  3 Mar 2023 09:29:29 -0800 (PST)
Date: Fri, 3 Mar 2023 17:29:25 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH 74/87] spi: sun4i: Convert to platform remove callback
 returning void
Message-ID: <20230303172925.6a150e9a@donnerap.cambridge.arm.com>
In-Reply-To: <20230303172041.2103336-75-u.kleine-koenig@pengutronix.de>
References: <20230303172041.2103336-1-u.kleine-koenig@pengutronix.de>
	<20230303172041.2103336-75-u.kleine-koenig@pengutronix.de>
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

On Fri,  3 Mar 2023 18:20:28 +0100
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/spi/spi-sun4i.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
> index 6000d0761206..994d0fb50e68 100644
> --- a/drivers/spi/spi-sun4i.c
> +++ b/drivers/spi/spi-sun4i.c
> @@ -516,11 +516,9 @@ static int sun4i_spi_probe(struct platform_device *p=
dev)
>  	return ret;
>  }
> =20
> -static int sun4i_spi_remove(struct platform_device *pdev)
> +static void sun4i_spi_remove(struct platform_device *pdev)
>  {
>  	pm_runtime_force_suspend(&pdev->dev);
> -
> -	return 0;
>  }
> =20
>  static const struct of_device_id sun4i_spi_match[] =3D {
> @@ -536,7 +534,7 @@ static const struct dev_pm_ops sun4i_spi_pm_ops =3D {
> =20
>  static struct platform_driver sun4i_spi_driver =3D {
>  	.probe	=3D sun4i_spi_probe,
> -	.remove	=3D sun4i_spi_remove,
> +	.remove_new =3D sun4i_spi_remove,
>  	.driver	=3D {
>  		.name		=3D "sun4i-spi",
>  		.of_match_table	=3D sun4i_spi_match,

