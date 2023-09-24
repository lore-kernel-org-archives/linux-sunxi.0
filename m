Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C698DDDC
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 19:33:57 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-31dcf18f9e2so4952786f8f.0
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 12:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695584035; x=1696188835; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLjG2/fD1Nih3Tvk5adPP6AviUuFdb2ahcJYU/fTK+E=;
        b=ht+Nr5tGhV1ZM4KQZxSS+fQji/jW03DQCYOD1mnNCUqTSqthX6O6wGEjOwumkoloB3
         pEUs58RCt209qGykekqaBPNNcPCj9cP/AljqUR802uDNSfSeNJttewWSCTaUKyLqSxgI
         pQ0HzkAyI+n9qnY/CnfI3xh7H8L2cknwIYHKfbSbq8TNeKQIjJ9UalA7q2RLSMQuyvjT
         6KHZWfgs6G7UEn1ROGrRtwggOCgDUql4tdZ9POyKBAEfuoQNUG4DeW+0K46YVcUyopGu
         of5VqfuOdZTn/C105v5PectlCI1VOJC8W713OZj0KJJ8HQKHZhgMR+3ER4I7H8ywrNL1
         U8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695584035; x=1696188835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLjG2/fD1Nih3Tvk5adPP6AviUuFdb2ahcJYU/fTK+E=;
        b=IBFOkIgqTmfn+CO4JxxC1dDKeOoVJtEjzXTunmDtiln3BnY2YcyEmIhoQpHLculFri
         p3ZzUxxaMaszwD3vMuvWDN9zv2WcEIjKArtyAfImHW57FM4O+n5M6Xpu96Fa+1RIA81H
         iWvgZ0fvX3nIFb+3yWf8loO7ECabLklOLLiwmPz3LDoncxLRIuRGJPU4DZKt9lSd8GP5
         7Hf2d7QIEUxV0/nWJTYxji5faLm9yhvhTrF40pbEu5SoKfLvXexRohvnEm6zu9aiBtrf
         vB+Ajso8mrB6azWWZe7ReamXSEA9aeZkk03F16iHwECUG5dVh9eu/sUPje0lzNcPdeoY
         aSuw==
X-Gm-Message-State: AOJu0YzpLJ0IxWusbx0yA7ffclLuXuolCSdd22m6DLfePbMdnbJDxcHB
	R/PJK3kIIM7iX3htoVR7+WHkrdQ66a9Jdw==
X-Google-Smtp-Source: AGHT+IHf2LlEmcGaXeZ082kdnap6m8QxMqdq7TJymMtpu7A1833yFXLlygAnLBFjtKeOaTf5U292Qg==
X-Received: by 2002:adf:fc90:0:b0:321:4c7e:45e3 with SMTP id g16-20020adffc90000000b003214c7e45e3mr4325013wrr.11.1695584035317;
        Sun, 24 Sep 2023 12:33:55 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id u23-20020a17090617d700b00993a9a951fasm5402231eje.11.2023.09.24.12.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:33:54 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, mripard@kernel.org, uwu@icenowy.me,
 samuel@sholland.org, wens@csie.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 andre.przywara@arm.com, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V5 4/4] ARM: dts: sunxi: add support for Anbernic RG-Nano
Date: Sun, 24 Sep 2023 21:33:53 +0200
Message-ID: <4860683.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20230921135136.97491-5-macroalpha82@gmail.com>
References:
 <20230921135136.97491-1-macroalpha82@gmail.com>
 <20230921135136.97491-5-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne =C4=8Detrtek, 21. september 2023 ob 15:51:36 CEST je Chris Morgan napis=
