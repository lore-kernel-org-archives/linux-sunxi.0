Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38C17C
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Jul 2022 16:29:51 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id h19so14430831qtp.6
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Jul 2022 09:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=frZfKP9LN/+rExEoWp6ML2iGfeji+NFrp11uK/sqtZk=;
        b=Ps0DWO6T4WzbDGYeEutFMBaCJEv6EwmO6yfNhrrW9fLvenOnLf8CpHHSeOAY2uvSzw
         FK7iZ8B6E0AnzHWlnS513BjspevScYhXSq/uM6yfsMgYH/t9vvSn99fYpJ4tYxcJPRvI
         pG0YzWt8lsWyIwohAoe9w0qNxwNbQ4mhgJZ9AL1hkb1Kmr+k/iyikzaljHLv4ZoV1Vzq
         i204rqTImulYU6xSsxbh2BzDqQ1ONvXpsds4nrqCDLU94le1JUeqoNfqUPEssfMfDj4L
         +ESly7tYqPuMo8yHqDapC3YyjA/6SUp5ehLxFFHbIU1XjMvB7Hgxo0zJoSgCOPMCShuk
         pQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=frZfKP9LN/+rExEoWp6ML2iGfeji+NFrp11uK/sqtZk=;
        b=V7biAEAw7Us8M79gqSdeQ3nhU41NYMQJOnT5wkpjBtIvWdhUQDWKqkTuqJ5kXlXano
         i1SG+UmZxks47BruG8pdFTJMWgA+OQNa4cxTMlz4sYKswZJuHb54RbZ3kkUzyhct39G6
         ifhm+noiOJJNsiTUaoDkHPLk2LkN3xjOojSMGPload5jSLsvEKKjAwmzMBLk7EtKnUu1
         lprCVnW81tkGMwlVrkdo2d8nrPI6WLwRwrHQuaJj/fzw91k/C9YHgkXQMHDKF5PsFfUj
         sh1WKtlDt3eHro5nymaejaQZjnlq9OrIP1GFg1+wl7q2/Fx2Uo+xqmR85RzI7UxUbfbR
         TRTg==
X-Gm-Message-State: AJIora9zgpN41WlfcDAYtJboe8AYzOY9gs35wdYFOWlyp63ULzG9zz7w
	6n82RC8SrpppTz3IP6ZA0EDvof/Xo8/TC6ZXwQ4=
X-Google-Smtp-Source: AGRyM1smvkcc+wx4+dbpJGx0vkJJ67YmA9Lz9S1Sq/2SC52pCZM6JvlduT21q1pxjdSSSb5JIE37QAOE/SzRBkSoX1A=
X-Received: by 2002:ac8:5dd4:0:b0:31d:4044:c46c with SMTP id
 e20-20020ac85dd4000000b0031d4044c46cmr14241012qtx.174.1657038590357; Tue, 05
 Jul 2022 09:29:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220705075226.359475-1-r.stratiienko@gmail.com> <5580615.DvuYhMxLoT@kista>
In-Reply-To: <5580615.DvuYhMxLoT@kista>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Tue, 5 Jul 2022 19:29:39 +0300
Message-ID: <CAGphcd=O-BQRJwQbUbbFMt29jxHf+KpJWrrm5SmMhumkCBam0Q@mail.gmail.com>
Subject: Re: [PATCH v3] clk: sunxi-ng: sun50i: h6: Modify GPU clock
 configuration to support DFS
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org, mripard@kernel.org, 
	wens@csie.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jernej,

