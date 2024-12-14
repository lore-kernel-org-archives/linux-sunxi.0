Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1B780BEC
	for <linux-sunxi@lists.linux.dev>; Sat, 14 Dec 2024 06:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734157821; cv=none; b=MfPUShN/ylw96klXyi7NseCnbl+FZcKXjmK5D5pjZsIe9R0vCt0kDxIxf9W3CbV/VY/PWAEbo0sSqOUB7+5XlkUe4+L0zAeXuvaU0wkJLCeWZRnxC9gKFF1Xsirvn+LvXQfAm/20nt4OPwziTzg9OG0SdW5JWf3Y7Sxkd3Rda88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734157821; c=relaxed/simple;
	bh=ADdPyPpCiXUVsD/OBnMYzHixrDkS5BuxYN+fUPpmaQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f65XQAdv9oSGkxGyG473Z0ZyU5FdQFiXfNF21Xrenkv11/0jQQtf4qgH2lEZhfOPGxlQNJmNbrolFsNqKB77gSehMLlrNbaMOiDCTXgFAPeE2/S/o6rult8IDou8sk7kqPbgGvoo7QotBo21Bk6ZhBzR1XjikGtPTtx4uXXVGxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOrAF0U7; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOrAF0U7"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5f2c34ae517so1010977eaf.1
        for <linux-sunxi@lists.linux.dev>; Fri, 13 Dec 2024 22:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734157817; x=1734762617; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrI8qCQN85qm0XYiJc+jVTuy93Oh6KAdPLxuWkpi6aM=;
        b=fOrAF0U7ul9OGDAOfRSp7g2Wc3qpYBkkSkfwetTx7PkxGl5z3T7Z27cuUrQ5CQkTZP
         m12HYef2x8Vt6ZlvRt3w+2bvCs5ddL6zBN+LfWKi3orJo3QuNkFnCo7VpIfn/qWssnLl
         jLMS/xIgVVtakWZM0jtV+nVZuwADDvDpaCo0VyHQqfn6UyqvnpIqVmWXRe1aHCCGa5zj
         xZU8ukpZMaBjx3XdGURUWxY9GZTzH1ySFpBHv9o2zwX4+K1+E1ZxBxjpww1pzpgPP8pl
         oEyoHMMAoTnQT6tcMy4si9vdZficJsOMyc4Gz0nDBbTv6Pt4iZgKysAigvQ/Ww1jQOxb
         ChRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734157817; x=1734762617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrI8qCQN85qm0XYiJc+jVTuy93Oh6KAdPLxuWkpi6aM=;
        b=lvjzPbkUnsYONrIzY7Wch589vdNiAfrC/AC1XdRctSPzEBPs7/Qsi53n+YORhvaD3J
         aki47IkjOENYn6Ry+R6ewjykEgI0AloG2LOoIl87Sv9Y9ZhtJw3VRhYxOm+LYbBqY3GA
         m5JYcNCi7f8C03cN/yeUj+fEXedb4Zj+gv1DX0WLAwyPw1aTV/UP/4VBri5yDxQj4IWO
         x3+JjzCprg6ykr2jtCLiquwji5siOaavmj134/swDy36vVESEgZc1a1YkkXoz7K/Zrhd
         610YdMXkJivcl0PWhvQQl3ueoyndDcju1OsMx420jz4PQNvHJFChUA2UWNLfnQRk7dae
         GCWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUotEiX9rxSADevQRBMdC5fEHixFsgGBKBcU98vn0V/RNbCdOtLO7a8rrSVRu1E8TlUyB1Fwl6lFcnHzQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIT7T5ONEgnT7ugKbSVC8zc2ppUPKJHwRnYglZI0r/1+uzzTVk
	ciiQFtzQgcK2jtgGrptsEvLNadzLfiXjiPxwqsmOyH/ipMWvQBJPRaKcUv425yu6fPLRNy8yCDr
	FycmhYaRzJFWS8JZu8CXvFmX8PFQ=
X-Gm-Gg: ASbGncsso6Ok7OJ4ypEQ4DVgh1IN1ukT39u40mlMKfYHSt+yu7N7bx2KrjD5PLUylBX
	fiJLXnlY+9hsdOj4G36SGJ69N2UheJ2MEhOphDkEg4gMeybn01Onc2NN2HtRhPsK1sQnzepAh
