Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A83024F29
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 17:32:55 +0000 (UTC)
Received: from [127.0.0.1] (bband-dyn193.178-41-216.t-com.sk [178.41.216.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 178B9201A8;
	Tue, 15 Nov 2022 18:32:47 +0100 (CET)
Date: Tue, 15 Nov 2022 18:32:45 +0100
From: Martin Botka <martin.botka@somainline.org>
To: Andre Przywara <andre.przywara@arm.com>
CC: Martin Botka <martin.botka1@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht,
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
In-Reply-To: <20221115172501.04065c13@donnerap.cambridge.arm.com>
References: <20221114214452.1993744-1-martin.botka@somainline.org> <20221114214452.1993744-2-martin.botka@somainline.org> <20221114233102.3b1f96cc@slackpad.lan> <CADQ2G_HXx59YYjNvhcNRonahgT3AcE_2BiU43vDJ3CRUGKwAKA@mail.gmail.com> <20221115005429.57d72f64@slackpad.lan> <D69CAA04-56A2-4FFD-A33D-C802084A7150@somainline.org> <20221115103307.5f5b9106@donnerap.cambridge.arm.com> <78EC79B1-1664-48EB-A902-9173FE59C45B@somainline.org> <20221115142714.310049c4@donnerap.cambridge.arm.com> <JCFELR.HONCNORN1D0L@somainline.org> <20221115172501.04065c13@donnerap.cambridge.arm.com>
Message-ID: <23C58328-F93B-4407-8427-FF37DC591255@somainline.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On November 15, 2022 6:25:01 PM GMT+01:00, Andre Przywara <andre=2Eprzywar=
a@arm=2Ecom> wrote:
>On Tue, 15 Nov 2022 18:02:43 +0100
>Martin Botka <martin=2Ebotka@somainline=2Eorg> wrote:
>
>> On Tue, Nov 15 2022 at 02:27:14 PM +00:00:00, Andre Przywara=20
>> <andre=2Eprzywara@arm=2Ecom> wrote:
>> > On Tue, 15 Nov 2022 12:38:59 +0100
>> > Martin Botka <martin=2Ebotka@somainline=2Eorg> wrote:
>> >=20
>> > Hi Martin,
>> >  =20
>> >>  On November 15, 2022 11:33:07 AM GMT+01:00, Andre Przywara=20
>> >> <andre=2Eprzywara@arm=2Ecom> wrote: =20
>> >>  >On Tue, 15 Nov 2022 09:24:04 +0100
>> >>  >Martin Botka <martin=2Ebotka@somainline=2Eorg> wrote:
>> >>  >
>> >>  >Hi,
>> >>  > =20
>> >>  >> On November 15, 2022 1:54:29 AM GMT+01:00, Andre Przywara  =20
>> >> <andre=2Eprzywara@arm=2Ecom> wrote: =20
>> >>  >> >On Tue, 15 Nov 2022 00:44:46 +0100
>> >>  >> >Martin Botka <martin=2Ebotka1@gmail=2Ecom> wrote:
>> >>  >> >
>> >>  >> >Hi Martin,
>> >>  >> > =20
>> >>  >> >> I can totally understand how this can get confusing=2E
>> >>  >> >>
>> >>  >> >> Basically because of the Rpi shortage biqu decided to make an=
  =20
>> >> Rpi =20
>> >>  >> >> alternative=2E
>> >>  >> >>
>> >>  >> >> So they made CB1 which is compute module style board=2E
>> >>  >> >>
>> >>  >> >> And they made 3 other boards where CB1 or Rpi CM4 can be  =20
>> >> plugged in=2E The 3 =20
>> >>  >> >> boards are:
>> >>  >> >>
>> >>  >> >> Rpi adapter which takes the Compute module style boards and  =
=20
>> >> turns them into =20
>> >>  >> >> SBC style with basically identical size and etc to Rpi 4=2E
>> >>  >> >>
>> >>  >> >> Then we have Manta M8P and M4P=2E These boards are MCUs for a=
  =20
>> >> 3D printer=2E But =20
>> >>  >> >> they were made for Klipper use case which requires a computer=
  =20
>> >> or SBC =20
>> >>  >> >> (Usually Rpi4)=2E They combined it into 1 board=2E
>> >>  >> >> Where you get the MCU and you can plug in CM4 or CB1 =20
>> >>  >> >
>> >>  >> >Thanks for the explanations! I was guessing along those  =20
>> >> shortage lines, =20
>> >>  >> >since the H616 is quite a step down from the RPi4CM, though  =
=20
>> >> probably =20
>> >>  >> >still enough for driving a 3D printer=2E =20
>> >>  >> Mostly yes =20
>> >>  >> > =20
>> >>  >> >> All these boards are basically taking the pins and routing  =
=20
>> >> them to ports=2E =20
>> >>  >> >
>> >>  >> >Yes, this is what those SoM carrier boards do ;-) =20
>> >>  >> :) =20
>> >>  >> > =20
>> >>  >> >> There is nearly 0 chips for conversion or processing of the  =
=20
>> >> pins from CB1 =20
>> >>  >> >> or CM4 thus i do not see a reason for having parent dtsi and =
 =20
