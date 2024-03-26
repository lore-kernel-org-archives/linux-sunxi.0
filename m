Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C9538F86
	for <linux-sunxi@lists.linux.dev>; Tue, 26 Mar 2024 22:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711492349; cv=none; b=FOX69/SFdE5rkBPrUzYwD11oXNsWe2/BJPag9fc7QS4OQgpKO3ApPh1ib5XRUYmchY93o2qPw8wQ/iZAh3ZeomMSGHTbfeJnYfGYGwAJlm47xZ6DZhIiUKYqgtkA0urGFHifXADBZkaO0QNZCnXvUo1in9lTFo2zGkW3grdW5e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711492349; c=relaxed/simple;
	bh=G8IMnTgdFM2pPUNtJoCwOydAfTfmgMa2vrLVpKm3cD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NFpoDCntV401+ncAfa5fid9JCVKOZ19+sZdLDgls9Y9gwA4KVMEScxxIF8iUzUZQ8mxwXDkrrz1Aul4CyrJmQRwItaDqisEkXJLePMY3RNA81hZR41G+it8KVU+tTZ5aHhrokZ3AxJnvMzCcP7N0OpvpiHI7TZYUCxiVB8MFzbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EngKLXZN; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EngKLXZN"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56bf6418434so4605362a12.0
        for <linux-sunxi@lists.linux.dev>; Tue, 26 Mar 2024 15:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711492346; x=1712097146; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czZaVt1tZndBDpDWh7Yn1f/JWoJLB8R3XRx6RA07zYE=;
        b=EngKLXZNaVaRE58/VgJn5t95bnAytHfsAcjrhtCIB2FP1rMtuYVIG6VaNWWG4gkPgg
         CMmw6anCLHo3PEmksgJS0jNB4mRrXPWjb2YS4ug4mTnAzD0aqHf639UuXPySyIXGOG2q
         1ZWzkLRviaqbjzzT6tO4+r8X2IaM+HNo0awn4WacQCOV5GsVHwg0Txc17ZSDJ8yJWm1c
         vzVNkP4vapFA8+J2beIz5cq3eF/OrLK/Ghp0fr/p/2mJ3UFsjqUMMAZtuMtqikK44bEI
         Ok35EcKrh+5cMLZgLCzCz23g0Gd5k/VDq3Em93J6QQ3T0PSXE7deJLyiys0lcdhyVHjX
         fccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711492346; x=1712097146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czZaVt1tZndBDpDWh7Yn1f/JWoJLB8R3XRx6RA07zYE=;
        b=ARn7YoEdJUhI89s7uxDz99AXDy2xPTdXhtoPeOG1T78xfOB4vw7RRhuvNYLEXuMCu0
         tRGQELlZbHWweEUwDeBqtebewYHriZ7w9HjibxRN9wixR3ljghck775j3RgHHPanIZwS
         8hv/dK8HbPjierNCT6lo0zvp/L/X/DrWFhUVwFUBh+27r6sMR7iWbcx/DWmGisj9dCL8
         +liENESNiirVgHcueOZm9PD+CRMF1I/m2ujnLVUKcDOqDfG7LAo3Gb3NonqoAddbgb5m
         5BC0QVhCwq9q/ncnBgZ/MxVPsPBeD2sdqDos9v1+KPOk8Istq9j1z8LnbCUbX6O0NGbB
         rzLw==
X-Forwarded-Encrypted: i=1; AJvYcCUml3zSzleThipnLEv121dFfa61OBeaR4N4i2Mnkzll1N4DqvSp6UgZwoI2hY9pBUjH3XL16Qv3hrjubjB4uBFbVW9Tn64re9InCgw=
X-Gm-Message-State: AOJu0YxjuI1u6fJVGExbIYG0tT0hiYjEz+AoDPCHHrO+jtbR5Es4pEWe
	nHG/ShOO+iQK+dWaKP+nXjLzjDamNlO6avyqnltc4ApVm0B3Cnaj
