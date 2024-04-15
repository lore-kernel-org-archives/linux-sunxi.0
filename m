Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE1882D93
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 21:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713215785; cv=none; b=q5k6973DRsaxYif1o89RExMJcipSa7mlb4UDcLWQf1UatFFtWWLrJMDmIfJMUNzOMoHMsmlN0q2pjOeTwrzou/e5f6/IBLa27VaPF97qP/BlhAptW/sNIbcQhhHD8pJPvdNviNi4vE5V4Evo5IF0m6Bfl8z5K2FM2PiZmFiOC3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713215785; c=relaxed/simple;
	bh=oZPAjt91gUsPpRGNmYe9ZMT1R5xWBkyHHX9xbVqU6dA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IddgP0wmShmKryn/NMyRFm6E4lVAc3j8beBcGJpi1h+8RCz78qZclVvMIOBkNNbcqrUwk0SZOem7u5hZnkZkr2r2WVr9kM2f9dm/6zMBWiu5oV8LdMdSnZ1XyAUC4/VrZfK7edVSUKZuL5FzGD1CsSqzlDxb4v9VyHFgorF3Sfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enq4ZtKA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enq4ZtKA"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41885eeb104so2811335e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Apr 2024 14:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713215782; x=1713820582; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9fIh3VALFqD9z061oWIYxmy/nGl9jyEMXX1h/25FRE=;
        b=enq4ZtKAdAHs8rUVYXhet51IS3w3O6/pWSWIb/iraQmyb+Y1E/83BipJhF6SnNNSp4
         DQKuvQjqwq0YMsDriPogjnwe0TrDYgkbN1jP/LPZdIYpoicNLbsTkbL5JOHkVmlSZRTH
         Wqwja2xM8juLSCT+EKdmszsz3NW+kQsf43aTTG5N/e9IvlarsKlVI4LV5jg5X4Acs3W9
         fn4RaPJCYUPZUxunJvBk06ZUwwP7neg7nZCUVK0yc5geqsmMFgclhIbgg3+PFZ9biZsr
         wUjrVhj1FLCirsMIXs8Nm30Y9sPoWcDr2n4I14YE9bvWqckqOoxFVDCapLpFK0447khG
         XAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713215782; x=1713820582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9fIh3VALFqD9z061oWIYxmy/nGl9jyEMXX1h/25FRE=;
        b=nM3qRMxBEyf2RF9TxPnv7Obsi7xopJX+IJcZwad7CRe9p6+1Yi92FbYkNr0hUnMGmD
         Oc8XU/5BgtcYhTKWedkc4l7MnepU0+p7cD6Kw/JNriDyYcqA6PVxKvK/muW4ES5ki5ux
         h1rMISmjCWZmvgkx7jCB74buIdeWP5tK3Ijc/BolfFldskXmbZ70Re23mh6m1lrjX0f2
         hnQuZ+FjH+cFcex867ULg93FVi08874G4jWrW2v3EHFc19qDH7T4Y5ZAtjx6wVX6w7Td
         ZdZyZ6LzBliAJmTyuEnTgP//zQMRCH+TFHCoiaT2errWtR45PnsToe/IUOCeeKex3UvH
         z7Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUC04peQIiFdG4pA7jTDQF8eFCPq8Lc1R1Z1U7WOeCqEpUNrhi+KeFkc+GExYlBH+eSP/QHWvkL99sULHpXwCtUHamdPbM2NsnMeDE=
X-Gm-Message-State: AOJu0YwPa5QQnKGMLXigejzEbDMuIsFWM/mK/qF6xGzCWh4W/o/XVcfX
	C4Meh6rKRl2BAiE93xYSCo59Z+i1HNLfLEi85NkO/eoiIUNkt/UA
X-Google-Smtp-Source: AGHT+IF1+uTq+xQ1n82ioW6Y/uh7mUgzMhyFGYdL7XD+lH07tjIkRcaSxgf7cBVA/IExEHo4wNounw==
X-Received: by 2002:a05:600c:1f89:b0:416:a4e8:715b with SMTP id je9-20020a05600c1f8900b00416a4e8715bmr8378072wmb.35.1713215781903;
        Mon, 15 Apr 2024 14:16:21 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id a14-20020a05600c348e00b004188a8369d9sm675883wmq.47.2024.04.15.14.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 14:16:21 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Kamil Kasperski <ressetkk@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Kamil Kasperski <ressetkk@gmail.com>
