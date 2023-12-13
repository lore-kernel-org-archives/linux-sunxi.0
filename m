Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351352031B
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Dec 2023 09:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J24BTckB"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-54bf9a54fe3so9275513a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Dec 2023 01:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702460501; x=1703065301; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C83DAGlgLjSSq6kThFj4INGY4aLqpVekjXi2FmsqvB8=;
        b=J24BTckBlMacxahVR+T2DRf333ah7c5KF7h+BRcQZxW/14RD0/vg4J4dtIDqobPAFK
         Lh9duc4sO39XR8Oeo/DehjiU57zW8+06TjHuqs81OBfg+cLTL0mf9ALYRPYzGlbKn/v1
         Dpk+LlGKS4aQzVzoVOI+LzAEeKobNXU/e+BnHeZ/VN/O7FuIeCS6lnLH7uUF8uQzEXrD
         ZbTEDd6sNuimUNDU+2+2uHHx3ypKDDY+U3Q8i7NLGZ38YXWyHSSj/G1QJUNQiSHG9HoN
         8ls2EtKM6NE5m0u/CAiW2U271u5Iiaukd1yErj5Ij01elFaF99VGHgBD/mqCD329jwyc
         pMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702460501; x=1703065301;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C83DAGlgLjSSq6kThFj4INGY4aLqpVekjXi2FmsqvB8=;
        b=o0Hb8sJ3Kcc15MqgmvjQcZEPRsoQFZYZzBqEqAEbJO8cHk+ySvaSYYyUCs97BbfYQW
         Q8Z1UIknmmYzWjw52bueFwIGzzpHmjerMcBfKpAurgWUzZQT4PXfDgiqU9dTzvyNiVDX
         YCLPdAJG7zVjcDXAC/lhaewYX/iT88jKrUy0WKf+DANpvleHYUsxqw9uqqYhysvbBUvz
         sVUHPBadgSnibDL1zvFUK7mwKMEgPhSaF0Uft0141nWj7DJcLHxf6VL5l29XNAonPSIY
         u7Azb0EazN9UwYjaTj7DSk4VhEMSS3FRH1nqElXvS1vAWTF7fNvVkjsdmJoRVOLTnnRT
         gCEA==
X-Gm-Message-State: AOJu0Yxa51WWFcrY9LcOvlKbsgbVllPDNMC5UDX45jGJvr/qhPdxTSXU
	ARjtd0Lq6jsMiw5/kv9hgOX0VhhP5ZzlxdPeQhQ=
X-Google-Smtp-Source: AGHT+IG0bBWmjm6NcYA2QyCq5cfwbQDssTLyiI6RX1jLAlo6UEOqt8P078NxAt96sT8oxJMzFlNusGWOMWuo3iQnNhY=
X-Received: by 2002:a17:906:3390:b0:a1d:b97b:58d4 with SMTP id
 v16-20020a170906339000b00a1db97b58d4mr3482432eja.98.1702460501003; Wed, 13
 Dec 2023 01:41:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Wed, 13 Dec 2023 12:41:29 +0300
Message-ID: <CALHCpMj3+g5MD1vHdtZeYP3=2xBYvXMBH9ai376YwETGJRyeyA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] thermal: sun8i: add support for H616 THS controller
To: Andre Przywara <andre.przywara@arm.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, bob@electricworry.net, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-sunxi@lists.linux.dev, lukasz.luba@arm.com, 
	martin.botka@somainline.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Samuel Holland <samuel@sholland.org>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>
Content-Type: text/plain; charset="UTF-8"

Hello, again!

