Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59C73E4C7D
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781357377; cv=pass; b=jkaJV1g6z7qUozorukBD5obpWZQUvq043XQs15oMPc/6IWeI4V/fmQEf1kqaoJq0MKGwRgAV/VSHeUJ2B8jIjuRNf//qGQIqqAKKkSDBKssqlEb/LdQOyEqNgDY03Zrrb4pngjYevT/yAn35xzJIu+CZPMIriVmiVZDMB9SM9m4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781357377; c=relaxed/simple;
	bh=wsQQihnWIaC9bVsScBSqsXKP42m3O6jphB6W8rtbIis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGQrlYN93VxKUdM8Q/v49Lrq3Yxu1ycWeIo36TMKSDlUahjaOrwYmZEuJuRmub8/JDFzKN9MSQTveYfCE7AB2LcYjcLc2x3G9NPeOFHU3oTJSIW+oZM22mHoTPV3HGolikOGmXcaKT3YJevZVxdF1RzikzxFFQcb0EkhXlVlKSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kc6g/lh6; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kc6g/lh6"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c3543590so13065855ad.2
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 06:29:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781357374; cv=none;
        d=google.com; s=arc-20240605;
        b=NdIWsdNZiSDwdvlqiCVvPtCMw37UxS7LO8mkBnkcANgAiVa52LcgiQKC3M8rf71g/c
         RWD68CYOdj26BG/BZeyqdaqW8MxbBh6kop11lSuNIPVWYcg0mAZ7TXxDNlrAlr/OAy+6
         qbthRAjNjoEV4am44V5AAiBzj7fJI2NkVxXPcL6z9myg+mHDrZVSrGbByMt4I5b6ej0D
         rERDmnSX1kt1f29S2drWBq3svF8Qi9+zYvk+YHYViW79po1Q4lJdu7rsfzfgtgJMhsyP
         ld401YFlDM5mFhXO8ucg5fgEwgKr/gcU7LdjaUmx/0AhLAwhEdsA0yU5bI7JswKUeiy7
         mxpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kUReiSsThHaQ8ouVdRpvuZtdgMCKvSl0l2ZSq4rDSXY=;
        fh=WOBIcyFPFKUcmwBrXpw9A9ndsZ1yalpQysT7ZXsBu+M=;
        b=NWoHRQhsdSmi2o77qLObxdfs6Vkqt0OnOoF+WxaklsGJvfg3FGOI8pYzpbxcyLknAm
         fNdRlRDb+Rc7esHgrblOSMb29xiE6Rfx+uRp3pJ6PQ5cHiqKvWksgrPYCGbBI7QFUadi
         sWcyUDUSqb40tlIDTu7QMp6dj2jULyLWGpm0gLgeiI7+Ts9RQAYWwHj7wfVlkc7o/f7M
         Cxrx01CvNFgAo38Vx9wt6pcKUVjjn0hijRZnLir4mPvAx0b5j3uzSth6KbLQaIb6GSFJ
         QJr82wcZwwKRk5p1QwrEhhpImhFzVZGHYPtWHp6YC3DfYDbd33TwhKp3DPW+725Wk9As
         xQNQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781357374; x=1781962174; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUReiSsThHaQ8ouVdRpvuZtdgMCKvSl0l2ZSq4rDSXY=;
        b=Kc6g/lh6AxmQWI1TrDxv0ldWbkMcWwCsxM0/3HurUV3N4vMnRZ9J7AtePjZhjLdyTU
         VhbMBR6RBCSdbK/OwkL2f9y3XZYsbSOWYeTo9RFgbKdbkwcDled4yY2X+WeR2v4tOBqv
         9TSda5E/kotQIt6n1YcxNeRfVOjf7tV56xSK6swPY/SqWWmZ8VcOi0kCtmJ7tqgWHLyM
         X5xKsJlBAyDXox6xF1zGFwzspnC+cZqcYOkrhsZ8rWHDeBGqbpx3L18yMWBVZhc3GtgF
         fw/dclyjbw63QXiCohFNEvgHnB/Gv1QEIE3NOyB70dJHd3sUHZNXUs2rY3kHiMvVZPvQ
         Fs/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781357374; x=1781962174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kUReiSsThHaQ8ouVdRpvuZtdgMCKvSl0l2ZSq4rDSXY=;
        b=SVyN4oMcwWIeeP3wzQZaUfdGf1Oh4Nfs/uaSMhZXIFj7AuUrELNHQMCCuqS0OfpBr3
         Pc6ImpgBt5SKOWit7v/61qVUPz3Vg4K5G8pTvHQkS66vAZ6w6cSlwXTy2aV4MtWjRf5d
         +dwdkEXUvaSMbVpaONJ6IqFutY5uVSIHw8GZkoKRwMdCp/9KyYpOx5pZA6RwyQQ3cBHG
         Lz/pl6s5uf0NsduMEQDg4RXcui7lXhpCMKsxbkirM2geYLQrEKIBS5cFl7JSMP71g1Tb
         A0FOR3VyadZF9JPRdWgj3joiQwzTdsZHfMf6wj14/0USPFanMQtCRCUa+DrIF2kE3Ee9
         wIYw==
