Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE2747F7E
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Feb 2024 18:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707157229; cv=none; b=PQbzRZf/tTXCaHVIknMqjMf8BtZr5rsQLBTvwGLn5rtAEKzs+0M7qQuYLdXxfpUerJdAr4X3sFTOwHoVmEL4ciKeenGGNm+1dYrSjbHCfPB+OVxvfSqELf28uza+osPpjaTnIfRdw3lvHVMldY/6Z6aGKc/UqOvmNxfpr+hpshQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707157229; c=relaxed/simple;
	bh=27DTfQWOWo+WN4QsBhsd/VH5DgNn9hGpY6TtVrq/q2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pDVR6chDjHJ0WvEmUEnNCwb9yNATS7H0+3nLTXv3SCyNPmLSzWo5XoZlD3bT4W/2ltAJaoUN3VPYweIADv9BEruI3YenD8k39bZGR/2r0tJ0YX82xPg1k3P0P8ug6u20DnZLY0TUrVpOi4G5S5fPMWwg/7MgY7tDdsu0nq2X8Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxiw2qbV; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxiw2qbV"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33b28aadb28so1759784f8f.3
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Feb 2024 10:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707157226; x=1707762026; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDaMto9AgVUOhIc9xou59hHctT3KVbNxCfT1U4jYVww=;
        b=lxiw2qbVWKXl9iEP+TPQ+NAtyNeSXNzwCq1ZJAjA1o3Y0Z122XQwaPZ8B+HJuOdDar
         ts3gWbt+adzTNmFTyz9XuVBjl5Ex/AMW8QdxGNiM1nNsYmd9TTHjCjJsFvxwnWO0TwBW
         IMrYv6jiu925AiRREU8hiQPDTOt5mUrIY9aScMN/a7vHXSbvnDDbu3OeskDVX2eVsg9O
         YdRNcWw7pisvLemyXw1qEUtIUlDA5A4BFqbDMcKeDjCEECaNwA45WFuYLuNb6X48a5PC
         7pJoQjk1Wp4kSBCnqbWaq3Y00cMmwvAYef0s8Y/91vTzb+QcrqlLN1qxBr/F6Onya8Z9
         kTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707157226; x=1707762026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDaMto9AgVUOhIc9xou59hHctT3KVbNxCfT1U4jYVww=;
        b=ruj0vGSCZ0Iyi81N5UMIr5UHCzHa2byfEFFggXMFo8l2XhN4M+8XR3wkwu3Snvyy96
         QS9myzGo1mKelO41edI+rIs3FfDGel+tjh78aki5nl2fA4seUsKN4C51l1lBXzibR1UI
         ImxjqqRzb3KM3jYkNgRPIRt0z8HkIGERsI1X3XKLVDbbDPHSmVViH5ahF69LQRt9Nxfs
         tozYLIg+ERz2n8xSMUG61kzcrjJz2yiB+kocteOROfKbPpumMtQTKPkoOhqvfpA+j1x1
         k7jm5vKOPefB3nNWQ4DkL2F5o2VbH2apYpS8scTTtYG+dMs4VP/tFgqBiZF8gmDoqUyE
         d7EA==
X-Gm-Message-State: AOJu0YwxuMCtMFkaihTjNJiWsC1x5O3NOOv+lfKXJ5QZIvQ9A4reAihU
	gOD0hw7DtEPkYnDpWQVU5n/xq7SK2OHSNZTCiQCZLYXnyPnWqyEH
