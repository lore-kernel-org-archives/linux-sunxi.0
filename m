Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5433502A6;
	Sat,  4 Jul 2026 17:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783186166; cv=none; b=Lg3VNgYRi5ktMWiG7Dddu7nBiakO22oYXkH1Goxg4MMnOLXmsKE0lBIie31AYSPHMCWzTLGtu0ktWYeYtPYRsOaXftHSCdi5Uc32XlF87OC4CCyy18nl2QkBpP7QGsr451LPN7BarsCG681pp/5z279LsWc14SZy+sAHY2L4Uc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783186166; c=relaxed/simple;
	bh=5T7A4d2YaZPHMcb6dQBzmy9eowheXtARtObUoukwPs4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=THBjkj9RzhMJMeG/2NQp9q1oKYuQzELbKrE7kVAIsWWSN5pWkwh4RG96yswYdKm1hxLG8/qMEwFvmTGy6TX4/WjJ1ny8YHHhnQd1SKJxKpM461NZVnC3askXDPWHT16x6EzWZDtLGUlcHVQrMKnLo+dXwBy6KVPnUOc2iAZUiCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oshOd3ZJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oshOd3ZJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474C71F000E9;
	Sat,  4 Jul 2026 17:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783186164;
	bh=ZLObji7vKNpj+qigrJiSF/az+7555U8AS/8ZK96zicg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oshOd3ZJlwtLJwjrYJqcJFtBJHnobgIDjkOexYnULmxWyxlY4z2NGT/i8Gh1zuxen
	 2YNkwgyxTwnAfsvOpBNp9jiSdgy3Pe2dXX/n8PMOp3G11iCSOEw1JyO4FqXHQ1lNU2
	 4dzkI/p43yxzsuDdaR1koZHOaYJ16LPr6jpcA7pmdrwAsfbQliryizj2+U42INPoHw
	 82DiK2wCTUYn5k81zJ3hMnEurVZSxgF/1eAggFX3We8RxstsVEXCJ7Jn7MkOWgC7Fk
	 CD9zT6BMwO2tDR2cCc9p/Fj7JSKUhEbobs/r51LzhMys0IoPnzHB4cpoXqQY2pxH9w
	 390BkWUVUlmBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/5] thermal/drivers/sun8i: Add support for A523
 THS0/1 controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kalashnikov" <iuncuim@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260704171411.1413349-5-iuncuim@gmail.com>
References: <20260704171411.1413349-1-iuncuim@gmail.com>
 <20260704171411.1413349-5-iuncuim@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 17:29:23 +0000
Message-Id: <20260704172924.474C71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The calibration check `if (!caldata[0])` will always fail and abor=
t calibration if bits 0-15 of the A523 eFuse are zero.
- [High] NULL pointer dereference if the `nvmem-cell-names` property is mis=
sing from the Device Tree.
- [Medium] Out-of-bounds heap read due to missing `callen` validation in `s=
un55i_a523_ths_calibrate`.
- [Medium] Calibration logic incorrectly hardcodes `SUN55I_A523_SCALE_ABOVE=
` to convert temperature error into a register offset.
--

commit ed04dff3819d46435d0d0c6fa95dfd782738eb1e
Author: Mikhail Kalashnikov <iuncuim@gmail.com>

thermal/drivers/sun8i: Add support for A523 THS0/1 controllers

The A523 processor has two temperature controllers, THS0 and THS1.
THS0 has only one temperature sensor, which is located in the DRAM
controller. THS1 does have 3 sensors:
ths1_0 - "big" cores
ths1_1 - "little" cores
ths1_2 - gpu

The datasheet mentions a fourth sensor in the NPU, but lacks any registers
for operation other than calibration registers. The vendor code reads the
value from ths1_2, but uses separate calibration data, so we get two
different values from real one.

> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_ther=
mal.c
> index 3bdd62aa8bdf1..f48ed9eae6c4f 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c

[ ... ]

> @@ -299,6 +314,97 @@ static int sun50i_h6_ths_calibrate(struct ths_device=
 *tmdev,

[ ... ]

> +static int sun55i_a523_ths_calibrate(struct ths_device *tmdev,
> +				     u16 *caldata, int callen)
> +{
> +	struct device *dev =3D tmdev->dev;
> +	int i, ft_temp;
> +
> +	if (!caldata[0])

[Severity: High]
If the device tree lacks the nvmem-cell-names property, the loop inside
sun8i_ths_calibrate() will be skipped entirely. This leaves caldata as
NULL when it is passed to the chip-specific calibrate callback:

sun8i_ths_calibrate() {
    ...
    of_property_for_each_string(...) {
        ...
    }
    tmdev->chip->calibrate(tmdev, (u16 *)caldata, callen);
    ...
}

Will checking !caldata[0] here cause a NULL pointer dereference in that
scenario?

[Severity: High]
According to the eFuse layout diagram in the comment block just above this
function, bits 0-15 are empty/unused, while the actual factory temperature
is stored in bits 24-35 (caldata[1] and caldata[2]).

If those unused eFuse bits are typically zero, will this check silently
abort the calibration process on the A523?

> +		return -EINVAL;
> +
> +	ft_temp =3D (((caldata[2] << 8) | (caldata[1] >> 8)) & FT_TEMP_MASK) * =
100;
> +
> +	for (i =3D 0; i < tmdev->chip->sensor_num; i++) {
> +		int sensor_reg, sensor_temp, cdata, offset;
> +		/*
> +		 * Chips ths0 and ths1 have common parameters for value
> +		 * calibration. To separate them we can use the number of
> +		 * temperature sensors on each chip.
> +		 * For ths0 this value is 1.
> +		 */
> +		if (tmdev->chip->sensor_num =3D=3D 1) {
> +			sensor_reg =3D ((caldata[5] >> 8) | (caldata[6] << 8)) & TEMP_CALIB_M=
ASK;

[Severity: Medium]
Is there a chance we might read out of bounds here if the provided nvmem
data is smaller than expected?

If the device tree or nvmem cell provides fewer bytes than the 14 bytes
required to access caldata[6], this could result in an out-of-bounds heap
read.

Should we validate callen before accessing these offsets?

> +		} else {
> +			switch (i) {
> +			case 0:
> +				sensor_reg =3D (caldata[2] >> 4) & TEMP_CALIB_MASK;
> +				break;

[ ... ]

> +		sensor_temp =3D tmdev->chip->calc_temp(tmdev, i, sensor_reg);
> +
> +		/*
> +		 * Calibration data is CALIBRATE_DEFAULT - (calculated
> +		 * temperature from sensor reading at factory temperature
> +		 * minus actual factory temperature) * X (scale from
> +		 * temperature to register values)
> +		 */
> +		cdata =3D CALIBRATE_DEFAULT -
> +			((sensor_temp - ft_temp) / SUN55I_A523_SCALE_ABOVE);

[Severity: Medium]
The sun55i_a523_calc_temp() function uses a piecewise formula depending
on the register value, applying either SUN55I_A523_SCALE_ABOVE or
SUN55I_A523_SCALE_BELOW.

However, the calibration offset calculation here unconditionally divides
the temperature error by SUN55I_A523_SCALE_ABOVE.

If the factory temperature corresponds to a register value in the
SUN55I_A523_SCALE_BELOW region, will dividing by the SCALE_ABOVE
value result in an inaccurate calibration offset?

> +
> +		if (cdata & ~TEMP_CALIB_MASK) {
> +			/*
> +			 * Calibration value more than 12-bit, but calibration
> +			 * register is 12-bit. In this case, ths hardware can

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260704171411.1413=
349-1-iuncuim@gmail.com?part=3D4
