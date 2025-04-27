Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6302F8821
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Apr 2025 04:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745728507; cv=none; b=sswE21rp1A6LihCxF4BeXOtERKukuVowhnYR+1GzcMs2t+CgkHknauw7N2vkMaJVWWkkzwcMZ55urN+vGM4CQb4cWbkfUEUL2hMYCmw2gzW9mzb/2Q98KJfYBuPkPLR5Bn0HyNZp/wB3DVuVXoTlaHYWEYiukkwoFem+pSDh5Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745728507; c=relaxed/simple;
	bh=niJetmjFjvODH5djwvO2RKVD87RTCl2iav6+ljuYbSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=azHXii84JRcZmZ5XKtUpWaCFb2ZM+8abOsy446ONYyHCxMn7DpeOZ8d3I7RYS71veFK3HbvNOvmiPNDgegjefb3BzABYwPL6x0wnHYzgtjDODRzElTL94I9SJjSR4sMYbMO8CxwteZl6JYaPJBnZZu+l2r6T61dvvYRyWN6L78g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bee278c2aso49303671fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Apr 2025 21:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745728503; x=1746333303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FD8jPvs02KS23S1dBkAfheuqo80D4A5rfCuAcGUoLwQ=;
        b=DcWfzj1mxpNq0pFr6Mtyb9NYPtw727lPW30XgCq9Z0mY7UeIKiTtnk/fD3RBaR2Sqk
         suTjUoVUxU7qs5Zkk10QLsqXdtQBXjJyt9lVkTeaNr7lz5//ezYSqo4hByxpwyubreiH
         H4eSdbTcV7WZhRzVTceCkzxu40lhcXym4UShR7wNfYirurPbnYPujwxlFLTzCoA+ZivP
         d+CM/6RJ7ty4miAxC5UvkhhtgbtF75GzkjmTWV7B+5wPeslv4otzC8TvuWjaHRI+kyik
         CtrMQhipaBS+eyg2P6FTAQ0pSFTtbKiI1DNCAxDC2Zpk08+UvwHpVdKO2W0NtvpGe7dy
         G0Dw==
X-Forwarded-Encrypted: i=1; AJvYcCU/RrYojT6kUGciny71nmHUBib88IQGWJfRGtGhP4RmIuKEeOzc1AfMdbmJlvdtILW6fxwQ3D6oR9ZxbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjYOhWe8z5hCgseE3yD/B8SiEefmjpkrcfD4MYR/kHzGmxkXWi
	1y0qVuxpC8IroBSNI/sq/dKuWsgewsb2IUrkkjYMxlPlFoPbitVprGmDw7bT
X-Gm-Gg: ASbGncsNnL8KX8qiAAES0uYgfieRFL5rsptCrLKBKoDesAQyfQtLjh5niystT/1iY+X
	sQmxyi+a+ZMXZJOo8teuqI3rXgexDt5/F/jEoi8E3U0XRO62xjsZ+K+BRP19V1e55imOaT7tdzU
	cC4rxF0kSy04tQxDzMH4PYun12Ecimn07VaJ3zQhoMCSMezib0egBWwfmdK24CuC0v6tiYaNsg+
	H9dKcLCwl/wemt+AATR4rhsehkrVw4whJRjsPeW38eUPsf6H6jsDQQv6g7BEwtlYy9jRdePKnVh
	+upkpie0ARbtu3LU3GEaNnHb+dYiIrAGbUYUyWfAdo9EOO8FfFyr0fzsiwbb/cSAQyJqfg==
X-Google-Smtp-Source: AGHT+IFzZL0UTcjbC9I2+tNyEkdbYpvY3Wl896voAfo7sxi55VQwkiOAhx80VSWFvVC1Ntb8EoXVmw==
X-Received: by 2002:a05:6512:31c8:b0:54b:117f:67a0 with SMTP id 2adb3069b0e04-54e7da0f17fmr3435706e87.28.1745728502380;
        Sat, 26 Apr 2025 21:35:02 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a8279sm15798381fa.71.2025.04.26.21.35.00
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 21:35:02 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b10956398so4127210e87.0
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Apr 2025 21:35:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwubdmFN/GdHOtZZ/WtUDrVAn62vYHI7GaNKwR7Y9SGv4zD0lGtcjax4KAX1Y2bxzen9vp1AZBXnfRLQ==@lists.linux.dev
X-Received: by 2002:a05:6512:1096:b0:54d:6b7f:affa with SMTP id
 2adb3069b0e04-54e7d516bcdmr3513368e87.1.1745728500749; Sat, 26 Apr 2025
 21:35:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250425003422.3465-1-andre.przywara@arm.com> <CAGb2v66vr_X3cB1g-On9opGQ7a4j1ASQyi4G=fqY07safrjfFw@mail.gmail.com>
