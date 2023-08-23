Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D57156E6
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 19:32:13 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-52683da3f5cso7443652a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 12:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692819132; x=1693423932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sbtUDYR4FDcEVt219AISdLHP0GDu/EjFti7cfkj1RQ=;
        b=gGHokcstRZFJXp/vYDVdIg9x3hioja7zXemtho/u3SkL3N+J6nT9e8FTyaqKVwtx3Q
         6dy/6HYEJv1xrVnBH76F2FpIfCugkBVMR0sMZjyuRWJ42Gq0hqun/cI5wzGvynQBVIIj
         wTbEKc5qfyLwSNvewKCAuDnnqtWsZYn8owKyZ3XuL5yT3M0VARORM6Cng3QwPLadVRgT
         qIp4dKTs9EKu65DkFrBDEXoLj41A4e/JKwCTLuStAlotbxOxX6QsgrMft3M74XsYCy2L
         yqha1ZqnkS2Uk06JpAYK6mBjqx+TKekLxygA2jHkUE2Ou1faN/eVVcCiypmXnDioj4uk
         pSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692819132; x=1693423932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sbtUDYR4FDcEVt219AISdLHP0GDu/EjFti7cfkj1RQ=;
        b=k70X5ng+VUZqCY4BaPMTfG4mfaiMwvS6thOVbALSxv0FXoOcEywXqw+crVyy8OyNY2
         KFXVn2f4dowIPClc/hQsGJ5ioAdc3s3rr6OB2vETeVnCZzw2k/f6qFFBAOUsaZc07lB8
         UA1dD4pT12znMdON1zI8YRrWmWdJLJ8Wg3zvjlTkGmi72aMKtixcSCphE4KVWfqrTQaC
         7d4ro6OIY3n89sHKeFIM2QKsT1hBW4DC/m5/XtgUMH4m/GyPVOGuiiXaRtub8WRsfusE
         PfpnD8eOZYeXR3zwEB13gSUjHeinaFZjbdBEZ1qGvsIjVjdv5RWMmIrB1UkhCxMlEgXU
         Hufg==
X-Gm-Message-State: AOJu0YzcOadZnARwz/aZmwaf71TWvotsaSQgUKKNVu1mCa8P03dv8Zv5
	r3NboYRH4f27tRiEOOjkumtCpLbEnaU7RQ==
X-Google-Smtp-Source: AGHT+IE0YKicG9XIxp5DqyqtDM2RYiGiLB2+RnuRZLZvaHrOUjUIfrRHIJgC7NcnbbO/rtzBbOfrHQ==
X-Received: by 2002:aa7:cf09:0:b0:52a:1d54:2534 with SMTP id a9-20020aa7cf09000000b0052a1d542534mr3730441edy.25.1692819131682;
        Wed, 23 Aug 2023 12:32:11 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id i21-20020a05640200d500b00525503fac84sm9720054edu.25.2023.08.23.12.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 12:32:11 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, mripard@kernel.org, me@crly.cz,
 uwu@icenowy.me, samuel@sholland.org, wens@csie.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V2 4/4] ARM: dts: sunxi: add support for Anbernic RG-Nano
Date: Wed, 23 Aug 2023 21:32:10 +0200
Message-ID: <3244887.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20230819032105.67978-5-macroalpha82@gmail.com>
References:
 <20230819032105.67978-1-macroalpha82@gmail.com>
 <20230819032105.67978-5-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 19. avgust 2023 ob 05:21:05 CEST je Chris Morgan napisal(a):
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The Anbernic RG-Nano is a small portable game device based on the
> Allwinner V3s SoC. It has GPIO buttons on the face and side for
> input, a single mono speaker, a 240x240 SPI controlled display, a USB-C
> OTG port, an SD card slot for booting, and 64MB of RAM included in the
> SoC.
> 
> The SPI display is currently unsupported, as it will either require
> a new tinydrm driver or changes to the staging fbtft driver to support.
> I plan on working on a tinydrm driver to properly support it. 

Remove above text. It doesn't belong to DT commit message, but you can put it 
in cover letter or commit comment.

Best regards,
Jernej

