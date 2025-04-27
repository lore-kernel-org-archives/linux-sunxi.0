Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8282A1BBBE5
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Apr 2025 04:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745728755; cv=none; b=Al28/D0WaHTNDZt+r6LRpragKLL6lPYMLTq8d5Jx/cQC1aO8SrvlnO4QcLi53Wd5MFSPivrIZWyONQUfEGGTt1TXXmQvxgS+yJnMihbV24ORfTzVw+PvVFBx0n4ER1rjQqV55e7vWIahscHp2NEPrpBdlcGNjhwRCyG/0FB1Uao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745728755; c=relaxed/simple;
	bh=CxRjuhcn6CdMASiLbv/jvj67GsPBZzDFBWGJp5nka7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qQIG8lwmjo/DGBaUYAjeJPuFZTmNKLLQGBdC0TQJTwqUdQy74mBnOjKurLZB+4C3K0H9sC+0N1BhFszc+H4OTvVUD+tTKA2xF44t2t7CrFaz9+zonC+jnbVqsB+hZpqR6dltC0mfvizfC7ux711H9xtCsQu1CFFFBb65T9Vlq18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30effbfaf61so41199121fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Apr 2025 21:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745728750; x=1746333550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QNo7qe9Lz9mlSgoeITrfWOs7/oXxKQcv8brSPsNOFbQ=;
        b=lvP+IG+m00YdS7Ln3KXurc9f40ts5+WLYElBPTeVQpSzlNppN2ZLtJCoGf78c5qWAj
         FwQ5dH1FTFzhUr5Ae8OdbiQWJdCvu8mm4vIzpz6of8ut1bU3kP3Fn+OIAc/cJbxawbZ3
         Qudlf1gkbKnnKiW3RqPUgusZ/INt1aol6Adk4VEhu5cn94EQmLvuLi1bLQS5TecMwXWS
         Ys4Q2Or/Ik8/7Doj4XTEuH8d20BVyhwmVRF9kudoCJcvA5IgrKErrOfX5vNuk0BcYpoD
         yGi7vVtVaog7jwfu0+xG/6q1evZZ92TYpEO4VmT0xw566UvrNjvIj4bBdwkM50m5Iz3h
         Zl/A==
X-Forwarded-Encrypted: i=1; AJvYcCWxg5GMk0Ojke9De53sMPXJy+TmDuf7Mn/zjnC6LIdnCcvReX6/k0TCeojSqo2PChZ+5FKcMFSCW0EBtA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtnWuB6XXENowTFLiHX66mD5GifswT0PncJMu/r1HW08WxV6E5
	1Pk8NFGnXWx0cgRGk/XpjXHRVLQ7l8IsVZ5dUhKDUxoqNhONTlUUZk+4hIJ3
X-Gm-Gg: ASbGncuLV8VcCqcIqhLa+cMMwVvL71zwiqkaYA8j039hUFOgmEZHZEqIPHmAgey/90e
	zXCmWcG6zuMxtl5DeW4rEF1dBNGGawrzvzrSA9TuQMYyw4TPuXMTqxgF0wUAOkXOh2VAxzrXZLl
	z4ju4YPXUiW33/iGJy75EQctwtD9JsMdWMIJudt9JEykQSC4U198h9TXofMWKfgKB3k7LCf+9Gh
	xZzIV8ymtkokqmUt73l/S+waFTVmZx2Z6rhzNFY77RqbTvOZFMcgy1Jz1ihUaC7iKeDVsHv42hd
	ljSEJPiZEvjqN9okz4pjg80HJO3k7aals2tLYBf5FP72evbgvbuF5ZvE2zbuP5MAuxZNgHj/NQ=
	=
