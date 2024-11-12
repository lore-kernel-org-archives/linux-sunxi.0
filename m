Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A7212F00
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Nov 2024 10:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731408152; cv=none; b=ip5KCRkjULvrWcCsjKLErAcu2pXsMmVFrWEs18u6orP971qJLM0Ir62GhKYXS+/YUM3O1M6PadP3LQhPWtV8ZZAHzI/TaPR3vCfUhuuMJRuL1L6jj/nwfQB9/laaVNHYFAN8f5QWXI97FFjMcRsm22bGwNqjY/C+Z/ZHQZayI9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731408152; c=relaxed/simple;
	bh=6Bq4gH15VTLnzB1uSl9yF+e0UuYX6ELKI2bk3vdYuGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ntJHaBWP0BMOdPjJ7oVWlQLAIoD/p23R5AQyJRZs7kWc+GCOQQMCTX8rmwe0umBTbvk9KCjKjUd3HTkIs2mgRY3rzBcbIRZiEwSU91qNPlyOpLa6pSbFFrs2BOX/CxE/9mJbSo/yxOXmYmFXVBITEXXTjmPzccflRB59Vvr4yIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDpfbEb6; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDpfbEb6"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c96b2a10e1so8359358a12.2
        for <linux-sunxi@lists.linux.dev>; Tue, 12 Nov 2024 02:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731408149; x=1732012949; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4ohv0uCye1Wp5cMU+c36gYvUhO+ctt1oOs2cNDUinPY=;
        b=JDpfbEb6RtdhDyaA91SESUH+wfaCCR+REGEU0uQS5Fz6C5pgCaCS2HvefQrJ94Mfmy
         vv4UPFk+fKO1JxtIeLpspvaA4UdwRJs4tms/KI7jLo0JRWJShRa/DROsapiMtwglJaB8
         8TxVMCQQtKHxqudNNLQhPnNzRGfUOfZ/0qlYnSuhmQC3JDfWr/JXJ4RtlVejtduar76z
         bRTr7ezp8ThiX3XgO4nVAFXcXDQ4yCaayRv2dTPp5czO8GzzLBqr6Qcw/u7DxVnVoIKG
         yic+/xksSnop9WamiHR020DTIoG1lpJ7fISCcgPTuuRpFOdfckLTYb8qOWQGG3qXqqUq
         0djA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731408149; x=1732012949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ohv0uCye1Wp5cMU+c36gYvUhO+ctt1oOs2cNDUinPY=;
        b=fX0bx0e+yqDPYWPkCvHwlSDoiQRm8WQCg7LGjg0SWBr7u7LnMp92j+ovfg7iVMVait
         1ETfwVfcoDkrfDAc/tAmMqOH9rbUqg94TybDXUNivgH3y2oSG64me067eUjOTT/kUzN8
         POE7EcLZ+LOc2p1xMHlLvZw6EvpsHATL55IZ3OsIcYG3UucEnMGGIFkuTna/eE6t18iW
         hT8wKeb/0pVDLyx88tcJS+dp6oCrj8eecq4oojXdu90uMBG75j3gNaG7K9U5HGPvxyoq
         Wjxix686j156Ld4ukS7dJ4dr5I/vd4161Ur0NoJAMNsicCEkURtZuqzXhoG2we8G11MD
         b03A==
X-Forwarded-Encrypted: i=1; AJvYcCVfVAd4z2PO9eVMfFyf5ypbNz5ITVsVa+S+zasNq0jssu6+WSzJB9ETZCE6watUudF79BctP5bKEFhckA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2jmlpo3zQIu2MNXuUmZ3JdUVtfG1u4ds29fglQ+1uU67sx/u4
	bX5k1rDpPz1gd9VtI1Nf2Sb2bHBJiDVxELK4bTOgONSDDCgjyRfkvCcj5ZBnnwzC59uvcnYkiQF
	MOj0avUrdzuK8zLYt3ikDdtIQQNs=