X-Forwarded-Encrypted: i=1; AFNElJ/1aStN9lAtGjGOWAK36BsjcdgGbcK/Ni/IgOZju3WRHJgXeCnvi0AJxqvO1OBHumsgvtHzmnjDehf83g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmuunQVJmg/yiTYyZ3QWrUypDLl53mpNag+IOkcspbQGuFnzS4
	dgPH3J3bk90BnCWaT8ikr75N0Iu3NvE0BhOUZCk9eHCJxIsQ2jX6HHE0PnrqJ/tgOnxsl0DmOtz
	611bPzyMrmR2HV1UrBlT9QPDFsE7Uva0=
X-Gm-Gg: Acq92OG/W7BjT46A+A7GQgkCWi/2OIcEhmIz08dGmv5rIUev+qNNEczLmXDAEDkIVc7
	BOukyDuHHcQHMJSc+PGGgXAHq+pPcND71ze/wa0P8Ck9PreGIToQ9r5t9dyRgcpnRM695T7pdV5
	49mvWSu5vNbnKTawi1nyqBO0M5sQg7UDpk9A92Ij6HAIxaBusgkPHE6F/v3ULHknL7OcquMFrWC
	AYa4fA2mJUEBj08hD84pJOiDVA75NaSk+Q7KiRBiixef21SN0gW8b8ad04Vv54z2Tqez3/yw3eC
	SkaZ
X-Received: by 2002:a17:902:e80a:b0:2c3:bab9:4961 with SMTP id
 d9443c01a7336-2c413eb775cmr83686445ad.34.1781357373928; Sat, 13 Jun 2026
 06:29:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
 <20260613-a733-dts-v1-public-ready-v1-4-7787c94681db@gmail.com> <yDDIdJcZRCmL2YwI2Wv_ng@gmail.com>
In-Reply-To: <yDDIdJcZRCmL2YwI2Wv_ng@gmail.com>
From: Enzo <enzo.adriano.code@gmail.com>
Date: Sat, 13 Jun 2026 09:29:22 -0400
X-Gm-Features: AVVi8CdCVOnyKliNLOkMVxlnWD8AwCxre4GYBDVtf8SuvuvseqhhiKAPW8eLEzc
Message-ID: <CAHWUu5HKy6g5aFbrriBz1cC7dQkss7x5pTBQ1qXe2NA=H2aejw@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: allwinner: add Radxa Cubie A7S
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jernej,

Thanks for taking a look.

> Besides sashiko bot comments, these pins should go to main A733 DTSI,
> like it's done for other SoCs.
>
> In any case, it's a bit early for DT. At least clocks should land before.

Agreed on both points. I'll move the UART0 pin definition into the main
A733 DTSI for the next revision, following the other Allwinner SoCs.

I will also hold off on sending a v2 until the A733 clock prerequisites
are in a better state, unless maintainers prefer a different ordering.
For now I'll keep this series as a checkpoint and continue tracking/testing
the RTC, clock and pinctrl prerequisite work.

Best regards,
Enzo

On Sat, Jun 13, 2026 at 7:37=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne sobota, 13. junij 2026 ob 11:42:16 Srednjeevropski poletni =C4=8Das j=
e Enzo Adriano via B4 Relay napisal(a):
> > From: Enzo Adriano <enzo.adriano.code@gmail.com>
> >
> > Add the Radxa Cubie A7S board description with serial console and SD ca=
rd
> > boot support.
> >
> > Ethernet remains disabled until the GMAC210 wrapper, clocks, resets,
> > MDIO, PHY reset, PHY power, and link behavior are proven.
> >
> > Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/Makefile             |  1 +
> >  .../boot/dts/allwinner/sun60i-a733-cubie-a7s.dts   | 48 ++++++++++++++=
++++++++
> >  2 files changed, 49 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/d=
ts/allwinner/Makefile
> > index d116864b6c2b..824cc35152db 100644
> > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > @@ -56,6 +56,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg=
35xx-2024.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-h.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-plus.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-sp.dtb
> > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun60i-a733-cubie-a7s.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-a527-cubie-a5e.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-h728-x96qpro+.dtb
> >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun55i-t527-avaota-a1.dtb
> > diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts b/=
arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> > new file mode 100644
> > index 000000000000..453761a96323
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
> > @@ -0,0 +1,48 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include "sun60i-a733.dtsi"
> > +
> > +/ {
> > +     model =3D "Radxa Cubie A7S";
> > +     compatible =3D "radxa,cubie-a7s", "allwinner,sun60i-a733";
> > +
> > +     aliases {
> > +             serial0 =3D &uart0;
> > +             mmc0 =3D &mmc0;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
> > +
> > +     reg_vcc3v3: vcc3v3 {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "vcc-3v3";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-always-on;
> > +     };
> > +};
> > +
> > +&mmc0 {
> > +     vmmc-supply =3D <&reg_vcc3v3>;
> > +     bus-width =3D <4>;
> > +     no-mmc;
> > +     no-sdio;
> > +     status =3D "okay";
> > +};
> > +
> > +&pio {
> > +     uart0_pb9_pb10_pins: uart0-pb9-pb10-pins {
> > +             pins =3D "PB9", "PB10";
> > +             function =3D "uart0";
> > +     };
>
> Besides sashiko bot comments, these pins should go to main A733 DTSI,
> like it's done for other SoCs.
>
> In any case, it's a bit early for DT. At least clocks should land before.
>
> Best regards,
> Jernej
>
> > +};
> > +
> > +&uart0 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&uart0_pb9_pb10_pins>;
> > +     status =3D "okay";
> > +};
> >
> >
>
>
>
>
