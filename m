Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2953E28692
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Sep 2023 17:53:18 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40528376459so119493285e9.3
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Sep 2023 10:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695837197; x=1696441997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1wVUuLdJyTDbyEhe+RQWq8qbG4VwyUxAevJxJSIPOE=;
        b=VJwy9pK8ZKyEMiHUdItS3O6OeajtqPCQwy7HEweii6oyrACQ3ePyedMZGvacjNMFDJ
         QAEsDuFM42uCyDkM0mS8CHBU2WncZHv+3wQKoymmpFN9Hf468dP64rbotl92T7i0hiqd
         h+JBTwrNeKyeQ89kDtK5yXks7Eo0thQJuYCktbpTJQIPbQ9+IEbCR29kPVaLO3823sZk
         b0cIAyVvdz2xiuBiGeirOMIE/PkR8H2V48rAX1j1S3wZ35FfJrNpG1oRkrWRmGa6RX8O
         Pgh+fJ3MjAcP1sp1wXNDAKTxIdqhU/tLXjYD5Xje6VBlXNPZ4dPaZ6aasHu+preKsUGV
         jnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695837197; x=1696441997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1wVUuLdJyTDbyEhe+RQWq8qbG4VwyUxAevJxJSIPOE=;
        b=xICRUKh8IRaxYM+jlng9pkpHb6X3GHRbBAJI8nGLsZ2NGdvGlYaFLk8muqUyXGf6UT
         wQznifKMlNoiLKKUsAnFwNLhfc30r77DCQ3MvApno0BRPzvklCTLOpdup4W8AINXWmcm
         i7aCXGOpK07c0anWTB87f7PbzmLNlblIWOYlaqDwbKKMun7RHU7JVTKntHlCR8BPoMfQ
         nG+fej5xc1ry4FU3FGQCaIl0CrkXuTg8INu4uKMeaNNLMFwP2XrycnRwrRnApoGDTgRF
         GFo+oE/H3sPrjUAOPj891AxMWGYljnUbsiyPWvykjm0wH6Jth1GNNdqUlaTXTHUHuUPZ
         tjpA==
X-Gm-Message-State: AOJu0Yx1FW1uoNMmzIFzwD9AtYCDqYOlm37roemRQKNqQk5Owvls/jYi
	HemykQKupDCsj2YFerHekRo=
X-Google-Smtp-Source: AGHT+IHd1IqFOJn/UDvP6MNE3yLmOcgQwBFTzdWE9IKOIXNaWopt4aLTtKUqGLdOqp4nuTOyTkNG+Q==
X-Received: by 2002:a7b:c4cb:0:b0:405:a30:151e with SMTP id g11-20020a7bc4cb000000b004050a30151emr2689935wmk.12.1695837197021;
        Wed, 27 Sep 2023 10:53:17 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id y2-20020a7bcd82000000b00403bbe69629sm18250277wmj.31.2023.09.27.10.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 10:53:16 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>,
 devicetree@vger.kernel.org, mripard@kernel.org, uwu@icenowy.me,
 samuel@sholland.org, wens@csie.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, andre.przywara@arm.com
Subject: Re: [PATCH V5 4/4] ARM: dts: sunxi: add support for Anbernic RG-Nano
Date: Wed, 27 Sep 2023 19:53:16 +0200
Message-ID: <5797841.DvuYhMxLoT@jernej-laptop>
In-Reply-To:
 <SN6PR06MB5342313BDE341C6F17DB7557A5C2A@SN6PR06MB5342.namprd06.prod.outlook.com>
References:
 <20230921135136.97491-1-macroalpha82@gmail.com>
 <9217807.rMLUfLXkoz@jernej-laptop>
 <SN6PR06MB5342313BDE341C6F17DB7557A5C2A@SN6PR06MB5342.namprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne sreda, 27. september 2023 ob 16:14:03 CEST je Chris Morgan napisal(a):
