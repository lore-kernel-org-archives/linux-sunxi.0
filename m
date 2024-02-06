Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C752E12E6D
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Feb 2024 18:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707244049; cv=none; b=ZdNRz3AQU3WdCoI4JJxSPwvM/gbil6+BWqXY0P2w915Ugs2jFMGphz86T2xUL0aq+UDARknXDZu7vBW29Zj/js7zL8zs7MS1tI3UO6X1DymxI2VrAPoRxkZ83e8c/6T8O4YeNZUOXSWEwNJpx5id0ll9OSJ1n62GKTf9kTweDWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707244049; c=relaxed/simple;
	bh=wnekn1bABAFDmOd1SWT7vofGBAS44WbvE4UnXhsUKFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UC9aFJHdskGRQRDR7Xh+3mQm+mGCw/fwkbNPzapyGg5mWbnU9S9BK7HTDgcj6+RcSzXH8Km9bet1ljYrZmtWRS83HQvMkaOG+PXuY9t30IlHOFb1vR2jKNoifEOF3OQrym5qTG5mhkfoiBEJMT7JWoOtx1OWrDbUs6jCgz5zQ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Td1zaDD6; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Td1zaDD6"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40ffce2ceffso1780545e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Feb 2024 10:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707244044; x=1707848844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipPNtjAoCMbPauAQdellneDW30G0UkwQXFB79ZrD6Vc=;
        b=Td1zaDD6YZNkOWToiA/TM30TdmgPh/wujmptspQWCiErv2vbSA6dBOFuGIdBneBqFU
         1I44meyvgxYeTJtoz7I9+tNiX8Dm/k5k9mjyO2xU5pqu0vsr9LFSgphbRPuLjxAw9qFW
         k5JdW02Jq6vt1QT5OBhxa0ybNOTk5cLYuo01oxCBDGj+V9HCFgaESoA5PIhPuPxSQz03
         1j2ZS+XZV0XiVIL4pG2kvyp4+DjDzb0Q88WBJE0z1LjWFtAWcG76psRDZ2giPQ0ACpzk
         OfKaRiQHAn+KhUvus/xZ6oXB6JCmIDlpEdOpYTfcx5CejdO8xMjo/kme1CNN2bPydNzl
         rkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707244044; x=1707848844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipPNtjAoCMbPauAQdellneDW30G0UkwQXFB79ZrD6Vc=;
        b=N1McWPjL1sjBIwe0aJBZRlcBVW5WF5xhrTv/eesZJHbJOCQn654a5F4ULrYynIoB2n
         4PCd8lS1Dy2WWATnEzo8Jha/N1R8F4aMSyv2+5LdiYPjN7uE7bzzUmrahPy/K1xY0iOw
         KDorlcbaRXWqXPph78WztvgcVGfmHK0xOgJOq5cZ7A4/isLfK8A6WKRAkmwuOuwF52y2
         iWIK9u692H/1r+6E9SgTibvgf/B3iD54nKzn+I3vvy3pZcJiyhAQkLuzyjdoaEXmAGjH
         ebNef1RlpkU8QtVO980VNDVw04LkHM/ytcuN8lSZ3wiMGXxg4QlzUhc2rjj1U9c2Ze9Q
         JICA==
X-Gm-Message-State: AOJu0Yyvwlbn3Q2CR87n7esmbKdjbwAdK1GbsQGHthHgeTlPhHK5pDs6
	+BmZpHhyBKe2SeRz9Z4xfmFOs8re24C8K2GBZvgMC57sF0/zbqn3
