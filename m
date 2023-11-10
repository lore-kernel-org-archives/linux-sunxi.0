Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7EE134D3
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Nov 2023 10:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6AAFB106F;
	Fri, 10 Nov 2023 02:20:53 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0943C3F6C4;
	Fri, 10 Nov 2023 02:20:06 -0800 (PST)
Date: Fri, 10 Nov 2023 10:20:04 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede
 <hdegoede@redhat.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, Rob
 Herring <robh@kernel.org>, Yangtao Li <frank.li@vivo.com>, Yuan Can
 <yuancan@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Subject: Re: [PATCH 07/12] bus: sunxi-rsb: Convert to platform remove
 callback returning void
Message-ID: <20231110102004.39757156@donnerap.manchester.arm.com>
In-Reply-To: <20231109202830.4124591-8-u.kleine-koenig@pengutronix.de>
References: <20231109202830.4124591-1-u.kleine-koenig@pengutronix.de>
	<20231109202830.4124591-8-u.kleine-koenig@pengutronix.de>
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

On Thu,  9 Nov 2023 21:28:37 +0100
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

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

Thanks,
Andre

> ---
>  drivers/bus/sunxi-rsb.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
> index db0ed4e5d315..fd3e9d82340a 100644
> --- a/drivers/bus/sunxi-rsb.c
> +++ b/drivers/bus/sunxi-rsb.c
> @@ -817,15 +817,13 @@ static int sunxi_rsb_probe(struct platform_device *=
pdev)
>  	return 0;
>  }
> =20
> -static int sunxi_rsb_remove(struct platform_device *pdev)
> +static void sunxi_rsb_remove(struct platform_device *pdev)
>  {
>  	struct sunxi_rsb *rsb =3D platform_get_drvdata(pdev);
> =20
>  	device_for_each_child(rsb->dev, NULL, sunxi_rsb_remove_devices);
>  	pm_runtime_disable(&pdev->dev);
>  	sunxi_rsb_hw_exit(rsb);
> -
> -	return 0;
>  }
> =20
>  static const struct dev_pm_ops sunxi_rsb_dev_pm_ops =3D {
> @@ -842,7 +840,7 @@ MODULE_DEVICE_TABLE(of, sunxi_rsb_of_match_table);
> =20
>  static struct platform_driver sunxi_rsb_driver =3D {
>  	.probe =3D sunxi_rsb_probe,
> -	.remove	=3D sunxi_rsb_remove,
> +	.remove_new =3D sunxi_rsb_remove,
>  	.driver	=3D {
>  		.name =3D RSB_CTRL_NAME,
>  		.of_match_table =3D sunxi_rsb_of_match_table,