> The USB-C
> port currently only works as a peripheral port, however in the BSP
> kernel it also works in host mode allowing included USB-C headphones
> with a built-in DAC to work.
> 
> Working:
> - SDMMC
> - UART (for debugging)
> - Buttons
> - Charging/battery/PMIC
> - Speaker
> - USB Gadget
> 
> Not working:
> - Display
> - USB Host
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  arch/arm/boot/dts/allwinner/Makefile          |   1 +
>  .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 219 ++++++++++++++++++
>  2 files changed, 220 insertions(+)
>  create mode 100644
> arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> 
> diff --git a/arch/arm/boot/dts/allwinner/Makefile
> b/arch/arm/boot/dts/allwinner/Makefile index 589a1ce1120a..2be83a1edcbb
> 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -237,6 +237,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>  	sun8i-t113s-mangopi-mq-r-t113.dtb \
>  	sun8i-t3-cqa3t-bv3.dtb \
>  	sun8i-v3-sl631-imx179.dtb \
> +	sun8i-v3s-anbernic-rg-nano.dtb \
>  	sun8i-v3s-licheepi-zero.dtb \
>  	sun8i-v3s-licheepi-zero-dock.dtb \
>  	sun8i-v40-bananapi-m2-berry.dtb
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts new file mode
> 100644
> index 000000000000..c49b5431d04e
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include "sun8i-v3s.dtsi"
> +#include "sunxi-common-regulators.dtsi"
> +
> +/ {
> +	model = "Anbernic RG Nano";
> +	compatible = "anbernic,rg-nano", "allwinner,sun8i-v3s";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm 0 40000 1>;
> +		brightness-levels = <0 1 2 3 8 14 21 32 46 60 80 100>;
> +		default-brightness-level = <11>;
> +		power-supply = <&reg_vcc5v0>;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	gpio_keys: gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		button-a {
> +			gpios = <&gpio_expander 12 (GPIO_ACTIVE_LOW | 
GPIO_PULL_UP)>;
> +			label = "BTN-A";
> +			linux,code = <BTN_EAST>;
> +		};
> +
> +		button-b {
> +			gpios = <&gpio_expander 14 (GPIO_ACTIVE_LOW | 
GPIO_PULL_UP)>;
> +			label = "BTN-B";
> +			linux,code = <BTN_SOUTH>;
> +		};
> +
> +		button-down {
> +			gpios = <&gpio_expander 1 (GPIO_ACTIVE_LOW | 
GPIO_PULL_UP)>;
> +			label = "DPAD-DOWN";
> +			linux,code = <BTN_DPAD_DOWN>;
> +		};
> +
> +		button-left {
> +			gpios = <&gpio_expander 4 (GPIO_ACTIVE_LOW | 
GPIO_PULL_UP)>;
> +			label = "DPAD-LEFT";
> +			linux,code = <BTN_DPAD_LEFT>;
> +		};
> +
> +		button-right {
> +			gpios = <&gpio_expander 0 (GPIO_ACTIVE_LOW | 
GPIO_PULL_UP)>;
> +			label = "DPAD-RIGHT";
> +			linux,code = <BTN_DPAD_RIGHT>;
> +		};
> +
> +		button-se {
> +			gpios = <&gpio_expander 7 (GPIO_ACTIVE_LOW | 
GPIO_PULL_UP)>;
> +			label = "BTN-SELECT";
> +			linux,code = <BTN_SELECT>;
> +		};
> +
> +		button-st {
> +			gpios = <&gpio_expander 6 (GPIO_ACTIVE_LOW | 
GPIO_PULL_UP)>;
> +			label = "BTN-START";
> +			linux,code = <BTN_START>;
> +		};
> +
> +		button-tl {
> +			gpios = <&gpio_expander 2 (GPIO_ACTIVE_LOW | 
GPIO_PULL_UP)>;
> +			label = "BTN-L";
> +			linux,code = <BTN_TL>;
> +		};
> +
> +		button-tr {
> +			gpios = <&gpio_expander 15 (GPIO_ACTIVE_LOW | 
GPIO_PULL_UP)>;
> +			label = "BTN-R";
> +			linux,code = <BTN_TR>;
> +		};
> +
> +		button-up {
> +			gpios = <&gpio_expander 3 (GPIO_ACTIVE_LOW | 
GPIO_PULL_UP)>;
> +			label = "DPAD-UP";
> +			linux,code = <BTN_DPAD_UP>;
> +		};
> +
> +		button-x {
> +			gpios = <&gpio_expander 11 (GPIO_ACTIVE_LOW | 
GPIO_PULL_UP)>;
> +			label = "BTN-X";
> +			linux,code = <BTN_NORTH>;
> +		};
> +
> +		button-y {
> +			gpios = <&gpio_expander 13 (GPIO_ACTIVE_LOW | 
GPIO_PULL_UP)>;
> +			label = "BTN-Y";
> +			linux,code = <BTN_WEST>;
> +		};
> +	};
> +};
> +
> +&codec {
> +	allwinner,audio-routing = "Speaker", "HP",
> +				  "MIC1", "Mic",
> +				  "Mic", "HBIAS";
> +	allwinner,pa-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
> +	status = "okay";
> +};
> +
> +&cpu0 {
> +	clock-frequency = <1296000>;
> +	clock-latency = <244144>;
> +	operating-points = <
> +			/* kHz    uV */
> +			1296000 1200000
> +			1008000 1200000
> +			864000  1200000
> +			720000  1100000
> +			480000  1000000>;
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	gpio_expander: gpio@20 {
> +		compatible = "nxp,pcal6416";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		interrupt-parent = <&pio>;
> +		interrupts = <1 3 IRQ_TYPE_EDGE_BOTH>;
> +		vcc-supply = <&reg_vcc3v3>;
> +	};
> +
> +	axp209: pmic@34 {
> +		reg = <0x34>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +
> +	pcf8563: rtc@51 {
> +		compatible = "nxp,pcf8563";
> +		reg = <0x51>;
> +	};
> +};
> +
> +#include "axp209.dtsi"
> +
> +&battery_power_supply {
> +	status = "okay";
> +};
> +
> +&mmc0 {
> +	broken-cd;
> +	bus-width = <4>;
> +	disable-wp;
> +	vmmc-supply = <&reg_vcc3v3>;
> +	vqmmc-supply = <&reg_vcc3v3>;
> +	status = "okay";
> +};
> +
> +&pio {
> +	vcc-pb-supply = <&reg_vcc3v3>;
> +	vcc-pc-supply = <&reg_vcc3v3>;
> +	vcc-pf-supply = <&reg_vcc3v3>;
> +	vcc-pg-supply = <&reg_vcc3v3>;
> +};
> +
> +&pwm {
> +	pinctrl-0 = <&pwm0_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-max-microvolt = <1250000>;
> +	regulator-min-microvolt = <1250000>;
> +};
> +
> +&reg_dcdc3 {
> +	regulator-always-on;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-min-microvolt = <3300000>;
> +};
> +
> +&reg_ldo2 {
> +	regulator-always-on;
> +	regulator-max-microvolt = <3000000>;
> +	regulator-min-microvolt = <3000000>;
> +};
> +
> +&spi0 {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-0 = <&uart0_pb_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode = "otg";
> +	status = "okay";
> +};
> +
> +&usb_power_supply {
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	status = "okay";
> +};




