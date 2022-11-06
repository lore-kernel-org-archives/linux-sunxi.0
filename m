Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3552A2CA4
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Nov 2022 23:14:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B0091FB;
	Sun,  6 Nov 2022 15:14:28 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C5103F534;
	Sun,  6 Nov 2022 15:14:20 -0800 (PST)
Date: Sun, 6 Nov 2022 23:12:50 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Icenowy
 Zheng <uwu@icenowy.me>, Gregory CLEMENT <gregory.clement@bootlin.com>,
 linux-i2c@vger.kernel.org
Subject: Re: [PATCH 4/9] ARM: dts: suniv: f1c100s: add I2C DT nodes
Message-ID: <20221106231214.7d2d8505@slackpad.lan>
In-Reply-To: <4223066.ejJDZkT8p0@jernej-laptop>
References: <20221101141658.3631342-1-andre.przywara@arm.com>
	<20221101141658.3631342-5-andre.przywara@arm.com>
	<4223066.ejJDZkT8p0@jernej-laptop>
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

On Sun, 06 Nov 2022 09:09:17 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

> Dne torek, 01. november 2022 ob 15:16:53 CET je Andre Przywara napisal(a):
> > The Allwinner F1C100s series of SoCs contain three I2C controllers
> > compatible to the ones used in other Allwinner SoCs.
> >=20
> > Add the DT nodes describing the resources of the controllers.
> > I2C1 has only one possible pinmux, so add the pinctrl properties for
> > that already.
> > At least one board connects an on-board I2C chip to PD0/PD12 (I2C0), so
> > include those pins already, to simplify referencing them later.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm/boot/dts/suniv-f1c100s.dtsi | 50 ++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> > b/arch/arm/boot/dts/suniv-f1c100s.dtsi index d5a6324e76465..2901c586971=
b4
> > 100644
> > --- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> > +++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> > @@ -166,6 +166,18 @@ mmc0_pins: mmc0-pins {
> >  				drive-strength =3D <30>;
> >  			};
> >=20
> > +			/omit-if-no-ref/
> > +			i2c0_pd_pins: i2c0-pd-pins {
> > +				pins =3D "PD0", "PD12";
> > +				function =3D "i2c0";
> > +			};
> > +
> > +			/omit-if-no-ref/ =20
>=20
> Above flag is meaningless if i2c1_pins is always referenced by i2c1.

Indeed, good point.

> Anyway, I=20
> see in pinctrl driver that there are actually two possible pin assignment=
s for=20
> i2c1. One on port D and another on port B.

Ah, those are the pins that are not documented in the manual (which is
where I looked at). I will drop that node.

Cheers,
Andre

>=20
> Best regards,
> Jernej
>=20
> > +			i2c1_pins: i2c1-pins {
> > +				pins =3D "PD5", "PD6";
> > +				function =3D "i2c1";
> > +			};
> > +
> >  			spi0_pc_pins: spi0-pc-pins {
> >  				pins =3D "PC0", "PC1", "PC2",  =20
> "PC3";
> >  				function =3D "spi0";
> > @@ -177,6 +189,44 @@ uart0_pe_pins: uart0-pe-pins {
> >  			};
> >  		};
> >=20
> > +		i2c0: i2c@1c27000 {
> > +			compatible =3D "allwinner,suniv-f1c100s-i2c",
> > +				     "allwinner,sun6i-a31-i2c";
> > +			reg =3D <0x01c27000 0x400>;
> > +			interrupts =3D <7>;
> > +			clocks =3D <&ccu CLK_BUS_I2C0>;
> > +			resets =3D <&ccu RST_BUS_I2C0>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		i2c1: i2c@1c27400 {
> > +			compatible =3D "allwinner,suniv-f1c100s-i2c",
> > +				     "allwinner,sun6i-a31-i2c";
> > +			reg =3D <0x01c27400 0x400>;
> > +			interrupts =3D <8>;
> > +			clocks =3D <&ccu CLK_BUS_I2C1>;
> > +			resets =3D <&ccu RST_BUS_I2C1>;
> > +			pinctrl-names =3D "default";
> > +			pinctrl-0 =3D <&i2c1_pins>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		i2c2: i2c@1c27800 {
> > +			compatible =3D "allwinner,suniv-f1c100s-i2c",
> > +				     "allwinner,sun6i-a31-i2c";
> > +			reg =3D <0x01c27800 0x400>;
> > +			interrupts =3D <9>;
> > +			clocks =3D <&ccu CLK_BUS_I2C2>;
> > +			resets =3D <&ccu RST_BUS_I2C2>;
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +			status =3D "disabled";
> > +		};
> > +
> >  		timer@1c20c00 {
> >  			compatible =3D "allwinner,suniv-f1c100s- =20
> timer";
> >  			reg =3D <0x01c20c00 0x90>; =20
>=20
>=20
>=20
>=20
>=20