> On Mon, Sep 25, 2023 at 06:00:46PM +0200, Jernej =C5=A0krabec wrote:
> > Dne ponedeljek, 25. september 2023 ob 17:00:33 CEST je Chris Morgan nap=
isal(a):
> > > On Sun, Sep 24, 2023 at 09:33:53PM +0200, Jernej =C5=A0krabec wrote:
> > > > Dne =C4=8Detrtek, 21. september 2023 ob 15:51:36 CEST je Chris Morg=
an napisal(a):
> > > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > >=20
> > > > > The Anbernic RG-Nano is a small portable game device based on the
> > > > > Allwinner V3s SoC. It has GPIO buttons on the face and side for
> > > > > input, a single mono speaker, a 240x240 SPI controlled display, a=
 USB-C
> > > > > OTG port, an SD card slot for booting, and 64MB of RAM included i=
n the
> > > > > SoC. There does not appear to be a crystal feeding the internal R=
TC so
> > > > > it does not keep proper time (for me it ran 8 hours slow in a 24 =
hour
> > > > > period). External RTC works just fine.
> > > > >=20
> > > > > Working/Tested:
> > > > > - SDMMC
> > > > > - UART (for debugging)
> > > > > - Buttons
> > > > > - Charging/battery/PMIC
> > > > > - Speaker
> > > > > - RTC (external RTC)
> > > > > - USB
> > > > > - Display
> > > > >=20
> > > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > > ---
> > > > >  arch/arm/boot/dts/allwinner/Makefile          |   1 +
> > > > >  .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 284 ++++++++++++=
++++++
> > > > >  2 files changed, 285 insertions(+)
> > > > >  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-anberni=
c-rg-nano.dts
> > > > >=20
> > > > > diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot=
/dts/allwinner/Makefile
> > > > > index eebb5a0c873a..2d26c3397f14 100644
> > > > > --- a/arch/arm/boot/dts/allwinner/Makefile
> > > > > +++ b/arch/arm/boot/dts/allwinner/Makefile
> > > > > @@ -256,6 +256,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
> > > > >  	sun8i-t113s-mangopi-mq-r-t113.dtb \
> > > > >  	sun8i-t3-cqa3t-bv3.dtb \
> > > > >  	sun8i-v3-sl631-imx179.dtb \
> > > > > +	sun8i-v3s-anbernic-rg-nano.dtb \
> > > > >  	sun8i-v3s-licheepi-zero.dtb \
> > > > >  	sun8i-v3s-licheepi-zero-dock.dtb \
> > > > >  	sun8i-v40-bananapi-m2-berry.dtb
> > > > > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-na=
no.dts b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > > > > new file mode 100644
> > > > > index 000000000000..1a4429dc57b1
> > > > > --- /dev/null
> > > > > +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > > > > @@ -0,0 +1,284 @@
> > > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > > +
> > > > > +/dts-v1/;
> > > > > +#include <dt-bindings/input/linux-event-codes.h>
> > > > > +#include "sun8i-v3s.dtsi"
> > > > > +#include "sunxi-common-regulators.dtsi"
> > > > > +
> > > > > +/ {
> > > > > +	model =3D "Anbernic RG Nano";
> > > > > +	compatible =3D "anbernic,rg-nano", "allwinner,sun8i-v3s";
> > > > > +
> > > > > +	aliases {
> > > > > +		rtc0 =3D &pcf8563;
> > > > > +		rtc1 =3D &rtc;
> > > > > +		serial0 =3D &uart0;
> > > > > +	};
> > > > > +
> > > > > +	backlight: backlight {
> > > > > +		compatible =3D "pwm-backlight";
> > > > > +		brightness-levels =3D <0 1 2 3 8 14 21 32 46 60 80 100>;
> > > > > +		default-brightness-level =3D <11>;
> > > > > +		power-supply =3D <&reg_vcc5v0>;
> > > > > +		pwms =3D <&pwm 0 40000 1>;
> > > > > +	};
> > > > > +
> > > > > +	chosen {
> > > > > +		stdout-path =3D "serial0:115200n8";
> > > > > +	};
> > > > > +
> > > > > +	gpio_keys: gpio-keys {
> > > > > +		compatible =3D "gpio-keys";
> > > > > +
> > > > > +		button-a {
> > > > > +			gpios =3D <&gpio_expander 12 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)=
>;
> > > > > +			label =3D "BTN-A";
> > > > > +			linux,code =3D <BTN_EAST>;
> > > > > +		};
> > > > > +
> > > > > +		button-b {
> > > > > +			gpios =3D <&gpio_expander 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)=
>;
> > > > > +			label =3D "BTN-B";
> > > > > +			linux,code =3D <BTN_SOUTH>;
> > > > > +		};
> > > > > +
> > > > > +		button-down {
> > > > > +			gpios =3D <&gpio_expander 1 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > > +			label =3D "DPAD-DOWN";
> > > > > +			linux,code =3D <BTN_DPAD_DOWN>;
> > > > > +		};
> > > > > +
> > > > > +		button-left {
> > > > > +			gpios =3D <&gpio_expander 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > > +			label =3D "DPAD-LEFT";
> > > > > +			linux,code =3D <BTN_DPAD_LEFT>;
> > > > > +		};
> > > > > +
> > > > > +		button-right {
> > > > > +			gpios =3D <&gpio_expander 0 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > > +			label =3D "DPAD-RIGHT";
> > > > > +			linux,code =3D <BTN_DPAD_RIGHT>;
> > > > > +		};
> > > > > +
> > > > > +		button-se {
> > > > > +			gpios =3D <&gpio_expander 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > > +			label =3D "BTN-SELECT";
> > > > > +			linux,code =3D <BTN_SELECT>;
> > > > > +		};
> > > > > +
> > > > > +		button-st {
> > > > > +			gpios =3D <&gpio_expander 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > > +			label =3D "BTN-START";
> > > > > +			linux,code =3D <BTN_START>;
> > > > > +		};
> > > > > +
> > > > > +		button-tl {
> > > > > +			gpios =3D <&gpio_expander 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > > +			label =3D "BTN-L";
> > > > > +			linux,code =3D <BTN_TL>;
> > > > > +		};
> > > > > +
> > > > > +		button-tr {
> > > > > +			gpios =3D <&gpio_expander 15 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)=
>;
> > > > > +			label =3D "BTN-R";
> > > > > +			linux,code =3D <BTN_TR>;
> > > > > +		};
> > > > > +
> > > > > +		button-up {
> > > > > +			gpios =3D <&gpio_expander 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > > > +			label =3D "DPAD-UP";
> > > > > +			linux,code =3D <BTN_DPAD_UP>;
> > > > > +		};
> > > > > +
> > > > > +		button-x {
> > > > > +			gpios =3D <&gpio_expander 11 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)=
>;
> > > > > +			label =3D "BTN-X";
> > > > > +			linux,code =3D <BTN_NORTH>;
> > > > > +		};
> > > > > +
> > > > > +		button-y {
> > > > > +			gpios =3D <&gpio_expander 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)=
>;
> > > > > +			label =3D "BTN-Y";
> > > > > +			linux,code =3D <BTN_WEST>;
> > > > > +		};
> > > > > +	};
> > > > > +};
> > > > > +
> > > > > +&codec {
> > > > > +	allwinner,audio-routing =3D "Speaker", "HP",
> > > > > +				  "MIC1", "Mic",
> > > > > +				  "Mic", "HBIAS";
> > > > > +	allwinner,pa-gpios =3D <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_=
UP)>; /* PF6 */
> > > > > +	status =3D "okay";
> > > > > +};
> > > > > +
> > > > > +&ehci {
> > > > > +	status =3D "okay";
> > > > > +};
> > > > > +
> > > > > +&i2c0 {
> > > > > +	status =3D "okay";
> > > > > +
> > > > > +	gpio_expander: gpio@20 {
> > > > > +		compatible =3D "nxp,pcal6416";
> > > > > +		reg =3D <0x20>;
> > > > > +		gpio-controller;
> > > > > +		#gpio-cells =3D <2>;
> > > > > +		#interrupt-cells =3D <2>;
> > > > > +		interrupt-controller;
> > > > > +		interrupt-parent =3D <&pio>;
> > > > > +		interrupts =3D <1 3 IRQ_TYPE_EDGE_BOTH>; /* PB3/EINT3 */
> > > > > +		vcc-supply =3D <&reg_vcc3v3>;
> > > > > +	};
> > > > > +
> > > > > +	axp209: pmic@34 {
> > > > > +		reg =3D <0x34>;
> > > > > +		interrupt-parent =3D <&pio>;
> > > > > +		interrupts =3D <1 5 IRQ_TYPE_EDGE_FALLING>; /* PB5/EINT5 */
> > > > > +	};
> > > > > +
> > > > > +	pcf8563: rtc@51 {
> > > > > +		compatible =3D "nxp,pcf8563";
> > > > > +		reg =3D <0x51>;
> > > > > +	};
> > > > > +};
> > > > > +
> > > > > +#include "axp209.dtsi"
> > > > > +
> > > > > +&battery_power_supply {
> > > > > +	status =3D "okay";
> > > > > +};
> > > > > +
> > > > > +&mmc0 {
> > > > > +	broken-cd;
> > > > > +	bus-width =3D <4>;
> > > > > +	disable-wp;
> > > > > +	vmmc-supply =3D <&reg_vcc3v3>;
> > > > > +	vqmmc-supply =3D <&reg_vcc3v3>;
> > > > > +	status =3D "okay";
> > > > > +};
> > > > > +
> > > > > +&ohci {
> > > > > +	status =3D "okay";
> > > > > +};
> > > > > +
> > > > > +&pio {
> > > > > +	vcc-pb-supply =3D <&reg_vcc3v3>;
> > > > > +	vcc-pc-supply =3D <&reg_vcc3v3>;
> > > > > +	vcc-pf-supply =3D <&reg_vcc3v3>;
> > > > > +	vcc-pg-supply =3D <&reg_vcc3v3>;
> > > > > +
> > > > > +	spi0_no_miso_pins: spi0-no-miso-pins {
> > > > > +		pins =3D "PC1", "PC2", "PC3";
> > > > > +		function =3D "spi0";
> > > > > +	};
> > > > > +};
> > > > > +
> > > > > +&pwm {
> > > > > +	pinctrl-0 =3D <&pwm0_pin>;
> > > > > +	pinctrl-names =3D "default";
> > > > > +	status =3D "okay";
> > > > > +};
> > > > > +
> > > > > +/* DCDC2 wired into vdd-cpu, vdd-sys, and vdd-ephy. */
> > > > > +&reg_dcdc2 {
> > > > > +	regulator-always-on;
> > > > > +	regulator-max-microvolt =3D <1250000>;
> > > > > +	regulator-min-microvolt =3D <1250000>;
> > > > > +	regulator-name =3D "vdd-cpu";
> > > > > +};
> > > > > +
> > > > > +/* DCDC3 wired into every 3.3v input that isn't the RTC. */
> > > > > +&reg_dcdc3 {
> > > > > +	regulator-always-on;
> > > > > +	regulator-max-microvolt =3D <3300000>;
> > > > > +	regulator-min-microvolt =3D <3300000>;
> > > > > +	regulator-name =3D "vcc-io";
> > > > > +};
> > > > > +
> > > > > +/*
> > > > > + * LDO1 wired into RTC, voltage is hard-wired at 3.3v and cannot=
 be
> > > > > + * software modified. Note that setting voltage here to 3.3v for=
 accuracy
> > > > > + * sake causes an issue with the driver that causes it to fail t=
o probe
> > > > > + * because of a voltage constraint in the driver.
> > > > > + */
> > > >=20
> > > > Can you please remove any mention of drivers everywhere? DT is OS a=
nd=20
> > > > thus driver independent.
> > > >=20
> > > > Once fixed:
> > > > Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > >=20
> > > This note was added due to prior comments because in this very specif=
ic
> > > case we're working around a driver issue. Sadly if I accurately
> > > describe the hardware the PMIC and devices that depend on it will fail
> > > to probe (the hardware is 3.3v, but here it's set as 1.3v).
> > >=20
> > > https://lore.kernel.org/linux-sunxi/20230629203410.660eb9a4@slackpad.=
lan/
> >=20
> > Sorry, I should follow conversation more closely. Procedure in such cas=
es
> > is to fix driver first and then submit proper DT file. While DT files
> > reside in Linux source, they are often used by diferent projects, like
> > U-Boot or FreeBSD, so we can't make hacks just because Linux driver doe=
sn't
> > work.
>=20
> I'll drop all but the note that "LDO1 is wired into RTC and voltage is
> hard wired at 3.3v". That accurately describes the hardware, so will
> that work?

OK.

Best regards,
Jernej

>=20
> >=20
> > >=20
> > > Thank you,
> > > Chris
> > >=20
> > > >=20
> > > > Best regards,
> > > > Jernej
> > > >=20
> > > > > +&reg_ldo1 {
> > > > > +	regulator-always-on;
> > > > > +	regulator-name =3D "vcc-rtc";
> > > > > +};
> > > > > +
> > > > > +/* LDO2 wired into VCC-PLL and audio codec. */
> > > > > +&reg_ldo2 {
> > > > > +	regulator-always-on;
> > > > > +	regulator-max-microvolt =3D <3000000>;
> > > > > +	regulator-min-microvolt =3D <3000000>;
> > > > > +	regulator-name =3D "vcc-pll";
> > > > > +};
> > > > > +
> > > > > +/* LDO3, LDO4, and LDO5 unused. */
> > > > > +&reg_ldo3 {
> > > > > +	status =3D "disabled";
> > > > > +};
> > > > > +
> > > > > +&reg_ldo4 {
> > > > > +	status =3D "disabled";
> > > > > +};
> > > > > +
> > > > > +/*
> > > > > + * Force the driver to use internal oscillator by removing clocks
> > > > > + * property.
> > > > > + */
> >=20
> > This should be reworded to avoid mentioning driver. Like: "RTC uses
> > internal oscillator".
> >=20
> > Best regards,
> > Jernej
> >=20
>=20
> You got it.
>=20
> > > > > +&rtc {
> > > > > +	/delete-property/ clocks;
> > > > > +};
> > > > > +
> > > > > +&spi0 {
> > > > > +	pinctrl-0 =3D <&spi0_no_miso_pins>;
> > > > > +	pinctrl-names =3D "default";
> > > > > +	status =3D "okay";
> > > > > +
> > > > > +	display@0 {
> > > > > +		compatible =3D "saef,sftc154b", "panel-mipi-dbi-spi";
> > > > > +		reg =3D <0>;
> > > > > +		backlight =3D <&backlight>;
> > > > > +		dc-gpios =3D <&pio 2 0 GPIO_ACTIVE_HIGH>; /* PC0 */
> > > > > +		reset-gpios =3D <&pio 1 2 GPIO_ACTIVE_HIGH>; /* PB2 */
> > > > > +		spi-max-frequency =3D <100000000>;
> > > > > +
> > > > > +		height-mm =3D <39>;
> > > > > +		width-mm =3D <39>;
> > > > > +
> > > > > +		/* Set hb-porch to compensate for non-visible area */
> > > > > +		panel-timing {
> > > > > +			hactive =3D <240>;
> > > > > +			vactive =3D <240>;
> > > > > +			hback-porch =3D <80>;
> > > > > +			vback-porch =3D <0>;
> > > > > +			clock-frequency =3D <0>;
> > > > > +			hfront-porch =3D <0>;
> > > > > +			hsync-len =3D <0>;
> > > > > +			vfront-porch =3D <0>;
> > > > > +			vsync-len =3D <0>;
> > > > > +		};
> > > > > +	};
> > > > > +};
> > > > > +
> > > > > +&uart0 {
> > > > > +	pinctrl-0 =3D <&uart0_pb_pins>;
> > > > > +	pinctrl-names =3D "default";
> > > > > +	status =3D "okay";
> > > > > +};
> > > > > +
> > > > > +&usb_otg {
> > > > > +	dr_mode =3D "otg";
> > > > > +	status =3D "okay";
> > > > > +};
> > > > > +
> > > > > +&usb_power_supply {
> > > > > +	status =3D "okay";
> > > > > +};
> > > > > +
> > > > > +&usbphy {
> > > > > +	usb0_id_det-gpios =3D <&pio 6 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP=
)>; /* PG5 */
> > > > > +	status =3D "okay";
> > > > > +};
> > > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > >=20
> >=20
> >=20
> >=20
> >=20
>=20
> Thank you,
> Chris
>=20