X-Google-Smtp-Source: AGHT+IGV9JV4dxZmENMUO4jOIemvup76JYuwphgRFZeXZ6++PKk8E52IfBShTQbBax8tPmZwGp+rIQ==
X-Received: by 2002:a05:600c:444a:b0:40f:ddcf:37e9 with SMTP id v10-20020a05600c444a00b0040fddcf37e9mr3031834wmn.9.1707244043798;
        Tue, 06 Feb 2024 10:27:23 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWWCP1pAdp00/pkYdhnZdQ9Ox5vUBsA73nmgONiHa1tcZtvNBy8hPcXlB3zu8aVI+jtrRU5S7bHD/H4PKA0YPxcae272iY+4TP3zcBVLLjac5VWTIPvkAyN8XNI/Wxe9xciO5ITCEoxp6PDXJPazGcuc7pq8RrGPoQ3bok3b6j8u83QR1Nzh5HC8SXu9yjrVCOabEuGXmo8CyC+WTU8ErDbzjq7g3VxiGjPbLbP2bPkh6gwHNPF+v9LufGT6b48kJNqYP0RqHZY1F04Xi6fzEJ40xGQKYp5FCb658rBycv8NlW3bQ09FN6M5OTKo8R715QtSZcWbDzjpjKNzcfFw1npLw==
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c470800b0040ff583e17csm1059487wmo.9.2024.02.06.10.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:27:23 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Alilovic <nickalilovic@gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: Add Jide Remix Mini PC support
Date: Tue, 06 Feb 2024 19:27:22 +0100
Message-ID: <1957012.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <10413667.nUPlyArG6x@jernej-laptop>
References:
 <20240204094404.149776-1-andre.przywara@arm.com>
 <8d9d1d7c-8066-4400-8fe4-68aa0e28023d@arm.com>
 <10413667.nUPlyArG6x@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne torek, 06. februar 2024 ob 19:23:35 CET je Jernej =C5=A0krabec napisal(=
a):
> Dne torek, 06. februar 2024 ob 19:13:46 CET je Andre Przywara napisal(a):
> > Hi Jernej,
> >=20
> > On 06/02/2024 18:32, Jernej =C5=A0krabec wrote:
> > > Dne torek, 06. februar 2024 ob 01:47:05 CET je Andre Przywara napisal=
(a):
> > >> Hi Jernej,
> > >>
> > >> thanks for having a look!
> > >>
> > >> On 05/02/2024 19:20, Jernej =C5=A0krabec wrote:
> > >>> Dne ponedeljek, 05. februar 2024 ob 19:12:45 CET je Jernej =C5=A0kr=
abec napisal(a):
> > >>>> Hi Andre!
> > >>>>
> > >>>> Dne nedelja, 04. februar 2024 ob 10:44:04 CET je Andre Przywara na=
pisal(a):
> > >>>>> The Remix Mini PC is a "mini computer" using the Allwinner H64 So=
C,
> > >>>>> which appears to be just a relabelled A64. It was launched in 201=
5 by
> > >>>>> the now defunct company Jide, and shipped with a desktop optimised
> > >>>>> version of Android. It features
> > >>>>> 	- Allwinner H64 Soc (4 * Arm Cortex-A53 cores)
> > >>>>> 	- 1 or 2 GB DRAM
> > >>>>> 	- 8 or 16 GB eMMC flash
> > >>>>> 	- 100 MBit Ethernet port (using an X-Powers AC200 PHY)
> > >>>>> 	- RTL8723BS WiFi & Bluetooth chip
> > >>>>> 	- HDMI port
> > >>>>> 	- two USB 2.0 ports
> > >>>>> 	- 3.5mm AV port
> > >>>>> 	- microSD card slot
> > >>>>>
> > >>>>> The devicetree covers most peripherals, though there is no agreed
> > >>>>> binding for the PHY chip yet, so this is left out.
> > >>>>>
> > >>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > >>>>> ---
> > >>>>>    arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> > >>>>>    .../allwinner/sun50i-h64-remix-mini-pc.dts    | 357 ++++++++++=
++++++++
> > >>>>>    2 files changed, 358 insertions(+)
> > >>>>>    create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h64-re=
mix-mini-pc.dts
> > >>>>>
> > >>>>> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/=
boot/dts/allwinner/Makefile
> > >>>>> index 91d505b385de..2db3b15ad09f 100644
> > >>>>> --- a/arch/arm64/boot/dts/allwinner/Makefile
> > >>>>> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > >>>>> @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pineta=
b.dtb
> > >>>>>    dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-pinetab-early-adopter=
=2Edtb
> > >>>>>    dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-sopine-baseboard.dtb
> > >>>>>    dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a64-teres-i.dtb
> > >>>>> +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h64-remix-mini-pc.dtb
> > >>>>>    dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-a100-allwinner-perf1.dtb
> > >>>>>    dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-bananapi-m2-plus.dtb
> > >>>>>    dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-bananapi-m2-plus-v1.2.=
dtb
> > >>>>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-=
pc.dts b/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts
> > >>>>> new file mode 100644
> > >>>>> index 000000000000..537923a541a8
> > >>>>> --- /dev/null
> > >>>>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h64-remix-mini-pc.dts
> > >>>>> @@ -0,0 +1,357 @@
> > >>>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > >>>>> +// Copyright (c) 2018 ARM Ltd.
> > >>>>
> > >>>> Shouldn't be 2024?
> > >>
> > >> Well, that just documents that sad fact that I indeed created this f=
ile
> > >> 6 years ago, but just managed now to actually send this. Is there a
> > >> requirement for this being "recent"?
> > >=20
> > > Not really, but it's strange looking. Some might incorrectly assume t=
hat it's
> > > present in the kernel longer than it really is.
> >=20
> > OK, I will put in 2023, as this is when I touched this again.
> >=20
> > >>>>
> > >>>>> +
> > >>>>> +/dts-v1/;
> > >>>>> +
> > >>>>> +#include "sun50i-a64.dtsi"
> > >>>>> +#include "sun50i-a64-cpu-opp.dtsi"
> > >>>>> +
> > >>>>> +#include <dt-bindings/gpio/gpio.h>
> > >>>>> +
> > >>>>> +/ {
> > >>>>> +	model =3D "Remix Mini PC";
> > >>>>> +	compatible =3D "jide,remix-mini-pc", "allwinner,sun50i-h64",
> > >>>>> +		     "allwinner,sun50i-a64";
> > >>>>> +
> > >>>>> +	aliases {
> > >>>>> +		ethernet1 =3D &rtl8723bs;
> > >>>>> +		serial0 =3D &uart0;
> > >>>>> +	};
> > >>>>> +
> > >>>>> +	chosen {
> > >>>>> +		stdout-path =3D "serial0:115200n8";
> > >>>>> +	};
> > >>>>> +
> > >>>>> +	hdmi-connector {
> > >>>>> +		compatible =3D "hdmi-connector";
> > >>>>> +		type =3D "a";
> > >>>>> +
> > >>>>> +		port {
> > >>>>> +			hdmi_con_in: endpoint {
> > >>>>> +				remote-endpoint =3D <&hdmi_out_con>;
> > >>>>> +			};
> > >>>>> +		};
> > >>>>> +	};
> > >>>>> +
> > >>>>> +	reg_vcc5v: regulator-5v {
> > >>>>> +		/* board wide 5V supply directly from the DC input */
> > >>>>> +		compatible =3D "regulator-fixed";
> > >>>>> +		regulator-name =3D "vcc-5v";
> > >>>>> +		regulator-min-microvolt =3D <5000000>;
> > >>>>> +		regulator-max-microvolt =3D <5000000>;
> > >>>>> +		regulator-always-on;
> > >>>>> +	};
> > >>>>> +
> > >>>>> +	wifi_pwrseq: wifi_pwrseq {
> > >>>>> +		compatible =3D "mmc-pwrseq-simple";
> > >>>>> +		pinctrl-names =3D "default";
> > >>>>> +		reset-gpios =3D <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
> > >>>>> +		post-power-on-delay-ms =3D <200>;
> > >>>>> +	};
> > >>>>> +};
> > >>>>> +
> > >>>>> +&codec {
> > >>>>> +	status =3D "okay";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&codec_analog {
> > >>>>> +	cpvdd-supply =3D <&reg_eldo1>;
> > >>>>> +	status =3D "okay";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&cpu0 {
> > >>>>> +	cpu-supply =3D <&reg_dcdc2>;
> > >>>>> +};
> > >>>>> +
> > >>>>> +&cpu1 {
> > >>>>> +	cpu-supply =3D <&reg_dcdc2>;
> > >>>>> +};
> > >>>>> +
> > >>>>> +&cpu2 {
> > >>>>> +	cpu-supply =3D <&reg_dcdc2>;
> > >>>>> +};
> > >>>>> +
> > >>>>> +&cpu3 {
> > >>>>> +	cpu-supply =3D <&reg_dcdc2>;
> > >>>>> +};
> > >>>>> +
> > >>>>> +&dai {
> > >>>>> +	status =3D "okay";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&de {
> > >>>>> +	status =3D "okay";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&ehci0 {
> > >>>>> +	status =3D "okay";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&ehci1 {
> > >>>>> +	status =3D "okay";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&hdmi {
> > >>>>> +	hvcc-supply =3D <&reg_dldo1>;
> > >>>>> +	status =3D "okay";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&hdmi_out {
> > >>>>> +	hdmi_out_con: endpoint {
> > >>>>> +		remote-endpoint =3D <&hdmi_con_in>;
> > >>>>> +	};
> > >>>>> +};
> > >>>>> +
> > >>>>> +/* Connects to the AC200 chip */
> > >>>>> +&i2c0 {
> > >>>>> +	pinctrl-names =3D "default";
> > >>>>> +	pinctrl-0 =3D <&i2c0_pins>;
> > >>>>> +	status =3D "okay";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&i2c0_pins {
> > >>>>> +	bias-pull-up;
> > >>>>> +};
> > >>>>> +
> > >>>>> +&mmc0 {
> > >>>>> +	pinctrl-names =3D "default";
> > >>>>> +	pinctrl-0 =3D <&mmc0_pins>;
> > >>>>> +	vmmc-supply =3D <&reg_dcdc1>;
> > >>>>> +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;
> > >>>>> +	disable-wp;
> > >>>>> +	bus-width =3D <4>;
> > >>>>> +	status =3D "okay";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&mmc1 {
> > >>>>> +	pinctrl-names =3D "default";
> > >>>>> +	pinctrl-0 =3D <&mmc1_pins>;
> > >>>>> +	vmmc-supply =3D <&reg_aldo1>;
> > >>>>> +	vqmmc-supply =3D <&reg_dldo4>;
> > >>>>> +	mmc-pwrseq =3D <&wifi_pwrseq>;
> > >>>>> +	bus-width =3D <4>;
> > >>>>> +	non-removable;
> > >>>>> +	status =3D "okay";
> > >>>>> +
> > >>>>> +	rtl8723bs: wifi@1 {
> > >>>>> +		reg =3D <1>;
> > >>>>> +		interrupt-parent =3D <&r_pio>;
> > >>>>> +		interrupts =3D <0 3 IRQ_TYPE_LEVEL_LOW>; /* PL3 */
> > >>>>> +		interrupt-names =3D "host-wake";
> > >>>>> +	};
> > >>>>
> > >>>> Node without compatible doesn't help. Please remove it.
> > >>
> > >> Huh, but where do I put the the IRQ line then? And every other RTL87=
23BS
> > >> user seems to do the same?
> > >=20
> > > It's good, sorry for the noise.
> >=20
> > Just for the records, and for my own reference:
> > Since there is no "ranges" property in the MMC node, the Linux platform=
=20
> > bus driver is not automatically traversing any child nodes. So we don't=
=20
> > need a compatible string. Instead it's a new addressing scheme (this=20
> > obsolete MMC "bus" address, like SPI or I2C), so it's up to the driver=
=20
> > to do the child iteration. And it will match device #1 to reg <1>, and=
=20
> > use that node, as Chen-Yu mentioned.
> >=20
> > >>>>
> > >>>>> +};
> > >>>>> +
> > >>>>> +&mmc2 {
> > >>>>> +	pinctrl-names =3D "default";
> > >>>>> +	pinctrl-0 =3D <&mmc2_pins>, <&mmc2_ds_pin>;
> > >>>>> +	vmmc-supply =3D <&reg_dcdc1>;
> > >>>>> +	vqmmc-supply =3D <&reg_eldo1>;
> > >>>>> +	bus-width =3D <8>;
> > >>>>> +	non-removable;
> > >>>>> +	mmc-ddr-1_8v;
> > >>>>> +	mmc-hs200-1_8v;
> > >>>>
> > >>>> Aren't these speed modes enabled by default?
> > >>
> > >> Enabled by who? Our current sunxi-mmc driver? I cannot find anything=
 in
> > >> the binding that suggests that there would be some default settings.
> > >=20
> > > Looking at Linux sunxi mmc driver, mmc-ddr-1_8v is enabled by default=
 for
> > > "new timings" variants except for H5. Anyway...
> >=20
> > But this is a Linux implementation detail, which we should not rely on=
=20
> > in a DT? And if I remember Maxime correctly back then, the plan was to=
=20
> > avoid those driver hacks and just say what we support in the DT, going=
=20
> > forward. This might be needed for other OSes, which might not support=20
> > HS-200?
> > >>> Sorry, mmc-hs200-1_8v is ok, but mmc-ddr-1_8v should be
> > >>> removed.
> > >>
> > >> Mmh, I am confused: I thought after the H5 eMMC mishap we figured th=
at
> > >> all speed modes supported by the eMMC chip should be listed in the D=
T?
> > >=20
> > > I think H5 just has (had?) driver issue. From what I can see, only hi=
ghest
> > > supported mode by kernel and chip is specified in all Allwinner DTs.
> > > mmc-ddr-1_8v is only specified by two recent board addition, where I =
missed
> > > it while reviewing.
> > >=20
> > >> So any driver wouldn't need to make assumptions, and if a particular
> > >> mode shows problems on a board, we just remove that mode from the DT.
> > >> Actually, thinking about that, I guess I should list HS-400 as well?=
 The
> > >> BSP kernel uses that mode.
> > >=20
> > > Sure, but it also calibrates timing for it. If you'll specify HS400, =
kernel
> > > will try to use it, but it won't work.
> >=20
> > But this is also a limitation of the current Linux kernel driver. And=20
> > since we indeed don't support HS-400, we explicitly remove it from the=
=20
> > capability list, *after* the call to mmc_of_parse():
> >=20
> > drivers/mmc/host/sunxi-mmc.c:1460
> >          /* TODO: This driver doesn't support HS400 mode yet */
> >          mmc->caps2 &=3D ~MMC_CAP2_HS400;
> >=20
> > So I think this should be safe?
>=20
> Right. Can you test it?
>=20
> Best regards,
> Jernej
>=20
> >=20
> > Cheers,
> > Andre
> >=20
> > >=20
> > >> Or do you mean to say that in particular DDR (@1.8V) is problematic?=
 I
> > >> cannot test at the moment, but could try later to force that mode.
> > >=20
> > > No, no need.

If we go in new direction, then it would be good to test it.

Best regards,
Jernej

> > >=20
> > > Best regards,
> > > Jernej
> > >=20
> > >>
> > >> Cheers,
> > >> Andre
> > >>
> > >>
> > >>>>> +	cap-mmc-hw-reset;
> > >>>>> +	status =3D "okay";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&ohci0 {
> > >>>>> +	status =3D "okay";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&ohci1 {
> > >>>>> +	status =3D "okay";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&pio {
> > >>>>> +	vcc-pb-supply =3D <&reg_dcdc1>;
> > >>>>> +	vcc-pc-supply =3D <&reg_dcdc1>;
> > >>>>> +	vcc-pd-supply =3D <&reg_dcdc1>;
> > >>>>> +	vcc-pe-supply =3D <&reg_dcdc1>;
> > >>>>> +	vcc-pf-supply =3D <&reg_dcdc1>;
> > >>>>> +	vcc-pg-supply =3D <&reg_dldo4>;
> > >>>>> +	vcc-ph-supply =3D <&reg_dcdc1>;
> > >>>>> +};
> > >>>>> +
> > >>>>> +&r_ir {
> > >>>>> +	status =3D "okay";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&r_pio {
> > >>>>> +	/*
> > >>>>> +	 * We cannot add that supply for now since it would create a ci=
rcular
> > >>>>> +	 * dependency between pinctrl, the regulator and the RSB Bus.
> > >>>>> +	 *
> > >>>>> +	 * vcc-pl-supply =3D <&reg_aldo2>;
> > >>>>> +	 */
> > >>>>> +};
> > >>>>> +
> > >>>>> +&r_rsb {
> > >>>>> +	status =3D "okay";
> > >>>>> +
> > >>>>> +	axp803: pmic@3a3 {
> > >>>>> +		compatible =3D "x-powers,axp803";
> > >>>>> +		reg =3D <0x3a3>;
> > >>>>> +		interrupt-parent =3D <&r_intc>;
> > >>>>> +		interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_LOW>;
> > >>>>> +		x-powers,drive-vbus-en;
> > >>>>> +
> > >>>>> +		vin1-supply =3D <&reg_vcc5v>;
> > >>>>> +		vin2-supply =3D <&reg_vcc5v>;
> > >>>>> +		vin3-supply =3D <&reg_vcc5v>;
> > >>>>> +		vin5-supply =3D <&reg_vcc5v>;
> > >>>>> +		vin6-supply =3D <&reg_vcc5v>;
> > >>>>> +		aldoin-supply =3D <&reg_vcc5v>;
> > >>>>> +		dldoin-supply =3D <&reg_vcc5v>;
> > >>>>> +		eldoin-supply =3D <&reg_vcc5v>;
> > >>>>> +		fldoin-supply =3D <&reg_vcc5v>;
> > >>>>> +		drivevbus-supply =3D <&reg_vcc5v>;
> > >>>>> +		ips-supply =3D <&reg_vcc5v>;
> > >>>>> +
> > >>>>> +		status =3D "okay";
> > >>>>> +	};
> > >>>>> +};
> > >>>>> +
> > >>>>> +#include "axp803.dtsi"
> > >>>>> +
> > >>>>> +&ac_power_supply {
> > >>>>> +	status =3D "okay";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&reg_dcdc1 {
> > >>>>> +	regulator-always-on;
> > >>>>> +	regulator-min-microvolt =3D <3300000>;
> > >>>>> +	regulator-max-microvolt =3D <3300000>;
> > >>>>> +	regulator-name =3D "vcc-3v3";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&reg_dcdc2 {
> > >>>>> +	regulator-always-on;
> > >>>>> +	regulator-min-microvolt =3D <1040000>;
> > >>>>> +	regulator-max-microvolt =3D <1300000>;
> > >>>>> +	regulator-name =3D "vdd-cpux";
> > >>>>> +};
> > >>>>> +
> > >>>>> +/* DCDC3 is polyphased with DCDC2 */
> > >>>>> +
> > >>>>> +&reg_dcdc5 {
> > >>>>> +	regulator-always-on;
> > >>>>> +	regulator-min-microvolt =3D <1500000>;
> > >>>>> +	regulator-max-microvolt =3D <1500000>;
> > >>>>> +	regulator-name =3D "vcc-dram";
> > >>>>> +};
> > >>>>> +
> > >>>>> +/* Deviates from the reset default of 1.1V. */
> > >>>>> +&reg_dcdc6 {
> > >>>>> +	regulator-always-on;
> > >>>>> +	regulator-min-microvolt =3D <1200000>;
> > >>>>> +	regulator-max-microvolt =3D <1200000>;
> > >>>>> +	regulator-name =3D "vdd-sys";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&reg_aldo1 {
> > >>>>> +	regulator-min-microvolt =3D <3300000>;
> > >>>>> +	regulator-max-microvolt =3D <3300000>;
> > >>>>> +	regulator-name =3D "vcc-wifi";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&reg_aldo2 {
> > >>>>> +	/* Specifying R_PIO consumer would create circular dependency. =
*/
> > >>>>> +	regulator-always-on;
> > >>>>> +	regulator-min-microvolt =3D <3300000>;
> > >>>>> +	regulator-max-microvolt =3D <3300000>;
> > >>>>> +	regulator-name =3D "vcc-pl";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&reg_aldo3 {
> > >>>>> +	regulator-always-on;
> > >>>>> +	regulator-min-microvolt =3D <3000000>;
> > >>>>> +	regulator-max-microvolt =3D <3000000>;
> > >>>>> +	regulator-name =3D "vcc-pll-avcc";
> > >>>>> +};
> > >>>>> +
> > >>>>> +/* AC200 power supply */
> > >>>>> +&reg_dldo1 {
> > >>>>> +	regulator-always-on;
> > >>>>> +	regulator-min-microvolt =3D <3300000>;
> > >>>>> +	regulator-max-microvolt =3D <3300000>;
> > >>>>> +	regulator-name =3D "vcc-ave-33";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&reg_dldo4 {
> > >>>>> +	regulator-min-microvolt =3D <3300000>;
> > >>>>> +	regulator-max-microvolt =3D <3300000>;
> > >>>>> +	regulator-name =3D "vcc-wifi-io";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&reg_drivevbus {
> > >>>>> +	regulator-name =3D "usb0-vbus";
> > >>>>> +	status =3D "okay";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&reg_eldo1 {
> > >>>>> +	regulator-always-on;
> > >>>>> +	regulator-min-microvolt =3D <1800000>;
> > >>>>> +	regulator-max-microvolt =3D <1800000>;
> > >>>>> +	regulator-name =3D "vcc-cpvdd-dram-emmc";
> > >>>>> +};
> > >>>>> +
> > >>>>> +/* Supplies the arisc management core, needed by TF-A to power o=
ff cores. */
> > >>>>> +&reg_fldo2 {
> > >>>>> +	regulator-always-on;
> > >>>>> +	regulator-min-microvolt =3D <1100000>;
> > >>>>> +	regulator-max-microvolt =3D <1100000>;
> > >>>>> +	regulator-name =3D "vdd-cpus";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&reg_rtc_ldo {
> > >>>>> +	regulator-name =3D "vcc-rtc";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&simplefb_hdmi {
> > >>>>> +	vcc-hdmi-supply =3D <&reg_dcdc1>;
> > >>>>> +};
> > >>>>> +
> > >>>>> +&sound {
> > >>>>> +	simple-audio-card,aux-devs =3D <&codec_analog>;
> > >>>>> +	simple-audio-card,widgets =3D "Microphone", "Microphone Jack",
> > >>>>> +				    "Headphone", "Headphone Jack";
> > >>>>> +	simple-audio-card,routing =3D
> > >>>>> +			"Left DAC", "DACL",
> > >>>>> +			"Right DAC", "DACR",
> > >>>>> +			"Headphone Jack", "HP",
> > >>>>> +			"ADCL", "Left ADC",
> > >>>>> +			"ADCR", "Right ADC",
> > >>>>> +			"MIC2", "Microphone Jack";
> > >>>>> +	status =3D "okay";
> > >>>>> +};
> > >>>>> +
> > >>>>> +/* On the (unpopulated) UART pads. */
> > >>>>> +&uart0 {
> > >>>>> +	pinctrl-names =3D "default";
> > >>>>> +	pinctrl-0 =3D <&uart0_pb_pins>;
> > >>>>> +	status =3D "okay";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&uart1 {
> > >>>>> +	pinctrl-names =3D "default";
> > >>>>> +	pinctrl-0 =3D <&uart1_pins>, <&uart1_rts_cts_pins>;
> > >>>>> +	uart-has-rtscts;
> > >>>>> +	status =3D "okay";
> > >>>>> +
> > >>>>> +	bluetooth {
> > >>>>> +		compatible =3D "realtek,rtl8723bs-bt";
> > >>>>> +		enable-gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
> > >>>>> +		max-speed =3D <1500000>;
> > >>>>> +	};
> > >>>>> +};
> > >>>>> +
> > >>>>> +&usb_otg {
> > >>>>> +	dr_mode =3D "host";
> > >>>>> +	status =3D "okay";
> > >>>>> +};
> > >>>>> +
> > >>>>> +&usbphy {
> > >>>>> +	usb0_vbus-supply =3D <&reg_drivevbus>;
> > >>>>> +	usb1_vbus-supply =3D <&reg_drivevbus>;
> > >>>>> +	status =3D "okay";
> > >>>>> +};
> > >>>>>
> > >>>>
> > >>>>
> > >>>>
> > >>>>
> > >>>>
> > >>>
> > >>>
> > >>>
> > >>>
> > >>
> > >=20
> > >=20
> > >=20
> > >=20
> >=20
>=20
>=20
>=20
>=20
>=20




