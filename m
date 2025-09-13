Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C1B3C17
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Sep 2025 09:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757756194; cv=none; b=mB0H8DCj87MGmHueb207HjHLZpsCHHdyYG3jJYhQSVk3t3c04DqcMaQqJHrkwh+8+DQ3LHeu19SRbVKuCTdt6L2G97f4kG2jSM+fBOvKov/H1sFnJNxr/WDrpV04FY8iniGkl9DL/tGfmwARhst8/IEUnZEPz/MAh+1f/WN7s24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757756194; c=relaxed/simple;
	bh=qU93wUOjpe3WB2lYaYMmhV83m7IrQzkGxKm1pcbztqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qs7rgaHaAeXt3g5QltMICX5C0cWidF2zHsmcvtiqi51hveeNVyNFO5g4IGaLXB4XUy47Uwhx/k1Y6wUmSH8b6jkv4Hb4R81EfNyb+HjcOMUIC/Wid1TWXX6OPEjALU/lmy1z0HCAC5BCJNXs9BMc42yszKXLK4FyoexXcBBB5X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-56afe77bc1eso2930322e87.0
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Sep 2025 02:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757756187; x=1758360987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LqZkejEpj7nilH9mKjPMxCw9IdcRez2O8jHjWC+E3jg=;
        b=RV9FSyxpJzpqFeK4hFOBgFeSGgqM9sAEdXnnqTJo4i8Wms2CAM2ffvjo//3cDahjPw
         WkI/IZZN/X/9SqSQaO2Xw6+zNVOj1njnJgRXZkDrmJhZ41zvO/fO/DSP5rHxE9xtSHyw
         TEOsO35H7Hr3xsTkcRMPLtfaKCT0l32OmuQTQfdAG0GuuF9h5OI/ar9N3w8aL/QPA6QF
         HQuF0YarPemaWlhMdlB+D1t4YCx8R9CpNVIPsUr7zeWXC3+6CvI8xzk7PkLVwSlCUUf0
         UcXIvpLCX9itlSWZ8rUR2q7vak1tjBi6VP3gYDGpSGg82S+7CNMvxXGl9LxZyr5tYlYh
         3TQg==
X-Forwarded-Encrypted: i=1; AJvYcCXg5JVkQUhshBaExSupiyF8pAdLDbZ38pacTs0eqDW+92DOG/o3hPH78D62FD4LODZ0FEUK3Sc5LqV2Qg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwsPprLi37sU7GjxkSpgSfNwUDU7LQPHerPuRr4XrS3U8i/2lAO
	xyiwSTXpQ8D53CxUctfdxYyOj0jeUG5rdL7ICMxPmedc/Em0FtMU3BCfqLM4/61gxxg=
X-Gm-Gg: ASbGncvcmdxPzXUAxJb413emFiP9mdcaRB5NHo1P2D/8gCS56hOxvPOEu4zRubtyO95
	7EiCiI74K3YQYikUZWdhqCwTactNBDLQPo6t90eUKjSS9ZdPwIac/1wsf15/1oeVwU00ABa1+WL
	4JMU4dMCaND+ThL40mLuY2nsTPxlnnrL7ThJbsvOyK9MR5X21s9V9GJK1X0vWput21TEwBpG33W
	3luzT8oIaR3yzOh2/adKpafDSAxKq6asCOm6Kmbr9+PqMjEzrwbsngIIQfM+atzqQ4AU/TMpDa8
	P7j42usXsZVLffMGH61fC0de9aWyYkwSqTw8s0ssbVO2tMW8ELWpaAXgv44yKFiEkDwcckb5IZi
	nhvlkMPUphj2mi3LUGSQ7UsvIyk62en7CzbnLbVkpeXoxOwT/z7KDZhlcCpyJ3PocAQ==
