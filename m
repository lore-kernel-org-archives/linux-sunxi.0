Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE28481AA
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Feb 2024 18:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707156771; cv=none; b=opms8hcqFzNPwyJ16TqmsDBVYt9EJgFKWktpdOv5Ys4GnKHMukMYCe9P4d5gnY30yotScDnW7Zy7b47H1OkMkkKKK/DhQmWUe9yOZUd/+cyvX7i3r9RvIECKWLr6Kok6A3hnnDEuxgCL3atKI+dx1oz5YcVkNtukVxMzhLesvB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707156771; c=relaxed/simple;
	bh=S6q1lA0A7Cs2/Oa6DT2sdz4l3uh+gGY640UfM4YTOJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=av154PQFL8GA4btTvExCYraRgdPIBgczw5AoDQRwP7mDERl3y+Lhm09otIyczobh71VZZN0N5S0EO3M+EJKyOhZxkIk8cm9gTMFgzMBS5FJpYpzUua/Ki4PzVW1W0xYj3KpGZp+9eO7kKXwNtgAc90Pv0JVynhiRft7KZcnXI4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBofksgQ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBofksgQ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33aeb088324so3520558f8f.2
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Feb 2024 10:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707156767; x=1707761567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unXniA0PsmATrlDxdYrAN5scfQkqdzqW/x/0voFVReM=;
        b=CBofksgQ+dhYZ+f4hbtyhj2aEgKOD1oyzBjKHBCo+cub+JLjc+4cxj7CixwE27igW4
         jVl4VLBARjQRg8kFmSsjCALeZo0H5fzxsRdJmQBgBMxlg3ibhw9ooclMBi/c+oj22agC
         aZ6oELeQ2qZUNkcoGfwaLNUJZZS9d+MyOcqLYmAyjYaQNcHKjCQUDvQ5+t2eJXQRKUAz
         U0f8bE99NB3hCeuEq2S0923qDl6aWsVRgkzbeZXas+o5H0Ey/hx/CO67ui0JEkMlJ6Ft
         e5bE3A1TkfHEnPYgfJ+feLn08zNsy6VZV0WV9tIjlEvlDt5t4MgMW8vkbI+3FDApV3QY
         AmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707156767; x=1707761567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unXniA0PsmATrlDxdYrAN5scfQkqdzqW/x/0voFVReM=;
        b=npfnZQHjAeWT7w4Z/hMs4rEUXYd4tDVM/mlPb7poH6zEfftH5RDpTY7FgK9zrWsEGN
         BJ64XRfRqRwm58m37mNrG2Ah+XtX3tP/3CVbeizrtIYyUq2+XYbCNxvDL6K+KFdAWP28
         m/hyTu0C4uTxM6HIEYM6phVsznPcSVAhVnj4DGqI/r5x28Gx/RRwansfKmC5l5CzzcJq
         d+L/bL6ArN0ggsfx5/q80Kt967SMKH7FWriSS5YCVRxmB6Zr26daAk33uERjrajBmO3a
         MOroiqbxPb+z5gqdYXANdPQqg1Ku4KqLD9PIRgrDngCFOniyoaUlEEx9y9nMvqBUj4KZ
         Q4Mg==
X-Gm-Message-State: AOJu0YwIBy77BnqxjRz45ebs6/jywwAdUiIdlEJqsFdtiq6MQxyP3HA3
	tNYBY3Odoru0ZjDsdsv4alusJqelACSre6JL7eEeFP4TbSiQZbmD
X-Google-Smtp-Source: AGHT+IFCyDgKh5TFnAySuCapLvL6616XjzCad8+Zsx0L4mhq+dU+YliaSTVBGzYIa6EaA2+j20LkNw==
X-Received: by 2002:a5d:4d89:0:b0:33b:3c04:ddbd with SMTP id b9-20020a5d4d89000000b0033b3c04ddbdmr206143wru.21.1707156766491;
        Mon, 05 Feb 2024 10:12:46 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUBwPBFqr9WsPBg9XqTDGkt3masMP91WuSQMSovpJo7O2td8qaH16wtbYeR8+pjP3ZtSE3P0HzguVT16VxwxsugpQLZI+iNzVz/9g23bgGmmbOK6b9yWzGoqDQSjZUCTFQkQzXZazHXdwd/r38s1pahX04kRIVhnBz/WP/AA4xjWOAhSgcdXNxWcrs5DOWPEy7UkposXb6yX/x8ENfjoYpVBX3h1NNDFfurlyFZaiV04gJ4vTm/+78GqVd/PpjttaTaGl85+STUWadggS9s4ieBtZbuHVZcH1bN7XN3bTyC5imQ+s41eEHZ+DfnAG9z6lUgQ6vZ4aqulxZ1OsthgaOC5A==