al(a):
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> The Anbernic RG-Nano is a small portable game device based on the
> Allwinner V3s SoC. It has GPIO buttons on the face and side for
> input, a single mono speaker, a 240x240 SPI controlled display, a USB-C
> OTG port, an SD card slot for booting, and 64MB of RAM included in the
> SoC. There does not appear to be a crystal feeding the internal RTC so
> it does not keep proper time (for me it ran 8 hours slow in a 24 hour
> period). External RTC works just fine.
>=20
> Working/Tested:
> - SDMMC
> - UART (for debugging)
> - Buttons
> - Charging/battery/PMIC
> - Speaker
> - RTC (external RTC)
> - USB
> - Display
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  arch/arm/boot/dts/allwinner/Makefile          |   1 +
>  .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 284 ++++++++++++++++++
>  2 files changed, 285 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nan=
o.dts
>=20
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/all=
winner/Makefile
> index eebb5a0c873a..2d26c3397f14 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -256,6 +256,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-t113s-mangopi-mq-r-t113.dtb \
>  	sun8i-t3-cqa3t-bv3.dtb \
>  	sun8i-v3-sl631-imx179.dtb \
> +	sun8i-v3s-anbernic-rg-nano.dtb \
>  	sun8i-v3s-licheepi-zero.dtb \
>  	sun8i-v3s-licheepi-zero-dock.dtb \
>  	sun8i-v40-bananapi-m2-berry.dtb
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts b=
/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> new file mode 100644
> index 000000000000..1a4429dc57b1
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> @@ -0,0 +1,284 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include "sun8i-v3s.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +/ {
> +	model =3D "Anbernic RG Nano";
> +	compatible =3D "anbernic,rg-nano", "allwinner,sun8i-v3s";
> +
> +	aliases {
> +		rtc0 =3D &pcf8563;
> +		rtc1 =3D &rtc;
> +		serial0 =3D &uart0;
> +	};
> +
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		brightness-levels =3D <0 1 2 3 8 14 21 32 46 60 80 100>;
> +		default-brightness-level =3D <11>;
> +		power-supply =3D <&reg_vcc5v0>;
> +		pwms =3D <&pwm 0 40000 1>;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	gpio_keys: gpio-keys {
> +		compatible =3D "gpio-keys";
> +
> +		button-a {
> +			gpios =3D <&gpio_expander 12 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label =3D "BTN-A";
> +			linux,code =3D <BTN_EAST>;
> +		};
> +
> +		button-b {
> +			gpios =3D <&gpio_expander 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label =3D "BTN-B";
> +			linux,code =3D <BTN_SOUTH>;
> +		};
> +
> +		button-down {
> +			gpios =3D <&gpio_expander 1 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label =3D "DPAD-DOWN";
> +			linux,code =3D <BTN_DPAD_DOWN>;
> +		};
> +
> +		button-left {
> +			gpios =3D <&gpio_expander 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label =3D "DPAD-LEFT";
> +			linux,code =3D <BTN_DPAD_LEFT>;
> +		};
> +
> +		button-right {
> +			gpios =3D <&gpio_expander 0 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label =3D "DPAD-RIGHT";
> +			linux,code =3D <BTN_DPAD_RIGHT>;
> +		};
> +
> +		button-se {
> +			gpios =3D <&gpio_expander 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label =3D "BTN-SELECT";
> +			linux,code =3D <BTN_SELECT>;
> +		};
> +
> +		button-st {
> +			gpios =3D <&gpio_expander 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label =3D "BTN-START";
> +			linux,code =3D <BTN_START>;
> +		};
> +
> +		button-tl {
> +			gpios =3D <&gpio_expander 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label =3D "BTN-L";
> +			linux,code =3D <BTN_TL>;
> +		};
> +
> +		button-tr {
> +			gpios =3D <&gpio_expander 15 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label =3D "BTN-R";
> +			linux,code =3D <BTN_TR>;
> +		};
> +
> +		button-up {
> +			gpios =3D <&gpio_expander 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label =3D "DPAD-UP";
> +			linux,code =3D <BTN_DPAD_UP>;
> +		};
> +
> +		button-x {
> +			gpios =3D <&gpio_expander 11 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label =3D "BTN-X";
> +			linux,code =3D <BTN_NORTH>;
> +		};
> +
> +		button-y {
> +			gpios =3D <&gpio_expander 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			label =3D "BTN-Y";
> +			linux,code =3D <BTN_WEST>;
> +		};
> +	};
> +};
> +
> +&codec {
> +	allwinner,audio-routing =3D "Speaker", "HP",
> +				  "MIC1", "Mic",
> +				  "Mic", "HBIAS";
> +	allwinner,pa-gpios =3D <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /*=
 PF6 */
> +	status =3D "okay";
> +};
> +
> +&ehci {
> +	status =3D "okay";
> +};
> +
> +&i2c0 {
> +	status =3D "okay";
> +
> +	gpio_expander: gpio@20 {
> +		compatible =3D "nxp,pcal6416";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		#interrupt-cells =3D <2>;
> +		interrupt-controller;
> +		interrupt-parent =3D <&pio>;
> +		interrupts =3D <1 3 IRQ_TYPE_EDGE_BOTH>; /* PB3/EINT3 */
> +		vcc-supply =3D <&reg_vcc3v3>;
> +	};
> +
> +	axp209: pmic@34 {
> +		reg =3D <0x34>;
> +		interrupt-parent =3D <&pio>;
> +		interrupts =3D <1 5 IRQ_TYPE_EDGE_FALLING>; /* PB5/EINT5 */
> +	};
> +
> +	pcf8563: rtc@51 {
> +		compatible =3D "nxp,pcf8563";
> +		reg =3D <0x51>;
> +	};
> +};
> +
> +#include "axp209.dtsi"
> +
> +&battery_power_supply {
> +	status =3D "okay";
> +};
> +
> +&mmc0 {
> +	broken-cd;
> +	bus-width =3D <4>;
> +	disable-wp;
> +	vmmc-supply =3D <&reg_vcc3v3>;
> +	vqmmc-supply =3D <&reg_vcc3v3>;
> +	status =3D "okay";
> +};
> +
> +&ohci {
> +	status =3D "okay";
> +};
> +
> +&pio {
> +	vcc-pb-supply =3D <&reg_vcc3v3>;
> +	vcc-pc-supply =3D <&reg_vcc3v3>;
> +	vcc-pf-supply =3D <&reg_vcc3v3>;
> +	vcc-pg-supply =3D <&reg_vcc3v3>;
> +
> +	spi0_no_miso_pins: spi0-no-miso-pins {
> +		pins =3D "PC1", "PC2", "PC3";
> +		function =3D "spi0";
> +	};
> +};
> +
> +&pwm {
> +	pinctrl-0 =3D <&pwm0_pin>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};
> +
> +/* DCDC2 wired into vdd-cpu, vdd-sys, and vdd-ephy. */
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-max-microvolt =3D <1250000>;
> +	regulator-min-microvolt =3D <1250000>;
> +	regulator-name =3D "vdd-cpu";
> +};
> +
> +/* DCDC3 wired into every 3.3v input that isn't the RTC. */
> +&reg_dcdc3 {
> +	regulator-always-on;
> +	regulator-max-microvolt =3D <3300000>;
> +	regulator-min-microvolt =3D <3300000>;
> +	regulator-name =3D "vcc-io";
> +};
> +
> +/*
> + * LDO1 wired into RTC, voltage is hard-wired at 3.3v and cannot be
> + * software modified. Note that setting voltage here to 3.3v for accuracy
> + * sake causes an issue with the driver that causes it to fail to probe
> + * because of a voltage constraint in the driver.
> + */

