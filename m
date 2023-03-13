Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668DB23C5
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 11:00:17 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id r5so12634519qtp.4
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 04:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678705216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JRXZxwFQvV/9ugP2yIyDpmVR7lwS7JaHigMB2zQJQQ=;
        b=LOjeUqoVaezfL52uDq0gvkCTc/UFlggTKQYlKP+/+MGVmrNYZELOcfazqnvS6Kgr5y
         8cvvmd65iu69yFdPmeDrkCer9ZKAUGEo4aMNI8JF0OQhXBqLwHw4wxXfWqrO1s32JvHL
         UJqNKGfPienIn8ZQfziU2SXTOANaT2IyX+28H+8odtWK8uH50Ej9Y5xXYKfS/f480AuD
         qyyk2oUi9du3bQaA8WyLxOfnkstQbmDulwCsO6oh8yNYmhf4sM9Awxx/AnjstvKek+xG
         QQb/+0WOyRyg5Rmne9sq5u8+OllL5e0mjwDAjvwRf96KQsDQwI5FTCt1e2Jk8f2wcHMm
         8+mw==
X-Gm-Message-State: AO0yUKXiooe6CzarXjPtkI5hO7y5iQjKY72aE0i3XbewdDvYY5QiTRNo
	JF26n+dkLDrIO45F668Hk8CKlpDB3spGMA==
X-Google-Smtp-Source: AK7set+hhvervo6H6yqwFHkqiGUnLufTHwulhHihVbJrL2xQTQqZtO5nSbfB4ozVDp9xxaZIFrG10g==
X-Received: by 2002:ac8:5f8b:0:b0:3b8:6d3a:5ed4 with SMTP id j11-20020ac85f8b000000b003b86d3a5ed4mr58273439qta.67.1678705215343;
        Mon, 13 Mar 2023 04:00:15 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id f10-20020ac8464a000000b003bd0e7ff466sm5280695qto.7.2023.03.13.04.00.14
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 04:00:14 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-536af432ee5so234865577b3.0
        for <linux-sunxi@lists.linux.dev>; Mon, 13 Mar 2023 04:00:14 -0700 (PDT)
X-Received: by 2002:a0d:ec14:0:b0:544:4008:baa1 with SMTP id
 q20-20020a0dec14000000b005444008baa1mr452333ywn.4.1678705213702; Mon, 13 Mar
 2023 04:00:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230310144721.1544669-1-robh@kernel.org> <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Mar 2023 12:00:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1=+WwWjfiWDYOjSzTjcYBEY+QR=XKuU+o5_SCyU7rag@mail.gmail.com>
Message-ID: <CAMuHMdX1=+WwWjfiWDYOjSzTjcYBEY+QR=XKuU+o5_SCyU7rag@mail.gmail.com>
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

On Mon, Mar 13, 2023 at 10:00=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Fri, Mar 10, 2023 at 3:56=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> > It is preferred to use typed property access functions (i.e.
> > of_property_read_<type> functions) rather than low-level
> > of_get_property/of_find_property functions for reading properties. As
> > part of this, convert of_get_property/of_find_property calls to the
> > recently added of_property_present() helper when we just want to test
> > for presence of a property and nothing more.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/renesas/pinctrl.c
> > +++ b/drivers/pinctrl/renesas/pinctrl.c
> > @@ -125,8 +125,8 @@ static int sh_pfc_dt_subnode_to_map(struct pinctrl_=
dev *pctldev,
> >          * inside a subnode nor across subnodes.
> >          */
> >         if (!pmx->func_prop_name) {
> > -               if (of_find_property(np, "groups", NULL) ||
> > -                   of_find_property(np, "pins", NULL)) {
> > +               if (of_property_present(np, "groups")||
> > +                   of_property_present(np, "pins")) {
> >                         pmx->func_prop_name =3D "function";
> >                         pmx->groups_prop_name =3D "groups";
> >                         pmx->pins_prop_name =3D "pins";
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This check is used to auto-detect if the standard property names
> should be used, or the "renesas,"-prefixed ones.
> As the last users of the latter were removed from DTS in v4.10,
> perhaps I should just remove these checks instead?

Sent a patch just doing that, so you can drop this chunk.
https://lore.kernel.org/linux-renesas-soc/ff9c14781110bbf19b56b45dd1f01e6da=
90319ad.1678704441.git.geert+renesas@glider.be

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
