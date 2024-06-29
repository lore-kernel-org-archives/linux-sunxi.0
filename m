Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0A51DDF4
	for <linux-sunxi@lists.linux.dev>; Sat, 29 Jun 2024 06:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719643234; cv=none; b=CpycStaAi4RtGo3ur6I3KYhp/fRb54iw36kAkUuMJxvC/zYVwDf8O/yq8QkqOgGr3edE6LwkSwdUODqoHkyGvECDW4n6NbCo8Z5TgsybLKdxCJSRHYKW/a2YPLWfPhfA/N/1msUmGl4dcyJSA2wcFG/3AQuQVniyOKzL5OJvRRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719643234; c=relaxed/simple;
	bh=Cn09Ef8gCqLXly+Rs3FB1Boi9qEevm3VkSEoUZ3h5tQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BnwZoGsV+VPM6ZU2pTXpgU0d0ujVaNxFHVqdEjYnxLR9k9AQDFCqftBpdjlRV1u/oAdCeryQn+f0WBvt0Zil4EYDdp9OpEphmHovvc62DSZsuC/j7kl+129wrfbxAyMQDt+BOcUMXB7ckHVJb3/1DEmBlTxDS+fBkF2D90fssYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52cdb9526e2so1021771e87.0
        for <linux-sunxi@lists.linux.dev>; Fri, 28 Jun 2024 23:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719643226; x=1720248026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9VvrX6QrJoZbVIAjkNDDZQYHf2ppstlZCyPEGAhFB7E=;
        b=S2DUZlfSgPe9QetBbbbmHdjb0uO33n8VJ2q1suNVn1RVAkmSUmMMeLnKvh0QwG/3aB
         Dpw88ps82MXmRlOGYBxNgKt1CY7y080+aTd8JXprWVYWHsv4lsuMpp0clS4Z1yx4qxhz
         WHQWakNdjQz3RwK4Hyq2OWftZs+caB36M9R3Qc5V6bl07W/Vr+OZ1cNlNaJQWHE3VKlM
         TMVn0zPUrhmAqgkonnEAF/AkedK8ncyJ1hPZ14m4QZwocbLuNKQNZ4oblfHcBNCV4/el
         LEXtJuZp/U5OR5XRWXAifSiCAZmNvoZXNQAyCbuHe3irPHM3vIUJWZUkyULLcd5qrlRx
         5fUA==
X-Forwarded-Encrypted: i=1; AJvYcCX2S/PE7W6cGx1Li04NNwFC11JPt7REkqmzMPg6BlZGWC0qYc9va+PqnBQkfsrPFS7YSY1UG3+eRqK+jxcVX79cihInvRkiptn/7Ss=
X-Gm-Message-State: AOJu0YwGYsLvnBG6+RgDyqJTL65XNEl4lcyjv1mTQsLy+fwQi67mdLJy
	GzjhH3ghTMhaVg2ToEmUTRsPEb2VD1Y63yESnI/mXd6VOzGdOueb08cMkFdZ
X-Google-Smtp-Source: AGHT+IGgD9qn4dmjuETY62KOzH4NwCEUUbTRGe6mTCqHRil15CRf+Qb63bM9hLOOqQUogdWNiD+7aQ==
X-Received: by 2002:a05:6512:3d88:b0:52c:89b3:6d74 with SMTP id 2adb3069b0e04-52e7b8df4c4mr1206603e87.6.1719643226274;
        Fri, 28 Jun 2024 23:40:26 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab2ebc6sm502525e87.228.2024.06.28.23.40.25
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 23:40:25 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ee4ab4076bso21367231fa.0
        for <linux-sunxi@lists.linux.dev>; Fri, 28 Jun 2024 23:40:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX1UF+jCwZuxuIMpLRgbWVXm8gziuWcn5ygDqVYvETtJ9EiTNYixCbMxZaErywiPK0x/hdjqEEjHewSnBIZiJiDs+79RSu0N+j4uM4=
X-Received: by 2002:a05:651c:21a:b0:2ec:4e05:8d99 with SMTP id
 38308e7fff4ca-2ee5e6c5e60mr958211fa.20.1719643225204; Fri, 28 Jun 2024
 23:40:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240623-sunxi-ng_fix_common_probe-v1-1-7c97e32824a1@oltmanns.dev>
 <yw1x4j9e62dt.fsf@mansr.com>
