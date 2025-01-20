Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0A7BE65
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jan 2025 16:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737390617; cv=none; b=qOUHn2MNuMfsNufOaATEO0y2qpvMX0E2cDD9wxYmlwChrv3Qplh+SW4naHgwYz0X2CLDM5/LW0wu1r6u2x7XuyqtIMXuXq193SvrMh0sKBeuyqY1m7IbEOUBNnm8dwuxV55P98+iqBJtYsmMLWWEqjFAOj8nb5I81VEXZ5pcj8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737390617; c=relaxed/simple;
	bh=xvrY3vSpaamhWq0x7fqFckHOOrmCliKL357lD1ZE9Hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pL8VRo1+3N3j/jh3SjyPsKOyslc6REgGd8DEjTmF/AVi4G1UYMc8bDhHtAytbQv9Nq1CDnho48Z2i7x19/5xtqaCwygmi9Y1oREsA1GpQNj8vOeTDTlZLMtDEBHJFuVIBMCbj2aApuMzstSoKtw1P3C3aGW8RVEgqph+0dDg09k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VX1+WktK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VX1+WktK"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4361f796586so51519015e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jan 2025 08:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737390614; x=1737995414; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7byeOWj8mqd5liuAk8fmYt6myD3Cdui8rxJFtzetURM=;
        b=VX1+WktKLZ7WS4m6R8a0QIU9VVVrBpdC8vXc3sYSCe1O+Jymm1De5L+7QXdcK5Ytho
         zm/+aZpGRry3paeKg2CEQUTql+wYA84kx1wHY+OpYOm8z6y7fb3TmRcsFZRQx+Qon5Gw
         iKjPLzHjaprLUmRSgypyX6FMr2rZ16FZdcFqWyVG/B53bsoebT6YVKCR/r1qk2BXlL1I
         6vKwpqAXC85+6YYnIwrXf8naMut/A1eaht3/yrM25c4F6pSoz6oBwPjnpNUs68bamZ+P
         0WoHiELH1/HAJGzrICLddmKmoFPm9OpyMAcUbvGWeY0vsGJAQoDKOxqfpx/9jEHZlxP0
         FlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737390614; x=1737995414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7byeOWj8mqd5liuAk8fmYt6myD3Cdui8rxJFtzetURM=;
        b=vkngd8uPH8NhQ1xXJgVBLvTHKsEL8BRFp7e2KLYSZe7cE0o+eOH+kkrTGs18m6p+Ro
         /gVjj3UYIQT/obCKHoLDeEKUjPG/G32JUPdb2iqjJcUeI0kdyjXVND2E/5b92EihgfKu
         POy5/79rx4cj993XkRdj0n7woRRRC5ITIlo3jX1Ovd5Jw9bRKCK22G6h6rZgTTE9xAvs
         PfWtEKtZU69PON3h8XG4hrBhoY3xovR4qTYPGf5oLdVBZNKqvWZNmg2rx+1Y6L1QkoYv
         Dj7c/NnsA97tApdUjl06I7mohObmfefwQQ5LfONRmEGW9wQkiWhjf1ft0nHkBq90b4P5
         E+fg==
X-Forwarded-Encrypted: i=1; AJvYcCXEdi7YZTlP5rE4uEjOcryReq/e6oEEFYYRLGVp1+3G630W64A93m37bp3fLwe7s4IMXfXc4My3ZUisAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf6xhZq265/s1VrlaKWqRno5+8UK+bBOJCQtIxP3hl4+ujAwYu
	/bLvhlRgRvI8pQRIeetFlLVHYzekOryTl+QnvBqeuoxxyscd9Ykf
X-Gm-Gg: ASbGncuMcWrYMv1G8rVh339ZRwTifciwJStwq4UHbMoyJdatT0haGD25zpx/GbTwAHq
	J8TSatN/dT4w0JeGrRgEN563kjqt+GUGBU/LVdQB9NWLDSxgw1DTFn+sL4qnbGs1jpyrKqNY1IS
	aOLayfbWep6K0r2PzDUYrxrr6exvSAO2vPJTPJxposeH0E09wDDEVR7tB5IbUB5e8sVQWJ+WhC6
	rPk6AOslcIH1oywDX8VY9A9UIO0862E9x4bntaB03XHeOI49TMjYaaKA/knQC3Ij9nywJ2hGD4v
	mhFWyxvR5E7jJ9T2sggCphg+yY/Sdprox+8bdVk+TM0V3w==
