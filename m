Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5DB17745
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Aug 2026 20:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786741089; cv=pass; b=Hv6+vul08siTcvZdrk6RtqtJPgJK4hY97ftrvlX0dXejOiVQsqWeHuLtuWllSccqZ8kUGy0BUQ6WdblY1dygtZO4T0BW3q+A4QaaeLkvOCbbwIsg4kSCufsbpWcZzPRRQqiqRBJkPbuN3GhE89ZQKah711AjM2SraRa1pwhu/kQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786741089; c=relaxed/simple;
	bh=fzkudrNXMvsqhxo9t7njpcJ4l34TsL42TxTBUCeRaJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KZJqWccq0ks1Qe7VjXraDv1iyP/RaRlrbPuUa+INb2nH77AyUAk6ymB3x1Yh7FpyN7DknDrUSAyu8a/Qq7AY8qEvGOXSlMt2GzDZCYoUfwJswYoNW5r3Z0xG/50slWr5mzDyRngAu0wPvByHZyz2xFGWDCw9mwre87HpYBPv1dE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBniH4Pf; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBniH4Pf"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so2363910a12.2
        for <linux-sunxi@lists.linux.dev>; Fri, 14 Aug 2026 13:58:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786741086; cv=none;
        d=google.com; s=arc-20260327;
        b=ZmePErZzEVo87QDfjiJJVFviJU5IKpb646R5hiHRQlcnHKFzU+kmT+RbJVOXPwDOwJ
         lX+rJXBTHk1D4QdERLxp9CY5OPLatyGQr/r8M5nqzQhUxxo+WTmhPFxHReK2U8LtxfoM
         s/rTnC6BIRdoiKH+lPoOMyVc4nomWmbk6b+mV00P+t4XilYXjh0nTJSIlJNb0fjvp4BK
         F3b3fU+7W1JyDoxKn2jjoXEatfqbWS/JRVH8fBHJ7k3NN1qGrS/jpfS+y1GZOZa+evO0
         MCsnzx9hk7VGOAq9CGqTgn+Qm4iS3ebxWfzbd0pTD5ieKGRuKdipJkgPeiMcgx4Dltcc
         JXLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LOSc/4c9SbQQBCe93XY6xPCkzEFokZXSPeuKf38HAZs=;
        fh=tKBcE2mLdrAeSZZvWwVaZhcOot5o5rsf6H+FC2wWik0=;
        b=J6H5blaKe1qjh04h+kSC436xFN+n4dHNTKoVPrensGgC6RPYhp30E1x0Mvoe7dka9h
         vU+2w+MHpBYZoaQrCGVZSmKw4eGBVJ6JBCyT6LyhP2IUximCGRKaeEMxCD2aLCwhA4Yr
         848pHSI9jvvLZMOfaLeVAmum5QKkFqg9seoLVzCJJodNYN3eGGv9fdEjntFvfxag2ZVI
         TgkZQCQixIbow1NDchmEcZRgbF+4ZSu7DxLqf/43BHrlTw76mXv/A/s9mBmdJyF0l07/
         Ap8ZJq9pQQ+MkujSCXgx7TmNMWtpT5CL/erR3dj3Yqp7dymhwz8NIF04GPy6m1QnIsoL
         QaSg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786741086; x=1787345886; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LOSc/4c9SbQQBCe93XY6xPCkzEFokZXSPeuKf38HAZs=;
        b=KBniH4PfsiGE0Z91LLpOKJcoRL/+V0z/eR3a2UZzl8laHBQkVzW5edtWdXUdSrSufu
         v93hW7udhRyb+w2xN2yIKNf5VtcAPUgh3axUwLdm8nOULLRHR9OtQ1AFBLcgLX+J3aBo
         NDDBVkp6rjXdpz4acfCJJf9ap3xx3ritSUvc85iLmcaOC0e9H2SzjWBkTV2ynXlgQU44
         2qzGmSJeQFXbA9Shvl4NCgMghe+5LYC0y50NuHl5EbajXTsmKz0gTjpFWLPkjvA0xA09
         2E4HjcjiQ00GOoJT4kCBdgiT2zg0TEhP8GK7P4LIvJcJyaBU9kEfJLv0h+xHhse0Iz7/
         5gzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786741086; x=1787345886;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LOSc/4c9SbQQBCe93XY6xPCkzEFokZXSPeuKf38HAZs=;
        b=CdScIvYDiwzMQr4V6ru5PmVeHPUlv58elGGcGp8bzw2W6Bp27XyIAdNYCrgiFNYjqk
         x/HuoafQttqtKZGiLxob5gczNJkC8+FWimEVcE8+vpN5AWyd3I/A8kuepT14FgTahikB
         lEw9A0FKyeSecxzQ+F6ygWNyuZLigcW1Q8Yr8hIcuG96arDuT+YQfgnfreSLlUpx3s0n
         M2UHI+Ea4ouaOmPIpwptqaD4JfvB7g0VG+quqlboLcxdPsK6XRq5FEgFqP1maoOwN1/Q
         k+aoa5Z5OWfzFRLb9MwSuEbDujrrLP/cwp/QyUak9MyvzdJdPYh8bk2WfwrWW2UADAbX
         J+LA==