>> >> dts for the =20
>> >>  >> >> adapter and Manta boards=2E =20
>> >>  >> >
>> >>  >> >And the DT does not need to describe "chips" only, a lot of DT =
 =20
>> >> nodes =20
>> >>  >> >are about connectors, and which ports and which exact pins (out=
  =20
>> >> of the =20
>> >>  >> >possible pinmuxes) are actually used=2E The SoM itself mostly  =
=20
>> >> exposes =20
>> >>  >> >just pins, and the board DT describes how these pins are used  =
=20
>> >> (GPIO or =20
>> >>  >> >special function, for instance)=2E
>> >>  >> >
>> >>  >> >So did you try to split this up? How would that look? =20
>> >>  >>
>> >>  >> The main difference between adapter and Manta boards is that  =
=20
>> >> adapter has 4x USB=2E =20
>> >>  >
>> >>  >So those are two double-type-A sockets? This is not really what  =
=20
>> >> the DT =20
>> >>  >below describes? It's perfectly fine to fix USB0 to host mode, we =
 =20
>> >> do this =20
>> >>  >on the Pine64 boards (both A64 and H6), for instance=2E =20
>> >>=20
>> >>  Yes=2E But the third and fourth is also used=2E Third is done in 2=
=2E54=20
>> >> 4p connector (just pins on board) and fourth is connected directly=
=20
>> >> to manta stm32 MCU=2E So all 4 are host=2E =20
>> >=20
>> > Wait, so you are talking about the Manta board now? I see two=20
>> > sockets, the
>> > 2=2E54mm headers and the STM32 there, but the Pi4B is quite different=
 in
>> > that respect: I see four(!) USB type-A sockets (two dual-port stacks)=
=2E
>> > Plus the CM4 connector seems to only have pins for one USB 2=2E0 port
>> > (D-,D+)=2E So is this a hub chip on the underside of the board, close=
=20
>> > to the
>> > USB ports? Can you read the label of that chip?
>> > And where are the other H616 USB pins routed to? Are they (ab-)using=
=20
>> > the
>> > PCIe pins of the CM4 connector? Or are they actually not used at all,=
=20
>> > and
>> > it's all one USB port through a by-4 hub?
>> > If you have a running system, "lsusb -t" should give you a clue which=
=20
>> > host
>> > ports are used and if there is a hub=2E
>> >=20
>> > Cheers,
>> > Andre
>> >  =20
>> >>  >> Manta only has 3 and 1 otg=2E But it has a switch to disable or =
 =20
>> >> enable otg=2E =20
>> >>  >
>> >>  >What does the switch do, exactly? By definition OTG works fine in =
 =20
>> >> both =20
>> >>  >ways=2E And there are pins in the connector to decide the role=2E =
=20
>> >>  The switch is just signal pin for RS2227=2E Its the multiplexer i=
=20
>> >> mentioned=2E It decides if we should have the pins wired to usb type=
 C=20
