Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0945D8F67
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Aug 2023 16:20:17 +0000 (UTC)
Received: from [192.168.2.144] (bband-dyn221.178-41-211.t-com.sk [178.41.211.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 02D361F55A;
	Sun, 13 Aug 2023 18:20:06 +0200 (CEST)
Date: Sun, 13 Aug 2023 18:20:00 +0200
From: Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH v4 3/4] arm64: dts: allwinner: h616: Add BigTreeTech CB1
 SoM & boards support
To: Jernej =?iso-8859-2?q?=A9krabec?= <jernej.skrabec@gmail.com>
Cc: Martin Botka <martin.botka1@gmail.com>, Martin Botka <martin@biqu3d.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@somainline.org>, Marijn Suijten
	<marijn.suijten@somainline.org>, Jami Kettunen
	<jamipkettunen@somainline.org>, Paul Bouchara <paul.bouchara@somainline.org>,
	Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
	<samuel@sholland.org>, Ludwig Kormann <ludwig.kormann@ict42.de>,
	Icenowy Zheng <uwu@icenowy.me>, Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner
	<heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, Jagan Teki
	<jagan@edgeble.ai>, Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Message-Id: <C18CZR.UPG8WJSWEO3L2@somainline.org>
In-Reply-To: <3249535.44csPzL39Z@jernej-laptop>
References: <20230807145349.2220490-1-martin@biqu3d.com>
	<3017957701F1CF4A+20230807145349.2220490-4-martin@biqu3d.com>
	<3249535.44csPzL39Z@jernej-laptop>
X-Mailer: geary/43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable



On Sun, Aug 13 2023 at 05:52:10 PM +02:00:00, Jernej =A9krabec=20
<jernej.skrabec@gmail.com> wrote:
> Hi Martin,
>=20
> since this will be obviously delayed to 6.7 cycle due to mfd patch=20
> not being
> merged in time, I have few nits below.
>=20
> Dne ponedeljek, 07. avgust 2023 ob 16:53:23 CEST je Martin Botka=20
> napisal(a):
>>  From: Martin Botka <martin.botka@somainline.org>
>>=20
>>  CB1 is Compute Module style board that plugs into Rpi board style=20
>> adapter or
>>  Manta 3D printer boards (M4P/M8P).
>>=20
>>  The SoM features:
>>    - H616 SoC
>>    - 1GiB of RAM
>>    - AXP313A PMIC
>>    - RTL8189FTV WiFi
>>=20
>>  Boards feature:
>>    - 4x USB via USB2 hub (usb1 on SoM).
>>    - SDcard slot for loading images.
>>    - Ethernet port wired to the internal PHY. (100M)
>>    - 2x HDMI 2.0. (Only 1 usable on CB1)
>>    - Power and Status LEDs. (Only Status LED usable on CB1)
>>    - 40 pin GPIO header
>>=20
>>  Currently working:
>>    - Booting
>>    - USB
>>    - UART
>>    - MMC
>>    - Status LED
>>    - WiFi (RTL8189FS via out of tree driver)
>>=20
>>  I didnt want to duplicate things so the manta DTS can also be used=20
>> on BTT
>>  pi4b adapter. CB1 SoM has its own DTSI file in case other boards=20
>> shows up
>>  that accept this SoM.
>>=20
>>  Signed-off-by: Martin Botka <martin.botka@somainline.org>
>>  Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>>  ---
>>  Changes in V2:
>>      - Fixed whitespace errors
>>      - Move UART into carrier boards and BTT Pi
>>      - Remove usb1-vbus regulator
>>      - Fix ranges and naming of AXP313A rails
>>      - Add comment specifying why broken-cd in mmc0 is needed
>>      - Rename sdio_wifi to wifi
>>      - Specify in commit description that USB-OTG doesnt work
>>  Changes in V3:
>>      - Add missed semicolons
>>      - Move model string from dtsi to board dts
>>      - Add cb1 compatible
>>      - Remove extra empty line
>>  Changed in V4:
>>      - Extend the range of vcc-dram to 1.5V (1.35V max caused issues=20
>> with
>>  booting up
>>=20
>>   arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>>   .../sun50i-h616-bigtreetech-cb1-manta.dts     |  35 +++++
>>   .../sun50i-h616-bigtreetech-cb1.dtsi          | 140=20
>> ++++++++++++++++++
>>   3 files changed, 176 insertions(+)
>>   create mode 100644
>>  arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts=20
>> create
>>  mode 100644=20
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
>>=20
>>  diff --git a/arch/arm64/boot/dts/allwinner/Makefile
>>  b/arch/arm64/boot/dts/allwinner/Makefile index=20
>> 6a96494a2e0a..7b386428510b
>>  100644
>>  --- a/arch/arm64/boot/dts/allwinner/Makefile
>>  +++ b/arch/arm64/boot/dts/allwinner/Makefile
>>  @@ -38,5 +38,6 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
>>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64-model-b.dtb
>>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6.dtb
>>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6-mini.dtb
>>  +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-bigtreetech-cb1-manta.dtb
>>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-orangepi-zero2.dtb
>>   dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-x96-mate.dtb
>>  diff --git
>> =20
>> a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts
>> =20
>> b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts=20
>> new
>>  file mode 100644
>>  index 000000000000..dbce61b355d6
>>  --- /dev/null
>>  +++=20
>> b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dts
>>  @@ -0,0 +1,35 @@
>>  +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
>>  +/*
>>  + * Copyright (C) 2023 Martin Botka <martin.botka@somainline.org>.
>>  + */
>>  +
>>  +/dts-v1/;
>>  +
>>  +#include "sun50i-h616-bigtreetech-cb1.dtsi"
>>  +
>>  +/ {
>>  +	model =3D "BigTreeTech CB1";
>>  +	compatible =3D "bigtreetech,cb1-manta", "bigtreetech,cb1",
>>  "allwinner,sun50i-h616"; +
>>  +	aliases {
>>  +		serial0 =3D &uart0;
>>  +	};
>>  +
>>  +	chosen {
>>  +		stdout-path =3D "serial0:115200n8";
>>  +	};
>>  +};
>>  +
>>  +&ehci1 {
>>  +	status =3D "okay";
>>  +};
>>  +
>>  +&ohci1 {
>>  +	status =3D "okay";
>>  +};
>>  +
>>  +&uart0 {
>>  +	pinctrl-names =3D "default";
>>  +	pinctrl-0 =3D <&uart0_ph_pins>;
>>  +	status =3D "okay";
>>  +};
>>  diff --git=20
>> a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
>>  b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi=20
>> new file
>>  mode 100644
>>  index 000000000000..5e756f217813
>>  --- /dev/null
>>  +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi
>>  @@ -0,0 +1,140 @@
>>  +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
>>  +/*
>>  + * Copyright (C) 2023 Martin Botka <martin.botka@somainline.org>.
>>  + */
>>  +
>>  +/dts-v1/;
>>  +
>>  +#include "sun50i-h616.dtsi"
>>  +
>>  +#include <dt-bindings/gpio/gpio.h>
>>  +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>  +#include <dt-bindings/leds/common.h>
>>  +
>>  +/ {
>>  +	aliases {
>>  +		ethernet0 =3D &rtl8189ftv;
>>  +	};
>>  +
>>  +	leds {
>>  +		compatible =3D "gpio-leds";
>>  +
>>  +		led-0 {
>>  +			function =3D LED_FUNCTION_STATUS;
>>  +			color =3D <LED_COLOR_ID_GREEN>;
>>  +			gpios =3D <&pio 7 5 GPIO_ACTIVE_HIGH>; /* PH5
> */
>>  +		};
>>  +	};
>>  +
>>  +	reg_vcc5v: regulator-vcc5v {
>>  +		/* board wide 5V supply from carrier boards */
>>  +		compatible =3D "regulator-fixed";
>>  +		regulator-name =3D "vcc-5v";
>>  +		regulator-min-microvolt =3D <5000000>;
>>  +		regulator-max-microvolt =3D <5000000>;
>>  +		regulator-always-on;
>>  +	};
>>  +
>>  +	reg_vcc33_wifi: vcc33-wifi {
>>  +		/* Always on 3.3V regulator for WiFi */
>=20
> Please drop the comment. It's pretty obvious from properties.
>=20
>>  +		compatible =3D "regulator-fixed";
>>  +		regulator-name =3D "vcc33-wifi";
>>  +		regulator-min-microvolt =3D <3300000>;
>>  +		regulator-max-microvolt =3D <3300000>;
>>  +		regulator-always-on;
>>  +		vin-supply =3D <&reg_vcc5v>;
>>  +	};
>>  +
>>  +	reg_vcc_wifi_io: vcc-wifi-io {
>>  +		/* Always on 1.8V/300mA regulator for WiFi */
>=20
> Ditto.
>=20
> Once fixed, you can add:
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Best regards,
> Jernej
Got it for both comments. Will send V5 tomorrow.

Cheers,
Martin
>=20
>>  +		compatible =3D "regulator-fixed";
>>  +		regulator-name =3D "vcc-wifi-io";
>>  +		regulator-min-microvolt =3D <1800000>;
>>  +		regulator-max-microvolt =3D <1800000>;
>>  +		regulator-always-on;
>>  +		vin-supply =3D <&reg_vcc33_wifi>;
>>  +	};
>>  +
>>  +	wifi_pwrseq: wifi-pwrseq {
>>  +		compatible =3D "mmc-pwrseq-simple";
>>  +		clocks =3D <&rtc 1>;
>>  +		clock-names =3D "ext_clock";
>>  +		reset-gpios =3D <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
>>  +		post-power-on-delay-ms =3D <200>;
>>  +	};
>>  +};
>>  +
>>  +&mmc0 {
>>  +	vmmc-supply =3D <&reg_dldo1>;
>>  +	/* Card detection pin is not connected */
>>  +	broken-cd;
>>  +	bus-width =3D <4>;
>>  +	status =3D "okay";
>>  +};
>>  +
>>  +&mmc1 {
>>  +	vmmc-supply =3D <&reg_vcc33_wifi>;
>>  +	vqmmc-supply =3D <&reg_vcc_wifi_io>;
>>  +	mmc-pwrseq =3D <&wifi_pwrseq>;
>>  +	bus-width =3D <4>;
>>  +	non-removable;
>>  +	mmc-ddr-1_8v;
>>  +	status =3D "okay";
>>  +
>>  +	rtl8189ftv: wifi@1 {
>>  +		reg =3D <1>;
>>  +	};
>>  +};
>>  +
>>  +&r_i2c {
>>  +	status =3D "okay";
>>  +
>>  +	axp313a: pmic@36 {
>>  +		compatible =3D "x-powers,axp313a";
>>  +		reg =3D <0x36>;
>>  +		interrupt-controller;
>>  +		#interrupt-cells =3D <1>;
>>  +
>>  +		regulators{
>>  +			reg_dcdc1: dcdc1 {
>>  +				regulator-name =3D "vdd-gpu-sys";
>>  +				regulator-min-microvolt =3D
> <810000>;
>>  +				regulator-max-microvolt =3D
> <990000>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			reg_dcdc2: dcdc2 {
>>  +				regulator-name =3D "vdd-cpu";
>>  +				regulator-min-microvolt =3D
> <810000>;
>>  +				regulator-max-microvolt =3D
> <1100000>;
>>  +				regulator-ramp-delay =3D <200>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			reg_dcdc3: dcdc3 {
>>  +				regulator-name =3D "vcc-dram";
>>  +				regulator-min-microvolt =3D
> <1350000>;
>>  +				regulator-max-microvolt =3D
> <1500000>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			reg_aldo1: aldo1 {
>>  +				regulator-name =3D "vcc-1v8-pll";
>>  +				regulator-min-microvolt =3D
> <1800000>;
>>  +				regulator-max-microvolt =3D
> <1800000>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			reg_dldo1: dldo1 {
>>  +				regulator-name =3D "vcc-3v3-io";
>>  +				regulator-min-microvolt =3D
> <3300000>;
>>  +				regulator-max-microvolt =3D
> <3300000>;
>>  +				regulator-always-on;
>>  +			};
>>  +		};
>>  +	};
>>  +};
>>  +
>>  +&usbphy {
>>  +	status =3D "okay";
>>  +};
>=20
>=20
>=20
>=20


