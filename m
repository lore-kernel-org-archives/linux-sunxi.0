Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CCD182C8
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Aug 2023 16:16:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B411B113E;
	Thu,  3 Aug 2023 09:17:09 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 92C573F5A1;
	Thu,  3 Aug 2023 09:16:23 -0700 (PDT)
Date: Thu, 3 Aug 2023 17:16:20 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Martin Botka <martin@biqu3d.com>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@somainline.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Jami Kettunen
 <jamipkettunen@somainline.org>, Paul Bouchara
 <paul.bouchara@somainline.org>, Martin Botka <martin.botka@somainline.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Icenowy Zheng <uwu@icenowy.me>,
 Ludwig Kormann <ludwig.kormann@ict42.de>, Andrew Lunn <andrew@lunn.ch>,
 Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Jagan Teki <jagan@edgeble.ai>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/6] arm64: dts: allwinner: h616: Add BigTreeTech CB1
 SoM & boards support
Message-ID: <20230803171620.0bb28784@donnerap.manchester.arm.com>
In-Reply-To: <4272045580294B4A+21851d6a-9a8f-8141-bc31-8398a03663c9@biqu3d.com>
References: <20230802220309.163804-1-martin@biqu3d.com>
	<85E425AED000D34C+20230802220309.163804-6-martin@biqu3d.com>
	<20230803133746.20cd7b04@donnerap.manchester.arm.com>
	<4272045580294B4A+21851d6a-9a8f-8141-bc31-8398a03663c9@biqu3d.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 3 Aug 2023 17:35:55 +0200
Martin Botka <martin@biqu3d.com> wrote:

Hi Martin,

thanks for the reply and the explanations, very helpful.

> On 8/3/23 2:37=E2=80=AFPM, Andre Przywara wrote:
> > On Thu,  3 Aug 2023 00:02:38 +0200
> > Martin Botka <martin@biqu3d.com> wrote:
> >=20
> > Hi Martin,
> >=20
> > thanks for sending this!
> > There are some whitespace errors in here, some leading tabs in the first
> > section. "git show" should print them in red.
> >  =20
> >> From: Martin Botka <martin.botka@somainline.org>
> >>
> >> CB1 is Compute Module style board that plugs into Rpi board style adap=
ter or
> >> Manta 3D printer boards (M4P/M8P).
> >>
> >> The SoM features:
> >>    - H616 SoC
> >>    - 1GiB of RAM
> >>    - AXP313A PMIC
> >>    - RTL8189FTV WiFi
> >>
> >> Boards feature:
> >>    - 4x USB via USB2 hub (usb1 on SoM).
> >>    - SDcard slot for loading images.
> >>    - Ethernet port wired to the internal PHY. (100M)
> >>    - 2x HDMI 2.0. (Only 1 usable on CB1)
> >>    - Power and Status LEDs. (Only Status LED usable on CB1)
> >>    - 40 pin GPIO header
> >>
> >> Currently working:
> >>    - Booting
> >>    - USB
> >>    - UART
> >>    - MMC
> >>    - Status LED
> >>    - WiFi (RTL8189FS via out of tree driver)
> >>
> >> I didnt want to duplicate things so the manta DTS can also be used on =
BTT pi4b adapter.
> >> CB1 SoM has its own DTSI file in case other boards shows up that accep=
t this SoM.
> >>
> >> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> >> ---
> >>   arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >>   .../sun50i-h616-bigtreetech-cb1-manta.dts     |  20 +++
> >>   .../sun50i-h616-bigtreetech-cb1.dtsi          | 164 ++++++++++++++++=
++
> >>   3 files changed, 185 insertions(+)
> >>   create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtree=
tech-cb1-manta.dts
> >>   create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-bigtree=
tech-cb1.dtsi
> >>
> >> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/=
dts/allwinner/Makefile
> >> index 6a96494a2e0a..7b386428510b 100644
> >> --- a/arch/arm64/boot/dts/allwinner/Makefile
> >> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> >> @@ -38,5 +38,6 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
> >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64-model-b.dtb
> >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6.dtb
> >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6-mini.dtb
> >> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-bigtreetech-cb1-manta.dtb
> >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-orangepi-zero2.dtb
> >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-x96-mate.dtb
> >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1=
-manta.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-mant=
a.dts
> >> new file mode 100644
> >> index 000000000000..dff5b592a97a
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.=
dts
> >> @@ -0,0 +1,20 @@
> >> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> >> +/*
> >> + * Copyright (C) 2023 Martin Botka <martin.botka@somainline.org>.
> >> + */
> >> +
> >> +/dts-v1/;
> >> +
> >> +#include "sun50i-h616-bigtreetech-cb1.dtsi"
> >> +
> >> +/ {
> >> +	compatible =3D "bigtreetech,cb1-manta", "bigtreetech,cb1", "allwinne=
r,sun50i-h616";
> >> +};
> >> +
> >> +&ehci1 {
> >> +	status =3D "okay";
> >> +};
> >> +
> >> +&ohci1 {
> >> +	status =3D "okay";
> >> +}; =20
> >=20
> > So how is the STM32 connected? Via SPI? If yes, you should activate the=
 SPI
