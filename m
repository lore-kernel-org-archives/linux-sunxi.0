Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D81D63D
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Dec 2023 01:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51E74C15;
	Wed, 13 Dec 2023 17:24:54 -0800 (PST)
Received: from minigeek.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B9383F762;
	Wed, 13 Dec 2023 17:24:07 -0800 (PST)
Date: Thu, 14 Dec 2023 01:23:57 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Icenowy
 Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: h618: add Transpeed 8K618-T
 TV box
Message-ID: <20231214012357.37526feb@minigeek.lan>
In-Reply-To: <4533903.LvFx2qVVIh@archlinux>
References: <20231212010859.11571-1-andre.przywara@arm.com>
	<20231212010859.11571-4-andre.przywara@arm.com>
	<4533903.LvFx2qVVIh@archlinux>
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

On Wed, 13 Dec 2023 20:22:55 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

thanks for having a look, much appreciated.

> On Tuesday, December 12, 2023 2:08:59 AM CET Andre Przywara wrote:
> > This is a Chinese TV box, probably very similar if not identical to
> > various other cheap TV boxes with the same specs:
> >       - Allwinner H618 SoC (4 * Arm Cortex-A53 cores, 1MB L2 cache)
> >       - 2 or 4GiB DDR3L DRAM
> >       - 32, 64, or 128 GiB eMMC flash
> >       - AXP313a PMIC
> >       - 100 Mbit/s Ethernet (using yet unsupported internal PHY)
> >       - HDMI port
> >       - 2 * USB 2.0 ports
> >       - microSD card slot
> >       - 3.5mm A/V port
> >       - 7-segment display
> >       - 5V barrel plug power supply
> >=20
> > The PCB provides holes for soldering a UART header or cable, this is
> > connected to the debug UART0. UART1 is used for the Bluetooth chip,
> > although this isn't working yet.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >  .../sun50i-h618-transpeed-8k618-t.dts         | 164 ++++++++++++++++++
> >  2 files changed, 165 insertions(+)
> >  create mode 100644
> > arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile
> > b/arch/arm64/boot/dts/allwinner/Makefile index 3aca6787a1679..91d505b38=
5de5
> > 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -43,3 +43,4 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-bigtreetech=
-pi.dtb
> > dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-orangepi-zero2.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-x96-mate.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-orangepi-zero3.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-transpeed-8k618-t.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-=
t.dts
> > b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts new f=
ile
> > mode 100644
> > index 0000000000000..fd7ea7bcde2c1
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
> > @@ -0,0 +1,164 @@
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
> > +
> > +/ {
> > +	model =3D "Transpeed 8K618-T";
> > +	compatible =3D "transpeed,8k618-t", "allwinner,sun50i-h618";
> > +
> > +	aliases {
> > +		serial0 =3D &uart0;
> > +		serial1 =3D &uart1; =20
>=20
> Any particular reason for above alias?

Not really, and since UART1 is used for Bluetooth, its name should not
matter at all, the BT driver will just use its parent device.
Will remove it.

>=20
> > +	};
> > +
> > +	chosen {
> > +		stdout-path =3D "serial0:115200n8";
> > +	};
> > +
> > +	reg_vcc5v: vcc5v {
> > +		/* board wide 5V supply directly from the DC input */
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "vcc-5v";
> > +		regulator-min-microvolt =3D <5000000>;
> > +		regulator-max-microvolt =3D <5000000>;
> > +		regulator-always-on;
> > +	};
> > +
> > +	reg_vcc3v3: vcc3v3 {
> > +		/* discrete 3.3V regulator */
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "vcc-3v3";
> > +		regulator-min-microvolt =3D <3300000>;
> > +		regulator-max-microvolt =3D <3300000>;
> > +		regulator-always-on;
> > +	};
> > +};
> > +
> > +&ehci0 {
> > +	status =3D "okay";
> > +};
> > +
> > +&ehci1 {
> > +	status =3D "okay";
> > +};
> > +
> > +&ir {
> > +	status =3D "okay";
> > +};
> > +
> > +&mmc0 {
> > +	vmmc-supply =3D <&reg_dldo1>;
> > +	cd-gpios =3D <&pio 8 16 GPIO_ACTIVE_LOW>;	/* PI16 */
> > +	bus-width =3D <4>;
> > +	status =3D "okay";
> > +};
> > +
> > +&mmc2 {
> > +	vmmc-supply =3D <&reg_dldo1>;
> > +	vqmmc-supply =3D <&reg_aldo1>;
> > +	bus-width =3D <8>;
> > +	non-removable;
> > +	cap-mmc-hw-reset;
> > +	mmc-ddr-1_8v;
> > +	mmc-hs200-1_8v;
> > +	status =3D "okay";
> > +};
> > +
> > +&ohci0 {
> > +	status =3D "okay";
> > +};
> > +
> > +&ohci1 {
> > +	status =3D "okay";
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
> > +
> > +		vin1-supply =3D <&reg_vcc5v>;
> > +		vin2-supply =3D <&reg_vcc5v>;
> > +		vin3-supply =3D <&reg_vcc5v>;
> > +
> > +		regulators {
> > +			/* Supplies VCC-PLL, so needs to be always  =20
> on. */
> > +			reg_aldo1: aldo1 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D  =20
> <1800000>;
> > +				regulator-max-microvolt =3D  =20
> <1800000>;
> > +				regulator-name =3D "vcc1v8"; =20
>=20
> It would be great to expand all PMIC regulator names with (known) areas t=
hey=20
> power, so something like "vcc1v8-pll-pc". With that, I think you can remo=
ve=20
> comments.

Alright, will do. I will stick with those users that I am pretty sure
of, either because they are mentioned in the BSP DT, or because they
must be supplied by that rail: there seem to be only one 1.8V source.

Cheers,
Andre

>=20
> Best regards,
> Jernej
>=20
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
> <1360000>;
> > +				regulator-max-microvolt =3D  =20
> <1360000>;
> > +				regulator-name =3D "vdd-dram";
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&pio {
> > +	vcc-pc-supply =3D <&reg_aldo1>;
> > +	vcc-pg-supply =3D <&reg_dldo1>;
> > +	vcc-ph-supply =3D <&reg_dldo1>;
> > +	vcc-pi-supply =3D <&reg_dldo1>;
> > +};
> > +
> > +&uart0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&uart0_ph_pins>;
> > +	status =3D "okay";
> > +};
> > +
> > +&uart1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> > +	uart-has-rtscts;
> > +	status =3D "okay";
> > +};
> > +
> > +&usbotg {
> > +	dr_mode =3D "host";	/* USB A type receptable */
> > +	status =3D "okay";
> > +};
> > +
> > +&usbphy {
> > +	status =3D "okay";
> > +}; =20
>=20
>=20
>=20
>=20
>=20