>> >> port or normally to stm32 MCU=2E Thats all it does=2E =20
>> >>  >
>> >>  >Allwinner actually goes one step further and provides a full HCI  =
=20
>> >> to the =20
>> >>  >same PHY that the MUSB OTG controller is connected to, so you  =20
>> >> don't need =20
>> >>  >to live with the sometimes limited performance of the MUSB host  =
=20
>> >> mode =20
>> >>  >(which we drive without DMA)=2E Not sure if that is the case or a =
 =20
>> >> problem on =20
>> >>  >the RPi4=2E
>> >>  > =20
>> >>  >> Im not opposed to splitting it up=2E It is probably a good idea=
=2E
>> >>  >> I dont see how to resolve that switch on manta boards tho=2E =20
>> >>  >
>> >>  >If the Manta board is (almost) a superset of the Pi4B, then you ca=
n
>> >>  >include the latter from there=2E Look at sun50i-a64-pine64-lts=2Ed=
ts or
>> >>  >sun50i-h6-pine-h64-model-b=2Edts for examples=2E
>> >>  >
>> >>  >Cheers,
>> >>  >Andre=2E
>> >>  > =20
>> >>  Yep i will split it into SoM boards=2E =20
>> >>  >> >> The only exception to conversion are the LEDs on the boards  =
=20
>> >> but since both =20
>> >>  >> >> adapter and manta boards have them this yet again eliminates =
 =20
>> >> need for =20
>> >>  >> >> parent style DT=2E
>> >>  >> >>
>> >>  >> >> Best regards,
>> >>  >> >> Martin
>> >>  >> >>
>> >>  >> >> On Tue, Nov 15, 2022, 12:32 AM Andre Przywara  =20
>> >> <andre=2Eprzywara@arm=2Ecom> =20
>> >>  >> >> wrote:
>> >>  >> >> =20
>> >>  >> >> > On Mon, 14 Nov 2022 22:44:49 +0100
>> >>  >> >> > Martin Botka <martin=2Ebotka@somainline=2Eorg> wrote:
>> >>  >> >> > =20
>> >>  >> >> > > CB1 is Compute Module style board that plugs into Rpi  =
=20
>> >> board style =20
>> >>  >> >> > adapter or =20
>> >>  >> >> > > Manta 3D printer boards (M4P/M8P)=2E
>> >>  >> >> > >
>> >>  >> >> > > The board has:
>> >>  >> >> > >       H616 SoC
>> >>  >> >> > >       1GB of RAM
>> >>  >> >> > >       AXP313A PMIC
>> >>  >> >> > >
>> >>  >> >> > > And the actual boards that CB1 plugs in are just  =20
>> >> extension to it with =20
>> >>  >> >> > ports and =20
>> >>  >> >> > > thus are not split in DT=2E =20
>> >>  >> >> >
>> >>  >> >> > I don't really understand that sentence=2E There is some  =
=20
>> >> precedent for a =20
>> >>  >> >> > SoM/board split, look at the sun50i-a64-sopine or
>> >>  >> >> > sun50i-h5-emlid-neutis-n5 files=2E And if I see this  =20
>> >> correctly, then =20
>> >>  >> >> > there are *two* boards available for the same CB1 SoM, the =
 =20
