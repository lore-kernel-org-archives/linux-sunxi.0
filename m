Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E893428ED
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 09:55:29 +0000 (UTC)
Received: from [127.0.0.1] (85-237-234-20.dynamic.orange.sk [85.237.234.20])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id AB227200CE;
	Tue, 15 Nov 2022 10:55:25 +0100 (CET)
Date: Tue, 15 Nov 2022 10:55:24 +0100
From: Martin Botka <martin.botka@somainline.org>
To: Andre Przywara <andre.przywara@arm.com>,
 Martin Botka <martin.botka1@gmail.com>
CC: ~postmarketos/upstreaming@lists.sr.ht,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jamipkettunen@somainline.org>,
 Paul Bouchara <paul.bouchara@somainline.org>, Jan Trmal <jtrmal@gmail.com>,
 Tom <takuya@takuya.tech>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <maxime@cerno.tech>,
 Conley Lee <conleylee@foxmail.com>, Andrew Lunn <andrew@lunn.ch>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: Add basic support for BIQU CB1
User-Agent: K-9 Mail for Android
In-Reply-To: <20221115005429.57d72f64@slackpad.lan>
References: <20221114214452.1993744-1-martin.botka@somainline.org> <20221114214452.1993744-2-martin.botka@somainline.org> <20221114233102.3b1f96cc@slackpad.lan> <CADQ2G_HXx59YYjNvhcNRonahgT3AcE_2BiU43vDJ3CRUGKwAKA@mail.gmail.com> <20221115005429.57d72f64@slackpad.lan>
Message-ID: <EEA966B5-E8C3-4A65-A6AE-FF2F9410F088@somainline.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On November 15, 2022 1:54:29 AM GMT+01:00, Andre Przywara <andre=2Eprzywar=
a@arm=2Ecom> wrote:
>On Tue, 15 Nov 2022 00:44:46 +0100
>Martin Botka <martin=2Ebotka1@gmail=2Ecom> wrote:
>
>Hi Martin,
>
>> I can totally understand how this can get confusing=2E
>>=20
>> Basically because of the Rpi shortage biqu decided to make an Rpi
>> alternative=2E
>>=20
>> So they made CB1 which is compute module style board=2E
>>=20
>> And they made 3 other boards where CB1 or Rpi CM4 can be plugged in=2E =
The 3
>> boards are:
>>=20
>> Rpi adapter which takes the Compute module style boards and turns them =
into
>> SBC style with basically identical size and etc to Rpi 4=2E
>>=20
>> Then we have Manta M8P and M4P=2E These boards are MCUs for a 3D printe=
r=2E But
>> they were made for Klipper use case which requires a computer or SBC
>> (Usually Rpi4)=2E They combined it into 1 board=2E
>> Where you get the MCU and you can plug in CM4 or CB1
>
>Thanks for the explanations! I was guessing along those shortage lines,
>since the H616 is quite a step down from the RPi4CM, though probably
>still enough for driving a 3D printer=2E
>
>> All these boards are basically taking the pins and routing them to port=
s=2E
>
>Yes, this is what those SoM carrier boards do ;-)
>
>> There is nearly 0 chips for conversion or processing of the pins from C=
B1
>> or CM4 thus i do not see a reason for having parent dtsi and dts for th=
e
>> adapter and Manta boards=2E
>
>And the DT does not need to describe "chips" only, a lot of DT nodes
>are about connectors, and which ports and which exact pins (out of the
>possible pinmuxes) are actually used=2E The SoM itself mostly exposes
>just pins, and the board DT describes how these pins are used (GPIO or
>special function, for instance)=2E
>
>So did you try to split this up? How would that look?
>
>Cheers,
>Andre
>
>> The only exception to conversion are the LEDs on the boards but since b=
oth
>> adapter and manta boards have them this yet again eliminates need for
>> parent style DT=2E
>>=20
>> Best regards,
>> Martin
>>=20
>> On Tue, Nov 15, 2022, 12:32 AM Andre Przywara <andre=2Eprzywara@arm=2Ec=
om>
>> wrote:
>>=20
>> > On Mon, 14 Nov 2022 22:44:49 +0100
>> > Martin Botka <martin=2Ebotka@somainline=2Eorg> wrote:
>> > =20
>> > > CB1 is Compute Module style board that plugs into Rpi board style =
=20
>> > adapter or =20
>> > > Manta 3D printer boards (M4P/M8P)=2E
>> > >
>> > > The board has:
>> > >       H616 SoC
>> > >       1GB of RAM
>> > >       AXP313A PMIC
>> > >
>> > > And the actual boards that CB1 plugs in are just extension to it wi=
th =20
>> > ports and =20
>> > > thus are not split in DT=2E =20
>> >
>> > I don't really understand that sentence=2E There is some precedent fo=
r a
>> > SoM/board split, look at the sun50i-a64-sopine or
>> > sun50i-h5-emlid-neutis-n5 files=2E And if I see this correctly, then
>> > there are *two* boards available for the same CB1 SoM, the PI4B and t=
he
>> > Manta board? Which would a strong case for a SoM =2Edtsi, plus the on=
e
>> > or two board =2Edts files=2E
>> > I am just not sure whether that relation to the Pi4-CM is helpful or
>> > just complicates things=2E=2E=2E
>> >
>> > Cheers,
>> > Andre
>> > =20
>> > >
>> > > Boards have:
>> > >       4x (3x for Manta boards) USB and 1 USB OTG=2E
>> > >       SDcard slot for loading images=2E
>> > >       Ethernet port wired to the internal PHY=2E
>> > >       2x HDMI 2=2E0=2E
>> > >       Power and Status LEDs=2E
>> > >
>> > > Currently working:
>> > >       Booting
>> > >       USB
>> > >       UART
>> > >
>> > > Signed-off-by: Martin Botka <martin=2Ebotka@somainline=2Eorg>
>> > > ---
>> > > Changes in V2:
>> > > Add proper board compatible
>> > > Add regulator prefix for vcc5v
>> > > Drop okay status from PMIC
>> > > Drop standby_param
>> > > Changes in V3:
>> > > Change copyright to me
>> > > regulator_vcc5v to regulator-vcc5v
>> > > Drop ehci0 and ohci0
>> > >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>> > >  =2E=2E=2E/dts/allwinner/sun50i-h616-biqu-cb1=2Edts    | 178 ++++++=
++++++++++++
>> > >  2 files changed, 179 insertions(+)
>> > >  create mode 100644 =20
>> > arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1=2Edts =20
>> > >
>> > > diff --git a/arch/arm64/boot/dts/allwinner/Makefile =20
>> > b/arch/arm64/boot/dts/allwinner/Makefile =20
>> > > index 6a96494a2e0a=2E=2E223f1be73541 100644
>> > > --- a/arch/arm64/boot/dts/allwinner/Makefile
>> > > +++ b/arch/arm64/boot/dts/allwinner/Makefile
>> > > @@ -38,5 +38,6 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64=
=2Edtb
>> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64-model-b=2Edtb
>> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6=2Edtb
>> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6-mini=2Edtb
>> > > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-biqu-cb1=2Edtb
>> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-orangepi-zero2=2Edtb
>> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-x96-mate=2Edtb
>> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1=2Ed=
ts =20
>> > b/arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1=2Edts =20
>> > > new file mode 100644
>> > > index 000000000000=2E=2E86b5aca9b53e
>> > > --- /dev/null
>> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1=2Edts
>> > > @@ -0,0 +1,178 @@
>> > > +// SPDX-License-Identifier: (GPL-2=2E0+ or MIT)
>> > > +/*
>> > > + * Copyright (C) 2022 Martin Botka <martin=2Ebotka@somainline=2Eor=
g>=2E
>> > > + */
>> > > +
>> > > +/dts-v1/;
>> > > +
>> > > +#include "sun50i-h616=2Edtsi"
>> > > +
>> > > +#include <dt-bindings/gpio/gpio=2Eh>
>> > > +#include <dt-bindings/interrupt-controller/arm-gic=2Eh>
>> > > +#include <dt-bindings/leds/common=2Eh>
>> > > +
>> > > +/ {
>> > > +     model =3D "BIQU CB1";
>> > > +     compatible =3D "biqu,cb1", "allwinner,sun50i-h616";
>> > > +
>> > > +     aliases {
>> > > +             serial0 =3D &uart0;
>> > > +     };
>> > > +
>> > > +     chosen {
>> > > +             stdout-path =3D "serial0:115200n8";
>> > > +     };
>> > > +
>> > > +     leds {
>> > > +             compatible =3D "gpio-leds";
>> > > +
>> > > +             led-0 {
>> > > +                     function =3D LED_FUNCTION_POWER;
>> > > +                     color =3D <LED_COLOR_ID_RED>;
>> > > +                     gpios =3D <&pio 2 12 GPIO_ACTIVE_HIGH>; /* PC=
12 */
>> > > +                     default-state =3D "on";
>> > > +             };
>> > > +
>> > > +             led-1 {
>> > > +                     function =3D LED_FUNCTION_STATUS;
>> > > +                     color =3D <LED_COLOR_ID_GREEN>;
>> > > +                     gpios =3D <&pio 2 13 GPIO_ACTIVE_HIGH>; /* PC=
13 */
>> > > +             };
>> > > +     };
>> > > +
>> > > +     reg_vcc5v: regulator-vcc5v {
>> > > +             /* board wide 5V supply directly from the USB-C socke=
t */
>> > > +             compatible =3D "regulator-fixed";
>> > > +             regulator-name =3D "vcc-5v";
>> > > +             regulator-min-microvolt =3D <5000000>;
>> > > +             regulator-max-microvolt =3D <5000000>;
>> > > +             regulator-always-on;
>> > > +     };
>> > > +
>> > > +     reg_usb1_vbus: regulator-usb1-vbus {
>> > > +             compatible =3D "regulator-fixed";
>> > > +             regulator-name =3D "usb1-vbus";
>> > > +             regulator-min-microvolt =3D <5000000>;
>> > > +             regulator-max-microvolt =3D <5000000>;
>> > > +             vin-supply =3D <&reg_vcc5v>;
>> > > +             enable-active-high;
>> > > +             gpio =3D <&pio 2 16 GPIO_ACTIVE_HIGH>; /* PC16 */
>> > > +     };
>> > > +};
>> > > +
>> > > +&ehci1 {
>> > > +     status =3D "okay";
>> > > +};
>> > > +
>> > > +&ehci2 {
>> > > +     status =3D "okay";
>> > > +};
>> > > +
>> > > +&ehci3 {
>> > > +     status =3D "okay";
>> > > +};
>> > > +
>> > > +&mmc0 {
>> > > +     vmmc-supply =3D <&reg_dldo1>;
>> > > +     cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
>> > > +     no-1-8-v;
>> > > +     bus-width =3D <4>;
>> > > +     status =3D "disabled";
>> > > +};
>> > > +
>> > > +&ohci1 {
>> > > +     status =3D "okay";
>> > > +};
>> > > +
>> > > +&ohci2 {
>> > > +     status =3D "okay";
>> > > +};
>> > > +
>> > > +&ohci3 {
>> > > +     status =3D "okay";
>> > > +};
>> > > +
>> > > +&r_i2c {
>> > > +     status =3D "okay";
>> > > +
>> > > +     axp1530: pmic@36 {
>> > > +             compatible =3D "x-powers,axp1530";
>> > > +             reg =3D <0x36>;
>> > > +             wakeup-source;
>> > > +
>> > > +             regulators{
>> > > +                     reg_dcdc1: dcdc1 {
>> > > +                             regulator-name =3D "axp1530-dcdc1";
>> > > +                             regulator-min-microvolt =3D <500000>;
>> > > +                             regulator-max-microvolt =3D <3400000>=
;
>> > > +                             regulator-step-delay-us =3D <25>;
>> > > +                             regulator-final-delay-us =3D <50>;
>> > > +                             regulator-always-on;
>> > > +                     };
>> > > +
>> > > +                     reg_dcdc2: dcdc2 {
>> > > +                             regulator-name =3D "axp1530-dcdc2";
>> > > +                             regulator-min-microvolt =3D <500000>;
>> > > +                             regulator-max-microvolt =3D <1540000>=
;
>> > > +                             regulator-step-delay-us =3D <25>;
>> > > +                             regulator-final-delay-us =3D <50>;
>> > > +                             regulator-ramp-delay =3D <200>;
>> > > +                             regulator-always-on;
>> > > +                     };
>> > > +
>> > > +                     reg_dcdc3: dcdc3 {
>> > > +                             regulator-name =3D "axp1530-dcdc3";
>> > > +                             regulator-min-microvolt =3D <500000>;
>> > > +                             regulator-max-microvolt =3D <1840000>=
;
>> > > +                             regulator-step-delay-us =3D <25>;
>> > > +                             regulator-final-delay-us =3D <50>;
>> > > +                             regulator-always-on;
>> > > +                     };
>> > > +
>> > > +                     reg_aldo1: ldo1 {
>> > > +                             regulator-name =3D "axp1530-aldo1";
>> > > +                             regulator-min-microvolt =3D <1800000>=
;
>> > > +                             regulator-max-microvolt =3D <1800000>=
;
>> > > +                             regulator-step-delay-us =3D <25>;
>> > > +                             regulator-final-delay-us =3D <50>;
>> > > +                             regulator-always-on;
>> > > +                     };
>> > > +
>> > > +                     reg_dldo1: ldo2 {
>> > > +                             regulator-name =3D "axp1530-dldo1";
>> > > +                             regulator-min-microvolt =3D <3300000>=
;
>> > > +                             regulator-max-microvolt =3D <3300000>=
;
>> > > +                             regulator-step-delay-us =3D <25>;
>> > > +                             regulator-final-delay-us =3D <50>;
>> > > +                             regulator-always-on;
>> > > +                     };
>> > > +             };
>> > > +     };
>> > > +};
>> > > +
>> > > +&uart0 {
>> > > +     pinctrl-names =3D "default";
>> > > +     pinctrl-0 =3D <&uart0_ph_pins>;
>> > > +     status =3D "okay";
>> > > +};
>> > > +
>> > > +&usbotg {
>> > > +     /*
>> > > +      * PHY0 pins are connected to a USB-C socket, but a role swit=
ch
>> > > +      * is not implemented: both CC pins are pulled to GND=2E
>> > > +      * The VBUS pins power the device, so a fixed peripheral mode
>> > > +      * is the best choice=2E
>> > > +      * The board can be powered via GPIOs, in this case port0 *ca=
n*
>> > > +      * act as a host (with a cable/adapter ignoring CC), as VBUS =
is
>> > > +      * then provided by the GPIOs=2E Any user of this setup would
>> > > +      * need to adjust the DT accordingly: dr_mode set to "host",
>> > > +      * enabling OHCI0 and EHCI0=2E
>> > > +      */
>> > > +     dr_mode =3D "peripheral";
>> > > +     status =3D "okay";
>> > > +};
>> > > +
>> > > +&usbphy {
>> > > +     usb1_vbus-supply =3D <&reg_usb1_vbus>;
>> > > +     status =3D "okay";
>> > > +}; =20
>> >
>> > =20
>

Dear Andre,

I have read the schematic of M8P again to recheck a few things=2E The spli=
t of DTS may not be needed after all=2E

The 4 USB of H616 are used on both boards=2E
Where this changes is with Rpi CM4 and the usbotg switch is used alongside=
 rpiboot switch to make eMMC of CM4 as host media so data can be loaded ont=
o it=2E

I will adjust the DT in next revision accordingly=2E

Regards,
Martin
