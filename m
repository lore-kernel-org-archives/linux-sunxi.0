Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319DE8498
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 21:42:55 +0000 (UTC)
Received: from [127.0.0.1] (bband-dyn193.178-41-216.t-com.sk [178.41.216.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1F098201D1;
	Tue, 15 Nov 2022 22:42:48 +0100 (CET)
Date: Tue, 15 Nov 2022 22:42:46 +0100
From: Martin Botka <martin.botka@somainline.org>
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
CC: martin.botka1@gmail.com, ~postmarketos/upstreaming@lists.sr.ht,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jamipkettunen@somainline.org>,
 Paul Bouchara <paul.bouchara@somainline.org>, Jan Trmal <jtrmal@gmail.com>,
 Tom <takuya@takuya.tech>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <maxime@cerno.tech>, Andre Przywara <andre.przywara@arm.com>,
 Conley Lee <conleylee@foxmail.com>, Andrew Lunn <andrew@lunn.ch>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: Add basic support for BIQU CB1
User-Agent: K-9 Mail for Android
In-Reply-To: <8140265.T7Z3S40VBb@jernej-laptop>
References: <20221114214452.1993744-1-martin.botka@somainline.org> <4534857.CvnuH1ECHv@jernej-laptop> <AZ0DLR.RINPITJM904E2@somainline.org> <8140265.T7Z3S40VBb@jernej-laptop>
Message-ID: <E2EB0F6F-8DA0-46AF-9344-CB49F3E97458@somainline.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On November 15, 2022 10:34:49 PM GMT+01:00, "Jernej =C5=A0krabec" <jernej=
=2Eskrabec@gmail=2Ecom> wrote:
>Dne ponedeljek, 14=2E november 2022 ob 23:54:46 CET je Martin Botka napis=
al(a):
>> On Mon, Nov 14 2022 at 11:30:17 PM +01:00:00, Jernej =C5=A0krabec
>>=20
>> <jernej=2Eskrabec@gmail=2Ecom> wrote:
>> > Hi Martin,
>> >=20
>> > I was just writing new e-mail as response to v2=2E You should wait at
>> > least a
>> > day or two, usually more, before sending new version=2E Others will
>> > likely have
>> > some more comments=2E And there is also no rush=2E Until PMIC series =
is
>> > merged,
>> > this will not go anywhere=2E Since there is only this week until cut
>> > off date for
>> > DT updates for kernel 6=2E2, it's most likely that this will land in
>> > 6=2E3=2E And
>> > that gives as a few weeks (month) more=2E
>>=20
>> Yep=2E Was hoping for 5=2E2 thus the frequent updates=2E Will take it s=
low
>> then since 5=2E3 :)
>
>You're way too late for 5=2Ex series :) Anyway, 6=2E2 would be possible i=
f you=20
>would have almost flawless patch with no additional dependencies, but tha=
t is=20
>not the case here=2E I'll send DT pull requests for 6=2E2 at the end of t=
his week=2E
>
>Best regards,
>Jernej

Hehe yea :)
Very understandable=2E