Can you please remove any mention of drivers everywhere? DT is OS and=20
thus driver independent.

Once fixed:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> +&reg_ldo1 {
> +	regulator-always-on;
> +	regulator-name =3D "vcc-rtc";
> +};
> +
> +/* LDO2 wired into VCC-PLL and audio codec. */
> +&reg_ldo2 {
> +	regulator-always-on;
> +	regulator-max-microvolt =3D <3000000>;
> +	regulator-min-microvolt =3D <3000000>;
> +	regulator-name =3D "vcc-pll";
> +};
> +
> +/* LDO3, LDO4, and LDO5 unused. */
> +&reg_ldo3 {
> +	status =3D "disabled";
> +};
> +
> +&reg_ldo4 {
> +	status =3D "disabled";
> +};
> +
> +/*
> + * Force the driver to use internal oscillator by removing clocks
> + * property.
> + */
> +&rtc {
> +	/delete-property/ clocks;
> +};
> +
> +&spi0 {
> +	pinctrl-0 =3D <&spi0_no_miso_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +
> +	display@0 {
> +		compatible =3D "saef,sftc154b", "panel-mipi-dbi-spi";
> +		reg =3D <0>;
> +		backlight =3D <&backlight>;
> +		dc-gpios =3D <&pio 2 0 GPIO_ACTIVE_HIGH>; /* PC0 */
> +		reset-gpios =3D <&pio 1 2 GPIO_ACTIVE_HIGH>; /* PB2 */
> +		spi-max-frequency =3D <100000000>;
> +
> +		height-mm =3D <39>;
> +		width-mm =3D <39>;
> +
> +		/* Set hb-porch to compensate for non-visible area */
> +		panel-timing {
> +			hactive =3D <240>;
> +			vactive =3D <240>;
> +			hback-porch =3D <80>;
> +			vback-porch =3D <0>;
> +			clock-frequency =3D <0>;
> +			hfront-porch =3D <0>;
> +			hsync-len =3D <0>;
> +			vfront-porch =3D <0>;
> +			vsync-len =3D <0>;
> +		};
> +	};
> +};
> +
> +&uart0 {
> +	pinctrl-0 =3D <&uart0_pb_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode =3D "otg";
> +	status =3D "okay";
> +};
> +
> +&usb_power_supply {
> +	status =3D "okay";
> +};
> +
> +&usbphy {
> +	usb0_id_det-gpios =3D <&pio 6 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* P=
G5 */
> +	status =3D "okay";
> +};
>=20




