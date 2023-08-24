Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496227F
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Aug 2023 20:48:36 +0000 (UTC)
Received: from [192.168.2.144] (bband-dyn198.178-41-58.t-com.sk [178.41.58.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B66B73F291;
	Thu, 24 Aug 2023 22:48:26 +0200 (CEST)
Date: Thu, 24 Aug 2023 22:48:20 +0200
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
Message-Id: <KSXWZR.LZT0IYKM7IPF@somainline.org>
In-Reply-To: <ZBNDZR.IENEPBA0KL4D2@somainline.org>
References: <20230807145349.2220490-1-martin@biqu3d.com>
	<10318766.nUPlyArG6x@jernej-laptop> <168CZR.KVQVUV8KXJ5Y1@somainline.org>
	<9148039.CDJkKcVGEf@jernej-laptop> <ZBNDZR.IENEPBA0KL4D2@somainline.org>
X-Mailer: geary/43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable



On Mon, Aug 14 2023 at 12:47:59 PM +02:00:00, Martin Botka=20
<martin.botka@somainline.org> wrote:
>=20
>=20
> On Mon, Aug 14 2023 at 12:26:07 PM +02:00:00, Jernej =A9krabec=20
> <jernej.skrabec@gmail.com> wrote:
>> Dne nedelja, 13. avgust 2023 ob 18:22:49 CEST je Martin Botka=20
>> =7Fnapisal(a):
>>>  On Sun, Aug 13 2023 at 05:55:35 PM +02:00:00, Jernej =A9krabec
>>>=20
>>>  <jernej.skrabec@gmail.com> wrote:
>>>  > Dne ponedeljek, 07. avgust 2023 ob 16:53:24 CEST je Martin Botka
>>>  >
>>>  > napisal(a):
>>>  >>  The BigTreeTech Pi is an H616 based board based on CB1.
>>>  >>  Just in Rpi format board.
>>>  >>
>>>  >>  It features the same internals as BTT CB1 but adds:
>>>  >>      - Fan port
>>>  >>      - IR receiver
>>>  >>      - ADXL345 Accelerometer connector via SPI
>>>  >>      - 24V DC power supply via terminal plugs
>>>  >>      - USB to CAN module connector (The actual USB to CAN=20
>>> =7F=7Fhappens on
>>>  >>
>>>  >> the
>>>  >>
>>>  >>  external module)
>>>  >>
>>>  >>  List of currently working things is same as BTT CB1 but also:
>>>  >>      - IR receiver
>>>  >>      - ADXL345 connector
>>>  >>
>>>  >>  Signed-off-by: Martin Botka <martin@biqu3d.com>
>>>  >>  Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>>>  >>  ---
>>>  >>
>>>  >>  Changes in V2:
>>>  >>      - Add UART alongside aliases and chosen for it
>>>  >>      - Add model string
>>>  >>      - Enable IR receiver
>>>  >>      - Enable SPI0 for ADXL345 connector
>>>  >>
>>>  >>  Changes in V3:
>>>  >>      - Add missing semicolons
>>>  >>      - Add pinctrl for SPI0
>>>  >>
>>>  >>   arch/arm64/boot/dts/allwinner/Makefile        |  1 +
>>>  >>   .../allwinner/sun50i-h616-bigtreetech-pi.dts  | 70
>>>  >>
>>>  >> +++++++++++++++++++
>>>  >>
>>>  >>   2 files changed, 71 insertions(+)
>>>  >>   create mode 100644
>>>  >>
>>>  >>  arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
>>>  >>
>>>  >>  diff --git a/arch/arm64/boot/dts/allwinner/Makefile
>>>  >>  b/arch/arm64/boot/dts/allwinner/Makefile index
>>>  >>
>>>  >> 7b386428510b..0b6232a7f328
>>>  >>
>>>  >>  100644
>>>  >>  --- a/arch/arm64/boot/dts/allwinner/Makefile
>>>  >>  +++ b/arch/arm64/boot/dts/allwinner/Makefile
>>>  >>  @@ -39,5 +39,6 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D
>>>  >>
>>>  >> sun50i-h6-pine-h64-model-b.dtb
>>>  >>
>>>  >>  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6.dtb
>>>  >>
>>>  >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6-mini.dtb
>>>  >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D=20
>>> =7F=7Fsun50i-h616-bigtreetech-cb1-manta.dtb
>>>  >>
>>>  >>  +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-bigtreetech-pi.dtb
>>>  >>
>>>  >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-orangepi-zero2.dtb
>>>  >>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-x96-mate.dtb
>>>  >>
>>>  >>  diff --git
>>>  >>
>>>  >> a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
>>>  >>
>>>  >>  b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts=20
>>> =7F=7Fnew
>>>  >>
>>>  >> file
>>>  >>
>>>  >>  mode 100644
>>>  >>  index 000000000000..b0d0386e8f13
>>>  >>  --- /dev/null
>>>  >>  +++=20
>>> =7F=7Fb/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
>>>  >>  @@ -0,0 +1,70 @@
>>>  >>  +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
>>>  >>  +/*
>>>  >>  + * Copyright (C) 2023 Martin Botka <martin@biqu3d.com>.
>>>  >>  + */
>>>  >>  +
>>>  >>  +/dts-v1/;
>>>  >>  +
>>>  >>  +#include "sun50i-h616-bigtreetech-cb1.dtsi"
>>>  >>  +
>>>  >>  +/ {
>>>  >>  +	model =3D "BigTreeTech Pi";
>>>  >>  +	compatible =3D "bigtreetech,pi", "allwinner,sun50i-h616";
>>>  >>  +
>>>  >>  +	aliases {
>>>  >>  +		serial0 =3D &uart0;
>>>  >>  +	};
>>>  >>  +
>>>  >>  +	chosen {
>>>  >>  +		stdout-path =3D "serial0:115200n8";
>>>  >>  +	};
>>>  >>  +};
>>>  >>  +
>>>  >>  +&ehci0 {
>>>  >>  +	status =3D "okay";
>>>  >>  +};
>>>  >>  +
>>>  >>  +&ehci1 {
>>>  >>  +	status =3D "okay";
>>>  >>  +};
>>>  >>  +
>>>  >>  +&ehci2 {
>>>  >>  +	status =3D "okay";
>>>  >>  +};
>>>  >>  +
>>>  >>  +&ehci3 {
>>>  >>  +	status =3D "okay";
>>>  >>  +};
>>>  >>  +
>>>  >>  +&ir {
>>>  >>  +	status =3D "okay";
>>>  >>  +};
>>>  >>  +
>>>  >>  +&ohci0 {
>>>  >>  +	status =3D "okay";
>>>  >>  +};
>>>  >>  +
>>>  >>  +&ohci1 {
>>>  >>  +	status =3D "okay";
>>>  >>  +};
>>>  >>  +
>>>  >>  +&ohci2 {
>>>  >>  +	status =3D "okay";
>>>  >>  +};
>>>  >>  +
>>>  >>  +&ohci3 {
>>>  >>  +	status =3D "okay";
>>>  >>  +};
>>>  >>  +
>>>  >>  +&spi0 {
>>>  >>  +	/* SPI connection for onboard connector for ADXL345=20
>>> =7F=7Faccelerometer
>>>  >
>>>  > */
>>>  >
>>>  >>  +	status =3D "okay";
>>>  >>  +	pinctrl-names =3D "default";
>>>  >>  +	pinctrl-0 =3D <&spi0_pins>, <&spi0_cs0_pin>;
>>>  >
>>>  > Driver and compatible for ADXL345 already exists, why don't you=20
>>> =7F=7Fadd
>>>  > child node
>>>  > for it?
>>>  >
>>>  > Best regards,
>>>  > Jernej
>>>=20
>>>  Ah. So the ADXL345 actually wont be driven by kernel.
>>=20
>> DT is hardware description, it's not concerned what is done on=20
>> =7Fsoftware side,
>> either kernel or user space.
> Im aware. But this is not a device that is on the board. Its simply a=20
> connector for the device.
> Like Rpi has connectors for camera module :)
>>=20
>>>  The SPI connection is enabled so that klipper (3d printer=20
>>> firmware) =7F=7Fcan
>>>  be told to look for ADXL345 at this SPI and use it on its own.
>>>=20
>>>  Klipper will initialize and communicate with the ADXL on its own.
>>=20
>> What do you mean by firmware? User space app? In this case I suppose=20
>> =7Fyou'll use
>> direct SPI commands from user space? AFAIK that's less and less=20
>> =7Fsupported by
>> kernel (in contrast to I2C).
> Firmware as in 3d printer firmware. Klipper runs on the board (CB1 or=20
> BTT Pi) and is indeed an userspace app.
> And indeed uses direct SPI commands to the device.
>=20
> The reason for this is the flexibility.
> If Klipper read the values from kernel or well from the files the=20
> ADXL driver would create
> then it would be unable to communicate with ADXL that is on toolhead=20
> board. Or would have to have
> direct initialization either way for those. Thus it just controls the=20
> ADXL itself :)
>=20
> I understand that this may be bit confusing. If there is still=20
> something not clear im more then happy to explain in
> full detail how the userspace and 3D printer communicate :)
>=20
> Cheers,
> Martin.
Hello,
Jernej any comments on this ?
I would like to resolve this conversation :)
We do have a bunch of time before the new cycle but never hurts to get=20
it figured out ahead of time :)

Cheers,
Martin
>>=20
>> Best regards,
>> Jernej
>>=20
>>>=20
>>>  >>  +};
>>>  >>  +
>>>  >>  +&uart0 {
>>>  >>  +	pinctrl-names =3D "default";
>>>  >>  +	pinctrl-0 =3D <&uart0_ph_pins>;
>>>  >>  +	status =3D "okay";
>>>  >>  +};
>>=20
>>=20
>>=20
>>=20
>=20


