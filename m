Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494221C9E2
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Aug 2023 12:30:29 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-591ba8bd094so28225837b3.3
        for <linux-sunxi@lists.linux.dev>; Tue, 22 Aug 2023 05:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692707429; x=1693312229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEdxVNTi234IeBu9/mHN8tlhC03wKCbKIUsue9+Lnac=;
        b=U78Ic2WQPO2L7imJ2wMst9hNTK6ECYFaDovgcUP7D31wQLsAN2iKM9SSyYd64z/cCN
         0iEcVAOy66JoAW9r50L5WlfDMp7JjZwcsmrPnP0Hu5K6hvXnjjAXqt5C+ExTXmFTwJJF
         JqAEzMqlcE7p4CqqUjbhZuR4GiDT6DJJLoj+A7ogNnCZ/jjJ5/ksdN8lEYkg7r+uTLAG
         C62vrsaJiYeHSv7PHJkyVlCiF++HtD6PGUFwrR6iO8Lk8aK/N+Kve/pood/Rv/ITZ3Dc
         2ixzeW0dFoAuJRiarc4j70er/Y5goWU9GKesmTk+3V/fIbJh/kjtIaQuaimYTJMzF7Ti
         hypA==
X-Gm-Message-State: AOJu0YwG0jEOx7wEObar/MRNR3DolH55ujCkB4jG5wWhNZTqatOekF+8
	UcIcEY5J/d5kxMQi0ubCt8JiN1l0nY2G+A==
X-Google-Smtp-Source: AGHT+IEj5KCKSNuBipzXZpK5pH3jnmRo3Hep7lW10Pzds2yyoNeOslktCP96TrTSkflqpJ8Sk69txg==
X-Received: by 2002:a0d:e251:0:b0:58c:9974:b660 with SMTP id l78-20020a0de251000000b0058c9974b660mr10186994ywe.22.1692707428973;
        Tue, 22 Aug 2023 05:30:28 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id g123-20020a0ddd81000000b0055a373a7e5asm2756755ywe.131.2023.08.22.05.30.28
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 05:30:28 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-58fb73e26a6so34612687b3.1
        for <linux-sunxi@lists.linux.dev>; Tue, 22 Aug 2023 05:30:28 -0700 (PDT)
X-Received: by 2002:a25:bcc7:0:b0:d52:f4d7:5587 with SMTP id
 l7-20020a25bcc7000000b00d52f4d75587mr9783496ybm.31.1692707427833; Tue, 22 Aug
 2023 05:30:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230721221552.1973203-2-contact@jookia.org> <20230721221552.1973203-6-contact@jookia.org>
In-Reply-To: <20230721221552.1973203-6-contact@jookia.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Aug 2023 14:30:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2m54UAH0X2dG7stEg=grFihrdsz4+o7=_DpBMhjTbkw@mail.gmail.com>
Message-ID: <CAMuHMdV2m54UAH0X2dG7stEg=grFihrdsz4+o7=_DpBMhjTbkw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] can: sun4i_can: Add support for the Allwinner D1
To: John Watts <contact@jookia.org>
Cc: linux-sunxi@lists.linux.dev, Wolfgang Grandegger <wg@grandegger.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-can@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

On Sat, Jul 22, 2023 at 12:18=E2=80=AFAM John Watts <contact@jookia.org> wr=
ote:
> The controllers present in the D1 are extremely similar to the R40
> and require the same reset quirks, but An extra quirk is needed to suppor=
t
> receiving packets.
>
> Signed-off-by: John Watts <contact@jookia.org>

Thanks for your patch, which is now commit 8abb95250ae6af2d ("can:
sun4i_can: Add support for the Allwinner D1") in linux-can-next/master.

> --- a/drivers/net/can/Kconfig
> +++ b/drivers/net/can/Kconfig
> @@ -185,10 +185,10 @@ config CAN_SLCAN
>
>  config CAN_SUN4I
>         tristate "Allwinner A10 CAN controller"
> -       depends on MACH_SUN4I || MACH_SUN7I || COMPILE_TEST
> +       depends on MACH_SUN4I || MACH_SUN7I || RISCV || COMPILE_TEST

This makes this question pop up when configuring a kernel for any RISC-V
platform, not just for Allwinner RISC-V platforms.

In comparison, drivers/clk/sunxi-ng/Kconfig does have some

    depends on MACH_SUN<foo>I || RISCV || COMPILE_TEST

but these are gated by ARCH_SUNXI at the top of the file.

I'm not sure what's the best way to fix this:
  - Replace RISCV by ARCH_SUNXI?
    This would expose it on more ARM sun<foo>i platforms, making the
    MACH_SUN4I || MACH_SUN7I superfluous?
  - Replace RISCV by RISCV && ARCH_SUNXI?

Thanks for your comments!

>         help
>           Say Y here if you want to use CAN controller found on Allwinner
> -         A10/A20 SoCs.
> +         A10/A20/D1 SoCs.
>
>           To compile this driver as a module, choose M here: the module w=
ill
>           be called sun4i_can.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
