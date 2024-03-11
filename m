Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DAC5674A
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Mar 2024 20:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710187861; cv=none; b=TfnAlmBSO2vK9w7hTNquLHMXy/mLD92SA62+GFjBetR1ybyVDRK5PZyyr2x93qLEaPhh70AFtGF8Cu3sR+ELY+keCRddPH30JckxVqiZsSsjZANQcyKogcJqbYTDnt0OESP4B+mp1HaK9K4TQraDb7wjrvNkgLC1OpiGQsSSnDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710187861; c=relaxed/simple;
	bh=4wkuZWRdZ+lJ+ZUeYMpBOWYeGMlk6psqwgd6uz4kJm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQ/x06OyKncTMNgzTI80JE/iFLv4Q9LWarlGhqPfaqDBwxpjMoKPQzDfgF8to8/v94xuz+pdvQK1Zj0LrDDso+/0CUVeUgJYB69VuIaZpgOaI/K7jQCf+677K70QVDXNH1Lg16tOg+oA8OLsTFJ7U5Tq/hBnkq3uMFodBSwA1hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/XH2wxf; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/XH2wxf"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-513a06ef9b6so2775361e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Mar 2024 13:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710187858; x=1710792658; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gPpCjtyk7TuUaCVq95Hrn0Bm3fEH4LCM7YF5UhFpXA=;
        b=e/XH2wxfHJgpSeDcilyZRWEsWkWIrwG6tfNope8HFC8GiYC6BLP+kGfyxuKDXBGA8W
         pSY2k1zwdP8WFQyicEtgwqBhvzW+JpNXgvhiCpjGuLqVtITst5b0IBx9eQkLu4CtnPep
         BwaqCaG4IcGhY0K22ZrGG/1fiyz08787kQXNCvX9Y9F4KVkgvKmtf7zmjOTLOA62nv8H
         9FEJWpf1Ct0naFQ6jR//lMsv2+PswlR5F+fQOHC5VT5HVtdVPt8D20Cy0tNXUHOJmmFc
         Q4NlojbcmKSgwb+5ChJsz8i8sk1vSFnB3UwqJGKHwFrDEZ7WTgf79an1Ol9mQPy+tfGL
         oZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710187858; x=1710792658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gPpCjtyk7TuUaCVq95Hrn0Bm3fEH4LCM7YF5UhFpXA=;
        b=Kk8XYRkYQsAeeFb4zh//db2DYEvUv+O2zZcpOI2Jqx70FwQMXEk4qcPoCRVOZMAKsl
         R2dM23jsn5lnME0o1F1DJLu8zjvgUsLR65mV1s6prjp9qN0Ne6culkAjMo3dQPzNafH6
         rLi/NLG15/ZUWaetjdWZW6eJix+y+YQNzUrjR9RRFIwO3YLjS4Q6Dgm/nRpmjbFhw3nf
         r1UqwxYSmRe+i0uGAzs0KL0qrnWLEkniREbV1Z9Kwaxw8bYD2N2+gv79s5C3Aj64lCZ3
         bce6XExZTCNj/dNzDJV0qk6hGnvjoeM/veY5CPEMio5SV/NYhTQwBZRIjCmyg9vlPOF6
         E8lA==
X-Forwarded-Encrypted: i=1; AJvYcCVVN4qf4rkAW3RcTn2N4lOVvi1ISm/mOFUj6Xe/JjQDwb+F561/F5TM8bAPMlttULhk2GB+SKp+pJHhS6OUpTm5UtcIIrR001ghlQQ=
X-Gm-Message-State: AOJu0Yy4vw278pPfDhAqPc1aczhayv903RzWEc4ZASZhczJS9CsCcsbZ
	teVV8jhQTe1AYnF7NQTvc3l16yfQuMk/D6lSTKi9oi0yTJypJtB1WbcnGU8dIAQZjHe7v+pVFS4
	sueq6anuJF+EZOnIo69Dy57RC+t0=
X-Google-Smtp-Source: AGHT+IGYr4cPhea4AlHJCJdizYXqB09tVX9Ia6iIIl/hlo1qfq1a+7Ks14ukQL9jofKyFsho2KR+cDIWwKdP2EdLkKQ=
X-Received: by 2002:ac2:57c8:0:b0:513:9990:5997 with SMTP id
 k8-20020ac257c8000000b0051399905997mr3995971lfo.35.1710187857552; Mon, 11 Mar
 2024 13:10:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240309192425.40282-1-ressetkk@gmail.com> <20240310220004.0965e2ca@minigeek.lan>
 <CACttifJXW-WJjRBzDYk-TssS6v3XZD=Bc736zcH4emXr46cSPA@mail.gmail.com>
