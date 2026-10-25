Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792937929;
	b=uz9EaQuqEhungW40hwnuw+GE7HF8Vxpr2fTmt1ML3z65XIfB/hSLgJgp1Ze/w4o6kGnS
	 PD/3Nu+0zpSwTvKOfmDLvBBN0X4QZv2mSpF9dwwIGGe21fm/pcrfRIQotZKN3zjbmzlgv
	 HroxupuA6UYvcRyrJtvSWy8dyArcMfSrVVuUg2DHHP+q3if/eQhgW9MvxNBD7ZUTb4rpT
	 TX4stI4Sn5NfJaYZSKMNYHEZPb6nM3JQNmPLlSZk+Lp5xot3DMEjeu5mT6JerWAkd7RVh
	 okPvbfgnXXQvhg3MWGE7rqbwaZzV9MQCzvJaKZkXyi0ur1T/48vrabUhjQjLiyGiipg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4VVJME7/gCLHk3YxwzcNW5mMjUauSr4kMD1EHj5gtSA=;
	b=VnLI7ACakYPlfSqgmej/A14xp1a1pblpMLKdjO6hQ6SxaLgBYmF3H+akeXj/+pw/5MLg
	 5M6h4Q67HCboMsGkCqVBAZ/lywEKYtWq4EPwLtSVc8SCiLlXaBaVj7T2Zr57dyQlPctiY
	 Z6HaOMUVq0R1zZVrHuKMCAxcsPaMMjo/AJxhssaXRJ0ReEjtMWGqXFYqZslZJLHSbLiS8
	 OhU4NxTjE3bTYARtkJ2f7tG/PLta3sSLQDNr736oAtP8V8uy0YEWcojXBo6K8YIrvv6VG
	 YBlNov0o9a9RGz/uQCx95EHmkBd1aEOHFQ8n8z7ASo4C2EI4uUMgWIiR6Q2Gc0USRXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nMo1VVRu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30E1606A31D
	for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 14:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B30E1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nMo1VVRu
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso23548a91.2
        for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 07:18:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792937928; cv=none;
        d=google.com; s=arc-20260327;
        b=IlhIhzbUinw0ps1tfXnbmc+gp6PcjZTIdhzFSAlt+k2iWgFVSIuj9Z3IYpJEdqsd0H
         GIxsCChIVImbc4BNPrZK+WX6HW9eZPisfsWQA1Nm/Zu2Sgs83FXXGe8WKwxUCMkLWoQ6
         bzBNXEsH3ziJJ6hrO6BOvOA777IkxgriL9rgALB+R1IDERonHj/0txjqgRVyHdUHU3Sw
         Vv0gjV6JS8lVtKW4h7TMJQPDaQ8aW75uXc+egx54xqHUFJJk+BrUfHOic6+ICZmZnGbg
         Xm4ls2rUXJt1IBAJqVRim6WZ980J6Mx1s1Yw8vSadUiGw0ny2QYoVA2AQWoOTRYq3xlc
         BJZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4VVJME7/gCLHk3YxwzcNW5mMjUauSr4kMD1EHj5gtSA=;
        fh=Q9oL+MFT4U/VvvuuuL8vG1iqWBc5sXnjCkDan1arzmE=;
        b=ri1EXoHB4VrR/jaUf4fPaGoABT5LtrLliQXDsO+60Lrc9/5RHBTkKRGBxuBvwYnIw9
         b6ntpjhHH2ZIs5UOOTR8YSROfS3HLidVOZpnuZh7KLX2vTKYhrZE5yq8FZflC7JdMpV3
         ZoX8P3P//ggX/3/RblrD4d+2qHdwmD9FXu0y69wn2yx5RsEpB7DwD+r+mjukmQBOOx8A
         tey+sGwaveWUS5Meychk66+3FDyhid1+2kSbMzFrDlfzwh9ZmBo11v6AJHzLVA8HbISm
         FXeiAYSC/2a9ZScRYnBzIwA8SOOGB4q3FNTebrAErrrHtzhjqtnw7p9LnQ6aJDISNJdq
         +rjA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792937928; x=1793542728; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4VVJME7/gCLHk3YxwzcNW5mMjUauSr4kMD1EHj5gtSA=;
        b=nMo1VVRu568ZSZmB4yPdiGJUGRjUBV936USFvJsyNzzD5/kbRZZ9mVbWK0HGTbwMkJ
         yEna1XGxs0ieMRptx+Ib9gVqAlmg8z9SUT+zzsqZKpz0O+CI4AiDjNcCvTKVTd25LWwu
         INXekfy+FNapeKfyGJ0DbROEpXJptQLoWGcw/dYzQq1Bxfd4bUEbaslb1DT3WZAvIZhS
         T8z/UGw9n0EtAfCTyftFFRkDXyDhwgEAMFN7X5gYTpDgfvE9ptK5V2AdiIrxhDFitIu5
         tWh8soBptQePGlVOvC8oHYupIOl0TCf4FkGRhIPPllAdyROg2Ohjq0AVR6em8CRfA9u6
         oiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792937928; x=1793542728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4VVJME7/gCLHk3YxwzcNW5mMjUauSr4kMD1EHj5gtSA=;
        b=OCqudMOP8on9X56KSuAEHJU8W84Uyt/L/Iuk8T7LvniirDv55dhO/wRj/rSjvzMLpY
         lktB0247cC9TvPj+8z/qxVcnaAptuEHwhyXhIekEu0xyLV5oHQ8dFI8CCGwEkoBWQguu
         EFwzDAWzLPGW3tAqaxvsH8DZkIiSedcxfOlvKOE/3h/4VnlDLnyfH/v07S4H282NAJ/l
         czToOE8qfwl9jiN4XGNBdPLvekN9geKYLyQy7ZDyyrISFq5LoFJpjUu0PJRQ2wC9dAN+
         RRjFKqhIO/XrCFMFI9dwmd5ee6Tbhv2xLYmM8lXjSmqRelpdm0mTIxGcT04Ac6IZeqYt
         x6/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwzWLPbosH+sHZWKY41+0j4k1z6hL9m9VcJcEiEiL5ZBC9E92CZhrdq6sr7mhWYLgifkXAqv7KPFXhVzQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKUSm2IPe1M2SkOG7fwMp1SBRml7oRNtmprs5qSZb0qXZA3yQKM
	YtlAD6SpBfEn3yklMrB/uBM+guQZXQOPIwS9GxdQdj0xqkCfuBA9sBsd3IEyWSm4OHboW0dP+Ts
	eUBPlO7kHeeLXnQIRjcKIdUc9DIE3HrA=