X-Google-Smtp-Source: AGHT+IGxg5RyR6oLxHut7FVq0va86AgfcqtGXeH6c45yWYEuPgmBbmq29bgltweipgZByqh4mzi7ZA==
X-Received: by 2002:a05:6512:e9d:b0:55f:3faa:7c21 with SMTP id 2adb3069b0e04-5704f3bed71mr1913157e87.34.1757756186510;
        Sat, 13 Sep 2025 02:36:26 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1b2a925dsm12790141fa.46.2025.09.13.02.36.25
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 02:36:25 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-336dd55aae1so25878841fa.1
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Sep 2025 02:36:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrbvND7ybBKZESF+1073EYc9giD/5mCJFXXjffBxDrHughrEMkxl3/dGGhbGnM1xanoFBviq0dWJeb6w==@lists.linux.dev
X-Received: by 2002:a05:651c:b23:b0:337:f9d1:2d4b with SMTP id
 38308e7fff4ca-35140dad226mr15003881fa.43.1757756185533; Sat, 13 Sep 2025
 02:36:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250912-x96q-v1-0-8471daaf39db@posteo.net> <20250912-x96q-v1-2-8471daaf39db@posteo.net>
 <20250912105449.70717d80@donnerap>
In-Reply-To: <20250912105449.70717d80@donnerap>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 13 Sep 2025 17:36:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v67dp8V4A86yyaixN9oOgBzMpLJ0ZxnDLng8mO2tkEqYUg@mail.gmail.com>
X-Gm-Features: Ac12FXy8fzV4FQejnH6LBzMMS9T4T_cC2xTKZN88l5j4V4okWfzi1q9Hfy1IowY
Message-ID: <CAGb2v67dp8V4A86yyaixN9oOgBzMpLJ0ZxnDLng8mO2tkEqYUg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h313: Add Amediatech X96Q
To: Andre Przywara <andre.przywara@arm.com>, 
	=?UTF-8?Q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>, 
	j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 5:54=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Fri, 12 Sep 2025 01:52:10 +0200