> > node and specify the pinctrl.
> > Even if this requires a patch cable to connect the SPI header coming fr=
om
> > the CB1 to the SPI pins on the STM (does it?), it might be worth stating
> > the pins used. I don't know for sure if we enable interfaces that are
> > routed to fixed function header pins, but it might be worth doing so he=
re,
> > since this is some very obvious use case (I guess you wouldn't buy the =
M8P
> > if you don't plan to use all of its goodies). =20
> So the STM32 chip is connected directly via USB. There is USB hub on=20
> Manta boards and Pi adapter (Not on BTT Pi. That one doesnt use USB hub)
> that uses this USB port and STM32 connects via that. Then on manta=20
> boards there are 2 USB ports and 1 USB port with just pins exposed on
> XH2.54 4 pin connector. Bit weird but it is what it is :)

Ah, I missed that, and was already wondering where the fourth HUB output
went to. So USB is fine. Do the hub or the STM need a switched regulator?
Or is the hub and the STM32 always powered on?

> > And what's the USB-C connector doing? Is that an alternative power supp=
ly?
> > Ann does it connect the port0 D-/D+ pins, so can be used for OTG? If ye=
s,
> > please enable the usb_otg node here.
> >  =20
> It is indeed an alternative power supply. Or well primary supply in the=20
> case of Pi adapter board.
>=20
> It should be connected yes. Tho i never really had much luck getting it=20
> to work. Tho i will check again and if i get it to work i will enable it=
=20
> in V2 :)

You could test with FEL. Get
https://github.com/linux-sunxi/sunxi-tools/raw/master/bin/fel-sdboot.sunxi,
write that to sector 16 of an SD card, and boot from there.
That should put the SoC into FEL mode, and you should be able to see the
BootROM provided USB device ID on a connected host - if the data pins are
connected to USB port 0.
I see DP0/DM0 test pads on the SoM, maybe you can chase them down to
see if they actually go to the SoM connector? But wasn't it that there is
only one pair of USB pins available on a CM4 pinout? Hence the hub on the
Mantra boards?

> >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1=
.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
> >> new file mode 100644
> >> index 000000000000..e630114f0ce4
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
> >> @@ -0,0 +1,164 @@
> >> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> >> +/*
> >> + * Copyright (C) 2023 Martin Botka <martin.botka@somainline.org>.
> >> + */
> >> +
> >> +/dts-v1/;
> >> +
> >> +#include "sun50i-h616.dtsi"
> >> +
> >> +#include <dt-bindings/gpio/gpio.h>
> >> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +#include <dt-bindings/leds/common.h>
> >> +
> >> +/ {
> >> +	model =3D "BigTreeTech CB1";
> >> +	compatible =3D "bigtreetech,cb1", "allwinner,sun50i-h616";
> >> +
> >> +	aliases {
> >> +		serial0 =3D &uart0;
> >> +		ethernet0 =3D &rtl8189ftv;
> >> +	};
> >> +
> >> +	chosen {
> >> +		stdout-path =3D "serial0:115200n8";
> >> +	}; =20
> >=20
> > I think stdout-path belongs into the board .dts.
> > =20
>=20
> Got it
>=20
> >> +=09
> >> +	leds {
> >> +		compatible =3D "gpio-leds";
> >> +
> >> +		led-0 {
> >> +			function =3D LED_FUNCTION_STATUS;
> >> +			color =3D <LED_COLOR_ID_GREEN>;
> >> +			gpios =3D <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5 */
> >> +		};
> >> +	};
> >> +
> >> +	reg_vcc5v: regulator-vcc5v {
> >> +		/* board wide 5V supply directly from the USB-C socket */ =20
> >=20
> > I guess this "regulator" is still valid, but please adjust the comment,
> > since there is certainly no USB-C socket on the SoM. I guess it's multi=
ple
> > pins on the SoM connector that supply the incoming base voltage? =20
> Correct. Its just pins that get the 5V power. My fault for saying=20
> directly from USB-C since it can be from somewhere else :)
> >  =20
> >> +		compatible =3D "regulator-fixed";
> >> +		regulator-name =3D "vcc-5v";
> >> +		regulator-min-microvolt =3D <5000000>;
> >> +		regulator-max-microvolt =3D <5000000>;
> >> +		regulator-always-on;
> >> +	};
> >> +
> >> +	reg_usb1_vbus: regulator-usb1-vbus { =20
> >=20
> > So is this regulator really on the SoM? Or is it just PC16 on the SoM
> > connector, and the actual regulator chip is on the respective carrier
> > boards?
> >  =20
>=20
> This is my bad. This is completely wrong. The actual regulator is the 5V=
=20
> one thats turned on when 5V comes in. Its bit weird but i suppose its=20
> done that way for USB-OTG. This will be removed in next revision of this=
=20
> DTS :)

