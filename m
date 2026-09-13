Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771C82874E1;
	Sun, 13 Sep 2026 15:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789312248; cv=none; b=C4LHQc9CNPf+z2ocssZctGcpGaMTl4ky8hj3KDKaxWK2FPRYN8ETR/EFmSn7NE1F7XEB7+QJldwle7RlaNTuhJo84++9J8Fz/xrnklk+5UVGd4QRCc9UZIWcGl1EAJKS0aXQ0/oRqOHYVOUTq0VGyZI5jZGBArIHw2BdKqiZu/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789312248; c=relaxed/simple;
	bh=5IHK8/O5jJno5CzPBj0NXD46VQTV+mw1kdVCkuhJfD8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DwPm/if0tD3pT6c+4X7DxHqbmEIX38Zwm2yOmaq1HlTZTf0W/u4k9m6G/CksK6Kb39dgJy0Z1mZCIquRObWiLu8IdpHA3mvsCPiPO9Q3Owi77y5ope+3PnS66raMvp1WOdqmXFuRdbWOa9uwvxc3fYdnFqVSJv4I+ZX9ERSO2wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnKuFQd5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NnKuFQd5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447821F000FF;
	Sun, 13 Sep 2026 15:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789312246;
	bh=C44Z/dHvpTAF9LQXZLgcUcO0bBto6gqn8aBbk+k1TTo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NnKuFQd5ThMVepO8dxB6JeGNb5mSTKJJ9Gs/8BT8eIlLE52Y9MrMMOHP69+i5MIIa
	 x1DPraKQ1vNRQ33Naqb4urobjF0eD7wmF9u9iaVEwno/oEM9oIIT44YnMcMcEE6U1Y
	 A7LF/kAlBo4OGpZkOq/W5ig/RsNCO5HtmYNzdMrmZB6AEx+hL+jttq0FX3GDbhb5Ga
	 Lk8Kurt7htvd8R9DQ1K7FQeaXqER139Mhm1N+RRLEKsGMjdJ/+NP8yDOYeSi5HWLov
	 84gBLSlJvFIHVM0lhd+5VYcbFoOJsJONdK5ny/nmafDImDwZjl4Nf6oWI6zkcA2LB/
	 NEQp4sMq25FrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/5] thermal/drivers/sun8i: get calibration data from
 two nvmem cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kalashnikov" <iuncuim@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260913145527.18148-4-iuncuim@gmail.com>
References: <20260913145527.18148-1-iuncuim@gmail.com>
 <20260913145527.18148-4-iuncuim@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 15:10:45 +0000
Message-Id: <20260913151046.447821F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Devres-managed memory allocated for `caldata` is leaked for the =
lifetime of the device if a secondary nvmem cell fails to be acquired.
--

commit 340e56882111780a9b5ca525d954f99c45894fc7
Author: Mikhail Kalashnikov <iuncuim@gmail.com>

thermal/drivers/sun8i: get calibration data from two nvmem cells

The commit updates the sun8i thermal driver to support retrieving calibrati=
on
data from multiple nvmem cells. It iterates over nvmem-cell-names and
concatenates the cell data into a single devm-managed buffer.

> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_ther=
mal.c
> index 1412bce630c0c..3606548801f02 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -300,43 +300,68 @@ static int sun50i_h6_ths_calibrate(struct ths_devic=
e *tmdev,
> =20
>  static int sun8i_ths_calibrate(struct ths_device *tmdev)
>  {
[ ... ]
> +	of_property_for_each_string(np, "nvmem-cell-names", prop, cellname) {
> +		size_t len;
> +		u8 *caldatapart;
> +
> +		calcell =3D of_nvmem_cell_get(np, cellname);
> +		if (IS_ERR(calcell)) {
> +			if (PTR_ERR(calcell) =3D=3D -EPROBE_DEFER)
> +				return -EPROBE_DEFER;
[ ... ]
> +			goto out;

[Severity: Medium]
Does this goto out cause a memory leak of the devres-managed caldata buffer?

If of_nvmem_cell_get() fails for a secondary cell (with an error other than
-EPROBE_DEFER), the function jumps to out returning 0, since ret is not
updated. Since probe succeeds, the devres memory allocated via
devm_krealloc() for the first cell's data is retained for the lifetime of
the device, skipping the explicit devm_kfree(dev, caldata) before the
out label.

> +		}
> +
> +		caldatapart =3D nvmem_cell_read(calcell, &len);
> +		nvmem_cell_put(calcell);
> +		calcell =3D NULL;
> +		if (IS_ERR(caldatapart)) {
> +			ret =3D PTR_ERR(caldatapart);
> +			goto out;
> +		}
> +
> +		caldata =3D devm_krealloc(dev, caldata, callen + len, GFP_KERNEL);
> +		if (!caldata) {
> +			kfree(caldatapart);
> +			ret =3D -ENOMEM;
> +			goto out;
> +		}
> +
> +		memcpy(caldata + callen, caldatapart, len);
> +		callen +=3D len;
> +		kfree(caldatapart);
>  	}
> =20
> -	caldata =3D nvmem_cell_read(calcell, &callen);
> -	if (IS_ERR(caldata)) {
> -		ret =3D PTR_ERR(caldata);
> +	if (!caldata)
>  		goto out;
> -	}
> =20
> -	tmdev->chip->calibrate(tmdev, caldata, callen);
> +	tmdev->chip->calibrate(tmdev, (u16 *)caldata, callen);
> =20
> -	kfree(caldata);
> +	devm_kfree(dev, caldata);
> +	caldata =3D NULL;
>  out:
> -	if (!IS_ERR(calcell))
> +	if (!IS_ERR_OR_NULL(calcell))
>  		nvmem_cell_put(calcell);
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913145527.1814=
8-1-iuncuim@gmail.com?part=3D3