X-Gm-Message-State: AOJu0YwQJlRu37hxKlt6pOLMWAPxTBCRX3e/AUiNMmxUEHQm/sFtrO1T
	y+8E4GesqRr7GH/0MYLTFxinrVOYXbaLC/6ucQ+x46Tj+nFomm5HkixEArIBh+KB8eFJx5Aa/T6
	7PLfhtKIvjy11DKNPg2v1FU87GqJ/1Po=
X-Gm-Gg: AR+sD11loM76kjho67EObz763oyHsERYJ7RWtm5f51miG8JJ8B5w1I/Em/B2/uTqndW
	A3FT7lEURJJJGNnQEDOI5trsqePnWTxIXQcPPDECuEhcgnVTshO7fERkYA0wTIw0kBMNuJVPbdY
	qVkufBZfbf//bBcFZvNla1kmTGxfGZOrEm+UGdfXpg2XhlgsGrzHZWkOgepwxheqgz/v/zjMCz9
	DAZnrEe9ekJShMvt2ZJHiHM1wnh+2brhnE3gDYgbJmzQwij92f4GaeUGKPH71d2b1/BSXkD/eBo
	voG5+zddn3ufNFUAYBQ61FiDh5UD2q2qwKU3hgKkou94E6Px4mcmqoy061nN0NROTejk29P+RvA
	4uauNmrTBijjudv1XUk/pfShysZRnVT6nZnbYnZuCRN8YvMqVkLWUNwTQNggU7AKL1HNr+YZUuq
	c4dTek+1hY7h0/ZZUSz+5SJVobkrATGxxCKWtwtMRzzfdfoQkPgmTULH0=
X-Received: by 2002:a05:6402:914:b0:6a3:691a:9d71 with SMTP id
 4fb4d7f45d1cf-6a38a957c26mr4430136a12.11.1786741085853; Fri, 14 Aug 2026
 13:58:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727194208.10082-1-rosenp@gmail.com> <CAGb2v66=kgwUSNtkCVLROxCfbDuf_g70Y0qZ9ucfXsTD+f2NnA@mail.gmail.com>
