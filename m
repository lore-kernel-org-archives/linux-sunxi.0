Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBE732AAAB
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Jul 2026 15:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785254216; cv=none; b=KktF+cmImiO6bGoYB4IB2W8WzVA7XeugANYyGpWcFaE7w8KEKsda2yRYaJmJ5CXubRkA3jsgvRRPWBuE7AhdIbO9fmMh1Bl3TtizFcmNjVnifuVd4y3KF1kvz8bVSOlWhzCrT6OLrBZF5SCFRWJl7j4SgHvaj/xSsnyJzSwiZV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785254216; c=relaxed/simple;
	bh=0Yiit7bJCmGRMJuEdSkjG6tqfkrlaoL4RnSP0amAV5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UfCeq7pHrKapgA0qk8XAZE0mk/DKn6MsFmchjKJlBkhesJ7xfzDp1JempEAQ0v6cT+dZ41sbfpIzmAJVCB8Q/RIqLaCUq8YlMy/dOV/zK/wAQL3lIbVc1IWtjyoeLBe5FYrouHgpHzVVgca0z/DF6e4Wya3KjKuSWIXK6rE6KNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9Yg5r8V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9Yg5r8V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420DD1F00A3A
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Jul 2026 15:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785254215;
	bh=OnE+b0dufgmuTUYVj4V+PdswXaAJ7opl2QehGSoGDuk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=X9Yg5r8VHZU27YmZjz/p20xLSnwQ1Ctjug8iPWHroQV+CshsSMnBC4N/YZ0ln7HUF
	 z65JfqcmIh+DT9FMjlnltu7rAUNPuwVoEiqCDz6vIGHnOX+4QUBN3gjliQJZZ2hWKu
	 +0dTI3nMe9PVlMH2synM5U2FWoYSSIQsYZLgM/TZBy2UVEWKUtEWJu8EdllQvEmyIs
	 tn/SF/5uJ+m8KTDjscZCdHgkg6Z6Un99QTycDkgtRyuVS2/nXH9oDFrlTDxquzWMTU
	 ldjQmtycXoJSvsy3qtnnkRa+BMMJ34mVZ+hpCTy7NucwGqvzxX8AteRMACFkijweWo
	 Ab54T5qOj0qvw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c86ce9e29so36948451fa.3
        for <linux-sunxi@lists.linux.dev>; Tue, 28 Jul 2026 08:56:55 -0700 (PDT)
X-Gm-Message-State: AOJu0YzlcdqJvcjL33+V2iREvaKuUUW/13+3j1r/zigDZzP2zBXobDjr
	Rm/2ApidIIFF7UYZXtAsgs7bSaBL9bMsKbFxGYRm0ZBbz84V+vJv4bxrs39CepoiOY5piNWu1BK
	/RsOQyUbCONv+i60v945cnKrtvO7hjW0=
X-Received: by 2002:a2e:a9a5:0:b0:39b:35bd:e708 with SMTP id
 38308e7fff4ca-39f51cdef30mr5872591fa.1.1785254213689; Tue, 28 Jul 2026
 08:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727194208.10082-1-rosenp@gmail.com>
In-Reply-To: <20260727194208.10082-1-rosenp@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Jul 2026 23:56:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v66=kgwUSNtkCVLROxCfbDuf_g70Y0qZ9ucfXsTD+f2NnA@mail.gmail.com>
X-Gm-Features: AUfX_mz7aI0nbIJpfKBate6Q0TeFbJm95gK2ISGivDgpxVudCD5tFbKP4Fr98_k
Message-ID: <CAGb2v66=kgwUSNtkCVLROxCfbDuf_g70Y0qZ9ucfXsTD+f2NnA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: sun6i: modernize probe and convert to fully managed
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Jassi Brar <jassisinghbrar@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"open list:MAILBOX API" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 3:42=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Replace irq_of_parse_and_map() with platform_get_irq() and move both
> IRQ and MMIO resource acquisition to the top of probe, before any
> allocations, for early error exit.

There's no real reason for the code movement. It's going to fail once
or maybe twice at the most. And the ones you moved are the least likely
to fail.

Now I could see replacing irq_of_parse_and_map() with the more standard
platform_get_irq(), but you haven't given a reasonable reason. And it
should be a separate patch since it has nothing to do with streamlining
the error handling and dropping the remove function.

> Switch from devm_clk_get() + clk_prepare_enable() to
> devm_clk_get_enabled(), which combines both operations and registers
> devres callbacks for automatic disable/unprepare on unbind. This
> eliminates the manual err_disable_unprepare error path and the
> remove callback entirely.
>
> Use devm_mbox_controller_register() for devres-managed controller
> registration, and drop the remove callback and platform_set_drvdata()
> which are no longer needed.

These two are what are important.

> Assisted-by: Opencode:Big-Pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/mailbox/sun6i-msgbox.c | 62 ++++++++++------------------------
>  1 file changed, 18 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/mailbox/sun6i-msgbox.c b/drivers/mailbox/sun6i-msgbo=
x.c
> index 6ba6920f4645..28d8636afad2 100644
> --- a/drivers/mailbox/sun6i-msgbox.c
> +++ b/drivers/mailbox/sun6i-msgbox.c
> @@ -198,7 +198,17 @@ static int sun6i_msgbox_probe(struct platform_device=
 *pdev)
