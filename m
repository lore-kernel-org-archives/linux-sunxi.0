Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C15220E3
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Dec 2022 12:20:53 +0000 (UTC)
Received: from [127.0.0.1] (85-237-234-60.dynamic.orange.sk [85.237.234.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1004B200FE;
	Fri, 16 Dec 2022 13:20:51 +0100 (CET)
Date: Fri, 16 Dec 2022 13:20:50 +0100
From: Martin Botka <martin.botka@somainline.org>
To: Andre Przywara <andre.przywara@arm.com>
CC: martin.botka1@gmail.com, Konrad Dybcio <konrad.dybcio@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jamipkettunen@somainline.org>,
 Paul Bouchara <paul.bouchara@somainline.org>, Jan Trmal <jtrmal@gmail.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 linux-sunxi <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH v5 3/3] regulator: axp20x: Add support for AXP1530 variant
User-Agent: K-9 Mail for Android
In-Reply-To: <20221216115214.1be53742@donnerap.cambridge.arm.com>
References: <20221214190305.3354669-1-martin.botka@somainline.org> <20221214190305.3354669-4-martin.botka@somainline.org> <20221215231615.6a4fa710@slackpad.lan> <F47BD077-BB4B-4866-B5E7-445D6CCE4FCE@somainline.org> <20221216115214.1be53742@donnerap.cambridge.arm.com>
Message-ID: <3397B9D4-253B-4A1B-B321-84FCD8460FBA@somainline.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On December 16, 2022 12:52:14 PM GMT+01:00, Andre Przywara <andre=2Eprzywa=
ra@arm=2Ecom> wrote:
>On Fri, 16 Dec 2022 06:26:38 +0100
>Martin Botka <martin=2Ebotka@somainline=2Eorg> wrote:
>
>Hi Martin,
>
>> On December 16, 2022 12:16:15 AM GMT+01:00, Andre Przywara <andre=2Eprz=
ywara@arm=2Ecom> wrote:
>> >On Wed, 14 Dec 2022 20:03:05 +0100
>> >Martin Botka <martin=2Ebotka@somainline=2Eorg> wrote:
>> >
>> >Hi Martin,
>> > =20
>> >> AXP1530 has a few regulators that are controlled via I2C Bus=2E
>> >>=20
>> >> Add support for them=2E =20
>> >
>> >thanks for putting this together!
>> >After coming up with a very similar patch based on the AXP313A313
>> >datasheet, I realised that those two must indeed be *somewhat*
>> >compatible, so I am going to compare my patch with yours ;-)
>> > =20
>> Hello Andre,
>> Thanks so much for looking at this=2E
>> >>=20
>> >> Signed-off-by: Martin Botka <martin=2Ebotka@somainline=2Eorg>
>> >> ---
>> >>  drivers/regulator/axp20x-regulator=2Ec | 44 +++++++++++++++++++++++=
+++++
>> >>  1 file changed, 44 insertions(+)
>> >>=20
>> >> diff --git a/drivers/regulator/axp20x-regulator=2Ec b/drivers/regula=
tor/axp20x-regulator=2Ec
>> >> index d260c442b788=2E=2E9420839ff4f9 100644
>> >> --- a/drivers/regulator/axp20x-regulator=2Ec
>> >> +++ b/drivers/regulator/axp20x-regulator=2Ec
>> >> @@ -1001,6 +1001,40 @@ static const struct regulator_desc axp813_reg=
ulators[] =3D {
>> >>  		    AXP22X_PWR_OUT_CTRL2, AXP22X_PWR_OUT_DC1SW_MASK),
>> >>  };
>> >> =20
>> >> +static const struct linear_range axp1530_dcdc1_ranges[] =3D {
>> >> +	REGULATOR_LINEAR_RANGE(500000, 0x0, 0x46, 10000), =20
>> >
>> >The AXP313A manual mentions "steps", in decimal
>> >(0=2E5~1=2E2V=EF=BC=8C10mV/step=EF=BC=8C71steps), so I wonder if we sh=
ould follow suit
>> >here and describe the min_sel and max_sel members in decimal?
>> > =20
>> Ack=2E We definitely can :)
>> >> +	REGULATOR_LINEAR_RANGE(1220000, 0x47, 0x57, 20000),
>> >> +	REGULATOR_LINEAR_RANGE(1600000, 0x58, 0x6A, 100000),
>> >> +};
>> >> +
>> >> +static const struct linear_range axp1530_dcdc2_ranges[] =3D {
>> >> +	REGULATOR_LINEAR_RANGE(500000, 0x0, 0x46, 10000),
>> >> +	REGULATOR_LINEAR_RANGE(1220000, 0x47, 0x57, 20000),
>> >> +}; =20
>> >
>> >The values up till here match exactly what I extracted from the AXP313=
A
>> >manual=2E
>> > =20
>> >> +
>> >> +static const struct linear_range axp1530_dcdc3_ranges[] =3D {
>> >> +	REGULATOR_LINEAR_RANGE(500000, 0x0, 0x46, 10000),
>> >> +	REGULATOR_LINEAR_RANGE(1220000, 0x47, 0x66, 20000),
>> >> +}; =20
>> >
>> >Can you double check that those are the values for DCDC3?
>> >The AXP313A manual uses different ranges, essentially:
>> >    REGULATOR_LINEAR_RANGE(800000, 0, 32, 10000),
>> >    REGULATOR_LINEAR_RANGE(1140000, 33, 68, 20000),
>> >So starting from 800mV, and using a slightly different split point=2E
>> >
>> >I would just hope that's this doesn't turn out to be an incompatible r=
egister=2E
>> > =20
>> Interesting=2E The unfortunate thing with 1530 is that i could not find=
 any datasheet referencing it=2E The actual PMIC that is on the device i ha=
