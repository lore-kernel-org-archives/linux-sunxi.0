Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52BD77B
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Jun 2022 00:10:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C97271480;
	Wed, 29 Jun 2022 17:10:16 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D40C3F5A1;
	Wed, 29 Jun 2022 17:10:14 -0700 (PDT)
Date: Thu, 30 Jun 2022 01:08:23 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Icenowy Zheng <icenowy@aosc.io>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 5/6] arm64: dts: allwinner: h616: Add OrangePi Zero
 2 board support
Message-ID: <20220630010823.3935caf6@slackpad.lan>
In-Reply-To: <7374416.EvYhyI6sBW@kista>
References: <20220428230933.15262-1-andre.przywara@arm.com>
 <20220428230933.15262-6-andre.przywara@arm.com>
 <7374416.EvYhyI6sBW@kista>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 03 May 2022 21:41:21 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

> Dne petek, 29. april 2022 ob 01:09:32 CEST je Andre Przywara napisal(a):
> > The OrangePi Zero 2 is a development board with the new H616 SoC. It
> > comes with the following features:
> >   - Four ARM Cortex-A53 cores, Mali-G31 MP2 GPU
> >   - 512MiB/1GiB DDR3 DRAM
> >   - AXP305 PMIC
> >   - Raspberry-Pi-1 compatible GPIO header
> >   - extra 13 pin expansion header, exposing pins for 2x USB 2.0 ports
> >   - 1 USB 2.0 host port
> >   - 1 USB 2.0 type C port (power supply + OTG)
> >   - MicroSD slot
> >   - on-board 2MiB bootable SPI NOR flash
> >   - 1Gbps Ethernet port (via RTL8211F PHY)
> >   - micro-HDMI port
> >   - unsupported Allwinner WiFi/BT chip
> >=20
> > For more details see: https://linux-sunxi.org/Orange_Pi_Zero_2 =20
>=20
> Please no external links.

Shame. I understand the reasons behind that, but this source is rather
stable (more so than some LKML archives ;-), and I copied the actual
important information. But well, I guess people have to put it in their
search engine and hope it doesn't drop them to the vendor's website ;-)

> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >  .../allwinner/sun50i-h616-orangepi-zero2.dts  | 203 ++++++++++++++++++
> >  2 files changed, 204 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-=
 =20