X-Google-Smtp-Source: AGHT+IGK3hIEdIpZExqiPXO4zhHYYYogyfmxjo8O+3yM7bb5tHwjtMCyTQJxUWf+z/3vjfc4xETKmZOeg+W+zGoLFPA=
X-Received: by 2002:a05:6402:210f:b0:5cf:40fd:a445 with SMTP id
 4fb4d7f45d1cf-5cf40fda638mr5501970a12.6.1731408148977; Tue, 12 Nov 2024
 02:42:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241111162524.46812-1-codekipper@gmail.com> <20241111162524.46812-3-codekipper@gmail.com>
 <20241111172731.54154a3e@donnerap.manchester.arm.com>
In-Reply-To: <20241111172731.54154a3e@donnerap.manchester.arm.com>
From: Code Kipper <codekipper@gmail.com>
Date: Tue, 12 Nov 2024 11:42:17 +0100
Message-ID: <CAEKpxB=EE8WC6EETxJz-Qp42TchDSRTp1T+KiGMfQ4Kv9dvG1g@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: Add initial support for the
 X96Q-Pro STB
To: Andre Przywara <andre.przywara@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, 
	krzk+dt@kernel.org, robh@kernel.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org, wens@csie.org, macromorgan@hotmail.com, 
	jszhang@kernel.org, uwu@icenowy.me, ryan@testtoast.com, dsimic@manjaro.org, 
	mripard@kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Nov 2024 at 18:27, Andre Przywara <andre.przywara@arm.com> wrote:
>
> On Mon, 11 Nov 2024 17:25:06 +0100
> codekipper@gmail.com wrote:
>
> Hi Marcus,
>
> many thanks for sending this!
>
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > The X96Q-Pro is an STB based on the Allwinner H313 SoC with a SD
> > slot, 2 USB-2 ports, a 10/100M ethernet port using the SoC's
> > integrated PHY, Wifi via an sdio wifi chip, HDMI, an IR receiver,
> > a blue LED display, an audio video connector and an digital S/PDIF
> > connector.
> >
> > Add the devicetree file describing the currently supported features,
> > namely IR, LEDs, SD card, PMIC, audio codec, SPDIF and USB.
>
> This looks good on a first glance, but seems to miss the DVFS bits? So you
> would need to #include "sun50i-h616-cpu-opp.dtsi" and specify the cpu0
> power supply rail, otherwise you will be stuck at 1GHz.
Hi Andre,
thanks for the speedy review. I'll add the cpu0 rail but I can't get
the device to clock more than 1GHz. Isn't that the case with the H313
chipset?, your Tanix TX1 device doesn't reference the opp.dtsi,
although I do see from the wiki that it's clocked at 1.3GHz
>
> Or is there any issue preventing you doing this?
>
> Two more things below:
>
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >  .../dts/allwinner/sun50i-h313-x96q-pro.dts    | 176 ++++++++++++++++++
> >  2 files changed, 177 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h313-x96q-pro.dts
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> > index 00bed412ee31c..e0bcea1840c1f 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h64-remix-mini-pc.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h313-x96q-pro.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus-v1.2.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-emlid-neutis-n5-devboard.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q-pro.dts b/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q-pro.dts
> > new file mode 100644
> > index 0000000000000..4427545ea143c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q-pro.dts
> > @@ -0,0 +1,176 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> > +/*
> > + */
>
> Is this missing some copyright notice here?
Ack
>
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-h616.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> > +     model = "X96Q Pro";
> > +     compatible = "amediatech,x96q-pro", "allwinner,sun50i-h616";
> > +
> > +     aliases {
> > +             serial0 = &uart0;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path = "serial0:115200n8";
> > +     };
> > +
> > +     reg_vcc5v: vcc5v {
> > +             /* board wide 5V supply directly from the DC input */
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "vcc-5v";
> > +             regulator-min-microvolt = <5000000>;
> > +             regulator-max-microvolt = <5000000>;
> > +             regulator-always-on;
> > +     };
> > +
> > +     sound-spdif {
> > +             compatible = "simple-audio-card";
> > +             simple-audio-card,name = "sun50i-h616-spdif";
> > +
> > +             simple-audio-card,cpu {
> > +                     sound-dai = <&spdif>;
> > +             };
> > +
> > +             simple-audio-card,codec {
> > +                     sound-dai = <&spdif_out>;
> > +             };
> > +     };
> > +
> > +     spdif_out: spdif-out {
> > +             #sound-dai-cells = <0>;
> > +             compatible = "linux,spdif-dit";
> > +     };
> > +};
> > +
> > +&codec {
> > +     allwinner,audio-routing = "Line Out", "LINEOUT";
> > +     status = "okay";
> > +};
> > +
> > +&ehci0 {
> > +     status = "okay";
> > +};
> > +
> > +&ehci3 {
> > +     status = "okay";
> > +};
> > +
> > +&ir {
> > +     status = "okay";
> > +};
> > +
> > +&mmc0 {
> > +     vmmc-supply = <&reg_dldo1>;
> > +     cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
> > +     bus-width = <4>;
> > +     status = "okay";
> > +};
>
> Would it make sense to add the mmc1 node here, even if there is no driver
> in Linux atm for the WiFi chip? Thanks to SDIO we wouldn't need a
> compatible string, I think. This would also then allow us to describe the
> connected GPIOs.
Ack
>
> And does the box have Bluetooth?
No it doesn't just the XR819 for wifi.
I'll spin a V2 after a few days,
BR,
CK
>
> Cheers,
> Andre
>
> > +
> > +&mmc2 {
> > +     vmmc-supply = <&reg_dldo1>;
> > +     vqmmc-supply = <&reg_aldo1>;
> > +     bus-width = <8>;
> > +     non-removable;
> > +     cap-mmc-hw-reset;
> > +     mmc-ddr-1_8v;
> > +     mmc-hs200-1_8v;
> > +     status = "okay";
> > +};
> > +
> > +&ohci0 {
> > +     status = "okay";
> > +};
> > +
> > +&ohci3 {
> > +     status = "okay";
> > +};
> > +
> > +&pio {
> > +     vcc-pc-supply = <&reg_dldo1>;
> > +     vcc-pf-supply = <&reg_dldo1>;
> > +     vcc-pg-supply = <&reg_aldo1>;
> > +     vcc-ph-supply = <&reg_dldo1>;
> > +     vcc-pi-supply = <&reg_dldo1>;
> > +};
> > +
> > +&r_i2c {
> > +     status = "okay";
> > +
> > +     axp313: pmic@36 {
> > +             compatible = "x-powers,axp313a";
> > +             reg = <0x36>;
> > +             #interrupt-cells = <1>;
> > +             interrupt-controller;
> > +             interrupt-parent = <&pio>;
> > +             interrupts = <2 9 IRQ_TYPE_LEVEL_LOW>;  /* PC9 */
> > +
> > +             vin1-supply = <&reg_vcc5v>;
> > +             vin2-supply = <&reg_vcc5v>;
> > +             vin3-supply = <&reg_vcc5v>;
> > +
> > +             regulators {
> > +                     /* Supplies VCC-PLL, so needs to be always on. */
> > +                     reg_aldo1: aldo1 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt = <1800000>;
> > +                             regulator-max-microvolt = <1800000>;
> > +                             regulator-name = "vcc1v8";
> > +                     };
> > +
> > +                     /* Supplies VCC-IO, so needs to be always on. */
> > +                     reg_dldo1: dldo1 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt = <3300000>;
> > +                             regulator-max-microvolt = <3300000>;
> > +                             regulator-name = "vcc3v3";
> > +                     };
> > +
> > +                     reg_dcdc1: dcdc1 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt = <810000>;
> > +                             regulator-max-microvolt = <990000>;
> > +                             regulator-name = "vdd-gpu-sys";
> > +                     };
> > +
> > +                     reg_dcdc2: dcdc2 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt = <810000>;
> > +                             regulator-max-microvolt = <1100000>;
> > +                             regulator-name = "vdd-cpu";
> > +                     };
> > +
> > +                     reg_dcdc3: dcdc3 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt = <1100000>;
> > +                             regulator-max-microvolt = <1100000>;
> > +                             regulator-name = "vdd-dram";
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&spdif {
> > +     status = "okay";
> > +};
> > +
> > +&uart0 {
> > +     pinctrl-names = "default";
> > +     pinctrl-0 = <&uart0_ph_pins>;
> > +     status = "okay";
> > +};
> > +
> > +&usbotg {
> > +     dr_mode = "host";       /* USB A type receptable */
> > +     status = "okay";
> > +};
> > +
> > +&usbphy {
> > +     status = "okay";
> > +};
>
> d
