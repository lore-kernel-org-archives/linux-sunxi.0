Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511B58C14
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Sep 2023 20:32:37 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-500a8b2b73eso4647386e87.0
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Sep 2023 13:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693945955; x=1694550755; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCfgXP27Wz+499AIqJKhm+f34MpPggQC/0+2Vyi/8Oo=;
        b=emf6dDA/+jYmNuoJRznMFuTCB57W63QWIKFbdtdLRpuai+Vh4l0DLlmtz+qNcGkDMa
         cPy+tcJ5vmISRgvGZ2oj08+x8aw6UdGVl50x3DuZqS9ADuEPTiAVdQdQhEiDpvy1ZPGo
         fSl1+1w+3YWKPWJ5Mws1SCH22Wi2omqwdEvA1syiirAzQGihZigsorsOvEzXMJAMNUli
         GWXP5JlVnHBtDRihtWwy2FatShLWmOhdfPTvmCbWUSNneNpriCHD3TutMbDif11+7X9a
         VG7Jz/1XlJx9dNQDQE2JENcptN+4+qOyNowT2k21xi3fN5GWxHru7sh/O+T7UKtWxX70
         utfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693945955; x=1694550755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fCfgXP27Wz+499AIqJKhm+f34MpPggQC/0+2Vyi/8Oo=;
        b=KU4IUXgbp1qWrlWc7ztNbJDb1Y4zHNghCP7gXTOe7ZbeX7zA82zSxbphCzkwavo3VH
         UY91ZH5voMBFrbXXhH6VtXWomnr7wkeRl2jgaM5Sx0bq7sdXYN3URfAY1FkIgPlhpHE7
         8mA6joplr1u3kNmB4jGkmEEY5/3TotkT9+A1ndGO9rSUjxG8zTQ9Kp7p8bRcjIiXUiSR
         20cnx6dK4VHTaLyuTnx6RkGdFpF297S81Vvclpor1Xidoc28ZoNtmR9V+l0Ar+b2YsiX
         B+SGOEBVbivG4c4VAq5PlrD+kSOQs9kQovDn6Vbyx504JC5QCtN08MKw2/s72JZMgA+b
         /YqQ==
X-Gm-Message-State: AOJu0Yz2KSsUUau/p0X1zgnD4EWA4SfbAIflbw4p2+GnCqrP3qL0z+WA
	BTnpW38WOHUEdSzy3gi4HwYHbV/xrchGWQWm
X-Google-Smtp-Source: AGHT+IGo0BYNC3WIsHa/wdKuY3+6SfVFM4CI1BXa9DNVTbt0gK0NUQWZc7QIFGrecXnHuUqL5b1ESQ==
X-Received: by 2002:a19:7b19:0:b0:4f4:dbcc:54da with SMTP id w25-20020a197b19000000b004f4dbcc54damr643895lfc.27.1693945954805;
        Tue, 05 Sep 2023 13:32:34 -0700 (PDT)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id d3-20020a056402516300b005256771db39sm7582979ede.58.2023.09.05.13.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 13:32:34 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, airlied@gmail.com, andre.przywara@arm.com,
 conor+dt@kernel.org, daniel@ffwll.ch, heiko@sntech.de, jagan@edgeble.ai,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org,
 neil.armstrong@linaro.org, noralf@tronnes.org, robh+dt@kernel.org,
 sam@ravnborg.org, samuel@sholland.org, uwu@icenowy.me, wens@csie.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V4 8/8] ARM: dts: sunxi: add support for Anbernic RG-Nano
Date: Tue, 05 Sep 2023 22:32:33 +0200
Message-ID: <5865585.MhkbZ0Pkbq@archlinux>
In-Reply-To: <20230828181941.1609894-9-macroalpha82@gmail.com>
References:
 <20230828181941.1609894-1-macroalpha82@gmail.com>
 <20230828181941.1609894-9-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, August 28, 2023 8:19:41 PM CEST Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> The Anbernic RG-Nano is a small portable game device based on the
> Allwinner V3s SoC. It has GPIO buttons on the face and side for
> input, a single mono speaker, a 240x240 SPI controlled display, a USB-C
> OTG port, an SD card slot for booting, and 64MB of RAM included in the
> SoC.
> 
> Working/Tested:
> - SDMMC
> - UART (for debugging)
> - Buttons
> - Charging/battery/PMIC
> - Speaker
> - RTC
> - USB Host and Gadget*
> - Display (at 60hz)
> 
> *There is an issue with the usb_phy where it forces the device to host
> mode. Until the phy driver is fixed this can be bypassed by either
> removing the phy references from the ohci and ehci nodes or by setting
> the usbphy on the ohci and ehci nodes to 1 (which is incorrect).

