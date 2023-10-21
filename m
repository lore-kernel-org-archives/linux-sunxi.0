Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BA314018
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Oct 2023 21:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 214BBC15;
	Sat, 21 Oct 2023 14:48:53 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A19A3F762;
	Sat, 21 Oct 2023 14:48:10 -0700 (PDT)
Date: Sat, 21 Oct 2023 22:47:07 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Marc
 Zyngier <maz@kernel.org>, Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h616: add Orange Pi Zero 2W
 support
Message-ID: <20231021224707.0af92fa3@slackpad.lan>
In-Reply-To: <7582185.EvYhyI6sBW@archlinux>
References: <20231020145706.705420-1-andre.przywara@arm.com>
	<20231020145706.705420-3-andre.przywara@arm.com>
	<7582185.EvYhyI6sBW@archlinux>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 21 Oct 2023 08:22:24 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

> On Friday, October 20, 2023 4:57:06 PM CEST Andre Przywara wrote:
> > The Orange Pi Zero 2W is a board based on the Allwinner H618 SoC.
> > It uses the RaspberryPi Zero form factor, with an optional expansion
> > board, connected via an FPC connector, to provide more connectors.
> >=20
> > The base board features:
> > 	- Allwinner H618 SoC (quad Cortex-A53 cores, with 1MB L2 cache)
> > 	- 1, 2 or 4GB of LPDDR4 DRAM
> > 	- SD card socket
> > 	- two USB-C sockets, one UFP, one DFP
> > 	- HDMI connector
> > 	- (yet unsupported) WiFi module
> > 	- 16 MiB SPI flash
> > 	- power supply via the UFP USB-C port
> >=20
> > The FPC connector provides access to two more USB host ports, Fast
> > Ethernet, some GPIOs, Audio Line out and the IR receiver pin.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com> =20
>=20
> I compared it to the schematic and all values looks good. Sadly, it misse=
d=20
> merge window.

No worries, I wasn't expecting it to make it, just wanted to get this
out to start the discussion and have something at a canonical place,
since the first boards seem to arrive for people now.

> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Thanks,
Andre

