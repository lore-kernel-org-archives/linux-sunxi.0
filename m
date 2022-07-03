Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF7223A7
	for <linux-sunxi@lists.linux.dev>; Sun,  3 Jul 2022 16:40:45 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id r2so6809672qta.0
        for <linux-sunxi@lists.linux.dev>; Sun, 03 Jul 2022 09:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=u+xp3Xfhyj2h4RiBWfUaXw+nD5F3F1r+zubvc/HCtbA=;
        b=LbImrogi+bqI75rGwVoqt0WTJicx+TayHHFvqZGm4bzGI8V2mSRzvhKqIcwNGsliEr
         5o76i7zSp6MxdVeYNN0ymCH2FAUe78Y+iXGKPmfWdTGKVQAx0D+/4jkdnPTt34rAe5ng
         NnryDbmvAGwuKcD+WTPp8zWohL5CB3MQjiHt4/F+ofQzhsKWDGsGzJp/7G4S/dx2RuEp
         ZWhLznwLiGV7Cc9t0cC9j4RFt0osY0oOeLCncdtD2wdcEw9wmiU7PRj5w+s75Hb4KshI
         9oFnN6SmB5BhrdyD3Y0hYsMHern2SjV43VOfS/4YD+t4wA+auEtDn9ouJuHWs0GAMLTY
         UI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u+xp3Xfhyj2h4RiBWfUaXw+nD5F3F1r+zubvc/HCtbA=;
        b=0504WBr558Kqp9KlWnICVF4z+WNL55jTPVr1+WuC6qY+L3fUuFxNgfMC86y0dxLc6Q
         N2BxX3yP6OTMCPwUdsSPD8bPoamW8L9RSJF58d7OCgGYIYA1ce3Wssuir1XH6Nv9hUVn
         d5dLBexmbdkPowdhWuSbt1phcOlvOm1G3bfwI68PR9VtaxxKbqwq4c/Iip3cxqz9MKyK
         scDie5l3S/nz4YNTNX3NYSpqA7Tmvliw1u8nuRBDxaVRxfiSPAfqvQhc5gbV6I8hOfih
         c7L6HCSUfLwwBZWGD7iIpQKIr1kLFZ4p/YZp+GxIa+zi8y+jgScBcUKxJ8B8PDVBKOzt
         sMNQ==
X-Gm-Message-State: AJIora9QmNZmxknIq8v07ptqg0pPMX1xF+4tWmvwdrFJbKE6AlF5NpdE
	sLAM77uDKj/TN3BSGGAA/GBmy7X5xWZ7W51tlHk=
X-Google-Smtp-Source: AGRyM1uqIs5zlJ7pA8AgTCinVpHPprrG2MifKpTo7bv68esmtiwbtHp41axO/DvFKSeoHmQFgEqXL/uP+faEtICti3c=
X-Received: by 2002:ad4:5c64:0:b0:472:f016:bfde with SMTP id
 i4-20020ad45c64000000b00472f016bfdemr3864305qvh.52.1656866444208; Sun, 03 Jul
 2022 09:40:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220624165211.4318-1-r.stratiienko@gmail.com> <e5837e14-739e-5137-7398-3acfc8a54b84@sholland.org>
In-Reply-To: <e5837e14-739e-5137-7398-3acfc8a54b84@sholland.org>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Sun, 3 Jul 2022 19:40:33 +0300
Message-ID: <CAGphcd=BKWxOj0bdN386S+KPF=nRiug9hX51gOJAib7u0hdjXw@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: sun50i: h6: Modify GPU clock configuration
 to support DFS
To: Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
	=?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org, mripard@kernel.org, 
	wens@csie.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Samuel,

Thanks for having a look.

=D0=B2=D1=81, 3 =D0=B8=D1=8E=D0=BB. 2022 =D0=B3. =D0=B2 09:50, Samuel Holla=
nd <samuel@sholland.org>:
>
> On 6/24/22 11:52 AM, Roman Stratiienko wrote:
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
> >
> > | Register  | Name           | Bits  | Values | Result |
> > | --        | --             | --    | --     | --     |
> > | 0x3001030 | GPU_PLL.MULT   | 15..8 | 20-62  | OK     |
> > | 0x3001030 | GPU_PLL.INDIV  |     1 | 0-1    | OK     |
> > | 0x3001030 | GPU_PLL.OUTDIV |     0 | 0-1    | FAIL   |
> > | 0x3001670 | GPU_CLK.DIV    |  3..0 | ANY    | FAIL   |
> >
> > Once bits that caused system failure disabled (kept default 0),
> > it was discovered that GPU_CLK.MUX was used during DFS for some
> > reason and was causing the failure too.
>
> The GPU module clock has only one parent declared, so it is surprising th=
at the
> mux would get set. Did this happen while the kernel driver was changing t=
he
> frequency?

I looked through the ccu code and didn't see anything that may cause
issues, so I tested again and DFS works with MUX this time.

I'll drop this change in v2.

>
> > After disabling GPU_PLL.OUTDIV the system started to fail during
> > booting for some reason until the maximum frequency of GPU_PLL
> > clock was limited to 756MHz.
>
> The manual lists PLL_GPU's maximum frequency as 800 MHz. I assume you cho=
se 756
> MHz because that is the highest OPP. That should be okay, too.

Setting the frequency higher than 756 makes the GPU very unstable.

I decided to validate it again and removed the frequency limitation
and can't see any issues so far.

I'll also drop this change in v2.

>
> > After all the changes made DVFS started to work seamlessly.
> >
> > Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-h6.c
> > index 2ddf0a0da526f..d941238cd178a 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
> > @@ -95,13 +95,14 @@ static struct ccu_nkmp pll_periph1_clk =3D {
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
> > -     .p              =3D _SUNXI_CCU_DIV(0, 1), /* output divider */
> > +     .max_rate       =3D 756000000UL,
> >       .common         =3D {
> >               .reg            =3D 0x030,
> >               .hw.init        =3D CLK_HW_INIT("pll-gpu", "osc24M",
> > @@ -294,12 +295,9 @@ static SUNXI_CCU_M_WITH_MUX_GATE(deinterlace_clk, =
"deinterlace",
> >  static SUNXI_CCU_GATE(bus_deinterlace_clk, "bus-deinterlace", "psi-ahb=
1-ahb2",
> >                     0x62c, BIT(0), 0);
> >
> > -static const char * const gpu_parents[] =3D { "pll-gpu" };
> > -static SUNXI_CCU_M_WITH_MUX_GATE(gpu_clk, "gpu", gpu_parents, 0x670,
> > -                                    0, 3,    /* M */
> > -                                    24, 1,   /* mux */
> > -                                    BIT(31), /* gate */
> > -                                    CLK_SET_RATE_PARENT);
> > +/* GPU_CLK divider kept disabled to avoid interferences with DFS */
> > +static SUNXI_CCU_GATE(gpu_clk, "gpu", "pll-gpu", 0x670,
> > +                   BIT(31), CLK_SET_RATE_PARENT);
>
> These changes look fine to me. You also need to set the initial value for=
 the
> fixed fields in the driver's probe function.

Will do that in v2.

I have no idea what was causing additional issues in my previous test
session. Let's forget about them for now.

Regards,
Roman.

>
> Regards,
> Samuel
