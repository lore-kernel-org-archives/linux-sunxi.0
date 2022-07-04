Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBE07E
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Jul 2022 17:34:47 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id fw3so17793380ejc.10
        for <linux-sunxi@lists.linux.dev>; Mon, 04 Jul 2022 10:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ntBm6YCFWqLI4Jifkq6aFgvski3omE1H3bv/CSOM6qc=;
        b=GBdC6pzu8EVPLJsIQoXp6zsx2jlrJ1iJYDMhew3YhI2Qnefslog6Cdt9VHCB1jXfhx
         Kl83bPB0vUeztwq4AxjwuigD4W2P042Q3AhnfVpPkgWhaeUFFFXOhdtJ9s2iIC2C2Myk
         7O3dUitydNGfxsHYB1Iyi6DWJII9j8zO/Qyr7+/uCoxobq/B8tK2FFY3Pc7v/OsQQ0sd
         sy4Els9NRE3Cc0PnWIGs4pHhjc0HX6RREyczs9FAE86SrAqJdRKvRg3NoqPQSSRFAvSz
         kkK3DjCrcnazJnXRxFms5KnshcklxLNX5g+uNsfzy02Ioleh5mjOZb5YjIhvt4qJwCHG
         sdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ntBm6YCFWqLI4Jifkq6aFgvski3omE1H3bv/CSOM6qc=;
        b=XAZi7F/wKijQeJT91DWHeLH7v5EqcnXebFF4grAO8cka/MzK0JjOyzare6YR989WbT
         FkV0JkVPDDo5h93EcmqXLQ25VuSkr3i1cStk4MQ8ZMXsQHtJAXNzaLx1d6Mx3G7/hNUU
         wG6A88mX3K0b/OBRCWB6Lw7mfxu6xHS2oYCOkeLK6+YCx0ejo82mgUmfj0IhfzxJSK8z
         ZVDXji1DQdlf+dZfr+fIIvGPi00ebfEVGi2sERpqo8oOAbltOq9f72/ZmbqeInvUo3r1
         Cn4d72e7ckyOs9fZ2j0Kvdm8jZEOS+fyNh/owMGGy5yyLA0OVIQLqRcDi3kX2QOiNV3I
         rlIw==
X-Gm-Message-State: AJIora8kr/feNmXpAW4Sha4yrIdY1UgYFRZIgWKLPUBTgrdKqporigd0
	cKJx7RpulFJ7W0lxFCL+Bow=
X-Google-Smtp-Source: AGRyM1tzYdkegf4LD5FIRjzUzy9j+x4YZaeYS0wfjBi2wCjFHJYvDlyuaC02znpDLDcaFLbuQAwtng==
X-Received: by 2002:a17:906:5055:b0:6ff:1dfb:1e2c with SMTP id e21-20020a170906505500b006ff1dfb1e2cmr13791384ejk.200.1656956085385;
        Mon, 04 Jul 2022 10:34:45 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id s16-20020a170906455000b00722bc0aa9e3sm8201642ejq.162.2022.07.04.10.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 10:34:44 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Roman Stratiienko <r.stratiienko@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>, Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org, mripard@kernel.org, wens@csie.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH v2] clk: sunxi-ng: sun50i: h6: Modify GPU clock configuration to support DFS