Received: from jernej-laptop.localnet (82-149-13-182.dynamic.telemach.net. [82.149.13.182])
        by smtp.gmail.com with ESMTPSA id o28-20020adfa11c000000b0033b3ceda5dbsm171248wro.44.2024.02.05.10.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 10:12:46 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Alilovic <nickalilovic@gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: Add Jide Remix Mini PC support
Date: Mon, 05 Feb 2024 19:12:45 +0100
Message-ID: <3280179.44csPzL39Z@jernej-laptop>
In-Reply-To: <20240204094404.149776-4-andre.przywara@arm.com>
References:
 <20240204094404.149776-1-andre.przywara@arm.com>
 <20240204094404.149776-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre!

Dne nedelja, 04. februar 2024 ob 10:44:04 CET je Andre Przywara napisal(a):
> The Remix Mini PC is a "mini computer" using the Allwinner H64 SoC,
> which appears to be just a relabelled A64. It was launched in 2015 by
> the now defunct company Jide, and shipped with a desktop optimised
> version of Android. It features
> 	- Allwinner H64 Soc (4 * Arm Cortex-A53 cores)
> 	- 1 or 2 GB DRAM
> 	- 8 or 16 GB eMMC flash
> 	- 100 MBit Ethernet port (using an X-Powers AC200 PHY)
> 	- RTL8723BS WiFi & Bluetooth chip
> 	- HDMI port
> 	- two USB 2.0 ports
> 	- 3.5mm AV port
> 	- microSD card slot
> 
> The devicetree covers most peripherals, though there is no agreed
> binding for the PHY chip yet, so this is left out.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../allwinner/sun50i-h64-remix-mini-pc.dts    | 357 ++++++++++++++++++
>  2 files changed, 358 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index 91d505b385de..2db3b15ad09f 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab-early-adopter.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h64-remix-mini-pc.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus-v1.2.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts b/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts
> new file mode 100644
> index 000000000000..537923a541a8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts
> @@ -0,0 +1,357 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (c) 2018 ARM Ltd.

Shouldn't be 2024?

> +
> +/dts-v1/;
> +
> +#include "sun50i-a64.dtsi"
> +#include "sun50i-a64-cpu-opp.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "Remix Mini PC";
> +	compatible = "jide,remix-mini-pc", "allwinner,sun50i-h64",
> +		     "allwinner,sun50i-a64";
> +
> +	aliases {
> +		ethernet1 = &rtl8723bs;
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint = <&hdmi_out_con>;
> +			};
> +		};
> +	};
> +
> +	reg_vcc5v: regulator-5v {
> +		/* board wide 5V supply directly from the DC input */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc-5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	wifi_pwrseq: wifi_pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		pinctrl-names = "default";
> +		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
> +		post-power-on-delay-ms = <200>;
> +	};
> +};
> +
> +&codec {
> +	status = "okay";
> +};
> +
> +&codec_analog {
> +	cpvdd-supply = <&reg_eldo1>;
> +	status = "okay";
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
> +&cpu2 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
> +&cpu3 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
> +&dai {
> +	status = "okay";
> +};
> +
> +&de {
> +	status = "okay";
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&ehci1 {
> +	status = "okay";
> +};
> +
> +&hdmi {
> +	hvcc-supply = <&reg_dldo1>;
> +	status = "okay";
> +};
> +
> +&hdmi_out {
> +	hdmi_out_con: endpoint {
> +		remote-endpoint = <&hdmi_con_in>;
> +	};
> +};
> +
> +/* Connects to the AC200 chip */
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0_pins>;
> +	status = "okay";
> +};
> +
> +&i2c0_pins {
> +	bias-pull-up;
> +};
> +
> +&mmc0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_pins>;
> +	vmmc-supply = <&reg_dcdc1>;
> +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
> +&mmc1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc1_pins>;
> +	vmmc-supply = <&reg_aldo1>;
> +	vqmmc-supply = <&reg_dldo4>;
> +	mmc-pwrseq = <&wifi_pwrseq>;
> +	bus-width = <4>;
> +	non-removable;
> +	status = "okay";
> +
> +	rtl8723bs: wifi@1 {
> +		reg = <1>;
> +		interrupt-parent = <&r_pio>;
> +		interrupts = <0 3 IRQ_TYPE_LEVEL_LOW>; /* PL3 */
> +		interrupt-names = "host-wake";
> +	};

Node without compatible doesn't help. Please remove it.

> +};
> +
> +&mmc2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc2_pins>, <&mmc2_ds_pin>;
> +	vmmc-supply = <&reg_dcdc1>;
> +	vqmmc-supply = <&reg_eldo1>;
> +	bus-width = <8>;
> +	non-removable;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;

Aren't these speed modes enabled by default?


Best regards,
Jernej