X-Google-Smtp-Source: AGHT+IGvLnuw331wIpiPtm3ikFDefUZiq4z+1E/B/I7kt8r2r3io1E2n8YjVK10RlpjRTI1TMGTGow==
X-Received: by 2002:a17:906:e0d5:b0:a46:1d4b:d81 with SMTP id gl21-20020a170906e0d500b00a461d4b0d81mr686983ejb.62.1711492346136;
        Tue, 26 Mar 2024 15:32:26 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id qs25-20020a170906459900b00a4663450fa9sm4703144ejc.188.2024.03.26.15.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 15:32:25 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Pavel =?ISO-8859-1?Q?L=F6bl?= <pavel@loebl.cz>
Cc: Pavel =?ISO-8859-1?Q?L=F6bl?= <pavel@loebl.cz>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH v2 3/3] ARM: dts: sun8i: h2+: add support for Banana Pi P2 Zero
 board
Date: Tue, 26 Mar 2024 23:32:24 +0100
Message-ID: <3286256.44csPzL39Z@jernej-laptop>
In-Reply-To: <20240320061334.4078912-1-pavel@loebl.cz>
References:
 <20240320001152.4077150-1-pavel@loebl.cz>
 <20240320061334.4078912-1-pavel@loebl.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 20. marec 2024 ob 07:13:32 CET je Pavel L=C3=B6bl napisal(a):
