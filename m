Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001992942A
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 10:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713091506; cv=none; b=W5nX3O6+97ex7xfGOaHHu+WmeO7trT8tB9u6P+ZesGuSiGxptv00gH2JW5j2JXq1jBI6+knZ+8BEPt2F+YXRJxkAYlFAaUOm9TaegnL7NGOJUGvQDkbpHTUl3zAUSP3brCMfTT2df1Ww6Ji9OvCpM18AZ4Idzt/14nolBgJ1EoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713091506; c=relaxed/simple;
	bh=gKefZjiMLnYnDg5f1hw1XrCVXNFjprL+Y6b51gkyeJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j1eCR47IxsvHtwjd70Sy0+GJZnEaO40wlCKpOuxH80kpO3gXtQ9O76lvAzdT6HzTQrNB0K2tJZsh9FDPrY0Rl0Z0sotM0BE9FUl1aX4QsxiJTQi43Ij2lUSlFP+ybB/HdHmqBR9jEJEUq9cvS3wzEzcwPYr9pTmDBkLEctlccjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HP3M5jxX; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HP3M5jxX"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56e6a1edecfso3603497a12.1
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 03:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713091502; x=1713696302; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xCwqQBsSE1kFohvW8vRYJ8QUAAEAfzm2seE0I2e3Rk=;
        b=HP3M5jxXvUCUEGapfQ2pWhLNyI59uDAFOmup6pYHWSKoEpWVgOVXLQ7nssuo2F/bqr
         7+Pn/ox87/eqB+1OpH5eDGj7HHO42urBnmqLms+5yYcLjRYYLSZQiSsk5zc1EufbZbDa
         EI4Owo7cWV0QkYY8wDtzzs3jDiRwKV4/zFW5qQ/BrTwt60ggFrrwOq7qlUgjF711gPuA
         Ag2H3/PKcjcSFT78VKCu7CqKbKy0SgSzuNdbddDU5Z6tF4EG/uL9aK+rokloFu8YMS8o
         2GGZOwfgLrclddN5mgoEHEH0YVSR9+hAiPWdp76u/yTAGCw6PjG43bmy2ddcyajyrlX6
         8BDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713091502; x=1713696302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3xCwqQBsSE1kFohvW8vRYJ8QUAAEAfzm2seE0I2e3Rk=;
        b=UHW1iBbQ+beaxOXfEtZN0Uynk+8a45O3yn2KI5mf/Jt0rtxmkRYtBlH/P1zbUz3Ruk
         scptKA2k1ghMND6iwFIwcAHs7PlA8ZPCTLDToYRkr495jEPrfRdgpbHcOu8nNieNEU3B
         BNL/U8T+PWEnH2Zt5V4+L2Xx5sPFG7u+E+byX7oytkfipeS1/P8MBlwZ5M2XF8XUPl3t
         Ib8BFgDQ5zIsRy+WzJNSITzJfbR9gHHhSK+5gmSBn8c+WvOAmZtPeMQbhyWsJn4mT06v
         OCSgA2ognlS6ElUZvtzdtnOJ8+3ssfeqPVQpB9GxrBE4mafRNJPp1Lme+dm4b+QMj6e6
         kA0A==
X-Forwarded-Encrypted: i=1; AJvYcCXrJQhpDwLf5UiSOjhFUTl3yHzCKFcGKZn2g0iz4XlT0KU0bXlK2puEQgEbz6eO9j6fmXU3kMJBY4szsIndHoCdAe6QUOA/xtyB1yM=
X-Gm-Message-State: AOJu0YxfoQxyk8T9Pr06J3Cps8bNwQ7pXnLpyIrEKHD8KrK5cksCe2Uz
	qDFZ6YFSW42evBTZ8AwaGv8io6dovFXGLuE0oOlI9EYM45BQdjOq
X-Google-Smtp-Source: AGHT+IEVRoUirRooWmBfyz2BZBw6j5wd/QGw6EfBvlmUcpDtmjnYZ4b6tAio1XgKgqrBdmiQp3X5Hg==
X-Received: by 2002:a50:d656:0:b0:56c:5ab5:5fb7 with SMTP id c22-20020a50d656000000b0056c5ab55fb7mr5440500edj.30.1713091502122;
        Sun, 14 Apr 2024 03:45:02 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-123-252-50-gprs.simobil.net. [46.123.252.50])
        by smtp.gmail.com with ESMTPSA id k20-20020aa7c054000000b0056ff82e54a0sm2792173edo.31.2024.04.14.03.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 03:45:01 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: Add Tanix TX1 support
Date: Sun, 14 Apr 2024 12:45:00 +0200
Message-ID: <3215318.5fSG56mABF@jernej-laptop>
In-Reply-To: <20240330013243.17943-3-andre.przywara@arm.com>
References:
 <20240330013243.17943-1-andre.przywara@arm.com>
 <20240330013243.17943-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Andre,

sorry for late reply.

