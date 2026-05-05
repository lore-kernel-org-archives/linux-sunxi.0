Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28893264C2
	for <linux-sunxi@lists.linux.dev>; Tue,  5 May 2026 16:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998299; cv=none; b=TP9kJmFPUIADfmbEYjyW7tjRjHU/p0ZqUIa6DTJ6+JvEiFjV8ZPXN8h1qNCXb4gI7oaXz3AvlVvt8R71KwAGcYBhz9n32Vdq/tX3Ezil291nt+VJqQ9nVyHxLRFF5Gtdwrlr0DBYr/Bhne/XXefnPtdb8nvm8L/ejY4bj5otTgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998299; c=relaxed/simple;
	bh=ajnOZwCq/PnZN7aH7cLkkTdAAF7vLV6z6+ahVx1kXwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uXtsgk4HNALH6zLQv+lPMM8jmdR2zAP6rgme7fz7c/uzVy5Xi/6KPj1O4ZkksttJAA22iBKZl68Wi1xOGwtcYmhnNu0fOAsMhCjFTXSTQSEd38NzFmnANTEDRqK97KQEBn3GV3/FPhacHO8OzKsCL3CtpG6AL9AGY6p2X6vBZcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a86c1fe573so4090932e87.3
        for <linux-sunxi@lists.linux.dev>; Tue, 05 May 2026 09:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777998293; x=1778603093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhE1GPrxyKAsw37Q2fShYI5FmXFiAGB5BC0k4Zz9C/U=;
        b=gxY7tcbeN8BZmb0e4RUhcKOoTU6+063yoOjOYifJjjm3rzngBn3l9TABJdGbhiCjwX
         4T9f7R1lOTdwDw9OwGNTdLHogx6PnfRi+cyW4RlSBu+bkpZBMmqIJNBGTM1j2JUBnQvG
         gkiUQymuNJ/yCShAD7BqdCBYvR6ejIWRl6h0Bb6tUz9bDsi2XoRecW7z5dp5/4ystl7l
         GM6iPA3mgrtf1U7cnaiHYGLrjUKXYjxWzZPhr+syjasA7cZ8dA0l2uWteQ1TW6r2khCN
         i8V3hT3+fvP610cJKjhM7YY90p7yJSz2mZvZMeuuxJXxJMpyx1Hi4TVHOjbiM3+x87ph
         ntqQ==
X-Forwarded-Encrypted: i=1; AFNElJ96L1woUBaPL1N1Cy32EY2h4RU6XkjtgNSsLZZDfjCCqSaJxMXkggc4KZFwFxZ/PS+9EMmOPS9oClA2bA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZicKqTpKyTxnOvXs6FKa8r6MVi6a6JI17Dvt4bW/B6CljjfHG
	4+ORqkBUkSPqy3v2znmrNvwAlDapD7CJONvPRV3BHFMUAdu4Eaz4zMC7h2rLgIqN
X-Gm-Gg: AeBDietCRNHSVEyaYw2YHE5GQ/ddJdx3H2S1Yp60YvFjHh93WnClOjQRLNmGAu6WrEx
	c1W/0wqHy4L22n3Z9wqRYA91SWBj0K/tes5IbMyd6Zz6CzO8VOnF1+vmXDg9xp8Bo3DvBW+pUSR
	Mzpkl75xeir+Fe2DYgH6NUxRCEV+AbzIKwiIVPgHNXMkYfzbrOgM7lpetmv91TbPJUJtcWc7vy4
	pob4OodGsf0xXLLHRZFbR7tgC4IVXhFU61pNgoelQ7Q65XowtupiqUrlynb+ZOcPKRhSkH2lVQ3
	5XaejFA+ydyqwmdUayKlbT5q+v3Z0OB+15cJyxIKeJwjdFQ3ERRBaUIP28YjtQ5BjR5Yd+sHSbG
	+flSnAJN7ty9GPBP20H9VOIgkZN/iU3EHBI/sWLPkE7em1/MN2H221eqkEv7K1TlOdz8s5JEd0Z
	2pTOg9Hhf8IL8Ugg8ZJJl1I5b21otGlxUk6dt6r61zrxCbKdCsBUXAYKJF18BLm9A9XA==