X-Google-Smtp-Source: AGHT+IHqlecHvpa4azmwxGOdmBoAoJtWGFX60kFQ6ZFm6Yn10csIJL7HFATZNo7/6C9DERRLwGKmZw==
X-Received: by 2002:a5d:5089:0:b0:33a:ed85:f232 with SMTP id a9-20020a5d5089000000b0033aed85f232mr189023wrt.56.1707157226023;
        Mon, 05 Feb 2024 10:20:26 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU356WRKo+dw5FpSmBHk8VEtt3zpqXra/3je0UBI3+fhYEsa7vyZqfkwjDerlW9tIQttzNqQ60HCtbIJ4KYE1BkSzSviDlls6pP8Y5RqTKs0uTp2iF1U/waOpTt57KxStDelSXhWTd+mZYa5UivQRaVyeN71BjZvuvjDdXCYB2caD1qLqOqW4/8i2Jm2aUMiokb7uR7Fg5MaKfH8xkb4JzpT+1AUbXHV/dGk5MztgN7U+xKjs3tdOzvbG7zCA8UauaWBxHxv5S6lmb9ivXNak7VPYH8nHeRtdIXMXt+EzouzlEuz8/D1MI7nx2lFux65zK2MKMbhoMKYDinkgq6aenNqg==
Received: from jernej-laptop.localnet (82-149-13-182.dynamic.telemach.net. [82.149.13.182])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c471100b0040d8ff79fd8sm604834wmo.7.2024.02.05.10.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 10:20:25 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Alilovic <nickalilovic@gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: Add Jide Remix Mini PC support
Date: Mon, 05 Feb 2024 19:20:24 +0100
Message-ID: <3788758.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <3280179.44csPzL39Z@jernej-laptop>
References:
 <20240204094404.149776-1-andre.przywara@arm.com>
 <20240204094404.149776-4-andre.przywara@arm.com>
 <3280179.44csPzL39Z@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne ponedeljek, 05. februar 2024 ob 19:12:45 CET je Jernej =C5=A0krabec nap=
