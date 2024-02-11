Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7155F49D
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Feb 2024 22:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707690161; cv=none; b=QqSGOF9J2SPhe5IWWoyR1YPA5gY3/WTXUlQLTaWl1U+YZZGoXBivR8whIq8ElbfztQv9llo5gbbAHi2EvtBn2kjLgl03zwPzw7YXoa/4rlsygxe5AIJEH0zAhanNhaZiFhQFjh0jeYVNJpR96ajXNfIzK655H58yWRho6RQ9JPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707690161; c=relaxed/simple;
	bh=KrMxj9Pb5WA8UIBrDjsssr9rrItjFwpYAU4kMUPn0kc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=syAHBmlzGLcrmGlGfTYfqSlEhJSoxMCKn3wbDyDahwrXMD8D2QXIgTyYA0ItaBYVwI7Cb1ogkecrm1bgjIbyGVROil2q6t5kHgiJFz0qEMMpmzZ+pkwFSDqQf5kVfOW7a46D0WF9UZURcYzNW0asfBYsDHM0AJgovGSC9LzlPxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5ACEADA7;
	Sun, 11 Feb 2024 14:23:18 -0800 (PST)
Received: from minigeek.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F8653F762;
	Sun, 11 Feb 2024 14:22:35 -0800 (PST)
Date: Sun, 11 Feb 2024 22:21:25 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: h618: add BananaPi M4
 Berry board
Message-ID: <20240211222125.5396a059@minigeek.lan>
In-Reply-To: <3791760.kQq0lBPeGt@jernej-laptop>
References: <20240204101054.152012-1-andre.przywara@arm.com>
	<20240204101054.152012-3-andre.przywara@arm.com>
	<22174359.EfDdHjke4D@jernej-laptop>
	<3791760.kQq0lBPeGt@jernej-laptop>
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

On Sun, 11 Feb 2024 21:22:11 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