X-Gm-Gg: AYBFou2WXWud7Jqq5BeDTeA4u5Xcq9w+cu+4lMX7VC81XYfhEP+qYgB4v/PyMNEsCkE
	jpvgS21LWtAbg47w+DW7bpu8gfMgQ5HVH9E8gkfuPgRlG0M+3Atvs+O1KzqTs1r8R02NVBRaD4n
	kcOFjcLly4Sw861rRrH4YQTZ76Ydppi4zeldKeYklrCeMscMCt3wl9B2ej2j5dMXJWP6WDZj7/a
	viokajv31D/8keKUE5YY5yYfqLDaFOyr2WomuKjmmdTT/7c8P95m5/3CTLSJm5oighO3/JjcPSs
	qNtD5wZYdbJYlOWii4QgW/v9W+UWyKtfbLNpju8hkeUTEciK/hnyyRGRQIjc2OLv+GjUBmYMKfP
	QAiYHMAExwNBv290hjPnA82CnhwZIzJqhKWCL0akrRxQM4YsIupKx
X-Received: by 2002:a17:90b:58ef:b0:3ad:93b4:718f with SMTP id
 98e67ed59e1d1-3adeafcf07dmr3732331a91.65.1792937928015; Sun, 25 Oct 2026
 07:18:48 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261025135745.102970-1-pmazzini@gmail.com> <20261025135745.102970-4-pmazzini@gmail.com>
 <sashiko-outbox-184238@kernel.org>