X-Google-Smtp-Source: AGHT+IHuuG75VImYeXDP1AwM+G56nII+oAw3221ArT7M4gjFTxmXT/R2u2Jk8oTH6JTTr+BY2xy1lA==
X-Received: by 2002:a05:651c:1144:b0:30b:e5bd:404a with SMTP id 38308e7fff4ca-317cca7e8dcmr39200531fa.6.1745728749882;
        Sat, 26 Apr 2025 21:39:09 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b96d27sm15309531fa.107.2025.04.26.21.39.09
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 21:39:09 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30effbfaf61so41198931fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Apr 2025 21:39:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1V1RNeKgRwinsM0uF5599sT3OJip3fbGFZeW/Co/PhOG1CN/mcyeuFaWLe37CZrZemuPIyV9JHLXurQ==@lists.linux.dev
X-Received: by 2002:a05:651c:12c8:b0:30b:fc16:d482 with SMTP id
 38308e7fff4ca-317cc3b4babmr34833351fa.3.1745728749245; Sat, 26 Apr 2025
 21:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org> <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-5-4d2df5603332@linaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 27 Apr 2025 12:38:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
X-Gm-Features: ATxdqUFqwWzMoc8bpc0UG6R3aiwwevesO0_bqj7uRg6TeOMZWI1Q6QZaB7zJ9oE
Message-ID: <CAGb2v66v9dc7ydWVT94kwCX9fdQci9wfsFLF1mAOGrnxgGTKnA@mail.gmail.com>
Subject: Re: [PATCH 5/5] clk: sunxi: Do not enable by default during compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 7:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Enabling the compile test should not cause automatic enabling of all
> drivers.  Restrict the default to ARCH also for individual drivers, even
> though their choice is not visible without selecting parent Kconfig
> symbol, because otherwise selecting parent would select the child during
> compile testing.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/sunxi/Kconfig | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/sunxi/Kconfig b/drivers/clk/sunxi/Kconfig
> index 1c4e543366ddb76c1669b577c1ac337dc1be616f..5e2f92bfe4120981ab68b175d=
ce798ac8b3268b0 100644
> --- a/drivers/clk/sunxi/Kconfig
> +++ b/drivers/clk/sunxi/Kconfig
> @@ -2,13 +2,13 @@
>  menuconfig CLK_SUNXI
>         bool "Legacy clock support for Allwinner SoCs"
>         depends on (ARM && ARCH_SUNXI) || COMPILE_TEST
> -       default y
> +       default (ARM && ARCH_SUNXI)

Just wondering, shouldn't this change alone be enough? The remaining
Kconfig options are gated by this one.

ChenYU

>  if CLK_SUNXI
>
>  config CLK_SUNXI_CLOCKS
>         bool "Legacy clock drivers"
> -       default y
> +       default ARCH_SUNXI
>         help
>           Legacy clock drivers being used on older (A10, A13, A20,
>           A23, A31, A80) SoCs. These drivers are kept around for
> @@ -19,14 +19,14 @@ config CLK_SUNXI_CLOCKS
>
>  config CLK_SUNXI_PRCM_SUN6I
>         bool "Legacy A31 PRCM driver"
> -       default y
> +       default ARCH_SUNXI
>         help
>           Legacy clock driver for the A31 PRCM clocks. Those are
>           usually needed for the PMIC communication, mostly.
>
>  config CLK_SUNXI_PRCM_SUN8I
>         bool "Legacy sun8i PRCM driver"
> -       default y
> +       default ARCH_SUNXI
>         help
>           Legacy clock driver for the sun8i family PRCM clocks.
>           Those are usually needed for the PMIC communication,
> @@ -34,7 +34,7 @@ config CLK_SUNXI_PRCM_SUN8I
>
>  config CLK_SUNXI_PRCM_SUN9I
>         bool "Legacy A80 PRCM driver"
> -       default y
> +       default ARCH_SUNXI
>         help
>           Legacy clock driver for the A80 PRCM clocks. Those are
>           usually needed for the PMIC communication, mostly.
>
> --
> 2.45.2
>
>