> J. Neusch=C3=A4fer via B4 Relay <devnull+j.ne.posteo.net@kernel.org> wrot=
e:
>
> Hi,
>
> many thanks for posting the DT, I really wish more people would do that!
>
> > From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
> >
> > The X96Q is a set-top box with an H313 SoC, AXP305 PMIC, 1 or 2 GiB RAM=
,
> > 8 or 16 GiB eMMC flash, 2x USB A, Micro-SD, HDMI, Ethernet, audio/video
> > output, and infrared input.
> >
> >   https://x96mini.com/products/x96q-tv-box-android-10-set-top-box
> >
> > Tested, works:
> > - debug UART
> > - status LED
> > - USB ports in host mode
> > - MicroSD
> > - eMMC
> > - recovery button hidden behind audio/video port
> > - analog audio (line out)
> >
> > Does not work:
> > - Ethernet (requires AC200 MFD/EPHY driver)
> > - analog video output (requires AC200 driver)
> > - HDMI audio/video output
> >
> > Untested:
> > - "OTG" USB port in device mode
> > - built-in IR receiver
> > - external IR receiver
> > - WLAN (requires out-of-tree XRadio driver)
> >
> > Table of regulators on the downstream kernel, for reference:
> >
> >  vcc-5v      1   15      0 unknown  5000mV     0mA  5000mV  5000mV
> >     dcdca    0    0      0 unknown   900mV     0mA     0mV     0mV
> >     dcdcb    0    0      0 unknown  1350mV     0mA     0mV     0mV
> >     dcdcc    0    0      0 unknown   900mV     0mA     0mV     0mV
> >     dcdcd    0    0      0 unknown  1500mV     0mA     0mV     0mV
> >     dcdce    0    0      0 unknown  3300mV     0mA     0mV     0mV
> >     aldo1    0    0      0 unknown  3300mV     0mA     0mV     0mV
> >     aldo2    0    0      0 unknown   700mV     0mA     0mV     0mV
> >     aldo3    0    0      0 unknown   700mV     0mA     0mV     0mV
> >     bldo1    0    0      0 unknown  1800mV     0mA     0mV     0mV
> >     bldo2    0    0      0 unknown  1800mV     0mA     0mV     0mV
> >     bldo3    0    0      0 unknown   700mV     0mA     0mV     0mV
> >     bldo4    0    0      0 unknown   700mV     0mA     0mV     0mV
> >     cldo1    0    0      0 unknown  2500mV     0mA     0mV     0mV
> >     cldo2    0    0      0 unknown   700mV     0mA     0mV     0mV
> >     cldo3    0    0      0 unknown   700mV     0mA     0mV     0mV
> >
> > Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
> >  arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts | 235 +++++++++++++=
++++++++
> >  2 files changed, 236 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/d=
ts/allwinner/Makefile
> > index 780aeba0f3a4e14d69c9602e37b8d299165507b9..2edfa7bf4ab31c4aa934da9=
8e5e042edc9aaf600 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64-mode=
l-b.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6-mini.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h313-tanix-tx1.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h313-x96q.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-bigtreetech-cb1-manta.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-bigtreetech-pi.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-orangepi-zero2.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts b/arch/=
arm64/boot/dts/allwinner/sun50i-h313-x96q.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..9534eb03b89557f2545af5a=
f7cf43390be722cf0
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts
> > @@ -0,0 +1,235 @@
> > +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> > +/*
> > + * Copyright (C) 2025 J. Neusch=C3=A4fer <j.ne@posteo.net>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "sun50i-h616.dtsi"
> > +#include "sun50i-h616-cpu-opp.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/input/linux-event-codes.h>
> > +#include <dt-bindings/leds/common.h>
> > +
> > +/ {
> > +     model =3D "X96Q";
> > +     compatible =3D "amediatech,x96q", "allwinner,sun50i-h616";
> > +
> > +     aliases {
> > +             mmc0 =3D &mmc0;
> > +             mmc1 =3D &mmc1;
> > +             mmc2 =3D &mmc2;
>
> We don't do mmc aliases in the upstream DTs. Long story, but you should
> not need them. I guess you want to disagree ;-), in this case U-Boot has
> you covered, by adding the aliases during build time: just use
> $fdtcontroladdr, as you should do anyway.
>
> > +             serial0 =3D &uart0;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
> > +
> > +     reg_vcc5v: vcc5v {
> > +             /* board wide 5V supply directly from the DC input */
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vcc-5v";
> > +             regulator-min-microvolt =3D <5000000>;
> > +             regulator-max-microvolt =3D <5000000>;
> > +             regulator-always-on;
> > +     };
> > +
> > +     gpio-keys {
> > +             compatible =3D "gpio-keys";
> > +
> > +             key-recovery {
> > +                     label =3D "Recovery";
> > +                     linux,code =3D <KEY_VENDOR>;
> > +                     gpios =3D <&pio 7 9 GPIO_ACTIVE_LOW>;
> > +             };
> > +     };
> > +
> > +     leds {
> > +             compatible =3D "gpio-leds";
> > +
> > +             led-0 {
> > +                     color =3D <LED_COLOR_ID_BLUE>;
> > +                     gpios =3D <&pio 7 6 GPIO_ACTIVE_LOW>;
> > +                     default-state =3D "on";
> > +             };
> > +     };
> > +};
> > +
> > +&codec {
> > +     allwinner,audio-routing =3D "Line Out", "LINEOUT";
> > +     status =3D "okay";
> > +};
> > +
> > +&cpu0 {
> > +     cpu-supply =3D <&reg_dcdca>;
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
> > +/* TODO: EMAC1 connected to AC200 PHY */
> > +
> > +&gpu {
> > +     mali-supply =3D <&reg_dcdcc>;
> > +     status =3D "okay";
> > +};
> > +
> > +&ir {
> > +     status =3D "okay";
> > +};
> > +
> > +&mmc0 {
> > +     vmmc-supply =3D <&reg_aldo1>;
> > +     cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
> > +     disable-wp;
> > +     bus-width =3D <4>;
> > +     max-frequency =3D <150000000>;
>
> That line is already in the .dtsi file, so redundant.
>
> > +     status =3D "okay";
> > +     /* =C2=B5SD */
>
> If we really need this comment, it should be above, right after the
> "&mmc0 {". And I wonder if it should be "microSD" instead.

Yes. Please use ASCII in the code if possible, since some of us have
setups that don't quite work well with extended character sets.

> > +};
> > +
> > +&mmc1 {
> > +     /* TODO: XRadio XR819 WLAN */
>
> Either you just keep the comment, an mention mmc1, but don't reference th=
e
> node, or you add the properties that you know of already, like
> vmmc-supply, vqmmc-supply, mmc-pwrseq, bus-width, non-removable.
> But this "empty reference with a comment" is somewhat odd.

I'd say just fill it in completely so that the mmc host is enabled and
the SDIO card is detected. Missing driver support for the chip is a
different issue, but since this is an enumerable bus it shouldn't prevent
you from describing everything already.

> > +};
> > +
> > +&mmc2 {
> > +     vmmc-supply =3D <&reg_aldo1>;
> > +     vqmmc-supply =3D <&reg_bldo1>;
> > +     non-removable;
> > +     cap-mmc-hw-reset;
> > +     mmc-ddr-1_8v;
> > +     mmc-hs200-1_8v;
> > +     bus-width =3D <8>;
> > +     max-frequency =3D <100000000>;
>
> Are you sure you need that?
>
> > +     status =3D "okay";
> > +     /* eMMC */
>
> Please move that comment up.

I don't think it's necessary though. hs200 and 8-bit width would make
it obvious that it's an eMMC.

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
> > +&r_i2c {
> > +     status =3D "okay";
> > +
> > +     axp305: pmic@36 {
> > +             compatible =3D "x-powers,axp305", "x-powers,axp805",
> > +                          "x-powers,axp806";
> > +             interrupt-controller;
> > +             #interrupt-cells =3D <1>;
> > +             reg =3D <0x36>;
> > +
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
> > +                     reg_dcdca: dcdca {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <810000>;
> > +                             regulator-max-microvolt =3D <1100000>;
> > +                             regulator-name =3D "vdd-cpu";
> > +                     };
> > +
> > +                     dcdcb {
> > +                             /* unused */
> > +                     };
> > +
> > +                     reg_dcdcc: dcdcc {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <810000>;
> > +                             regulator-max-microvolt =3D <990000>;
> > +                             regulator-name =3D "vdd-gpu-sys";
> > +                     };
> > +
> > +                     dcdcd {
> > +                             regulator-always-on;
>
> Why is this always on? What happens if you remove that line or turn it of=
f?
> For always-on regulators we either need a comment saying why, or, better,
> have an explanatory regulator-name (like above).
> Is that for DRAM, by any chance (1.5V for DDR3 chips)?
>
> Cheers,
> Andre
>
> > +                             regulator-min-microvolt =3D <1500000>;
> > +                             regulator-max-microvolt =3D <1500000>;
> > +                     };
> > +
> > +                     dcdce {
> > +                             /* unused */
> > +                     };
> > +
> > +                     reg_aldo1: aldo1 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <3300000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-name =3D "vcc3v3";
> > +                     };
> > +
> > +                     aldo2 {
> > +                             /* unused */
> > +                     };
> > +
> > +                     aldo3 {
> > +                             /* unused */
> > +                     };
> > +
> > +                     reg_bldo1: bldo1 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                             regulator-name =3D "vcc1v8";
> > +                     };
> > +
> > +                     bldo2 {
> > +                             /* unused */
> > +                     };
> > +
> > +                     bldo3 {
> > +                             /* unused */
> > +                     };
> > +
> > +                     bldo4 {
> > +                             /* unused */
> > +                     };
> > +
> > +                     cldo1 {
> > +                             /* unused */
> > +                     };
> > +
> > +                     cldo2 {
> > +                             /* unused */
> > +                     };
> > +
> > +                     cldo3 {
> > +                             /* unused */
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&uart0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&uart0_ph_pins>;
> > +     status =3D "okay";
> > +};
> > +
> > +&usbotg {
> > +     dr_mode =3D "host";       /* USB A type receptacle */
> > +     status =3D "okay";
> > +};
> > +
> > +&usbphy {
> > +     status =3D "okay";
> > +};
> >
>
>