=D0=B2=D1=82, 5 =D0=B8=D1=8E=D0=BB. 2022 =D0=B3. =D0=B2 19:07, Jernej =C5=
=A0krabec <jernej.skrabec@gmail.com>:
>
> Hi Roman,
>
> Dne torek, 05. julij 2022 ob 09:52:26 CEST je Roman Stratiienko napisal(a=
):
> > Using simple bash script it was discovered that not all CCU registers
> > can be safely used for DFS, e.g.:
> >
> >     while true
> >     do
> >         devmem 0x3001030 4 0xb0003e02
> >         devmem 0x3001030 4 0xb0001e02
> >     done
> >
> > Script above changes the GPU_PLL multiplier register value. While the
> > script is running, the user should interact with the user interface.
> >
> > Using this method the following results were obtained:
> > | Register  | Name           | Bits  | Values | Result |
> > | --        | --             | --    | --     | --     |
> > | 0x3001030 | GPU_PLL.MULT   | 15..8 | 20-62  | OK     |
> > | 0x3001030 | GPU_PLL.INDIV  |     1 | 0-1    | OK     |
> > | 0x3001030 | GPU_PLL.OUTDIV |     0 | 0-1    | FAIL   |
> > | 0x3001670 | GPU_CLK.DIV    |  3..0 | ANY    | FAIL   |
> >
> > DVFS started to work seamlessly once dividers which caused the
> > glitches were set to fixed values.
> >
> > Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
> >
> > ---
> >
> > Changelog:
> >
> > V2:
> > - Drop changes related to mux
> > - Drop frequency limiting
> > - Add unused dividers initialization
> >
> > V3:
> > - Adjust comments
>
> I don't see any comment fixed, at least not to "1", as we discussed. Did =
I miss
> anything?

I've added the "bits" word, so now it should sound correct.

> Also, please add min and max.

What is the rationale for additional limits?
CPU_PLL doesn't have these limits. I don't want to make them different.

> I also consent to R-B, which you
> didn't include.

I was expecting an explicit 'review-by' line. Anyway I can add it and
resend v4 if it's necessary.

Regards,
Roman

> Did you resend v2 instead of v3?
>
> Best regards,
> Jernej
>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
> > b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c index 2ddf0a0da526f..068d1a6b2eb=
f3
> > 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
> > @@ -95,13 +95,13 @@ static struct ccu_nkmp pll_periph1_clk =3D {
> >       },
> >  };
> >
> > +/* For GPU PLL, using an output divider for DFS causes system to fail =
*/
> >  #define SUN50I_H6_PLL_GPU_REG                0x030
> >  static struct ccu_nkmp pll_gpu_clk =3D {
> >       .enable         =3D BIT(31),
> >       .lock           =3D BIT(28),
> >       .n              =3D _SUNXI_CCU_MULT_MIN(8, 8, 12),
> >       .m              =3D _SUNXI_CCU_DIV(1, 1), /* input divider */
> > -     .p              =3D _SUNXI_CCU_DIV(0, 1), /* output divider
> */
> >       .common         =3D {
> >               .reg            =3D 0x030,
> >               .hw.init        =3D CLK_HW_INIT("pll-gpu", "osc24M",
> > @@ -294,9 +294,9 @@ static SUNXI_CCU_M_WITH_MUX_GATE(deinterlace_clk,
> > "deinterlace", static SUNXI_CCU_GATE(bus_deinterlace_clk,
> > "bus-deinterlace", "psi-ahb1-ahb2", 0x62c, BIT(0), 0);
> >
> > +/* Keep GPU_CLK divider const to avoid DFS instability. */
> >  static const char * const gpu_parents[] =3D { "pll-gpu" };
> > -static SUNXI_CCU_M_WITH_MUX_GATE(gpu_clk, "gpu", gpu_parents, 0x670,
> > -                                    0, 3,    /* M */
> > +static SUNXI_CCU_MUX_WITH_GATE(gpu_clk, "gpu", gpu_parents, 0x670,
> >                                      24, 1,   /* mux */
> >                                      BIT(31), /* gate */
> >                                      CLK_SET_RATE_PARENT);
> > @@ -1193,6 +1193,16 @@ static int sun50i_h6_ccu_probe(struct platform_d=
evice
> > *pdev) if (IS_ERR(reg))
> >               return PTR_ERR(reg);
> >
> > +     /* Force PLL_GPU output divider bits to 0 */
> > +     val =3D readl(reg + SUN50I_H6_PLL_GPU_REG);
> > +     val &=3D ~BIT(0);
> > +     writel(val, reg + SUN50I_H6_PLL_GPU_REG);
> > +
> > +     /* Force GPU_CLK divider bits to 0 */
> > +     val =3D readl(reg + gpu_clk.common.reg);
> > +     val &=3D ~GENMASK(3, 0);
> > +     writel(val, reg + gpu_clk.common.reg);
> > +
> >       /* Enable the lock bits on all PLLs */
> >       for (i =3D 0; i < ARRAY_SIZE(pll_regs); i++) {
> >               val =3D readl(reg + pll_regs[i]);
> > --
> > 2.34.1
>
>
