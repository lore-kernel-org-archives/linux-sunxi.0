Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E922F50
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Mar 2022 10:08:43 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id m11-20020a17090a7f8b00b001beef6143a8so10289788pjl.4
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Mar 2022 02:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XBkUs4cDEh7cGme8nvi6DRoD473BuT/65cMNIANA6kg=;
        b=qqrFxDtNPmebmRhEKI/0NjR3h2txIrNZsbHIQyirapsMejHKtBJuUXpC4CuzUQzy+j
         7MBEHl7XyYnB/ef82iHhANzR+4q20BBxcogXCUYB0LsFC2JqEeoLpAOuJkSbCc7cu28A
         clAv2F2t2CE4+vkhZhB2HqFJT32fps1QI2s3zke/fEA4NnOQpHXhxyTrQkzQz40eghSK
         WXbOSfPutXZvev9BDgaJeOCbWG1zRmJc/ipd7eoJDrG0TSjsJ1uZqeGSArOyvOvXWJ6a
         bW333jvmpEJR0qMgLuTAXaqDnWSblgwpmeuc/diJcDQ6PfmJs13o33t1EYAUToYr1Ujj
         7y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XBkUs4cDEh7cGme8nvi6DRoD473BuT/65cMNIANA6kg=;
        b=FUVMa2iHq9NA5pBqoEvvOSvk0NsyYlLHZKkwfAMXkr5ntzODI91V2D8J+LotT6XGLB
         ofhNBJIkGThLcsIDGy1pGkdnErDsU5Bs+CL1gbH6TuVFn9KVM8vnjYY0D+vPLp6W02Wc
         u1bgJGK5Jpr17EoE8l4JMcbVeIsLvRHHysZOaaSWsytP3Ke2xHibR6NGKHGY3sq9ybxZ
         Utp7MCnNCpuvarV5iHUzMkUsyRkT9YrN+E6/0DinaXvNaeu4dwWtGiBkkwSffiu7FpEw
         kUKEJdSuIjOAFfxD6pQOpMHnLiSvl5Bm5G6ADJZQeX3x04nH8D8kENNlsaI6Jbsh9cto
         Sybw==
X-Gm-Message-State: AOAM533lsDYFQ/FnuxK+Ujh0CFgRCZnjaFbZjLXj60bvRe9P+IRdBoQv
	0iqXZqb+szathOwKxqxRWamXbfi0RQ+/T9tf4X60zA==
X-Google-Smtp-Source: ABdhPJygr/AMMTAACupNOM2mgpqdZHpcr+uF0kJe3Q4pIdneeG8n+Deg6+8AbstBqDC3C6sQYMJcE3tkSaDCqZi08a8=
X-Received: by 2002:a17:90b:906:b0:1be:e765:882 with SMTP id
 bo6-20020a17090b090600b001bee7650882mr15235648pjb.152.1647079723285; Sat, 12
 Mar 2022 02:08:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1647006877.git.mchehab@kernel.org> <b1803d005b2f671d238fc8579882a493c173d1ef.1647006877.git.mchehab@kernel.org>
In-Reply-To: <b1803d005b2f671d238fc8579882a493c173d1ef.1647006877.git.mchehab@kernel.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Sat, 12 Mar 2022 11:08:32 +0100
Message-ID: <CAG3jFyvxb5Q+bYu4=SReSku9=LrGD2h_O10W40+0+XsHk1XLJQ@mail.gmail.com>
Subject: Re: [PATCH v2 38/38] drivers: media: platform: move some manufacturer entries
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Chen-Yu Tsai <wens@csie.org>, Dmitry Osipenko <digetx@gmail.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Heiko Stuebner <heiko@sntech.de>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, 
	Ming Qian <ming.qian@nxp.com>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Mar 2022 at 15:10, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>