Cheers,
Martin
>
>>=20
>> > See comments below=2E
>> >=20
>> > Dne ponedeljek, 14=2E november 2022 ob 22:44:49 CET je Martin Botka
>> >=20
>> > napisal(a):
>> >>  CB1 is Compute Module style board that plugs into Rpi board style
>> >>=20
>> >> adapter or
>> >>=20
>> >>  Manta 3D printer boards (M4P/M8P)=2E
>> >> =20
>> >>  The board has:
>> >>  	H616 SoC
>> >>  	1GB of RAM
>> >>  	AXP313A PMIC
>> >> =20
>> >>  And the actual boards that CB1 plugs in are just extension to it
>> >>=20
>> >> with ports
>> >>=20
>> >>  and thus are not split in DT=2E
>> >> =20
>> >>  Boards have:
>> >>  	4x (3x for Manta boards) USB and 1 USB OTG=2E
>> >>  	SDcard slot for loading images=2E
>> >>  	Ethernet port wired to the internal PHY=2E
>> >>  	2x HDMI 2=2E0=2E
>> >=20
>> > H616 has only one HDMI output=2E Unless there is some additional chip
>> > for some
>> > conversion, only one HDMI port can work=2E
>>=20
>> Yes correct=2E But the Rpi adapter and Manta boards also support
>> Rpi Compute Module 4 which has 2 HDMI outputs=2E
>> The chip itself ofc doesnt support this on CB1=2E Same goes for DSI/CSI
>> ports
>> on the boards and the 4x USB on Rpi adapter=2E
>>=20
>> It is indeed a bit of a mess=2E
>>=20
>> >>  	Power and Status LEDs=2E
>> >> =20
>> >>  Currently working:
>> >>  	Booting
>> >>  	USB
>> >>  	UART
>> >> =20
>> >>  Signed-off-by: Martin Botka <martin=2Ebotka@somainline=2Eorg>
>> >>  ---
>> >>  Changes in V2:
>> >>  Add proper board compatible
>> >>  Add regulator prefix for vcc5v
>> >>  Drop okay status from PMIC
>> >>  Drop standby_param
>> >>  Changes in V3:
>> >>  Change copyright to me
>> >>  regulator_vcc5v to regulator-vcc5v
>> >>  Drop ehci0 and ohci0
>> >> =20
>> >>   arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>> >>   =2E=2E=2E/dts/allwinner/sun50i-h616-biqu-cb1=2Edts    | 178
>> >>=20
>> >> ++++++++++++++++++
>> >>=20
>> >>   2 files changed, 179 insertions(+)
>> >>   create mode 100644
>> >>=20
>> >> arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1=2Edts
>> >>=20
>> >>  diff --git a/arch/arm64/boot/dts/allwinner/Makefile
>> >>  b/arch/arm64/boot/dts/allwinner/Makefile index
>> >>=20
>> >> 6a96494a2e0a=2E=2E223f1be73541
>> >>=20
>> >>  100644
>> >>  --- a/arch/arm64/boot/dts/allwinner/Makefile
>> >>  +++ b/arch/arm64/boot/dts/allwinner/Makefile
>> >>  @@ -38,5 +38,6 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64=
=2Edtb
>> >> =20
>> >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64-model-b=2Edtb
>> >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6=2Edtb
>> >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6-mini=2Edtb
>> >> =20
>> >>  +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-biqu-cb1=2Edtb
>> >> =20
>> >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-orangepi-zero2=2Edtb
>> >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-x96-mate=2Edtb
>> >> =20
>> >>  diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1=2Ed=
ts
>> >>  b/arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1=2Edts new file
>> >>=20
>> >> mode
>> >>=20
>> >>  100644
>> >>  index 000000000000=2E=2E86b5aca9b53e
>> >>  --- /dev/null
>> >>  +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1=2Edts
>> >>  @@ -0,0 +1,178 @@
>> >>  +// SPDX-License-Identifier: (GPL-2=2E0+ or MIT)
>> >>  +/*
>> >>  + * Copyright (C) 2022 Martin Botka <martin=2Ebotka@somainline=2Eor=
g>=2E
>> >>  + */
>> >>  +
>> >>  +/dts-v1/;
>> >>  +
>> >>  +#include "sun50i-h616=2Edtsi"
>> >>  +
>> >>  +#include <dt-bindings/gpio/gpio=2Eh>
>> >>  +#include <dt-bindings/interrupt-controller/arm-gic=2Eh>
>> >>  +#include <dt-bindings/leds/common=2Eh>
>> >>  +
>> >>  +/ {
>> >>  +	model =3D "BIQU CB1";
>> >>  +	compatible =3D "biqu,cb1", "allwinner,sun50i-h616";
>> >>  +
>> >>  +	aliases {
>> >>  +		serial0 =3D &uart0;
>> >>  +	};
>> >>  +
>> >>  +	chosen {
>> >>  +		stdout-path =3D "serial0:115200n8";
>> >>  +	};
>> >>  +
>> >>  +	leds {
>> >>  +		compatible =3D "gpio-leds";
>> >>  +
>> >>  +		led-0 {
>> >>  +			function =3D LED_FUNCTION_POWER;
>> >>  +			color =3D <LED_COLOR_ID_RED>;
>> >>  +			gpios =3D <&pio 2 12 GPIO_ACTIVE_HIGH>; /*
>> >=20
>> > PC12 */
>> >=20
>> >>  +			default-state =3D "on";
>> >>  +		};
>> >>  +
>> >>  +		led-1 {
>> >>  +			function =3D LED_FUNCTION_STATUS;
>> >>  +			color =3D <LED_COLOR_ID_GREEN>;
>> >>  +			gpios =3D <&pio 2 13 GPIO_ACTIVE_HIGH>; /*
>> >=20
>> > PC13 */
>> >=20
>> >>  +		};
>> >>  +	};
>> >>  +
>> >>  +	reg_vcc5v: regulator-vcc5v {
>> >>  +		/* board wide 5V supply directly from the USB-C socket
>> >=20
>> > */
>> >=20
>> >>  +		compatible =3D "regulator-fixed";
>> >>  +		regulator-name =3D "vcc-5v";
>> >>  +		regulator-min-microvolt =3D <5000000>;
>> >>  +		regulator-max-microvolt =3D <5000000>;
>> >>  +		regulator-always-on;
>> >>  +	};
>> >>  +
>> >>  +	reg_usb1_vbus: regulator-usb1-vbus {
>> >>  +		compatible =3D "regulator-fixed";
>> >>  +		regulator-name =3D "usb1-vbus";
>> >>  +		regulator-min-microvolt =3D <5000000>;
>> >>  +		regulator-max-microvolt =3D <5000000>;
>> >>  +		vin-supply =3D <&reg_vcc5v>;
>> >>  +		enable-active-high;
>> >>  +		gpio =3D <&pio 2 16 GPIO_ACTIVE_HIGH>; /* PC16 */
>> >>  +	};
>> >>  +};
>> >>  +
>> >>  +&ehci1 {
>> >>  +	status =3D "okay";
>> >>  +};
>> >>  +
>> >>  +&ehci2 {
>> >>  +	status =3D "okay";
>> >>  +};
>> >>  +
>> >>  +&ehci3 {
>> >>  +	status =3D "okay";
>> >>  +};
>> >>  +
>> >>  +&mmc0 {
>> >>  +	vmmc-supply =3D <&reg_dldo1>;
>> >>  +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
>> >>  +	no-1-8-v;
>> >=20
>> > Above property is not needed=2E If you don't provide vqmmc-supply wit=
h
>> > 1=2E8 V
>> > regulator, it won't be used=2E
>> >=20
>> >>  +	bus-width =3D <4>;
>> >>  +	status =3D "disabled";
>> >=20
>> > Why is set to disabled? If it's not a typo, remove whole node=2E It
>> > could be
>> > added later when it works=2E
>>=20
>> Would not removing it also make PMIC node useless as the regulators
>> wont be used and thus
>> should be technically removed ?
>>=20
>> >>  +};
>> >>  +
>> >>  +&ohci1 {
>> >>  +	status =3D "okay";
>> >>  +};
>> >>  +
>> >>  +&ohci2 {
>> >>  +	status =3D "okay";
>> >>  +};
>> >>  +
>> >>  +&ohci3 {
>> >>  +	status =3D "okay";
>> >>  +};
>> >>  +
>> >>  +&r_i2c {
>> >>  +	status =3D "okay";
>> >>  +
>> >>  +	axp1530: pmic@36 {
>> >>  +		compatible =3D "x-powers,axp1530";
>> >=20
>> > I just checked datasheet and it really seems that it supports only
>> > I2C=2E
>> > Anyway, rather than using axp1530 compatible, introduce axp313a
>> > compatible
>> > instead=2E
>>=20
>> Will do in V2 for drivers later=2E
>>=20
>> >>  +		reg =3D <0x36>;
>> >>  +		wakeup-source;
>> >>  +
>> >>  +		regulators{
>> >>  +			reg_dcdc1: dcdc1 {
>> >>  +				regulator-name =3D "axp1530-
>dcdc1";
>> >>  +				regulator-min-microvolt =3D
>> >=20
>> > <500000>;
>> >=20
>> >>  +				regulator-max-microvolt =3D
>> >=20
>> > <3400000>;
>> >=20
>> > This one is most likely used by CPU=2E If so, you should set
>> > appropriate range
>> > according to CPU needs, which are 810 - 1100 mV=2E
>> >=20
>> >>  +				regulator-step-delay-us =3D <25>;
>> >>  +				regulator-final-delay-us =3D <50>;
>> >>  +				regulator-always-on;
>> >>  +			};
>> >>  +
>> >>  +			reg_dcdc2: dcdc2 {
>> >>  +				regulator-name =3D "axp1530-
>dcdc2";
>> >>  +				regulator-min-microvolt =3D
>> >=20
>> > <500000>;
>> >=20
>> >>  +				regulator-max-microvolt =3D
>> >=20
>> > <1540000>;
>> >=20
>> > This one is most likely used by GPU=2E Its range must also be adjuste=
d
>> > to GPU
>> > needs=2E
>> >=20
>> >>  +				regulator-step-delay-us =3D <25>;
>> >>  +				regulator-final-delay-us =3D <50>;
>> >>  +				regulator-ramp-delay =3D <200>;
>> >>  +				regulator-always-on;
>> >>  +			};
>> >>  +
>> >>  +			reg_dcdc3: dcdc3 {
>> >>  +				regulator-name =3D "axp1530-
>dcdc3";
>> >>  +				regulator-min-microvolt =3D
>> >=20
>> > <500000>;
>> >=20
>> >>  +				regulator-max-microvolt =3D
>> >=20
>> > <1840000>;
>> >=20
>> > This one looks like it supplies DRAM=2E You should set both min and m=
ax
>> > to
>> > actual DRAM needs=2E
>> >=20
>> >>  +				regulator-step-delay-us =3D <25>;
>> >>  +				regulator-final-delay-us =3D <50>;
>> >>  +				regulator-always-on;
>> >>  +			};
>> >>  +
>> >>  +			reg_aldo1: ldo1 {
>> >=20
>> > ldo1 -> aldo1
>> >=20
>> >>  +				regulator-name =3D "axp1530-
>aldo1";
>> >>  +				regulator-min-microvolt =3D
>> >=20
>> > <1800000>;
>> >=20
>> >>  +				regulator-max-microvolt =3D
>> >=20
>> > <1800000>;
>> >=20
>> >>  +				regulator-step-delay-us =3D <25>;
>> >>  +				regulator-final-delay-us =3D <50>;
>> >>  +				regulator-always-on;
>> >>  +			};
>> >>  +
>> >>  +			reg_dldo1: ldo2 {
>> >=20
>> > ldo2 -> dldo1
>> >=20
>> > Another issue I see is that you marked all regulators with
>> > regulator-always-
>> > on; While this works, I don't think this faithfully represent HW=2E F=
or
>> > example,
>> > GPU regulator will be enabled by GPU driver when needed, so it
>> > shouldn't be
>> > marked with always on=2E
>> >=20
>> > There is also RTCLDO, but without schematic it's impossible to say if
>> > it is
>> > used or not=2E
>> >=20
>> > There are at least a few clues in AXP313A datasheet about which
>> > regulator is
>> > used for what=2E See chapter 7=2E5 in
>> > https://github=2Ecom/bigtreetech/CB1-Kernel/
>> > blob/kernel-5=2E16/docs/AXP313A%20datasheet%20V0=2E1%20-
>> > %2020201105_draft%20version=2Epdf
>>=20
>> As for regulators themselves=2E I have kept them as what downstream
>> kernel specifies=2E
>> But until I have schematic in hand and can confirm that they actually
>> used the correct regulators in
>> the correct place i will stick to stock values=2E If they in the end
>> decide to not supply schematic or etc
>> to the public i can test with adjusted values=2E
>>=20
>> > Best regards,
>> > Jernej
>> >=20
>> >>  +				regulator-name =3D "axp1530-
>dldo1";
>> >>  +				regulator-min-microvolt =3D
>> >=20
>> > <3300000>;
>> >=20
>> >>  +				regulator-max-microvolt =3D
>> >=20
>> > <3300000>;
>> >=20
>> >>  +				regulator-step-delay-us =3D <25>;
>> >>  +				regulator-final-delay-us =3D <50>;
>> >>  +				regulator-always-on;
>> >>  +			};
>> >>  +		};
>> >>  +	};
>> >>  +};
>> >>  +
>> >>  +&uart0 {
>> >>  +	pinctrl-names =3D "default";
>> >>  +	pinctrl-0 =3D <&uart0_ph_pins>;
>> >>  +	status =3D "okay";
>> >>  +};
>> >>  +
>> >>  +&usbotg {
>> >>  +	/*
>> >>  +	 * PHY0 pins are connected to a USB-C socket, but a role switch
>> >>  +	 * is not implemented: both CC pins are pulled to GND=2E
>> >>  +	 * The VBUS pins power the device, so a fixed peripheral mode
>> >>  +	 * is the best choice=2E
>> >>  +	 * The board can be powered via GPIOs, in this case port0 *can*
>> >>  +	 * act as a host (with a cable/adapter ignoring CC), as VBUS is
>> >>  +	 * then provided by the GPIOs=2E Any user of this setup would
>> >>  +	 * need to adjust the DT accordingly: dr_mode set to "host",
>> >>  +	 * enabling OHCI0 and EHCI0=2E
>> >>  +	 */
>> >>  +	dr_mode =3D "peripheral";
>> >>  +	status =3D "okay";
>> >>  +};
>> >>  +
>> >>  +&usbphy {
>> >>  +	usb1_vbus-supply =3D <&reg_usb1_vbus>;
>> >>  +	status =3D "okay";
>> >>  +};
>>=20
>> Best Regards,
>> Martin
>
>
>
>