> Best regards,
> Jernej
>=20
> > ---
> >  .../allwinner/sun50i-h618-orangepi-zero2w.dts | 176 ++++++++++++++++++
> >  1 file changed, 176 insertions(+)
> >  create mode 100644
> > arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.=
dts
> > b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts new file
> > mode 100644
> > index 0000000000000..21ca1977055d9
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
> > @@ -0,0 +1,176 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (C) 2023 Arm Ltd.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-h616.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/leds/common.h>
> > +
> > +/ {
> > +	model =3D "OrangePi Zero 2W";
> > +	compatible =3D "xunlong,orangepi-zero2w", "allwinner,sun50i-h618";
> > +
> > +	aliases {
> > +		serial0 =3D &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path =3D "serial0:115200n8";
> > +	};
> > +
> > +	leds {
> > +		compatible =3D "gpio-leds";
> > +
> > +		led-0 {
> > +			function =3D LED_FUNCTION_STATUS;
> > +			color =3D <LED_COLOR_ID_GREEN>;
> > +			gpios =3D <&pio 2 13 GPIO_ACTIVE_HIGH>; /* PC13  =20
> */
> > +		};
> > +	};
> > +
> > +	reg_vcc5v: vcc5v {
> > +		/* board wide 5V supply directly from the USB-C socket  =20
> */
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "vcc-5v";
> > +		regulator-min-microvolt =3D <5000000>;
> > +		regulator-max-microvolt =3D <5000000>;
> > +		regulator-always-on;
> > +	};
> > +
> > +	reg_vcc3v3: vcc3v3 {
> > +		/* SY8089 DC/DC converter */
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "vcc-3v3";
> > +		regulator-min-microvolt =3D <3300000>;
> > +		regulator-max-microvolt =3D <3300000>;
> > +		vin-supply =3D <&reg_vcc5v>;
> > +		regulator-always-on;
> > +	};
> > +};
> > +
> > +&ehci1 {
> > +	status =3D "okay";
> > +};
> > +
> > +/* USB 2 & 3 are on the FPC connector (or the exansion board) */
> > +
> > +&mmc0 {
> > +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
> > +	bus-width =3D <4>;
> > +	vmmc-supply =3D <&reg_vcc3v3>;
> > +	status =3D "okay";
> > +};
> > +
> > +&ohci1 {
> > +	status =3D "okay";
> > +};
> > +
> > +&pio {
> > +	vcc-pc-supply =3D <&reg_dldo1>;
> > +	vcc-pf-supply =3D <&reg_dldo1>;	/* internally via VCC-IO */
> > +	vcc-pg-supply =3D <&reg_aldo1>;
> > +	vcc-ph-supply =3D <&reg_dldo1>;	/* internally via VCC-IO */
> > +	vcc-pi-supply =3D <&reg_dldo1>;
> > +};
> > +
> > +&r_i2c {
> > +	status =3D "okay";
> > +
> > +	axp313: pmic@36 {
> > +		compatible =3D "x-powers,axp313a";
> > +		reg =3D <0x36>;
> > +		#interrupt-cells =3D <1>;
> > +		interrupt-controller;
> > +		interrupt-parent =3D <&pio>;
> > +		interrupts =3D <2 9 IRQ_TYPE_LEVEL_LOW>;	/* PC9 */
> > +
> > +		vin1-supply =3D <&reg_vcc5v>;
> > +		vin2-supply =3D <&reg_vcc5v>;
> > +		vin3-supply =3D <&reg_vcc5v>;
> > +
> > +		regulators {
> > +			/* Supplies VCC-PLL and DRAM */
> > +			reg_aldo1: aldo1 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D  =20
> <1800000>;
> > +				regulator-max-microvolt =3D  =20
> <1800000>;
> > +				regulator-name =3D "vcc1v8";
> > +			};
> > +
> > +			/* Supplies VCC-IO, so needs to be always on.  =20
> */
> > +			reg_dldo1: dldo1 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D  =20
> <3300000>;
> > +				regulator-max-microvolt =3D  =20
> <3300000>;
> > +				regulator-name =3D "vcc3v3";
> > +			};
> > +
> > +			reg_dcdc1: dcdc1 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D  =20
> <810000>;
> > +				regulator-max-microvolt =3D  =20
> <990000>;
> > +				regulator-name =3D "vdd-gpu-sys";
> > +			};
> > +
> > +			reg_dcdc2: dcdc2 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D  =20
> <810000>;
> > +				regulator-max-microvolt =3D  =20
> <1100000>;
> > +				regulator-name =3D "vdd-cpu";
> > +			};
> > +
> > +			reg_dcdc3: dcdc3 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D  =20
> <1100000>;
> > +				regulator-max-microvolt =3D  =20
> <1100000>;
> > +				regulator-name =3D "vdd-dram";
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&spi0  {
> > +	status =3D "okay";
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&spi0_pins>, <&spi0_cs0_pin>;
> > +
> > +	flash@0 {
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
> > +		compatible =3D "jedec,spi-nor";
> > +		reg =3D <0>;
> > +		spi-max-frequency =3D <40000000>;
> > +	};
> > +};
> > +
> > +&uart0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&uart0_ph_pins>;
> > +	status =3D "okay";
> > +};
> > +
> > +&usbotg {
> > +	/*
> > +	 * PHY0 pins are connected to a USB-C socket, but a role switch
> > +	 * is not implemented: both CC pins are pulled to GND.
> > +	 * The VBUS pins power the device, so a fixed peripheral mode
> > +	 * is the best choice.
> > +	 * The board can be powered via GPIOs, in this case port0 *can*
> > +	 * act as a host (with a cable/adapter ignoring CC), as VBUS is
> > +	 * then provided by the GPIOs. Any user of this setup would
> > +	 * need to adjust the DT accordingly: dr_mode set to "host",
> > +	 * enabling OHCI0 and EHCI0.
> > +	 */
> > +	dr_mode =3D "peripheral";
> > +	status =3D "okay";
> > +};
> > +
> > +&usbphy {
> > +	usb1_vbus-supply =3D <&reg_vcc5v>;
> > +	status =3D "okay";
> > +}; =20
>=20
>=20
>=20
>=20
>=20

