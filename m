Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46A51D130D
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Aug 2024 05:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724304755; cv=none; b=XcQ9Wjz/D7V4QH8xhb3dzSREkh0WaJI0M9cBilW9FtuMZrJW5lIyt7buZtTTeAiPpaHRxNPrdap4ljuQ18DHRJAMz0Z8KVOAQH25SsH0cpMc1FHopyTf14pVJtK3DlO6W2hv7lWYgzF60Zts37cTfmu05oFdAK7NwQJt4x+WxO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724304755; c=relaxed/simple;
	bh=oGuBlGASeDM0PAhYo5Tsh4jwNm5LAU+oys0vcLq7MUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LO5725dyPBvQCUUJRKffSJ+aN5ygwJhRM6+BLANCK+vb1ei38w8MLgxp7fXuQ+eJPnYPJr3HSFvSrWbbmtAV/A2xxeJgLS8ejSkLxsBufdWzj6A1cOeK7CguvJAa5cvQsWkH8RF5ALxm289ocbBXg005GtdBQDaxnJP5UbxYRfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qkrbmk4L; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qkrbmk4L"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2689f749702so226520fac.3
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Aug 2024 22:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724304752; x=1724909552; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UrNcon8FxQ69dF6b3a0HOOhGowvaUdP7iX4oRD7w0ns=;
        b=Qkrbmk4LBCx0deWgg0rhqqcnZM8dw/qhmu1P56zSA/ysYqJiwdLaAB5wZUTUsac6x5
         3YN57MH/SIwcIm3fUJg3bVX8KdbhG3KOVwstsqeB1cMXqQA/TnIJYa5tGwidgDOfoFrL
         prXnI2xRmXE4IruUy8Yjf7kRjo/IW9URyo8+z1JmiuOs/DlTaoppdDt5EyUxYYo6VEmg
         IRI3u5D50sOA0sD8TiNwKlZMyFzK6eMBvO39mXp8MS5vgJ5mRJ5U7Cx/0qmy8B3ha8s5
         a2PkG/gkYHbiyG6pL6B5tp9w0LHgNN4kucat0WR91LhCGvT88niW0GdF8e0bS19/ukA+
         8zdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724304752; x=1724909552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UrNcon8FxQ69dF6b3a0HOOhGowvaUdP7iX4oRD7w0ns=;
        b=MKnPs2Zly0NrIOQ8AKsD3bNNQD/O9dPAfTVk58wSTqblO3LJotUFk0AGGk7awbXo98
         GlKvJj0m6SaTpxyGlAI/EiNXFVkOVLOdVH+/QMQG7UvYEJC6oLbVYED17kYDL9gzyJgZ
         Dt2c10wK+OSFlUomIIDYkY+5LCc76Ucs9zPDFUA3gAt/Q4p5gaB+MBDvdn26Y22wDEPv
         kc78Ymd16CU0l9LuDpu32JtRhT2PPuIyJFnHh+hvlj/mDC0XipKNzLHJfj7TSB45vuwG
         FYwf+XGaXDE2lzMpEEA9/P8bYrone0d6ziLZJNkz4an85JS9EswsUUQkJzG70EXI4yyY
         JbcA==
X-Forwarded-Encrypted: i=1; AJvYcCWcIInGU9yDuai1uH4DLC3RMUOcfJH+Uw3alqCcYjsGi1zC0VJNek5cc3TvLRgbF+MlPFhtSZbHEpubJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6OeA7njpPzpHYkRrjKeIRdVVvG8r1SLmvcBrGDgDBRRs9jMqO
	M9EYtDI4eykhfNFW5xB4eBHzkzArjKaNLu0wJsrgt+/37YqN7N6Z9eBYtuKcl/nTMdG73Eca15p
	OTGvzRDE3h5UFVdmmeR6qY45KxTk=
X-Google-Smtp-Source: AGHT+IF8wUe9zW9RcIEjiBnPyx9kIJJy5aif9535MDtTffLfG4WtqgzHMWlBveNmITDMjDwayfjZPgCEac3kl0Nqkbg=
X-Received: by 2002:a05:6870:3924:b0:260:f5ab:62ff with SMTP id
 586e51a60fabf-2738bebec4emr4674262fac.44.1724304751615; Wed, 21 Aug 2024
 22:32:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240820125840.9032-1-rongqianfeng@vivo.com>
In-Reply-To: <20240820125840.9032-1-rongqianfeng@vivo.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 22 Aug 2024 11:02:16 +0530
Message-ID: <CANAwSgR8i2BbNkQtDXTWi+kOfWtxwHe9E=sLa_8ZSU2bvTO-Yg@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: Use devm_clk_get_enabled() helpers
To: Rong Qianfeng <rongqianfeng@vivo.com>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"

Hi Rong,