X-Google-Smtp-Source: AGHT+IGYlwOfQTBmDV9p0BTI1YjPdzsF6tv3D14qBA8AJNB484oglkq19CNbBVhbNQMaMaUHsie6dQ==
X-Received: by 2002:a05:600c:3548:b0:434:a1d3:a321 with SMTP id 5b1f17b1804b1-438913c6150mr127787055e9.3.1737390613990;
        Mon, 20 Jan 2025 08:30:13 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389046bab0sm143119205e9.38.2025.01.20.08.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 08:30:13 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, Sumit Garg <sumit.garg@linaro.org>,
 linux-sunxi@lists.linux.dev, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH 1/3] suniv: switch Allwinner F1Cx00 boards to OF_UPSTREAM
Date: Mon, 20 Jan 2025 17:30:12 +0100
Message-ID: <2763817.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20250119234219.1773070e@minigeek.lan>
References:
 <20250119164157.23648-1-andre.przywara@arm.com>
 <5850974.DvuYhMxLoT@jernej-laptop> <20250119234219.1773070e@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. januar 2025 ob 00:42:19 Srednjeevropski standardni =C4=
=8Das je Andre Przywara napisal(a):
> On Sun, 19 Jan 2025 20:45:43 +0100
> Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
>=20
> Hi Jernej,
>=20
> > Dne nedelja, 19. januar 2025 ob 17:41:54 Srednjeevropski standardni =C4=
=8Das je Andre Przywara napisal(a):
> > > In contrast to some other Allwinner SoCs, there is no difference betw=
een
> > > the DTs for the Allwinner F1C100/F1C200 SoCs (sunvi) between the U-Bo=
ot
> > > and the Linux kernel repository.
> > >=20
> > > Remove the old copies of the F1Cx00 related .dts and .dtsi files, and
> > > switch the whole suniv SoC over to use OF_UPSTREAM.
> > >=20
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  arch/arm/dts/Makefile                        |   2 -
> > >  arch/arm/dts/suniv-f1c100s-licheepi-nano.dts |  73 ----
> > >  arch/arm/dts/suniv-f1c100s.dtsi              | 330 -----------------=
=2D-
> > >  arch/arm/dts/suniv-f1c200s-lctech-pi.dts     |  76 -----
> > >  arch/arm/dts/suniv-f1c200s-popstick-v1.1.dts |  81 -----
> > >  arch/arm/mach-sunxi/Kconfig                  |   1 +
> > >  configs/lctech_pi_f1c200s_defconfig          |   2 +-
> > >  configs/licheepi_nano_defconfig              |   2 +-
> > >  8 files changed, 3 insertions(+), 564 deletions(-)
> > >  delete mode 100644 arch/arm/dts/suniv-f1c100s-licheepi-nano.dts
> > >  delete mode 100644 arch/arm/dts/suniv-f1c100s.dtsi
> > >  delete mode 100644 arch/arm/dts/suniv-f1c200s-lctech-pi.dts
> > >  delete mode 100644 arch/arm/dts/suniv-f1c200s-popstick-v1.1.dts
> > >=20
> > > diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> > > index aef0425c967..5627daa94db 100644
> > > --- a/arch/arm/dts/Makefile
> > > +++ b/arch/arm/dts/Makefile
> > > @@ -530,8 +530,6 @@ dtb-$(CONFIG_STM32H7) +=3D stm32h743i-disco.dtb \
> > >  	stm32h743i-eval.dtb \
> > >  	stm32h750i-art-pi.dtb
> > > =20
> > > -dtb-$(CONFIG_MACH_SUNIV) +=3D \
> > > -	suniv-f1c100s-licheepi-nano.dtb
> > >  dtb-$(CONFIG_MACH_SUN4I) +=3D \
> > >  	sun4i-a10-a1000.dtb \
> > >  	sun4i-a10-ba10-tvbox.dtb \
>=20
>=20
> > > diff --git a/arch/arm/dts/suniv-f1c100s-licheepi-nano.dts b/arch/arm/=
dts/suniv-f1c100s-licheepi-nano.dts
> > > deleted file mode 100644
> > > index 43896723a99..00000000000
> > > --- a/arch/arm/dts/suniv-f1c100s-licheepi-nano.dts
> > > +++ /dev/null
>=20
>  ....
>=20
> > > diff --git a/arch/arm/dts/suniv-f1c100s.dtsi b/arch/arm/dts/suniv-f1c=
100s.dtsi
> > > deleted file mode 100644
> > > index 3c61d59ab5f..00000000000
> > > --- a/arch/arm/dts/suniv-f1c100s.dtsi
> > > +++ /dev/null
>=20
> ...
>=20
> > > diff --git a/arch/arm/dts/suniv-f1c200s-lctech-pi.dts b/arch/arm/dts/=
suniv-f1c200s-lctech-pi.dts
> > > deleted file mode 100644
> > > index 2d2a3f026df..00000000000
> > > --- a/arch/arm/dts/suniv-f1c200s-lctech-pi.dts
> > > +++ /dev/null
>=20
> ...
>=20
> > > diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> > > index 8065161e61e..866b55833c0 100644
> > > --- a/arch/arm/mach-sunxi/Kconfig
> > > +++ b/arch/arm/mach-sunxi/Kconfig
> > > @@ -279,6 +279,7 @@ config MACH_SUNIV
> > >  	select SUPPORT_SPL
> > >  	select SKIP_LOWLEVEL_INIT_ONLY
> > >  	select SPL_SKIP_LOWLEVEL_INIT_ONLY
> > > +	imply OF_UPSTREAM
> > > =20
> > >  config MACH_SUN4I
> > >  	bool "sun4i (Allwinner A10)"
> > > diff --git a/configs/lctech_pi_f1c200s_defconfig b/configs/lctech_pi_=
f1c200s_defconfig
> > > index e1e8d3aaaa3..1588b3b4955 100644
> > > --- a/configs/lctech_pi_f1c200s_defconfig
> > > +++ b/configs/lctech_pi_f1c200s_defconfig
> > > @@ -1,6 +1,6 @@
> > >  CONFIG_ARM=3Dy
> > >  CONFIG_ARCH_SUNXI=3Dy
> > > -CONFIG_DEFAULT_DEVICE_TREE=3D"suniv-f1c200s-lctech-pi"
> > > +CONFIG_DEFAULT_DEVICE_TREE=3D"allwinner/suniv-f1c200s-lctech-pi" =20
> >=20
> > What's with this board? I don't see it being removed from Makefile. If =
it
> > is not there, then this board has been broken all along?
>=20
> No, all defconfigs build fine, that's tested with CI on every PR merged.
>=20
> As it turns out, the build system builds the DTs as listed in the
> CONFIG_DEFAULT_DEVICE_TREE variable, but also in CONFIG_OF_LIST
> automatically, so those lists in the Makefile are actually somewhat
> redundant. I am not entirely sure if there are corner case when they
> are needed, though, but even removing the whole Makefile stanza for
> A64, for instance, builds those boards fine.
>=20
> So the LCTech Pi build is fine, both with and without this patch.

