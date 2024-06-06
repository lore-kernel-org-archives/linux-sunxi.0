Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07795195962
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Jun 2024 11:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717675107; cv=none; b=dI9XRYYPlsWpf8Ho9CIlYT8GrJgAKnSET96hCKLdzJCZhiQpCrqxn1NDS/zT2N0A1MVf2CsQ39l2CAKXXN5l9Y7eUy7POsDdpc5SleXG4Rg277hiEf10t/jP7JXu+WIJtWo4v5GCB37Mbtjyx05z4BgdOOARTTbf49n5v6ZmXBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717675107; c=relaxed/simple;
	bh=nf+ofmyMLWYDTkVvOL+9C9PTvLvmHhNpkOborD2gGdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=flbM8dzoorUOyWghM8D9RbH/P8kvcXux8tCGHFtmbR7XuEdZu3XZnQbGTl7/UnPZXmgn/cizAlAopV3XgWBaMOBc+eHCpFljy8lrUSV3jmU7bglEP8GCtMOXyO+VuFaELTcuf50C5iDcjVxEAV0ZOlowKKlbY+D5MMupeKMQ+u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52b912198f1so1248996e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Jun 2024 04:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717675101; x=1718279901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=73iLzuwWmNVIS6f4YlvN7EED2M3fqtGZJWg3XQkmNAc=;
        b=nG01i9RiPahKoTO0GU3J91vXps60D3NBIhyZl7Ap0un1mW6iJ6+TZMA+EP6p3GSfUp
         0DwQqCxKVFrr2G84WKyT9nQVRxwtSeedrLrQo+Aoxo69kxAYHfSfYfTviye9aoD3XGIk
         Znxfum5+vOM3E4QllRdjnD90DTp0vx8pzRim/754sOmX7yUgaHmxLrLDqJkFCzTUXaLb
         s4h6FGqfHPkowleGuZQcq8hHcXSq6pbcUfSgSr3gkchEZUyLtcDtTkIO29BhsGOiXT/4
         EHmRZzTaU9yKA2/OnWUjHy4o05012G2XyKgSGY2wI118xkXwVNcHH1pLCZ15VtHE6ytP
         /QXg==
X-Gm-Message-State: AOJu0YyQX16YAuSsfQRh8CLDd1xQ9xP+tBIi5SQMlXyNTnY3ty/cTJTt
	Cvw5W07o7pqIO1VV0uLMhmEti5ViKs5qYkkKk/IHFijeNsKX54/HuJ34XQBk
X-Google-Smtp-Source: AGHT+IGA6eBaLBHrscPrm1k9P6W8GiSu99KTaG9TBI1MHFLWXHUbw5qpbxV9rr/HAZwz68C0xUBkKg==
X-Received: by 2002:ac2:5544:0:b0:52b:60ed:3f0d with SMTP id 2adb3069b0e04-52bab50b0dcmr3165252e87.60.1717675100534;
        Thu, 06 Jun 2024 04:58:20 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb433c8e2sm175659e87.260.2024.06.06.04.58.20
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 04:58:20 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ead2c6b50bso6423691fa.0
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Jun 2024 04:58:20 -0700 (PDT)
X-Received: by 2002:a2e:854f:0:b0:2ea:b956:db16 with SMTP id
 38308e7fff4ca-2eac79ba896mr30087121fa.8.1717675100145; Thu, 06 Jun 2024
 04:58:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240605185339.266833-1-macroalpha82@gmail.com>
 <20240605185339.266833-3-macroalpha82@gmail.com> <20240606105159.33a2b917@donnerap.manchester.arm.com>
In-Reply-To: <20240606105159.33a2b917@donnerap.manchester.arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 6 Jun 2024 19:58:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v64uCCZSc0aY-gtcMNAhJAqDhb5=sPBJC=q0+nKwMO3f+A@mail.gmail.com>
Message-ID: <CAGb2v64uCCZSc0aY-gtcMNAhJAqDhb5=sPBJC=q0+nKwMO3f+A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h700: Add Anbernic RG35XX-SP
To: Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	mripard@kernel.org, ryan@testtoast.com, samuel@sholland.org, 
	jernej.skrabec@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 5:52=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Wed,  5 Jun 2024 13:53:39 -0500
> Chris Morgan <macroalpha82@gmail.com> wrote:
>
> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > The Anbernic RG35XXSP is almost identical to the RG35XX-Plus, but in a
> > clamshell form-factor. The key differences between the SP and the Plus
> > is a lid switch and an RTC on the same i2c bus as the PMIC.
> >
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile        |   3 +-
> >  .../sun50i-h700-anbernic-rg35xx-sp.dts        | 145 ++++++++++++++++++
> >  2 files changed, 147 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-=
rg35xx-sp.dts
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/d=
ts/allwinner/Makefile
> > index 0db7b60b49a1..00bed412ee31 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -49,5 +49,6 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-orangepi-ze=
ro2w.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-orangepi-zero3.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-transpeed-8k618-t.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-2024.dtb
> > -dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-plus.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-h.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-plus.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-sp.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-=
sp.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts
> > new file mode 100644
> > index 000000000000..a1d16b65ef5d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts
> > @@ -0,0 +1,145 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
> > + * Copyright (C) 2024 Chris Morgan <macroalpha82@gmail.com>.
> > + */
> > +
> > +#include <dt-bindings/input/gpio-keys.h>
> > +#include "sun50i-h700-anbernic-rg35xx-plus.dts"
> > +
> > +/ {
> > +     model =3D "Anbernic RG35XX SP";
> > +     compatible =3D "anbernic,rg35xx-sp", "allwinner,sun50i-h700";
> > +
> > +     gpio-keys-lid {
> > +             compatible =3D "gpio-keys";
> > +
> > +             lid-switch {
> > +                     label =3D "Lid Switch";
> > +                     gpios =3D <&pio 4 7 GPIO_ACTIVE_LOW>; /* PE7 */
> > +                     linux,can-disable;
> > +                     linux,code =3D <SW_LID>;
> > +                     linux,input-type =3D <EV_SW>;
> > +                     wakeup-event-action =3D <EV_ACT_DEASSERTED>;
> > +                     wakeup-source;
> > +             };
> > +     };
> > +};
> > +
> > +/delete-node/ &r_rsb;
>
> I don't think deleting the *RSB* node is right here, if at all, I'd expec=
t
> status=3D"disabled", and then maybe deleting the axp717 node within?
> Or maybe factor the AXP node out into a separate file, and include it fro=
m
> the -2024.dts and from this one?

