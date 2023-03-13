Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB3123A7
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 09:01:02 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id c19so12323299qtn.13
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 02:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678698061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMjv67oqH0XcHnu1slnz7obBOYeNA0kXm4szuRMQips=;
        b=ski52nBUVHBaHn1OpCCW6eQzKOvheTrI+sLBQ0sbCS0L7nWtR9XdL477AmhtJ8+dQR
         eppG0d8DAVZVsMu8eLFHJyJ98KUtpK/8KMdzovg7c68bk7CTWXnovY0k4fbtFIYFTWdI
         wCr4WvEzjNOXmTXBTvrxx024PDFS4zAaA3XRtTDhlaeeftyRqcjRkd+A3c1VM5AoMNQB
         RQx2WSKbcbch2uTECTLy/Npxdo8orv032fOZaTJ59oz5UxKU8wG+L1+K/EhFAAMr/Id1
         j9WYevnp1HHJQ79nAo2lLCNUhFjodJ96r2k9L8s4cy/9thRePgcEoUdWUZWh7/t3XAtn
         na+w==
X-Gm-Message-State: AO0yUKXYYtIJB6edgdsut45iHnd1E7/usvI0JBp3Ql9h7cAPGHwGLs1x
	Id6LufdXZ83jlm1OVY7kz00zNNue9yGkdA==
X-Google-Smtp-Source: AK7set9AdvahKNk31IT8KSmNqDToyJRVc1nfLBWOe4DE4wmg9gwNvGYCWm1eGsap7fa5iMXL1pDXiQ==
X-Received: by 2002:a05:622a:116:b0:3bd:1914:3c88 with SMTP id u22-20020a05622a011600b003bd19143c88mr16565746qtw.22.1678698061123;
        Mon, 13 Mar 2023 02:01:01 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id s4-20020a372c04000000b0074283b87a4esm4951920qkh.90.2023.03.13.02.01.00
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 02:01:00 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id e65so2248761ybh.10
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 02:01:00 -0700 (PDT)
X-Received: by 2002:a25:8b08:0:b0:b14:91e:4d19 with SMTP id
 i8-20020a258b08000000b00b14091e4d19mr14474451ybl.7.1678698060305; Mon, 13 Mar
 2023 02:01:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230310144721.1544669-1-robh@kernel.org>
In-Reply-To: <20230310144721.1544669-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Mar 2023 10:00:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
Message-ID: <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use of_property_present() for testing DT
 property presence
To: Rob Herring <robh@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, Mar 10, 2023 at 3:56=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl.c
> +++ b/drivers/pinctrl/renesas/pinctrl.c
> @@ -125,8 +125,8 @@ static int sh_pfc_dt_subnode_to_map(struct pinctrl_de=
v *pctldev,
>          * inside a subnode nor across subnodes.
>          */
>         if (!pmx->func_prop_name) {
> -               if (of_find_property(np, "groups", NULL) ||
> -                   of_find_property(np, "pins", NULL)) {
> +               if (of_property_present(np, "groups")||
> +                   of_property_present(np, "pins")) {
>                         pmx->func_prop_name =3D "function";
>                         pmx->groups_prop_name =3D "groups";
>                         pmx->pins_prop_name =3D "pins";

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

This check is used to auto-detect if the standard property names
should be used, or the "renesas,"-prefixed ones.
As the last users of the latter were removed from DTS in v4.10,
perhaps I should just remove these checks instead?

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
