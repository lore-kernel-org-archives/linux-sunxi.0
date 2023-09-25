Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389DB219EA
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Sep 2023 16:00:50 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9a645e54806so821545166b.0
        for <linux-sunxi@lists.linux.dev>; Mon, 25 Sep 2023 09:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695657648; x=1696262448; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcmtvdQdPicEDcGlszNx9rRnrYSmjIX0HWs5ydKIZgs=;
        b=LB4B7aE3kyUExUVCDvp+KMW/ZJ42NiH3y8U3/ZP9OpyZl1eR3yXMSPIYNAt4/GOpte
         YP6m5SCMQxIT2L+tiZ6OnX6pTuOq4jKB25ct0fb1s340w6DARW5vDyr/TYWt8xB5ktLx
         C/GXXhHe/tpfqntyAoorXal7C+8XxQo7xW15881gaBW7aT4EmbdNDvOpU8me4Kaus8M1
         OJl4P89vhxumIdT/L0MkNSqCSMfy1QksQl13IuTTJgu1aA7dgHzqx1oKn7fh4YTaNeMs
         AjBSCvZOy473kc0NORdWWj66+1F84QnztMW7FuLNpzwlq87wXeY9cz/bRqX/ghdW+B9N
         khKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695657648; x=1696262448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcmtvdQdPicEDcGlszNx9rRnrYSmjIX0HWs5ydKIZgs=;
        b=uAiFVew/k1Ei/Sc3i+OlKHsbb6wotwxmyAA4swApFIj5BGH7TcZf/iJrlyNtfFwCvB
         eqgfA9Y9X7273mDwfvJ+6OEKm8Zf8b8L8PotgWY0WGzcrfxTda8KZ+Y3DNkxTLlKIjmN
         MzlicGvwLbgdXMnzZUjOwVvSENQ2FOvTsrkwsgDVrZM67KxaMeco/w9YQdnmlHukgrG/
         URdrZMccBkFURsXS6bh1OyE0C4NdzZL0wLCmYKLsZyfKVtPvK2u6qHGQBbv8hovct0E5
         Fy/QSq1DgI9PYgI9p62FVf6/oaQ46D+SYbfk1oM6u4rSpi/KDDcqWq+DnlCpJFZvRZDA
         fBwg==
X-Gm-Message-State: AOJu0YwxrXzFaPW1EtqPT1sk0IUL8hDaulCKEDmEf8nlKULcHAQ38r4G
	sLQhj3cKZhdGf83d7TA6G7c=
X-Google-Smtp-Source: AGHT+IErhKxNzN0hG6MXEuj9dDwVp59pkj0SrqpPXryfHnJUKEr9ZRl2n2zuCGopWm3UaggtK8Uu+g==
X-Received: by 2002:a17:906:748b:b0:9a5:c9a4:ba1b with SMTP id e11-20020a170906748b00b009a5c9a4ba1bmr6605079ejl.8.1695657648143;
        Mon, 25 Sep 2023 09:00:48 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id bv13-20020a170906b1cd00b00993a37aebc5sm6528312ejb.50.2023.09.25.09.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 09:00:47 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>,
 devicetree@vger.kernel.org, mripard@kernel.org, uwu@icenowy.me,
 samuel@sholland.org, wens@csie.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, andre.przywara@arm.com
Subject: Re: [PATCH V5 4/4] ARM: dts: sunxi: add support for Anbernic RG-Nano
Date: Mon, 25 Sep 2023 18:00:46 +0200
Message-ID: <9217807.rMLUfLXkoz@jernej-laptop>
In-Reply-To:
 <SN6PR06MB5342C836DCCD58AA47C7FE33A5FCA@SN6PR06MB5342.namprd06.prod.outlook.com>
References:
 <20230921135136.97491-1-macroalpha82@gmail.com>
 <4860683.31r3eYUQgx@jernej-laptop>
 <SN6PR06MB5342C836DCCD58AA47C7FE33A5FCA@SN6PR06MB5342.namprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne ponedeljek, 25. september 2023 ob 17:00:33 CEST je Chris Morgan napisal=