Doesn't quite work because the unit address is different.

> Or move every board to I2C?

Doesn't this depend on the bootloader also running in RSB mode? My memory
is a bit foggy on this, but IIRC we did a conversion on some other boards
before?

> What do people think about this?

"disabled" in RSB node and deleting the axp717 node is probably the right
thing to do.


> Cheers,
> Andre
>
> > +
> > +&r_i2c {
> > +     pinctrl-0 =3D <&r_i2c_pins>;
> > +     pinctrl-names =3D "default";
> > +     status =3D "okay";
> > +
> > +     axp717: pmic@34 {
> > +             compatible =3D "x-powers,axp717";
> > +             reg =3D <0x34>;
> > +             interrupt-controller;
> > +             #interrupt-cells =3D <1>;
> > +             interrupt-parent =3D <&nmi_intc>;
> > +             interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +             vin1-supply =3D <&reg_vcc5v>;
> > +             vin2-supply =3D <&reg_vcc5v>;
> > +             vin3-supply =3D <&reg_vcc5v>;
> > +             vin4-supply =3D <&reg_vcc5v>;
> > +
> > +             regulators {
> > +                     reg_dcdc1: dcdc1 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <900000>;
> > +                             regulator-max-microvolt =3D <1100000>;
> > +                             regulator-name =3D "vdd-cpu";
> > +                     };
> > +
> > +                     reg_dcdc2: dcdc2 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <940000>;
> > +                             regulator-max-microvolt =3D <940000>;
> > +                             regulator-name =3D "vdd-gpu-sys";
> > +                     };
> > +
> > +                     reg_dcdc3: dcdc3 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <1100000>;
> > +                             regulator-max-microvolt =3D <1100000>;
> > +                             regulator-name =3D "vdd-dram";
> > +                     };
> > +
> > +                     reg_aldo1: aldo1 {
> > +                             /* 1.8v - unused */
> > +                     };

You can drop all the unused ones, unless you plan to include *this*
file from another one and use those nodes/labels.

ChenYu

> > +
> > +                     reg_aldo2: aldo2 {
> > +                             /* 1.8v - unused */
> > +                     };
> > +
> > +                     reg_aldo3: aldo3 {
> > +                             /* 1.8v - unused */
> > +                     };
> > +
> > +                     reg_aldo4: aldo4 {
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                             regulator-name =3D "vcc-pg";
> > +                     };
> > +
> > +                     reg_bldo1: bldo1 {
> > +                             /* 1.8v - unused */
> > +                     };
> > +
> > +                     reg_bldo2: bldo2 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <1800000>;
> > +                             regulator-max-microvolt =3D <1800000>;
> > +                             regulator-name =3D "vcc-pll";
> > +                     };
> > +
> > +                     reg_bldo3: bldo3 {
> > +                             /* 2.8v - unused */
> > +                     };
> > +
> > +                     reg_bldo4: bldo4 {
> > +                             /* 1.2v - unused */
> > +                     };
> > +
> > +                     reg_cldo1: cldo1 {
> > +                             /* 3.3v - audio codec - not yet implement=
ed */
> > +                     };
> > +
> > +                     reg_cldo2: cldo2 {
> > +                             /* 3.3v - unused */
> > +                     };
> > +
> > +                     reg_cldo3: cldo3 {
> > +                             regulator-always-on;
> > +                             regulator-min-microvolt =3D <3300000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-name =3D "vcc-io";
> > +                     };
> > +
> > +                     reg_cldo4: cldo4 {
> > +                             regulator-min-microvolt =3D <3300000>;
> > +                             regulator-max-microvolt =3D <3300000>;
> > +                             regulator-name =3D "vcc-wifi";
> > +                     };
> > +
> > +                     reg_boost: boost {
> > +                             regulator-min-microvolt =3D <5000000>;
> > +                             regulator-max-microvolt =3D <5200000>;
> > +                             regulator-name =3D "boost";
> > +                     };
> > +
> > +                     reg_cpusldo: cpusldo {
> > +                             /* unused */
> > +                     };
> > +             };
> > +     };
> > +
> > +     rtc_ext: rtc@51 {
> > +             compatible =3D "nxp,pcf8563";
> > +             reg =3D <0x51>;
> > +     };
> > +};
>
>
