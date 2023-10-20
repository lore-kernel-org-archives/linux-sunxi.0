Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A28156EE
	for <linux-sunxi@lists.linux.dev>; Fri, 20 Oct 2023 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EB082F4;
	Fri, 20 Oct 2023 03:13:20 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0FDF3F5A1;
	Fri, 20 Oct 2023 03:12:37 -0700 (PDT)
Date: Fri, 20 Oct 2023 11:12:35 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, Corentin Labbe <clabbe.montjoie@gmail.com>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, Rob
 Herring <robh@kernel.org>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de
Subject: Re: [PATCH 03/42] crypto: sun8i-ss - Convert to platform remove
 callback returning void
Message-ID: <20231020111235.413fc617@donnerap.manchester.arm.com>
In-Reply-To: <20231020075521.2121571-47-u.kleine-koenig@pengutronix.de>
References: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
	<20231020075521.2121571-47-u.kleine-koenig@pengutronix.de>
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

On Fri, 20 Oct 2023 09:55:25 +0200
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
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c b/drivers/=
crypto/allwinner/sun8i-ss/sun8i-ss-core.c
> index 4a9587285c04..f14c60359d19 100644
> --- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
> +++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c
> @@ -908,7 +908,7 @@ static int sun8i_ss_probe(struct platform_device *pde=
v)
>  	return err;
>  }
> =20
> -static int sun8i_ss_remove(struct platform_device *pdev)
> +static void sun8i_ss_remove(struct platform_device *pdev)
>  {
>  	struct sun8i_ss_dev *ss =3D platform_get_drvdata(pdev);
> =20
> @@ -921,8 +921,6 @@ static int sun8i_ss_remove(struct platform_device *pd=
ev)
>  	sun8i_ss_free_flows(ss, MAXFLOW - 1);
> =20
>  	sun8i_ss_pm_exit(ss);
> -
> -	return 0;
>  }
> =20
>  static const struct of_device_id sun8i_ss_crypto_of_match_table[] =3D {
> @@ -936,7 +934,7 @@ MODULE_DEVICE_TABLE(of, sun8i_ss_crypto_of_match_tabl=
e);
> =20
>  static struct platform_driver sun8i_ss_driver =3D {
>  	.probe		 =3D sun8i_ss_probe,
> -	.remove		 =3D sun8i_ss_remove,
> +	.remove_new	 =3D sun8i_ss_remove,
>  	.driver		 =3D {
>  		.name		=3D "sun8i-ss",
>  		.pm             =3D &sun8i_ss_pm_ops,

