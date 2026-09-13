Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5122C032E;
	Sun, 13 Sep 2026 15:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789312086; cv=none; b=MkRBaz6tMmSekEL+/D7R8fbrDrl3GR4Am1zaxwN50SSM3r1Ah7njpfyWSbxVB/gcfOwy2HAQkxFpjEyAAQ55GJCz9H63W3t0DTx7Ma8iL9l282Qr47hjpDB+9D2pe/Va8YlNlvqpihHJKGSF6eh4iMoyBOE0PBeZZjutrtqN8kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789312086; c=relaxed/simple;
	bh=OCgs7qa9bmidNzZFhF2kjPDA5Sk6QQG91vbBWFsOKqA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qoXj0P+UM9QvMlNBnn24xFpya42DAruOhzLS1LLqpocdNp86jbblCbFeE0GlgJtnf6qa042d5lnf3REX4dCBiwhSIACPQLgqrxmyzfAYIaReRSE6sAWvGIEh/KXt5SrApVZ79CfrS5pt7Rq+Gx96ZRPJyL5EEjMoa8Sa/AYm/XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9tAIVxT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9tAIVxT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B681F000FF;
	Sun, 13 Sep 2026 15:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789312084;
	bh=IzH+UQCQcze2EWUBL6BDPtiXWDeMkK9EyILKb8SPWkM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j9tAIVxTeOLwYAZ3IcxUV3vaX6JWc3TkVfbmP8QAYWe1FjcgeKbOIyCyJjf8DmnbR
	 sw7Qn1tgv3SboECOxvHKLG+S+5GdStTsqYh2/c0mUvlP8gC36uIYUIFOsFSgo9gWMv
	 C2/xTUL1sgEMetX9tBJW5EfYojvIa+7RXCHlSrwlypUDLqnE7VLzRlpYRsgxua8Cdj
	 fBqoza3cpKHPbghbDKbi+NP/vG/UJhVz9ckzrd8Wy98rel37rvwWy82XxJynSjkJg+
	 AbKo7psU9mOf7YVnMSJSIY3tkIz7qegGRsIcPg8Ygx2BOl8OZrLor+TGAEShPH+fh4
	 yfQs13G434Iaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/5] thermal/drivers/sun8i: Add support for A523
 THS0/1 controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kalashnikov" <iuncuim@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260913145527.18148-5-iuncuim@gmail.com>
References: <20260913145527.18148-1-iuncuim@gmail.com>
 <20260913145527.18148-5-iuncuim@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 15:08:04 +0000
Message-Id: <20260913150804.99B681F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect check for unprogrammed eFuse can reject valid calibratio=
n data.
- [Medium] Missing bounds check on `callen` in `sun55i_a523_ths_calibrate` =
allows out-of-bounds memory reads on the dynamically allocated `caldata` ar=
ray.
--

commit 1a5244bb0d5a03f3ec7f2a8c21b6249015b66057
Author: Mikhail Kalashnikov <iuncuim@gmail.com>

    thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
   =20
    The A523 processor has two temperature controllers, THS0 and THS1.
    THS0 has only one temperature sensor, which is located in the DRAM
    controller. THS1 does have 4 sensors:
    ths1_0 - "big" cores
    ths1_1 - "little" cores
    ths1_2 - gpu
    ths1_3 - npu

> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_ther=
mal.c
> index 3606548801f02..4a81486f8faec 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c

[ ... ]

> @@ -298,6 +319,105 @@ static int sun50i_h6_ths_calibrate(struct ths_devic=
e *tmdev,
>  	return 0;
>  }
> =20
> +/*
> + * The A523 calibration data is stored in the eFuse, split across two
> + * nvmem cells. THS1 has four sensors, including ths1_3 which is used
> + * for the NPU, each with its own calibration value. The fields are
> + * packed as shown in the layouts below.
> + *
> + * efuse layout 0x38-0x3F (caldata[0..3]):
> + *     caldata[0]      caldata[1]      caldata[2]      caldata[3]
> + * 0               16      24      32  36          48          60 64
> + * +---------------+---------------+---------------+---------------+
> + * |               |       |   temp    |  ths1_0   |  ths1_1   |   +
> + * +---------------+---------------+---------------+---------------+
> + *
> + * efuse layout 0x44-0x4B (caldata[4..7]):
> + *     caldata[4]      caldata[5]      caldata[6]      caldata[7]
> + * 0           12  16      24      32  36          48             64
> + * +---------------+---------------+---------------+---------------+
> + * |  ths1_2   |  ths1_3   |    ths0   |           |               +
> + * +---------------+---------------+---------------+---------------+
> + */
> +static int sun55i_a523_ths_calibrate(struct ths_device *tmdev,
> +				     u16 *caldata, int callen)
> +{
> +	struct device *dev =3D tmdev->dev;
> +	int i, ft_temp;
> +
> +	if (!caldata[1])

[Severity: High]
Does this check inadvertently reject valid calibration data?

If the 12-bit factory calibration temperature happens to be a multiple of
25.6 C (meaning its lowest 8 bits are 0, like 0x100), caldata[1] will be
legitimately 0 since it only holds those lower 8 bits. This would cause the
driver to incorrectly abort calibration on perfectly valid hardware.

[Severity: Medium]
Can this read out-of-bounds memory?

The function receives a dynamically allocated caldata array of size callen
populated from the NVMEM cells, but callen is never verified here. If the
device tree provides a malformed or incomplete NVMEM cell, this access and
subsequent reads will happen past the end of the allocation.

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
> +			sensor_reg =3D ((caldata[5] >> 8) |
> +				      (caldata[6] << 8)) & TEMP_CALIB_MASK;

[Severity: Medium]
Is it possible to read out-of-bounds memory here as well?

This is the highest index accessed in sun55i_a523_ths_calibrate. It strictly
requires a minimum buffer size of 14 bytes. If the device tree provides an
8-byte NVMEM cell, accessing caldata[5] and caldata[6] will pull
uninitialized heap data into the calibration calculations or cause a crash.

> +		} else {
> +			switch (i) {
> +			case 0:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913145527.1814=
8-1-iuncuim@gmail.com?part=3D4
