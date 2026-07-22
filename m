Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADC535C6B4;
	Wed, 22 Jul 2026 20:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784753122; cv=none; b=sS8xUsUaEIyUWwhjhb2+FiPN+wexrUGKYnxTMnxcbrDvlbHGOBX2jMQbAtz2wiJu0ALQc9W90E1AUOOD0RtosWSxgjGoMlabOEXJQCkLmjXXD6YnvGSep+dmb3LSKYZUZZKASAQinFIYeafv7ufz3YKigzpwyBAi88zd6w5lJMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784753122; c=relaxed/simple;
	bh=22E7VaHCFieTgKfbcEsNt9QUu0wVssJ+2QhMk+l1mus=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PCMoJ76SiGE9+6gCvEKfm+SsnOoGkw27/xtIvgC7Nfk5twWzdJbbmfUIutTB4FypCrSPDkSrsk5GGAJIw2bs3A+Trmy/TfpuDhLIFfffwonD17DxMhcgcmnvqQ52Rk+RYdYx7xFNjhqk1bJVG/1mFybcLLyeOeME6XZGZkcjQso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q06X1YIV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q06X1YIV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4681F000E9;
	Wed, 22 Jul 2026 20:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784753120;
	bh=DDilkTe5UhYcbCam2N0/ZJNYE41S35u7ms9HKn9j6Og=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q06X1YIV3V6CrwmaPhlwDmIZJFS0AJJ3Vkz+vRbJVr/DG0JAC+wFrCAVU2YsRAUaD
	 v4YePLwXV9XkNOxJIZwlXgqmV3jORrdCQNd9jM+2kr9nbfJVPiD+C05wdFXsVRsOWR
	 37hskP8iO81VQHVNTMjUmiHu1+1sMnLyPQP0ArNcELl684rPlqE+Edkj0ADFpvJHkO
	 Qt0hpXcArVhSKbKZsUp6/e9lYQ2vePm4nRaVoJ8GYKP/X0aAl9osarujQxEk11KOcy
	 OVx5WjKh0N+mqDX67FQsE/qjRd9Z/a+d8ywdxNhTEq0JUb8Wn+BswbjYJfl4BN+xZZ
	 cY7zqc885xvpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] thermal/drivers/sun8i: Add support for the A80 THS
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U8O2cmVuIEhhbnRlbA==?= <fugininsane@gmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722203341.2917852-3-fugininsane@googlemail.com>
References: <20260722203341.2917852-1-fugininsane@googlemail.com>
 <20260722203341.2917852-3-fugininsane@googlemail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 20:45:20 +0000
Message-Id: <20260722204520.9B4681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Unconditional NULL pointer dereference if calibration nvmem cell i=
s present.
- [High] Statically enabled ALARM interrupt will cause a severe interrupt s=
torm when triggered.

Pre-existing issues:
- [High] Interrupt handler defeats spurious interrupt detection by uncondit=
ionally returning IRQ_HANDLED.
--

--- Patch [2]: [PATCH 2/3] thermal/drivers/sun8i: Add support for the A80 T=
HS ---
commit 95ccac1aebf565b0761d7e8e612500acbb05beba
Author: S=C3=B6ren Hantel <fugininsane@gmail.com>

thermal/drivers/sun8i: Add support for the A80 THS

The Allwinner A80 thermal sensor is an early relative of the THS found
in the A83T and later SoCs. It shares its register block, bus gate,
4 MHz module clock and reset line with the GPADC; the THS registers
live at offset 0x40 of the shared block, with four data registers for
the four sensors (0: big cluster, 1: DRAM, 2: GPU, 3: little cluster).

> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_ther=
mal.c
> index 22674790629a7..3e7bfda621267 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c

[ ... ]

