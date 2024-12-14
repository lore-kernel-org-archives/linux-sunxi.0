Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5977E78C91
	for <linux-sunxi@lists.linux.dev>; Sat, 14 Dec 2024 07:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734161526; cv=none; b=Obb153iteI+sJfS5a6JzVIgH2G1M2nX4+aw7eDDRWTWZYybDOob8kcw2LONR3MjaNxqvbnceS3M1DBYHnfghMB5Y6kdmG6aSljN7G2acPU7Q5eyjGwzq3c45dbPkZ8ECX3m4hyHC6K2omqGZ5xhXkU/PkKY3D8K8/cecgRhNWkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734161526; c=relaxed/simple;
	bh=Lg6wNxdsLLY5Lp8a+X6uEKzwizIMd2JY0ZlX0WhbW8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tb2qk3GfHJRREAPSD6EY9tLTJCgdg3EzImNXKEuRpBO4DFhqYWDvMxI8mLpyOnNFXAtifCdH3F+GSOQSAgRtuAV6DSDvW+TJYf7nR6X2xQDwmFBptZwqO005uy7FQ0Kxh0Egx4euWeIPf605jMbjch4Od0Y0FNpO54shqGh3sMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvaouWyl; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvaouWyl"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5f2c34ae517so1023613eaf.1
        for <linux-sunxi@lists.linux.dev>; Fri, 13 Dec 2024 23:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734161524; x=1734766324; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wooyMz6V69rOWgXVqv8x+ga9QCy693idFla4iIf30yA=;
        b=jvaouWylSRj44SqixuLIXlqfGx+jnFDYHlXg81ZRPe170ytmNtWCGeOzMqSNX0bTeh
         ZgnG49aC2xj3pCj3ZBYnd0jjemHWTe/wcOeGIGcjYztJhWYBVstu0FccnGQwsN4/SUcL
         Lp2Mfk3In8uy5fRM/BTJp+rBcLfLG9HlvPbH5mSxwCWN6iHaxxW8jKuSSGSaCdckxMF2
         zqRKLWQLDTstLVPoowTYqrAyO2Jh9oeyEvRJng+oLVpXbKn9QUe0vtqb3JSDjw5KcIIs
         AzjdNDguhbvs5SRGQej3mY2lHpvylmBQV9BTzHf/CIIScIpsAk/iBjhKfVZT/Luaf36J
         5DHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734161524; x=1734766324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wooyMz6V69rOWgXVqv8x+ga9QCy693idFla4iIf30yA=;
        b=aEzJjrlc7bwxxxQGtnf0ZZGSOFDaTMoHKMYKYNpnOtbndokpMy3SlHbcACE1pHPHUn
         td1z9sKVUNv2/xEA1QJEjPaSxcJh8AefMymkny0xO6UD38EWHhChZvWI+KUbRLUjXwPc
         GPp23FEBZGCcvCqLJRr53C6xlk7tfTYjpKNr6ArmlqXWcc1XemiM3gx0Jwt2iusjC8l1
         3tvFLndFRRhEXkzNVugBO5VAwbor9SwuEyq9PNuZBSq5um4GwmMpI962UyihkrjMD+Da
         jXiGRt2HSx10jbvtEmD5SfHeCp4SE9qIhpw4t47oZBWBrAejYhBtOFGN0f8pUWxbyza3
         3PBg==
X-Forwarded-Encrypted: i=1; AJvYcCWppXcRhofcuh7vWcir4li1NifADBff866Oaw/r3ozMftpCNZoziHNQaM7jKddp3zkS1UCafBkgbG412Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyabHcUoh/UR6iuFPl6DwSks1TT4f5APBD0rJZwAEDfc7QbcpBx
	7ZqbAlDGyv/hUD/o7GKv9Jwd4U5AcPUZsRx5aoD8Li4CvEMZOjUsvS+2hJkssrmvQ4V4XybDheD
	hYwercHSr7OokK9lPdrKiJ8ykYOc=
X-Gm-Gg: ASbGncuYGme0xwUrT+ddex+H6fYt2qGgAP8vricbjLQWYYNuEko5tR1GY8FlQHPMs4T
	tv9TVOkmBbrrOl1sTa5d07LYrkL4tgemADFySqZUfnAevr38Vs10yJEGh4SBsNCba2kzifDF1