> As there are 4 manufacturer's directories with multiple sources
> (qcom, rockchip, sti and sunxi), move the sources from
> platform/Kconfig to their specific Konfig files.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v2 00/38] at: https://lore.kernel.org/all/cover.1647006877.git.mchehab@kernel.org/
>
>  drivers/media/platform/Kconfig          | 13 +++----------
>  drivers/media/platform/qcom/Kconfig     |  3 +++
>  drivers/media/platform/rockchip/Kconfig |  3 +++
>  drivers/media/platform/sti/Kconfig      |  5 +++++
>  drivers/media/platform/sunxi/Kconfig    |  2 ++
>  5 files changed, 16 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/media/platform/qcom/Kconfig
>  create mode 100644 drivers/media/platform/rockchip/Kconfig
>  create mode 100644 drivers/media/platform/sti/Kconfig
>
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 527e9f08008b..a3ad25c6a56c 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -85,23 +85,16 @@ source "drivers/media/platform/mtk-vpu/Kconfig"
>  source "drivers/media/platform/nxp/Kconfig"
>  source "drivers/media/platform/omap3isp/Kconfig"
>  source "drivers/media/platform/omap/Kconfig"
> -source "drivers/media/platform/qcom/camss/Kconfig"
> -source "drivers/media/platform/qcom/venus/Kconfig"
> +source "drivers/media/platform/qcom/Kconfig"
>  source "drivers/media/platform/renesas/Kconfig"
> -source "drivers/media/platform/rockchip/rga/Kconfig"
> -source "drivers/media/platform/rockchip/rkisp1/Kconfig"
> +source "drivers/media/platform/rockchip/Kconfig"
>  source "drivers/media/platform/s3c-camif/Kconfig"
>  source "drivers/media/platform/s5p-g2d/Kconfig"
>  source "drivers/media/platform/s5p-jpeg/Kconfig"
>  source "drivers/media/platform/s5p-mfc/Kconfig"
> -source "drivers/media/platform/sti/bdisp/Kconfig"
> -source "drivers/media/platform/sti/c8sectpfe/Kconfig"
> -source "drivers/media/platform/sti/delta/Kconfig"
> -source "drivers/media/platform/sti/hva/Kconfig"
> +source "drivers/media/platform/sti/Kconfig"
>  source "drivers/media/platform/stm32/Kconfig"
>  source "drivers/media/platform/sunxi/Kconfig"
> -source "drivers/media/platform/sunxi/sun8i-di/Kconfig"
> -source "drivers/media/platform/sunxi/sun8i-rotate/Kconfig"
>  source "drivers/media/platform/tegra/vde/Kconfig"
>  source "drivers/media/platform/ti-vpe/Kconfig"
>  source "drivers/media/platform/via/Kconfig"
> diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
> new file mode 100644
> index 000000000000..aa2428f641d3
> --- /dev/null
> +++ b/drivers/media/platform/qcom/Kconfig
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +source "drivers/media/platform/qcom/camss/Kconfig"
> +source "drivers/media/platform/qcom/venus/Kconfig"
> diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/platform/rockchip/Kconfig
> new file mode 100644
> index 000000000000..c7ba06388780
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/Kconfig
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +source "drivers/media/platform/rockchip/rga/Kconfig"
> +source "drivers/media/platform/rockchip/rkisp1/Kconfig"
> diff --git a/drivers/media/platform/sti/Kconfig b/drivers/media/platform/sti/Kconfig
> new file mode 100644
> index 000000000000..9fb5e78a92cf
> --- /dev/null
> +++ b/drivers/media/platform/sti/Kconfig
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +source "drivers/media/platform/sti/bdisp/Kconfig"
> +source "drivers/media/platform/sti/c8sectpfe/Kconfig"
> +source "drivers/media/platform/sti/delta/Kconfig"
> +source "drivers/media/platform/sti/hva/Kconfig"
> diff --git a/drivers/media/platform/sunxi/Kconfig b/drivers/media/platform/sunxi/Kconfig
> index 7151cc249afa..a10032215b08 100644
> --- a/drivers/media/platform/sunxi/Kconfig
> +++ b/drivers/media/platform/sunxi/Kconfig
> @@ -2,3 +2,5 @@
>
>  source "drivers/media/platform/sunxi/sun4i-csi/Kconfig"
>  source "drivers/media/platform/sunxi/sun6i-csi/Kconfig"
> +source "drivers/media/platform/sunxi/sun8i-di/Kconfig"
> +source "drivers/media/platform/sunxi/sun8i-rotate/Kconfig"
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
