Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0103F12CB
	for <linux-sunxi@lists.linux.dev>; Wed,  7 Oct 2026 05:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791352739; cv=pass; b=hFyjhyO/zZCnO/0n/G4VOUHfn5u9wu19ELg3ZPhOMl4H1Ri9TEs2nGMj+hjEfrat2NNhqwP0iRSr+TZI9lM9sY4dU2FsR2cd4G+yMreCT5ntJzgk3Ntu2btU1totSq/ti314Eck2+hqLz7wFosypqbrEHkkModZGwwP8iBQ3kiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791352739; c=relaxed/simple;
	bh=egWNEyrcah0jamvRkd2t3iPlF/zp1CsncVLF5ZQhZ7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cdgYLt9GcWrY2vRO3pUOIMKllpLkCfyjnkOCAZowAlEI2rCkmrzdZrco5kOzRI219vKZD2ZlLdmxjDaUaZIaCNkcFO/KrMdWCpqEGrS8Pu5N1Fvyhi5xxH6QW1OmaUXDDFijO92ChG7HHmiQ/LrMdlAr/5HLZlniRIkxesZPDgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tFmlTv4I; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tFmlTv4I"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e2e0f3dd40so24159385ad.3
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Oct 2026 22:58:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791352736; cv=none;
        d=google.com; s=arc-20260327;
        b=qD3mz63PARZQX8lcqpyNT87BkA1MdGhWJ0H2LrOGwLDIEFNLR9Zq6rzbDFCr/N7bql
         4/hmC/s9/3JZpBPwQwzLxy70sq8DmNvZ4QSuL2wFW4548YuGvJZvB7R9fA71KFEIhsw0
         zh/o8RAUII5kgohzJI3X51T9Oz7gFn0QlVkYEGIsdxJwp0Dq/cTW0JoKTg1X7nQYbnHO
         smQcxZvA0bkfnoLeJW39duWhciJhEz1rHuXeSsSR7TS714OfS9RgbOcUYjSxvhQG2pRU
         Sr0kCzWszL0ZYb2QjfPFmW9qph2KKGA31ipXbxEH/UDVbqPv6JAvI1oV2is0HDx7/zPI
         JhXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fvX6CzIo0lUP4hTcnMKg9GH46W029kkAuFQl56PR8ug=;
        fh=pJxq13JMNNNHc4Rn2/UK8Se1PrKfAKKFmCc9I0vSQig=;
        b=ks2QK7MJqtB7ASVEe++ohxzmssmuxU3Xm9kYzmd7biMDSAHghrzdU34/SXKzjRlFqR
         tK9KOr1RuuzHvdQE7E3yqGsUJXRcfEAHEKbEk0zOxGyBe4cAx4Qk3zBxF7hhCaNpjnb9
         OYww8fNiXrDdqQ+w8iHxRpehN5Cs56xdsYFLme63QHqOqM8FkU8IuvQOn2EjBvyzWk08
         mfgqXGtu8p7cNNH9d6rFK1IKZp9LJxHrzSff5pmTaG+xtifKbExriotm4UKktMOMpZ8J
         7MVaRATZ+dNe66TyDrgEgY7K8hSNBis/iMnCO4XO4DjuDU7ilzEqoHqyvyaHOxAhSu++
         qXBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791352736; x=1791957536; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fvX6CzIo0lUP4hTcnMKg9GH46W029kkAuFQl56PR8ug=;
        b=tFmlTv4INSiEnSUCzhV7lNsXUdMhQHpRjtk823ulK+fs86mueyAjD+5EiRAD9VqPFV
         NrcnpdHq3e27djBV9YxbWEEuK2eicJS7TXyTj4I1OTQpdTcx3BDYuDvvSlNS05o5wDPa
         Pjd72bLjgWDZiLl4X116FU0+MVJ2fieIq88AOqfumBzy3tpZq0EBoMZaRJxtQNKUpPVR
         diZHIcYJS9+X9+S5HdZxH7jDwCJ1ghLyUhMZ6zRXiWC5oI8Io7niC2gPqqAynTjZKdMw
         HjTx4GMXihugaNAwAazeSXbp1WNXmVI3sZmbLOlOTNsMGLz5PfHaQUHqkC+9WTyXeb1p
         oc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791352736; x=1791957536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fvX6CzIo0lUP4hTcnMKg9GH46W029kkAuFQl56PR8ug=;
        b=fTr5B6T7cCThtBJxYm0XfdqIVRCLMlBxHsWJtinOsJNNDZsga3ngQ6SEpno7n4n4NW
         c0/Kuid9nuCGVQE6aSYJu95Vh8ntLo6vWKGGyMMeCMHQ0cRUfNkD2BVjhL1gxFX3SKCY
         h7lY8qufQGpSsWenG6ENmw7glHFrWRbM0C3OZBFpfp96hHsuRI1rfn8Qcp8epSeF2scv
         WMQPR0Uf8/vIUAXv0P/iDHGtUmmXI8klvt6vFAekdEPcO0wIr5X4neJGHXfUYvrXA1kM
         oBNnG1TwWi0XCLJN07qq72veZEcNdi+HpzswK2QlC6rNUtWPb2e16CoKEf3Vd4NccW74
         1ATQ==
