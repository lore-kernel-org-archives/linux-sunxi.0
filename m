Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1C034FF63
	for <linux-sunxi@lists.linux.dev>; Wed, 11 Feb 2026 04:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770782706; cv=pass; b=Kdxu84Qx0uTcTAEMcrKoXwyPF6yyXS+mM5ZY4rIWDSZKFdl5Hxp7POxzaQG3W12d/mxtIZqCA8oM605s/MLekmvZCBhejTZEeYIDTe/hzHRM+RmLgeWMEw+c/Q37e5mzb3goAePXJlMgm/4ayQsYvIE9HW6tn0wZpAXeh94f4Sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770782706; c=relaxed/simple;
	bh=DjVVMdCfr8AWS+gLkQpMkHNLAd0NWUrUawMagvm1hpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Le8yrPPIAxkUTLooCWl8MVdYDh0yDMDzwHxR6FFVKI78K3mZsSLRdEv6MqMfwTspg41PYrbxPJGCz84jKxPTTjDMaNG+Rc0AYJm2CMelcTd77nXxDv8j2C5rQFZiJAHw52vyWhOFMJCVkmZDtCGa/ICCLTe1DPS+2/bIZl2xbVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lL0j3V6K; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lL0j3V6K"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-948af5e704cso1490116241.3
        for <linux-sunxi@lists.linux.dev>; Tue, 10 Feb 2026 20:05:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770782704; cv=none;
        d=google.com; s=arc-20240605;
        b=dFeFHzFuJ0BbEmb9F2y63jPP0g/skGtNtENAzSykudQanYdMcGIpR66XW62vmfmIrH
         DY7LouQXMzjtGXyCbJxeJXg/fPc8GYGBWzofgL+KCE6ok0R4MbWYyJQmc5sJ7Z1+3rZy
         phOMPjo6QvotIzua6rCzfPM56sdHmDza057P2/U07CwG+BfXbjyOmETOrzwDcYMFwu+x
         aY0YBGPBg4T7IwZSv0rmiT8YkposukeKquNh+xlRckZptqFbPT6gU4swsJhIIV9VtDtn
         0g9FbK0rWIPIoC/TAM+csWps5DVHm/hMW9Wo8bd95lGqa1sNBO5v7QDql1eCPDO+Wsy/
         Posw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qEVbXEJobC5WrafOHG6I1blIMwKUcTYowOn3LM56dKc=;
        fh=hkUQEVB6DCDbJMkSCm2mOOixG1Rp08STD2/0ZBq+T48=;
        b=VTZZIQDL6fly3pTne/BgHW6vZIlswZ7bouZ7IsY2UArkQu/Fg+gq/w20VPrDJX4SuP
         +Av/kVXz9EoNgc1RP7jYZS45b/dxAcJdIA/bhw4xmfWBnEMn4MFndF6bukZfQffx0Qcb
         Z3aBGfpNavXLQq0JzOifj+Des97bbwbjg7BhTgGlj+NJgfmdt3z4ZfxzkoBswYpcNq1L
         7DJ/VJjXnA/0X9zD57n4EU1jcp6Qseo0uUyC9aRhTYLuQqzaZmuQfH9wXgugyPcXT5Yr
         nA2K1+debeeQnremhjzf7zfqtvGRxNDTibZaFFc8CQn817txET+80G6AFcOAZTlcuKrb
         RnuA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770782704; x=1771387504; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEVbXEJobC5WrafOHG6I1blIMwKUcTYowOn3LM56dKc=;
        b=lL0j3V6KpDpOIslG4N3wf7mkRkm0EdtCue0CtFy8i/5KeVhz6FPTWy/et95PVCbve2
         9qN31CjfoCG6Dw1Q2vnE4xSYwHfBDVfcqTsz/MgCLRhZRKSBd39Az8n5RF7AuZMy3TY8
         mofCPCr+Ab5u0Bbm2EAptrzT4A1dtqchSfWU80k1ryfRtJzjNztDlWC0CWpUUn2QoxBG
         wxlZYWAp+reudbKC4ggEQ8JnmEZAmxBxN7nk+cSqkoPXouCkjY+6UFmR1RTGH2s5604T
         V6LI9JWJVmignhkmZpQwsigrM1wm+ecbma2WK+TyUuTP1DltWV58Au+oF0DIzlSPJVtr
         L/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770782704; x=1771387504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qEVbXEJobC5WrafOHG6I1blIMwKUcTYowOn3LM56dKc=;
        b=EevPMyp8ffH/u/8CnnAD2dTizIlmBFqpXMRG2Io9BqAnFRkEeK2TbgZIECOTve1Uej
         oEwp9xqXMQCO7jLq5WAA9Nkv1OopzMr07iz99u34gxRABQUD5cTZRLVvmYXYPdkadDJD
         YCHMaffegozV4vrEw35RblXhPO099aZIpyYlobwgiwDGSJm6Ql5Szlb2e3WO4xLqz89R
         apwczlolDRFv9uJyShbfOd6NP9geKsDL/kreYx5snbCiwS4nFXoyjnvbNmqMNuhBIqSA
         MQcqwCG0Ux8Yklb8TRF3191qy1ylFxuarBqLLyCG3G5g2mlOOTyIZt2NUr7faklLTI9G
         Bvyg==
X-Gm-Message-State: AOJu0Yxkj/FCP7Cj7pIFmAM26ZpNnhcmXTSUpiqqr9huzey95Cv02X7O
	U3YZ4iDUVhfJWZtNPWNUnRqlxiSvtjM0vod2L/7T1GycN4eRI3T2234Pc/FYB1dzBS1xDUm21fY
	SV/yg5d6nKyaFLQ2jv6cTZray5s84xuM=