> @@ -596,6 +616,76 @@ static int sun8i_ths_probe(struct platform_device *p=
dev)
>  	return 0;
>  }
> =20
> +static int sun9i_a80_thermal_init(struct ths_device *tmdev)
> +{
> +	int i;
> +
> +	/* clear any pending interrupt status */
> +	regmap_write(tmdev->regmap, SUN9I_THS_IS, 0xfff);
> +	/* set up the median filter, average over 8 samples */
> +	regmap_write(tmdev->regmap, SUN9I_THS_MFC, 0x5);
> +
> +	/*
> +	 * Program the protection thresholds with the values the vendor
> +	 * BSP uses (thresholds are in raw sensor units, which decrease
> +	 * with rising temperature): an alarm interrupt at ~90 degC and
> +	 * an emergency hardware shutdown at ~105 degC.
> +	 */
> +	for (i =3D 0; i < tmdev->chip->sensor_num; i++) {
> +		regmap_write(tmdev->regmap, SUN9I_THS_ALARM_TH(i),
> +			     (1454 << 16) | 0xfff);
> +		regmap_write(tmdev->regmap, SUN9I_THS_SHUT_TH(i),
> +			     (1231 << 16) | 0xfff);
> +	}
> +
> +	/*
> +	 * Unlike on later SoCs, the data-ready interrupt fires at the
> +	 * conversion rate (tens of kHz), so leave it disabled and let the
> +	 * thermal core poll the data registers; the interrupt line only
> +	 * serves the alarm and shutdown events, like in the vendor BSP.
> +	 */
> +	regmap_write(tmdev->regmap, SUN9I_THS_IC,
> +		     SUN9I_THS_ALARM_IRQ_EN | SUN9I_THS_SHUT_IRQ_EN);

[Severity: High]
Will this statically enabled ALARM interrupt cause an interrupt storm when
triggered?

Since the ALARM threshold is static (~90 degC) and sun8i_irq_thread() clears
the status bit but does not mask the interrupt or adjust the threshold (as
there is no set_trips callback in this driver), won't the hardware immediat=
ely
re-assert the interrupt once the IRQF_ONESHOT thread unmasks the line while
the temperature remains above the threshold?

> +	/* acquire time 0x2f, enable all four sensors */
> +	regmap_write(tmdev->regmap, SUN9I_THS_CTRL,
> +		     SUN9I_THS_CTRL_ACQ(0x2f) | SUN9I_THS_CTRL_SENSOR_EN);
> +
> +	return 0;
> +}

[ ... ]

> +static const struct ths_thermal_chip sun9i_a80_ths =3D {
> +	.sensor_num =3D 4,
> +	.has_mod_clk =3D true,
> +	.mod_clk_rate =3D 4000000,
> +	.has_bus_clk_reset =3D true,
> +	.scale =3D 688,
> +	.offset =3D 190000,
> +	.temp_data_base =3D SUN9I_THS_TEMP_DATA,
> +	.init =3D sun9i_a80_thermal_init,

[Severity: High]
Is it possible for the calibration nvmem cell to be present for this chip?

The sun8i_ths_calibrate() function unconditionally dereferences the .calibr=
ate
callback if calibration data is successfully read:

drivers/thermal/sun8i_thermal.c:sun8i_ths_calibrate() {
    ...
	caldata =3D nvmem_cell_read(calcell, &callen);
	if (IS_ERR(caldata)) {
		ret =3D PTR_ERR(caldata);
		goto out;
	}

	tmdev->chip->calibrate(tmdev, caldata, callen);
    ...
}

Since the sun9i_a80_ths struct omits the .calibrate callback, if a calibrat=
ion
nvmem cell is provided (e.g. via a device tree overlay), would this cause a
NULL pointer dereference during probe?

> +	.irq_ack =3D sun9i_a80_irq_ack,

[Severity: High]
This is a pre-existing issue, but does sun8i_irq_thread() defeat spurious
interrupt detection by unconditionally returning IRQ_HANDLED?

If the hardware triggers an interrupt but irq_ack() finds no relevant status
bits (returning an irq_bitmap of 0), the loop is skipped:

drivers/thermal/sun8i_thermal.c:sun8i_irq_thread() {
	struct ths_device *tmdev =3D data;
	unsigned long irq_bitmap =3D tmdev->chip->irq_ack(tmdev);
	int i;

	for_each_set_bit(i, &irq_bitmap, tmdev->chip->sensor_num) {
        ...
	}

	return IRQ_HANDLED;
}

Returning IRQ_HANDLED instead of IRQ_NONE when no status bits are set preve=
nts
the core IRQ subsystem from detecting and disabling a stuck or spurious
interrupt line.

> +	.calc_temp =3D sun8i_ths_calc_temp,
> +};
> +
>  static const struct ths_thermal_chip sun8i_a83t_ths =3D {
>  	.sensor_num =3D 3,
>  	.scale =3D 705,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722203341.2917=
852-1-fugininsane@googlemail.com?part=3D2