Having fixed 5V supply for USB ports, coming directly from the board power
supply, is actually quite common, see many Pine64 boards, for instance.
In this case you don't need to specify a usb<x>_vbus-supply property in
the PHY node below.

> >> +		compatible =3D "regulator-fixed";
> >> +		regulator-name =3D "usb1-vbus";
> >> +		regulator-min-microvolt =3D <5000000>;
> >> +		regulator-max-microvolt =3D <5000000>;
> >> +		vin-supply =3D <&reg_vcc5v>;
> >> +		enable-active-high;
> >> +		gpio =3D <&pio 2 16 GPIO_ACTIVE_HIGH>; /* PC16 */
> >> +	};
> >> +=09
> >> +	reg_vcc33_wifi: vcc33-wifi {
> >> +		/* Always on 3.3V regulator for WiFi and BT */
> >> +		compatible =3D "regulator-fixed";
> >> +		regulator-name =3D "vcc33-wifi";
> >> +		regulator-min-microvolt =3D <3300000>;
> >> +		regulator-max-microvolt =3D <3300000>;
> >> +		regulator-always-on;
> >> +		vin-supply =3D <&reg_vcc5v>;
> >> +	};
> >> +=09
> >> +	reg_vcc_wifi_io: vcc-wifi-io {
> >> +		/* Always on 1.8V/300mA regulator for WiFi and BT IO */
> >> +		compatible =3D "regulator-fixed";
> >> +		regulator-name =3D "vcc-wifi-io";
> >> +		regulator-min-microvolt =3D <1800000>;
> >> +		regulator-max-microvolt =3D <1800000>;
> >> +		regulator-always-on;
> >> +		vin-supply =3D <&reg_vcc33_wifi>;
> >> +	};
> >> +
> >> +	wifi_pwrseq: wifi-pwrseq {
> >> +		compatible =3D "mmc-pwrseq-simple";
> >> +		clocks =3D <&rtc 1>;
> >> +		clock-names =3D "ext_clock";
> >> +		reset-gpios =3D <&pio 6 18 GPIO_ACTIVE_LOW>;  /* PG18 */
> >> +		post-power-on-delay-ms =3D <200>;
> >> +	};
> >> +};
> >> +
> >> +&mmc0 {
> >> +	vmmc-supply =3D <&reg_dldo1>;
> >> +	broken-cd; =20
> >=20
> > Is there no card detect switch or is it not wired up, or is it really
> > "broken"? Might be good to have a comment explaining that.
> > And yeah, I also forgot to do this in my Orange Pi Zero3 .dts ;-)
> >  =20
> Its just straight up not connected. And since documentation specifies=20
> that this should be set when no card detection is available i set it.
>=20
> Will add a comment specifying that this is due to the pin not being=20
> connected.

Yes, that's correct, broken-cd is the right choice then and works fine. I
was just asking because it *is* connected on the OrangePi Zero3, but didn't
work for me there.