> zero2.dts
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/d=
ts/ =20
> allwinner/Makefile
> > index 8fa5c060a4fe..df2214e6d946 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -38,3 +38,4 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64-model-b.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6-mini.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-orangepi-zero2.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.d=
ts b/ =20
> arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> > new file mode 100644
> > index 000000000000..ca07cae698ce
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> > @@ -0,0 +1,203 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> > +/*
> > + * Copyright (C) 2020 Arm Ltd. =20
>=20
> 2022?

Mmh, but why? I wrote this in 2020, and it was published the first time
that year[1]. If the copyright year means anything, by my understanding
it should cover the earliest publication date, to establish the license
conditions over every copy out there.

[1]
https://lore.kernel.org/linux-arm-kernel/20201202135409.13683-8-andre.przyw=
ara@arm.com/

>=20
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
> > +	model =3D "OrangePi Zero2";
> > +	compatible =3D "xunlong,orangepi-zero2", "allwinner,sun50i-h616";
> > +
> > +	aliases {
> > +		ethernet0 =3D &emac0;
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
> > +			function =3D LED_FUNCTION_POWER;
> > +			color =3D <LED_COLOR_ID_RED>;
> > +			gpios =3D <&pio 2 12 GPIO_ACTIVE_HIGH>; /* PC12  =20
> */
> > +			default-state =3D "on";
> > +		};
> > +
> > +		led-1 {
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
> > +};
> > +
> > +&emac0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&ext_rgmii_pins>;
> > +	phy-mode =3D "rgmii";
> > +	phy-handle =3D <&ext_rgmii_phy>;
> > +	phy-supply =3D <&reg_dcdce>;
> > +	allwinner,rx-delay-ps =3D <3100>;
> > +	allwinner,tx-delay-ps =3D <700>;
> > +	status =3D "okay";
> > +};
> > +
> > +&mdio0 {
> > +	ext_rgmii_phy: ethernet-phy@1 {
> > +		compatible =3D "ethernet-phy-ieee802.3-c22";
> > +		reg =3D <1>;
> > +	};
> > +};
> > +
> > +&mmc0 {
> > +	vmmc-supply =3D <&reg_dcdce>;
> > +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
> > +	bus-width =3D <4>;
> > +	status =3D "okay";
> > +};
> > +
> > +&r_rsb {
> > +	status =3D "okay";
> > +
> > +	axp305: pmic@745 {
> > +		compatible =3D "x-powers,axp305", "x-powers,axp805",
> > +			     "x-powers,axp806";
> > +		interrupt-controller;
> > +		#interrupt-cells =3D <1>;
> > +		reg =3D <0x745>;
> > +
> > +		x-powers,self-working-mode;
> > +		vina-supply =3D <&reg_vcc5v>;
> > +		vinb-supply =3D <&reg_vcc5v>;
> > +		vinc-supply =3D <&reg_vcc5v>;
> > +		vind-supply =3D <&reg_vcc5v>;
> > +		vine-supply =3D <&reg_vcc5v>;
> > +		aldoin-supply =3D <&reg_vcc5v>;
> > +		bldoin-supply =3D <&reg_vcc5v>;
> > +		cldoin-supply =3D <&reg_vcc5v>;
> > +
> > +		regulators {
> > +			reg_aldo1: aldo1 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D  =20
> <3300000>;
> > +				regulator-max-microvolt =3D  =20
> <3300000>;
> > +				regulator-name =3D "vcc-sys";
> > +			};
> > +
> > +			reg_aldo2: aldo2 {	/* 3.3V on headers  =20
> */
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D  =20
> <3300000>;
> > +				regulator-max-microvolt =3D  =20
> <3300000>;
> > +				regulator-name =3D "vcc3v3-ext";
> > +			};
> > +
> > +			reg_aldo3: aldo3 {	/* 3.3V on headers  =20
> */
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D  =20
> <3300000>;
> > +				regulator-max-microvolt =3D  =20
> <3300000>;
> > +				regulator-name =3D "vcc3v3-ext2";
> > +			};
> > +
> > +			reg_bldo1: bldo1 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D  =20
> <1800000>;
> > +				regulator-max-microvolt =3D  =20
> <1800000>;
> > +				regulator-name =3D "vcc1v8";
> > +			};
> > +
> > +			bldo2 {
> > +				/* unused */
> > +			};
> > +
> > +			bldo3 {
> > +				/* unused */
> > +			};
> > +
> > +			bldo4 {
> > +				/* unused */
> > +			};
> > +
> > +			cldo1 {
> > +				/* reserved */
> > +			};
> > +
> > +			cldo2 {
> > +				/* unused */
> > +			};
> > +
> > +			cldo3 {
> > +				/* unused */
> > +			};
> > +
> > +			reg_dcdca: dcdca {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D  =20
> <810000>;
> > +				regulator-max-microvolt =3D  =20
> <1080000>;
> > +				regulator-name =3D "vdd-cpu";
> > +			};
> > +
> > +			reg_dcdcc: dcdcc {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D  =20
> <810000>;
> > +				regulator-max-microvolt =3D  =20
> <1080000>;
> > +				regulator-name =3D "vdd-gpu-sys";
> > +			};
> > +
> > +			reg_dcdcd: dcdcd {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D  =20
> <1500000>;
> > +				regulator-max-microvolt =3D  =20
> <1500000>;
> > +				regulator-name =3D "vdd-dram";
> > +			};
> > +
> > +			reg_dcdce: dcdce {
> > +				regulator-boot-on; =20
>=20
> As discussed in the past, this will cause reboot issues because Linux wil=
l=20
> turn down above regulator and thus SD card will stop working. This should=
 be=20
> always on.
>=20
> And please add pio regulators, this is something we always add later...

Sure, thanks for the heads up, will do.

Cheers,
Andre

>=20
> Best regards,
> Jernej
>=20
> > +				regulator-min-microvolt =3D  =20
> <3300000>;
> > +				regulator-max-microvolt =3D  =20
> <3300000>;
> > +				regulator-name =3D "vcc-eth-mmc";
> > +			};
> > +
> > +			sw {
> > +				/* unused */
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&spi0  {
> > +	status =3D "okay";
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
> > --=20
> > 2.35.3
> >=20
> >  =20
>=20
>=20