(a):
> On Sun, Sep 24, 2023 at 09:33:53PM +0200, Jernej =C5=A0krabec wrote:
> > Dne =C4=8Detrtek, 21. september 2023 ob 15:51:36 CEST je Chris Morgan n=
apisal(a):
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > >=20
> > > The Anbernic RG-Nano is a small portable game device based on the
> > > Allwinner V3s SoC. It has GPIO buttons on the face and side for
> > > input, a single mono speaker, a 240x240 SPI controlled display, a USB=
=2DC
> > > OTG port, an SD card slot for booting, and 64MB of RAM included in the
> > > SoC. There does not appear to be a crystal feeding the internal RTC so
> > > it does not keep proper time (for me it ran 8 hours slow in a 24 hour
> > > period). External RTC works just fine.
> > >=20
> > > Working/Tested:
> > > - SDMMC
> > > - UART (for debugging)
> > > - Buttons
> > > - Charging/battery/PMIC
> > > - Speaker
> > > - RTC (external RTC)
> > > - USB
> > > - Display
> > >=20
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > ---
> > >  arch/arm/boot/dts/allwinner/Makefile          |   1 +
> > >  .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 284 ++++++++++++++++=
++
> > >  2 files changed, 285 insertions(+)
> > >  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg=
=2Dnano.dts
> > >=20
> > > diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts=
/allwinner/Makefile
> > > index eebb5a0c873a..2d26c3397f14 100644
> > > --- a/arch/arm/boot/dts/allwinner/Makefile
> > > +++ b/arch/arm/boot/dts/allwinner/Makefile
> > > @@ -256,6 +256,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
> > >  	sun8i-t113s-mangopi-mq-r-t113.dtb \
> > >  	sun8i-t3-cqa3t-bv3.dtb \
> > >  	sun8i-v3-sl631-imx179.dtb \
> > > +	sun8i-v3s-anbernic-rg-nano.dtb \
> > >  	sun8i-v3s-licheepi-zero.dtb \
> > >  	sun8i-v3s-licheepi-zero-dock.dtb \
> > >  	sun8i-v40-bananapi-m2-berry.dtb
> > > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.d=
ts b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > > new file mode 100644
> > > index 000000000000..1a4429dc57b1
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
> > > +		rtc0 =3D &pcf8563;
> > > +		rtc1 =3D &rtc;
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
> > > +			gpios =3D <&gpio_expander 12 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label =3D "BTN-A";
> > > +			linux,code =3D <BTN_EAST>;
> > > +		};
> > > +
> > > +		button-b {
> > > +			gpios =3D <&gpio_expander 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label =3D "BTN-B";
> > > +			linux,code =3D <BTN_SOUTH>;
> > > +		};
> > > +
> > > +		button-down {
> > > +			gpios =3D <&gpio_expander 1 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label =3D "DPAD-DOWN";
> > > +			linux,code =3D <BTN_DPAD_DOWN>;
> > > +		};
> > > +
> > > +		button-left {
> > > +			gpios =3D <&gpio_expander 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label =3D "DPAD-LEFT";
> > > +			linux,code =3D <BTN_DPAD_LEFT>;
> > > +		};
> > > +
> > > +		button-right {
> > > +			gpios =3D <&gpio_expander 0 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label =3D "DPAD-RIGHT";
> > > +			linux,code =3D <BTN_DPAD_RIGHT>;
> > > +		};
> > > +
> > > +		button-se {
> > > +			gpios =3D <&gpio_expander 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label =3D "BTN-SELECT";
> > > +			linux,code =3D <BTN_SELECT>;
> > > +		};
> > > +
> > > +		button-st {
> > > +			gpios =3D <&gpio_expander 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label =3D "BTN-START";
> > > +			linux,code =3D <BTN_START>;
> > > +		};
> > > +
> > > +		button-tl {
> > > +			gpios =3D <&gpio_expander 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label =3D "BTN-L";
> > > +			linux,code =3D <BTN_TL>;
> > > +		};
> > > +
> > > +		button-tr {
> > > +			gpios =3D <&gpio_expander 15 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label =3D "BTN-R";
> > > +			linux,code =3D <BTN_TR>;
> > > +		};
> > > +
> > > +		button-up {
> > > +			gpios =3D <&gpio_expander 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label =3D "DPAD-UP";
> > > +			linux,code =3D <BTN_DPAD_UP>;
> > > +		};
> > > +
> > > +		button-x {
> > > +			gpios =3D <&gpio_expander 11 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label =3D "BTN-X";
> > > +			linux,code =3D <BTN_NORTH>;
> > > +		};
> > > +
> > > +		button-y {
> > > +			gpios =3D <&gpio_expander 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label =3D "BTN-Y";
> > > +			linux,code =3D <BTN_WEST>;
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +&codec {
> > > +	allwinner,audio-routing =3D "Speaker", "HP",
> > > +				  "MIC1", "Mic",
> > > +				  "Mic", "HBIAS";
> > > +	allwinner,pa-gpios =3D <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>=
; /* PF6 */
> > > +	status =3D "okay";
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
> > > +		interrupts =3D <1 5 IRQ_TYPE_EDGE_FALLING>; /* PB5/EINT5 */
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
> > > + * software modified. Note that setting voltage here to 3.3v for acc=
uracy
> > > + * sake causes an issue with the driver that causes it to fail to pr=
obe
> > > + * because of a voltage constraint in the driver.
> > > + */
> >=20
> > Can you please remove any mention of drivers everywhere? DT is OS and=20
> > thus driver independent.
> >=20
> > Once fixed:
> > Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> This note was added due to prior comments because in this very specific
> case we're working around a driver issue. Sadly if I accurately
> describe the hardware the PMIC and devices that depend on it will fail
> to probe (the hardware is 3.3v, but here it's set as 1.3v).
>=20
> https://lore.kernel.org/linux-sunxi/20230629203410.660eb9a4@slackpad.lan/

Sorry, I should follow conversation more closely. Procedure in such cases
is to fix driver first and then submit proper DT file. While DT files
reside in Linux source, they are often used by diferent projects, like
U-Boot or FreeBSD, so we can't make hacks just because Linux driver doesn't
work.

>=20
> Thank you,
> Chris
>=20
> >=20
> > Best regards,
> > Jernej
> >=20
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
> > > +/*
> > > + * Force the driver to use internal oscillator by removing clocks
> > > + * property.
> > > + */

This should be reworded to avoid mentioning driver. Like: "RTC uses
internal oscillator".

Best regards,
Jernej

> > > +&rtc {
> > > +	/delete-property/ clocks;
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
> > > +	usb0_id_det-gpios =3D <&pio 6 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; =
/* PG5 */
> > > +	status =3D "okay";
> > > +};
> > >=20
> >=20
> >=20
> >=20
> >=20
>=20