> >> +	bus-width =3D <4>;
> >> +	status =3D "okay";
> >> +};
> >> +
> >> +&mmc1 {
> >> +	vmmc-supply =3D <&reg_vcc33_wifi>;
> >> +	vqmmc-supply =3D <&reg_vcc_wifi_io>;
> >> +	mmc-pwrseq =3D <&wifi_pwrseq>;
> >> +	bus-width =3D <4>;
> >> +	non-removable;
> >> +	mmc-ddr-1_8v;
> >> +	status =3D "okay";
> >> +
> >> +	rtl8189ftv: sdio_wifi@1 {
> >> +		reg =3D <1>;
> >> +	};
> >> +};
> >> +
> >> +&r_i2c {
> >> +	status =3D "okay";
> >> +
> >> +	axp313a: pmic@36 {
> >> +		compatible =3D "x-powers,axp313a";
> >> +		reg =3D <0x36>;
> >> +		interrupt-controller;
> >> +		#interrupt-cells =3D <1>;
> >> +
> >> +		regulators{
> >> +			reg_dcdc1: dcdc1 {
> >> +				regulator-name =3D "vdd-gpu";
> >> +				regulator-min-microvolt =3D <500000>;
> >> +				regulator-max-microvolt =3D <3400000>; =20
> >=20
> > So those are the ranges of the PMIC rail, but if this is really connect=
ed
> > to VDD_GPU on the H616, you should limit it to between 0.81V and 0.99V,=
 as
> > described in the H616 datasheet. Otherwise this risks frying the SoC, I
> > guess. =20
>=20
> The range here should be correct. It is also the sys rail. Since AXP313a=
=20
> lacks many rails this was chosen as the sys rail as well.

Yes, very common indeed. I think in reality most boards will need all
rails to be always on.

> >  =20
> >> +				regulator-always-on; =20
> >=20
> > So is this connected to something else as well, like VDD_SYS? Please
> > either mention this as a comment, to justify the always-on, or name the
> > regulator accordingly, like "vdd-gpu-sys". =20
> Will rename to vdd-gpu-sys.
> >    =20
> >> +			};
> >> +
> >> +			reg_dcdc2: dcdc2 {
> >> +				regulator-name =3D "vdd-cpu";
> >> +				regulator-min-microvolt =3D <500000>;
> >> +				regulator-max-microvolt =3D <1540000>; =20
> >=20
> > Same limit problem here, VDD_CPU must be between 0.81V and 1.1V. =20
> That is indeed right. I will test it on the range you provided with OPP=20
> (WIP) and stress test it :)
> >  =20
> >> +				regulator-ramp-delay =3D <200>;
> >> +				regulator-always-on;
> >> +			};
> >> +
> >> +			reg_dcdc3: dcdc3 {
> >> +				regulator-name =3D "vcc-dram";
> >> +				regulator-min-microvolt =3D <500000>;
> >> +				regulator-max-microvolt =3D <1840000>; =20
> >=20
> > Is that DDR3 or DDR3L DRAM here? I don't think there is any runtime
> > adjustments here, so just specify the respective voltage required, with=
 the
> > same value for both min and max. =20
> it uses Kingston D2516ECMDXGJD so DDR3. I will specify the direct voltage.

But this is DDR3L, so DDR3, just with a slightly lower voltage (1.35V
instead of 1.5V). Please note that this is different from LPDDR3, which
uses a different protocol, on top of lowering the voltage.

> >  =20
> >> +				regulator-always-on;
> >> +			};
> >> +
> >> +			reg_aldo1: aldo1 {
> >> +				regulator-name =3D "vcc-1v8";
> >> +				regulator-min-microvolt =3D <1800000>;
> >> +				regulator-max-microvolt =3D <1800000>;
> >> +				regulator-always-on; =20
> >=20
> > Please mention what this supplies that justifies always-on. =20
> ALDO1 1.8V gets also converted to 1.8V for DRAM. Thus needs to be on alwa=
ys.

Yes, as seen with other boards, where it more prominently also supplies
VCC-PLL, which is essential for any clock operation. Might be worth
checking, if you have access to the complete schematic.

> >> +			};
> >> +
> >> +			reg_dldo1: dldo1 {
> >> +				regulator-name =3D "vcc-3v3";
> >> +				regulator-min-microvolt =3D <3300000>;
> >> +				regulator-max-microvolt =3D <3300000>;
> >> +				regulator-always-on; =20
> >=20
> > Please mention what this supplies that justifies always-on. =20
> SDcard that serves as storage for system. Will add comments for both :)

SD card alone does not justify always-on, as you reference this regulator
in the mmc0 node, so a kernel could make the connection. But chances are
this is also connected to VCC-IO, which is also one of the mandatory supply
voltages.

> >  =20
> >> +			};
> >> +		};
> >> +	};
> >> +};
> >> +
> >> +&uart0 {
> >> +	pinctrl-names =3D "default";
> >> +	pinctrl-0 =3D <&uart0_ph_pins>;
> >> +	status =3D "okay";
> >> +}; =20
> >=20
> > This belongs into the board .dts, since the connector/UART bridge is
> > there. =20
> Actually the SoM has exposed pads to connect UART (Which is what i have=20
> done to get UART) but also the boards get the exact pins wired to GPIO.

Those pad on the lower right corner? In this case it might justify having
the UART node in the SoM .dtsi, though I don't know if (test)pads qualify
for enabling peripherals. Generic GPIO pins (say pinmux'ed I2C on some
GPIO headers) certainly don't.

Cheers,
Andre

> But since most users would use the GPIO UART i will specify it in=20
> carrier boards and in BTT Pi boards separately.
>=20
> Cheers,
> Martin
> >=20
> > Cheers,
> > Andre
> >  =20
> >> +
> >> +&usbphy {
> >> +	usb1_vbus-supply =3D <&reg_usb1_vbus>;
> >> +	status =3D "okay";
> >> +}; =20
> >=20
> >  =20
>=20
>=20