Dne sobota, 30. marec 2024 ob 02:32:43 CEST je Andre Przywara napisal(a):
> The Tanix TX1 is a tiny TV box with the Allwinner H313 SoC. The box
> features no Ethernet or an SD card slot, which makes booting from it
> somewhat interesting: Pressing the hidden FEL button and using a USB-A
> to USB-A cable to upload code from a host PC is one way to run mainline.
> The box features:
> 	- Allwinner H313 SoC (4 * Arm Cortex-A53 cores)
> 	- 1 or 2 GB DRAM
> 	- 8 or 16 GB eMMC flash
> 	- SCI S9082H WiFi chip
> 	- HDMI port
> 	- one USB 2.0 port
> 	- 3.5mm AV port
> 	- barrel plug 5V DC input via barrel plug
> 
> The devicetree covers most peripherals.
> The eMMC did not work properly in HS200 speed mode, so this mode property
> is omitted. HS-DDR seems to work fine.
> The blue LED is connected to the same GPIO pin as the red LED, just
> using the opposite polarity. Apparently there is no way of describing
> this in DT, so the red LED is omitted.
> Next to the FEL button is a hidden button, that can be pushed by using
> something like a paperclip, through the ventilation vents of the case.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../dts/allwinner/sun50i-h313-tanix-tx1.dts   | 184 ++++++++++++++++++
>  2 files changed, 185 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index 294921f12b738..c8ac2823677f2 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -39,6 +39,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64-model-b.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6-mini.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h313-tanix-tx1.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-cb1-manta.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-pi.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
> new file mode 100644
> index 0000000000000..622f4290057a8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
> @@ -0,0 +1,184 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2024 Arm Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-h616.dtsi"
> +#include "sun50i-h616-cpu-opp.dtsi"

Above include doesn't exist yet. Once removed:

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	model = "Tanix TX1";
> +	compatible = "oranth,tanix-tx1", "allwinner,sun50i-h616";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		ethernet0 = &sdio_wifi;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		key {
> +			label = "hidden";
> +			linux,code = <BTN_0>;
> +			gpios = <&pio 7 9 GPIO_ACTIVE_LOW>; /* PH9 */
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			function = LED_FUNCTION_POWER;
> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&pio 7 6 GPIO_ACTIVE_HIGH>; /* PH6 */
> +			default-state = "on";
> +		};
> +	};
> +
> +	wifi_pwrseq: pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		clocks = <&rtc CLK_OSC32K_FANOUT>;
> +		clock-names = "ext_clock";
> +		pinctrl-0 = <&x32clk_fanout_pin>;
> +		pinctrl-names = "default";
> +		reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
> +	};
> +
> +	reg_vcc5v: vcc5v {
> +		/* board wide 5V supply directly from the DC input */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc-5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&ir {
> +	status = "okay";
> +};
> +
> +&mmc1 {
> +	vmmc-supply = <&reg_dldo1>;
> +	vqmmc-supply = <&reg_aldo1>;
> +	mmc-pwrseq = <&wifi_pwrseq>;
> +	bus-width = <4>;
> +	non-removable;
> +	status = "okay";
> +
> +	sdio_wifi: wifi@1 {
> +		reg = <1>;
> +	};
> +};
> +
> +&mmc2 {
> +	vmmc-supply = <&reg_dldo1>;
> +	vqmmc-supply = <&reg_aldo1>;
> +	bus-width = <8>;
> +	non-removable;
> +	max-frequency = <100000000>;
> +	cap-mmc-hw-reset;
> +	mmc-ddr-1_8v;
> +	status = "okay";
> +};
> +
> +&ohci0 {
> +	status = "okay";
> +};
> +
> +&pio {
> +	vcc-pc-supply = <&reg_aldo1>;
> +	vcc-pf-supply = <&reg_dldo1>;
> +	vcc-pg-supply = <&reg_aldo1>;
> +	vcc-ph-supply = <&reg_dldo1>;
> +	vcc-pi-supply = <&reg_dldo1>;
> +};
> +
> +&r_i2c {
> +	status = "okay";
> +
> +	axp313: pmic@36 {
> +		compatible = "x-powers,axp313a";
> +		reg = <0x36>;
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +
> +		vin1-supply = <&reg_vcc5v>;
> +		vin2-supply = <&reg_vcc5v>;
> +		vin3-supply = <&reg_vcc5v>;
> +
> +		regulators {
> +			/* Supplies VCC-PLL, so needs to be always on. */
> +			reg_aldo1: aldo1 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vcc1v8";
> +			};
> +
> +			/* Supplies VCC-IO, so needs to be always on. */
> +			reg_dldo1: dldo1 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vcc3v3";
> +			};
> +
> +			reg_dcdc1: dcdc1 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <810000>;
> +				regulator-max-microvolt = <990000>;
> +				regulator-name = "vdd-gpu-sys";
> +			};
> +
> +			reg_dcdc2: dcdc2 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <810000>;
> +				regulator-max-microvolt = <1120000>;
> +				regulator-name = "vdd-cpu";
> +			};
> +
> +			reg_dcdc3: dcdc3 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <1200000>;
> +				regulator-name = "vdd-dram";
> +			};
> +		};
> +	};
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_ph_pins>;
> +	status = "okay";
> +};
> +
> +&usbotg {
> +	dr_mode = "host";       /* USB A type receptable */
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	status = "okay";
> +};
> 




