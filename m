Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CD05E22B
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Feb 2024 20:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707682936; cv=none; b=IwTkiOcusEhvoWsK/1cwf217KGfDI+DTjR7WgyNZCTzHD9o8gKim5ZsqfrIzHPiUlH3x8diVXig0Rvt3ouZlkaRMf3FW/AONPCeW0SMbzsUeoB70B44uDjHD2wfsCCB9ocg1cLq3WcdVnBAHxW9LOSwJ4x99P5+1W+W15cGt1JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707682936; c=relaxed/simple;
	bh=BnqZbwlWndWGHb2kMgY8KVwzLWgZcCnUPDSvAdz4/u0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QteWmYgdNd5yAP1+ohW33PS78L+ofL4CjdKTWh6ijqM4/S+0Kv6WmuXCwu3ZqkRc8VEkIhG6JV6QgU2LgSap63+oO9akXT/xmZ7AjYmhaktK7gPGVyHg3W2Wd3+4EfZykHH7MakRwvgnOn7kCa68w7BGlhaH/AzUMAU8WUVnQc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IocOUw80; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IocOUw80"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41089cc9ae4so10059205e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 11 Feb 2024 12:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707682933; x=1708287733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7Mkr1zhHmz0WP38eyAJ3mhqGHkB1EOoRhhXSYzyRm4=;
        b=IocOUw80aHoeEsVlPj5f2bvGq/elYYXRy+ZXYV+8CYlold7ftVvpnqVYwED6eM02tI
         MkTLa+s4dXVf+rDybtDIygWDYfy0p7Plr9XSP73o+bwMCIA9KxBCaCzTh7MRZmQaw+u4
         NbUA3ftahgjLhJwmI/bOenI8XdW7CA6ez/CebL8GmdeU0MdpW6XdRmSAd9poH3hOqTKB
         tPR3V08mU3Ykki/cDXTirqDBvG+u6w9rioANvxIHAkWwHa5hfr124wQumiuKyK59aipl
         XpLO07jcs4TsBQ+L1EHLUNWWMdlxj6lu1EJerinh3AGV1R6m06mgf3Oilu/KOcS83uTM
         Y0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707682933; x=1708287733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P7Mkr1zhHmz0WP38eyAJ3mhqGHkB1EOoRhhXSYzyRm4=;
        b=HS0Ey2fXQCXAPb/qCZqHU9vab762KWCaHm/g4eCbWu0BQ7J4FgVHnS7CBlWFpJCQWD
         V9cPIZltC8LaDjLiJVzbQ5nabFFs5sjHB9ttmKr4IomHhtintTRdjyqmLdHri6ImNuu1
         G7dCVp/s9qllV6HSJ2voqqtAED223l6OfMzM2xQL/21bqJR59G4U6i+3oVU0S7G00cXE
         Y/kjLZgjz5WSCCqjF1FLbyxYqGwPvn4pUdsg8DuBr2L6AyGFPwCqS0ZldYJHzXVORGJC
         pn+m+5dyJtdPdQF1BJgxNjeNHso5kxl+cIbrBrsLOD4cOjgeHjMed1tiqCCx5xt77nZn
         E80A==
X-Gm-Message-State: AOJu0YxLH3Rd6YgsPki5e6FF9OLCmuQxoieNc2VIPrvUvgByCU/lR4Hw
	to9G9TeDKhVwlUojyzt6vM7CniwxbUxwyJNpgPiE9pe3BofDS1t8
X-Google-Smtp-Source: AGHT+IFW7n6cfpnUeDZOYPFgJUyGR0x1bHJpttPtRhBeWJpu1LTUieJ6i6TOMZtzgQRxYCDR/Vn00A==
X-Received: by 2002:a05:600c:4fc9:b0:410:68e1:d9ca with SMTP id o9-20020a05600c4fc900b0041068e1d9camr4322587wmq.2.1707682932731;
        Sun, 11 Feb 2024 12:22:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbLwbNTm0GY3IEjH42B1/CudtNA/ITJEfJQMA3ddBlA7jQiXIHHqt4hhUCU5wtR83/QrNAHOvlcFfoQ6L/dTdyHgCUzHgB1E0ePRqxzBgKluQjXfl2HhC4U1KdxNSQVs5hditzp5yIuvkmbSqGixmzRg57EFVmMw5GZ+e+oXGyz41cB/NLPmLExHiZ9BZK6pS1YstsUpo4j37JuFDlzfYsxBLGPi/v8BW2i+0wTyQEq6cH0a/hUQcgB3iMfFYRxCpFfV6N8wFKRz3KjcPIngWE6BCt49ai4wZMmUgdbyrupcZqS/HUGbgskvX/gX90HZWSVDZnVR6VoqU=
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ay8-20020a05600c1e0800b00410c4aefe5fsm1905663wmb.24.2024.02.11.12.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 12:22:12 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>
Subject:
 Re: [PATCH v2 2/2] arm64: dts: allwinner: h618: add BananaPi M4 Berry board