In-Reply-To: <CAGb2v66=kgwUSNtkCVLROxCfbDuf_g70Y0qZ9ucfXsTD+f2NnA@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 14 Aug 2026 13:57:54 -0700
X-Gm-Features: AcwNN1X2VjIXLPSnb7iCG-Vzo6JnErx51Wj3qJ1nwrzVQVCAOL_rU0eaB-XX0V4
Message-ID: <CAKxU2N9MDwrEpVZ3Wm11K=kf2Q4Dq=nOTd20eux3iw4_fQy3JQ@mail.gmail.com>
Subject: Re: [PATCH] mailbox: sun6i: modernize probe and convert to fully managed
To: wens@kernel.org
Cc: linux-sunxi@lists.linux.dev, Jassi Brar <jassisinghbrar@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"open list:MAILBOX API" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 8:56=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Tue, Jul 28, 2026 at 3:42=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wr=
ote:
> >
> > Replace irq_of_parse_and_map() with platform_get_irq() and move both
> > IRQ and MMIO resource acquisition to the top of probe, before any
> > allocations, for early error exit.
>
> There's no real reason for the code movement. It's going to fail once
> or maybe twice at the most. And the ones you moved are the least likely
> to fail.
Not my experience. They can and do return -EPROBE_DEFER with some
drivers. No idea about this one in particular.
>
> Now I could see replacing irq_of_parse_and_map() with the more standard
> platform_get_irq(), but you haven't given a reasonable reason. And it
> should be a separate patch since it has nothing to do with streamlining
> the error handling and dropping the remove function.
>
> > Switch from devm_clk_get() + clk_prepare_enable() to
> > devm_clk_get_enabled(), which combines both operations and registers
> > devres callbacks for automatic disable/unprepare on unbind. This
> > eliminates the manual err_disable_unprepare error path and the
> > remove callback entirely.
> >
> > Use devm_mbox_controller_register() for devres-managed controller
> > registration, and drop the remove callback and platform_set_drvdata()
> > which are no longer needed.
>
> These two are what are important.
>
> > Assisted-by: Opencode:Big-Pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/mailbox/sun6i-msgbox.c | 62 ++++++++++------------------------
> >  1 file changed, 18 insertions(+), 44 deletions(-)
> >
> > diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msg=
box.c
> > index 6ba6920f4645..28d8636afad2 100644
> > --- a/drivers/mailbox/sun6i-msgbox.c
> > +++ b/drivers/mailbox/sun6i-msgbox.c
> > @@ -198,7 +198,17 @@ static int sun6i_msgbox_probe(struct platform_devi=
ce *pdev)
> >         struct mbox_chan *chans;
> >         struct reset_control *reset;
> >         struct sun6i_msgbox *mbox;
> > +       void __iomem *regs;
> >         int i, ret;
> > +       int irq;
> > +
> > +       irq =3D platform_get_irq(pdev, 0);
> > +       if (irq < 0)
> > +               return irq;
> > +
> > +       regs =3D devm_platform_ioremap_resource(pdev, 0);
> > +       if (IS_ERR(regs))
> > +               return PTR_ERR(regs);
> >
> >         mbox =3D devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> >         if (!mbox)
> > @@ -211,24 +221,18 @@ static int sun6i_msgbox_probe(struct platform_dev=
ice *pdev)
> >         for (i =3D 0; i < NUM_CHANS; ++i)
> >                 chans[i].con_priv =3D mbox;
> >
> > -       mbox->clk =3D devm_clk_get(dev, NULL);
> > +       mbox->clk =3D devm_clk_get_enabled(dev, NULL);
> >         if (IS_ERR(mbox->clk)) {
> >                 ret =3D PTR_ERR(mbox->clk);
> >                 dev_err(dev, "Failed to get clock: %d\n", ret);
> >                 return ret;
> >         }
> >
> > -       ret =3D clk_prepare_enable(mbox->clk);
> > -       if (ret) {
> > -               dev_err(dev, "Failed to enable clock: %d\n", ret);
> > -               return ret;
> > -       }
> > -
> >         reset =3D devm_reset_control_get_exclusive(dev, NULL);
> >         if (IS_ERR(reset)) {
> >                 ret =3D PTR_ERR(reset);
> >                 dev_err(dev, "Failed to get reset control: %d\n", ret);
> > -               goto err_disable_unprepare;
> > +               return ret;
> >         }
> >
> >         /*
> > @@ -242,25 +246,17 @@ static int sun6i_msgbox_probe(struct platform_dev=
ice *pdev)
> >         ret =3D reset_control_deassert(reset);
> >         if (ret) {
> >                 dev_err(dev, "Failed to deassert reset: %d\n", ret);
> > -               goto err_disable_unprepare;
> > +               return ret;
> >         }
> >
> > -       mbox->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > -       if (IS_ERR(mbox->regs)) {
> > -               ret =3D PTR_ERR(mbox->regs);
> > -               dev_err(dev, "Failed to map MMIO resource: %d\n", ret);
> > -               goto err_disable_unprepare;
> > -       }
> > +       mbox->regs =3D regs;
> >
> >         /* Disable all IRQs for this end of the msgbox. */
> >         writel(0, mbox->regs + LOCAL_IRQ_EN_REG);
> >
> > -       ret =3D devm_request_irq(dev, irq_of_parse_and_map(dev->of_node=
, 0),
> > -                              sun6i_msgbox_irq, 0, dev_name(dev), mbox=
);
> > -       if (ret) {
> > -               dev_err(dev, "Failed to register IRQ handler: %d\n", re=
t);
> > -               goto err_disable_unprepare;
> > -       }
> > +       ret =3D devm_request_irq(dev, irq, sun6i_msgbox_irq, 0, dev_nam=
e(dev), mbox);
> > +       if (ret)
> > +               return ret;
> >
> >         mbox->controller.dev           =3D dev;
> >         mbox->controller.ops           =3D &sun6i_msgbox_chan_ops;
> > @@ -271,29 +267,8 @@ static int sun6i_msgbox_probe(struct platform_devi=
ce *pdev)
> >         mbox->controller.txpoll_period =3D 5;
> >
> >         spin_lock_init(&mbox->lock);
> > -       platform_set_drvdata(pdev, mbox);
> > -
> > -       ret =3D mbox_controller_register(&mbox->controller);
> > -       if (ret) {
> > -               dev_err(dev, "Failed to register controller: %d\n", ret=
);
> > -               goto err_disable_unprepare;
> > -       }
> > -
> > -       return 0;
> > -
> > -err_disable_unprepare:
> > -       clk_disable_unprepare(mbox->clk);
> > -
> > -       return ret;
> > -}
> > -
> > -static void sun6i_msgbox_remove(struct platform_device *pdev)
> > -{
> > -       struct sun6i_msgbox *mbox =3D platform_get_drvdata(pdev);
> >
> > -       mbox_controller_unregister(&mbox->controller);
> > -       /* See the comment in sun6i_msgbox_probe about the reset line. =
*/
> > -       clk_disable_unprepare(mbox->clk);
> > +       return devm_mbox_controller_register(&mbox->controller);
>
> Like Sashiko said, this doesn't compile. All devm_*() functions require
> a |struct device *| parameter.
>
>
> Build testing your patch before sending it is a must.
>
>
> ChenYu
>
> >  }
> >
> >  static const struct of_device_id sun6i_msgbox_of_match[] =3D {
> > @@ -308,7 +283,6 @@ static struct platform_driver sun6i_msgbox_driver =
=3D {
> >                 .of_match_table =3D sun6i_msgbox_of_match,
> >         },
> >         .probe =3D sun6i_msgbox_probe,
> > -       .remove =3D sun6i_msgbox_remove,
> >  };
> >  module_platform_driver(sun6i_msgbox_driver);
> >
> > --
> > 2.55.0
> >
