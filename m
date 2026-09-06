Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8631B34D4CE
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Sep 2026 16:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788710895; cv=none; b=LSIFgkm9IFdXCIoxoxjKYQbIPjX/+0LH/JnYRP2wJA8gNSeCfB/hYIQi0tHdZJFoPBNNmnAA9bDc8+6bR4izeI0or8JhX21gzOLdqO/DJZyIjv2vuLrTe9W2RXoQ2EE0Uh1P1nk2fx/qxA8Qx4wFBhNyn7QwjokK5K3HainixHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788710895; c=relaxed/simple;
	bh=G8Hmhp83a1qg24Zah1mUUvYm3Mk/cayLs1yvTP1K8Ko=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kYcXxo4CGOdN+v1oYruhJPwYjOQFYxbvG3uCpX33F+vJQgE63wVdi+sfoIvKiaR+qQXqKRinjNX//SikcmOZ/6PDt/mxYk/n9BatIFwyIO5GFsCT/emEq3H06ujVa2lXeJRl7sQbDO61EeTyNUFwo7wazKX6QuAEYnaZK2MrTKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1BkhhUZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g1BkhhUZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2481B1F00A3A;
	Sun,  6 Sep 2026 16:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788710894;
	bh=GXOyFyb+92X9gQkFsQW0f7HO99btTkbTieZ0zbEod+Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g1BkhhUZmJrnaFHpUPZis+FRtbHkjCWt3LZneW8uJNmk0SWZc3sdtnxnHhg+cnxKP
	 8OjE7rxDi8w3Rh+9Wq+JNxew3FFVOSQVot+APVsOa02CqzLWj73ystyBQF9wHj2xOz
	 av5A+NCnQEhKPSVgqlIQ2LXgAoOv6mRiOVuEH3R/zg9ABwEEAj1sbpQMp3bztsvWfk
	 PkyjPQiLVlnc1auzVeUMaLyj/S+ii+Kn7u/+SqbQAkPjhY8beuI5N0CeXUdXU+kLSj
	 4GymGd2o2jnSvQy/fG1nzxWLQTh2Y2wSdhsmC873v2Z4VmPvSs55Z1oBskEZ1C6uS+
	 OKes6XbjZw6ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] iio: adc: sun4i-gpadc-iio: drop underflowing
 pm_runtime_put() calls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Felix Gu" <ustc.gu@gmail.com>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260906-gpadc-v1-1-92d3dc8ef355@gmail.com>
References: <20260906-gpadc-v1-0-92d3dc8ef355@gmail.com>
 <20260906-gpadc-v1-1-92d3dc8ef355@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 16:08:13 +0000
Message-Id: <20260906160814.2481B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unbalanced IRQ Disable on error path permanently breaks device int=
errupts.
- [High] Ignored pm_runtime_get_sync() return value leads to unsafe hardwar=
e access.
- [High] Race condition / use-after-PM-disable due to mixing manual PM disa=
ble with devres registration.
--

commit 800a3d2cff62e2654821d4421a37d86abb9c6de0
Author: Felix Gu <ustc.gu@gmail.com>

    iio: adc: sun4i-gpadc-iio: drop underflowing pm_runtime_put() calls
   =20
    Neither the error path in sun4i_gpadc_probe() nor sun4i_gpadc_remove()
    ever holds a runtime PM usage count. So the pm_runtime_put() in both
    places always triggers the "Runtime PM usage count underflow!" warning
    on every failed probe and every unbind.
   =20
    Drop both calls.

> diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gp=
adc-iio.c
> index 203459ca99079..85382e435f2a7 100644
> --- a/drivers/iio/adc/sun4i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun4i-gpadc-iio.c
[ ... ]
> @@ -668,7 +667,6 @@ static void sun4i_gpadc_remove(struct platform_device=
 *pdev)
>  	struct iio_dev *indio_dev =3D platform_get_drvdata(pdev);
>  	struct sun4i_gpadc_iio *info =3D iio_priv(indio_dev);
> =20
> -	pm_runtime_put(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);

[Severity: High]
This isn't a bug introduced by this patch, but does calling
pm_runtime_disable() here create a race condition?

The IIO device and thermal zone are registered using devres functions
(devm_iio_device_register / devm_thermal_of_zone_register) in
sun4i_gpadc_probe(), which means they are unregistered after
sun4i_gpadc_remove() completes.

Since pm_runtime_disable() is called before the devres-managed IIO device a=
nd
thermal zone are unregistered, the sysfs device and thermal zone remain ful=
ly
accessible while PM transitions are disabled.

Could a concurrent background poll from the thermal core or a userspace IIO
read during driver unbind trigger a pm_runtime_get_sync() that fails with
-EACCES, leading to an unclocked hardware crash?

This is another pre-existing issue, but does sun4i_gpadc_read() have an
unbalanced IRQ disable on its error path?

drivers/iio/adc/sun4i-gpadc-iio.c:sun4i_gpadc_read() {
    ...
	ret =3D sun4i_prepare_for_irq(indio_dev, channel, irq);
	if (ret)
		goto err;

	enable_irq(irq);
    ...
err:
	pm_runtime_put_autosuspend(indio_dev->dev.parent);
	disable_irq(irq);
	mutex_unlock(&info->mutex);

	return ret;
}

[Severity: High]
If sun4i_prepare_for_irq() returns an error, execution skips enable_irq()
but goes to the err: label, which unconditionally executes disable_irq().
Since the IRQ was requested with IRQF_NO_AUTOEN (disabled, depth=3D1), the
unmatched disable increments the depth to 2.

A subsequent successful read will call enable_irq(), only decrementing the
depth to 1, leaving the IRQ permanently disabled. Does a single transient
error during a userspace IIO read permanently break the hardware interface?

This is also a pre-existing issue, but should the return value of
pm_runtime_get_sync() be checked before accessing hardware registers?

drivers/iio/adc/sun4i-gpadc-iio.c:sun4i_prepare_for_irq() {
    ...
	pm_runtime_get_sync(indio_dev->dev.parent);

	reinit_completion(&info->completion);

	ret =3D regmap_write(info->regmap, SUN4I_GPADC_INT_FIFOC,
    ...
}

And in drivers/iio/adc/sun4i-gpadc-iio.c:sun4i_gpadc_temp_read():

	if (info->no_irq) {
		pm_runtime_get_sync(indio_dev->dev.parent);

		regmap_read(info->regmap, SUN4I_GPADC_TEMP_DATA, val);
    ...
}

[Severity: High]
pm_runtime_get_sync() can return a negative error code if the device fails =
to
resume or if runtime PM has been disabled. The return value is ignored befo=
re
issuing regmap_read() or regmap_write() calls.

If PM transitions fail or runtime PM is disabled, could this lead to access=
ing
unclocked or powered-off hardware, potentially resulting in system hangs or
bus faults?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906-gpadc-v1-0=
-92d3dc8ef355@gmail.com?part=3D1
