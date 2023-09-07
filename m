Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C0012B76
	for <linux-sunxi@lists.linux.dev>; Thu,  7 Sep 2023 15:48:31 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2bf5bf33bcdso11839851fa.0
        for <linux-sunxi@lists.linux.dev>; Thu, 07 Sep 2023 08:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694101709; x=1694706509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzE2NW/x+YNiqb7I85ED58UMROv30QgMqxZtkdTd0+U=;
        b=VETapNBnbIgtYCt1MLhMSNopTJvbX2X9kYifg/FnyK9UvLZH73WWx3iBEmXY5ik35V
         EdzqPdrA9ZVeQb6eYu/7UM88ejEWklmPjnVjVVgJQ1IQCDVkARCiY5yZ3zwyniSE4Bn0
         Pqjn7GmgmhjjU0Gm/eUGvghsADnrmJ/0HuPqjhvXKI35BtVrjITK5aTlYgDOpT+8V8tW
         pWw0gyEYlh6vunqbucTwwkulfJsz0ly9pPkdooOF/m+AEatw/LqaXdcyxWv8G+W3zFPY
         xlZqAReRwRs4wFSKvInOvIfrn1v7JUlMbLCYdTiFCxy12vKaba9Y0g++/gAXPn88dHuU
         JFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694101709; x=1694706509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzE2NW/x+YNiqb7I85ED58UMROv30QgMqxZtkdTd0+U=;
        b=Bgj4bjQorIpE6e78K/cjsG8OcbnEbcc4PeXOeGzuNAlZ6zSGaD4/QHOswdcyDc4goQ
         3FnaYyAMGwXPWimVCl18cWES2ffsMsW6z1o5cw1rUEM1h/dcVJY+MMBWSgDLtFLpjQ1h
         QTwYbbybAW9KHmqEPRXWcelk+VVli9A7FI40J9dR9n2KyvuEAGHO6XXFZxkYlJiXdEVy
         LPf69Qdf4IKiWPPuVoG1dQTSW57wh4bN1ihxhjZ2Dm3n+qP7t/Hca4icVZ1jYRknQQrZ
         +/iKTQWPrds/fhTIkMruBoUMF52dcv7P6mDliMMgnP0ZRq4gpaQyzL7fGThVwqlTzHrw
         Ck3g==
X-Gm-Message-State: AOJu0YzoN+9SFrXzELZn41+hrdQQ4QADFWWJC/nSuyMBWlnkRtgvmUsS
	xrUs4WxaCeqYrs5Lljgucv0=
X-Google-Smtp-Source: AGHT+IGE0ZgaGx3rxqBvTKVfc1zwjejt0WfNTsMUzyhcB6JThFIl/xIDB8OmVWMGPSP8S3ATUkW9zQ==
X-Received: by 2002:a2e:8805:0:b0:2bc:d33e:ccc5 with SMTP id x5-20020a2e8805000000b002bcd33eccc5mr5226697ljh.41.1694101709064;
        Thu, 07 Sep 2023 08:48:29 -0700 (PDT)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id oz13-20020a170906cd0d00b00992f309cfe8sm10656956ejb.178.2023.09.07.08.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 08:48:28 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 airlied@gmail.com, andre.przywara@arm.com, conor+dt@kernel.org,
 daniel@ffwll.ch, heiko@sntech.de, jagan@edgeble.ai,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org,
 neil.armstrong@linaro.org, noralf@tronnes.org, robh+dt@kernel.org,
 sam@ravnborg.org, samuel@sholland.org, uwu@icenowy.me, wens@csie.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V4 8/8] ARM: dts: sunxi: add support for Anbernic RG-Nano
Date: Thu, 07 Sep 2023 17:48:27 +0200
Message-ID: <45790713.fMDQidcC6G@archlinux>
In-Reply-To: <64f9eea7.ca0a0220.bbe66.12c3@mx.google.com>
References:
 <20230828181941.1609894-1-macroalpha82@gmail.com>
 <5865585.MhkbZ0Pkbq@archlinux> <64f9eea7.ca0a0220.bbe66.12c3@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Thursday, September 7, 2023 5:39:17 PM CEST Chris Morgan wrote:
