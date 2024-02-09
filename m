Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A0F7FA
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Feb 2024 00:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707440164; cv=none; b=FLiWvuincx4+JzZm3tMR1rmft8+N+PdKuEM3sC7A1/CGezcZxIZwgFVbEPZiObRMikg8/WkRq8TYC++EVg7PwbXUxJKsU5EDyAcPttmDz9XHEbCx5+pHvRQGogRI3lEWUAD29qwE1JlQzpVhQpO/HeyAAxIPSJ/r2D7SF5ob3fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707440164; c=relaxed/simple;
	bh=1dCpeep0agJQkedOkDf1VFb6WXerfmYqYZqWOn7Iwzw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IcvL5N1MgBy6216AlmDt7J2TElf4B3D/gIb3k4AQDPkEhA+qWYqCdU00kKTCWUCBEAef4f6Lkzc0vFUQsq/Zf7nLf55twgZx3yYIyXtIg1UZWx7MBEgl8P1IMMlsOQekBTj5l+R4lqLYWvrds29zy1dDTyi6oLmJZRCBUyz1oDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BF3EDA7;
	Thu,  8 Feb 2024 16:56:43 -0800 (PST)
Received: from minigeek.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6CDF3F64C;
	Thu,  8 Feb 2024 16:55:59 -0800 (PST)
Date: Fri, 9 Feb 2024 00:54:46 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Alilovic
 <nickalilovic@gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: Add Jide Remix Mini PC
 support
Message-ID: <20240209005446.7fb50882@minigeek.lan>
In-Reply-To: <1957012.PYKUYFuaPT@jernej-laptop>
References: <20240204094404.149776-1-andre.przywara@arm.com>
	<8d9d1d7c-8066-4400-8fe4-68aa0e28023d@arm.com>
	<10413667.nUPlyArG6x@jernej-laptop>
	<1957012.PYKUYFuaPT@jernej-laptop>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 06 Feb 2024 19:27:22 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

....

