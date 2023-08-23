Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DFC156E6
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 19:43:56 +0000 (UTC)
Received: from [192.168.2.144] (bband-dyn125.178-40-246.t-com.sk [178.40.246.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 48BE1203FB;
	Wed, 23 Aug 2023 21:43:46 +0200 (CEST)
Date: Wed, 23 Aug 2023 21:43:40 +0200
From: Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH v2 2/3] thermal: sun8i: Add support for H616 THS
 controller
To: Jernej =?iso-8859-2?q?=A9krabec?= <jernej.skrabec@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li
	<tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
	<samuel@sholland.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
	Alan Ma <tech@biqu3d.com>, Luke Harrison <bttuniversity@biqu3d.com>,
	Marijn Suijten <marijn.suijten@somainline.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@somainline.org>, Konrad Dybcio
	<konrad.dybcio@somainline.org>, Martin Botka <martin@biqu3d.com>
Message-Id: <S40VZR.495H1PJ1FSZO3@somainline.org>
In-Reply-To: <21986607.EfDdHjke4D@jernej-laptop>
References: <20230821-ths-h616-v2-0-cda60d556798@somainline.org>
	<20230821-ths-h616-v2-2-cda60d556798@somainline.org>
	<21986607.EfDdHjke4D@jernej-laptop>
X-Mailer: geary/43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable



On Wed, Aug 23 2023 at 09:38:30 PM +02:00:00, Jernej =A9krabec=20
<jernej.skrabec@gmail.com> wrote:
> Dne ponedeljek, 21. avgust 2023 ob 16:03:47 CEST je Martin Botka=20
> napisal(a):
>>  Add support for the thermal sensor found in H616 SoC
>>  which slightly resembles the H6 thermal sensor
>>  controller with few changes like 4 sensors.
>>=20
>>  Signed-off-by: Martin Botka <martin.botka@somainline.org>
>>  ---
>>   drivers/thermal/sun8i_thermal.c | 74
>>  +++++++++++++++++++++++++++++++++++++++++ 1 file changed, 74=20
>> insertions(+)
>>=20
>>  diff --git a/drivers/thermal/sun8i_thermal.c
>>  b/drivers/thermal/sun8i_thermal.c index 195f3c5d0b38..cf96ab6a445b=20
>> 100644
>>  --- a/drivers/thermal/sun8i_thermal.c
>>  +++ b/drivers/thermal/sun8i_thermal.c
>>  @@ -278,6 +278,66 @@ static int sun50i_h6_ths_calibrate(struct=20
>> ths_device
>>  *tmdev, return 0;
>>   }
>>=20
>>  +static int sun50i_h616_ths_calibrate(struct ths_device *tmdev,
>>  +				     u16 *caldata, int callen)
>>  +{
>>  +	struct device *dev =3D tmdev->dev;
>>  +	int i, ft_temp;
>>  +
>>  +	if (!caldata[0])
>>  +		return -EINVAL;
>>  +
>>  +	/*
>>  +	 * h616 efuse THS calibration data layout:
>>  +	 *
>>  +	 * 0      11  16     27   32     43   48    57
>>  +	 * +----------+-----------+-----------+-----------+
>>  +	 * |  temp |  |sensor0|   |sensor1|   |sensor2|   |
>>  +	 * +----------+-----------+-----------+-----------+
>>  +	 *                      ^           ^           ^
>>  +	 *                      |           |           |
>>  +	 *                      |           |           sensor3[11:8]
>>  +	 *                      |           sensor3[7:4]
>>  +	 *                      sensor3[3:0]
>>  +	 *
>>  +	 * The calibration data on the H616 is the ambient temperature and
>>  +	 * sensor values that are filled during the factory test stage.
>>  +	 *
>>  +	 * The unit of stored FT temperature is 0.1 degree celsius.
>>  +	 */
>>  +	ft_temp =3D caldata[0] & FT_TEMP_MASK;
>>  +
>>  +	for (i =3D 0; i < tmdev->chip->sensor_num; i++) {
>>  +		int delta, cdata, offset, reg;
>>  +
>>  +		if (i =3D=3D 3)
>>  +			reg =3D (caldata[1] >> 12)
>>  +			      | ((caldata[2] >> 12) << 4)
>>  +			      | ((caldata[3] >> 12) << 8);
>>  +		else
>>  +			reg =3D (int)caldata[i + 1] & TEMP_CALIB_MASK;
>>  +
>>  +		int sensor_temp =3D tmdev->chip->calc_temp(tmdev, i, reg);
>=20
> Variable declaration should be done at the beginning of code block.
Hello Jernej,

Indeed. Will fix in next revision :)

Cheers,
Martin
>=20
> Best regards,
> Jernej
>=20
>>  +
>>  +		delta =3D (sensor_temp - ft_temp * 100) * 10;
>>  +		delta /=3D tmdev->chip->scale;
>>  +		cdata =3D CALIBRATE_DEFAULT - delta;
>>  +		if (cdata & ~TEMP_CALIB_MASK) {
>>  +			dev_warn(dev, "sensor%d is not calibrated.
> \n", i);
>>  +
>>  +			continue;
>>  +		}
>>  +
>>  +		offset =3D (i % 2) * 16;
>>  +		regmap_update_bits(tmdev->regmap,
>>  +				   SUN50I_H6_THS_TEMP_CALIB + (i /
> 2 * 4),
>>  +				   TEMP_CALIB_MASK << offset,
>>  +				   cdata << offset);
>>  +	}
>>  +
>>  +	return 0;
>>  +}
>>  +
>>   static int sun8i_ths_calibrate(struct ths_device *tmdev)
>>   {
>>   	struct nvmem_cell *calcell;
>>  @@ -608,6 +668,19 @@ static const struct ths_thermal_chip=20
>> sun50i_h6_ths =3D {
>>   	.calc_temp =3D sun8i_ths_calc_temp,
>>   };
>>=20
>>  +static const struct ths_thermal_chip sun50i_h616_ths =3D {
>>  +	.sensor_num =3D 4,
>>  +	.has_bus_clk_reset =3D true,
>>  +	.ft_deviation =3D 8000,
>>  +	.offset =3D 263655,
>>  +	.scale =3D 810,
>>  +	.temp_data_base =3D SUN50I_H6_THS_TEMP_DATA,
>>  +	.calibrate =3D sun50i_h616_ths_calibrate,
>>  +	.init =3D sun50i_h6_thermal_init,
>>  +	.irq_ack =3D sun50i_h6_irq_ack,
>>  +	.calc_temp =3D sun8i_ths_calc_temp,
>>  +};
>>  +
>>   static const struct of_device_id of_ths_match[] =3D {
>>   	{ .compatible =3D "allwinner,sun8i-a83t-ths", .data =3D
> &sun8i_a83t_ths },
>>   	{ .compatible =3D "allwinner,sun8i-h3-ths", .data =3D &sun8i_h3_ths }=
,
>>  @@ -616,6 +689,7 @@ static const struct of_device_id of_ths_match[]=20
>> =3D {
>>   	{ .compatible =3D "allwinner,sun50i-a100-ths", .data =3D
> &sun50i_a100_ths },
>>   	{ .compatible =3D "allwinner,sun50i-h5-ths", .data =3D &sun50i_h5_ths
> },
>>   	{ .compatible =3D "allwinner,sun50i-h6-ths", .data =3D &sun50i_h6_ths
> },
>>  +	{ .compatible =3D "allwinner,sun50i-h616-ths", .data =3D
> &sun50i_h616_ths },
>>   	{ /* sentinel */ },
>>   };
>>   MODULE_DEVICE_TABLE(of, of_ths_match);
>=20
>=20
>=20
>=20