> On Tue, Sep 05, 2023 at 10:32:33PM +0200, Jernej =C5=A0krabec wrote:
> > On Monday, August 28, 2023 8:19:41 PM CEST Chris Morgan wrote:
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > >=20
> > > The Anbernic RG-Nano is a small portable game device based on the
> > > Allwinner V3s SoC. It has GPIO buttons on the face and side for
> > > input, a single mono speaker, a 240x240 SPI controlled display, a USB=
=2DC
> > > OTG port, an SD card slot for booting, and 64MB of RAM included in the
> > > SoC.
> > >=20
> > > Working/Tested:
> > > - SDMMC
> > > - UART (for debugging)
> > > - Buttons
> > > - Charging/battery/PMIC
> > > - Speaker
> > > - RTC
> > > - USB Host and Gadget*
> > > - Display (at 60hz)
> > >=20
> > > *There is an issue with the usb_phy where it forces the device to host
> > > mode. Until the phy driver is fixed this can be bypassed by either
> > > removing the phy references from the ohci and ehci nodes or by setting
> > > the usbphy on the ohci and ehci nodes to 1 (which is incorrect).
> >=20
> > DT is HW description, so driver independent and above comment should be
> > removed from commit message.
> >=20
> > Otherwise:
> > Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >=20
> > Best regards,
> > Jernej
>=20
> Should I resubmit with the text removed, or can it be edited before
> being sent upstream?

It can be edited if nothing else pops up. In any case, it will be applied=20
after 6.6-rc1 is released.

Best regards,
Jernej