In-Reply-To: <sashiko-outbox-184238@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Sun, 25 Oct 2026 14:18:37 +0000
X-Gm-Features: AclHuK8AxVUbPpSRccmmoUo8xuovbvn143lgZz14iNyQWbJc3TwwX5_2Erfpfy0
Message-ID: <CAAxh=juk_TCTSTcC=REn6M7aJAoL0APmEtzG+ZsSVbMZnHYy+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: a523: drop the PA GPIO interrupt
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, robh@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll fix it in v3.

On Sun, Oct 25, 2026 at 2:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] pinctrl: sunxi: sunxi_irq_base_reg() ignores irq_bank_map on A73=
3
> --
>
> commit 1d99efa95c547fd409284e1974176bcf35345f69
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
>
> This commit updates prepare_function_table() in the sunxi DT pinctrl
> driver to number logical IRQ banks starting from 0 at the first bank that
> supports interrupts, rather than starting from PA. It also updates
> a523_irq_bank_map and adds a733_irq_bank_map to map logical IRQ banks
> 0..9 back to hardware banks 1..10 (PB..PK).
>
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinc=
trl/sunxi/pinctrl-sun60i-a733.c
> > index ca82f08a3a65b..3ebe926a1bc6b 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> > @@ -21,8 +21,11 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MA=
X_BANKS] =3D
> >  /*     PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
> >       {  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
> >
> > +static const unsigned int a733_irq_bank_map[] =3D { 1, 2, 3, 4, 5, 6, =
7, 8, 9, 10 };
> > +
> >  static struct sunxi_pinctrl_desc a733_pinctrl_data =3D {
> > -     .irq_banks =3D 10,
> > +     .irq_banks =3D ARRAY_SIZE(a733_irq_bank_map),
> > +     .irq_bank_map =3D a733_irq_bank_map,
> >       .irq_read_needs_mux =3D true,
> >       .io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
> >  };
>
> [Severity: High]
> Does sunxi_irq_base_reg() in drivers/pinctrl/sunxi/pinctrl-sunxi.h ignore
> a733_irq_bank_map when SUNXI_PINCTRL_NCAT3_REG_LAYOUT is set?
>
> In drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c, a733_pinctrl_probe() pass=
es
> SUNXI_PINCTRL_NCAT3_REG_LAYOUT to sunxi_pinctrl_dt_table_init(). However,
> when accessing IRQ registers via sunxi_irq_cfg_reg(), sunxi_irq_ctrl_reg(=
),
> sunxi_irq_status_reg(), or sunxi_irq_debounce_reg(), sunxi_irq_base_reg()
> only calls sunxi_irq_hw_bank_num() on the non-NCAT3 path:
>
> drivers/pinctrl/sunxi/pinctrl-sunxi.h:sunxi_irq_base_reg() {
>         if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
>                 return pctl->bank_offset + bank * pctl->bank_mem_size +
>                        A733_IRQ_REGS_OFFSET;
>
>         return IRQ_REGS_OFFSET +
>                sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
> }
>
> With prepare_function_table() in drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> now numbering PB..PK as logical IRQ banks 0..9 instead of 1..10, and
> pctl->bank_offset set to A733_BANK_OFFSET (0x80, the base of PA),
> passing the unmapped bank index in the SUNXI_PINCTRL_NCAT3_REG_LAYOUT
> branch shifts every GPIO IRQ register access on the A733 down by one bank
> (0x80 bytes), so PB..PK access offsets 0x0c0..0x540 (PA..PJ) instead of
> 0x140..0x5c0.
>
> Should the SUNXI_PINCTRL_NCAT3_REG_LAYOUT branch in sunxi_irq_base_reg()
> also translate bank through sunxi_irq_hw_bank_num(pctl->desc, bank)?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025135745.10=
2970-1-pmazzini@gmail.com?part=3D3
