Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E877719066E
	for <linux-sunxi@lists.linux.dev>; Tue, 20 Aug 2024 13:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724161939; cv=none; b=SaZmtJT5zzyHX4qbgWUavhvn8sLNIjYsVNXo5gh78f+qQYF0SLLzxth9IBFCFiOhiSgtiwnDElQHTYhIYw8kAt5FpeFBP+n2QEX3f0AHzLScCTd+uiXDPT+biok0tVvnlxOo56LQLUC9iAExnT4YAniFCIaKZ5et0HJvuUVGBVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724161939; c=relaxed/simple;
	bh=tFQDbOrrK8JEgyM9VxBKUV250trDAMVk14ib0swUtUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eG/fO/dHeSNqe1h/a9NCQEM53csuyeQU2/Q91RFuhmH1Z/52J+nVP8QVwKUbnYAtl+NLoAXEfuO4aI635HG/1vFKdPscLN+dyRsdA2/v3oE6BSPVOe3O7XJoKGrE8r5NEReI2LqS6sCYYQnA3ApixvozabwV+TycCAh2vwdnIM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53310adb4c3so6135420e87.3
        for <linux-sunxi@lists.linux.dev>; Tue, 20 Aug 2024 06:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724161932; x=1724766732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wkbHStRdvzSNzDsZ0E26ASF0D3xldI1pUu7ZQSeV75Y=;
        b=xGWQ1tnA709B++jVqTqsEkn90p2sEQNYGMR1Vq38kdIku+XwjAuEQ9vdS811HWPEwX
         K23du3UxtrkXb+jhgpPsKY87zK6kU3WmuvDAzH6OfdVjivPQyA+GI3+PYV/10v04yEZV
         YWsNDvwMSESQULqG2J7tn6pBrcwJJxwOHDfjq5FORYbemlPzyp5tuOcpFxZb0iPZ7EII
         OCJnYORrI4kLhfWwK3oeOM06hdiyJn6XFLK5z0BbL5rcec2yl5elGaeCxCvYPvk68zTL
         NabpfyvkCxaG0j+LFOW1KtOpje8pXIBB4Ojh3NgpV2SxWyZ5lCXf0sRzFT7sdsRKwyVf
         ALDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWx67y60XLJeQz02DgmuIAhtRkAleWZ9EPnMO1zFEDr/ZEzLJoGexEFfV64NdAnGG5WUnW+O0Iqp4tKg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsEuPdwoaKq/agoET9rfMTLnJANxV4ldQXbL2V6PcRiOIKQmQe
	J75BWHM0gpWwvPmt/cvekK4v9H33MOMI5fbN8ona4GaVyuV8xowpFEVM24ci
X-Google-Smtp-Source: AGHT+IE0R5o8URx+VzZgUCaOT77gXYI391hebMlCBoW/NDR0U9vU4OcXUa0z9siqsxkUXCFxzacuYA==
X-Received: by 2002:a05:6512:128b:b0:52e:999b:7c01 with SMTP id 2adb3069b0e04-5331c6df972mr9616453e87.48.1724161931567;
        Tue, 20 Aug 2024 06:52:11 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d3ff672sm1764292e87.162.2024.08.20.06.52.11
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 06:52:11 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f3edb2d908so6863511fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 20 Aug 2024 06:52:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXaILyrfTFwQcZQy50O1jlfkC7e/Ktkmsapyn4EtA2CrxgoKoM0AkeQwJFSJloqdSZaPjye+kqeW20chQ==@lists.linux.dev
X-Received: by 2002:a2e:4c1a:0:b0:2f3:d82b:1959 with SMTP id
 38308e7fff4ca-2f3d82b19f8mr50948401fa.23.1724161930944; Tue, 20 Aug 2024
 06:52:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240820125840.9032-1-rongqianfeng@vivo.com>
In-Reply-To: <20240820125840.9032-1-rongqianfeng@vivo.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 20 Aug 2024 21:51:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v67-qfTb3ZaUZh2mF-utTgDhiPzCaERc9b8x6nxaHp8-cg@mail.gmail.com>
Message-ID: <CAGb2v67-qfTb3ZaUZh2mF-utTgDhiPzCaERc9b8x6nxaHp8-cg@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: Use devm_clk_get_enabled() helpers
To: Rong Qianfeng <rongqianfeng@vivo.com>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 20, 2024 at 8:59=E2=80=AFPM Rong Qianfeng <rongqianfeng@vivo.co=
m> wrote:
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
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/=
fsl-dcu/fsl_dcu_drm_drv.c
> index ab6c0c6cd0e2..057dceaf079e 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> @@ -284,16 +284,11 @@ static int fsl_dcu_drm_probe(struct platform_device=
 *pdev)