ve here is 313A=2E Do i think it would be best if i rename this driver to 3=
13A and follow the 313A datasheet which is public=2E
>
>So where does the 1530 name and the other bits come from? Was there some
>statement somewhere that AXP1530 is the canonical chip, and the 313A is
>just a variant? Or are there devices using this chip, and you just happen
>to not have them, but a "compatible enough" 313A instead?
>
I have yet to see actual device using this chip=2E If they have the driver=
 its AXP313A=2E I have Biqu CB1 which uses the AXP313A but in code and in s=
ome places in datasheet for this device (not yet public=2E Hopefully that w=
ill change) its referenced as AXP1530=2E The driver was also named like thi=
s=2E So this is where the name comes from=2E

I do have contact to the developers so what i will do is contact them and =
ask why this is done=2E
>> This was already proposed in one of my device tree series=2E
>> What do you think of this idea Andre ?
>
>In general, I think it's too dangerous to develop against something you
>cannot test against=2E So I would always call this driver after the chip =
I
>have access to, especially if there is also a datasheet for it=2E
>If someone later finds the AXP1530 to be compatible, they can always use:
>	compatible =3D "x-powers,axp1530", "x-powers,axp313a";
>Or later on add explicit support for that chip if it turns out to be not
>fully compatible=2E
>
>The only reason to not do it this way around would be if one was a strict
>subset of the other=2E So if the 313A is the 1530 plus RTCLDO, for instan=
ce,
>it would make sense to reflect that in the compatible strings (by swappin=
g
>them in the above example)=2E
>But then again there is really no legacy here, so we could just upstream
>support for both variants in one go, using separate compatible strings,
>and let them just share some data structures internally=2E That is probab=
ly
>cleaner, and if both are going it at the same time, there is no downside,
>really=2E
>
Yea sounds good=2E So rename to 313A change bits and bobs
And if someone has 1530 they can add it later=2E
>> >> +static const struct regulator_desc axp1530_regulators[] =3D {
>> >> +	AXP_DESC_RANGES(AXP1530, DCDC1, "dcdc1", "vin1", axp1530_dcdc1_ran=
ges,
>> >> +					0x6B, AXP1530_DCDC1_CONRTOL, 0x7f, AXP1530_OUTPUT_CONTROL, =20
>> >
>> >Again I would code the steps in decimal=2E The other regulators use a
>> >preprocessor constant, which helps the reader to get its meaning=2E
>> >And please use at least GENMASK(6, 0) instead of 0x7f, or #define this
>> >(can be shared for all DCDCs and the LDOs)=2E
>> > =20
>> Ack=2E Will use GENMASK=2E
>> >> +					BIT(0)),
>> >> +	AXP_DESC_RANGES(AXP1530, DCDC2, "dcdc2", "vin2", axp1530_dcdc2_ran=
ges,
>> >> +					0x58, AXP1530_DCDC2_CONRTOL, 0x7f, AXP1530_OUTPUT_CONTROL,
>> >> +					BIT(1)),
>> >> +	AXP_DESC_RANGES(AXP1530, DCDC3, "dcdc3", "vin3", axp1530_dcdc3_ran=
ges,
>> >> +					0x58, AXP1530_DCDC3_CONRTOL, 0x7f, AXP1530_OUTPUT_CONTROL,
>> >> +					BIT(2)),
>> >> +	AXP_DESC(AXP1530, LDO1, "ldo1", "ldo1in", 500, 3500, 100,
>> >> +					AXP1530_ALDO1_CONRTOL, 0x1f, AXP1530_OUTPUT_CONTROL,
>> >> +					BIT(3)),
>> >> +	AXP_DESC(AXP1530, LDO2, "ldo2", "ldo2in", 500, 3500, 100,
>> >> +					AXP1530_DLDO1_CONRTOL, 0x1f, AXP1530_OUTPUT_CONTROL,
>> >> +					BIT(4)), =20
>> >
>> >Does this miss the fixed RTC-LDO? Or does the AXP1530 not have that?
>> >        AXP_DESC_FIXED(AXP313, RTC_LDO, "rtc-ldo", "ips", 1800),
>> >The AXP313A manual mentions that the voltage is customisable, either
>> >1=2E8V or 3=2E3V=2E I don't know how to model that, exactly=2E Should =
this be a
>> >DT property, then? Or do we fix it to one voltage, covering the value
>> >that's used out there?
>> > =20
>> This is what always struck me as weird=2E This driver is based upon dow=
nstream version it indeed does miss the rtc-ldo=2E
>
>Well, in my experience downstream (BSP) drivers cannot be really trusted
>in this regard=2E
>So they could just papered over it by modelling this as a separate
>"regulator-fixed"? Or maybe this was their solution for the "customise"
>problem? So instead of having this as part of the AXP, they just put a
>per-board fixed regulator in and set the voltage there?
>
Very fair point=2E
I will add it in the 313A :)

