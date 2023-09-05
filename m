Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF02DF6B
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Sep 2023 20:49:23 +0000 (UTC)
Received: from [192.168.2.144] (bband-dyn191.178-41-225.t-com.sk [178.41.225.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6D07C1FA74;
	Tue,  5 Sep 2023 22:49:09 +0200 (CEST)
Date: Tue, 05 Sep 2023 22:49:02 +0200
From: Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH v4 4/4] arm64: dts: allwinner: h616: Add BigTreeTech Pi
 support
To: Jernej =?iso-8859-2?q?=A9krabec?= <jernej.skrabec@gmail.com>
Cc: Martin Botka <martin.botka1@gmail.com>, Martin Botka <martin@biqu3d.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@somainline.org>, Marijn Suijten
	<marijn.suijten@somainline.org>, Jami Kettunen
	<jamipkettunen@somainline.org>, Paul Bouchara <paul.bouchara@somainline.org>,
	Andre Przywara <andre.przywara@arm.com>, Martin Botka <martin@biqu3d.com>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
	Ludwig Kormann <ludwig.kormann@ict42.de>, Andrew Lunn <andrew@lunn.ch>,
	Icenowy Zheng <uwu@icenowy.me>, Heiko Stuebner <heiko@sntech.de>, Shawn Guo
	<shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Chris Morgan
	<macromorgan@hotmail.com>, Jagan Teki <jagan@edgeble.ai>, Maxime Ripard
	<mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-Id: <QT5J0S.PQGLBPT74297@somainline.org>
In-Reply-To: <1909632.taCxCBeP46@archlinux>
References: <20230807145349.2220490-1-martin@biqu3d.com>
	<ZBNDZR.IENEPBA0KL4D2@somainline.org> <KSXWZR.LZT0IYKM7IPF@somainline.org>
	<1909632.taCxCBeP46@archlinux>
X-Mailer: geary/43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable



On Tue, Sep 5 2023 at 10:45:27 PM +02:00:00, Jernej =A9krabec=20
<jernej.skrabec@gmail.com> wrote:
> On Thursday, August 24, 2023 10:48:20 PM CEST Martin Botka wrote:
>>  On Mon, Aug 14 2023 at 12:47:59 PM +02:00:00, Martin Botka
>>=20
>>  <martin.botka@somainline.org> wrote:
>>  > On Mon, Aug 14 2023 at 12:26:07 PM +02:00:00, Jernej =A9krabec
>>  >
>>  > <jernej.skrabec@gmail.com> wrote:
>>  >> Dne nedelja, 13. avgust 2023 ob 18:22:49 CEST je Martin Botka
>>  >>
>>  >> =7Fnapisal(a):
>>  >>>  On Sun, Aug 13 2023 at 05:55:35 PM +02:00:00, Jernej =A9krabec
>>  >>>
>>  >>>  <jernej.skrabec@gmail.com> wrote:
>>  >>>  > Dne ponedeljek, 07. avgust 2023 ob 16:53:24 CEST je Martin=20
>> Botka
>>  >>>  >
>>  >>>  > napisal(a):
>>  >>>  >>  The BigTreeTech Pi is an H616 based board based on CB1.
>>  >>>  >>  Just in Rpi format board.
>>  >>>  >>
>>  >>>  >>  It features the same internals as BTT CB1 but adds:
>>  >>>  >>      - Fan port
>>  >>>  >>      - IR receiver
>>  >>>  >>      - ADXL345 Accelerometer connector via SPI
>>  >>>  >>      - 24V DC power supply via terminal plugs
>>  >>>  >>      - USB to CAN module connector (The actual USB to CAN
>>  >>>
>>  >>> =7F=7Fhappens on
>>  >>>
>>  >>>  >> the
>>  >>>  >>
>>  >>>  >>  external module)
>>  >>>  >>
>>  >>>  >>  List of currently working things is same as BTT CB1 but=20
>> also:
>>  >>>  >>      - IR receiver
>>  >>>  >>      - ADXL345 connector
>>  >>>  >>
>>  >>>  >>  Signed-off-by: Martin Botka <martin@biqu3d.com>
>>  >>>  >>  Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>>  >>>  >>  ---
>>  >>>  >>
>>  >>>  >>  Changes in V2:
>>  >>>  >>      - Add UART alongside aliases and chosen for it
>>  >>>  >>      - Add model string
>>  >>>  >>      - Enable IR receiver
>>  >>>  >>      - Enable SPI0 for ADXL345 connector
>>  >>>  >>
>>  >>>  >>  Changes in V3:
>>  >>>  >>      - Add missing semicolons
>>  >>>  >>      - Add pinctrl for SPI0
>>  >>>  >>
>>  >>>  >>   arch/arm64/boot/dts/allwinner/Makefile        |  1 +
>>  >>>  >>   .../allwinner/sun50i-h616-bigtreetech-pi.dts  | 70
>>  >>>  >>
>>  >>>  >> +++++++++++++++++++
>>  >>>  >>
>>  >>>  >>   2 files changed, 71 insertions(+)
>>  >>>  >>   create mode 100644
>>  >>>  >>
>>  >>>  >> =20
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
>>  >>>  >>
>>  >>>  >>  diff --git a/arch/arm64/boot/dts/allwinner/Makefile
>>  >>>  >>  b/arch/arm64/boot/dts/allwinner/Makefile index
>>  >>>  >>
>>  >>>  >> 7b386428510b..0b6232a7f328
>>  >>>  >>
>>  >>>  >>  100644
>>  >>>  >>  --- a/arch/arm64/boot/dts/allwinner/Makefile
>>  >>>  >>  +++ b/arch/arm64/boot/dts/allwinner/Makefile
>>  >>>  >>  @@ -39,5 +39,6 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D
>>  >>>  >>
>>  >>>  >> sun50i-h6-pine-h64-model-b.dtb
>>  >>>  >>
>>  >>>  >>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6.dtb
>>  >>>  >>
>>  >>>  >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6-mini.dtb
>>  >>>  >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D
>>  >>>
>>  >>> =7F=7Fsun50i-h616-bigtreetech-cb1-manta.dtb
>>  >>>
>>  >>>  >>  +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-bigtreetech-pi.dtb
>>  >>>  >>
>>  >>>  >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-orangepi-zero2.dtb
>>  >>>  >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-x96-mate.dtb
>>  >>>  >>
>>  >>>  >>  diff --git
>>  >>>  >>
>>  >>>  >>=20
>> a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
>>  >>>  >>
>>  >>>  >> =20
>> b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
>>  >>>
>>  >>> =7F=7Fnew
>>  >>>
>>  >>>  >> file
>>  >>>  >>
>>  >>>  >>  mode 100644
>>  >>>  >>  index 000000000000..b0d0386e8f13
>>  >>>  >>  --- /dev/null
>>  >>>  >>  +++
>>  >>>
>>  >>> =7F=7Fb/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dt=
s
>>  >>>
>>  >>>  >>  @@ -0,0 +1,70 @@
>>  >>>  >>  +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
>>  >>>  >>  +/*
>>  >>>  >>  + * Copyright (C) 2023 Martin Botka <martin@biqu3d.com>.
>>  >>>  >>  + */
>>  >>>  >>  +
>>  >>>  >>  +/dts-v1/;
>>  >>>  >>  +
>>  >>>  >>  +#include "sun50i-h616-bigtreetech-cb1.dtsi"
>>  >>>  >>  +
>>  >>>  >>  +/ {
>>  >>>  >>  +	model =3D "BigTreeTech Pi";
>>  >>>  >>  +	compatible =3D "bigtreetech,pi", "allwinner,sun50i-h616";
>>  >>>  >>  +
>>  >>>  >>  +	aliases {
>>  >>>  >>  +		serial0 =3D &uart0;
>>  >>>  >>  +	};
>>  >>>  >>  +
>>  >>>  >>  +	chosen {
>>  >>>  >>  +		stdout-path =3D "serial0:115200n8";
>>  >>>  >>  +	};
>>  >>>  >>  +};
>>  >>>  >>  +
>>  >>>  >>  +&ehci0 {
>>  >>>  >>  +	status =3D "okay";
>>  >>>  >>  +};
>>  >>>  >>  +
>>  >>>  >>  +&ehci1 {
>>  >>>  >>  +	status =3D "okay";
>>  >>>  >>  +};
>>  >>>  >>  +
>>  >>>  >>  +&ehci2 {
>>  >>>  >>  +	status =3D "okay";
>>  >>>  >>  +};
>>  >>>  >>  +
>>  >>>  >>  +&ehci3 {
>>  >>>  >>  +	status =3D "okay";
>>  >>>  >>  +};
>>  >>>  >>  +
>>  >>>  >>  +&ir {
>>  >>>  >>  +	status =3D "okay";
>>  >>>  >>  +};
>>  >>>  >>  +
>>  >>>  >>  +&ohci0 {
>>  >>>  >>  +	status =3D "okay";
>>  >>>  >>  +};
>>  >>>  >>  +
>>  >>>  >>  +&ohci1 {
>>  >>>  >>  +	status =3D "okay";
>>  >>>  >>  +};
>>  >>>  >>  +
>>  >>>  >>  +&ohci2 {
>>  >>>  >>  +	status =3D "okay";
>>  >>>  >>  +};
>>  >>>  >>  +
>>  >>>  >>  +&ohci3 {
>>  >>>  >>  +	status =3D "okay";
>>  >>>  >>  +};
>>  >>>  >>  +
>>  >>>  >>  +&spi0 {
>>  >>>  >>  +	/* SPI connection for onboard connector for ADXL345
>>  >>>
>>  >>> =7F=7Faccelerometer
>>  >>>
>>  >>>  > */
>>  >>>  >
>>  >>>  >>  +	status =3D "okay";
>>  >>>  >>  +	pinctrl-names =3D "default";
>>  >>>  >>  +	pinctrl-0 =3D <&spi0_pins>, <&spi0_cs0_pin>;
>>  >>>  >
>>  >>>  > Driver and compatible for ADXL345 already exists, why don't=20
>> you
>>  >>>
>>  >>> =7F=7Fadd
>>  >>>
>>  >>>  > child node
>>  >>>  > for it?
>>  >>>  >
>>  >>>  > Best regards,
>>  >>>  > Jernej
>>  >>>
>>  >>>  Ah. So the ADXL345 actually wont be driven by kernel.
>>  >>
>>  >> DT is hardware description, it's not concerned what is done on
>>  >> =7Fsoftware side,
>>  >> either kernel or user space.
>>  >
>>  > Im aware. But this is not a device that is on the board. Its=20
>> simply a
>>  > connector for the device.
>>  > Like Rpi has connectors for camera module :)
>=20
> Actually it matters only if this other board is firmly connected with=20
> base
> board. If it is not, then SPI node should be dropped and be handled=20
> with DT
> overlays.
Got it. Will drop it then.
>=20
>>  >
>>  >>>  The SPI connection is enabled so that klipper (3d printer
>>  >>>
>>  >>> firmware) =7F=7Fcan
>>  >>>
>>  >>>  be told to look for ADXL345 at this SPI and use it on its own.
>>  >>>
>>  >>>  Klipper will initialize and communicate with the ADXL on its=20
>> own.
>>  >>
>>  >> What do you mean by firmware? User space app? In this case I=20
>> suppose
>>  >> =7Fyou'll use
>>  >> direct SPI commands from user space? AFAIK that's less and less
>>  >> =7Fsupported by
>>  >> kernel (in contrast to I2C).
>>  >
>>  > Firmware as in 3d printer firmware. Klipper runs on the board=20
>> (CB1 or
>>  > BTT Pi) and is indeed an userspace app.
>>  > And indeed uses direct SPI commands to the device.
>>  >
>>  > The reason for this is the flexibility.
>>  > If Klipper read the values from kernel or well from the files the
>>  > ADXL driver would create
>>  > then it would be unable to communicate with ADXL that is on=20
>> toolhead
>>  > board. Or would have to have
>>  > direct initialization either way for those. Thus it just controls=20
>> the
>>  > ADXL itself :)
>>  >
>>  > I understand that this may be bit confusing. If there is still
>>  > something not clear im more then happy to explain in
>>  > full detail how the userspace and 3D printer communicate :)
>=20
> As I said, DT doesn't care about implementation. DT is HW=20
> description, so
> either if it's fixed connection (soldered wires), then describe in=20
> full,
> otherwise it's considered addon board and thus non-essential, so it=20
> should be
> handled with DT overlays.
OK
>=20
> Can be CB1 bought separately from 3D printer package and thus used=20
> without
> ADXL sensor?
Yes
>=20
>>  >
>>  > Cheers,
>>  > Martin.
>>=20
>>  Hello,
>>  Jernej any comments on this ?
>>  I would like to resolve this conversation :)
>>  We do have a bunch of time before the new cycle but never hurts to=20
>> get
>>  it figured out ahead of time :)
>=20
> Sorry, not enough free time over summer.
No worries :)

Cheers,
Martin
>=20
> Best regards,
> Jernej
>=20
>>=20
>>  Cheers,
>>  Martin
>>=20
>>  >> Best regards,
>>  >> Jernej
>>  >>
>>  >>>  >>  +};
>>  >>>  >>  +
>>  >>>  >>  +&uart0 {
>>  >>>  >>  +	pinctrl-names =3D "default";
>>  >>>  >>  +	pinctrl-0 =3D <&uart0_ph_pins>;
>>  >>>  >>  +	status =3D "okay";
>>  >>>  >>  +};
>=20
>=20
>=20
>=20