isal(a):
> Hi Andre!
>=20
> Dne nedelja, 04. februar 2024 ob 10:44:04 CET je Andre Przywara napisal(a=
):
> > The Remix Mini PC is a "mini computer" using the Allwinner H64 SoC,
> > which appears to be just a relabelled A64. It was launched in 2015 by
> > the now defunct company Jide, and shipped with a desktop optimised
> > version of Android. It features
> > 	- Allwinner H64 Soc (4 * Arm Cortex-A53 cores)
> > 	- 1 or 2 GB DRAM
> > 	- 8 or 16 GB eMMC flash
> > 	- 100 MBit Ethernet port (using an X-Powers AC200 PHY)
> > 	- RTL8723BS WiFi & Bluetooth chip
> > 	- HDMI port
> > 	- two USB 2.0 ports
> > 	- 3.5mm AV port
> > 	- microSD card slot
> >=20
> > The devicetree covers most peripherals, though there is no agreed
> > binding for the PHY chip yet, so this is left out.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >  .../allwinner/sun50i-h64-remix-mini-pc.dts    | 357 ++++++++++++++++++
> >  2 files changed, 358 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini=
=2Dpc.dts
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/d=
ts/allwinner/Makefile
> > index 91d505b385de..2db3b15ad09f 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pinetab.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pinetab-early-adopter.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-sopine-baseboard.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-teres-i.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h64-remix-mini-pc.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a100-allwinner-perf1.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-bananapi-m2-plus.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-bananapi-m2-plus-v1.2.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts
> > new file mode 100644
> > index 000000000000..537923a541a8
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts
> > @@ -0,0 +1,357 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +// Copyright (c) 2018 ARM Ltd.
>=20
> Shouldn't be 2024?
>=20
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-a64.dtsi"
> > +#include "sun50i-a64-cpu-opp.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > +	model =3D "Remix Mini PC";
> > +	compatible =3D "jide,remix-mini-pc", "allwinner,sun50i-h64",
> > +		     "allwinner,sun50i-a64";
> > +
> > +	aliases {
> > +		ethernet1 =3D &rtl8723bs;
> > +		serial0 =3D &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path =3D "serial0:115200n8";
> > +	};
> > +
> > +	hdmi-connector {
> > +		compatible =3D "hdmi-connector";
> > +		type =3D "a";
> > +
> > +		port {
> > +			hdmi_con_in: endpoint {
> > +				remote-endpoint =3D <&hdmi_out_con>;
> > +			};
> > +		};
> > +	};
> > +
> > +	reg_vcc5v: regulator-5v {
> > +		/* board wide 5V supply directly from the DC input */
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "vcc-5v";
> > +		regulator-min-microvolt =3D <5000000>;
> > +		regulator-max-microvolt =3D <5000000>;
> > +		regulator-always-on;
> > +	};
> > +
> > +	wifi_pwrseq: wifi_pwrseq {
> > +		compatible =3D "mmc-pwrseq-simple";
> > +		pinctrl-names =3D "default";
> > +		reset-gpios =3D <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
> > +		post-power-on-delay-ms =3D <200>;
> > +	};
> > +};
> > +
> > +&codec {
> > +	status =3D "okay";
> > +};
> > +
> > +&codec_analog {
> > +	cpvdd-supply =3D <&reg_eldo1>;
> > +	status =3D "okay";
> > +};
> > +
> > +&cpu0 {
> > +	cpu-supply =3D <&reg_dcdc2>;
> > +};
> > +
> > +&cpu1 {
> > +	cpu-supply =3D <&reg_dcdc2>;
> > +};
> > +
> > +&cpu2 {
> > +	cpu-supply =3D <&reg_dcdc2>;
> > +};
> > +
> > +&cpu3 {
> > +	cpu-supply =3D <&reg_dcdc2>;
> > +};
> > +
> > +&dai {
> > +	status =3D "okay";
> > +};
> > +
> > +&de {
> > +	status =3D "okay";
> > +};
> > +
> > +&ehci0 {
> > +	status =3D "okay";
> > +};
> > +
> > +&ehci1 {
> > +	status =3D "okay";
> > +};
> > +
> > +&hdmi {
> > +	hvcc-supply =3D <&reg_dldo1>;
> > +	status =3D "okay";
> > +};
> > +
> > +&hdmi_out {
> > +	hdmi_out_con: endpoint {
> > +		remote-endpoint =3D <&hdmi_con_in>;
> > +	};
> > +};
> > +
> > +/* Connects to the AC200 chip */
> > +&i2c0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&i2c0_pins>;
> > +	status =3D "okay";
> > +};
> > +
> > +&i2c0_pins {
> > +	bias-pull-up;
> > +};
> > +
> > +&mmc0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&mmc0_pins>;
> > +	vmmc-supply =3D <&reg_dcdc1>;
> > +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;
> > +	disable-wp;
> > +	bus-width =3D <4>;
> > +	status =3D "okay";
> > +};
> > +
> > +&mmc1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&mmc1_pins>;
> > +	vmmc-supply =3D <&reg_aldo1>;
> > +	vqmmc-supply =3D <&reg_dldo4>;
> > +	mmc-pwrseq =3D <&wifi_pwrseq>;
> > +	bus-width =3D <4>;
> > +	non-removable;
> > +	status =3D "okay";
> > +
> > +	rtl8723bs: wifi@1 {
> > +		reg =3D <1>;
> > +		interrupt-parent =3D <&r_pio>;
> > +		interrupts =3D <0 3 IRQ_TYPE_LEVEL_LOW>; /* PL3 */
> > +		interrupt-names =3D "host-wake";
> > +	};
>=20
> Node without compatible doesn't help. Please remove it.
>=20
> > +};
> > +
> > +&mmc2 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&mmc2_pins>, <&mmc2_ds_pin>;
> > +	vmmc-supply =3D <&reg_dcdc1>;
> > +	vqmmc-supply =3D <&reg_eldo1>;
> > +	bus-width =3D <8>;
> > +	non-removable;
> > +	mmc-ddr-1_8v;
> > +	mmc-hs200-1_8v;
>=20
> Aren't these speed modes enabled by default?

