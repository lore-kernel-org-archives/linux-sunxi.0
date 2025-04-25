Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC032586D9
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 14:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745591898; cv=none; b=RrfgraRvT52GPh/7JrMdIrq4nNaPtZ9zd0A0rrdqAdppV/vpVX8EEhzIUDaNCmCjDTXIX2FqBThdPIBa7F+xFDGUoeLcXx2YnpHJyLmYCYF3qaV8nZwM9b1GL/GKEzTLeU3pvTS4DA9VNtlNfc9+wwev7ukdg8ox9DKD+2FKQj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745591898; c=relaxed/simple;
	bh=idNfLkiSgUVkiZCV56AhL5Zg1XHHF/WBcjWVZoadsr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8fRVJJy3mMKxW3s3Z+QLCGvynDFfboZpE/tAowGMrdZeIRoOQupAtfu/iK17DBTqpt5jK+NoJkakIe5PKUHXnqiEfDMbI3lyldv32krq8g2j0pEZy8A1bHI9iY8aXv3kxgfTchEmN+ieTynemXGbiLhj5a5d6BFE2hblbVb6JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d8dcc7cd17so9954565ab.1
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 07:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745591893; x=1746196693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jfqBRvfPPDpi0p6yGNanQ9Wexx6tabtfBunndyiN/Do=;
        b=bpL5ygx8qk80OSnLWBFDO3w+xqxL6/HnVT7xPXeMSzZC1zKxc6budPLwyWINydURyv
         SX4a8QNDbCePNpnkyOVK5f3ZhvNX/Diwh66PqWoIHpbnRh2T3vm3h8Jk+slorLbxoGFu
         gkqBE/hfxUeOT0v3RU5Lx21peR6qdFqc2d6JThNhuiTrqiS+xh0F25PvvHGSLfiI6IVq
         /jy1kb4+FRbhY6YdC218Tn5dr0QB3t3dzMaBlcfvFcZR8eisltNozQJT4+J2qxiNr8JI
         wy3jaReDupNxRmocNDZwuQeJPiBjjDyKvaUqbLOFhmixJaJbBif+m3CTZl0HC6Lubql9
         sM/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVS4d90P94/h6z9X5CsaTF8wMB6FPBC3Pa9F1U0zTuqeuySTumJvZQEqAEm9b8FxRF887Ql7mBdFyBNBg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTaiCDeQ830ifakHmOonWxunVlGHhUJGzCeDX2h63eovZ0CqA7
	en48MaaxYRs+zA2SRwTI1MP/Nbqq7jXEMhYiazYSRt8G+UCxQDUN9k3bew8Qh9w=
X-Gm-Gg: ASbGncsP/rjBezhO7Ww3UgRVR5/EvzUiASxJTpJvtGbqEM9XjPva547giT+m0zwqSdT
	g4IaB8o+tfUNjMjA9VO7kQ5XlKNLCSlg3SeqiLMg7Ab7jA4luWP3pjdZqoZef7go2Wntd/hrVpE
	+8KCOdiLgdssaFJJfOrXOMhWRBP0bp1p3zBqgIJjNNXkSE/CCoathWPhERaTRiJiuvHLC8tj9WB
	Or3aiV4TO+aFqGGIbosN7grIQw7e9lspNo+cpSlwQENcWsDExdGNkQChdMNM3tj0ekeRkNTiPIj
	4Kj1yEzJwt3y8GA68WzGcOciV0lAZrdaaV5tWdvK9/ViL3lOTTuZuzFoqVqwsSJck2s//pnPZld
	L1BPg