>=20
> Thank you.
>=20
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > ---
> > >=20
> > >  arch/arm/boot/dts/allwinner/Makefile          |   1 +
> > >  .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 284 ++++++++++++++++=
++
> > >  2 files changed, 285 insertions(+)
> > >  create mode 100644
> > >=20
> > > arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > >=20
> > > diff --git a/arch/arm/boot/dts/allwinner/Makefile
> > > b/arch/arm/boot/dts/allwinner/Makefile index 589a1ce1120a..2be83a1edc=
bb
> > > 100644
> > > --- a/arch/arm/boot/dts/allwinner/Makefile
> > > +++ b/arch/arm/boot/dts/allwinner/Makefile
> > > @@ -237,6 +237,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
> > >=20
> > >  	sun8i-t113s-mangopi-mq-r-t113.dtb \
> > >  	sun8i-t3-cqa3t-bv3.dtb \
> > >  	sun8i-v3-sl631-imx179.dtb \
> > >=20
> > > +	sun8i-v3s-anbernic-rg-nano.dtb \
> > >=20
> > >  	sun8i-v3s-licheepi-zero.dtb \
> > >  	sun8i-v3s-licheepi-zero-dock.dtb \
> > >  	sun8i-v40-bananapi-m2-berry.dtb
> > >=20
> > > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.d=
ts
> > > b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts new file
> > > mode
> > > 100644
> > > index 000000000000..bcccb0d3f9ce
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > > @@ -0,0 +1,284 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +
> > > +/dts-v1/;
> > > +#include <dt-bindings/input/linux-event-codes.h>
> > > +#include "sun8i-v3s.dtsi"
> > > +#include "sunxi-common-regulators.dtsi"
> > > +
> > > +/ {
> > > +	model =3D "Anbernic RG Nano";
> > > +	compatible =3D "anbernic,rg-nano", "allwinner,sun8i-v3s";
> > > +
> > > +	aliases {
> > > +		serial0 =3D &uart0;
> > > +	};
> > > +
> > > +	backlight: backlight {
> > > +		compatible =3D "pwm-backlight";
> > > +		brightness-levels =3D <0 1 2 3 8 14 21 32 46 60 80 100>;
> > > +		default-brightness-level =3D <11>;
> > > +		power-supply =3D <&reg_vcc5v0>;
> > > +		pwms =3D <&pwm 0 40000 1>;
> > > +	};
> > > +
> > > +	chosen {
> > > +		stdout-path =3D "serial0:115200n8";
> > > +	};
> > > +
> > > +	gpio_keys: gpio-keys {
> > > +		compatible =3D "gpio-keys";
> > > +
> > > +		button-a {
> > > +			gpios =3D <&gpio_expander 12 (GPIO_ACTIVE_LOW=20
|
> >=20
> > GPIO_PULL_UP)>;
> >=20
> > > +			label =3D "BTN-A";
> > > +			linux,code =3D <BTN_EAST>;
> > > +		};
> > > +
> > > +		button-b {
> > > +			gpios =3D <&gpio_expander 14 (GPIO_ACTIVE_LOW=20
|
> >=20
> > GPIO_PULL_UP)>;
> >=20
> > > +			label =3D "BTN-B";
> > > +			linux,code =3D <BTN_SOUTH>;
> > > +		};
> > > +
> > > +		button-down {
> > > +			gpios =3D <&gpio_expander 1 (GPIO_ACTIVE_LOW |
> >=20
> > GPIO_PULL_UP)>;
> >=20
> > > +			label =3D "DPAD-DOWN";
> > > +			linux,code =3D <BTN_DPAD_DOWN>;
> > > +		};
> > > +
> > > +		button-left {
> > > +			gpios =3D <&gpio_expander 4 (GPIO_ACTIVE_LOW |
> >=20
> > GPIO_PULL_UP)>;
> >=20
> > > +			label =3D "DPAD-LEFT";
> > > +			linux,code =3D <BTN_DPAD_LEFT>;
> > > +		};
> > > +
> > > +		button-right {
> > > +			gpios =3D <&gpio_expander 0 (GPIO_ACTIVE_LOW |
> >=20
> > GPIO_PULL_UP)>;
> >=20
> > > +			label =3D "DPAD-RIGHT";
> > > +			linux,code =3D <BTN_DPAD_RIGHT>;
> > > +		};
> > > +
> > > +		button-se {
> > > +			gpios =3D <&gpio_expander 7 (GPIO_ACTIVE_LOW |
> >=20
> > GPIO_PULL_UP)>;
> >=20
> > > +			label =3D "BTN-SELECT";
> > > +			linux,code =3D <BTN_SELECT>;
> > > +		};
> > > +
> > > +		button-st {
> > > +			gpios =3D <&gpio_expander 6 (GPIO_ACTIVE_LOW |
> >=20
> > GPIO_PULL_UP)>;
> >=20
> > > +			label =3D "BTN-START";
> > > +			linux,code =3D <BTN_START>;
> > > +		};
> > > +
> > > +		button-tl {
> > > +			gpios =3D <&gpio_expander 2 (GPIO_ACTIVE_LOW |
> >=20
> > GPIO_PULL_UP)>;
> >=20
> > > +			label =3D "BTN-L";
> > > +			linux,code =3D <BTN_TL>;
> > > +		};
> > > +
> > > +		button-tr {
> > > +			gpios =3D <&gpio_expander 15 (GPIO_ACTIVE_LOW=20
|
> >=20
> > GPIO_PULL_UP)>;
> >=20
> > > +			label =3D "BTN-R";
> > > +			linux,code =3D <BTN_TR>;
> > > +		};
> > > +
> > > +		button-up {
> > > +			gpios =3D <&gpio_expander 3 (GPIO_ACTIVE_LOW |
> >=20
> > GPIO_PULL_UP)>;
> >=20
> > > +			label =3D "DPAD-UP";
> > > +			linux,code =3D <BTN_DPAD_UP>;
> > > +		};
> > > +
> > > +		button-x {
> > > +			gpios =3D <&gpio_expander 11 (GPIO_ACTIVE_LOW=20
|
> >=20
> > GPIO_PULL_UP)>;
> >=20
> > > +			label =3D "BTN-X";
> > > +			linux,code =3D <BTN_NORTH>;
> > > +		};
> > > +
> > > +		button-y {
> > > +			gpios =3D <&gpio_expander 13 (GPIO_ACTIVE_LOW=20
|
> >=20
> > GPIO_PULL_UP)>;
> >=20
> > > +			label =3D "BTN-Y";
> > > +			linux,code =3D <BTN_WEST>;
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +&ccu {
> > > +	clocks =3D <&osc24M>, <&osc32k>;
> > > +};
> > > +
> > > +&codec {
> > > +	allwinner,audio-routing =3D "Speaker", "HP",
> > > +				  "MIC1", "Mic",
> > > +				  "Mic", "HBIAS";
> > > +	allwinner,pa-gpios =3D <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
> >=20
> > /* PF6
> >=20
> > > */ +	status =3D "okay";
> > > +};
> > > +
> > > +&ehci {
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&i2c0 {
> > > +	status =3D "okay";
> > > +
> > > +	gpio_expander: gpio@20 {
> > > +		compatible =3D "nxp,pcal6416";
> > > +		reg =3D <0x20>;
> > > +		gpio-controller;
> > > +		#gpio-cells =3D <2>;
> > > +		#interrupt-cells =3D <2>;
> > > +		interrupt-controller;
> > > +		interrupt-parent =3D <&pio>;
> > > +		interrupts =3D <1 3 IRQ_TYPE_EDGE_BOTH>; /* PB3/EINT3 */
> > > +		vcc-supply =3D <&reg_vcc3v3>;
> > > +	};
> > > +
> > > +	axp209: pmic@34 {
> > > +		reg =3D <0x34>;
> > > +		interrupt-parent =3D <&pio>;
> > > +		interrupts =3D <1 5 IRQ_TYPE_EDGE_FALLING>; /* PB5/EINT5
> >=20
> > */
> >=20
> > > +	};
> > > +
> > > +	pcf8563: rtc@51 {
> > > +		compatible =3D "nxp,pcf8563";
> > > +		reg =3D <0x51>;
> > > +	};
> > > +};
> > > +
> > > +#include "axp209.dtsi"
> > > +
> > > +&battery_power_supply {
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&mmc0 {
> > > +	broken-cd;
> > > +	bus-width =3D <4>;
> > > +	disable-wp;
> > > +	vmmc-supply =3D <&reg_vcc3v3>;
> > > +	vqmmc-supply =3D <&reg_vcc3v3>;
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&ohci {
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&pio {
> > > +	clocks =3D <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
> > > +	vcc-pb-supply =3D <&reg_vcc3v3>;
> > > +	vcc-pc-supply =3D <&reg_vcc3v3>;
> > > +	vcc-pf-supply =3D <&reg_vcc3v3>;
> > > +	vcc-pg-supply =3D <&reg_vcc3v3>;
> > > +
> > > +	spi0_no_miso_pins: spi0-no-miso-pins {
> > > +		pins =3D "PC1", "PC2", "PC3";
> > > +		function =3D "spi0";
> > > +	};
> > > +};
> > > +
> > > +&pwm {
> > > +	pinctrl-0 =3D <&pwm0_pin>;
> > > +	pinctrl-names =3D "default";
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +/* DCDC2 wired into vdd-cpu, vdd-sys, and vdd-ephy. */
> > > +&reg_dcdc2 {
> > > +	regulator-always-on;
> > > +	regulator-max-microvolt =3D <1250000>;
> > > +	regulator-min-microvolt =3D <1250000>;
> > > +	regulator-name =3D "vdd-cpu";
> > > +};
> > > +
> > > +/* DCDC3 wired into every 3.3v input that isn't the RTC. */
> > > +&reg_dcdc3 {
> > > +	regulator-always-on;
> > > +	regulator-max-microvolt =3D <3300000>;
> > > +	regulator-min-microvolt =3D <3300000>;
> > > +	regulator-name =3D "vcc-io";
> > > +};
> > > +
> > > +/*
> > > + * LDO1 wired into RTC, voltage is hard-wired at 3.3v and cannot be
> > > + * software modified. Note that setting voltage here to 3.3v for
> > > accuracy
> > > + * sake causes an issue with the driver that causes it to fail to pr=
obe
> > > + * because of a voltage constraint in the driver.
> > > + */
> > > +&reg_ldo1 {
> > > +	regulator-always-on;
> > > +	regulator-name =3D "vcc-rtc";
> > > +};
> > > +
> > > +/* LDO2 wired into VCC-PLL and audio codec. */
> > > +&reg_ldo2 {
> > > +	regulator-always-on;
> > > +	regulator-max-microvolt =3D <3000000>;
> > > +	regulator-min-microvolt =3D <3000000>;
> > > +	regulator-name =3D "vcc-pll";
> > > +};
> > > +
> > > +/* LDO3, LDO4, and LDO5 unused. */
> > > +&reg_ldo3 {
> > > +	status =3D "disabled";
> > > +};
> > > +
> > > +&reg_ldo4 {
> > > +	status =3D "disabled";
> > > +};
> > > +
> > > +/* External RTC used instead, internal RTC runs fast. */
> > > +&rtc {
> > > +	status =3D "disabled";
> > > +};
> > > +
> > > +&spi0 {
> > > +	pinctrl-0 =3D <&spi0_no_miso_pins>;
> > > +	pinctrl-names =3D "default";
> > > +	status =3D "okay";
> > > +
> > > +	display@0 {
> > > +		compatible =3D "saef,sftc154b", "panel-mipi-dbi-spi";
> > > +		reg =3D <0>;
> > > +		backlight =3D <&backlight>;
> > > +		dc-gpios =3D <&pio 2 0 GPIO_ACTIVE_HIGH>; /* PC0 */
> > > +		reset-gpios =3D <&pio 1 2 GPIO_ACTIVE_HIGH>; /* PB2 */
> > > +		spi-max-frequency =3D <100000000>;
> > > +
> > > +		height-mm =3D <39>;
> > > +		width-mm =3D <39>;
> > > +
> > > +		/* Set hb-porch to compensate for non-visible area */
> > > +		panel-timing {
> > > +			hactive =3D <240>;
> > > +			vactive =3D <240>;
> > > +			hback-porch =3D <80>;
> > > +			vback-porch =3D <0>;
> > > +			clock-frequency =3D <0>;
> > > +			hfront-porch =3D <0>;
> > > +			hsync-len =3D <0>;
> > > +			vfront-porch =3D <0>;
> > > +			vsync-len =3D <0>;
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +&uart0 {
> > > +	pinctrl-0 =3D <&uart0_pb_pins>;
> > > +	pinctrl-names =3D "default";
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&usb_otg {
> > > +	dr_mode =3D "otg";
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&usb_power_supply {
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&usbphy {
> > > +	usb0_id_det-gpios =3D <&pio 6 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /
*
> >=20
> > PG5 */
> >=20
> > > +	status =3D "okay";
> > > +};