> Banana Pi P2 Zero is H2+-based board by Sinovoip internally similar
> to Banana Pi M2 Zero.
>=20
> It features:
> - Allwinner H2+, Quad-core Cortex-A7
> - 512MB DDR3 SDRAM
> - 8G eMMC flash
> - MicroSD card slot
> - 100M LAN
> - WiFi (AP6212) & Bluetooth onboard (SDIO + UART)
> - Micro USB OTG port
> - Micro USB connector (power only)
> - Mini HDMI
> - 40 PIN GPIO includes UART, SPI, I2C, IO etc.
> - GPIO-connected key and LED
> - CSI connector
> - IEEE 802.3af PoE standard PoE module support (optional)
>=20
> This adds support for v1.1 revision. There was also v1.0 available
> which has different SDcard CD polarity and Ethernet port LEDs
> disconnected in layout.
>=20
> Signed-off-by: Pavel L=C3=B6bl <pavel@loebl.cz>
> ---
>  arch/arm/boot/dts/allwinner/Makefile          |   1 +
>  .../sun8i-h2-plus-bananapi-p2-zero-v1.1.dts   | 287 ++++++++++++++++++
>  2 files changed, 288 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-h2-plus-bananapi-p2=
=2Dzero-v1.1.dts
>=20
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/all=
winner/Makefile
> index 2a4162657a2c..567e81cc7b0f 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -219,6 +219,7 @@ dtb-$(CONFIG_MACH_SUN8I) +=3D \
>  	sun8i-a83t-cubietruck-plus.dtb \
>  	sun8i-a83t-tbs-a711.dtb \
>  	sun8i-h2-plus-bananapi-m2-zero.dtb \
> +	sun8i-h2-plus-bananapi-p2-zero-v1.1.dtb \
>  	sun8i-h2-plus-libretech-all-h3-cc.dtb \
>  	sun8i-h2-plus-orangepi-r1.dtb \
>  	sun8i-h2-plus-orangepi-zero.dtb \
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-bananapi-p2-zero-v=
1.1.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-bananapi-p2-zero-v1.1.d=
ts
> new file mode 100644
> index 000000000000..bd38fe555442
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-bananapi-p2-zero-v1.1.dts
> @@ -0,0 +1,287 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2023 Pavel L=C3=B6bl <pavel@loebl.cz>
> + *
> + * Based on sun8i-h2-plus-bananapi-m2-zero.dts, which is:
> + *   Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.io>
> + */
> +
> +/dts-v1/;
> +#include "sun8i-h3.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	model =3D "Banana Pi BPI-P2-Zero v1.1";
> +	compatible =3D "sinovoip,bananapi-p2-zero-v1.1",
> +		"sinovoip,bananapi-p2-zero",
> +		"allwinner,sun8i-h2-plus";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +		serial1 =3D &uart1;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	connector {
> +		compatible =3D "hdmi-connector";
> +		type =3D "c";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint =3D <&hdmi_out_con>;
> +			};
> +		};
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		pwr-led {

Node names must be in the format led-[hex number], in this case led-0.

> +			label =3D "bananapi-p2-zero:red:pwr";

label is deprecated, replaced with function and color properties. Color you
already added.

> +			color =3D <LED_COLOR_ID_RED>;
> +			gpios =3D <&r_pio 0 10 GPIO_ACTIVE_LOW>; /* PL10 */
> +			default-state =3D "on";
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +
> +		switch-2 {
> +			label =3D "power";
> +			linux,code =3D <KEY_POWER>;
> +			gpios =3D <&r_pio 0 3 GPIO_ACTIVE_LOW>; /* PL3 */
> +			wakeup-source;
> +		};
> +	};
> +
> +	reg_vcc_5v: reg-vcc-5v {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "usb1-vbus";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-boot-on;
> +	};
> +
> +	reg_vcc_1v2: reg-vcc-1v2 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc-1v2";
> +		regulator-min-microvolt =3D <1200000>;
> +		regulator-max-microvolt =3D <1200000>;
> +		regulator-boot-on;
> +		vin-supply =3D <&reg_vcc_5v>;
> +	};
> +
> +	reg_vcc_3v3: reg-vcc-3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc-3v3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-boot-on;
> +		vin-supply =3D <&reg_vcc_5v>;
> +	};
> +
> +	reg_vdd_cpux: vdd-cpux-regulator {
> +		compatible =3D "regulator-gpio";
> +		regulator-name =3D "vdd-cpux";
> +		regulator-type =3D "voltage";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt =3D <1100000>;
> +		regulator-max-microvolt =3D <1300000>;
> +		regulator-ramp-delay =3D <50>; /* 4ms */
> +
> +		gpios =3D <&r_pio 0 1 GPIO_ACTIVE_HIGH>; /* PL1 */
> +		enable-active-high;
> +		gpios-states =3D <0x1>;
> +		states =3D <1100000 0>, <1300000 1>;
> +	};
> +
> +	wifi_pwrseq: wifi-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
> +		clocks =3D <&rtc CLK_OSC32K_FANOUT>;
> +		clock-names =3D "ext_clock";
> +	};
> +};
> +
> +&de {
> +	status =3D "okay";
> +};
> +
> +&cpu0 {
> +	cpu-supply =3D <&reg_vdd_cpux>;
> +};
> +
> +&ehci0 {
> +	status =3D "okay";
> +};
> +
> +&ohci0 {
> +	status =3D "okay";
> +};
> +
> +&hdmi {
> +	status =3D "okay";
> +};
> +
> +&hdmi_out {
> +	hdmi_out_con: endpoint {
> +		remote-endpoint =3D <&hdmi_con_in>;
> +	};
> +};
> +
> +&mmc0 {
> +	vmmc-supply =3D <&reg_vcc_3v3>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> +	cd-inverted;
> +	status =3D "okay";
> +};
> +
> +&mmc1 {
> +	vmmc-supply =3D <&reg_vcc_3v3>;
> +	vqmmc-supply =3D <&reg_vcc_3v3>;
> +	mmc-pwrseq =3D <&wifi_pwrseq>;
> +	bus-width =3D <4>;
> +	non-removable;
> +	status =3D "okay";
> +
> +	brcmf: wifi@1 {
> +		reg =3D <1>;
> +		compatible =3D "brcm,bcm4329-fmac";
> +		interrupt-parent =3D <&pio>;
> +		interrupts =3D <6 10 IRQ_TYPE_LEVEL_LOW>; /* PG10 / EINT10 */

PG10 is enough as a comment.

Anyway, please run DTB check with W=3D2 (extra warnings) to make sure dts
conforms to DT bindings.

Best regards,
Jernej

> +		interrupt-names =3D "host-wake";
> +	};
> +};
> +
> +&mmc2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&mmc2_8bit_pins>;
> +	vmmc-supply =3D <&reg_vcc_3v3>;
> +	vqmmc-supply =3D <&reg_vcc_3v3>;
> +	bus-width =3D <8>;
> +	non-removable;
> +	cap-mmc-hw-reset;
> +	status =3D "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pa_pins>;
> +	status =3D "okay";
> +};
> +
> +&uart1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> +	uart-has-rtscts;
> +	status =3D "okay";
> +
> +	bluetooth {
> +		compatible =3D "brcm,bcm4345c5";
> +		vbat-supply =3D <&reg_vcc_3v3>;
> +		vddio-supply =3D <&reg_vcc_3v3>;
> +		device-wakeup-gpios =3D <&pio 6 13 GPIO_ACTIVE_HIGH>; /* PG13 */
> +		host-wakeup-gpios =3D <&pio 6 11 GPIO_ACTIVE_HIGH>; /* PG11 */
> +		shutdown-gpios =3D <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
> +		clocks =3D <&rtc CLK_OSC32K_FANOUT>;
> +		clock-names =3D "lpo";
> +	};
> +};
> +
> +&emac {
> +	phy-handle =3D <&int_mii_phy>;
> +	phy-mode =3D "mii";
> +	phy-supply =3D <&reg_vcc_1v2>;
> +	allwinner,leds-active-low;
> +	status =3D "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode =3D "otg";
> +	status =3D "okay";
> +};
> +
> +&pio {
> +	gpio-line-names =3D
> +		/* PA */
> +		"CON2-P13", "CON2-P11", "CON2-P22", "CON2-P15",
> +			"CON3-P03", "CON3-P02", "CON2-P07", "CON2-P29",
> +		"CON2-P31", "CON2-P33", "CON2-P35", "CON2-P05",
> +			"CON2-P03", "CON2-P08", "CON2-P10", "CON2-P16",
> +		"CON2-P12", "CON2-P37", "CON2-P28", "CON2-P27",
> +			"CON2-P40", "CON2-P38", "", "",
> +		"", "", "", "", "", "", "", "",
> +
> +		/* PB */
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +
> +		/* PC */
> +		"CON2-P19", "CON2-P21", "CON2-P23", "CON2-P24",
> +			"CON2-P18", "", "", "CON2-P26",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +
> +		/* PD */
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "CSI-PWR-EN", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +
> +		/* PE */
> +		"CN3-P17", "CN3-P13", "CN3-P09", "CN3-P07",
> +			"CN3-P19", "CN3-P21", "CN3-P22", "CN3-P20",
> +		"CN3-P18", "CN3-P16", "CN3-P14", "CN3-P12",
> +			"CN3-P05", "CN3-P03", "CN3-P06", "CN3-P08",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +
> +		/* PF */
> +		"SDC0-D1", "SDC0-D0", "SDC0-CLK", "SDC0-CMD", "SDC0-D3",
> +			"SDC0-D2", "SDC0-DET", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +
> +		/* PG */
> +		"WL-SDIO-CLK", "WL-SDIO-CMD", "WL-SDIO-D0", "WL-SDIO-D1",
> +			"WL-SDIO-D2", "WL-SDIO-D3", "BT-UART-TX", "BT-UART-RX",
> +		"BT-UART-RTS", "BT-UART-CTS", "WL-WAKE-AP", "BT-WAKE-AP",
> +			"BT-RST-N", "AP-WAKE-BT", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "";
> +};
> +
> +&r_pio {
> +	gpio-line-names =3D
> +		/* PL */
> +		"", "CPUX-SET", "CON2-P32", "POWER-KEY", "CON2-P36",
> +			"VCC-IO-EN", "USB0-ID", "WL-PWR-EN",
> +		"PWR-STB", "PWR-DRAM", "PWR-LED", "IR-RX", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "";
> +};
> +
> +&usbphy {
> +	usb0_id_det-gpios =3D <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
> +
> +	/*
> +	 * There're two micro-USB connectors, one is power-only and another is
> +	 * OTG. The Vbus of these two connectors are connected together, so
> +	 * the external USB device will be powered just by the power input
> +	 * from the power-only USB port or optional POE module.
> +	 */
> +	status =3D "okay";
> +};
>=20