X-Google-Smtp-Source: AGHT+IEPJNPA+UMoRL6Nd8OnH+KQK573OcmBMtIxEoDNfscNNNsJvvjIErYdh1Oh7XBBo4k+5gmKzsFAb+yk48Ks7y8=
X-Received: by 2002:a05:6870:828a:b0:29e:255e:9540 with SMTP id
 586e51a60fabf-2a3aca46b43mr2859925fac.35.1734157817408; Fri, 13 Dec 2024
 22:30:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230505052110.67514-1-me@crly.cz> <20230505052110.67514-2-me@crly.cz>
In-Reply-To: <20230505052110.67514-2-me@crly.cz>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Fri, 13 Dec 2024 22:29:51 -0800
Message-ID: <CA+E=qVcSV7H4=-fT2FUdNd5sneCO0GsA-qKrvQxy8PF89knckw@mail.gmail.com>
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

On Thu, May 4, 2023 at 10:34=E2=80=AFPM Roman Beranek <me@crly.cz> wrote:
>
> TCON0's source clock can be fed from either PLL_MIPI, or PLL_VIDEO0(2X),
> however MIPI DSI output only seems to work when PLL_MIPI is selected and
> thus the choice must be hardcoded in.
>
> Currently, this driver can't propagate rate change from N-K-M clocks
> (such as PLL_MIPI) upwards. This prevents PLL_VIDEO0 from participating
> in setting of the TCON0 data clock rate, limiting the precision with
> which a target pixel clock can be matched.
>
> For outputs with fixed TCON0 divider, that is DSI and LVDS, the dotclock
> can deviate up to 8% off target.

Hi Roman,

I'm a bit late, but this patch breaks the LCD on Pine64 Pinebook. When
TCON0 parent is pll-mipi, the panel is blank and I get vblank timeouts.

With this patch reverted it works if I force pll-video-2x as a parent for T=
CON0.

So for me RGB output doesn't seem to work with PLL_MIPI, but works
only with PLL_VIDEO0_2X. Any ideas on how to fix it?

Regards,
Vasily



> Signed-off-by: Roman Beranek <me@crly.cz>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng=
/ccu-sun50i-a64.c
> index 41519185600a..eb36f8f77d55 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> @@ -528,11 +528,18 @@ static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_p=
arents,
>                                  0x104, 0, 4, 24, 3, BIT(31),
>                                  CLK_SET_RATE_PARENT);
>
> +/*
> + * DSI output seems to work only when PLL_MIPI selected. Set it and prev=
ent
> + * the mux from reparenting.
> + */
> +#define SUN50I_A64_TCON0_CLK_REG       0x118
> +
>  static const char * const tcon0_parents[] =3D { "pll-mipi", "pll-video0-=
2x" };
>  static const u8 tcon0_table[] =3D { 0, 2, };
>  static SUNXI_CCU_MUX_TABLE_WITH_GATE(tcon0_clk, "tcon0", tcon0_parents,
>                                      tcon0_table, 0x118, 24, 3, BIT(31),
> -                                    CLK_SET_RATE_PARENT);
> +                                    CLK_SET_RATE_PARENT |
> +                                    CLK_SET_RATE_NO_REPARENT);
>
>  static const char * const tcon1_parents[] =3D { "pll-video0", "pll-video=
1" };
>  static const u8 tcon1_table[] =3D { 0, 2, };
> @@ -953,6 +960,11 @@ static int sun50i_a64_ccu_probe(struct platform_devi=
ce *pdev)
>
>         writel(0x515, reg + SUN50I_A64_PLL_MIPI_REG);
>
> +       /* Set PLL MIPI as parent for TCON0 */
> +       val =3D readl(reg + SUN50I_A64_TCON0_CLK_REG);
> +       val &=3D ~GENMASK(26, 24);
> +       writel(val | (0 << 24), reg + SUN50I_A64_TCON0_CLK_REG);
> +
>         ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_a64_ccu_des=
c);
>         if (ret)
>                 return ret;
> --
> 2.32.0 (Apple Git-132)
>
>