In-Reply-To: <CACttifJXW-WJjRBzDYk-TssS6v3XZD=Bc736zcH4emXr46cSPA@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 11 Mar 2024 21:10:45 +0100
Message-ID: <CAJiuCcegz07RnkCz_jfG3H_E0Vd08ZC2=Z1nCH09gD4=yfC6Ng@mail.gmail.com>
Subject: Re: [PATCH] sunxi: h616: add initial support for T95 AXP313 TV Box
To: Kamil Kasperski <ressetkk@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, u-boot@lists.denx.de, 
	linux-sunxi <linux-sunxi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 11 Mar 2024 at 11:38, Kamil Kasperski <ressetkk@gmail.com> wrote:
>
> Hello Andre,
> Thanks for your reply and thanks for pointing some stuff out.
>
> > What is "mbox"? Do you have any more information about this vendor?
>
> "MBOX" refers to the "Model" string from system properties.
> The problem is that it's quite hard to pin the correct vendor, since
> the OS is built based on Google Pixel 2.
> You can see that the fingerprint contains strings only for this phone:
> [ro.build.fingerprint]:
> [google/walley/walleye:10/QP1A.191105.004/eng.cmj.20220408.125005:userdeb=
ug/test-keys]
> Setting the device model as Vendor string seemed to be the most safe bet.
> If you have any other suggestions, please let me know.

Maybe a suggestion could be "YAGALA"

If you look on amazon, aliexpress you could find some vendors setting
the brand to this name.

Regards,

