Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBA31C3A
	for <linux-sunxi@lists.linux.dev>; Wed,  6 Sep 2023 10:24:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18C8A1063;
	Wed,  6 Sep 2023 03:25:23 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 998233F67D;
	Wed,  6 Sep 2023 03:24:38 -0700 (PDT)
Date: Wed, 6 Sep 2023 11:24:34 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Martin Botka <martin.botka@somainline.org>, Martin Botka
 <martin.botka1@gmail.com>, Martin Botka <martin@biqu3d.com>, Konrad Dybcio
 <konrad.dybcio@somainline.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@somainline.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Jami Kettunen
 <jamipkettunen@somainline.org>, Paul Bouchara
 <paul.bouchara@somainline.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, Ludwig Kormann <ludwig.kormann@ict42.de>, Andrew
 Lunn <andrew@lunn.ch>, Icenowy Zheng <uwu@icenowy.me>, Heiko Stuebner
 <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, Jagan Teki
 <jagan@edgeble.ai>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: allwinner: h616: Add BigTreeTech Pi
 support
Message-ID: <20230906112434.460b46c4@donnerap.manchester.arm.com>
In-Reply-To: <1909632.taCxCBeP46@archlinux>
References: <20230807145349.2220490-1-martin@biqu3d.com>
	<ZBNDZR.IENEPBA0KL4D2@somainline.org>
	<KSXWZR.LZT0IYKM7IPF@somainline.org>
	<1909632.taCxCBeP46@archlinux>
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

On Tue, 05 Sep 2023 22:45:27 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

> On Thursday, August 24, 2023 10:48:20 PM CEST Martin Botka wrote:
> > On Mon, Aug 14 2023 at 12:47:59 PM +02:00:00, Martin Botka
> >=20
> > <martin.botka@somainline.org> wrote: =20
> > > On Mon, Aug 14 2023 at 12:26:07 PM +02:00:00, Jernej =C5=A0krabec
> > >=20
> > > <jernej.skrabec@gmail.com> wrote: =20
> > >> Dne nedelja, 13. avgust 2023 ob 18:22:49 CEST je Martin Botka
> > >>=20
> > >> =7Fnapisal(a): =20
> > >>>  On Sun, Aug 13 2023 at 05:55:35 PM +02:00:00, Jernej =C5=A0krabec
> > >>> =20
> > >>>  <jernej.skrabec@gmail.com> wrote: =20
> > >>>  > Dne ponedeljek, 07. avgust 2023 ob 16:53:24 CEST je Martin Botka
> > >>>  >=20
> > >>>  > napisal(a): =20
> > >>>  >>  The BigTreeTech Pi is an H616 based board based on CB1.
> > >>>  >>  Just in Rpi format board.
> > >>>  >> =20
> > >>>  >>  It features the same internals as BTT CB1 but adds:
> > >>>  >>      - Fan port
> > >>>  >>      - IR receiver
> > >>>  >>      - ADXL345 Accelerometer connector via SPI
> > >>>  >>      - 24V DC power supply via terminal plugs
> > >>>  >>      - USB to CAN module connector (The actual USB to CAN =20
> > >>>=20
> > >>> =7F=7Fhappens on
> > >>>  =20
> > >>>  >> the
> > >>>  >>=20
> > >>>  >>  external module)
> > >>>  >> =20
> > >>>  >>  List of currently working things is same as BTT CB1 but also:
> > >>>  >>      - IR receiver
> > >>>  >>      - ADXL345 connector
> > >>>  >> =20
> > >>>  >>  Signed-off-by: Martin Botka <martin@biqu3d.com>
> > >>>  >>  Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> > >>>  >>  ---
> > >>>  >> =20
> > >>>  >>  Changes in V2:
> > >>>  >>      - Add UART alongside aliases and chosen for it
> > >>>  >>      - Add model string
> > >>>  >>      - Enable IR receiver
> > >>>  >>      - Enable SPI0 for ADXL345 connector
> > >>>  >> =20
> > >>>  >>  Changes in V3:
> > >>>  >>      - Add missing semicolons
> > >>>  >>      - Add pinctrl for SPI0
> > >>>  >>  =20
> > >>>  >>   arch/arm64/boot/dts/allwinner/Makefile        |  1 +
> > >>>  >>   .../allwinner/sun50i-h616-bigtreetech-pi.dts  | 70
> > >>>  >>=20
> > >>>  >> +++++++++++++++++++
> > >>>  >>=20
> > >>>  >>   2 files changed, 71 insertions(+)
> > >>>  >>   create mode 100644
> > >>>  >> =20
> > >>>  >>  arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
> > >>>  >> =20
> > >>>  >>  diff --git a/arch/arm64/boot/dts/allwinner/Makefile
> > >>>  >>  b/arch/arm64/boot/dts/allwinner/Makefile index
> > >>>  >>=20
> > >>>  >> 7b386428510b..0b6232a7f328
> > >>>  >>=20
> > >>>  >>  100644
> > >>>  >>  --- a/arch/arm64/boot/dts/allwinner/Makefile
> > >>>  >>  +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > >>>  >>  @@ -39,5 +39,6 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D
> > >>>  >>=20
> > >>>  >> sun50i-h6-pine-h64-model-b.dtb
> > >>>  >>=20
> > >>>  >>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6.dtb
> > >>>  >> =20
> > >>>  >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6-mini.dtb
> > >>>  >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D =20
> > >>>=20
> > >>> =7F=7Fsun50i-h616-bigtreetech-cb1-manta.dtb
> > >>>  =20
> > >>>  >>  +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-bigtreetech-pi.dtb
> > >>>  >> =20
> > >>>  >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-orangepi-zero2.dtb
> > >>>  >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-x96-mate.dtb
> > >>>  >> =20
> > >>>  >>  diff --git
> > >>>  >>=20
> > >>>  >> a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
> > >>>  >>=20
> > >>>  >>  b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts=
 =20
