Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAA83451BF
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Sep 2025 13:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757424798; cv=none; b=jcKXvyN2WQDPUdP4h4Jhztvq0n+vMVemwwCHSLLpT7QmafnF7FlkLyQiuuPZxE6N6NNoYn7tKNl6mVfrlZViSxJY0ovZtJgPCoSRWNPS66A0XtqcPYeEQ12U0WokcgXotWnDiYKg2PpR8fSqIZzjMFic8UJL3aP/vZGrBVWI6CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757424798; c=relaxed/simple;
	bh=HvqrxfVpH7iJhCYu7YCrbtWJo9St/OC+LmsQzVrb2yI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDQlNJNuNhOknMHyP61HVuP03zOOQpkCie0m6K9kRc1TNhLZ6mgxQt7jVPp70C5h12BxmqbD8JdIL4GsUOPDiCOK8AVE6VIHjOWnBwHEm8ib6UoBVPt/u01xAiKk65n/2vBbr11UHejZSjbp9kDBgFkLVBG6AOTgtvsVdGZSAe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55f74c6d316so3139639e87.0
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Sep 2025 06:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757424793; x=1758029593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OiPDvR6ZseDfZONnWJWsyImGvwysMua8qOuAT6/itt0=;
        b=Q9znP+kmiE5EYwn41U9Ru8z2aBtxAGd4ctr2D+YHHOMl3qOS0x/zxHs1EVjzGyQY7L
         VwzOxthwwUzJr7wbBzTltaSlWOj7RdtbdFhXuZg+g+i6nAu6tMrn98UCcl1eC3AY8+4x
         WewFp0DNxwCTCj49ms3dLqZwSB/kxyEdi+4R578q82F6Ohur5FTeTHfbyM/LSjm0KniW
         XrJWb0532FEdTIYPSq/uKH2c/HTB2IP95SUwxLgTXYQmMkf+k4JzpVtpT3zt5n3Wxfdm
         mauyJJHS7fpse8yilEGDhJSLtdPoRfPMymzvRj6eCL4+SyUiuYUQ2weSHrDzsR9kDvEg
         1s/A==
X-Forwarded-Encrypted: i=1; AJvYcCXN1yip9kcajuxJfpcswPoy9IzTpWAkoWFYt3V6YtiDGWXHht5GXPN6wig/ljykvJN0EwJQsGTL84t9qQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjLNVglwyfki/2B+aEEtyXVvgqgDMaN6K1QzPNm9AxL34ZC0ny
	0u5zqVQyF/tax8eVBLY01WXLxILNAyOV5MRztQ+fXBxyPOXLsiIzxaIk0P6MkZzC
X-Gm-Gg: ASbGnctSj+v5XYWHAmvW3d+KtORVqdxrpbRel9jfz96NMv+RbKNp/+p+4emZQ+CoAYv
	ETYMHFYdpVcMMPNJvS99mHhZeSLbUaVMdLSfnPVo3tFTeLs9A1U1U9QOY5q3Q7DmwG8xqGNp9c2
	q/RYpmVYWBFwQnJkEzJ47WWcTUrEpFY/tFDwGqOWHRguFfkrAi4MC9Mx5Mug++befgKji8suao6
	+/3m0e8WFX2FextSU+YRU6Pk5KcV5MaRaOVC0PkJVic8bBP8thrBtV6w9upC8eOL+gCS6GeiLBq
	BvABYvcbrrD/UXt9n+2gkxYtE/MFZyl87OUJEvahw/TgEoBCnlmo+A7xwcRv6dFJhhgT5ii685A
	spTPKTi+ZqCE7blSSi6E9MWUEkY7s6gc5eaFX8TR3OUza0ZhIyDWf29TfUcu7kNZ2HA==
X-Google-Smtp-Source: AGHT+IHB24yXCdxDjr1s+TvPEqjPlBWPj8LqLRCgpsoYCaDuKZsAh8mzJR5QzRVMor7ZbKV50u90vQ==
X-Received: by 2002:a05:651c:2221:b0:336:8267:c1fa with SMTP id 38308e7fff4ca-33b4dab7931mr29261501fa.19.1757424792561;
        Tue, 09 Sep 2025 06:33:12 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f5032caasm41107931fa.35.2025.09.09.06.33.10
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 06:33:11 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-336b071e7e5so45935411fa.1
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Sep 2025 06:33:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpFMCEa5US9tqruox00IRE1fJhOOjnTl6RtiGA7V83p4gadgyXcenT7LsbLXuBrLJyVxgXZMbt0Z6T2A==@lists.linux.dev
X-Received: by 2002:a2e:a54a:0:b0:338:a33:96e0 with SMTP id
 38308e7fff4ca-33b52891786mr32184271fa.21.1757424790514; Tue, 09 Sep 2025
 06:33:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250903000910.4860-1-andre.przywara@arm.com> <20250903000910.4860-4-andre.przywara@arm.com>
 <CAGb2v66DHvE5gcWDvHwoiiCgNEnPiGjB6ash407PwJr8oMwyhw@mail.gmail.com> <20250903112054.173fe7b8@donnerap>