Cheers,
Martin
>Cheers,
>Andre
>
>> Afaik this may be the only difference between 1530 and 313 (other then =
what you pointed out the dcdc3 registers)
>> >> +};
>> >> +
>> >>  static int axp20x_set_dcdc_freq(struct platform_device *pdev, u32 d=
cdcfreq)
>> >>  {
>> >>  	struct axp20x_dev *axp20x =3D dev_get_drvdata(pdev->dev=2Eparent);
>> >> @@ -1040,6 +1074,12 @@ static int axp20x_set_dcdc_freq(struct platfo=
rm_device *pdev, u32 dcdcfreq)
>> >>  		def =3D 3000;
>> >>  		step =3D 150;
>> >>  		break;
>> >> +	case AXP1530_ID:
>> >> +		/*
>> >> +		 * Do not set the DCDC frequency on AXP1530 =20
>> >
>> >This should say that the frequency is fixed and cannot be programmed=
=2E
>> >I also added a warning if the frequency is not 3 MHz=2E
>> >Either this, or we make the "x-powers,dcdc-freq" DT property optional=
=2E
>> > =20
>> Ack=2E Will reword and add warning=2E
>> >Cheers,
>> >Andre
>> > =20
>> Cheers,
>> Martin
>> >> +		 */
>> >> +		return 0;
>> >> +		break;
>> >>  	default:
>> >>  		dev_err(&pdev->dev,
>> >>  			"Setting DCDC frequency for unsupported AXP variant\n");
>> >> @@ -1220,6 +1260,10 @@ static int axp20x_regulator_probe(struct plat=
form_device *pdev)
>> >>  	bool drivevbus =3D false;
>> >> =20
>> >>  	switch (axp20x->variant) {
>> >> +	case AXP1530_ID:
>> >> +		regulators =3D axp1530_regulators;
>> >> +		nregulators =3D AXP1530_REG_ID_MAX;
>> >> +		break;
>> >>  	case AXP202_ID:
>> >>  	case AXP209_ID:
>> >>  		regulators =3D axp20x_regulators; =20
>> > =20
>