> > >>>=20
> > >>> =7F=7Fnew
> > >>>  =20
> > >>>  >> file
> > >>>  >>=20
> > >>>  >>  mode 100644
> > >>>  >>  index 000000000000..b0d0386e8f13
> > >>>  >>  --- /dev/null
> > >>>  >>  +++ =20
> > >>>=20
> > >>> =7F=7Fb/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
> > >>>  =20
> > >>>  >>  @@ -0,0 +1,70 @@
> > >>>  >>  +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> > >>>  >>  +/*
> > >>>  >>  + * Copyright (C) 2023 Martin Botka <martin@biqu3d.com>.
> > >>>  >>  + */
> > >>>  >>  +
> > >>>  >>  +/dts-v1/;
> > >>>  >>  +
> > >>>  >>  +#include "sun50i-h616-bigtreetech-cb1.dtsi"
> > >>>  >>  +
> > >>>  >>  +/ {
> > >>>  >>  +	model =3D "BigTreeTech Pi";
> > >>>  >>  +	compatible =3D "bigtreetech,pi", "allwinner,sun50i-h616";
> > >>>  >>  +
> > >>>  >>  +	aliases {
> > >>>  >>  +		serial0 =3D &uart0;
> > >>>  >>  +	};
> > >>>  >>  +
> > >>>  >>  +	chosen {
> > >>>  >>  +		stdout-path =3D "serial0:115200n8";
> > >>>  >>  +	};
> > >>>  >>  +};
> > >>>  >>  +
> > >>>  >>  +&ehci0 {
> > >>>  >>  +	status =3D "okay";
> > >>>  >>  +};
> > >>>  >>  +
> > >>>  >>  +&ehci1 {
> > >>>  >>  +	status =3D "okay";
> > >>>  >>  +};
> > >>>  >>  +
> > >>>  >>  +&ehci2 {
> > >>>  >>  +	status =3D "okay";
> > >>>  >>  +};
> > >>>  >>  +
> > >>>  >>  +&ehci3 {
> > >>>  >>  +	status =3D "okay";
> > >>>  >>  +};
> > >>>  >>  +
> > >>>  >>  +&ir {
> > >>>  >>  +	status =3D "okay";
> > >>>  >>  +};
> > >>>  >>  +
> > >>>  >>  +&ohci0 {
> > >>>  >>  +	status =3D "okay";
> > >>>  >>  +};
> > >>>  >>  +
> > >>>  >>  +&ohci1 {
> > >>>  >>  +	status =3D "okay";
> > >>>  >>  +};
> > >>>  >>  +
> > >>>  >>  +&ohci2 {
> > >>>  >>  +	status =3D "okay";
> > >>>  >>  +};
> > >>>  >>  +
> > >>>  >>  +&ohci3 {
> > >>>  >>  +	status =3D "okay";
> > >>>  >>  +};
> > >>>  >>  +
> > >>>  >>  +&spi0 {
> > >>>  >>  +	/* SPI connection for onboard connector for ADXL345 =20
> > >>>=20
> > >>> =7F=7Faccelerometer
> > >>>  =20
> > >>>  > */
> > >>>  >  =20
> > >>>  >>  +	status =3D "okay";
> > >>>  >>  +	pinctrl-names =3D "default";
> > >>>  >>  +	pinctrl-0 =3D <&spi0_pins>, <&spi0_cs0_pin>; =20
> > >>>  >=20
> > >>>  > Driver and compatible for ADXL345 already exists, why don't you =
=20
> > >>>=20
> > >>> =7F=7Fadd
> > >>>  =20
> > >>>  > child node
> > >>>  > for it?
> > >>>  >=20
> > >>>  > Best regards,
> > >>>  > Jernej =20
> > >>> =20
> > >>>  Ah. So the ADXL345 actually wont be driven by kernel. =20
> > >>=20
> > >> DT is hardware description, it's not concerned what is done on
> > >> =7Fsoftware side,
> > >> either kernel or user space. =20
> > >=20
> > > Im aware. But this is not a device that is on the board. Its simply a
> > > connector for the device.
> > > Like Rpi has connectors for camera module :) =20
>=20
> Actually it matters only if this other board is firmly connected with bas=
e=20
> board. If it is not, then SPI node should be dropped and be handled with =
DT=20
> overlays.