DT is HW description, so driver independent and above comment should be 
removed from commit message.

Otherwise:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  arch/arm/boot/dts/allwinner/Makefile          |   1 +
>  .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 284 ++++++++++++++++++
>  2 files changed, 285 insertions(+)
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
> index 000000000000..bcccb0d3f9ce
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
> +	model = "Anbernic RG Nano";
> +	compatible = "anbernic,rg-nano", "allwinner,sun8i-v3s";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		brightness-levels = <0 1 2 3 8 14 21 32 46 60 80 100>;
> +		default-brightness-level = <11>;
> +		power-supply = <&reg_vcc5v0>;
> +		pwms = <&pwm 0 40000 1>;
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
> +&ccu {
> +	clocks = <&osc24M>, <&osc32k>;
> +};
> +
> +&codec {
> +	allwinner,audio-routing = "Speaker", "HP",
> +				  "MIC1", "Mic",
> +				  "Mic", "HBIAS";
> +	allwinner,pa-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; 
/* PF6
> */ +	status = "okay";
> +};
> +
> +&ehci {
> +	status = "okay";
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
> +		interrupts = <1 3 IRQ_TYPE_EDGE_BOTH>; /* PB3/EINT3 */
> +		vcc-supply = <&reg_vcc3v3>;
> +	};
> +
> +	axp209: pmic@34 {
> +		reg = <0x34>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>; /* PB5/EINT5 
*/
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
> +&ohci {
> +	status = "okay";
> +};
> +
> +&pio {
> +	clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
> +	vcc-pb-supply = <&reg_vcc3v3>;
> +	vcc-pc-supply = <&reg_vcc3v3>;
> +	vcc-pf-supply = <&reg_vcc3v3>;
> +	vcc-pg-supply = <&reg_vcc3v3>;
> +
> +	spi0_no_miso_pins: spi0-no-miso-pins {
> +		pins = "PC1", "PC2", "PC3";
> +		function = "spi0";
> +	};
> +};
> +
> +&pwm {
> +	pinctrl-0 = <&pwm0_pin>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +/* DCDC2 wired into vdd-cpu, vdd-sys, and vdd-ephy. */
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-max-microvolt = <1250000>;
> +	regulator-min-microvolt = <1250000>;
> +	regulator-name = "vdd-cpu";
> +};
> +
> +/* DCDC3 wired into every 3.3v input that isn't the RTC. */
> +&reg_dcdc3 {
> +	regulator-always-on;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-min-microvolt = <3300000>;
> +	regulator-name = "vcc-io";
> +};
> +
> +/*
> + * LDO1 wired into RTC, voltage is hard-wired at 3.3v and cannot be
> + * software modified. Note that setting voltage here to 3.3v for accuracy
> + * sake causes an issue with the driver that causes it to fail to probe
> + * because of a voltage constraint in the driver.
> + */
> +&reg_ldo1 {
> +	regulator-always-on;
> +	regulator-name = "vcc-rtc";
> +};
> +
> +/* LDO2 wired into VCC-PLL and audio codec. */
> +&reg_ldo2 {
> +	regulator-always-on;
> +	regulator-max-microvolt = <3000000>;
> +	regulator-min-microvolt = <3000000>;
> +	regulator-name = "vcc-pll";
> +};
> +
> +/* LDO3, LDO4, and LDO5 unused. */
> +&reg_ldo3 {
> +	status = "disabled";
> +};
> +
> +&reg_ldo4 {
> +	status = "disabled";
> +};
> +
> +/* External RTC used instead, internal RTC runs fast. */
> +&rtc {
> +	status = "disabled";
> +};
> +
> +&spi0 {
> +	pinctrl-0 = <&spi0_no_miso_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	display@0 {
> +		compatible = "saef,sftc154b", "panel-mipi-dbi-spi";
> +		reg = <0>;
> +		backlight = <&backlight>;
> +		dc-gpios = <&pio 2 0 GPIO_ACTIVE_HIGH>; /* PC0 */
> +		reset-gpios = <&pio 1 2 GPIO_ACTIVE_HIGH>; /* PB2 */
> +		spi-max-frequency = <100000000>;
> +
> +		height-mm = <39>;
> +		width-mm = <39>;
> +
> +		/* Set hb-porch to compensate for non-visible area */
> +		panel-timing {
> +			hactive = <240>;
> +			vactive = <240>;
> +			hback-porch = <80>;
> +			vback-porch = <0>;
> +			clock-frequency = <0>;
> +			hfront-porch = <0>;
> +			hsync-len = <0>;
> +			vfront-porch = <0>;
> +			vsync-len = <0>;
> +		};
> +	};
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
> +	usb0_id_det-gpios = <&pio 6 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* 
PG5 */
> +	status = "okay";
> +};




