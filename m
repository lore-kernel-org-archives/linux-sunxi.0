Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CC316C688
	for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 16:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716912147; cv=none; b=jXkw5lN2Ge71LGPbZXc4zm7R7V8rZRqTGnZrHAPRe8Q7JQtzysaLTEKGOc5FN/GnCfQ585wMm/BuFtUAeFvtCnL5JO+hoGD6eFdNjzGBZyIKJ0cLXlxPU5oNueT551roYFSjLtH/6CL/AAy/f7SIKQZxy2HikqdbhwI4XLjQ/Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716912147; c=relaxed/simple;
	bh=PVuj5rFCliF+u/3zJ7QQt1qiJY877vkoKGoL5TRFv4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=frQyB1I+cQTVaaZarTOUSEFK3nfUZ8wve2RWZTafWCC5yl6Ml8toKre6t+TCPIJ05Qbj4S0OarfqIckz0DGKkEMz6rJa5C1BM+wVdJ9+g/dPUVR4iMIx4ainfTsDsv/2K7sNZdovldT57TSAk9qO5kmlGVUpA0KgTTSo/CviCMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so10388831fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 09:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716912141; x=1717516941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rW1DfIrslvUajUL20RbbzHp2H1UTzX7uBVMdLPKtXew=;
        b=PfPTjnZY0r1Mddg+vJ7rS0AjRDnw9MLDsy5sZDvKIQdbvDJnU5qOdEP4e7lBlUuXBO
         9GI/lBzYfNNQ7I3lfC/MVc3owQXj0H+HjleDvaXYN9c4sJ2gkyRYqSyfQ3IqWJaRzA3l
         EfdBBGB0JnQ0TzZDQ2Co7hOn61q3gZa3IVFev9xC2FAd/ocNCLBWFfugIhc8DRtysyUm
         6w55hbDD9AUnIN50LjOK/Y+1PHPrQL8Hy8pW+UN6BohENVjRmzCt6edFvfRZLHZSywVz
         W+8ECdiYgvSWPp+BvNZtiK6M5Srq/BjO3tw4dbeq6tkehBrcffaO4k2QdnTi8jBQvboF
         I8Ag==
X-Gm-Message-State: AOJu0YztOjDGxNlOyifX2qP4Cyu9gi9+sL5K9EOF1sNCDXrwB/XzV9/8
	hYlWvLRQqTMh11gBXHX6k+l0GtiUz4rrSi73ajM3WtHWWeOZU6tXZ2QQgqaF
X-Google-Smtp-Source: AGHT+IEyhaLmICRg5thFLdmvey9TmLI6umcBwYSd9ZFrz2lyBsKp8FwMHW2eUPFVuzhilC0WUcjvyA==
X-Received: by 2002:a05:6512:3246:b0:523:963b:3a1a with SMTP id 2adb3069b0e04-52964ea972bmr7336425e87.17.1716912141405;
        Tue, 28 May 2024 09:02:21 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52970c33178sm980418e87.211.2024.05.28.09.02.21
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 09:02:21 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e78fe9fc2bso13726861fa.3
        for <linux-sunxi@lists.linux.dev>; Tue, 28 May 2024 09:02:21 -0700 (PDT)
X-Received: by 2002:a05:651c:234:b0:2e9:8471:f88e with SMTP id
 38308e7fff4ca-2e98471fd3cmr25105761fa.19.1716912140547; Tue, 28 May 2024
 09:02:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240417170423.20640-1-macroalpha82@gmail.com> <20240417170423.20640-2-macroalpha82@gmail.com>
In-Reply-To: <20240417170423.20640-2-macroalpha82@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 29 May 2024 00:02:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v67rqiCA=fwk9USr4-xh3uRGxQ-p_f+--Ui5vVBnb10QQA@mail.gmail.com>
Message-ID: <CAGb2v67rqiCA=fwk9USr4-xh3uRGxQ-p_f+--Ui5vVBnb10QQA@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: sunxi-ng: h616: Add clock/reset for GPADC
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-iio@vger.kernel.org, p.zabel@pengutronix.de, 
	sboyd@kernel.org, mturquette@baylibre.com, samuel@sholland.org, 
	jernej.skrabec@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 1:04=E2=80=AFAM Chris Morgan <macroalpha82@gmail.co=
m> wrote:
>
> From: Chris Morgan <macromorgan@hotmail.com>
>
> Add the GPADC required clock and reset which is used for the onboard
> GPADC.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c      | 5 +++++
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.h      | 2 +-


>  include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
>  include/dt-bindings/reset/sun50i-h616-ccu.h | 1 +

