Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FA3BA5D
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 16:47:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E4FD13D5;
	Tue, 15 Nov 2022 08:47:14 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB9273F587;
	Tue, 15 Nov 2022 08:47:06 -0800 (PST)
Date: Tue, 15 Nov 2022 16:47:04 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Icenowy Zheng <uwu@icenowy.me>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 09/11] ARM: dts: suniv: add device tree for PopStick
 v1.1
Message-ID: <20221115164704.1d9db428@donnerap.cambridge.arm.com>
In-Reply-To: <4752971.GXAFRqVoOG@kista>
References: <20221106154826.6687-1-andre.przywara@arm.com>
	<20221106154826.6687-10-andre.przywara@arm.com>
	<4752971.GXAFRqVoOG@kista>
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

On Mon, 07 Nov 2022 18:35:09 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

> Dne nedelja, 06. november 2022 ob 16:48:24 CET je Andre Przywara napisal(=
a):
> > From: Icenowy Zheng <uwu@icenowy.me>
> >=20
> > PopStick is a minimal Allwinner F1C200s dongle, with its USB controller
> > wired to a USB Type-A port, a SD slot and a SPI NAND flash on board, and
> > an on-board CH340 USB-UART converted connected to F1C200s's UART0.
> >=20
> > Add a device tree for it. As F1C200s is just F1C100s with a different
> > DRAM chip co-packaged, directly use F1C100s DTSI here.
> >=20
> > This commit covers the v1.1 version of this board, which is now shipped.
> > v1.0 is some internal sample that have not been shipped at all.
> >=20
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm/boot/dts/Makefile                    |  3 +-
> >  .../boot/dts/suniv-f1c200s-popstick-v1.1.dts  | 99 +++++++++++++++++++
> >  2 files changed, 101 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
> >=20
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 6aa7dc4db2fc..0249c07bd8a6 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1391,7 +1391,8 @@ dtb-$(CONFIG_MACH_SUN9I) +=3D \
> >  	sun9i-a80-optimus.dtb \
> >  	sun9i-a80-cubieboard4.dtb
> >  dtb-$(CONFIG_MACH_SUNIV) +=3D \
> > -	suniv-f1c100s-licheepi-nano.dtb
> > +	suniv-f1c100s-licheepi-nano.dtb \
> > +	suniv-f1c200s-popstick-v1.1.dtb
> >  dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) +=3D \
> >  	tegra20-acer-a500-picasso.dtb \
> >  	tegra20-asus-tf101.dtb \
> > diff --git a/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
> > b/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts new file mode 100644
> > index 000000000000..7d69b5fcb905
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/suniv-f1c200s-popstick-v1.1.dts
> > @@ -0,0 +1,99 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2022 Icenowy Zheng <uwu@icenowy.me>
> > + */
> > +
> > +/dts-v1/;
> > +#include "suniv-f1c100s.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/leds/common.h>
> > +
> > +/ {
> > +	model =3D "Popcorn Computer PopStick v1.1";
> > +	compatible =3D "sourceparts,popstick-v1.1", "sourceparts,popstick",
> > +		     "allwinner,suniv-f1c200s", "allwinner,suniv- =20
> f1c100s";
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
> > +		led {
> > +			function =3D LED_FUNCTION_STATUS;
> > +			color =3D <LED_COLOR_ID_GREEN>;
> > +			gpios =3D <&pio 4 6 GPIO_ACTIVE_HIGH>; /* PE6  =20
> */
> > +			linux,default-trigger =3D "heartbeat";
> > +		};
> > +	};
> > +
> > +	reg_vcc3v3: regulator-3v3 {
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "vcc3v3";
> > +		regulator-min-microvolt =3D <3300000>;
> > +		regulator-max-microvolt =3D <3300000>;
> > +	};
> > +};
> > +
> > +&mmc0 {
> > +	cd-gpios =3D <&pio 4 3 GPIO_ACTIVE_LOW>; /* PE3 */
> > +	bus-width =3D <4>;
> > +	disable-wp;
> > +	vmmc-supply =3D <&reg_vcc3v3>;
> > +	status =3D "okay";
> > +};
> > +
> > +&otg_sram {
> > +	status =3D "okay";
> > +};
> > +
> > +&spi0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&spi0_pc_pins>;
> > +	status =3D "okay";
> > +
> > +	flash@0 {
> > +		compatible =3D "spi-nand";
> > +		reg =3D <0>;
> > +		spi-max-frequency =3D <40000000>;
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
> > +
> > +		partitions { =20
>=20
> "make dtbs_check" is not happy with cells and partitions. Do we really ne=
ed=20
> them? If yes, then binding needs to be updated beforehand.

Right, my dt-validate run didn't initially complain, but does now, after
updating dt-schema.git.
So yes, I will just drop the partitions, for now. The partition scheme
seems to be legit, as described in mtd/fixed-partitions.yaml, but it
apparently just needs to be somehow included in spi-nand.yaml. Will do
that later, then update this .dts.

Cheers,
Andre

>=20
> > +			compatible =3D "fixed-partitions";
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <1>;
> > +
> > +			partition@0 {
> > +				label =3D "u-boot-with-spl";
> > +				reg =3D <0x0 0x100000>;
> > +			};
> > +
> > +			ubi@100000 {
> > +				label =3D "ubi";
> > +				reg =3D <0x100000 0x7f00000>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&uart0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&uart0_pe_pins>;
> > +	status =3D "okay";
> > +};
> > +
> > +&usb_otg {
> > +	dr_mode =3D "peripheral";
> > +	status =3D "okay";
> > +};
> > +
> > +&usbphy {
> > +	status =3D "okay";
> > +};
> > --
> > 2.35.5 =20
>=20
>=20