Sorry, mmc-hs200-1_8v is ok, but mmc-ddr-1_8v should be
removed.

Best regards,
Jernej

> > +	cap-mmc-hw-reset;
> > +	status =3D "okay";
> > +};
> > +
> > +&ohci0 {
> > +	status =3D "okay";
> > +};
> > +
> > +&ohci1 {
> > +	status =3D "okay";
> > +};
> > +
> > +&pio {
> > +	vcc-pb-supply =3D <&reg_dcdc1>;
> > +	vcc-pc-supply =3D <&reg_dcdc1>;
> > +	vcc-pd-supply =3D <&reg_dcdc1>;
> > +	vcc-pe-supply =3D <&reg_dcdc1>;
> > +	vcc-pf-supply =3D <&reg_dcdc1>;
> > +	vcc-pg-supply =3D <&reg_dldo4>;
> > +	vcc-ph-supply =3D <&reg_dcdc1>;
> > +};
> > +
> > +&r_ir {
> > +	status =3D "okay";
> > +};
> > +
> > +&r_pio {
> > +	/*
> > +	 * We cannot add that supply for now since it would create a circular
> > +	 * dependency between pinctrl, the regulator and the RSB Bus.
> > +	 *
> > +	 * vcc-pl-supply =3D <&reg_aldo2>;
> > +	 */
> > +};
> > +
> > +&r_rsb {
> > +	status =3D "okay";
> > +
> > +	axp803: pmic@3a3 {
> > +		compatible =3D "x-powers,axp803";
> > +		reg =3D <0x3a3>;
> > +		interrupt-parent =3D <&r_intc>;
> > +		interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_LOW>;
> > +		x-powers,drive-vbus-en;
> > +
> > +		vin1-supply =3D <&reg_vcc5v>;
> > +		vin2-supply =3D <&reg_vcc5v>;
> > +		vin3-supply =3D <&reg_vcc5v>;
> > +		vin5-supply =3D <&reg_vcc5v>;
> > +		vin6-supply =3D <&reg_vcc5v>;
> > +		aldoin-supply =3D <&reg_vcc5v>;
> > +		dldoin-supply =3D <&reg_vcc5v>;
> > +		eldoin-supply =3D <&reg_vcc5v>;
> > +		fldoin-supply =3D <&reg_vcc5v>;
> > +		drivevbus-supply =3D <&reg_vcc5v>;
> > +		ips-supply =3D <&reg_vcc5v>;
> > +
> > +		status =3D "okay";
> > +	};
> > +};
> > +
> > +#include "axp803.dtsi"
> > +
> > +&ac_power_supply {
> > +	status =3D "okay";
> > +};
> > +
> > +&reg_dcdc1 {
> > +	regulator-always-on;
> > +	regulator-min-microvolt =3D <3300000>;
> > +	regulator-max-microvolt =3D <3300000>;
> > +	regulator-name =3D "vcc-3v3";
> > +};
> > +
> > +&reg_dcdc2 {
> > +	regulator-always-on;
> > +	regulator-min-microvolt =3D <1040000>;
> > +	regulator-max-microvolt =3D <1300000>;
> > +	regulator-name =3D "vdd-cpux";
> > +};
> > +
> > +/* DCDC3 is polyphased with DCDC2 */
> > +
> > +&reg_dcdc5 {
> > +	regulator-always-on;
> > +	regulator-min-microvolt =3D <1500000>;
> > +	regulator-max-microvolt =3D <1500000>;
> > +	regulator-name =3D "vcc-dram";
> > +};
> > +
> > +/* Deviates from the reset default of 1.1V. */
> > +&reg_dcdc6 {
> > +	regulator-always-on;
> > +	regulator-min-microvolt =3D <1200000>;
> > +	regulator-max-microvolt =3D <1200000>;
> > +	regulator-name =3D "vdd-sys";
> > +};
> > +
> > +&reg_aldo1 {
> > +	regulator-min-microvolt =3D <3300000>;
> > +	regulator-max-microvolt =3D <3300000>;
> > +	regulator-name =3D "vcc-wifi";
> > +};
> > +
> > +&reg_aldo2 {
> > +	/* Specifying R_PIO consumer would create circular dependency. */
> > +	regulator-always-on;
> > +	regulator-min-microvolt =3D <3300000>;
> > +	regulator-max-microvolt =3D <3300000>;
> > +	regulator-name =3D "vcc-pl";
> > +};
> > +
> > +&reg_aldo3 {
> > +	regulator-always-on;
> > +	regulator-min-microvolt =3D <3000000>;
> > +	regulator-max-microvolt =3D <3000000>;
> > +	regulator-name =3D "vcc-pll-avcc";
> > +};
> > +
> > +/* AC200 power supply */
> > +&reg_dldo1 {
> > +	regulator-always-on;
> > +	regulator-min-microvolt =3D <3300000>;
> > +	regulator-max-microvolt =3D <3300000>;
> > +	regulator-name =3D "vcc-ave-33";
> > +};
> > +
> > +&reg_dldo4 {
> > +	regulator-min-microvolt =3D <3300000>;
> > +	regulator-max-microvolt =3D <3300000>;
> > +	regulator-name =3D "vcc-wifi-io";
> > +};
> > +
> > +&reg_drivevbus {
> > +	regulator-name =3D "usb0-vbus";
> > +	status =3D "okay";
> > +};
> > +
> > +&reg_eldo1 {
> > +	regulator-always-on;
> > +	regulator-min-microvolt =3D <1800000>;
> > +	regulator-max-microvolt =3D <1800000>;
> > +	regulator-name =3D "vcc-cpvdd-dram-emmc";
> > +};
> > +
> > +/* Supplies the arisc management core, needed by TF-A to power off cor=
es. */
> > +&reg_fldo2 {
> > +	regulator-always-on;
> > +	regulator-min-microvolt =3D <1100000>;
> > +	regulator-max-microvolt =3D <1100000>;
> > +	regulator-name =3D "vdd-cpus";
> > +};
> > +
> > +&reg_rtc_ldo {
> > +	regulator-name =3D "vcc-rtc";
> > +};
> > +
> > +&simplefb_hdmi {
> > +	vcc-hdmi-supply =3D <&reg_dcdc1>;
> > +};
> > +
> > +&sound {
> > +	simple-audio-card,aux-devs =3D <&codec_analog>;
> > +	simple-audio-card,widgets =3D "Microphone", "Microphone Jack",
> > +				    "Headphone", "Headphone Jack";
> > +	simple-audio-card,routing =3D
> > +			"Left DAC", "DACL",
> > +			"Right DAC", "DACR",
> > +			"Headphone Jack", "HP",
> > +			"ADCL", "Left ADC",
> > +			"ADCR", "Right ADC",
> > +			"MIC2", "Microphone Jack";
> > +	status =3D "okay";
> > +};
> > +
> > +/* On the (unpopulated) UART pads. */
> > +&uart0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&uart0_pb_pins>;
> > +	status =3D "okay";
> > +};
> > +
> > +&uart1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> > +	uart-has-rtscts;
> > +	status =3D "okay";
> > +
> > +	bluetooth {
> > +		compatible =3D "realtek,rtl8723bs-bt";
> > +		enable-gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
> > +		max-speed =3D <1500000>;
> > +	};
> > +};
> > +
> > +&usb_otg {
> > +	dr_mode =3D "host";
> > +	status =3D "okay";
> > +};
> > +
> > +&usbphy {
> > +	usb0_vbus-supply =3D <&reg_drivevbus>;
> > +	usb1_vbus-supply =3D <&reg_drivevbus>;
> > +	status =3D "okay";
> > +};
> >=20
>=20
>=20
>=20
>=20
>=20




