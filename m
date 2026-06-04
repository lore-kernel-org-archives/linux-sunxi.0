Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2C0436356
	for <linux-sunxi@lists.linux.dev>; Thu,  4 Jun 2026 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780575174; cv=none; b=UzuCQ2vVAwCtAQy4wgUBu9zhBfwWvvMWTTg7PVSBng6DlYwGLD2aDjPGncVNT7/SM1VVT6rI9R6XFo8lCfzRxixXhttQNpwCPzHU4IAllfHfXJuYocS9fyvz+C69WVMjsKdTZFh6yl589bLmbl/zfRWDX7mP4WiRDS6Ffdrdw2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780575174; c=relaxed/simple;
	bh=sLKwJlrPBfRNhtyFL6+xRuwDZVD+6kwEinP441stqoM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oTQEwGKQpKFIhixsPxXqW8R3C/j4JEIefkxQs2CKGGEDaK9bPrP98zy0xbwKshbu/eaTe7PvpvBFCShqw9WJ8RBMg85CsK7Y9GOTQq96NY3HCFi3lWqS66RfAOfgHj3RLN8L+iMfMgErxYkurq3A56nmFTkUhNijhD/MCOPZ67Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYoqs9TZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYoqs9TZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB881F00893;
	Thu,  4 Jun 2026 12:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780575171;
	bh=2qPn6UIlI9keWtYOEsXV+Cwts014pvDjMOgzai6oG20=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VYoqs9TZsivfAXp4V/VYopB/xrBePCnwCUoGXeV6r/QPpCE8lpgdE9JkZAcedIuAy
	 rKOP8lyqyVPDvHvV3FyaTrerHNOVHvXUSQgnmlwi3BOu3b+y/40rENME7xA7Iktwb6
	 ceQDyMOwMCCZk2a906B173MFqz0hS7e+HmPDAacHbLbsFeSRBijqe8seYz0WLl9K4Y
	 t9dDXrmWmc33hPraj/SvMnnWJ4F4OIuUyL/EEzBaJgnY49SNzeV6xcx5Mr3c3p+8Ju
	 g1qAalwPKpydnO+YQdAhTFpgJYHzay6aXjnVEws7ePUtgUYdMF+IkGVj5D+6n3/X6F
	 5W2m+xkXTLDjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/11] iio: adc: change from %ld to %pe for PTR_ERR()
 printing
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Vm9qdMSbY2ggS3LDoXRrw70=?= <vo.kratky@seznam.cz>
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20260604120201.116925-3-vo.kratky@seznam.cz>
References: <20260604120201.116925-3-vo.kratky@seznam.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 12:12:50 +0000
Message-Id: <20260604121251.2BB881F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Direct return on devm_thermal_of_zone_register failure skips criti=
cal error cleanup (PM leak and Use-After-Free).
- [High] Unbalanced disable_irq() on sun4i_prepare_for_irq() error path per=
manently disables the IRQ.
--

commit 4c81144898d1e91a3f1c0bfb6354a6f38c7251b4
Author: Vojt=C4=9Bch Kr=C3=A1tk=C3=BD <vo.kratky@seznam.cz>

iio: adc: change from %ld to %pe for PTR_ERR() printing

This commit replaces numeric PTR_ERR() logging with the %pe format specifie=
r.
The goal is to print error values in a more readable form.

> diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gp=
adc-iio.c
> index 479115ea50bf9..5d7a61abcaeae 100644
> --- a/drivers/iio/adc/sun4i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun4i-gpadc-iio.c

[ ... ]

> @@ -639,8 +639,8 @@ static int sun4i_gpadc_probe(struct platform_device *=
pdev)
>  		 */
>  		if (IS_ERR(info->tzd) && PTR_ERR(info->tzd) !=3D -ENODEV) {
>  			dev_err(&pdev->dev,
> -				"could not register thermal sensor: %ld\n",
> -				PTR_ERR(info->tzd));
> +				"could not register thermal sensor: %pe\n",
> +				info->tzd);
>  			return PTR_ERR(info->tzd);

[Severity: High]
This isn't a bug introduced by this patch, but returning directly here
skips the err_map cleanup label.

If devm_thermal_of_zone_register() fails with an error other than -ENODEV,
this code returns directly. Does this leave the device's runtime PM enabled
because the pm_runtime_disable() call in the err_map block is skipped?

Also, if the device was probed via sun4i_gpadc_probe_mfd(),
iio_map_array_register() was successfully called earlier:

drivers/iio/adc/sun4i-gpadc-iio.c:sun4i_gpadc_probe_mfd() {
    ...
    ret =3D iio_map_array_register(indio_dev, sun4i_gpadc_hwmon_maps);
    ...
}

By skipping iio_map_array_unregister() at the err_map label, does this
leave a dangling pointer in the global IIO maps pointing to indio_dev?
Since indio_dev is managed by devres (devm_iio_device_alloc), its memory
will be freed immediately upon probe failure. Could this result in a
use-after-free when another subsystem attempts to read from the map?

>  		}
>  	}

While reviewing this file, I also noticed another pre-existing regression in
sun4i_gpadc_read().

[Severity: High]
This is a pre-existing issue, but does the unbalanced disable_irq() on the
sun4i_prepare_for_irq() error path permanently disable the IRQ?

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
}

If sun4i_prepare_for_irq() fails, the code jumps to the err label and
unconditionally executes disable_irq(irq). Because enable_irq(irq) was never
reached, this increases the IRQ disable depth.=20

Since the IRQs are initially requested with IRQF_NO_AUTOEN
(initial depth =3D 1), the unbalanced disable_irq() bumps the depth to 2.
On subsequent successful reads, enable_irq() will only decrement the depth
back to 1. Does this leave the IRQ permanently masked, causing
wait_for_completion_timeout() to continually time out?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604120201.1169=
25-1-vo.kratky@seznam.cz?part=3D2
