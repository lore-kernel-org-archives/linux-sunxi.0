Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5460E13C9D9
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Jan 2025 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737643081; cv=none; b=KsNiGstkDS4SvEf2x6811lnfS/DRjS9EqiR5XNboOqbD/IJPOtUJu9N3cGsKi+aqgbenSggNBD3vrr23I40N9IyGKYmPUPfXzB1pAe76E1tTuFLkMpGFLWZgeJXPZQ390rIez8Ok/Ffd69xyc5vMftt8RPlcJVrDkDyZUCQ+Cy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737643081; c=relaxed/simple;
	bh=v4hf03EM6VfdMy5VTtB5nbJsptmv+uC2RJldvcUWlzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VdIIG8ROuqFuR89FT/mpE4D+CtwBNUwCGKtgBMDwQqMM0Mz4mpJr7EGyxA+tEaIRVLWymGeYkAbCrCNTlXFCDX/7DLaOK3u9JzsYMMsHJcmVHZkKPSRo+3TZfThIqnyQ38P95ghbWMzpok0G1CrfofRsF7XnLPLPqgMd1LRpC/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CWVnZ+1s; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CWVnZ+1s"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab2e308a99bso197353366b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 23 Jan 2025 06:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737643077; x=1738247877; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNJxby0fdzs+xbLUe+PsRRCOK2l4gyEDJNOl100PK4s=;
        b=CWVnZ+1sObv1yPFJbhEJOHGXIAlhrcVBP/RZqCIBdESIzb+1WgMyJN0GdUTYZ7wcz1
         IinhsxUHOJ4eozAPbcL+Vw8wOkSazmtuXHLxCdE1jz/u68VQHWPsNwf1qvJ9u+y5aFJp
         Ggq9tB/UiKEBb7Uj0bzVBTuuXtIr5CiEphILU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737643077; x=1738247877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNJxby0fdzs+xbLUe+PsRRCOK2l4gyEDJNOl100PK4s=;
        b=DX73T4HNcaJ9tbwnWhFZu/+6MN9v9yJOc73CyfBzMfdFkFZlVTz97QpzFUTxlt4Yyj
         kl6xJZY9o7aWq1M0pIxxytnKrAY6kADvUwRPd59PaR/Mo4qiA6KJTvgR2/C06dXde8IP
         GIFN0HD/fEHNc8FI5J59drOe31joddlG6lPHIepraY+4lPHGc2wGgSswWgzWYOYCQKDY
         D1GUTt5ReUd8PiCSdYfSWQgXpsE+OZoI4HzYkAsdxsdF317x8i95N2F+S8MtNgjzsqhc
         uznzsu5JkRmiWwtNx8VS5q+Kp387q0lt8l6dZxe5/+4W0lLVL8wRLcsiNKgGUuHdShWR
         /XUw==
X-Forwarded-Encrypted: i=1; AJvYcCUBd05Mf8GST6zX2W6tmEJCwwlvKgvwcsKMexpeM6dSVVEdq1JGKKvpqYudid0L/NJvVREaJf/RKij8zg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwYwsZ1rhSovC9PwVbv6I9sC96eKkOML6Neqz+LIop+gGllaUj
	P6g6a3QpmQ2d9WaMMvW29YpguoWMW5eCNxBFUQloQChk/j7oBWo+YgL4jn9Up4E45uw4qHt67D3
	/4KpQnI15IvgVkKOzKNzyXEkXkzIqxpMhHov5
X-Gm-Gg: ASbGncurZ7wEzhPYTux+/0IRJYrA7NJ1PEAYdFivBJvdglNOtInJLYZm19myugSmJIU
	L3+d0NXhNIc4mYyxMy6Q043+Gjh8bAnbGynrZ3PNQ3Us4w4BDshKtDikUySOhKog=
X-Google-Smtp-Source: AGHT+IFdk1f9qOov+yfq1lcd1/rMNC9Ck0JFjhXOdIsS6isQZYf+dUpplD+hsv3DKDoj9KgWVnq9SdxxVZKq3crJtUI=
X-Received: by 2002:a17:907:7f1f:b0:aab:a02c:764e with SMTP id
 a640c23a62f3a-ab6629c61c4mr311370866b.14.1737643077007; Thu, 23 Jan 2025
 06:37:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250117014537.22513-1-andre.przywara@arm.com>
 <2352334.ElGaqSPkdT@jernej-laptop> <20250119222530.1fd97018@minigeek.lan>
 <4622391.LvFx2qVVIh@jernej-laptop> <CAFLszTjDq4E05Q_esYA2tAGOYdhgbRp3B38gAsF0hX44Nf-34A@mail.gmail.com>
 <20250121000508.22db819a@minigeek.lan>
