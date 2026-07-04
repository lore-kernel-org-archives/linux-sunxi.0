Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F25125B099;
	Sat,  4 Jul 2026 17:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783186099; cv=none; b=oZ30tiyP/1oWdxbJBpuRZRpX1JcwVae9ys+NSm42en8WhhslYvfxesH0ZDzlaeMuyBrFzibeU7Pc7n+fwHIaWoncjYvBpUqHltM/RvMmOtXeUYhH1+vkdzYSK83s9DmqmWeMEb+tcS1VbNEcCwYrHA+HitMRijY49ZYBKkNrmGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783186099; c=relaxed/simple;
	bh=i0q1YvEA27JtG9KC3amUzRBMaQkjb2z/v9vzPrwvpgY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OZVvcpdbnNdxaksgOlz8Q7sajVArGo4sQdU2j9MM8DP+U5p28JK9EOMl3CMhjlgs8a20rqVLoKbE4NK2Un1ZeROg9Ox0JqkmZuUBNV0w4Bvwt5Qd3f46w92xK1KJM77UWT+tE1Y8EivOFgsspHyDt/x1wwTNwWI9OFUo/2Lkuug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NHuQbh8o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NHuQbh8o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39321F00A3A;
	Sat,  4 Jul 2026 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783186098;
	bh=6jLj/QrSj5Ts/ysaTuFp9eUdXIbUNY4VTfgHwRWB+Pc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NHuQbh8oWIso44w2hC3pmve1SmSrrBPzXLg43NpUcpY9zeq01bQQEDt3Vi293pmdl
	 +YWv8hqiE0BFKVDuDaWlXx6FtZ8DuPfHty6ZTpiEwU8kvxzLtM7n3KSUBCElCg2uUv
	 3dBoCglGUt+begtbeaBtbWSvsT9+iu+2PpOmyLPPYXjyrJhp63ZegsF4j+smxkhzUp
	 SFvRAi9yJG4AE8nanfd44ybdPMvNNQQIxSTrltvGxWX4DJhKdLtxI7NQx6jzSOu+EW
	 66//ebTN1p7NjuHrsfZLpjo6/94/P65S3gqlLWXc9ioTUjA03nVkfA4gCU/VZfLs1+
	 x9tHRuiG4dKZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] thermal/drivers/sun8i: get calibration data from
 two nvmem cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kalashnikov" <iuncuim@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260704171411.1413349-4-iuncuim@gmail.com>
References: <20260704171411.1413349-1-iuncuim@gmail.com>
 <20260704171411.1413349-4-iuncuim@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 17:28:17 +0000
Message-Id: <20260704172817.B39321F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing or empty 'nvmem-cell-names' property causes an uncondition=
al NULL pointer dereference in the calibration callback.
- [Medium] The newly introduced A523 calibration function accesses fixed in=
dices of the dynamically sized caldata array without validating callen.
--

commit 385d056a66304901aadb5675fbf878e2aae0cfc7
Author: Mikhail Kalashnikov <iuncuim@gmail.com>

thermal/drivers/sun8i: get calibration data from two nvmem cells

This commit updates the sun8i thermal driver to support reading calibration
data from multiple nvmem cells by iterating over nvmem-cell-names. It appen=
ds
the data from each cell into a single dynamically allocated buffer which is
passed to the calibration callbacks. This provides the ability to support t=
he
A523 processor which has calibration data split across two cells.

> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_ther=
mal.c
> index df0c269708ea7..3bdd62aa8bdf1 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -301,43 +301,65 @@ static int sun50i_h6_ths_calibrate(struct ths_devic=
e *tmdev,
> =20
>  static int sun8i_ths_calibrate(struct ths_device *tmdev)
>  {
> -	struct nvmem_cell *calcell;
> +	struct nvmem_cell *calcell =3D NULL;
>  	struct device *dev =3D tmdev->dev;
> -	u16 *caldata;
> -	size_t callen;
> +	struct device_node *np =3D dev_of_node(dev);
> +	struct property *prop;
> +	const char *cellname;
> +	u8 *caldata =3D NULL;
> +	size_t callen =3D 0;
>  	int ret =3D 0;
> =20
> -	calcell =3D nvmem_cell_get(dev, "calibration");
> -	if (IS_ERR(calcell)) {

[ ... ]

> +		memcpy(caldata + callen, caldatapart, len);
> +		callen +=3D len;
> +		kfree(caldatapart);
>  	}
> =20
> -	tmdev->chip->calibrate(tmdev, caldata, callen);
> +	tmdev->chip->calibrate(tmdev, (u16 *)caldata, callen);

[Severity: High]
If the nvmem-cell-names property is missing from the device tree, the
of_property_for_each_string() loop is bypassed entirely and caldata remains
NULL.

Does this unconditionally pass a NULL pointer to the backend calibration
callback?

Backend callbacks like sun8i_h3_ths_calibrate() dereference the array direc=
tly:

	if (!caldata[0] || callen < 2 * tmdev->chip->sensor_num)
		return -EINVAL;

If the device tree does not contain calibration nvmem cells, this will caus=
e a
kernel panic on boot.


[Severity: Medium]
For the A523 processor, does sun55i_a523_ths_calibrate() validate that call=
en
is large enough before accessing the array?

Looking at sun55i_a523_ths_calibrate() which was recently introduced:

		if (tmdev->chip->sensor_num =3D=3D 1) {
			sensor_reg =3D ((caldata[5] >> 8) | (caldata[6] << 8)) & TEMP_CALIB_MASK;
		} else {

It accesses elements up to caldata[6] without verifying that callen covers =
it.
If a device tree defines nvmem cells that yield less than 14 bytes of data,
will these lookups read out of bounds?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260704171411.1413=
349-1-iuncuim@gmail.com?part=3D3