On 28.11.2023 03:58, Andre Przywara wrote:
> From: Martin Botka <martin.botka@somainline.org>
>
> Add support for the thermal sensor found in H616 SoCs, which slightly
> resembles the H6 thermal sensor controller, with a few changes like
> four sensors.
> Also the registers readings are wrong, unless a bit in the first SYS_CFG
> register cleared, so set needs_syscon to trigger that code
>
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> drivers/thermal/sun8i_thermal.c | 73 +++++++++++++++++++++++++++++++++
> 1 file changed, 73 insertions(+)
>
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
> index 920e419ce7343..9a404fa9d76a9 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -280,6 +280,64 @@ static int sun50i_h6_ths_calibrate(struct ths_device *tmdev,
> return 0;
> }
>
> +static int sun50i_h616_ths_calibrate(struct ths_device *tmdev,
> + u16 *caldata, int callen)
> +{
> + struct device *dev = tmdev->dev;
> + int i, ft_temp;
> +
> + if (!caldata[0])
> + return -EINVAL;
> +
> + /*
> + * h616 efuse THS calibration data layout:
> + *
> + * 0 11 16 27 32 43 48 57
> + * +----------+-----------+-----------+-----------+
> + * | temp | |sensor0| |sensor1| |sensor2| |
> + * +----------+-----------+-----------+-----------+
> + * ^ ^ ^
> + * | | |
> + * | | sensor3[11:8]
> + * | sensor3[7:4]
> + * sensor3[3:0]
> + *
> + * The calibration data on the H616 is the ambient temperature and
> + * sensor values that are filled during the factory test stage.
> + *
> + * The unit of stored FT temperature is 0.1 degree celsius.
> + */
> + ft_temp = caldata[0] & FT_TEMP_MASK;
> +
> + for (i = 0; i < tmdev->chip->sensor_num; i++) {
> + int delta, cdata, offset, reg, temp;
> +
> + if (i == 3)
> + reg = (caldata[1] >> 12)
> + | ((caldata[2] >> 12) << 4)
> + | ((caldata[3] >> 12) << 8);
> + else
> + reg = (int)caldata[i + 1] & TEMP_CALIB_MASK;
> +
> + temp = tmdev->chip->calc_temp(tmdev, i, reg);
> + delta = ((temp - ft_temp * 100) * 10) / tmdev->chip->scale;
> + cdata = CALIBRATE_DEFAULT - delta;
> + if (cdata & ~TEMP_CALIB_MASK) {
> + dev_warn(dev, "sensor%d is not calibrated.\n", i);
> +
> + continue;
> + }
> +
> + offset = (i % 2) * 16;
> + regmap_update_bits(tmdev->regmap,
> + SUN50I_H6_THS_TEMP_CALIB + (i / 2 * 4),
> + TEMP_CALIB_MASK << offset,
> + cdata << offset);
> + }
> +
> + return 0;
> +}
> +
> static int sun8i_ths_calibrate(struct ths_device *tmdev)
> {
> struct nvmem_cell *calcell;
> @@ -659,6 +717,20 @@ static const struct ths_thermal_chip sun50i_h6_ths = {
> .calc_temp = sun8i_ths_calc_temp,
> };
>
> +static const struct ths_thermal_chip sun50i_h616_ths = {
> + .sensor_num = 4,
> + .has_bus_clk_reset = true,
> + .needs_syscon = true,
> + .ft_deviation = 8000,
> + .offset = 263655,
> + .scale = 810,

Can I ask you, how did you get the offset and the scale values?

In the H616 user manual (3.10.3.4. THS Temperature Conversion Formula)
we can find this formula:

T = (sensor_data - 3255)/(-12.401)

I calculated offset and scale values, and this is what I got:

scale = 1 / 12.401 = 806,38658173 ~ 806
offset = 3255 / 12.401 = 262478,832352 ~ 262479

Let me assume that you got offset and scale values from Tina Linux
Here for example
https://github.com/Tina-Linux/linux-5.4/blob/ff6b1361f7041be75d4486559141e13134d164ef/drivers/thermal/sunxi_thermal.c#L373

In Tina Linux the scale is rounded to 81 (that equals to 810 in
mainline driver).
And looks like you used this rounded value to recalculate the offset:
3255 * 81 = 263655

I would be glad to know your thoughts about this.

> + .temp_data_base = SUN50I_H6_THS_TEMP_DATA,
> + .calibrate = sun50i_h616_ths_calibrate,
> + .init = sun50i_h6_thermal_init,
> + .irq_ack = sun50i_h6_irq_ack,
> + .calc_temp = sun8i_ths_calc_temp,
> +};
> +
> static const struct of_device_id of_ths_match[] = {
> { .compatible = "allwinner,sun8i-a83t-ths", .data = &sun8i_a83t_ths },
> { .compatible = "allwinner,sun8i-h3-ths", .data = &sun8i_h3_ths },
> @@ -667,6 +739,7 @@ static const struct of_device_id of_ths_match[] = {
> { .compatible = "allwinner,sun50i-a100-ths", .data = &sun50i_a100_ths },
> { .compatible = "allwinner,sun50i-h5-ths", .data = &sun50i_h5_ths },
> { .compatible = "allwinner,sun50i-h6-ths", .data = &sun50i_h6_ths },
> + { .compatible = "allwinner,sun50i-h616-ths", .data = &sun50i_h616_ths },
> { /* sentinel */ },
> };
> MODULE_DEVICE_TABLE(of, of_ths_match);

Best regards,
Maksim