>                 return PTR_ERR(fsl_dev->regmap);
>         }
>
> -       fsl_dev->clk =3D devm_clk_get(dev, "dcu");
> +       fsl_dev->clk =3D devm_clk_get_enabled(dev, "dcu");
>         if (IS_ERR(fsl_dev->clk)) {
>                 dev_err(dev, "failed to get dcu clock\n");
>                 return PTR_ERR(fsl_dev->clk);
>         }
> -       ret =3D clk_prepare_enable(fsl_dev->clk);
> -       if (ret < 0) {
> -               dev_err(dev, "failed to enable dcu clk\n");
> -               return ret;
> -       }
>
>         pix_clk_in =3D devm_clk_get(dev, "pix");
>         if (IS_ERR(pix_clk_in)) {
> @@ -311,8 +306,7 @@ static int fsl_dcu_drm_probe(struct platform_device *=
pdev)
>                         div_ratio_shift, 8, CLK_DIVIDER_ROUND_CLOSEST, NU=
LL);
>         if (IS_ERR(fsl_dev->pix_clk)) {
>                 dev_err(dev, "failed to register pix clk\n");
> -               ret =3D PTR_ERR(fsl_dev->pix_clk);
> -               goto disable_clk;
> +               return PTR_ERR(fsl_dev->pix_clk);
>         }
>
>         fsl_dev->tcon =3D fsl_tcon_init(dev);
> @@ -341,8 +335,7 @@ static int fsl_dcu_drm_probe(struct platform_device *=
pdev)
>         drm_dev_put(drm);
>  unregister_pix_clk:
>         clk_unregister(fsl_dev->pix_clk);
> -disable_clk:
> -       clk_disable_unprepare(fsl_dev->clk);
> +
>         return ret;
>  }
>
> diff --git a/drivers/gpu/drm/sun4i/sun6i_drc.c b/drivers/gpu/drm/sun4i/su=
n6i_drc.c
> index 0d342f43fa93..f263ad282828 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_drc.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_drc.c
> @@ -42,33 +42,28 @@ static int sun6i_drc_bind(struct device *dev, struct =
device *master,
>                 return ret;
>         }
>
> -       drc->bus_clk =3D devm_clk_get(dev, "ahb");
> +       drc->bus_clk =3D devm_clk_get_enabled(dev, "ahb");

devm_* is actually not the correct thing to use in this case, as this
is the component bind function, not the probe function. The lifetimes
are not the same.

We get away with devm_*_get because it's just a reference count,
but devm_*_get_enabled is going to be worse, because the clock
or whatever will not get disabled upon unbind. Same for sun8i_mixer.

I just got bitten by this in an ASoC component driver, but the
problem is similar.


ChenYu

>         if (IS_ERR(drc->bus_clk)) {
>                 dev_err(dev, "Couldn't get our bus clock\n");
>                 ret =3D PTR_ERR(drc->bus_clk);
>                 goto err_assert_reset;
>         }
> -       clk_prepare_enable(drc->bus_clk);
>
> -       drc->mod_clk =3D devm_clk_get(dev, "mod");
> +       drc->mod_clk =3D devm_clk_get_enabled(dev, "mod");
>         if (IS_ERR(drc->mod_clk)) {
>                 dev_err(dev, "Couldn't get our mod clock\n");
>                 ret =3D PTR_ERR(drc->mod_clk);
> -               goto err_disable_bus_clk;
> +               goto err_assert_reset;
>         }
>
>         ret =3D clk_set_rate_exclusive(drc->mod_clk, 300000000);
>         if (ret) {
>                 dev_err(dev, "Couldn't set the module clock frequency\n")=
;
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
> @@ -80,8 +75,6 @@ static void sun6i_drc_unbind(struct device *dev, struct=
 device *master,
>         struct sun6i_drc *drc =3D dev_get_drvdata(dev);
>
>         clk_rate_exclusive_put(drc->mod_clk);
> -       clk_disable_unprepare(drc->mod_clk);
> -       clk_disable_unprepare(drc->bus_clk);
>         reset_control_assert(drc->reset);
>  }
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index bd0fe2c6624e..ebf00676a76d 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -507,19 +507,18 @@ static int sun8i_mixer_bind(struct device *dev, str=
uct device *master,
>                 return ret;
>         }
>
> -       mixer->bus_clk =3D devm_clk_get(dev, "bus");
> +       mixer->bus_clk =3D devm_clk_get_enabled(dev, "bus");
>         if (IS_ERR(mixer->bus_clk)) {
>                 dev_err(dev, "Couldn't get the mixer bus clock\n");
>                 ret =3D PTR_ERR(mixer->bus_clk);
>                 goto err_assert_reset;
>         }
> -       clk_prepare_enable(mixer->bus_clk);
>
> -       mixer->mod_clk =3D devm_clk_get(dev, "mod");
> +       mixer->mod_clk =3D devm_clk_get_enabled(dev, "mod");
>         if (IS_ERR(mixer->mod_clk)) {
>                 dev_err(dev, "Couldn't get the mixer module clock\n");
>                 ret =3D PTR_ERR(mixer->mod_clk);
> -               goto err_disable_bus_clk;
> +               goto err_assert_reset;
>         }
>
>         /*
> @@ -530,8 +529,6 @@ static int sun8i_mixer_bind(struct device *dev, struc=
t device *master,
>         if (mixer->cfg->mod_rate)
>                 clk_set_rate(mixer->mod_clk, mixer->cfg->mod_rate);
>
> -       clk_prepare_enable(mixer->mod_clk);
> -
>         list_add_tail(&mixer->engine.list, &drv->engine_list);
>
>         base =3D sun8i_blender_base(mixer);
> @@ -592,8 +589,6 @@ static int sun8i_mixer_bind(struct device *dev, struc=
t device *master,
>
>         return 0;
>
> -err_disable_bus_clk:
> -       clk_disable_unprepare(mixer->bus_clk);
>  err_assert_reset:
>         reset_control_assert(mixer->reset);
>         return ret;
> @@ -606,8 +601,6 @@ static void sun8i_mixer_unbind(struct device *dev, st=
ruct device *master,
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
