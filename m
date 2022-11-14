Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D30C1110
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 20:38:18 +0000 (UTC)
Received: from [192.168.2.144] (bband-dyn193.178-41-216.t-com.sk [178.41.216.193])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4EF211F8D5;
	Mon, 14 Nov 2022 21:38:14 +0100 (CET)
Date: Mon, 14 Nov 2022 21:38:08 +0100
From: Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH V2 2/2] arm64: dts: Add basic support for BIQU CB1
To: Jernej =?iso-8859-2?q?=A9krabec?= <jernej.skrabec@gmail.com>
Cc: martin.botka1@gmail.com, ~postmarketos/upstreaming@lists.sr.ht,
	Konrad Dybcio <konrad.dybcio@somainline.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@somainline.org>, Marijn Suijten
	<marijn.suijten@somainline.org>, Jami Kettunen
	<jamipkettunen@somainline.org>, Paul Bouchara <paul.bouchara@somainline.org>,
	Yenda <jtrmal@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai
	<wens@csie.org>, Samuel Holland <samuel@sholland.org>, Andre Przywara
	<andre.przywara@arm.com>, Maxime Ripard <maxime@cerno.tech>, Andrew Lunn
	<andrew@lunn.ch>, Conley Lee <conleylee@foxmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Message-Id: <KNUCLR.WTN1W6BOHHHQ@somainline.org>
In-Reply-To: <3191151.oiGErgHkdL@jernej-laptop>
References: <20221114172018.1876608-1-martin.botka@somainline.org>
	<20221114172018.1876608-2-martin.botka@somainline.org>
	<3191151.oiGErgHkdL@jernej-laptop>
X-Mailer: geary/40.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable



On Mon, Nov 14 2022 at 09:16:29 PM +01:00:00, Jernej =A9krabec=20
<jernej.skrabec@gmail.com> wrote:
> Hi Martin,
>=20
> Dne ponedeljek, 14. november 2022 ob 18:20:16 CET je Martin Botka=20
> napisal(a):
>>  CB1 is Compute Module style board that plugs into Rpi board style=20
>> adapter or
>>  Manta 3D printer boards (M4P/M8P).
>>=20
>>  The board has:
>>  	H616 SoC
>>  	1GB of RAM
>>  	AXP313A PMIC
>>=20
>>  And the actual boards that CB1 plugs in are just extension to it=20
>> with ports
>>  and thus are not split in DT.
>>=20
>>  Boards have:
>>  	4x (3x for Manta boards) USB and 1 USB OTG.
>>  	SDcard slot for loading images.
>>  	Ethernet port wired to the internal PHY.
>>  	2x HDMI 2.0.
>>  	Power and Status LEDs.
>>=20
>>  Currently working:
>>  	Booting
>>  	USB
>>  	UART
>>=20
>>  Signed-off-by: Martin Botka <martin.botka@somainline.org>
>>  ---
>>  Changes in V2:
>>  Add proper board compatible
>>  Add regulator prefix for vcc5v
>>  Drop okay status from PMIC
>>  Drop standby_param
>>   arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>>   .../dts/allwinner/sun50i-h616-biqu-cb1.dts    | 186=20
>> ++++++++++++++++++
>>   2 files changed, 187 insertions(+)
>>   create mode 100644=20
>> arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1.dts
>>=20
>>  diff --git a/arch/arm64/boot/dts/allwinner/Makefile
>>  b/arch/arm64/boot/dts/allwinner/Makefile index=20
>> 6a96494a2e0a..223f1be73541
>>  100644
>>  --- a/arch/arm64/boot/dts/allwinner/Makefile
>>  +++ b/arch/arm64/boot/dts/allwinner/Makefile
>>  @@ -38,5 +38,6 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
>>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64-model-b.dtb
>>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6.dtb
>>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6-mini.dtb
>>  +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-biqu-cb1.dtb
>>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-orangepi-zero2.dtb
>>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-x96-mate.dtb
>>  diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1.dts
>>  b/arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1.dts new file=20
>> mode
>>  100644
>>  index 000000000000..297536d7629a
>>  --- /dev/null
>>  +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1.dts
>>  @@ -0,0 +1,186 @@
>>  +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
>>  +/*
>>  + * Copyright (C) 2022 Arm Ltd.
>=20
> I suppose Arm Ltd. has nothing to do with this board? Put yours=20
> copyrights
> there.
Correct. Was a left over from Opi Zero 2 with just changed year. Will=20
correct in V3 with the rest of the changes
>=20
>>  + */
>>  +
>>  +/dts-v1/;
>>  +
>>  +#include "sun50i-h616.dtsi"
>>  +
>>  +#include <dt-bindings/gpio/gpio.h>
>>  +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>  +#include <dt-bindings/leds/common.h>
>>  +
>>  +/ {
>>  +	model =3D "BIQU CB1";
>>  +	compatible =3D "biqu,cb1", "allwinner,sun50i-h616";
>>  +
>>  +	aliases {
>>  +		serial0 =3D &uart0;
>>  +	};
>>  +
>>  +	chosen {
>>  +		stdout-path =3D "serial0:115200n8";
>>  +	};
>>  +
>>  +	leds {
>>  +		compatible =3D "gpio-leds";
>>  +
>>  +		led-0 {
>>  +			function =3D LED_FUNCTION_POWER;
>>  +			color =3D <LED_COLOR_ID_RED>;
>>  +			gpios =3D <&pio 2 12 GPIO_ACTIVE_HIGH>; /*
> PC12 */
>>  +			default-state =3D "on";
>>  +		};
>>  +
>>  +		led-1 {
>>  +			function =3D LED_FUNCTION_STATUS;
>>  +			color =3D <LED_COLOR_ID_GREEN>;
>>  +			gpios =3D <&pio 2 13 GPIO_ACTIVE_HIGH>; /*
> PC13 */
>>  +		};
>>  +	};
>>  +
>>  +	reg_vcc5v: regulator_vcc5v {
>>  +		/* board wide 5V supply directly from the USB-C socket
> */
>>  +		compatible =3D "regulator-fixed";
>>  +		regulator-name =3D "vcc-5v";
>>  +		regulator-min-microvolt =3D <5000000>;
>>  +		regulator-max-microvolt =3D <5000000>;
>>  +		regulator-always-on;
>>  +	};
>>  +
>>  +	reg_usb1_vbus: regulator-usb1-vbus {
>>  +		compatible =3D "regulator-fixed";
>>  +		regulator-name =3D "usb1-vbus";
>>  +		regulator-min-microvolt =3D <5000000>;
>>  +		regulator-max-microvolt =3D <5000000>;
>>  +		vin-supply =3D <&reg_vcc5v>;
>>  +		enable-active-high;
>>  +		gpio =3D <&pio 2 16 GPIO_ACTIVE_HIGH>; /* PC16 */
>>  +	};
>>  +};
>>  +
>>  +&ehci0 {
>>  +	status =3D "okay";
>>  +};
>>  +
>>  +&ehci1 {
>>  +	status =3D "okay";
>>  +};
>>  +
>>  +&ehci2 {
>>  +	status =3D "okay";
>>  +};
>>  +
>>  +&ehci3 {
>>  +	status =3D "okay";
>>  +};
>>  +
>>  +&mmc0 {
>>  +	vmmc-supply =3D <&reg_dldo1>;
>>  +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
>>  +	no-1-8-v;
>>  +	bus-width =3D <4>;
>>  +	status =3D "disabled";
>>  +};
>>  +
>>  +&ohci0 {
>>  +	status =3D "okay";
>>  +};
>>  +
>>  +&ohci1 {
>>  +	status =3D "okay";
>>  +};
>>  +
>>  +&ohci2 {
>>  +	status =3D "okay";
>>  +};
>>  +
>>  +&ohci3 {
>>  +	status =3D "okay";
>>  +};
>>  +
>>  +&r_i2c {
>>  +	status =3D "okay";
>>  +
>>  +	axp1530: pmic@36 {
>>  +		compatible =3D "x-powers,axp1530";
>=20
> I see that you send driver for this PMIC separately. Next time please=20
> mention
> that this series depends on another, otherwise checks will fail. Ping=20
> us here
> once PMIC driver is merged to unblock this.
>=20
> Anyway, RSB is prefered. Can you switch to it?
RSB does initialize but as soon as I try to give it the PMIC via RSB it=20
doesnt really wanna work so thats a no sadly.
>=20
>>  +		reg =3D <0x36>;
>>  +		wakeup-source;
>>  +
>>  +		regulators{
>>  +			reg_dcdc1: dcdc1 {
>>  +				regulator-name =3D "axp1530-dcdc1";
>>  +				regulator-min-microvolt =3D
> <500000>;
>>  +				regulator-max-microvolt =3D
> <3400000>;
>>  +				regulator-step-delay-us =3D <25>;
>>  +				regulator-final-delay-us =3D <50>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			reg_dcdc2: dcdc2 {
>>  +				regulator-name =3D "axp1530-dcdc2";
>>  +				regulator-min-microvolt =3D
> <500000>;
>>  +				regulator-max-microvolt =3D
> <1540000>;
>>  +				regulator-step-delay-us =3D <25>;
>>  +				regulator-final-delay-us =3D <50>;
>>  +				regulator-ramp-delay =3D <200>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			reg_dcdc3: dcdc3 {
>>  +				regulator-name =3D "axp1530-dcdc3";
>>  +				regulator-min-microvolt =3D
> <500000>;
>>  +				regulator-max-microvolt =3D
> <1840000>;
>>  +				regulator-step-delay-us =3D <25>;
>>  +				regulator-final-delay-us =3D <50>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			reg_aldo1: ldo1 {
>>  +				regulator-name =3D "axp1530-aldo1";
>>  +				regulator-min-microvolt =3D
> <1800000>;
>>  +				regulator-max-microvolt =3D
> <1800000>;
>>  +				regulator-step-delay-us =3D <25>;
>>  +				regulator-final-delay-us =3D <50>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			reg_dldo1: ldo2 {
>>  +				regulator-name =3D "axp1530-dldo1";
>>  +				regulator-min-microvolt =3D
> <3300000>;
>>  +				regulator-max-microvolt =3D
> <3300000>;
>>  +				regulator-step-delay-us =3D <25>;
>>  +				regulator-final-delay-us =3D <50>;
>>  +				regulator-always-on;
>>  +			};
>>  +		};
>>  +	};
>>  +};
>>  +
>>  +&uart0 {
>>  +	pinctrl-names =3D "default";
>>  +	pinctrl-0 =3D <&uart0_ph_pins>;
>>  +	status =3D "okay";
>>  +};
>>  +
>>  +&usbotg {
>>  +	/*
>>  +	 * PHY0 pins are connected to a USB-C socket, but a role switch
>>  +	 * is not implemented: both CC pins are pulled to GND.
>>  +	 * The VBUS pins power the device, so a fixed peripheral mode
>>  +	 * is the best choice.
>>  +	 * The board can be powered via GPIOs, in this case port0 *can*
>>  +	 * act as a host (with a cable/adapter ignoring CC), as VBUS is
>>  +	 * then provided by the GPIOs. Any user of this setup would
>>  +	 * need to adjust the DT accordingly: dr_mode set to "host",
>>  +	 * enabling OHCI0 and EHCI0.
>>  +	 */
>=20
> Above text is verbatim copy from OrangePi Zero2 and I'm not sure if=20
> it is
> fully accurate for this board too. Looking at board photo, it surely=20
> looks
> like this board has same USB design as Zero2. But if that's true, you
> shouldn't enable OHCI0 and EHCI0 nodes.
Correct. But M8P has a dip switch that enables or disables usbotg.
As for if it does anything its hard to say.
>=20
> Is there any board schematic publicly available for this board?
This is one of the issues. Im in contact with BIQU and asking for the=20
schematics.
I hope we can get them released ASAP as it would help me as well.
>=20
> Best regards,
> Jernej
>=20
>>  +	dr_mode =3D "peripheral";
>>  +	status =3D "okay";
>>  +};
>>  +
>>  +&usbphy {
>>  +	usb1_vbus-supply =3D <&reg_usb1_vbus>;
>>  +	status =3D "okay";
>>  +};
>=20
>=20
Best Regards,
Martin


