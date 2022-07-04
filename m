Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BB523B5
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Jul 2022 09:54:18 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id c13so9186183qtq.10
        for <linux-sunxi@lists.linux.dev>; Mon, 04 Jul 2022 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=X7lOi81P59ly9ir3hSSgOlWUEInjdlF70ZZwXlUo5lM=;
        b=msoEig4U8+Wv0IfCSOlrgbLo1GqcbEggRdXkihILPsUPLrMdElICAReNnVoIymBhPu
         JU+0+zzxuf+rLJeV1iURziXNWAO8XJZEuaY7vS9+I+sklnva1Miua1E3y1Ao3259Bmju
         lI/Eidvu2KbVx7LHK9Q56BYbkpj0id7TZIHQX5MNZ6JXjlkD5+hAaQ2m0TiChHr1jOZu
         VxRrTgu7wKg2K5rKRMJTRKVHkXOIcP60odbYEXmsVcHBdil+KdCh4DuIjHxVmO+jwxmK
         QYJeG6kchVD+tkwfPMhjoPVBhAyMEQkBrX2hxgQDqiO/14J2DvvR9IFUJJkBwBbfQlpz
         eRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=X7lOi81P59ly9ir3hSSgOlWUEInjdlF70ZZwXlUo5lM=;
        b=id3zs17OWEvgIR90EGQOtFPkzBeeT1Pw4I6FnAzHV4dux7qCRpFPfNTGbMWQdq9S5l
         Pu1qNPpDujj3fBHwVGYJBhb2xz2aSl+sv6ZVs8jIkQFQmAdR2TfcZNiZFj7CZGDwuOVm
         AYTCKspjZr5fxkDEkxJDoF+myUKUf09TiPhw2SyKCobHaYxP4HVcwMjJ2Od+Zz/4sxiK
         qcyild/skLyEazd+HHCiln+Oitp4CHgNqUETKvcKXfyBti4dZHFN35KBV7A7sLafhaDS
         vM7Fq7s+Zu96tis9r/MGhISfCiUxUEWjrXh0BftH+04+ZT2NcDxcq0ptjbQBkp92SHT/
         RKbg==
X-Gm-Message-State: AJIora9i8HTGIvrVg8x9fTXmnOHcHtBL902X5FI2NaC99NLgCFBA93Kz
	vLWuvoHz7aYhYmmrLDB0pfjM87yukRvQevS952c=
X-Google-Smtp-Source: AGRyM1slolnfNRgOC1R7OhRtfrl16gq/iOANRScnGb/c5y+GYR79aEUgM6JCS+GrHwJbvODA3pyErjcLAbtCSZc4rrk=
X-Received: by 2002:ad4:5c64:0:b0:472:f016:bfde with SMTP id
 i4-20020ad45c64000000b00472f016bfdemr6046629qvh.52.1656928457116; Mon, 04 Jul
 2022 02:54:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220703164514.308622-1-r.stratiienko@gmail.com> <4748270.31r3eYUQgx@jernej-laptop>
In-Reply-To: <4748270.31r3eYUQgx@jernej-laptop>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Mon, 4 Jul 2022 12:54:06 +0300
Message-ID: <CAGphcdkZzjw-6oSnpiDM5YgPkuSV3VPX4nKo_FfPeg36MzT8Ew@mail.gmail.com>
Subject: Re: [PATCH v2] clk: sunxi-ng: sun50i: h6: Modify GPU clock
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

=D0=B2=D1=81, 3 =D0=B8=D1=8E=D0=BB. 2022 =D0=B3. =D0=B2 21:43, Jernej =C5=
=A0krabec <jernej.skrabec@gmail.com>:
>
> Dne nedelja, 03. julij 2022 ob 18:45:14 CEST je Roman Stratiienko napisal=
(a):
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
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
> > b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c index 2ddf0a0da526f..1b0205ff241=
08
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
>
> Having minimum (288 MHz) as per vendor GPU driver and maximum, either max=
. opp
> or max. from datasheet is equally good. I know that both are basically li=
mited
> with opp table, but people like to play with these, so it's good to have =
them
> in.
>
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
> > +     /* Force PLL_GPU output divider to 0 */
>
> Divider  0 here
>
> > +     val =3D readl(reg + SUN50I_H6_PLL_GPU_REG);
> > +     val &=3D ~BIT(0);
> > +     writel(val, reg + SUN50I_H6_PLL_GPU_REG);
> > +
> > +     /* Force GPU_CLK divider to 0 */
>
> and here sounds wrong, since division by zero is not defined. Using 1 is =
more
> intuitive and correct, since that's what HW actually uses.
>

You're right but a few lines below there is already a similar message
(see below) , so I used similar formulation to avoid confusion.

        /*
         * Force the output divider of video PLLs to 0.
         *
         * See the comment before pll-video0 definition for the reason.
         */

> Patch looks good otherwise.

May I have your r-b?

Best regards,
Roman

>
> Best regards,
> Jernej
>
> > +     val =3D readl(reg + gpu_clk.common.reg);
> > +     val &=3D ~GENMASK(3, 0);
> > +     writel(val, reg + gpu_clk.common.reg);
> > +
> >       /* Enable the lock bits on all PLLs */
> >       for (i =3D 0; i < ARRAY_SIZE(pll_regs); i++) {
> >               val =3D readl(reg + pll_regs[i]);
>
>
>
>