>         struct mbox_chan *chans;
>         struct reset_control *reset;
>         struct sun6i_msgbox *mbox;
> +       void __iomem *regs;
>         int i, ret;
> +       int irq;
> +
> +       irq =3D platform_get_irq(pdev, 0);
> +       if (irq < 0)
> +               return irq;
> +
> +       regs =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(regs))
> +               return PTR_ERR(regs);
>
>         mbox =3D devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
>         if (!mbox)
> @@ -211,24 +221,18 @@ static int sun6i_msgbox_probe(struct platform_devic=
e *pdev)
>         for (i =3D 0; i < NUM_CHANS; ++i)
>                 chans[i].con_priv =3D mbox;
>
> -       mbox->clk =3D devm_clk_get(dev, NULL);
> +       mbox->clk =3D devm_clk_get_enabled(dev, NULL);
>         if (IS_ERR(mbox->clk)) {
>                 ret =3D PTR_ERR(mbox->clk);
>                 dev_err(dev, "Failed to get clock: %d\n", ret);
>                 return ret;
>         }
>
> -       ret =3D clk_prepare_enable(mbox->clk);
> -       if (ret) {
> -               dev_err(dev, "Failed to enable clock: %d\n", ret);
> -               return ret;
> -       }
> -
>         reset =3D devm_reset_control_get_exclusive(dev, NULL);
>         if (IS_ERR(reset)) {
>                 ret =3D PTR_ERR(reset);
>                 dev_err(dev, "Failed to get reset control: %d\n", ret);
> -               goto err_disable_unprepare;
> +               return ret;
>         }
>
>         /*
> @@ -242,25 +246,17 @@ static int sun6i_msgbox_probe(struct platform_devic=
e *pdev)
>         ret =3D reset_control_deassert(reset);
>         if (ret) {
>                 dev_err(dev, "Failed to deassert reset: %d\n", ret);
> -               goto err_disable_unprepare;
> +               return ret;
>         }
>
> -       mbox->regs =3D devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(mbox->regs)) {
> -               ret =3D PTR_ERR(mbox->regs);
> -               dev_err(dev, "Failed to map MMIO resource: %d\n", ret);
> -               goto err_disable_unprepare;
> -       }
> +       mbox->regs =3D regs;
>
>         /* Disable all IRQs for this end of the msgbox. */
>         writel(0, mbox->regs + LOCAL_IRQ_EN_REG);
>
> -       ret =3D devm_request_irq(dev, irq_of_parse_and_map(dev->of_node, =
0),
> -                              sun6i_msgbox_irq, 0, dev_name(dev), mbox);
> -       if (ret) {
> -               dev_err(dev, "Failed to register IRQ handler: %d\n", ret)=
;
> -               goto err_disable_unprepare;
> -       }
> +       ret =3D devm_request_irq(dev, irq, sun6i_msgbox_irq, 0, dev_name(=
dev), mbox);
> +       if (ret)
> +               return ret;
>
>         mbox->controller.dev           =3D dev;
>         mbox->controller.ops           =3D &sun6i_msgbox_chan_ops;
> @@ -271,29 +267,8 @@ static int sun6i_msgbox_probe(struct platform_device=
 *pdev)
>         mbox->controller.txpoll_period =3D 5;
>
>         spin_lock_init(&mbox->lock);
> -       platform_set_drvdata(pdev, mbox);
> -
> -       ret =3D mbox_controller_register(&mbox->controller);
> -       if (ret) {
> -               dev_err(dev, "Failed to register controller: %d\n", ret);
> -               goto err_disable_unprepare;
> -       }
> -
> -       return 0;
> -
> -err_disable_unprepare:
> -       clk_disable_unprepare(mbox->clk);
> -
> -       return ret;
> -}
> -
> -static void sun6i_msgbox_remove(struct platform_device *pdev)
> -{
> -       struct sun6i_msgbox *mbox =3D platform_get_drvdata(pdev);
>
> -       mbox_controller_unregister(&mbox->controller);
> -       /* See the comment in sun6i_msgbox_probe about the reset line. */
> -       clk_disable_unprepare(mbox->clk);
> +       return devm_mbox_controller_register(&mbox->controller);

Like Sashiko said, this doesn't compile. All devm_*() functions require
a |struct device *| parameter.


Build testing your patch before sending it is a must.


ChenYu

>  }
>
>  static const struct of_device_id sun6i_msgbox_of_match[] =3D {
> @@ -308,7 +283,6 @@ static struct platform_driver sun6i_msgbox_driver =3D=
 {
>                 .of_match_table =3D sun6i_msgbox_of_match,
>         },
>         .probe =3D sun6i_msgbox_probe,
> -       .remove =3D sun6i_msgbox_remove,
>  };
>  module_platform_driver(sun6i_msgbox_driver);
>
> --
> 2.55.0
>