So I do understand the reasoning behind not describing those generic pin
header connectors, where people could hook up anything, and use it as a
GPIO or as a special function device, but just wanted to check on this
situation:
Don't we even describe pins dedicated to those custom connectors,
especially if there is an "obvious" external device to connect to? Is it
the same situation like with these FPC camera connectors?

Cheers,
Andre

> > >>>  The SPI connection is enabled so that klipper (3d printer
> > >>>=20
> > >>> firmware) =7F=7Fcan
> > >>>=20
> > >>>  be told to look for ADXL345 at this SPI and use it on its own.
> > >>> =20
> > >>>  Klipper will initialize and communicate with the ADXL on its own. =
=20
> > >>=20
> > >> What do you mean by firmware? User space app? In this case I suppose
> > >> =7Fyou'll use
> > >> direct SPI commands from user space? AFAIK that's less and less
> > >> =7Fsupported by
> > >> kernel (in contrast to I2C). =20
> > >=20
> > > Firmware as in 3d printer firmware. Klipper runs on the board (CB1 or
> > > BTT Pi) and is indeed an userspace app.
> > > And indeed uses direct SPI commands to the device.
> > >=20
> > > The reason for this is the flexibility.
> > > If Klipper read the values from kernel or well from the files the
> > > ADXL driver would create
> > > then it would be unable to communicate with ADXL that is on toolhead
> > > board. Or would have to have
> > > direct initialization either way for those. Thus it just controls the
> > > ADXL itself :)
> > >=20
> > > I understand that this may be bit confusing. If there is still
> > > something not clear im more then happy to explain in
> > > full detail how the userspace and 3D printer communicate :) =20
>=20
> As I said, DT doesn't care about implementation. DT is HW description, so=
=20
> either if it's fixed connection (soldered wires), then describe in full,=
=20
> otherwise it's considered addon board and thus non-essential, so it shoul=
d be=20
> handled with DT overlays.
>=20
> Can be CB1 bought separately from 3D printer package and thus used withou=
t=20
> ADXL sensor?
>=20
> > >=20
> > > Cheers,
> > > Martin. =20
> >=20
> > Hello,
> > Jernej any comments on this ?
> > I would like to resolve this conversation :)
> > We do have a bunch of time before the new cycle but never hurts to get
> > it figured out ahead of time :) =20
>=20
> Sorry, not enough free time over summer.
>=20
> Best regards,
> Jernej
>=20
> >=20
> > Cheers,
> > Martin
> >  =20
> > >> Best regards,
> > >> Jernej
> > >>  =20
> > >>>  >>  +};
> > >>>  >>  +
> > >>>  >>  +&uart0 {
> > >>>  >>  +	pinctrl-names =3D "default";
> > >>>  >>  +	pinctrl-0 =3D <&uart0_ph_pins>;
> > >>>  >>  +	status =3D "okay";
> > >>>  >>  +}; =20
>=20
>=20
>=20
>=20
>=20