Thanks for explanation. This is then:

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>=20
> Thanks,
> Andre
>=20
> >=20
> > Best regards,
> > Jernej
> >=20
> > >  CONFIG_SPL=3Dy
> > >  CONFIG_MACH_SUNIV=3Dy
> > >  CONFIG_DRAM_CLK=3D156
> > > diff --git a/configs/licheepi_nano_defconfig b/configs/licheepi_nano_=
defconfig
> > > index d59affb0d9c..051b1901f20 100644
> > > --- a/configs/licheepi_nano_defconfig
> > > +++ b/configs/licheepi_nano_defconfig
> > > @@ -1,6 +1,6 @@
> > >  CONFIG_ARM=3Dy
> > >  CONFIG_ARCH_SUNXI=3Dy
> > > -CONFIG_DEFAULT_DEVICE_TREE=3D"suniv-f1c100s-licheepi-nano"
> > > +CONFIG_DEFAULT_DEVICE_TREE=3D"allwinner/suniv-f1c100s-licheepi-nano"
> > >  CONFIG_SPL=3Dy
> > >  CONFIG_MACH_SUNIV=3Dy
> > >  CONFIG_DRAM_CLK=3D156
> > >  =20
> >=20
> >=20
> >=20
> >=20
> >=20
>=20
>=20