X-Forwarded-Encrypted: i=1; AKwUvByD/0oi4GjTb/a35NQYHmnQ+gNuvCPWNAJ+tb1x4Ro/yM//BKIjT0Nwq6H2LRIiJZDV/p0IbQ2d2HtwXA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJWsJ0EDmUG3jTJ5+Gjlr6zqD3K57j7scYkPXpLyqgCBL8RVAip
	s/4Q2NU47BpoBFME2b9PkntUt4AvyU0HyYCj5f5jO/SYwzQl6/QoPwLFBF+X0ggB9Hm5Cwpy4hz
	YVqytUHPlcG/VKb+oQQoe/NnAB+hwt60lS7o7kV3cnYAO
X-Gm-Gg: AYBFou3+tUYaM0VfCHDkCiHsnRgozEeyEYmx+DdAPkEtnyyBPyTlvX8DzG1kxWztOIg
	Bc/EUYuSVAUIi6jKcM5adhDR+jrbrpJhI0F1YaRMt9rBqravJEn06CFIjlPzeT3G7IksGFZJgvT
	lse1WqYTASfwOw3nZeftPxbzgeYIUgiGdj2tf2OwW5vnzYAiribFmsSEED4uqar0HbJLjfRDWHY
	JkZiXCxO0j+lbpsTaT2J/s5FP/db1zHmceGJ+xEpWIrjBMg3y4LBUFS3OaSeSF4+SDdLyhe/Rkr
	hozmoMjVn/bRwBRr9qEbLVbQ6ZkKH+qVKqsyVtqK9m63K0Pzb9ng6siF8D9/2HPfQyEEIbY=
X-Received: by 2002:a17:903:2c0f:b0:2e1:2ce5:677a with SMTP id
 d9443c01a7336-2e6003b5d0emr12356995ad.16.1791352736407; Tue, 06 Oct 2026
 22:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261006210313.43163-1-pmazzini@gmail.com> <20261007012337.6765eae7@ryzen.lan>
In-Reply-To: <20261007012337.6765eae7@ryzen.lan>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Wed, 7 Oct 2026 06:58:40 +0100
X-Gm-Features: AclHuK9so5s6SVHKBrMxWd9wydw_PDXudCltTNho_5K9L0MuDF1LhfNqIbWLxW0
Message-ID: <CAAxh=jvd=dR4anQ9P=f=NtUePTfXY0SSR6PXxc8VvDcjP+ni2g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: dt: do not accumulate npins across probe attempts
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, that's simpler, thanks. Will do that in v2.

On Wed, Oct 7, 2026 at 12:23=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Tue,  6 Oct 2026 22:03:13 +0100
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>
> Hi Pablo,
>
> > init_pins_table() adds to npins in the driver's static descriptor, so
> > after a probe deferral the count doubles and the next probe fails with
> > "pin 0 already registered". Count into a local instead.
>
> Can't we just initialise desc->npins to 0, at the beginning of
> init_pins_table? I think Sashiko suggested that even...
>
> Cheers,
> Andre
>
> >
> > Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> > ---
> >  drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl=
/sunxi/pinctrl-sunxi-dt.c
> > index 50a16f3bd131..1c1888394cf1 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> > @@ -75,7 +75,7 @@ static struct sunxi_desc_pin *init_pins_table(struct =
device *dev,
> >                                             struct sunxi_pinctrl_desc *=
desc)
> >  {
> >       struct sunxi_desc_pin *pins, *cur_pin;
> > -     int name_size =3D 0;
> > +     int name_size =3D 0, npins =3D 0;
> >       int port_base =3D desc->pin_base / PINS_PER_BANK;
> >       char *pin_names, *cur_name;
> >       int i, j;
> > @@ -85,7 +85,7 @@ static struct sunxi_desc_pin *init_pins_table(struct =
device *dev,
> >        * Also work out how much memory we need to store all the pin nam=
es.
> >        */
> >       for (i =3D 0; i < SUNXI_PINCTRL_MAX_BANKS; i++) {
> > -             desc->npins +=3D pins_per_bank[i];
> > +             npins +=3D pins_per_bank[i];
> >               if (pins_per_bank[i] < 10) {
> >                       /* 4 bytes for "PXy\0" */
> >                       name_size +=3D pins_per_bank[i] * 4;
> > @@ -98,12 +98,14 @@ static struct sunxi_desc_pin *init_pins_table(struc=
t device *dev,
> >               }
> >       }
> >
> > -     if (desc->npins =3D=3D 0) {
> > +     if (npins =3D=3D 0) {
> >               dev_err(dev, "no ports defined\n");
> >               return ERR_PTR(-EINVAL);
> >       }
> >
> > -     pins =3D devm_kcalloc(dev, desc->npins, sizeof(*pins), GFP_KERNEL=
);
> > +     desc->npins =3D npins;
> > +
> > +     pins =3D devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
> >       if (!pins)
> >               return ERR_PTR(-ENOMEM);
> >
>