X-Google-Smtp-Source: AGHT+IGNIjb5TGb1Wn5/Zxqsy4aTUk0sDUlrjTNxDxYjou3cCcGmbqvMMbD8GQUOGPCNQyGickcpWw==
X-Received: by 2002:a05:6e02:3cc7:b0:3d6:cb49:1e5f with SMTP id e9e14a558f8ab-3d931558cd6mr82750235ab.2.1745591892597;
        Fri, 25 Apr 2025 07:38:12 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com. [209.85.166.47])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f8249fa226sm797698173.29.2025.04.25.07.38.11
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 07:38:11 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-85db3475637so103617339f.1
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 07:38:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWejCLbixNJ6V4t+DnyV8zY8FvU3krHM+/J6Q/6WhvArI0Ph3RxWWTMEsxS97lRr/+oyMtKJU4uCSjXtw==@lists.linux.dev
X-Received: by 2002:a05:6e02:1073:b0:3d4:346e:8d49 with SMTP id
 e9e14a558f8ab-3d931628480mr62227045ab.9.1745591891305; Fri, 25 Apr 2025
 07:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <20250413134318.66681-3-jernej.skrabec@gmail.com> <20250425135429.174a1871@donnerap.manchester.arm.com>
In-Reply-To: <20250425135429.174a1871@donnerap.manchester.arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 22:37:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v64uoeY-=4Dw5c5Zc5LxYqtUys76Bbe_S5P6_9xiC9eC3g@mail.gmail.com>
X-Gm-Features: ATxdqUFrMTPPODJj9edJnZR-Ay_KQrK9fut9CUOsKaMHTTZCEqlbKWQQRihfrhg
Message-ID: <CAGb2v64uoeY-=4Dw5c5Zc5LxYqtUys76Bbe_S5P6_9xiC9eC3g@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, samuel@sholland.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 8:54=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Sun, 13 Apr 2025 15:42:57 +0200
> Jernej Skrabec <jernej.skrabec@gmail.com> wrote:
>
> Hi Jernej,
>
> thanks for sending this, I now went through this in more detail and
> compared against the schematic, so some more nits below.
> I added the two comments from my other email before, so you can ignore th=
at
> one now.
>
> > OrangePi 3 LTS is quite similar to original OrangePi 3, but it has a lo=
t
> > small changes that makes DT sharing unpractical with it.
> >
> > OrangePi 3 LTS has following features:
> > - Allwinner H6 quad-core 64-bit ARM Cortex-A53
> > - GPU Mali-T720
> > - 2 GB LPDDR3 RAM
> > - AXP805 PMIC
> > - AW859A Wifi/BT 5.0
> > - 2x USB 2.0 host port (A)
> > - USB 3.0 Host
> > - Gigabit Ethernet (Motorcomm YT8531C phy)
> > - HDMI 2.0 port
> > - soldered 8 GB eMMC
> > - 2x LED
> > - microphone
> > - audio jack
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> >  .../allwinner/sun50i-h6-orangepi-3-lts.dts    | 351 ++++++++++++++++++
> >  2 files changed, 352 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-=
lts.dts
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/d=
ts/allwinner/Makefile
> > index 00bed412ee31..72c43bd0e2ab 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -33,6 +33,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero=
-plus.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus2.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-beelink-gs1.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3-lts.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts=
 b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > new file mode 100644