Subject:
 Re: [PATCH v4 3/3] arm64: dts: allwinner: h616: add support for T95 tv boxes
Date: Mon, 15 Apr 2024 23:16:20 +0200
Message-ID: <1961464.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <20240319-add-t95-axp313-support-v4-3-6204b6d23229@gmail.com>
References:
 <20240319-add-t95-axp313-support-v4-0-6204b6d23229@gmail.com>
 <20240319-add-t95-axp313-support-v4-3-6204b6d23229@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Kamil,

sorry for being a bit late.

Dne torek, 19. marec 2024 ob 18:50:24 GMT +2 je Kamil Kasperski napisal(a):
> Add dtsi file for T95 tv boxes and add initial support for T95 5G AXP313A
> variant with a board name H616-T95MAX-AXP313A-v3.0 Internal storage is not
> accessible due to lack of support for H616 NAND controller.
> 
> Signed-off-by: Kamil Kasperski <ressetkk@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
>  arch/arm64/boot/dts/allwinner/sun50i-h616-t95.dtsi | 109 +++++++++++++++++++++
>  .../dts/allwinner/sun50i-h616-t95max-axp313.dts    |  84 ++++++++++++++++
>  3 files changed, 194 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index 21149b346a60..294921f12b73 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -42,6 +42,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6-mini.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-cb1-manta.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-pi.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-t95max-axp313.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-longanpi-3h.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-t95.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-t95.dtsi
> new file mode 100644
> index 000000000000..4c02408733bc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-t95.dtsi
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2024 Kamil Kasperski <ressetkk@gmail.com>
> + *
> + * Common DT nodes for H616-based T95 TV boxes
> + * There are two versions reported with different PMIC variants.
> + */
> +
> +#include "sun50i-h616.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	aliases {
> +		ethernet1 = &sdio_wifi;
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
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
> +
> +	reg_vcc3v3: vcc3v3 {
> +		/* discrete 3.3V regulator */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc-3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
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
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&ehci2 {
> +	status = "okay";
> +};
> +
> +&ir {
> +	status = "okay";
> +};
> +
> +&mmc0 {
> +	cd-gpios = <&pio 8 16 GPIO_ACTIVE_LOW>;	/* PI16 */
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
> +&mmc1 {
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
> +&ohci0 {
> +	status = "okay";
> +};
> +
> +&ohci2 {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_ph_pins>;
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
> +	uart-has-rtscts;
> +	status = "okay";
> +};

I suppose UART1 is used for bluetooth, right? As is, this currently doesn't
help much. Is there any appropriate BT compatible?

Best regards,
Jernej

> +
> +&usbotg {
> +	dr_mode = "host";	/* USB A type receptable */
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-t95max-axp313.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-t95max-axp313.dts
> new file mode 100644
> index 000000000000..08a6b4fcc235
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-t95max-axp313.dts
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2024 Kamil Kasperski <ressetkk@gmail.com>
> + *
> + * Configuration for T95 TV box with board label H616-T95MAX-AXP313A-v3.0
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-h616-t95.dtsi"
> +
> +/ {
> +	model = "T95 5G (AXP313)";
> +	compatible = "t95,t95max-axp313", "allwinner,sun50i-h616";
> +};
> +
> +&mmc0 {
> +	vmmc-supply = <&reg_dldo1>;
> +};
> +
> +&mmc1 {
> +	vmmc-supply = <&reg_dldo1>;
> +	vqmmc-supply = <&reg_aldo1>;
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
> +			reg_aldo1: aldo1 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vcc1v8";
> +			};
> +
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
> +				regulator-max-microvolt = <1100000>;
> +				regulator-name = "vdd-cpu";
> +			};
> +
> +			reg_dcdc3: dcdc3 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <1500000>;
> +				regulator-max-microvolt = <1500000>;
> +				regulator-name = "vdd-dram";
> +			};
> +		};
> +	};
> +};
> +
> +&pio {
> +	vcc-pc-supply = <&reg_aldo1>;
> +	vcc-pf-supply = <&reg_dldo1>;
> +	vcc-pg-supply = <&reg_aldo1>;
> +	vcc-ph-supply = <&reg_dldo1>;
> +	vcc-pi-supply = <&reg_dldo1>;
> +};
> 
> 