X-Gm-Gg: AZuq6aKT+J2Q7D48VxlIzrbIe8cmWDzHXRG+dYBSYbOF0e1WXYakpvj4tf40j5inKz/
	oWprYx1M+Y5TRAL3MNKRhExY6ZfN5czGeS/Tm5Lo+MJ7zOVg5YLotB16OX832vYl6VEYCcD/kbI
	49LPKsx94umVZ1VKE5VKo3AliGjCK6/4a1wGNYU3IbzyaQ1tkOFZRP4vkWfl8vXQDJ5CiAoqGWP
	o+Ts6AYGhJP2aYOsMLDljYYtXP+/Wz+DbZE5iwHglt0USTkiQRbf22Ij0QpZInb1VaBVG1KUtci
	f2LeHUSzfdPPos0OidPeNqQJUjfm7GeAI+8EvDHUyR6FGpHRv35rS30Tp2wVejW3UUPA
X-Received: by 2002:a05:6102:4421:b0:5ee:a8c4:18f2 with SMTP id
 ada2fe7eead31-5fde93f801emr137229137.26.1770782704273; Tue, 10 Feb 2026
 20:05:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260211033249.2770281-1-james.hilliard1@gmail.com> <CAGb2v64TYWbvs7mmpa87X28WWQpTi7O+VZSz-x8GmGhyadBegQ@mail.gmail.com>
In-Reply-To: <CAGb2v64TYWbvs7mmpa87X28WWQpTi7O+VZSz-x8GmGhyadBegQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Feb 2026 21:04:54 -0700
X-Gm-Features: AZwV_Qjf4ObSc92v7jkKvYHFiayN0060eKWYrAhspcIrTjh2lRHs_GV5KWc25f8
Message-ID: <CADvTj4p7YYhz-iZSRX=hDyL2E2JXPmnCJ59wX+9zMt7vnzn8GQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: sunxi: add GPIO get_direction callback
To: wens@kernel.org
Cc: linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 8:49=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Wed, Feb 11, 2026 at 11:33=E2=80=AFAM James Hilliard
> <james.hilliard1@gmail.com> wrote:
>
> Ah, you beat me to it.
>
> > Implement sunxi_pinctrl_gpio_get_direction() and wire it into
> > the sunxi gpio_chip setup.
>
> Can you also mention that without this, calls to gpiochip_get_direction()
> cause a big warning?

Yeah, this was mostly just to silence that warning(I don't think I actually
was actually using the functionality).

> > The new callback reads the pin mux register and compares the mux
> > value against the pin descriptor gpio_in and gpio_out functions
> > to report GPIO_LINE_DIRECTION_IN or GPIO_LINE_DIRECTION_OUT.
> > If the pin is muxed to irq, report it as input.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/pinctrl/sunxi/pinctrl-sunxi.c | 32 +++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.c
> > index 0fb057a07dcc..424f23be27b2 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -995,6 +995,37 @@ static int sunxi_pinctrl_gpio_direction_output(str=
uct gpio_chip *chip,
> >                                             chip->base + offset, false)=
;
> >  }
> >
> > +static int sunxi_pinctrl_gpio_get_direction(struct gpio_chip *chip,
> > +                                           unsigned int offset)
> > +{
> > +       struct sunxi_pinctrl *pctl =3D gpiochip_get_data(chip);
> > +       struct sunxi_desc_function *in, *out, *irq;
> > +       u32 reg, shift, mask, val;
> > +       u16 pin =3D chip->base + offset;
> > +
> > +       in =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpio=
_in");
> > +       out =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "gpi=
o_out");
> > +       if (!in || !out)
> > +               return -EINVAL;
> > +
> > +       irq =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pin, "irq=
");
>
> This is less efficient, as you end up (linearly) searching the whole pin
> array three times.
>
> What I did in my version was implement a search based on pin and muxval.
> I can send that out if it's OK with you.

If you have a better patch I'll just use that instead of sending
a follow up.

>
>
> ChenYu
>
> > +
> > +       sunxi_mux_reg(pctl, offset, &reg, &shift, &mask);
> > +       val =3D (readl(pctl->membase + reg) & mask) >> shift;
> > +
> > +       if (val =3D=3D in->muxval)
> > +               return GPIO_LINE_DIRECTION_IN;
> > +
> > +       if (val =3D=3D out->muxval)
> > +               return GPIO_LINE_DIRECTION_OUT;
> > +
> > +       /* IRQ function is effectively input. */
> > +       if (irq && val =3D=3D irq->muxval)
> > +               return GPIO_LINE_DIRECTION_IN;
> > +
> > +       return -EINVAL;
> > +}
> > +
> >  static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
> >                                 const struct of_phandle_args *gpiospec,
> >                                 u32 *flags)
> > @@ -1603,6 +1634,7 @@ int sunxi_pinctrl_init_with_flags(struct platform=
_device *pdev,
> >         pctl->chip->set_config =3D gpiochip_generic_config;
> >         pctl->chip->direction_input =3D sunxi_pinctrl_gpio_direction_in=
put;
> >         pctl->chip->direction_output =3D sunxi_pinctrl_gpio_direction_o=
utput;
> > +       pctl->chip->get_direction =3D sunxi_pinctrl_gpio_get_direction;
> >         pctl->chip->get =3D sunxi_pinctrl_gpio_get;
> >         pctl->chip->set =3D sunxi_pinctrl_gpio_set;
> >         pctl->chip->of_xlate =3D sunxi_pinctrl_gpio_of_xlate;
> > --
> > 2.43.0
> >