> > index 000000000000..c8830d5c2f09
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > @@ -0,0 +1,351 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +// Copyright (C) 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> > +// Based on sun50i-h6-orangepi-3.dts, which is:
> > +// Copyright (C) 2019 Ond=C5=99ej Jirman <megous@megous.com>
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-h6.dtsi"
> > +#include "sun50i-h6-cpu-opp.dtsi"
> > +#include "sun50i-h6-gpu-opp.dtsi"
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/leds/common.h>
> > +
> > +/ {
> > +     model =3D "OrangePi 3 LTS";
> > +     compatible =3D "xunlong,orangepi-3-lts", "allwinner,sun50i-h6";
> > +
> > +     aliases {
> > +             ethernet0 =3D &emac;
> > +             ethernet1 =3D &aw859a;
> > +             serial0 =3D &uart0;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
> > +
> > +     connector {
> > +             compatible =3D "hdmi-connector";
> > +             ddc-en-gpios =3D <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
> > +             type =3D "a";
> > +
> > +             port {
> > +                     hdmi_con_in: endpoint {
> > +                             remote-endpoint =3D <&hdmi_out_con>;
> > +                     };
> > +             };
> > +     };
> > +
> > +     ext_osc32k: ext_osc32k_clk {
>
> For the sake of completeness, as mentioned in the other mail, I think we
> want dashes in the node name.
>
> > +             #clock-cells =3D <0>;
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <32768>;
> > +             clock-output-names =3D "ext_osc32k";
>
> Should the output name also contain dashes instead?
>
> > +     };
> > +
> > +     leds {
> > +             compatible =3D "gpio-leds";
> > +
> > +             led-0 {
> > +                     function =3D LED_FUNCTION_POWER;
> > +                     color =3D <LED_COLOR_ID_RED>;
> > +                     gpios =3D <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 *=
/
> > +                     default-state =3D "on";
>
> Maybe something for a follow up patch, but I noticed that the schematic
> does not show current limiting resistors for the LEDs. This probably work=
s
> because the default drive strength is 0b01, so level 1 (in a range from 0
> to 3, which we map to 10, 20, 30, 40 mA). The exact LED is not mentioned,
> but I would imagine that more than 20 mA would not be healthy, and even
> this might be a stretch over longer times.
>
> So should we force the drive-strength to <10> or <20> somewhere? How does
> this even work for those gpios references?

I think it's possible to have a pinctrl setting node without the
"function" property? That way the pin config settings are applied,
but no function is muxed, thereby not conflicting with GPIO usage.

I've not actually tried it though.

This is also why I didn't want new pinctrl bindings that "force"
one to mux the pin.

ChenYu

> > +             };
> > +
> > +             led-1 {
> > +                     function =3D LED_FUNCTION_STATUS;
> > +                     color =3D <LED_COLOR_ID_GREEN>;
> > +                     gpios =3D <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 *=
/
> > +             };
> > +     };
> > +
> > +     reg_gmac_3v3: gmac-3v3 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "gmac-3v3";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             startup-delay-us =3D <150000>;
> > +             enable-active-high;
> > +             gpio =3D <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
>
> Can you please add a "vin-supply =3D <&reg_vcc5v>;" line here, to chain t=
hem
> up nicely?
>
> > +     };
> > +
> > +     reg_vcc5v: vcc5v {
> > +             /* board wide 5V supply directly from the DC jack */
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vcc-5v";
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             regulator-always-on;
> > +     };
> > +
> > +     reg_wifi_3v3: wifi-3v3 {
> > +             /* 3.3V regulator for WiFi and BT */
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "wifi-3v3";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             enable-active-high;
> > +             gpio =3D <&pio 7 7 GPIO_ACTIVE_HIGH>; /* PH7 */
>
> Same vin-supply here, please, this discrete regulator is fed by DCIN 5V.
>
> > +     };
> > +
> > +     wifi_pwrseq: wifi-pwrseq {
> > +             compatible =3D "mmc-pwrseq-simple";
> > +             clocks =3D <&rtc 1>;
>
> As mentioned yesterday, please use CLK_OSC32K_FANOUT.
>
> > +             clock-names =3D "ext_clock";
> > +             reset-gpios =3D <&r_pio 1 3 GPIO_ACTIVE_LOW>; /* PM3 */
> > +             post-power-on-delay-ms =3D <200>;
> > +     };
> > +};
> > +
> > +&cpu0 {
> > +     cpu-supply =3D <&reg_dcdca>;
> > +};
> > +
> > +&de {
> > +     status =3D "okay";
> > +};
> > +
> > +&dwc3 {
> > +     status =3D "okay";
> > +};
> > +
> > +&ehci0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&ehci3 {
> > +     status =3D "okay";
> > +};
> > +
> > +&emac {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&ext_rgmii_pins>;
> > +     phy-mode =3D "rgmii-rxid";
>
> So relating to what Andrew said earlier today, should this read rgmii-id
> instead? Since the strap resistors just set some boot-up value, but we
> want the PHY driver to enable both RX and TX delay programmatically?
>
> > +     phy-handle =3D <&ext_rgmii_phy>;
> > +     phy-supply =3D <&reg_gmac_3v3>;
> > +     allwinner,rx-delay-ps =3D <0>;
> > +     allwinner,tx-delay-ps =3D <700>;
> > +     status =3D "okay";
> > +};
> > +
> > +&gpu {
> > +     mali-supply =3D <&reg_dcdcc>;
> > +     status =3D "okay";
> > +};
> > +
> > +&hdmi {
> > +     hvcc-supply =3D <&reg_bldo2>;
> > +     status =3D "okay";
> > +};
> > +
> > +&hdmi_out {
> > +     hdmi_out_con: endpoint {
> > +             remote-endpoint =3D <&hdmi_con_in>;
> > +     };
> > +};
> > +
> > +&mdio {
> > +     ext_rgmii_phy: ethernet-phy@1 {
> > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > +             reg =3D <1>;
> > +
> > +             motorcomm,clk-out-frequency-hz =3D <125000000>;
> > +
> > +             reset-gpios =3D <&pio 3 14 GPIO_ACTIVE_LOW>; /* PD14 */
> > +             reset-assert-us =3D <15000>;
> > +             reset-deassert-us =3D <100000>;
> > +     };
> > +};
> > +
> > +&mmc0 {
> > +     vmmc-supply =3D <&reg_cldo1>;
> > +     cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> > +     disable-wp;
> > +     bus-width =3D <4>;
> > +     status =3D "okay";
> > +};
> > +
> > +&mmc1 {
> > +     vmmc-supply =3D <&reg_wifi_3v3>;
> > +     vqmmc-supply =3D <&reg_bldo3>;
> > +     mmc-pwrseq =3D <&wifi_pwrseq>;
> > +     bus-width =3D <4>;
> > +     non-removable;
> > +     status =3D "okay";
> > +
> > +     aw859a: wifi@1 {
> > +             reg =3D <1>;
> > +     };
> > +};
> > +
> > +&mmc2 {
> > +     vmmc-supply =3D <&reg_cldo1>;
> > +     vqmmc-supply =3D <&reg_bldo2>;
> > +     cap-mmc-hw-reset;
> > +     non-removable;
> > +     bus-width =3D <8>;
> > +     status =3D "okay";
>
> Given that it's 1.8V on the I/O lines, I think we would need the
> mmc-ddr-1_8v and mmc-hs200-1_8v properties, for higher speed modes? Or
> does that not work?
>
> > +};
> > +
> > +&ohci0 {
> > +     status =3D "okay";
> > +};
> > +
> > +&ohci3 {
> > +     status =3D "okay";
> > +};
> > +
> > +&pio {
> > +     vcc-pc-supply =3D <&reg_bldo2>;
> > +     vcc-pd-supply =3D <&reg_cldo1>;
> > +     vcc-pg-supply =3D <&reg_bldo3>;
> > +};
> > +
> > +&r_ir {
> > +     status =3D "okay";
> > +};
> > +
> > +&r_i2c {
> > +     status =3D "okay";
> > +
> > +     axp805: pmic@36 {
> > +             compatible =3D "x-powers,axp805", "x-powers,axp806";
> > +             reg =3D <0x36>;
> > +             interrupt-parent =3D <&r_intc>;
> > +             interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
> > +             interrupt-controller;
> > +             #interrupt-cells =3D <1>;
> > +             x-powers,self-working-mode;
> > +             vina-supply =3D <&reg_vcc5v>;
> > +             vinb-supply =3D <&reg_vcc5v>;
> > +             vinc-supply =3D <&reg_vcc5v>;
> > +             vind-supply =3D <&reg_vcc5v>;
> > +             vine-supply =3D <&reg_vcc5v>;
> > +             aldoin-supply =3D <&reg_vcc5v>;
> > +             bldoin-supply =3D <&reg_vcc5v>;
> > +             cldoin-supply =3D <&reg_vcc5v>;
> > +
> > +             regulators {
> > +                     reg_aldo1: aldo1 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <3300000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-name =3D "vcc-pl-led-ir";
> > +                     };
> > +
> > +                     reg_aldo2: aldo2 {
> > +                             regulator-min-microvolt =3D <3300000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-name =3D "vcc33-audio-tv-ephy-m=
ac";
> > +                     };
> > +
> > +                     /* ALDO3 is shorted to CLDO1 */
> > +                     reg_aldo3: aldo3 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <3300000>;
> > +                             regulator-max-microvolt =3D <3300000>;cl
> > +                             regulator-name =3D "vcc33-io-pd-emmc-sd-u=
sb-uart-1";
> > +                     };
> > +
> > +                     reg_bldo1: bldo1 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                             regulator-name =3D "vcc18-dram-bias-pll";
> > +                     };
> > +
> > +                     reg_bldo2: bldo2 {
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                             regulator-name =3D "vcc-efuse-pcie-hdmi-p=
c";
> > +                     };
> > +
> > +                     reg_bldo3: bldo3 {
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                             regulator-name =3D "vcc-pm-pg-dcxoio-wifi=
";
>
> As you mention in the name, this rail is connected to VCC_DCXO, which IIU=
C
> is an essential supply, for the crystal oscillator circuit. So I think th=
is
> needs to be always on?
>
> > +                     };
> > +
> > +                     bldo4 {
> > +                             /* unused */
> > +                     };
> > +
> > +                     reg_cldo1: cldo1 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <3300000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-name =3D "vcc33-io-pd-emmc-sd-u=
sb-uart-2";
> > +                     };
> > +
> > +                     cldo2 {
> > +                             /* unused */
> > +                     };
> > +
> > +                     cldo3 {
> > +                             /* unused */
> > +                     };
> > +
> > +                     reg_dcdca: dcdca {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <800000>;
> > +                             regulator-max-microvolt =3D <1160000>;
> > +                             regulator-ramp-delay =3D <2500>;
> > +                             regulator-name =3D "vdd-cpu";
> > +                     };
>
> Can you maybe add a comment here to say that DCDCB is polyphased to DCDCA=
?
>
> I went through the whole rest and compared against the schematic
> (looking at GPIOs and power rails), and that looks OK from what I can see=
.
>
> Thanks,
> Andre
>
>
> > +
> > +                     reg_dcdcc: dcdcc {
> > +                             regulator-enable-ramp-delay =3D <32000>;
> > +                             regulator-min-microvolt =3D <810000>;
> > +                             regulator-max-microvolt =3D <1080000>;
> > +                             regulator-ramp-delay =3D <2500>;
> > +                             regulator-name =3D "vdd-gpu";
> > +                     };
> > +
> > +                     reg_dcdcd: dcdcd {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <960000>;
> > +                             regulator-max-microvolt =3D <960000>;
> > +                             regulator-name =3D "vdd-sys";
> > +                     };
> > +
> > +                     reg_dcdce: dcdce {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <1200000>;
> > +                             regulator-max-microvolt =3D <1200000>;
> > +                             regulator-name =3D "vcc-dram";
> > +                     };
> > +
> > +                     sw {
> > +                             /* unused */
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&rtc {
> > +     clocks =3D <&ext_osc32k>;
> > +};
> > +
> > +&uart0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&uart0_ph_pins>;
> > +     status =3D "okay";
> > +};
> > +
> > +&usb2otg {
> > +     dr_mode =3D "host";
> > +     status =3D "okay";
> > +};
> > +
> > +&usb2phy {
> > +     usb0_id_det-gpios =3D <&pio 2 15 GPIO_ACTIVE_HIGH>; /* PC15 */
> > +     usb0_vbus-supply =3D <&reg_vcc5v>;
> > +     usb3_vbus-supply =3D <&reg_vcc5v>;
> > +     status =3D "okay";
> > +};
> > +
> > +&usb3phy {
> > +     status =3D "okay";
> > +};
>
>
