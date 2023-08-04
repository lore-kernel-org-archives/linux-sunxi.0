Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35054BA2C
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Aug 2023 22:59:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C60C11007;
	Fri,  4 Aug 2023 16:00:12 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6216B3F59C;
	Fri,  4 Aug 2023 15:59:28 -0700 (PDT)
Date: Fri, 4 Aug 2023 23:58:27 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Icenowy
 Zheng <uwu@icenowy.me>, Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: h616: Add OrangePi Zero 3
 board support
Message-ID: <20230804235827.3f32fa8f@slackpad.lan>
In-Reply-To: <4500165.LvFx2qVVIh@jernej-laptop>
References: <20230804170856.1237202-1-andre.przywara@arm.com>
	<20230804170856.1237202-4-andre.przywara@arm.com>
	<4500165.LvFx2qVVIh@jernej-laptop>
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

On Fri, 04 Aug 2023 21:05:36 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

> Dne petek, 04. avgust 2023 ob 19:08:56 CEST je Andre Przywara napisal(a):
> > The OrangePi Zero 3 is a development board based on the Allwinner H618 =
SoC,
> > which seems to be just an H616 with more L2 cache. The board itself is a
> > slightly updated version of the Orange Pi Zero 2. It features:
> > - Four ARM Cortex-A53 cores, Mali-G31 MP2 GPU
> > - 1/1.5/2/4 GiB LPDDR4 DRAM SKUs (only up to 1GB on the Zero2)
> > - AXP313a PMIC (more capable AXP305 on the Zero2)
> > - Raspberry-Pi-1 compatible GPIO header
> > - extra 13 pin expansion header, exposing pins for 2x USB 2.0 ports
> > - 1 USB 2.0 host port
> > - 1 USB 2.0 type C port (power supply + OTG)
> > - MicroSD slot
> > - on-board 16MiB bootable SPI NOR flash (only 2MB on the Zero2)
> > - 1Gbps Ethernet port (via Motorcomm YT8531 PHY) (RTL8211 on the Zero2)
> > - micro-HDMI port
> > - (yet) unsupported Allwinner WiFi/BT chip
> >=20
> > Add the devicetree file describing the currently supported features,
> > namely LEDs, SD card, PMIC, SPI flash, USB. Ethernet seems unstable at
> > the moment, though the basic functionality works.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile        |  1 +
> >  .../allwinner/sun50i-h618-orangepi-zero3.dts  | 94 +++++++++++++++++++
> >  2 files changed, 95 insertions(+)
> >  create mode 100644
> > arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile
> > b/arch/arm64/boot/dts/allwinner/Makefile index 6a96494a2e0a3..3b0ad5406=
2381
> > 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -40,3 +40,4 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6-mini.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-orangepi-zero2.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-x96-mate.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-orangepi-zero3.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.d=
ts
> > b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts new file
> > mode 100644
> > index 0000000000000..96a6851728111
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
> > @@ -0,0 +1,94 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> > +/*
> > + * Copyright (C) 2023 Arm Ltd.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-h616-orangepi-zero.dtsi"
> > +
> > +/ {
> > +	model =3D "OrangePi Zero3";
> > +	compatible =3D "xunlong,orangepi-zero3", "allwinner,sun50i-h618";
> > +};
> > +
> > +&emac0 {
> > +	phy-supply =3D <&reg_dldo1>;
> > +};
> > +
> > +&ext_rgmii_phy {
> > +	motorcomm,clk-out-frequency-hz =3D <125000000>;
> > +};
> > +
> > +&mmc0 {
> > +	/*
> > +	 * The schematic shows the card detect pin wired up to PF6, via an
> > +	 * inverter, but it just doesn't work.
> > +	 */
> > +	broken-cd;
> > +	vmmc-supply =3D <&reg_dldo1>;
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
> > +			/* Supplies VCC-PLL, so needs to be always  =20
> on. */
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
> > +			}; =20
>=20
> Is it safe to change sys voltage when system is running?

I don't know. All I know is that the H616 datasheet lists VDD_SYS as
having the exact same range as VDD_GPU, and that is does not give a
"typical" voltage value. As this DT stands at the moment, this doesn't
really matter, since nothing will change DCDC1.

I see that the Orange Pi Zero 2 (with a "proper" PMIC) also ties SYS and
GPU together, so it's not just because of the few rails of the AXP313.

I'd say we will figure that out once we start experimenting with GPU
DVFS, but meanwhile nothing references DCDC1, so it will just stay put
at the AXP313's 0.9V reset value.

Does that make sense?

Cheers,
Andre

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
> > +&pio {
> > +	vcc-pc-supply =3D <&reg_dldo1>;
> > +	vcc-pf-supply =3D <&reg_dldo1>;
> > +	vcc-pg-supply =3D <&reg_aldo1>;
> > +	vcc-ph-supply =3D <&reg_dldo1>;
> > +	vcc-pi-supply =3D <&reg_dldo1>;
> > +}; =20
>=20
>=20
>=20
>=20
>=20

