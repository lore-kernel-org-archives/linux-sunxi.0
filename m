Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5CBCA78
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Aug 2023 09:12:27 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-58fb73e26a6so54746107b3.1
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Aug 2023 02:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692868346; x=1693473146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8QWfWxMile/WgNFhvo8ZVwxIXeay3uNKMaVUJZ+Cgck=;
        b=uAMAMZb+Pl3xrF//1gf2QoomFCCwtreyRs4xAteq5++ErX/Jag+1pyV60vqF13g6qc
         EWQYleaROyiNyiEmpy54E9f7zGOrUG370OYBBm53fN4GEz471yoC/pFSQ4b14keMgBFm
         7ng6XIVQDxokSMklzIx+h8oZmarkKwbhTXrdGoqOePObuS5InclzCeCyXR6taZUn2/wm
         U8QcZHCo3Fu9mOTcf8df+zbEUZ95ISfluXVW/6MIO2ViQ1iN12idqCJ7OBm8cAynaU/6
         8Rsxe2AbXcTdn7pUXHPXDkQsstCnPF7swZ8nB3HO7IXLrfEtfHeOeBuSelO97JOAqEdm
         5Qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692868346; x=1693473146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8QWfWxMile/WgNFhvo8ZVwxIXeay3uNKMaVUJZ+Cgck=;
        b=gWiXETPCi19W1u65Bvdp36yg5bEx9/tQWFKyA0BijUIgmvgqQkzBeyK3/Yr4vXc7vA
         0haiECp7/0lJZj8XYdy5vKcdXN8s9gHwFk8nNKvJvT7zj45TPGMt+ngb6g1bxvmLy1c6
         LacN3IkZklZXyhtwujV5WQQ5u/nkxyLSwBFYOS/AOq8ejMfM4lpZF/1WqBzs3/LUyiF4
         rrD+TnoUd09s2+PDvnQ+gItnV6lLsdIV3o2VWKAicdv3w/Kf3jf7+C1fGa5mnPuu45kz
         9L8pYRNvU3vSENDgp9JuY1whPKVYBt2LXKtgQcLBi20XL/p7DVW73Tn95F3qD3LKoMz9
         UuPA==
X-Gm-Message-State: AOJu0YwcInUVVSI5cDSgvehVtpFYuzlasyBzE7cOSXNGWACTC7UnfiLH
	vuzRFUt20myLnlldTlmDf/bZYYjdF/MyiJIx+m4TCA==
X-Google-Smtp-Source: AGHT+IG3MvSq6xCe2a9q8hrZuopq70FerXK1DSmW4enmcJthTLxeat5RRxOKu4JoydhBbHioOu9VOWz1zigWQTudXgY=
X-Received: by 2002:a0d:d713:0:b0:56d:d58:82b7 with SMTP id
 z19-20020a0dd713000000b0056d0d5882b7mr16106989ywd.23.1692868346583; Thu, 24
 Aug 2023 02:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230823170438.2489746-1-robh@kernel.org>
In-Reply-To: <20230823170438.2489746-1-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Aug 2023 11:11:49 +0200
Message-ID: <CAPDyKFrO5B-WoWgKYbogTwUEwCqm_0A_NEn0XV8hdQtpOkE0yQ@mail.gmail.com>
Subject: Re: [PATCH v2] genpd: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Aug 2023 at 19:05, Rob Herring <robh@kernel.org> wrote:
>
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied for next, thanks!

Kind regards
Uffe

> ---
> v2: Previously sent for drivers/soc/. Gathered up files which got moved
>     to genpd to new patch.
> ---
>  drivers/genpd/mediatek/mtk-pm-domains.c | 2 +-
>  drivers/genpd/mediatek/mtk-scpsys.c     | 2 +-
>  drivers/genpd/sunxi/sun20i-ppu.c        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/genpd/mediatek/mtk-pm-domains.c b/drivers/genpd/mediatek/mtk-pm-domains.c
> index 354249cc1b12..ee962804b830 100644
> --- a/drivers/genpd/mediatek/mtk-pm-domains.c
> +++ b/drivers/genpd/mediatek/mtk-pm-domains.c
> @@ -8,8 +8,8 @@
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/of.h>
>  #include <linux/of_clk.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/regmap.h>
> diff --git a/drivers/genpd/mediatek/mtk-scpsys.c b/drivers/genpd/mediatek/mtk-scpsys.c
> index 7a668888111c..b374d01fdac7 100644
> --- a/drivers/genpd/mediatek/mtk-scpsys.c
> +++ b/drivers/genpd/mediatek/mtk-scpsys.c
> @@ -7,7 +7,7 @@
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/mfd/syscon.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/regulator/consumer.h>
> diff --git a/drivers/genpd/sunxi/sun20i-ppu.c b/drivers/genpd/sunxi/sun20i-ppu.c
> index 98cb41d36560..8700f9dd5f75 100644
> --- a/drivers/genpd/sunxi/sun20i-ppu.c
> +++ b/drivers/genpd/sunxi/sun20i-ppu.c
> @@ -5,7 +5,7 @@
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/reset.h>
> --
> 2.40.1
>