> +	cap-mmc-hw-reset;
> +	status = "okay";
> +};
> +
> +&ohci0 {
> +	status = "okay";
> +};
> +
> +&ohci1 {
> +	status = "okay";
> +};
> +
> +&pio {
> +	vcc-pb-supply = <&reg_dcdc1>;
> +	vcc-pc-supply = <&reg_dcdc1>;
> +	vcc-pd-supply = <&reg_dcdc1>;
> +	vcc-pe-supply = <&reg_dcdc1>;
> +	vcc-pf-supply = <&reg_dcdc1>;
> +	vcc-pg-supply = <&reg_dldo4>;
> +	vcc-ph-supply = <&reg_dcdc1>;
> +};
> +
> +&r_ir {
> +	status = "okay";
> +};
> +
> +&r_pio {
> +	/*
> +	 * We cannot add that supply for now since it would create a circular
> +	 * dependency between pinctrl, the regulator and the RSB Bus.
> +	 *
> +	 * vcc-pl-supply = <&reg_aldo2>;
> +	 */
> +};
> +
> +&r_rsb {
> +	status = "okay";
> +
> +	axp803: pmic@3a3 {
> +		compatible = "x-powers,axp803";
> +		reg = <0x3a3>;
> +		interrupt-parent = <&r_intc>;
> +		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_LOW>;
> +		x-powers,drive-vbus-en;
> +
> +		vin1-supply = <&reg_vcc5v>;
> +		vin2-supply = <&reg_vcc5v>;
> +		vin3-supply = <&reg_vcc5v>;
> +		vin5-supply = <&reg_vcc5v>;
> +		vin6-supply = <&reg_vcc5v>;
> +		aldoin-supply = <&reg_vcc5v>;
> +		dldoin-supply = <&reg_vcc5v>;
> +		eldoin-supply = <&reg_vcc5v>;
> +		fldoin-supply = <&reg_vcc5v>;
> +		drivevbus-supply = <&reg_vcc5v>;
> +		ips-supply = <&reg_vcc5v>;
> +
> +		status = "okay";
> +	};
> +};
> +
> +#include "axp803.dtsi"
> +
> +&ac_power_supply {
> +	status = "okay";
> +};
> +
> +&reg_dcdc1 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-3v3";
> +};
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1040000>;
> +	regulator-max-microvolt = <1300000>;
> +	regulator-name = "vdd-cpux";
> +};
> +
> +/* DCDC3 is polyphased with DCDC2 */
> +
> +&reg_dcdc5 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1500000>;
> +	regulator-max-microvolt = <1500000>;
> +	regulator-name = "vcc-dram";
> +};
> +
> +/* Deviates from the reset default of 1.1V. */
> +&reg_dcdc6 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1200000>;
> +	regulator-max-microvolt = <1200000>;
> +	regulator-name = "vdd-sys";
> +};
> +
> +&reg_aldo1 {
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-wifi";
> +};
> +
> +&reg_aldo2 {
> +	/* Specifying R_PIO consumer would create circular dependency. */
> +	regulator-always-on;
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-pl";
> +};
> +
> +&reg_aldo3 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3000000>;
> +	regulator-max-microvolt = <3000000>;
> +	regulator-name = "vcc-pll-avcc";
> +};
> +
> +/* AC200 power supply */
> +&reg_dldo1 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-ave-33";
> +};
> +
> +&reg_dldo4 {
> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-wifi-io";
> +};
> +
> +&reg_drivevbus {
> +	regulator-name = "usb0-vbus";
> +	status = "okay";
> +};
> +
> +&reg_eldo1 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1800000>;
> +	regulator-max-microvolt = <1800000>;
> +	regulator-name = "vcc-cpvdd-dram-emmc";
> +};
> +
> +/* Supplies the arisc management core, needed by TF-A to power off cores. */
> +&reg_fldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1100000>;
> +	regulator-max-microvolt = <1100000>;
> +	regulator-name = "vdd-cpus";
> +};
> +
> +&reg_rtc_ldo {
> +	regulator-name = "vcc-rtc";
> +};
> +
> +&simplefb_hdmi {
> +	vcc-hdmi-supply = <&reg_dcdc1>;
> +};
> +
> +&sound {
> +	simple-audio-card,aux-devs = <&codec_analog>;
> +	simple-audio-card,widgets = "Microphone", "Microphone Jack",
> +				    "Headphone", "Headphone Jack";
> +	simple-audio-card,routing =
> +			"Left DAC", "DACL",
> +			"Right DAC", "DACR",
> +			"Headphone Jack", "HP",
> +			"ADCL", "Left ADC",
> +			"ADCR", "Right ADC",
> +			"MIC2", "Microphone Jack";
> +	status = "okay";
> +};
> +
> +/* On the (unpopulated) UART pads. */
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pb_pins>;
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
> +	uart-has-rtscts;
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "realtek,rtl8723bs-bt";
> +		enable-gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
> +		max-speed = <1500000>;
> +	};
> +};
> +
> +&usb_otg {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	usb0_vbus-supply = <&reg_drivevbus>;
> +	usb1_vbus-supply = <&reg_drivevbus>;
> +	status = "okay";
> +};
> 