>
> > But please note that the devicetree needs to go through the Linux
> > mailing lists and repo first, and we automatically copy it from the
> > Linux tree once it has been merged there.
>
> Thanks for pointing that out. I'll contact Linux maintainers
> and will send updated patch.
>
> Best regards,
> Kamil
>
>
> niedz., 10 mar 2024 o 23:00 Andre Przywara <andre.przywara@arm.com> napis=
a=C5=82(a):
> >
> > On Sat,  9 Mar 2024 19:24:26 +0000
> > Kamil Kasperski <ressetkk@gmail.com> wrote:
> >
> > Hi Kamil,
> >
> > many thanks for sending a patch, that looks mostly good from the
> > technical point of view, only some smaller comments.
> >
> > But please note that the devicetree needs to go through the Linux
> > mailing lists and repo first, and we automatically copy it from the
> > Linux tree once it has been merged there. This is to ensure proper
> > review and checks with the Linux tooling.
> >
> > So can you please send just the .dts file to the DT and sunxi
> > maintainers the respective lists, as reported by get_maintainer.pl?
> > Then we can take it from there.
> >
> > > T95 is a most commonly known for being a box with a pre-installed mal=
ware.
> > > It uses Allwinner H616 and comes with eMMC and DDR3 memory.
> > > This device comes with two versions - one with AXP305 PMIC and anothe=
r with AXP313 PMIC.
> > > The AXP313 version comes with Secure Boot enabled and locked bootload=
er, so the u-boot has to be built with TOC0.
> > > DRAM settings are taken from Allwinner's boot0 for this box.
> >
> > Ah, thanks for figuring those out, that's very helpful.
> >
> > >
> > > Cc: Andre Przywara <andre.przywara@arm.com>
> > >
> > > Signed-off-by: Kamil Kasperski <ressetkk@gmail.com>
> > > ---
> > >  arch/arm/dts/Makefile                   |   3 +-
> > >  arch/arm/dts/sun50i-h616-t95-axp313.dts | 148 ++++++++++++++++++++++=
++
> > >  configs/t95_axp313_defconfig            |  27 +++++
> > >  3 files changed, 177 insertions(+), 1 deletion(-)
> > >  create mode 100644 arch/arm/dts/sun50i-h616-t95-axp313.dts
> > >  create mode 100644 configs/t95_axp313_defconfig
> > >
> > > diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> > > index b102ffb5f6..144daf6c48 100644
> > > --- a/arch/arm/dts/Makefile
> > > +++ b/arch/arm/dts/Makefile
> > > @@ -842,7 +842,8 @@ dtb-$(CONFIG_MACH_SUN50I_H616) +=3D \
> > >       sun50i-h618-orangepi-zero2w.dtb \
> > >       sun50i-h618-orangepi-zero3.dtb \
> > >       sun50i-h618-transpeed-8k618-t.dtb \
> > > -     sun50i-h616-x96-mate.dtb
> > > +     sun50i-h616-x96-mate.dtb \
> > > +     sun50i-h616-t95-axp313.dtb
> > >  dtb-$(CONFIG_MACH_SUN50I) +=3D \
> > >       sun50i-a64-amarula-relic.dtb \
> > >       sun50i-a64-bananapi-m64.dtb \
> > > diff --git a/arch/arm/dts/sun50i-h616-t95-axp313.dts b/arch/arm/dts/s=
un50i-h616-t95-axp313.dts
> > > new file mode 100644
> > > index 0000000000..b006f363d5
> > > --- /dev/null
> > > +++ b/arch/arm/dts/sun50i-h616-t95-axp313.dts
> > > @@ -0,0 +1,148 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +/*
> > > + * Copyright (C) 2021 Arm Ltd.
> >
> > Please change this copyright you and this year.
> >
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "sun50i-h616.dtsi"
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +
> > > +/ {
> > > +     model =3D "T95 (AXP313)";
> > > +     compatible =3D "mbox,t95-axp313", "allwinner,sun50i-h616";
> >
> > What is "mbox"? Do you have any more information about this vendor?
> > In any case a new vendor would need to be added to
> > Documentation/devicetree/bindings/vendor-prefixes.yaml, in a separate
> > patch. Also you need a patch to add this compatible combination to
> > Documentation/devicetree/bindings/arm/sunxi.yaml.
> >
> > Cheers,
> > Andre
> >
> > > +
> > > +     aliases {
> > > +             serial0 =3D &uart0;
> > > +     };
> > > +
> > > +     chosen {
> > > +             stdout-path =3D "serial0:115200n8";
> > > +     };
> > > +
> > > +     reg_vcc5v: vcc5v {
> > > +             /* board wide 5V supply directly from the DC input */
> > > +             compatible =3D "regulator-fixed";
> > > +             regulator-name =3D "vcc-5v";
> > > +             regulator-min-microvolt =3D <5000000>;
> > > +             regulator-max-microvolt =3D <5000000>;
> > > +             regulator-always-on;
> > > +     };
> > > +};
> > > +
> > > +&ehci0 {
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&ehci2 {
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&ir {
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&mmc0 {
> > > +     cd-gpios =3D <&pio 8 16 GPIO_ACTIVE_LOW>; /* PI16 */
> > > +     vmmc-supply =3D <&reg_dldo1>;
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&mmc2 {
> > > +     vmmc-supply =3D <&reg_dldo1>;
> > > +     vqmmc-supply =3D <&reg_aldo1>;
> > > +     bus-width =3D <8>;
> > > +     non-removable;
> > > +     cap-mmc-hw-reset;
> > > +     mmc-ddr-1_8v;
> > > +     mmc-hs200-1_8v;
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&ohci0 {
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&ohci2 {
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&r_i2c {
> > > +     status =3D "okay";
> > > +
> > > +     axp313: pmic@36 {
> > > +             compatible =3D "x-powers,axp313a";
> > > +             reg =3D <0x36>;
> > > +             #interrupt-cells =3D <1>;
> > > +             interrupt-controller;
> > > +             interrupt-parent =3D <&pio>;
> > > +             interrupts =3D <2 9 IRQ_TYPE_LEVEL_LOW>;  /* PC9 */
> > > +
> > > +             vin1-supply =3D <&reg_vcc5v>;
> > > +             vin2-supply =3D <&reg_vcc5v>;
> > > +             vin3-supply =3D <&reg_vcc5v>;
> > > +
> > > +             regulators {
> > > +                     /* Supplies VCC-PLL, so needs to be always on. =
*/
> > > +                     reg_aldo1: aldo1 {
> > > +                             regulator-always-on;
> > > +                             regulator-min-microvolt =3D <1800000>;
> > > +                             regulator-max-microvolt =3D <1800000>;
> > > +                             regulator-name =3D "vcc1v8";
> > > +                     };
> > > +
> > > +                     /* Supplies VCC-IO, so needs to be always on. *=
/
> > > +                     reg_dldo1: dldo1 {
> > > +                             regulator-always-on;
> > > +                             regulator-min-microvolt =3D <3300000>;
> > > +                             regulator-max-microvolt =3D <3300000>;
> > > +                             regulator-name =3D "vcc3v3";
> > > +                     };
> > > +
> > > +                     reg_dcdc1: dcdc1 {
> > > +                             regulator-always-on;
> > > +                             regulator-min-microvolt =3D <810000>;
> > > +                             regulator-max-microvolt =3D <990000>;
> > > +                             regulator-name =3D "vdd-gpu-sys";
> > > +                     };
> > > +
> > > +                     reg_dcdc2: dcdc2 {
> > > +                             regulator-always-on;
> > > +                             regulator-min-microvolt =3D <810000>;
> > > +                             regulator-max-microvolt =3D <1100000>;
> > > +                             regulator-name =3D "vdd-cpu";
> > > +                     };
> > > +
> > > +                     reg_dcdc3: dcdc3 {
> > > +                             regulator-always-on;
> > > +                             regulator-min-microvolt =3D <1360000>;
> > > +                             regulator-max-microvolt =3D <1360000>;
> > > +                             regulator-name =3D "vdd-dram";
> > > +                     };
> > > +             };
> > > +     };
> > > +};
> > > +
> > > +&pio {
> > > +     vcc-pc-supply =3D <&reg_aldo1>;
> > > +     vcc-pg-supply =3D <&reg_dldo1>;
> > > +     vcc-ph-supply =3D <&reg_dldo1>;
> > > +     vcc-pi-supply =3D <&reg_dldo1>;
> > > +};
> > > +
> > > +&uart0 {
> > > +     pinctrl-names =3D "default";
> > > +     pinctrl-0 =3D <&uart0_ph_pins>;
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&usbotg {
> > > +     dr_mode =3D "host";       /* USB A type receptable */
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&usbphy {
> > > +     status =3D "okay";
> > > +};
> > > diff --git a/configs/t95_axp313_defconfig b/configs/t95_axp313_defcon=
fig
> > > new file mode 100644
> > > index 0000000000..6542b5bc88
> > > --- /dev/null
> > > +++ b/configs/t95_axp313_defconfig
> > > @@ -0,0 +1,27 @@
> > > +CONFIG_ARM=3Dy
> > > +CONFIG_ARCH_SUNXI=3Dy
> > > +CONFIG_DEFAULT_DEVICE_TREE=3D"sun50i-h616-t95-axp313"
> > > +CONFIG_SPL=3Dy
> > > +CONFIG_MACH_SUN50I_H616=3Dy
> > > +CONFIG_DRAM_CLK=3D648
> > > +CONFIG_DRAM_SUN50I_H616_ODT_EN=3D0x1
> > > +CONFIG_DRAM_SUN50I_H616_DX_ODT=3D0x03030303
> > > +CONFIG_DRAM_SUN50I_H616_DX_DRI=3D0x0e0e0e0e
> > > +CONFIG_DRAM_SUN50I_H616_CA_DRI=3D0x1c1c
> > > +CONFIG_DRAM_SUN50I_H616_TPR10=3D0x2f0006
> > > +CONFIG_DRAM_SUN50I_H616_TPR11=3D0xffffdddd
> > > +CONFIG_DRAM_SUN50I_H616_TPR12=3D0xfedf7657
> > > +CONFIG_SUNXI_DRAM_H616_DDR3_1333=3Dy
> > > +CONFIG_R_I2C_ENABLE=3Dy
> > > +CONFIG_SPL_I2C=3Dy
> > > +CONFIG_SPL_SYS_I2C_LEGACY=3Dy
> > > +CONFIG_SYS_I2C_MVTWSI=3Dy
> > > +CONFIG_SYS_I2C_SLAVE=3D0x7f
> > > +CONFIG_SYS_I2C_SPEED=3D400000
> > > +CONFIG_SUPPORT_EMMC_BOOT=3Dy
> > > +CONFIG_AXP313_POWER=3Dy
> > > +CONFIG_AXP_DCDC3_VOLT=3D1360
> > > +CONFIG_USB_EHCI_HCD=3Dy
> > > +CONFIG_USB_OHCI_HCD=3Dy
> > > +CONFIG_SUN8I_EMAC=3Dy
> > > +CONFIG_SPL_IMAGE_TYPE_SUNXI_TOC0=3Dy
> >
>
>
> --
> Kamil Kasperski
>