X-Received: by 2002:a05:6512:3c81:b0:5a4:6f5:6c2d with SMTP id 2adb3069b0e04-5a8631c0e0amr5390039e87.31.1777998293047;
        Tue, 05 May 2026 09:24:53 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a87f81656bsm785719e87.14.2026.05.05.09.24.52
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 09:24:52 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38e84ed22bdso56803911fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 05 May 2026 09:24:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8HArSWqAPhk2sT83O0Rc4fpooHCAvEuwJzQp90Iw4Ccdj0uycoe3+5WCNlCVBh0hYBZsV4LcO6oNlGRQ==@lists.linux.dev
X-Received: by 2002:a2e:bc88:0:b0:393:940e:d5eb with SMTP id
 38308e7fff4ca-393940edd6bmr44531191fa.3.1777998292458; Tue, 05 May 2026
 09:24:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250307002628.10684-1-andre.przywara@arm.com>
 <20250307002628.10684-9-andre.przywara@arm.com> <afoRe6DI4GJIVtg4@shepard> <20260505182017.10d71c11@ryzen.lan>
In-Reply-To: <20260505182017.10d71c11@ryzen.lan>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 6 May 2026 00:24:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v666gCJiMpeWKpANHPufCp-nVJvdky+Gj87zUagvcrwTiw@mail.gmail.com>
X-Gm-Features: AVHnY4J2M27F_ij2YPG2EBXpDPE1R3Ey_Ifi-Xq3Eypf1d-qnvtALFOdRCX5tAU
Message-ID: <CAGb2v666gCJiMpeWKpANHPufCp-nVJvdky+Gj87zUagvcrwTiw@mail.gmail.com>
Subject: Re: [PATCH v4 08/14] clk: sunxi-ng: a523: add system mod clocks
To: Andre Przywara <andre.przywara@arm.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 12:20=E2=80=AFAM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Tue, 5 May 2026 17:49:15 +0200
> Paul Kocialkowski <paulk@sys-base.io> wrote:
>
> Hi Paul,
>
> > On Fri 07 Mar 25, 00:26, Andre Przywara wrote:
> > > Add the clocks driving some core system related subsystems of the SoC=
:
> > > the "CE" crypto engine, the high speed timers, the DRAM and the assoc=
iated
> > > MBUS clock, and the PCIe clock.
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 135 +++++++++++++++++++++++=
++
> > >  1 file changed, 135 insertions(+)
> > >
> > > diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sun=
xi-ng/ccu-sun55i-a523.c
> > > index 17a4ffc0b7f52..c59f3f789d052 100644
> > > --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> > > +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> >
> > [...]
> >
> > > +static const struct clk_parent_data hstimer_parents[] =3D {
> > > +   { .fw_name =3D "hosc" },
> > > +   { .fw_name =3D "iosc" },
> > > +   { .fw_name =3D "losc" },
> > > +   { .hw =3D &pll_periph0_200M_clk.hw },
> > > +};
> > > +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
> > > +                                  hstimer_parents, 0x730,
> > > +                                  0, 0,    /* M */
> >
> > I was looking at the A523 ccu code and see lots of
> > SUNXI_CCU_MP_DATA_WITH_MUX_GATE with no M.
> >
> > Was there a particular reason for not using SUNXI_CCU_M_DATA_WITH_MUX_G=
ATE
> > instead? It would surely be less confusing.
> >
> > One difference would be that the ops end up as ccu_div_ops instead of
> > ccu_mp_ops. Do you need ccu_mp_ops for some reason?
>
> Yes, please double check that (as it *is* confusing), but to me it
> looks like the CCU_M_ version has just a pure divider, whereas in
> CCU_MP_ the P is a *shift*, and the M a divider. Those timer clocks just
> feature a shift, which I don't think we have seen before?

We now have SUNXI_CCU_P_DATA_WITH_MUX_GATE() which was recently added by
me exactly for the timer clocks in the MCU CCU [1].


ChenYu

[1] https://lore.kernel.org/all/20250911174710.3149589-5-wens@kernel.org/