These need an Ack from the DT binding maintainers. And it's better to
split these into a separate patch.

ChenYu

>  4 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-h616.c
> index 21e918582aa5..3646be2b88ab 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -489,6 +489,8 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(ts_clk, "ts", ts_pa=
rents, 0x9b0,
>
>  static SUNXI_CCU_GATE(bus_ts_clk, "bus-ts", "ahb3", 0x9bc, BIT(0), 0);
>
> +static SUNXI_CCU_GATE(bus_gpadc_clk, "bus-gpadc", "apb1", 0x9ec, BIT(0),=
 0);
> +
>  static SUNXI_CCU_GATE(bus_ths_clk, "bus-ths", "apb1", 0x9fc, BIT(0), 0);
>
>  static const char * const audio_parents[] =3D { "pll-audio-1x", "pll-aud=
io-2x",
> @@ -807,6 +809,7 @@ static struct ccu_common *sun50i_h616_ccu_clks[] =3D =
{
>         &bus_emac1_clk.common,
>         &ts_clk.common,
>         &bus_ts_clk.common,
> +       &bus_gpadc_clk.common,
>         &bus_ths_clk.common,
>         &spdif_clk.common,
>         &bus_spdif_clk.common,
> @@ -940,6 +943,7 @@ static struct clk_hw_onecell_data sun50i_h616_hw_clks=
 =3D {
>                 [CLK_BUS_EMAC1]         =3D &bus_emac1_clk.common.hw,
>                 [CLK_TS]                =3D &ts_clk.common.hw,
>                 [CLK_BUS_TS]            =3D &bus_ts_clk.common.hw,
> +               [CLK_BUS_GPADC]         =3D &bus_gpadc_clk.common.hw,
>                 [CLK_BUS_THS]           =3D &bus_ths_clk.common.hw,
>                 [CLK_SPDIF]             =3D &spdif_clk.common.hw,
>                 [CLK_BUS_SPDIF]         =3D &bus_spdif_clk.common.hw,
> @@ -1021,6 +1025,7 @@ static struct ccu_reset_map sun50i_h616_ccu_resets[=
] =3D {
>         [RST_BUS_EMAC0]         =3D { 0x97c, BIT(16) },
>         [RST_BUS_EMAC1]         =3D { 0x97c, BIT(17) },
>         [RST_BUS_TS]            =3D { 0x9bc, BIT(16) },
> +       [RST_BUS_GPADC]         =3D { 0x9ec, BIT(16) },
>         [RST_BUS_THS]           =3D { 0x9fc, BIT(16) },
>         [RST_BUS_SPDIF]         =3D { 0xa2c, BIT(16) },
>         [RST_BUS_DMIC]          =3D { 0xa4c, BIT(16) },
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h b/drivers/clk/sunxi-n=
g/ccu-sun50i-h616.h
> index fdd2f4d5103f..a75803b49f6a 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
> @@ -51,6 +51,6 @@
>
>  #define CLK_BUS_DRAM           56
>
> -#define CLK_NUMBER             (CLK_PLL_SYSTEM_32K + 1)
> +#define CLK_NUMBER             (CLK_BUS_GPADC + 1)
>
>  #endif /* _CCU_SUN50I_H616_H_ */
> diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-bin=
dings/clock/sun50i-h616-ccu.h
> index 6f8f01e67628..ebb146ab7f8c 100644
> --- a/include/dt-bindings/clock/sun50i-h616-ccu.h
> +++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
> @@ -112,5 +112,6 @@
>  #define CLK_HDCP               126
>  #define CLK_BUS_HDCP           127
>  #define CLK_PLL_SYSTEM_32K     128
> +#define CLK_BUS_GPADC          129
>
>  #endif /* _DT_BINDINGS_CLK_SUN50I_H616_H_ */
> diff --git a/include/dt-bindings/reset/sun50i-h616-ccu.h b/include/dt-bin=
dings/reset/sun50i-h616-ccu.h
> index 1bd8bb0a11be..ed177c04afdd 100644
> --- a/include/dt-bindings/reset/sun50i-h616-ccu.h
> +++ b/include/dt-bindings/reset/sun50i-h616-ccu.h
> @@ -66,5 +66,6 @@
>  #define RST_BUS_TVE0           57
>  #define RST_BUS_HDCP           58
>  #define RST_BUS_KEYADC         59
> +#define RST_BUS_GPADC          60
>
>  #endif /* _DT_BINDINGS_RESET_SUN50I_H616_H_ */
> --
> 2.34.1
>