In-Reply-To: <CAGb2v66vr_X3cB1g-On9opGQ7a4j1ASQyi4G=fqY07safrjfFw@mail.gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 27 Apr 2025 12:34:48 +0800
X-Gmail-Original-Message-ID: <CAGb2v67=aENryhsQ6VBPwPXskMvMDZpzzeHz2LTUt-VDMTyzGQ@mail.gmail.com>
X-Gm-Features: ATxdqUGbV0LE1Cv48ezG9-bXflmbhyYsf2OHMWQhXg4lsefW6u7-yQG0ryqUMlE
Message-ID: <CAGb2v67=aENryhsQ6VBPwPXskMvMDZpzzeHz2LTUt-VDMTyzGQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a523: fix SD card detect pull resistor
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 11:53=E2=80=AFAM Chen-Yu Tsai <wens@csie.org> wrote=
:
>
> On Fri, Apr 25, 2025 at 8:35=E2=80=AFAM Andre Przywara <andre.przywara@ar=
m.com> wrote:
> >
> > Trying to use the SD card on the Radxa board revealed that the card
> > detect wouldn't work as expected (insert not detected). Looking at the
> > schematic shows that the pull-up resistor is actually not populated
> > ("NC"), and the transistor just pulls the GPIO pin to GND, but it's
> > floating otherwise.
> > So using the pull-down flag is definitely wrong, we need the internal
> > pull up to get a reliable signal. The same is true for the Avaota board
> > (there is no transistor there, but it's floating in the same way). Ther=
e
> > is no schematic for the X96QPro+ board, but experiments show it's the
> > same behaviour.
> >
> > So change the GPIO flag for the card detect GPIO property to activate
> > the pull-up resistor for that pin.
> >
> > Fixes: 80e0fb4e491b ("arm64: dts: allwinner: a523: add Radxa A5E suppor=
t")
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> > Hi,
> >
> > please let me know if I should split this up into 3 patches, with prope=
r
> > Fixes: tags, or if you can maybe squash this into the original commits
> > still?
>
> I can squash them in if you prefer.

Fixes separated and squashed into the original patches.

ChenYu

> ChenYu
>
> > Cheers,
> > Andre
> >
> >  arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts | 2 +-
> >  arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts  | 2 +-
> >  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts b/=
arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> > index 03c9a9ef5adc2..2d2f3af91d05e 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
> > @@ -56,7 +56,7 @@ &ehci1 {
> >
> >  &mmc0 {
> >         vmmc-supply =3D <&reg_cldo3>;
> > -       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* =
PF6 */
> > +       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF=
6 */
> >         bus-width =3D <4>;
> >         status =3D "okay";
> >  };
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/a=
rch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> > index c0bce3f4fa925..59db103546f65 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> > @@ -56,7 +56,7 @@ &ehci1 {
> >
> >  &mmc0 {
> >         vmmc-supply =3D <&reg_vcc3v3>;
> > -       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* =
PF6 */
> > +       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF=
6 */
> >         bus-width =3D <4>;
> >         disable-wp;
> >         status =3D "okay";
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/=
arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> > index 85a546aecdbe1..dea2acc1849bb 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> > @@ -66,7 +66,7 @@ &ehci1 {
> >
> >  &mmc0 {
> >         vmmc-supply =3D <&reg_cldo3>;
> > -       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_DOWN)>; /* =
PF6 */
> > +       cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF=
6 */
> >         bus-width =3D <4>;
> >         status =3D "okay";
> >  };
> >
> > base-commit: 1e5a69d67d1b3c55c9b0cd3933af1436b5d52aa1
> > --
> > 2.46.3
> >