X-Google-Smtp-Source: AGHT+IGmFywcjc7izrlDXgnkzLIqMiL0MnGMAOEArWH0D15iqh0keA0TjPRq8hM4SyuuwLNun7DH3X+llzzdV2xoAhI=
X-Received: by 2002:a05:6870:7011:b0:29e:3d0b:834 with SMTP id
 586e51a60fabf-2a3ac614135mr3251697fac.5.1734161524360; Fri, 13 Dec 2024
 23:32:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230505052110.67514-1-me@crly.cz> <20230505052110.67514-2-me@crly.cz>
 <CA+E=qVcSV7H4=-fT2FUdNd5sneCO0GsA-qKrvQxy8PF89knckw@mail.gmail.com>
In-Reply-To: <CA+E=qVcSV7H4=-fT2FUdNd5sneCO0GsA-qKrvQxy8PF89knckw@mail.gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Fri, 13 Dec 2024 23:31:38 -0800
Message-ID: <CA+E=qVeroOt_L-r--K7uYrS+039x-BtgciVqoez5CmOtmYyqVg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux
To: Roman Beranek <me@crly.cz>
Cc: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Oltmanns <frank@oltmanns.dev>, 
	Icenowy Zheng <icenowy@aosc.io>, Ondrej Jirman <megi@xff.cz>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 10:29=E2=80=AFPM Vasily Khoruzhick <anarsoul@gmail.=
com> wrote:
>
> On Thu, May 4, 2023 at 10:34=E2=80=AFPM Roman Beranek <me@crly.cz> wrote:
> >
> > TCON0's source clock can be fed from either PLL_MIPI, or PLL_VIDEO0(2X)=
,
> > however MIPI DSI output only seems to work when PLL_MIPI is selected an=
d
> > thus the choice must be hardcoded in.
> >
> > Currently, this driver can't propagate rate change from N-K-M clocks
> > (such as PLL_MIPI) upwards. This prevents PLL_VIDEO0 from participating
> > in setting of the TCON0 data clock rate, limiting the precision with
> > which a target pixel clock can be matched.
> >
> > For outputs with fixed TCON0 divider, that is DSI and LVDS, the dotcloc=
k
> > can deviate up to 8% off target.
>
> Hi Roman,
>
> I'm a bit late, but this patch breaks the LCD on Pine64 Pinebook. When
> TCON0 parent is pll-mipi, the panel is blank and I get vblank timeouts.
>
> With this patch reverted it works if I force pll-video-2x as a parent for=
 TCON0.

And changing TCON0 parent in runtime by poking CCU registers also
fixes the issue (even though pll-video-2x is *much* slower than
pll-mipi), i.e. if I do "devmem2 0x01c20118 w 0x82000000" the picture
appears on the screen.

> So for me RGB output doesn't seem to work with PLL_MIPI, but works
> only with PLL_VIDEO0_2X. Any ideas on how to fix it?
>
> Regards,
> Vasily
>
>
>
> > Signed-off-by: Roman Beranek <me@crly.cz>
> > ---
> >  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-=
ng/ccu-sun50i-a64.c
> > index 41519185600a..eb36f8f77d55 100644
> > --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> > @@ -528,11 +528,18 @@ static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de=
_parents,
> >                                  0x104, 0, 4, 24, 3, BIT(31),
> >                                  CLK_SET_RATE_PARENT);
> >
> > +/*
> > + * DSI output seems to work only when PLL_MIPI selected. Set it and pr=
event
> > + * the mux from reparenting.
> > + */
> > +#define SUN50I_A64_TCON0_CLK_REG       0x118
> > +
> >  static const char * const tcon0_parents[] =3D { "pll-mipi", "pll-video=
0-2x" };
> >  static const u8 tcon0_table[] =3D { 0, 2, };
> >  static SUNXI_CCU_MUX_TABLE_WITH_GATE(tcon0_clk, "tcon0", tcon0_parents=
,
> >                                      tcon0_table, 0x118, 24, 3, BIT(31)=
,
> > -                                    CLK_SET_RATE_PARENT);
> > +                                    CLK_SET_RATE_PARENT |
> > +                                    CLK_SET_RATE_NO_REPARENT);
> >
> >  static const char * const tcon1_parents[] =3D { "pll-video0", "pll-vid=
eo1" };
> >  static const u8 tcon1_table[] =3D { 0, 2, };
> > @@ -953,6 +960,11 @@ static int sun50i_a64_ccu_probe(struct platform_de=
vice *pdev)
> >
> >         writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
> >
> > +       /* Set PLL MIPI as parent for TCON0 */
> > +       val =3D readl(reg + SUN50I_A64_TCON0_CLK_REG);
> > +       val &=3D ~GENMASK(26, 24);
> > +       writel(val | (0 << 24), reg + SUN50I_A64_TCON0_CLK_REG);
> > +
> >         ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_a64_ccu_d=
esc);
> >         if (ret)
> >                 return ret;
> > --
> > 2.32.0 (Apple Git-132)
> >
> >