>> >> PI4B and the =20
>> >>  >> >> > Manta board? Which would a strong case for a SoM =2Edtsi,  =
=20
>> >> plus the one =20
>> >>  >> >> > or two board =2Edts files=2E
>> >>  >> >> > I am just not sure whether that relation to the Pi4-CM is  =
=20
>> >> helpful or =20
>> >>  >> >> > just complicates things=2E=2E=2E
>> >>  >> >> >
>> >>  >> >> > Cheers,
>> >>  >> >> > Andre
>> >>  >> >> > =20
>> >>  >> >> > >
>> >>  >> >> > > Boards have:
>> >>  >> >> > >       4x (3x for Manta boards) USB and 1 USB OTG=2E
>> >>  >> >> > >       SDcard slot for loading images=2E
>> >>  >> >> > >       Ethernet port wired to the internal PHY=2E
>> >>  >> >> > >       2x HDMI 2=2E0=2E
>> >>  >> >> > >       Power and Status LEDs=2E
>> >>  >> >> > >
>> >>  >> >> > > Currently working:
>> >>  >> >> > >       Booting
>> >>  >> >> > >       USB
>> >>  >> >> > >       UART
>> >>  >> >> > >
>> >>  >> >> > > Signed-off-by: Martin Botka <martin=2Ebotka@somainline=2E=
org>
>> >>  >> >> > > ---
>> >>  >> >> > > Changes in V2:
>> >>  >> >> > > Add proper board compatible
>> >>  >> >> > > Add regulator prefix for vcc5v
>> >>  >> >> > > Drop okay status from PMIC
>> >>  >> >> > > Drop standby_param
>> >>  >> >> > > Changes in V3:
>> >>  >> >> > > Change copyright to me
>> >>  >> >> > > regulator_vcc5v to regulator-vcc5v
>> >>  >> >> > > Drop ehci0 and ohci0
>> >>  >> >> > >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>> >>  >> >> > >  =2E=2E=2E/dts/allwinner/sun50i-h616-biqu-cb1=2Edts    | =
178  =20
>> >> ++++++++++++++++++ =20
>> >>  >> >> > >  2 files changed, 179 insertions(+)
>> >>  >> >> > >  create mode 100644 =20
>> >>  >> >> > arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1=2Edts =
=20
>> >>  >> >> > >
>> >>  >> >> > > diff --git a/arch/arm64/boot/dts/allwinner/Makefile =20
>> >>  >> >> > b/arch/arm64/boot/dts/allwinner/Makefile =20
>> >>  >> >> > > index 6a96494a2e0a=2E=2E223f1be73541 100644
>> >>  >> >> > > --- a/arch/arm64/boot/dts/allwinner/Makefile
>> >>  >> >> > > +++ b/arch/arm64/boot/dts/allwinner/Makefile
>> >>  >> >> > > @@ -38,5 +38,6 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D  =20
>> >> sun50i-h6-pine-h64=2Edtb =20
>> >>  >> >> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D  =20
>> >> sun50i-h6-pine-h64-model-b=2Edtb =20
>> >>  >> >> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6=2Edtb
>> >>  >> >> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6-mini=
=2Edtb
>> >>  >> >> > > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-biqu-cb1=2Edtb
>> >>  >> >> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D  =20
>> >> sun50i-h616-orangepi-zero2=2Edtb =20
>> >>  >> >> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-x96-mate=2Edtb
>> >>  >> >> > > diff --git  =20
>> >> a/arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1=2Edts =20
>> >>  >> >> > b/arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1=2Edts =
=20
>> >>  >> >> > > new file mode 100644
>> >>  >> >> > > index 000000000000=2E=2E86b5aca9b53e
>> >>  >> >> > > --- /dev/null
>> >>  >> >> > > +++  =20
>> >> b/arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1=2Edts =20
>> >>  >> >> > > @@ -0,0 +1,178 @@
>> >>  >> >> > > +// SPDX-License-Identifier: (GPL-2=2E0+ or MIT)
>> >>  >> >> > > +/*
>> >>  >> >> > > + * Copyright (C) 2022 Martin Botka  =20
>> >> <martin=2Ebotka@somainline=2Eorg>=2E =20
>> >>  >> >> > > + */
>> >>  >> >> > > +
>> >>  >> >> > > +/dts-v1/;
>> >>  >> >> > > +
>> >>  >> >> > > +#include "sun50i-h616=2Edtsi"
>> >>  >> >> > > +
>> >>  >> >> > > +#include <dt-bindings/gpio/gpio=2Eh>
>> >>  >> >> > > +#include <dt-bindings/interrupt-controller/arm-gic=2Eh>
>> >>  >> >> > > +#include <dt-bindings/leds/common=2Eh>
>> >>  >> >> > > +
>> >>  >> >> > > +/ {
>> >>  >> >> > > +     model =3D "BIQU CB1";
>> >>  >> >> > > +     compatible =3D "biqu,cb1", "allwinner,sun50i-h616";
>> >>  >> >> > > +
>> >>  >> >> > > +     aliases {
>> >>  >> >> > > +             serial0 =3D &uart0;
>> >>  >> >> > > +     };
>> >>  >> >> > > +
>> >>  >> >> > > +     chosen {
>> >>  >> >> > > +             stdout-path =3D "serial0:115200n8";
>> >>  >> >> > > +     };
>> >>  >> >> > > +
>> >>  >> >> > > +     leds {
>> >>  >> >> > > +             compatible =3D "gpio-leds";
>> >>  >> >> > > +
>> >>  >> >> > > +             led-0 {
>> >>  >> >> > > +                     function =3D LED_FUNCTION_POWER;
>> >>  >> >> > > +                     color =3D <LED_COLOR_ID_RED>;
>> >>  >> >> > > +                     gpios =3D <&pio 2 12  =20
>> >> GPIO_ACTIVE_HIGH>; /* PC12 */ =20
>> >>  >> >> > > +                     default-state =3D "on";
>> >>  >> >> > > +             };
>> >>  >> >> > > +
>> >>  >> >> > > +             led-1 {
>> >>  >> >> > > +                     function =3D LED_FUNCTION_STATUS;
>> >>  >> >> > > +                     color =3D <LED_COLOR_ID_GREEN>;
>> >>  >> >> > > +                     gpios =3D <&pio 2 13  =20
>> >> GPIO_ACTIVE_HIGH>; /* PC13 */ =20
>> >>  >> >> > > +             };
>> >>  >> >> > > +     };
>> >>  >> >> > > +
>> >>  >> >> > > +     reg_vcc5v: regulator-vcc5v {
>> >>  >> >> > > +             /* board wide 5V supply directly from the  =
=20
>> >> USB-C socket */ =20
>> >>  >> >> > > +             compatible =3D "regulator-fixed";
>> >>  >> >> > > +             regulator-name =3D "vcc-5v";
>> >>  >> >> > > +             regulator-min-microvolt =3D <5000000>;
>> >>  >> >> > > +             regulator-max-microvolt =3D <5000000>;
>> >>  >> >> > > +             regulator-always-on;
>> >>  >> >> > > +     };
>> >>  >> >> > > +
>> >>  >> >> > > +     reg_usb1_vbus: regulator-usb1-vbus {
>> >>  >> >> > > +             compatible =3D "regulator-fixed";
>> >>  >> >> > > +             regulator-name =3D "usb1-vbus";
>> >>  >> >> > > +             regulator-min-microvolt =3D <5000000>;
>> >>  >> >> > > +             regulator-max-microvolt =3D <5000000>;
>> >>  >> >> > > +             vin-supply =3D <&reg_vcc5v>;
>> >>  >> >> > > +             enable-active-high;
>> >>  >> >> > > +             gpio =3D <&pio 2 16 GPIO_ACTIVE_HIGH>; /*  =
=20
>> >> PC16 */ =20
>> >>  >> >> > > +     };
>> >>  >> >> > > +};
>> >>  >> >> > > +
>> >>  >> >> > > +&ehci1 {
>> >>  >> >> > > +     status =3D "okay";
>> >>  >> >> > > +};
>> >>  >> >> > > +
>> >>  >> >> > > +&ehci2 {
>> >>  >> >> > > +     status =3D "okay";
>> >>  >> >> > > +};
>> >>  >> >> > > +
>> >>  >> >> > > +&ehci3 {
>> >>  >> >> > > +     status =3D "okay";
>> >>  >> >> > > +};
>> >>  >> >> > > +
>> >>  >> >> > > +&mmc0 {
>> >>  >> >> > > +     vmmc-supply =3D <&reg_dldo1>;
>> >>  >> >> > > +     cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
>> >>  >> >> > > +     no-1-8-v;
>> >>  >> >> > > +     bus-width =3D <4>;
>> >>  >> >> > > +     status =3D "disabled";
>> >>  >> >> > > +};
>> >>  >> >> > > +
>> >>  >> >> > > +&ohci1 {
>> >>  >> >> > > +     status =3D "okay";
>> >>  >> >> > > +};
>> >>  >> >> > > +
>> >>  >> >> > > +&ohci2 {
>> >>  >> >> > > +     status =3D "okay";
>> >>  >> >> > > +};
>> >>  >> >> > > +
>> >>  >> >> > > +&ohci3 {
>> >>  >> >> > > +     status =3D "okay";
>> >>  >> >> > > +};
>> >>  >> >> > > +
>> >>  >> >> > > +&r_i2c {
>> >>  >> >> > > +     status =3D "okay";
>> >>  >> >> > > +
>> >>  >> >> > > +     axp1530: pmic@36 {
>> >>  >> >> > > +             compatible =3D "x-powers,axp1530";
>> >>  >> >> > > +             reg =3D <0x36>;
>> >>  >> >> > > +             wakeup-source;
>> >>  >> >> > > +
>> >>  >> >> > > +             regulators{
>> >>  >> >> > > +                     reg_dcdc1: dcdc1 {
>> >>  >> >> > > +                             regulator-name =3D  =20
>> >> "axp1530-dcdc1"; =20
>> >>  >> >> > > +                             regulator-min-microvolt =3D=
  =20
>> >> <500000>; =20
>> >>  >> >> > > +                             regulator-max-microvolt =3D=
  =20
>> >> <3400000>; =20
>> >>  >> >> > > +                             regulator-step-delay-us =3D=
  =20
>> >> <25>; =20
>> >>  >> >> > > +                             regulator-final-delay-us =
=3D  =20
>> >> <50>; =20
>> >>  >> >> > > +                             regulator-always-on;
>> >>  >> >> > > +                     };
>> >>  >> >> > > +
>> >>  >> >> > > +                     reg_dcdc2: dcdc2 {
>> >>  >> >> > > +                             regulator-name =3D  =20
>> >> "axp1530-dcdc2"; =20
>> >>  >> >> > > +                             regulator-min-microvolt =3D=
  =20
>> >> <500000>; =20
>> >>  >> >> > > +                             regulator-max-microvolt =3D=
  =20
>> >> <1540000>; =20
>> >>  >> >> > > +                             regulator-step-delay-us =3D=
  =20
>> >> <25>; =20
>> >>  >> >> > > +                             regulator-final-delay-us =
=3D  =20
>> >> <50>; =20
>> >>  >> >> > > +                             regulator-ramp-delay =3D  =
=20
>> >> <200>; =20
>> >>  >> >> > > +                             regulator-always-on;
>> >>  >> >> > > +                     };
>> >>  >> >> > > +
>> >>  >> >> > > +                     reg_dcdc3: dcdc3 {
>> >>  >> >> > > +                             regulator-name =3D  =20
>> >> "axp1530-dcdc3"; =20
>> >>  >> >> > > +                             regulator-min-microvolt =3D=
  =20
>> >> <500000>; =20
>> >>  >> >> > > +                             regulator-max-microvolt =3D=
  =20
>> >> <1840000>; =20
>> >>  >> >> > > +                             regulator-step-delay-us =3D=
  =20
>> >> <25>; =20
>> >>  >> >> > > +                             regulator-final-delay-us =
=3D  =20
>> >> <50>; =20
>> >>  >> >> > > +                             regulator-always-on;
>> >>  >> >> > > +                     };
>> >>  >> >> > > +
>> >>  >> >> > > +                     reg_aldo1: ldo1 {
>> >>  >> >> > > +                             regulator-name =3D  =20
>> >> "axp1530-aldo1"; =20
>> >>  >> >> > > +                             regulator-min-microvolt =3D=
  =20
>> >> <1800000>; =20
>> >>  >> >> > > +                             regulator-max-microvolt =3D=
  =20
>> >> <1800000>; =20
>> >>  >> >> > > +                             regulator-step-delay-us =3D=
  =20
>> >> <25>; =20
>> >>  >> >> > > +                             regulator-final-delay-us =
=3D  =20
>> >> <50>; =20
>> >>  >> >> > > +                             regulator-always-on;
>> >>  >> >> > > +                     };
>> >>  >> >> > > +
>> >>  >> >> > > +                     reg_dldo1: ldo2 {
>> >>  >> >> > > +                             regulator-name =3D  =20
>> >> "axp1530-dldo1"; =20
>> >>  >> >> > > +                             regulator-min-microvolt =3D=
  =20
>> >> <3300000>; =20
>> >>  >> >> > > +                             regulator-max-microvolt =3D=
  =20
>> >> <3300000>; =20
>> >>  >> >> > > +                             regulator-step-delay-us =3D=
  =20
>> >> <25>; =20
>> >>  >> >> > > +                             regulator-final-delay-us =
=3D  =20
>> >> <50>; =20
>> >>  >> >> > > +                             regulator-always-on;
>> >>  >> >> > > +                     };
>> >>  >> >> > > +             };
>> >>  >> >> > > +     };
>> >>  >> >> > > +};
>> >>  >> >> > > +
>> >>  >> >> > > +&uart0 {
>> >>  >> >> > > +     pinctrl-names =3D "default";
>> >>  >> >> > > +     pinctrl-0 =3D <&uart0_ph_pins>;
>> >>  >> >> > > +     status =3D "okay";
>> >>  >> >> > > +};
>> >>  >> >> > > +
>> >>  >> >> > > +&usbotg {
>> >>  >> >> > > +     /*
>> >>  >> >> > > +      * PHY0 pins are connected to a USB-C socket, but a=
  =20
>> >> role switch =20
>> >>  >> >> > > +      * is not implemented: both CC pins are pulled to  =
=20
>> >> GND=2E =20
>> >>  >> >> > > +      * The VBUS pins power the device, so a fixed  =20
>> >> peripheral mode =20
>> >>  >> >> > > +      * is the best choice=2E
>> >>  >> >> > > +      * The board can be powered via GPIOs, in this case=
  =20
>> >> port0 *can* =20
>> >>  >> >> > > +      * act as a host (with a cable/adapter ignoring  =
=20
>> >> CC), as VBUS is =20
>> >>  >> >> > > +      * then provided by the GPIOs=2E Any user of this  =
=20
>> >> setup would =20
>> >>  >> >> > > +      * need to adjust the DT accordingly: dr_mode set  =
=20
>> >> to "host", =20
>> >>  >> >> > > +      * enabling OHCI0 and EHCI0=2E
>> >>  >> >> > > +      */
>> >>  >> >> > > +     dr_mode =3D "peripheral";
>> >>  >> >> > > +     status =3D "okay";
>> >>  >> >> > > +};
>> >>  >> >> > > +
>> >>  >> >> > > +&usbphy {
>> >>  >> >> > > +     usb1_vbus-supply =3D <&reg_usb1_vbus>;
>> >>  >> >> > > +     status =3D "okay";
>> >>  >> >> > > +}; =20
>> >>  >> >> >
>> >>  >> >> > =20
>> >>  >> > =20
>> >>  > =20
>> >  =20
>> And yes there should be CM4 and CB1 DT for these boards=2E
>> But since i do not own CM4=2E I will only create CB1 version of this DT=
=2E
>
>That's the interesting part: there is already a DT for the CM4:
>arch/arm/boot/dts/bcm2711-rpi-cm4=2Edtsi
>Theoretically you should be able to include this =2Edtsi instead of your
>cb1=2Edtsi into the board =2Edts, and it should work(TM)=2E Now I don't k=
now if
>this has ever been done before, but I would imagine this to not compile,
>as the references are not the same, and the peripherals being rather
>different anyway=2E
>So let's for a moment pretend we can only plug the CB1 in ;-)
>
>As for the same DT between the Manta and RPi4: let's just start with one=
=2E
>If the other one is indeed identical (thought they look very different to
>me!), we just might not bother with upstreaming the other one=2E
>Should there be differences (which could be an LED wired differently), an=
d
>people care, we can always add a second =2Edts, and include the first one=
=2E
>
>As to which board to upstream: I am a bit torn between the more practical
>RPi4 board and the fact that you actually own the Manta board=2E I guess =
we
>should play it safe, and you upstream what you have and can test=2E
>
>Cheers,
>Andre

They do look different ofc=2E One has a full blown 3D printer board attach=
ed to it :) (which just occupies the 1 USB slot on the hub)

On the rest i fully agree=2E

Cheers,
Martin