On Tue, 20 Aug 2024 at 18:30, Rong Qianfeng <rongqianfeng@vivo.com> wrote:
>
> Replace devm_clk_get() and clk_prepare_enable() with
> devm_clk_get_enabled() that also disables and unprepares it on
> driver detach.
>
> Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
> ---
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 13 +++----------
>  drivers/gpu/drm/sun4i/sun6i_drc.c         | 15 ++++-----------
>  drivers/gpu/drm/sun4i/sun8i_mixer.c       | 13 +++----------
>  3 files changed, 10 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> index ab6c0c6cd0e2..057dceaf079e 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> @@ -284,16 +284,11 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
>                 return PTR_ERR(fsl_dev->regmap);
>         }
>
> -       fsl_dev->clk = devm_clk_get(dev, "dcu");
> +       fsl_dev->clk = devm_clk_get_enabled(dev, "dcu");
>         if (IS_ERR(fsl_dev->clk)) {
>                 dev_err(dev, "failed to get dcu clock\n");
>                 return PTR_ERR(fsl_dev->clk);

You can use dev_err_probe it will be fine in all cases for clocks.to
get enabled.
         return dev_err_probe(dev, PTR_ERR(fsl_dev->clk),
                                "failed to get duc clock\n");

Thanks
-Anand
>         }
> -       ret = clk_prepare_enable(fsl_dev->clk);
> -       if (ret < 0) {
> -               dev_err(dev, "failed to enable dcu clk\n");
> -               return ret;
> -       }
>
>         pix_clk_in = devm_clk_get(dev, "pix");
>         if (IS_ERR(pix_clk_in)) {
> @@ -311,8 +306,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
>                         div_ratio_shift, 8, CLK_DIVIDER_ROUND_CLOSEST, NULL);
>         if (IS_ERR(fsl_dev->pix_clk)) {
>                 dev_err(dev, "failed to register pix clk\n");
> -               ret = PTR_ERR(fsl_dev->pix_clk);
> -               goto disable_clk;
> +               return PTR_ERR(fsl_dev->pix_clk);
>         }
>
>         fsl_dev->tcon = fsl_tcon_init(dev);
> @@ -341,8 +335,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
>         drm_dev_put(drm);
>  unregister_pix_clk:
>         clk_unregister(fsl_dev->pix_clk);
> -disable_clk:
> -       clk_disable_unprepare(fsl_dev->clk);
> +
>         return ret;
>  }
>
> diff --git a/drivers/gpu/drm/sun4i/sun6i_drc.c b/drivers/gpu/drm/sun4i/sun6i_drc.c
> index 0d342f43fa93..f263ad282828 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_drc.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_drc.c
> @@ -42,33 +42,28 @@ static int sun6i_drc_bind(struct device *dev, struct device *master,
>                 return ret;
>         }
>
> -       drc->bus_clk = devm_clk_get(dev, "ahb");
> +       drc->bus_clk = devm_clk_get_enabled(dev, "ahb");
>         if (IS_ERR(drc->bus_clk)) {
>                 dev_err(dev, "Couldn't get our bus clock\n");
>                 ret = PTR_ERR(drc->bus_clk);
>                 goto err_assert_reset;
>         }
> -       clk_prepare_enable(drc->bus_clk);
>
> -       drc->mod_clk = devm_clk_get(dev, "mod");
> +       drc->mod_clk = devm_clk_get_enabled(dev, "mod");
>         if (IS_ERR(drc->mod_clk)) {
>                 dev_err(dev, "Couldn't get our mod clock\n");
>                 ret = PTR_ERR(drc->mod_clk);
> -               goto err_disable_bus_clk;
> +               goto err_assert_reset;
>         }
>
>         ret = clk_set_rate_exclusive(drc->mod_clk, 300000000);
>         if (ret) {
>                 dev_err(dev, "Couldn't set the module clock frequency\n");
> -               goto err_disable_bus_clk;
> +               goto err_assert_reset;
>         }
>
> -       clk_prepare_enable(drc->mod_clk);
> -
>         return 0;
>
> -err_disable_bus_clk:
> -       clk_disable_unprepare(drc->bus_clk);
>  err_assert_reset:
>         reset_control_assert(drc->reset);
>         return ret;
> @@ -80,8 +75,6 @@ static void sun6i_drc_unbind(struct device *dev, struct device *master,
>         struct sun6i_drc *drc = dev_get_drvdata(dev);
>
>         clk_rate_exclusive_put(drc->mod_clk);
> -       clk_disable_unprepare(drc->mod_clk);
> -       clk_disable_unprepare(drc->bus_clk);
>         reset_control_assert(drc->reset);
>  }
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> index bd0fe2c6624e..ebf00676a76d 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -507,19 +507,18 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>                 return ret;
>         }
>
> -       mixer->bus_clk = devm_clk_get(dev, "bus");
> +       mixer->bus_clk = devm_clk_get_enabled(dev, "bus");
>         if (IS_ERR(mixer->bus_clk)) {
>                 dev_err(dev, "Couldn't get the mixer bus clock\n");
>                 ret = PTR_ERR(mixer->bus_clk);
>                 goto err_assert_reset;
>         }
> -       clk_prepare_enable(mixer->bus_clk);
>
> -       mixer->mod_clk = devm_clk_get(dev, "mod");
> +       mixer->mod_clk = devm_clk_get_enabled(dev, "mod");
>         if (IS_ERR(mixer->mod_clk)) {
>                 dev_err(dev, "Couldn't get the mixer module clock\n");
>                 ret = PTR_ERR(mixer->mod_clk);
> -               goto err_disable_bus_clk;
> +               goto err_assert_reset;
>         }
>
>         /*
> @@ -530,8 +529,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>         if (mixer->cfg->mod_rate)
>                 clk_set_rate(mixer->mod_clk, mixer->cfg->mod_rate);
>
> -       clk_prepare_enable(mixer->mod_clk);
> -
>         list_add_tail(&mixer->engine.list, &drv->engine_list);
>
>         base = sun8i_blender_base(mixer);
> @@ -592,8 +589,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
>
>         return 0;
>
> -err_disable_bus_clk:
> -       clk_disable_unprepare(mixer->bus_clk);
>  err_assert_reset:
>         reset_control_assert(mixer->reset);
>         return ret;
> @@ -606,8 +601,6 @@ static void sun8i_mixer_unbind(struct device *dev, struct device *master,
>
>         list_del(&mixer->engine.list);
>
> -       clk_disable_unprepare(mixer->mod_clk);
> -       clk_disable_unprepare(mixer->bus_clk);
>         reset_control_assert(mixer->reset);
>  }
>
> --
> 2.39.0
>
>