In-Reply-To: <yw1x4j9e62dt.fsf@mansr.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 29 Jun 2024 14:40:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v67GbUF7S9hKdNb=az0ZsoEU=fXjKzyQvEd+tSHrWf4eCg@mail.gmail.com>
Message-ID: <CAGb2v67GbUF7S9hKdNb=az0ZsoEU=fXjKzyQvEd+tSHrWf4eCg@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: common: Don't call hw_to_ccu_common on hw
 without common
To: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
Cc: Frank Oltmanns <frank@oltmanns.dev>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	"Robert J. Pafford" <pafford.9@buckeyemail.osu.edu>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 7:39=E2=80=AFPM M=C3=A5ns Rullg=C3=A5rd <mans@mansr=
.com> wrote:
>
> Frank Oltmanns <frank@oltmanns.dev> writes:
>
> > In order to set the rate range of a hw sunxi_ccu_probe calls
> > hw_to_ccu_common() assuming all entries in desc->ccu_clks are contained
> > in a ccu_common struct. This assumption is incorrect and, in
> > consequence, causes invalid pointer de-references.
> >
> > Remove the faulty call. Instead, add one more loop that iterates over
> > the ccu_clks and sets the rate range, if required.
> >
> > Fixes: b914ec33b391 ("clk: sunxi-ng: common: Support minimum and maximu=
m rate")
> > Reported-by: Robert J. Pafford <pafford.9@buckeyemail.osu.edu>
> > Closes: https://lore.kernel.org/lkml/DM6PR01MB58047C810DDD5D0AE397CADFF=
7C22@DM6PR01MB5804.prod.exchangelabs.com/
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> > ---
> > Robert, could you please test if this fixes the issue you reported.
> >
> > I'm CC'ing M=C3=A5ns here, because he observed some strange behavior [1=
] with
> > the original patch. Is it possible for you to look into if this patch
> > fixes your issue without the need for the following (seemingly
> > unrelated) patches:
> >       cedb7dd193f6 "drm/sun4i: hdmi: Convert encoder to atomic"
> >       9ca6bc246035 "drm/sun4i: hdmi: Move mode_set into enable"
>
> This does indeed fix it.  6.9 is still broken, though, but that's
> probably for other reasons.

Can I take that as a Tested-by?

> > Thanks,
> >   Frank
> >
> > [1]: https://lore.kernel.org/lkml/yw1xo78z8ez0.fsf@mansr.com/
> > ---
> >  drivers/clk/sunxi-ng/ccu_common.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/c=
cu_common.c
> > index ac0091b4ce24..be375ce0149c 100644
> > --- a/drivers/clk/sunxi-ng/ccu_common.c
> > +++ b/drivers/clk/sunxi-ng/ccu_common.c
> > @@ -132,7 +132,6 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, s=
truct device *dev,
> >
> >       for (i =3D 0; i < desc->hw_clks->num ; i++) {
> >               struct clk_hw *hw =3D desc->hw_clks->hws[i];
> > -             struct ccu_common *common =3D hw_to_ccu_common(hw);
> >               const char *name;
> >
> >               if (!hw)
> > @@ -147,14 +146,21 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu,=
 struct device *dev,
> >                       pr_err("Couldn't register clock %d - %s\n", i, na=
me);
> >                       goto err_clk_unreg;
> >               }
> > +     }
> > +
> > +     for (i =3D 0; i < desc->num_ccu_clks; i++) {
> > +             struct ccu_common *cclk =3D desc->ccu_clks[i];
> > +
> > +             if (!cclk)
> > +                     continue;
> >
> > -             if (common->max_rate)
> > -                     clk_hw_set_rate_range(hw, common->min_rate,
> > -                                           common->max_rate);
> > +             if (cclk->max_rate)
> > +                     clk_hw_set_rate_range(&cclk->hw, cclk->min_rate,
> > +                                           cclk->max_rate);
> >               else
> > -                     WARN(common->min_rate,
> > +                     WARN(cclk->min_rate,
> >                            "No max_rate, ignoring min_rate of clock %d =
- %s\n",
> > -                          i, name);
> > +                          i, clk_hw_get_name(&cclk->hw));
> >       }
> >
> >       ret =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
> >
> > ---
> > base-commit: 2607133196c35f31892ee199ce7ffa717bea4ad1
> > change-id: 20240622-sunxi-ng_fix_common_probe-5677c3e487fc
> >
> > Best regards,
> > --
> >
> > Frank Oltmanns <frank@oltmanns.dev>
> >
>
> --
> M=C3=A5ns Rullg=C3=A5rd