In-Reply-To: <20250121000508.22db819a@minigeek.lan>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 23 Jan 2025 07:37:37 -0700
X-Gm-Features: AbW1kvbsJlKKxvNpkzDdpPJMO_K3dpWam2d03x2L94NeiNAqJvL3guVXg4jgBo0
Message-ID: <CAFLszTg95xH08bVt_LnVO=Gu+dEQh1+vNAszxQv5a6Rdt3u8WA@mail.gmail.com>
Subject: Re: [PATCH 2/8] sunxi: pmic_bus: support alternative I2C address
To: Andre Przywara <andre.przywara@arm.com>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	u-boot@lists.denx.de, Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Tom Rini <trini@konsulko.com>, 
	Cody Eksal <masterr3c0rd@epochal.quest>, linux-sunxi@lists.linux.dev, 
	Parthiban <parthiban@linumiz.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

On Mon, 20 Jan 2025 at 17:06, Andre Przywara <andre.przywara@arm.com> wrote=
:
>
> On Mon, 20 Jan 2025 12:21:28 -0700
> Simon Glass <sjg@chromium.org> wrote:
>
> Hi Simon,
>
> > On Mon, 20 Jan 2025 at 09:42, Jernej =C5=A0krabec <jernej.skrabec@gmail=
.com> wrote:
> > >
> > > Dne nedelja, 19. januar 2025 ob 23:25:30 Srednjeevropski standardni =
=C4=8Das je Andre Przywara napisal(a):
> > > > On Sat, 18 Jan 2025 08:21:31 +0100
> > > > Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
> > > >
> > > > Hi Jernej,
> > > >
> > > > many thanks for the review and your opinion.
> > > >
> > > > > Dne petek, 17. januar 2025 ob 02:45:31 Srednjeevropski standardni=
 =C4=8Das je Andre Przywara napisal(a):
> > > > > > Some of the X-Power AXP PMICs can be ordered with an alternativ=
e I2C
> > > > > > address, for instance an AXP717 could be shipped with address 0=
x34 or
> > > > > > with address 0x35.
> > > > > > The datasheets for the AXP717 and AXP803 list two possible addr=
esses,
> > > > > > and they are always consecutive. For DM (DT) based drivers this=
 is no
> > > > > > problem, but the Allwinner SPL code relies on a hardcoded addre=
ss.
> > > > > >
> > > > > > Add a Kconfig variable that will add "1" to the existing addres=
s if it
> > > > > > is set.
> > > > > > This enables to use the AXP717 as used on boards with the new A=
llwinner
> > > > > > A523 chip.
> > > > > >
> > > > > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > > >
> > > > > This works until some board vendor start mixing one or another ad=
dress
> > > > > PMIC. Note that BSP boot0 does address autodetection, so it's not=
 entirely
> > > > > out of the question. Anyway, let's hope we don't see anything lik=
e that.
> > > >
> > > > I looked at the datasheets for all supported PMICs, and they either
> > > > state one or two supported addresses, in the latter case both
> > > > consecutive. Autodetection sounds nice, but also unnecessary: we su=
rely
> > > > know what address it is for a certain board? And with those A523 bo=
ards
> > > > having two PMICs, autodetection might become sketchy, as we don't k=
now
> > > > for sure which PMIC we got?
> > >
> > > Speaking for T527 BSP boot0 - they check version register to make sur=
e that
> > > correct PMIC is installed.
> > >
> > > >
> > > > But that got me thinking: what about putting the I2C address in Kco=
nfig
> > > > directly, with defaults depending on the PMIC type?
> > > >
> > > > config AXP_I2C_ADDR
> > > >       hex "AXP PMIC I2C address"
> > > >       depends on ARCH_SUNXI && !SUNXI_NO_PMIC
> > > >       default 0x36 if AXP305_POWER
> > > >       ....
> > > >
> > > > That's should work seamlessly for all supported PMICs, and we just =
need
> > > > one line for the Avaota, same as with this patch here.
> > > >
> > > > What do you think?
> > >
> > > Yeah, looks more universal and avoids code changes in pmic_bus.c when
> > > adding support for new AXP PMIC, which is very nice indeed.
> >
> > Shouldn't this be in the devicetree?
>
> It is, and the DM based I2C driver used in U-Boot proper does this
> properly, and works fine. But this here is for the SPL, where we don't
> have DT support. We need just minimal support to adjust the regulator
> for the DRAMs. So far there is one fixed address used by each PMIC, so
> this is simply hardcoded, based on which PMIC is selected. The patch I
> am now proposing (snippet above) just moves that hardcoding into
> Kconfig.

I suppose you could use of-platdata?

Regards,
SImon
