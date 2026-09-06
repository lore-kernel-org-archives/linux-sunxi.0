Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481901FB1
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Sep 2026 16:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788710938; cv=none; b=gMe9YZ20dDjMTvfPcsc4HF80IxkH3oe8yD1VeRapn1YHRQpr8uxeJtoyXtXdu58RdRVqsFZQ7ISaO7mZj5u2EmUP+rEbZtZ/hxXhQQ8Dup2d03cpCHTzSQ5Q4N1ne3OS3ALHiIlJYTLmd1UhG7zhzrv0/WW/0JqjXp59RV8D3CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788710938; c=relaxed/simple;
	bh=R1R2O3YDcJ1al9vG77Vx2QEe12nTz6+uB/intkXoRJI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=seCOYJ35sJ74iKshL0xV5ULMqpmx9+SS5Y6G1KrgMy9FBw2045nwWP7cYIL+twpQOXfeGF39RgYp0tiReyu6bISdPrE+htVuRLlOWga+shhagWwYOVi3bsp9uSsURPOfV2f7iR+JeCCm1VwsYlZlGhqBXuzwHsiS11UpYNHjvYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ld0lMa9H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ld0lMa9H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964E71F00A3A;
	Sun,  6 Sep 2026 16:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788710935;
	bh=popRHXT/Pis/dNLnmkcH+VTNnspVKlNL0w6vP83Ojm8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ld0lMa9H0qBUuYWLl90ZsiH4IrFcPSnkhW6xhYpxYOy+ZwcbVZRpvJOdnfKtxmVTn
	 8zJGtfSXuSmvg+azFicNtqn89ULzLd38GCREi20g+VZd8uKEq5+bHAB4S81DaHU4Fe
	 emm3t0GDeJCMIO0AiBrdnH162gvfa1L5uL9prX3EBuXDdPQWBdkii5ocRVPA9hp4Gs
	 WvViwYY1d7bSiaLPN305w4CG7O0k3dY5ew7vDz6bE10F3IzZ1ByTY5T9Zh3/+7jmx1
	 +YQrwF4GgW0FnNJzi4/ahGDl2yVvBPCj/MvfcdLdWI1p+jcDyZnWBlKC7S9BkI2DlJ
	 Q8nryL3amZ7ww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: adc: sun4i-gpadc-iio: clean up on thermal zone
 registration failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Felix Gu" <ustc.gu@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260906-gpadc-v1-2-92d3dc8ef355@gmail.com>
References: <20260906-gpadc-v1-0-92d3dc8ef355@gmail.com>
 <20260906-gpadc-v1-2-92d3dc8ef355@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 16:08:55 +0000
Message-Id: <20260906160855.964E71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] pm_runtime_disable() is called manually before devm-managed subsys=
tems are unregistered, exposing a window where callbacks run with runtime P=
M disabled.
- [High] The driver ignores the return value of pm_runtime_get_sync(), whic=
h can lead to accessing hardware registers while the device is suspended or=
 powered off.
--

commit 0cc8a4f7ab93d097709950676951a80ac9c05108
Author: Felix Gu <ustc.gu@gmail.com>

    iio: adc: sun4i-gpadc-iio: clean up on thermal zone registration failure
   =20
    If devm_thermal_of_zone_register() fails, probe returns without
    unregistering the IIO map array or disabling runtime PM.
   =20
    Jump to err_map to release them.

> diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gp=
adc-iio.c
> index 85382e435f2a7..ac5ba76b979e6 100644
> --- a/drivers/iio/adc/sun4i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun4i-gpadc-iio.c
> @@ -638,10 +638,10 @@ static int sun4i_gpadc_probe(struct platform_device=
 *pdev)
>  		 * thermal because no thermal DT node is found.
>  		 */
>  		if (IS_ERR(info->tzd) && PTR_ERR(info->tzd) !=3D -ENODEV) {
> -			dev_err(&pdev->dev,
> -				"could not register thermal sensor: %ld\n",
> -				PTR_ERR(info->tzd));
> -			return PTR_ERR(info->tzd);
> +			ret =3D dev_err_probe(&pdev->dev,
> +					    PTR_ERR(info->tzd),
> +					    "could not register thermal sensor\n");
> +			goto err_map;
>  		}
>  	}
> =20
>  	ret =3D devm_iio_device_register(&pdev->dev, indio_dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "could not register the device\n");
>  		goto err_map;
>  	}
> =20
>  	return 0;
> =20
>  err_map:
>  	if (!info->no_irq && IS_ENABLED(CONFIG_THERMAL_OF))
>  		iio_map_array_unregister(indio_dev);
> =20
>  	pm_runtime_disable(&pdev->dev);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
This is a pre-existing issue, but does explicitly calling pm_runtime_disabl=
e()
here create a window where the devres-managed thermal zone and IIO devices =
are
still registered while runtime PM is disabled?

Since devm_thermal_of_zone_register() and devm_iio_device_register() are us=
ed,
devres will not unregister them until after the probe error path returns.

In the interim, if the thermal core's polling thread invokes .get_temp() or
userspace reads IIO sysfs, could this access hardware while clocks are
disabled, triggering a synchronous external abort?

A similar pre-existing issue appears in sun4i_gpadc_remove():

drivers/iio/adc/sun4i-gpadc-iio.c:sun4i_gpadc_remove() {
	struct iio_dev *indio_dev =3D platform_get_drvdata(pdev);
	struct sun4i_gpadc_iio *info =3D iio_priv(indio_dev);

	pm_runtime_disable(&pdev->dev);
...
}

Is pm_runtime_disable() being called here before devres tears down the
registered IIO and thermal zones?

There is another pre-existing issue where return values for
pm_runtime_get_sync() are not checked before accessing hardware. Can this l=
ead
to accessing hardware registers while the device is suspended or powered of=
f?

If pm_runtime_get_sync() fails (e.g., due to runtime PM being disabled duri=
ng
the teardown race from err_map or remove, or a genuine PM failure), it retu=
rns
a negative error code but regmap accesses proceed anyway:

drivers/iio/adc/sun4i-gpadc-iio.c:sun4i_prepare_for_irq() {
	...
	pm_runtime_get_sync(indio_dev->dev.parent);

	reinit_completion(&info->completion);

	ret =3D regmap_write(info->regmap, SUN4I_GPADC_INT_FIFOC,
	...
}

And also in sun4i_gpadc_temp_read():

drivers/iio/adc/sun4i-gpadc-iio.c:sun4i_gpadc_temp_read() {
	struct sun4i_gpadc_iio *info =3D iio_priv(indio_dev);

	if (info->no_irq) {
		pm_runtime_get_sync(indio_dev->dev.parent);

		regmap_read(info->regmap, SUN4I_GPADC_TEMP_DATA, val);
	...
}

Should the return value of pm_runtime_get_sync() be checked to avoid a bus
fault or kernel panic when reading or writing to unpowered MMIO registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-gpadc-v1-0=
-92d3dc8ef355@gmail.com?part=3D2