> > > >>>>> +&mmc2 {
> > > >>>>> +	pinctrl-names =3D "default";
> > > >>>>> +	pinctrl-0 =3D <&mmc2_pins>, <&mmc2_ds_pin>;
> > > >>>>> +	vmmc-supply =3D <&reg_dcdc1>;
> > > >>>>> +	vqmmc-supply =3D <&reg_eldo1>;
> > > >>>>> +	bus-width =3D <8>;
> > > >>>>> +	non-removable;
> > > >>>>> +	mmc-ddr-1_8v;
> > > >>>>> +	mmc-hs200-1_8v; =20
> > > >>>>
> > > >>>> Aren't these speed modes enabled by default? =20
> > > >>
> > > >> Enabled by who? Our current sunxi-mmc driver? I cannot find anythi=
ng in
> > > >> the binding that suggests that there would be some default setting=
s. =20
> > > >=20
> > > > Looking at Linux sunxi mmc driver, mmc-ddr-1_8v is enabled by defau=
lt for
> > > > "new timings" variants except for H5. Anyway... =20
> > >=20
> > > But this is a Linux implementation detail, which we should not rely o=
n=20
> > > in a DT? And if I remember Maxime correctly back then, the plan was t=
o=20
> > > avoid those driver hacks and just say what we support in the DT, goin=
g=20
> > > forward. This might be needed for other OSes, which might not support=
=20
> > > HS-200? =20
> > > >>> Sorry, mmc-hs200-1_8v is ok, but mmc-ddr-1_8v should be
> > > >>> removed. =20
> > > >>
> > > >> Mmh, I am confused: I thought after the H5 eMMC mishap we figured =
that
> > > >> all speed modes supported by the eMMC chip should be listed in the=
 DT? =20
> > > >=20
> > > > I think H5 just has (had?) driver issue. From what I can see, only =
highest
> > > > supported mode by kernel and chip is specified in all Allwinner DTs.
> > > > mmc-ddr-1_8v is only specified by two recent board addition, where =
I missed
> > > > it while reviewing.
> > > >  =20
> > > >> So any driver wouldn't need to make assumptions, and if a particul=
ar
> > > >> mode shows problems on a board, we just remove that mode from the =
DT.
> > > >> Actually, thinking about that, I guess I should list HS-400 as wel=
l? The
> > > >> BSP kernel uses that mode. =20
> > > >=20
> > > > Sure, but it also calibrates timing for it. If you'll specify HS400=
, kernel
> > > > will try to use it, but it won't work. =20
> > >=20
> > > But this is also a limitation of the current Linux kernel driver. And=
=20
> > > since we indeed don't support HS-400, we explicitly remove it from th=
e=20
> > > capability list, *after* the call to mmc_of_parse():
> > >=20
> > > drivers/mmc/host/sunxi-mmc.c:1460
> > >          /* TODO: This driver doesn't support HS400 mode yet */
> > >          mmc->caps2 &=3D ~MMC_CAP2_HS400;
> > >=20
> > > So I think this should be safe? =20
> >=20
> > Right. Can you test it?
> >=20
> > Best regards,
> > Jernej
> >  =20
> > >=20
> > > Cheers,
> > > Andre
> > >  =20
> > > >  =20
> > > >> Or do you mean to say that in particular DDR (@1.8V) is problemati=
c? I
> > > >> cannot test at the moment, but could try later to force that mode.=
 =20
> > > >=20
> > > > No, no need. =20
>=20
> If we go in new direction, then it would be good to test it.

So I did this, and curiously enough MMC DDR didn't work. It's a bit
odd, since 50 MHz DDR sounds less problematic than 200 MHz SDR, but
apparently there is more than just the frequency at play here.
Announcing HS-400 didn't make a difference in Linux, as expected, since
the driver filters it out.

So I will drop mmc-ddr-1_8v, but add mmc-hs400-1_8v.

Thanks,
Andre


>=20
> Best regards,
> Jernej
>=20
> > > >=20
> > > > Best regards,
> > > > Jernej
> > > >  =20
> > > >>
> > > >> Cheers,
> > > >> Andre
> > > >>
> > > >> =20
> > > >>>>> +	cap-mmc-hw-reset;
> > > >>>>> +	status =3D "okay";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&ohci0 {
> > > >>>>> +	status =3D "okay";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&ohci1 {
> > > >>>>> +	status =3D "okay";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&pio {
> > > >>>>> +	vcc-pb-supply =3D <&reg_dcdc1>;
> > > >>>>> +	vcc-pc-supply =3D <&reg_dcdc1>;
> > > >>>>> +	vcc-pd-supply =3D <&reg_dcdc1>;
> > > >>>>> +	vcc-pe-supply =3D <&reg_dcdc1>;
> > > >>>>> +	vcc-pf-supply =3D <&reg_dcdc1>;
> > > >>>>> +	vcc-pg-supply =3D <&reg_dldo4>;
> > > >>>>> +	vcc-ph-supply =3D <&reg_dcdc1>;
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&r_ir {
> > > >>>>> +	status =3D "okay";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&r_pio {
> > > >>>>> +	/*
> > > >>>>> +	 * We cannot add that supply for now since it would create a =
circular
> > > >>>>> +	 * dependency between pinctrl, the regulator and the RSB Bus.
> > > >>>>> +	 *
> > > >>>>> +	 * vcc-pl-supply =3D <&reg_aldo2>;
> > > >>>>> +	 */
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&r_rsb {
> > > >>>>> +	status =3D "okay";
> > > >>>>> +
> > > >>>>> +	axp803: pmic@3a3 {
> > > >>>>> +		compatible =3D "x-powers,axp803";
> > > >>>>> +		reg =3D <0x3a3>;
> > > >>>>> +		interrupt-parent =3D <&r_intc>;
> > > >>>>> +		interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_LOW>;
> > > >>>>> +		x-powers,drive-vbus-en;
> > > >>>>> +
> > > >>>>> +		vin1-supply =3D <&reg_vcc5v>;
> > > >>>>> +		vin2-supply =3D <&reg_vcc5v>;
> > > >>>>> +		vin3-supply =3D <&reg_vcc5v>;
> > > >>>>> +		vin5-supply =3D <&reg_vcc5v>;
> > > >>>>> +		vin6-supply =3D <&reg_vcc5v>;
> > > >>>>> +		aldoin-supply =3D <&reg_vcc5v>;
> > > >>>>> +		dldoin-supply =3D <&reg_vcc5v>;
> > > >>>>> +		eldoin-supply =3D <&reg_vcc5v>;
> > > >>>>> +		fldoin-supply =3D <&reg_vcc5v>;
> > > >>>>> +		drivevbus-supply =3D <&reg_vcc5v>;
> > > >>>>> +		ips-supply =3D <&reg_vcc5v>;
> > > >>>>> +
> > > >>>>> +		status =3D "okay";
> > > >>>>> +	};
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +#include "axp803.dtsi"
> > > >>>>> +
> > > >>>>> +&ac_power_supply {
> > > >>>>> +	status =3D "okay";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&reg_dcdc1 {
> > > >>>>> +	regulator-always-on;
> > > >>>>> +	regulator-min-microvolt =3D <3300000>;
> > > >>>>> +	regulator-max-microvolt =3D <3300000>;
> > > >>>>> +	regulator-name =3D "vcc-3v3";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&reg_dcdc2 {
> > > >>>>> +	regulator-always-on;
> > > >>>>> +	regulator-min-microvolt =3D <1040000>;
> > > >>>>> +	regulator-max-microvolt =3D <1300000>;
> > > >>>>> +	regulator-name =3D "vdd-cpux";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +/* DCDC3 is polyphased with DCDC2 */
> > > >>>>> +
> > > >>>>> +&reg_dcdc5 {
> > > >>>>> +	regulator-always-on;
> > > >>>>> +	regulator-min-microvolt =3D <1500000>;
> > > >>>>> +	regulator-max-microvolt =3D <1500000>;
> > > >>>>> +	regulator-name =3D "vcc-dram";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +/* Deviates from the reset default of 1.1V. */
> > > >>>>> +&reg_dcdc6 {
> > > >>>>> +	regulator-always-on;
> > > >>>>> +	regulator-min-microvolt =3D <1200000>;
> > > >>>>> +	regulator-max-microvolt =3D <1200000>;
> > > >>>>> +	regulator-name =3D "vdd-sys";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&reg_aldo1 {
> > > >>>>> +	regulator-min-microvolt =3D <3300000>;
> > > >>>>> +	regulator-max-microvolt =3D <3300000>;
> > > >>>>> +	regulator-name =3D "vcc-wifi";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&reg_aldo2 {
> > > >>>>> +	/* Specifying R_PIO consumer would create circular dependency=
. */
> > > >>>>> +	regulator-always-on;
> > > >>>>> +	regulator-min-microvolt =3D <3300000>;
> > > >>>>> +	regulator-max-microvolt =3D <3300000>;
> > > >>>>> +	regulator-name =3D "vcc-pl";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&reg_aldo3 {
> > > >>>>> +	regulator-always-on;
> > > >>>>> +	regulator-min-microvolt =3D <3000000>;
> > > >>>>> +	regulator-max-microvolt =3D <3000000>;
> > > >>>>> +	regulator-name =3D "vcc-pll-avcc";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +/* AC200 power supply */
> > > >>>>> +&reg_dldo1 {
> > > >>>>> +	regulator-always-on;
> > > >>>>> +	regulator-min-microvolt =3D <3300000>;
> > > >>>>> +	regulator-max-microvolt =3D <3300000>;
> > > >>>>> +	regulator-name =3D "vcc-ave-33";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&reg_dldo4 {
> > > >>>>> +	regulator-min-microvolt =3D <3300000>;
> > > >>>>> +	regulator-max-microvolt =3D <3300000>;
> > > >>>>> +	regulator-name =3D "vcc-wifi-io";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&reg_drivevbus {
> > > >>>>> +	regulator-name =3D "usb0-vbus";
> > > >>>>> +	status =3D "okay";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&reg_eldo1 {
> > > >>>>> +	regulator-always-on;
> > > >>>>> +	regulator-min-microvolt =3D <1800000>;
> > > >>>>> +	regulator-max-microvolt =3D <1800000>;
> > > >>>>> +	regulator-name =3D "vcc-cpvdd-dram-emmc";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +/* Supplies the arisc management core, needed by TF-A to power=
 off cores. */
> > > >>>>> +&reg_fldo2 {
> > > >>>>> +	regulator-always-on;
> > > >>>>> +	regulator-min-microvolt =3D <1100000>;
> > > >>>>> +	regulator-max-microvolt =3D <1100000>;
> > > >>>>> +	regulator-name =3D "vdd-cpus";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&reg_rtc_ldo {
> > > >>>>> +	regulator-name =3D "vcc-rtc";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&simplefb_hdmi {
> > > >>>>> +	vcc-hdmi-supply =3D <&reg_dcdc1>;
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&sound {
> > > >>>>> +	simple-audio-card,aux-devs =3D <&codec_analog>;
> > > >>>>> +	simple-audio-card,widgets =3D "Microphone", "Microphone Jack",
> > > >>>>> +				    "Headphone", "Headphone Jack";
> > > >>>>> +	simple-audio-card,routing =3D
> > > >>>>> +			"Left DAC", "DACL",
> > > >>>>> +			"Right DAC", "DACR",
> > > >>>>> +			"Headphone Jack", "HP",
> > > >>>>> +			"ADCL", "Left ADC",
> > > >>>>> +			"ADCR", "Right ADC",
> > > >>>>> +			"MIC2", "Microphone Jack";
> > > >>>>> +	status =3D "okay";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +/* On the (unpopulated) UART pads. */
> > > >>>>> +&uart0 {
> > > >>>>> +	pinctrl-names =3D "default";
> > > >>>>> +	pinctrl-0 =3D <&uart0_pb_pins>;
> > > >>>>> +	status =3D "okay";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&uart1 {
> > > >>>>> +	pinctrl-names =3D "default";
> > > >>>>> +	pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> > > >>>>> +	uart-has-rtscts;
> > > >>>>> +	status =3D "okay";
> > > >>>>> +
> > > >>>>> +	bluetooth {
> > > >>>>> +		compatible =3D "realtek,rtl8723bs-bt";
> > > >>>>> +		enable-gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
> > > >>>>> +		max-speed =3D <1500000>;
> > > >>>>> +	};
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&usb_otg {
> > > >>>>> +	dr_mode =3D "host";
> > > >>>>> +	status =3D "okay";
> > > >>>>> +};
> > > >>>>> +
> > > >>>>> +&usbphy {
> > > >>>>> +	usb0_vbus-supply =3D <&reg_drivevbus>;
> > > >>>>> +	usb1_vbus-supply =3D <&reg_drivevbus>;
> > > >>>>> +	status =3D "okay";
> > > >>>>> +};
> > > >>>>> =20
> > > >>>>
> > > >>>>
> > > >>>>
> > > >>>>
> > > >>>> =20
> > > >>>
> > > >>>
> > > >>>
> > > >>> =20
> > > >> =20
> > > >=20
> > > >=20
> > > >=20
> > > >  =20
> > >  =20
> >=20
> >=20
> >=20
> >=20
> >  =20
>=20
>=20
>=20
>=20
>=20