> Hi Andre!
>=20
> Dne ponedeljek, 05. februar 2024 ob 19:19:26 CET je Jernej =C5=A0krabec n=
apisal(a):
> > Dne nedelja, 04. februar 2024 ob 11:10:54 CET je Andre Przywara napisal=
(a): =20
> > > The BananaPi M4 Berry is a development board using the Allwinner H618
> > > SoC. It comes with the following specs:
> > > 	- Allwinner H618 SoC (4 * Arm Cortex-A53 cores, 1MB L2 cache)
> > > 	- 2 GiB LPDDR4 DRAM
> > > 	- 8 GiB eMMC flash
> > > 	- AXP313a PMIC
> > > 	- Gigabit Ethernet, using RTL8211 PHY
> > > 	- RTL8821CU USB WiFi chip
> > > 	- HDMI port
> > > 	- 4 * USB 2.0 ports, via an on-board hub chip
> > > 	- microSD card slot
> > > 	- 3.5mm A/V port
> > > 	- power supply and USB-OTG via USB-C connector
> > >=20
> > > Add a devicetree file describing the components that we already have
> > > bindings for, that excludes audio and video at the moment.
> > >=20
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> > >  .../sun50i-h618-bananapi-m4-berry.dts         | 223 ++++++++++++++++=
++
> > >  2 files changed, 224 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-bananap=
i-m4-berry.dts
> > >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot=
/dts/allwinner/Makefile
> > > index 2db3b15ad09f..1c5c204a109b 100644
> > > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > > @@ -43,5 +43,6 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-bigtreete=
ch-cb1-manta.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-bigtreetech-pi.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-orangepi-zero2.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-x96-mate.dtb
> > > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-bananapi-m4-berry.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-orangepi-zero3.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-transpeed-8k618-t.dtb
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-bananapi-m4-be=
rry.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-bananapi-m4-berry.dts
> > > new file mode 100644
> > > index 000000000000..a3f8ff75db42
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-bananapi-m4-berry.dts
> > > @@ -0,0 +1,223 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +/*
> > > + * Copyright (C) 2023 Arm Ltd.
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "sun50i-h616.dtsi"
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/input/linux-event-codes.h>
> > > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +#include <dt-bindings/leds/common.h>
> > > +
> > > +/ {
> > > +	model =3D "BananaPi M4 Berry";
> > > +	compatible =3D "sinovoip,bananapi-m4-berry", "allwinner,sun50i-h618=
";
> > > +
> > > +	aliases {
> > > +		ethernet0 =3D &emac0;
> > > +		serial0 =3D &uart0;
> > > +	};
> > > +
> > > +	chosen {
> > > +		stdout-path =3D "serial0:115200n8";
> > > +	};
> > > +
> > > +	leds {
> > > +		compatible =3D "gpio-leds";
> > > +
> > > +		led-0 {
> > > +			function =3D LED_FUNCTION_STATUS;
> > > +			color =3D <LED_COLOR_ID_GREEN>;
> > > +			gpios =3D <&pio 2 12 GPIO_ACTIVE_LOW>; /* PC12 */
> > > +		};
> > > +	};
> > > +
> > > +	gpio-keys {
> > > +		compatible =3D "gpio-keys";
> > > +
> > > +		key-sw3 {
> > > +			label =3D "sw3";
> > > +			linux,code =3D <BTN_0>;
> > > +			gpios =3D <&pio 2 7 GPIO_ACTIVE_LOW>;	/* PC7 */
> > > +		};
> > > +	};
> > > +
> > > +	reg_vcc5v: regulator-5v {
> > > +		/* board wide 5V supply directly from the USB-C socket */
> > > +		compatible =3D "regulator-fixed";
> > > +		regulator-name =3D "vcc-5v";
> > > +		regulator-min-microvolt =3D <5000000>;
> > > +		regulator-max-microvolt =3D <5000000>;
> > > +		regulator-always-on;
> > > +	};
> > > +
> > > +	reg_usb_vbus: regulator-usb-vbus {
> > > +		/* separate discrete regulator for the USB ports */
> > > +		compatible =3D "regulator-fixed";
> > > +		regulator-name =3D "usb-vbus";
> > > +		regulator-min-microvolt =3D <5000000>;
> > > +		regulator-max-microvolt =3D <5000000>;
> > > +		vin-supply =3D <&reg_vcc5v>;
> > > +	};
> > > +
> > > +	reg_3v3: regulator-3v3 {
> > > +		/* separate discrete regulator for WiFi and Ethernet PHY */
> > > +		compatible =3D "regulator-fixed";
> > > +		regulator-name =3D "vcc-3v3";
> > > +		regulator-min-microvolt =3D <3300000>;
> > > +		regulator-max-microvolt =3D <3300000>;
> > > +		vin-supply =3D <&reg_vcc5v>;
> > > +	};
> > > +};
> > > +
> > > +&cpu0 {
> > > +	cpu-supply =3D <&reg_dcdc2>;
> > > +};
> > > +
> > > +/* Connected to an on-board RTL8821CU USB WiFi chip. */
> > > +&ehci1 {
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +/* EHCI2 is on unpopulated pins */
> > > +
> > > +/* Connected to an on-board FE1.1s USB hub chip, supplying 4 USB-A p=
orts. */
> > > +&ehci3 {
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&emac0 {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&ext_rgmii_pins>;
> > > +	phy-mode =3D "rgmii";
> > > +	phy-handle =3D <&ext_rgmii_phy>;
> > > +	phy-supply =3D <&reg_3v3>;
> > > +	allwinner,rx-delay-ps =3D <3100>;
> > > +	allwinner,tx-delay-ps =3D <700>;
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&ir {
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&mdio0 {
> > > +	ext_rgmii_phy: ethernet-phy@1 {
> > > +		compatible =3D "ethernet-phy-ieee802.3-c22";
> > > +		reg =3D <1>;
> > > +		reset-gpios =3D <&pio 8 16 GPIO_ACTIVE_LOW>;	/* PI16 */
> > > +	};
> > > +};
> > > +
> > > +&mmc0 {
> > > +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
> > > +	vmmc-supply =3D <&reg_dldo1>;
> > > +	bus-width =3D <4>;
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&mmc2 {
> > > +	vmmc-supply =3D <&reg_dldo1>;
> > > +	vqmmc-supply =3D <&reg_aldo1>;
> > > +	bus-width =3D <8>;
> > > +	non-removable;
> > > +	cap-mmc-hw-reset;
> > > +	mmc-ddr-1_8v; =20
> >=20
> > This one should be dropped. =20
>=20
> Can you please test this one? If it works, I'll merge this series.

Unfortunately I cannot test, because I don't have that board. The DT is
entirely based on the schematic. As stated in the cover letter, I was
hoping for people out there to test this.

To be honest, I would feel better if someome provides a Tested-by: tag
before we merge that. Devils is often in the details, even with
seemingly straight-forward DTs like this.

Cheers,
Andre
=20
> Best regards,
> Jernej
> =20
> > > +	mmc-hs200-1_8v;
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +/* USB ports 1 and 3 connect to onboard devices that are high-speed =
only. */
> > > +
> > > +/* OHCI2 is on unpopulated pins */
> > > +
> > > +&pio {
> > > +	vcc-pc-supply =3D <&reg_aldo1>;
> > > +	vcc-pf-supply =3D <&reg_dldo1>;
> > > +	vcc-pg-supply =3D <&reg_dldo1>;
> > > +	vcc-ph-supply =3D <&reg_dldo1>;
> > > +	vcc-pi-supply =3D <&reg_dldo1>;
> > > +};
> > > +
> > > +&r_i2c {
> > > +	status =3D "okay";
> > > +
> > > +	axp313: pmic@36 {
> > > +		compatible =3D "x-powers,axp313a";
> > > +		reg =3D <0x36>;
> > > +		#interrupt-cells =3D <1>;
> > > +		interrupt-controller;
> > > +		interrupt-parent =3D <&pio>;
> > > +
> > > +		vin1-supply =3D <&reg_vcc5v>;
> > > +		vin2-supply =3D <&reg_vcc5v>;
> > > +		vin3-supply =3D <&reg_vcc5v>;
> > > +
> > > +		regulators {
> > > +			reg_aldo1: aldo1 {
> > > +				regulator-always-on;
> > > +				regulator-min-microvolt =3D <1800000>;
> > > +				regulator-max-microvolt =3D <1800000>;
> > > +				regulator-name =3D "vcc-1v8-pll";
> > > +			};
> > > +
> > > +			reg_dldo1: dldo1 {
> > > +				regulator-always-on;
> > > +				regulator-min-microvolt =3D <3300000>;
> > > +				regulator-max-microvolt =3D <3300000>;
> > > +				regulator-name =3D "vcc-3v3-io";
> > > +			};
> > > +
> > > +			reg_dcdc1: dcdc1 {
> > > +				regulator-always-on;
> > > +				regulator-min-microvolt =3D <810000>;
> > > +				regulator-max-microvolt =3D <990000>;
> > > +				regulator-name =3D "vdd-gpu-sys";
> > > +			};
> > > +
> > > +			reg_dcdc2: dcdc2 {
> > > +				regulator-always-on;
> > > +				regulator-min-microvolt =3D <810000>;
> > > +				regulator-max-microvolt =3D <1100000>;
> > > +				regulator-name =3D "vdd-cpu";
> > > +			};
> > > +
> > > +			reg_dcdc3: dcdc3 {
> > > +				regulator-always-on;
> > > +				regulator-min-microvolt =3D <1100000>;
> > > +				regulator-max-microvolt =3D <1100000>;
> > > +				regulator-name =3D "vdd-dram";
> > > +			};
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +&uart0 {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&uart0_ph_pins>;
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&usbotg {
> > > +	/*
> > > +	 * PHY0 pins are connected to a USB-C socket, but a role switch is =
not
> > > +	 * implemented: both CC pins are pulled to GND via a 5.1K resistor.
> > > +	 * The VBUS pins power the device, so a fixed peripheral mode
> > > +	 * is the best choice.
> > > +	 * The board can be powered via GPIOs, in this case port0 *can*
> > > +	 * act as a host (with a cable/adapter ignoring CC), as VBUS is
> > > +	 * then provided by the GPIOs. Any user of this setup would
> > > +	 * need to adjust the DT accordingly: dr_mode set to "host",
> > > +	 * enabling OHCI0 and EHCI0.
> > > +	 */
> > > +	dr_mode =3D "peripheral";
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&usbphy {
> > > +	usb3_vbus-supply =3D <&reg_usb_vbus>;
> > > +	status =3D "okay";
> > > +};
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