Date: Mon, 04 Jul 2022 19:34:43 +0200
Message-ID: <5835545.lOV4Wx5bFT@kista>
In-Reply-To: <CAGphcdkZzjw-6oSnpiDM5YgPkuSV3VPX4nKo_FfPeg36MzT8Ew@mail.gmail.com>
References: <20220703164514.308622-1-r.stratiienko@gmail.com> <4748270.31r3eYUQgx@jernej-laptop> <CAGphcdkZzjw-6oSnpiDM5YgPkuSV3VPX4nKo_FfPeg36MzT8Ew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne ponedeljek, 04. julij 2022 ob 11:54:06 CEST je Roman Stratiienko=20
napisal(a):
> Hi Jernej,
>=20
> =D0=B2=D1=81, 3 =D0=B8=D1=8E=D0=BB. 2022 =D0=B3. =D0=B2 21:43, Jernej =C5=
=A0krabec <jernej.skrabec@gmail.com>:
> >
> > Dne nedelja, 03. julij 2022 ob 18:45:14 CEST je Roman Stratiienko=20
napisal(a):
> > > Using simple bash script it was discovered that not all CCU registers
> > > can be safely used for DFS, e.g.:
> > >
> > >     while true
> > >     do
> > >         devmem 0x3001030 4 0xb0003e02
> > >         devmem 0x3001030 4 0xb0001e02
> > >     done
> > >
> > > Script above changes the GPU_PLL multiplier register value. While the
> > > script is running, the user should interact with the user interface.
> > >
> > > Using this method the following results were obtained:
> > > | Register  | Name           | Bits  | Values | Result |
> > > | --        | --             | --    | --     | --     |
> > > | 0x3001030 | GPU_PLL.MULT   | 15..8 | 20-62  | OK     |
> > > | 0x3001030 | GPU_PLL.INDIV  |     1 | 0-1    | OK     |
> > > | 0x3001030 | GPU_PLL.OUTDIV |     0 | 0-1    | FAIL   |
> > > | 0x3001670 | GPU_CLK.DIV    |  3..0 | ANY    | FAIL   |
> > >
> > > DVFS started to work seamlessly once dividers which caused the
> > > glitches were set to fixed values.
> > >
> > > Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
> > >
> > > ---
> > >
> > > Changelog:
> > >
> > > V2:
> > > - Drop changes related to mux
> > > - Drop frequency limiting
> > > - Add unused dividers initialization
> > > ---
> > >  drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 16 +++++++++++++---
> > >  1 file changed, 13 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
> > > b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c index 2ddf0a0da526f..1b0205ff2=
4108
> > > 100644
> > > --- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
> > > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
> > > @@ -95,13 +95,13 @@ static struct ccu_nkmp pll_periph1_clk =3D {
> > >       },
> > >  };
> > >
> > > +/* For GPU PLL, using an output divider for DFS causes system to fai=
l=20
*/
> > >  #define SUN50I_H6_PLL_GPU_REG                0x030
> > >  static struct ccu_nkmp pll_gpu_clk =3D {
> > >       .enable         =3D BIT(31),
> > >       .lock           =3D BIT(28),
> > >       .n              =3D _SUNXI_CCU_MULT_MIN(8, 8, 12),
> > >       .m              =3D _SUNXI_CCU_DIV(1, 1), /* input divider */
> > > -     .p              =3D _SUNXI_CCU_DIV(0, 1), /* output divider
> > */
> >
> > Having minimum (288 MHz) as per vendor GPU driver and maximum, either m=
ax.=20
opp
> > or max. from datasheet is equally good. I know that both are basically=
=20
limited
> > with opp table, but people like to play with these, so it's good to hav=
e=20
them
> > in.
> >
> > >       .common         =3D {
> > >               .reg            =3D 0x030,
> > >               .hw.init        =3D CLK_HW_INIT("pll-gpu", "osc24M",
> > > @@ -294,9 +294,9 @@ static SUNXI_CCU_M_WITH_MUX_GATE(deinterlace_clk,
> > > "deinterlace", static SUNXI_CCU_GATE(bus_deinterlace_clk,
> > > "bus-deinterlace", "psi-ahb1-ahb2", 0x62c, BIT(0), 0);
> > >
> > > +/* Keep GPU_CLK divider const to avoid DFS instability. */
> > >  static const char * const gpu_parents[] =3D { "pll-gpu" };
> > > -static SUNXI_CCU_M_WITH_MUX_GATE(gpu_clk, "gpu", gpu_parents, 0x670,
> > > -                                    0, 3,    /* M */
> > > +static SUNXI_CCU_MUX_WITH_GATE(gpu_clk, "gpu", gpu_parents, 0x670,
> > >                                      24, 1,   /* mux */
> > >                                      BIT(31), /* gate */
> > >                                      CLK_SET_RATE_PARENT);
> > > @@ -1193,6 +1193,16 @@ static int sun50i_h6_ccu_probe(struct=20
platform_device
> > > *pdev) if (IS_ERR(reg))
> > >               return PTR_ERR(reg);
> > >
> > > +     /* Force PLL_GPU output divider to 0 */
> >
> > Divider  0 here
> >
> > > +     val =3D readl(reg + SUN50I_H6_PLL_GPU_REG);
> > > +     val &=3D ~BIT(0);
> > > +     writel(val, reg + SUN50I_H6_PLL_GPU_REG);
> > > +
> > > +     /* Force GPU_CLK divider to 0 */
> >
> > and here sounds wrong, since division by zero is not defined. Using 1 i=
s=20
more
> > intuitive and correct, since that's what HW actually uses.
> >
>=20
> You're right but a few lines below there is already a similar message
> (see below) , so I used similar formulation to avoid confusion.

Right. But there is another block of code below:

/*
 * Force the post-divider of pll-audio to 12 and the output divider
 * of it to 2, so 24576000 and 22579200 rates can be set exactly.
 */
=2E..
writel(val | (11 << 16) | BIT(0), reg + SUN50I_H6_PLL_AUDIO_REG);

Let's follow better practice. Eventually video PLL comment should be fixed =
by=20
somebody.

>=20
>         /*
>          * Force the output divider of video PLLs to 0.
>          *
>          * See the comment before pll-video0 definition for the reason.
>          */
>=20
> > Patch looks good otherwise.
>=20
> May I have your r-b?

Yes.

Best regards,
Jernej

>=20
> Best regards,
> Roman
>=20
> >
> > Best regards,
> > Jernej
> >
> > > +     val =3D readl(reg + gpu_clk.common.reg);
> > > +     val &=3D ~GENMASK(3, 0);
> > > +     writel(val, reg + gpu_clk.common.reg);
> > > +
> > >       /* Enable the lock bits on all PLLs */
> > >       for (i =3D 0; i < ARRAY_SIZE(pll_regs); i++) {
> > >               val =3D readl(reg + pll_regs[i]);
> >
> >
> >
> >
>=20


