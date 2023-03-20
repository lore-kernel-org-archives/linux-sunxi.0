Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FC31104
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Mar 2023 08:01:18 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id ay22so746026qtb.2
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Mar 2023 01:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679299277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YDU8IzF0EsSpDkzRDjzs/d7Q1NfYw1Ou2xNB8kfdm8=;
        b=tqqFyO/QQcDnLHLJVKG7rCtPMAIGimSwp7E/kJvg1bbjW9lytVIljOuIRtNo8wzUkw
         GkPdMlfNXhLyv5kTxs4kAC59sM8HFD7vLlWt5G/dmVfJ6/VkjnmgEK1sJFwEvevbq39V
         7Tt8/F+pj1BDgsn/+zPUxgxZsUlXrfhSmi7VbXNNdpc0J//OxCaaJzCYAfJekc4m8PbB
         vYUmlWHBEKJPlKQ7+7P0nSGVntKckvAuaN494CeAV8+CrvBuxn/2ZXoHNc+SF+nsoeoH
         BVeI9YqWHu4wdIeqIRtQfiWL+3Gn+5+U23xcSGUkrOwUGSvcH+REJI7lXGbWVe/jfxuC
         APIg==
X-Gm-Message-State: AO0yUKVNGX6Zz2+QhgSs21DXUY8inVX8D+Nv142EyDYAAMFQZ4YdmD11
	2N/YDdbFUaxCRoQ67SPoebngIK59/utuXw==
X-Google-Smtp-Source: AK7set/LcIKUaJ7bRb2BocP4gcYqapZSA7erEOaImkCBb7s5jsM3q/bIHgR03lBCvfe6Yks3dY7x4g==
X-Received: by 2002:a05:622a:20e:b0:3d4:17dc:3fcf with SMTP id b14-20020a05622a020e00b003d417dc3fcfmr17999989qtx.5.1679299277022;
        Mon, 20 Mar 2023 01:01:17 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id y5-20020ac85245000000b003de68caf5b7sm3312528qtn.35.2023.03.20.01.01.14
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 01:01:16 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-544787916d9so209092377b3.13
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Mar 2023 01:01:14 -0700 (PDT)
X-Received: by 2002:a81:e508:0:b0:544:5fc7:f01f with SMTP id
 s8-20020a81e508000000b005445fc7f01fmr9057012ywl.4.1679299274592; Mon, 20 Mar
 2023 01:01:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230310144721.1544669-1-robh@kernel.org> <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
 <CAMuHMdX1=+WwWjfiWDYOjSzTjcYBEY+QR=XKuU+o5_SCyU7rag@mail.gmail.com> <CACRpkdaw7TodD0hr3vD8cGB80k0qtEiaC1ne-ivCj6YEefi44w@mail.gmail.com>
In-Reply-To: <CACRpkdaw7TodD0hr3vD8cGB80k0qtEiaC1ne-ivCj6YEefi44w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Mar 2023 09:01:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgWne0goeJ3A1=v8FZCz3hmHC2j_UEYPn51gD1jz-9uA@mail.gmail.com>
Message-ID: <CAMuHMdVgWne0goeJ3A1=v8FZCz3hmHC2j_UEYPn51gD1jz-9uA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use of_property_present() for testing DT
 property presence
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
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

Hi Linus,

On Sun, Mar 19, 2023 at 9:55=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Mon, Mar 13, 2023 at 12:00=E2=80=AFPM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Mon, Mar 13, 2023 at 10:00=E2=80=AFAM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Fri, Mar 10, 2023 at 3:56=E2=80=AFPM Rob Herring <robh@kernel.org>=
 wrote:
> > > > It is preferred to use typed property access functions (i.e.
> > > > of_property_read_<type> functions) rather than low-level
> > > > of_get_property/of_find_property functions for reading properties. =
As
> > > > part of this, convert of_get_property/of_find_property calls to the
> > > > recently added of_property_present() helper when we just want to te=
st
> > > > for presence of a property and nothing more.
> > > >
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/pinctrl/renesas/pinctrl.c
> > > > +++ b/drivers/pinctrl/renesas/pinctrl.c
> > > > @@ -125,8 +125,8 @@ static int sh_pfc_dt_subnode_to_map(struct pinc=
trl_dev *pctldev,
> > > >          * inside a subnode nor across subnodes.
> > > >          */
> > > >         if (!pmx->func_prop_name) {
> > > > -               if (of_find_property(np, "groups", NULL) ||
> > > > -                   of_find_property(np, "pins", NULL)) {
> > > > +               if (of_property_present(np, "groups")||
> > > > +                   of_property_present(np, "pins")) {
> > > >                         pmx->func_prop_name =3D "function";
> > > >                         pmx->groups_prop_name =3D "groups";
> > > >                         pmx->pins_prop_name =3D "pins";
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > This check is used to auto-detect if the standard property names
> > > should be used, or the "renesas,"-prefixed ones.
> > > As the last users of the latter were removed from DTS in v4.10,
> > > perhaps I should just remove these checks instead?
> >
> > Sent a patch just doing that, so you can drop this chunk.
> > https://lore.kernel.org/linux-renesas-soc/ff9c14781110bbf19b56b45dd1f01=
e6da90319ad.1678704441.git.geert+renesas@glider.be
>
> So I need a new version of this patch before I can apply it
> I guess, or there will be conflict with Reseas stuff?

It would be a minor conflict, though, and you would have to resolve
that yourself, when merging my renesas-pinctrl PR.  So when you
will send a PR to The Other Linus, there won't be a conflict anymore,
and no angriness ;-)

Thanks!

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