In-Reply-To: <20250903112054.173fe7b8@donnerap>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 9 Sep 2025 21:32:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Cv4BUiwq2kX4OSeRcMU=YC=-CxQTtnQG_-0=B=tsaYg@mail.gmail.com>
X-Gm-Features: Ac12FXwVCVC7-rgwvVDgpfgKJIONLlDmlW4y0Cq7K_8SdacVRdO0XPJ7BtdhumE
Message-ID: <CAGb2v64Cv4BUiwq2kX4OSeRcMU=YC=-CxQTtnQG_-0=B=tsaYg@mail.gmail.com>
Subject: Re: [PATCH 3/5] clk: sunxi-ng: mp: support clocks with just a shift register
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Mikhail Kalashnikov <iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 6:21=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Wed, 3 Sep 2025 12:20:55 +0800
> Chen-Yu Tsai <wens@csie.org> wrote:
>
> > On Wed, Sep 3, 2025 at 8:09=E2=80=AFAM Andre Przywara <andre.przywara@a=
rm.com> wrote:
> > >
> > > The "mp" clock models a mod clock with divider and a shift field. At
> > > least one clock in the Allwinner A523 features just a power-of-2 divi=
der
> > > field, so support an initialisation of the clock without providing an
> > > actual divider field.
> > >
> > > Add a check whether the "width" field is 0, and skip the divider
> > > handling in this case, as the GENMASK macro will not work with a zero
> > > length.
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> >
> > In my series I have a patch that adds this to the divider clocks,
> > thus adding a P-clock type to the M-clock bits.
>
> Yeah, I saw that, but wasn't convinced this would be better. Hence wanted
> to post my version as an alternative.
>
> > Maybe use that instead? I prefer we use actual matching types instead
> > of disabling one part of a complex clock type.
>
> Good that you bring up that topic: when looking for matching clocks I saw
> we have a lot of them, though often one is just a subset of some others,
> with some code duplication. And we use the pattern of "use type A, but
> without feature X" already, for instance for "NKMP without the K".
>
> So I was wondering if we should revisit this and clean this up. IIUC thos=
e
> clocks were all modelled after the H3 and earlier generation, and the
> clocks have changed since then. For instance I don't see PLLs with two
> multipliers (NK) after the A64 anymore.
>
> So what about we consolidate the various types into just a few distinct
> ones, like NKMP for all PLLs, for instance, and provides macros that
> disable fields as needed? This could ideally be done under the hood,
> leaving the per-SoC drivers mostly alone, hopefully.
>
> What do people think about that?

I guess we could combine the NK* types, since those are relatively few.

I would like to keep the basic ones, those with just one multiplier or
one divider, possibly combined with a mux and/or a gate, alone. These
are based on core clk helpers. We only add features like fixed post
dividers or update bit support on top of them.


ChenYu

> Cheers,
> Andre
>
> > >  drivers/clk/sunxi-ng/ccu_mp.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu=
_mp.c
> > > index 354c981943b6f..a03dac294d048 100644
> > > --- a/drivers/clk/sunxi-ng/ccu_mp.c
> > > +++ b/drivers/clk/sunxi-ng/ccu_mp.c
> > > @@ -236,9 +236,11 @@ static int ccu_mp_set_rate(struct clk_hw *hw, un=
signed long rate,
> > >         spin_lock_irqsave(cmp->common.lock, flags);
> > >
> > >         reg =3D readl(cmp->common.base + cmp->common.reg);
> > > -       reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shi=
ft);
> > > +       if (cmp->m.width)
> > > +               reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cm=
p->m.shift);
> > >         reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shi=
ft);
> > > -       reg |=3D (m - cmp->m.offset) << cmp->m.shift;
> > > +       if (cmp->m.width)
> > > +               reg |=3D (m - cmp->m.offset) << cmp->m.shift;
> > >         if (shift)
> > >                 reg |=3D ilog2(p) << cmp->p.shift;
> > >         else
> > > --
> > > 2.46.3
> > >
>