Date: Sun, 11 Feb 2024 21:22:11 +0100
Message-ID: <3791760.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <22174359.EfDdHjke4D@jernej-laptop>
References:
 <20240204101054.152012-1-andre.przywara@arm.com>
 <20240204101054.152012-3-andre.przywara@arm.com>
 <22174359.EfDdHjke4D@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi Andre!

Dne ponedeljek, 05. februar 2024 ob 19:19:26 CET je Jernej =C5=A0krabec nap=
isal(a):
> Dne nedelja, 04. februar 2024 ob 11:10:54 CET je Andre Przywara napisal(a=
):
> > The BananaPi M4 Berry is a development board using the Allwinner H618
> > SoC. It comes with the following specs:
> > 	- Allwinner H618 SoC (4 * Arm Cortex-A53 cores, 1MB L2 cache)
> > 	- 2 GiB LPDDR4 DRAM
> > 	- 8 GiB eMMC flash
> > 	- AXP313a PMIC
> > 	- Gigabit Ethernet, using RTL8211 PHY
> > 	- RTL8821CU USB WiFi chip
> > 	- HDMI port
> > 	- 4 * USB 2.0 ports, via an on-board hub chip
> > 	- microSD card slot
> > 	- 3.5mm A/V port
> > 	- power supply and USB-OTG via USB-C connector
> >=20
> > Add a devicetree file describing the components that we already have
> > bindings for, that excludes audio and video at the moment.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >  .../sun50i-h618-bananapi-m4-berry.dts         | 223 ++++++++++++++++++
> >  2 files changed, 224 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-bananapi-=
m4-berry.dts
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/d=
ts/allwinner/Makefile
> > index 2db3b15ad09f..1c5c204a109b 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -43,5 +43,6 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-bigtreetech=
=2Dcb1-manta.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-bigtreetech-pi.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-orangepi-zero2.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-x96-mate.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-bananapi-m4-berry.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-orangepi-zero3.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-transpeed-8k618-t.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-bananapi-m4-berr=
y.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-bananapi-m4-berry.dts
> > new file mode 100644
> > index 000000000000..a3f8ff75db42
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-bananapi-m4-berry.dts
> > @@ -0,0 +1,223 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (C) 2023 Arm Ltd.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-h616.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/linux-event-codes.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/leds/common.h>
> > +
> > +/ {
> > +	model =3D "BananaPi M4 Berry";
> > +	compatible =3D "sinovoip,bananapi-m4-berry", "allwinner,sun50i-h618";
> > +
> > +	aliases {
> > +		ethernet0 =3D &emac0;
> > +		serial0 =3D &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path =3D "serial0:115200n8";
> > +	};
> > +
> > +	leds {
> > +		compatible =3D "gpio-leds";
> > +
> > +		led-0 {
> > +			function =3D LED_FUNCTION_STATUS;
> > +			color =3D <LED_COLOR_ID_GREEN>;
> > +			gpios =3D <&pio 2 12 GPIO_ACTIVE_LOW>; /* PC12 */
> > +		};
> > +	};
> > +
> > +	gpio-keys {
> > +		compatible =3D "gpio-keys";
> > +
> > +		key-sw3 {
> > +			label =3D "sw3";
> > +			linux,code =3D <BTN_0>;
> > +			gpios =3D <&pio 2 7 GPIO_ACTIVE_LOW>;	/* PC7 */
> > +		};
> > +	};
> > +
> > +	reg_vcc5v: regulator-5v {
> > +		/* board wide 5V supply directly from the USB-C socket */
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "vcc-5v";
> > +		regulator-min-microvolt =3D <5000000>;
> > +		regulator-max-microvolt =3D <5000000>;
> > +		regulator-always-on;
> > +	};
> > +
> > +	reg_usb_vbus: regulator-usb-vbus {
> > +		/* separate discrete regulator for the USB ports */
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "usb-vbus";
> > +		regulator-min-microvolt =3D <5000000>;
> > +		regulator-max-microvolt =3D <5000000>;
> > +		vin-supply =3D <&reg_vcc5v>;
> > +	};
> > +
> > +	reg_3v3: regulator-3v3 {
> > +		/* separate discrete regulator for WiFi and Ethernet PHY */
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "vcc-3v3";
> > +		regulator-min-microvolt =3D <3300000>;
> > +		regulator-max-microvolt =3D <3300000>;
> > +		vin-supply =3D <&reg_vcc5v>;
> > +	};
> > +};
> > +
> > +&cpu0 {
> > +	cpu-supply =3D <&reg_dcdc2>;
> > +};
> > +
> > +/* Connected to an on-board RTL8821CU USB WiFi chip. */
> > +&ehci1 {
> > +	status =3D "okay";
> > +};
> > +
> > +/* EHCI2 is on unpopulated pins */
> > +
> > +/* Connected to an on-board FE1.1s USB hub chip, supplying 4 USB-A por=
ts. */
> > +&ehci3 {
> > +	status =3D "okay";
> > +};
> > +
> > +&emac0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&ext_rgmii_pins>;
> > +	phy-mode =3D "rgmii";
> > +	phy-handle =3D <&ext_rgmii_phy>;
> > +	phy-supply =3D <&reg_3v3>;
> > +	allwinner,rx-delay-ps =3D <3100>;
> > +	allwinner,tx-delay-ps =3D <700>;
> > +	status =3D "okay";
> > +};
> > +
> > +&ir {
> > +	status =3D "okay";
> > +};
> > +
> > +&mdio0 {
> > +	ext_rgmii_phy: ethernet-phy@1 {
> > +		compatible =3D "ethernet-phy-ieee802.3-c22";
> > +		reg =3D <1>;
> > +		reset-gpios =3D <&pio 8 16 GPIO_ACTIVE_LOW>;	/* PI16 */
> > +	};
> > +};
> > +
> > +&mmc0 {
> > +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
> > +	vmmc-supply =3D <&reg_dldo1>;
> > +	bus-width =3D <4>;
> > +	status =3D "okay";
> > +};
> > +
> > +&mmc2 {
> > +	vmmc-supply =3D <&reg_dldo1>;
> > +	vqmmc-supply =3D <&reg_aldo1>;
> > +	bus-width =3D <8>;
> > +	non-removable;
> > +	cap-mmc-hw-reset;
> > +	mmc-ddr-1_8v;
>=20
> This one should be dropped.

Can you please test this one? If it works, I'll merge this series.

Best regards,
Jernej
=20
> > +	mmc-hs200-1_8v;
> > +	status =3D "okay";
> > +};
> > +
> > +/* USB ports 1 and 3 connect to onboard devices that are high-speed on=
ly. */
> > +
> > +/* OHCI2 is on unpopulated pins */
> > +
> > +&pio {
> > +	vcc-pc-supply =3D <&reg_aldo1>;
> > +	vcc-pf-supply =3D <&reg_dldo1>;
> > +	vcc-pg-supply =3D <&reg_dldo1>;
> > +	vcc-ph-supply =3D <&reg_dldo1>;
> > +	vcc-pi-supply =3D <&reg_dldo1>;
> > +};
> > +
> > +&r_i2c {
> > +	status =3D "okay";
> > +
> > +	axp313: pmic@36 {
> > +		compatible =3D "x-powers,axp313a";
> > +		reg =3D <0x36>;
> > +		#interrupt-cells =3D <1>;
> > +		interrupt-controller;
> > +		interrupt-parent =3D <&pio>;
> > +
> > +		vin1-supply =3D <&reg_vcc5v>;
> > +		vin2-supply =3D <&reg_vcc5v>;
> > +		vin3-supply =3D <&reg_vcc5v>;
> > +
> > +		regulators {
> > +			reg_aldo1: aldo1 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D <1800000>;
> > +				regulator-max-microvolt =3D <1800000>;
> > +				regulator-name =3D "vcc-1v8-pll";
> > +			};
> > +
> > +			reg_dldo1: dldo1 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D <3300000>;
> > +				regulator-max-microvolt =3D <3300000>;
> > +				regulator-name =3D "vcc-3v3-io";
> > +			};
> > +
> > +			reg_dcdc1: dcdc1 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D <810000>;
> > +				regulator-max-microvolt =3D <990000>;
> > +				regulator-name =3D "vdd-gpu-sys";
> > +			};
> > +
> > +			reg_dcdc2: dcdc2 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D <810000>;
> > +				regulator-max-microvolt =3D <1100000>;
> > +				regulator-name =3D "vdd-cpu";
> > +			};
> > +
> > +			reg_dcdc3: dcdc3 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt =3D <1100000>;
> > +				regulator-max-microvolt =3D <1100000>;
> > +				regulator-name =3D "vdd-dram";
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&uart0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&uart0_ph_pins>;
> > +	status =3D "okay";
> > +};
> > +
> > +&usbotg {
> > +	/*
> > +	 * PHY0 pins are connected to a USB-C socket, but a role switch is not
> > +	 * implemented: both CC pins are pulled to GND via a 5.1K resistor.
> > +	 * The VBUS pins power the device, so a fixed peripheral mode
> > +	 * is the best choice.
> > +	 * The board can be powered via GPIOs, in this case port0 *can*
> > +	 * act as a host (with a cable/adapter ignoring CC), as VBUS is
> > +	 * then provided by the GPIOs. Any user of this setup would
> > +	 * need to adjust the DT accordingly: dr_mode set to "host",
> > +	 * enabling OHCI0 and EHCI0.
> > +	 */
> > +	dr_mode =3D "peripheral";
> > +	status =3D "okay";
> > +};
> > +
> > +&usbphy {
> > +	usb3_vbus-supply =3D <&reg_usb_vbus>;
> > +	status =3D "okay";
> > +};
> >=20
>=20
>=20
>=20
>=20
>=20




