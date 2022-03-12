Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F44369
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Mar 2022 11:25:12 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id yy13so24260161ejb.2
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Mar 2022 03:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fx0MrYefQPXmP/XkFOCjZt2OHaGLfQKFTyYOY0yPe9w=;
        b=gaf2zOWy1w6FBA6+DRGE+ymkly6rJbMD+1y/WVH7LfobmhPDArS2489NFlbZqaYLXu
         EX//j+8IDLl6ijB3uSgu08XPSNCpn68rwicL4DeWgYgnz+tm37M6cwKgT7TraKQrbwLD
         xZ5w0cT76gS4R7LqImqhwzG7zI1ho6lwOqJT3Hw0hHT7C5Gc8KLX7C8a07QM8iL9aAPh
         N2q31V83w5/3/8Uj1rK8EbbEcnkyRjrOloCIV8TGC88FvUiRv84Jb0hB65XuyWy/xBBQ
         JA+spDq39+sGWg51GyengXW7vEZ2/afHIqrM2vT837hOreuVaWYBSfJ4PiOdqIXvHxJe
         T/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fx0MrYefQPXmP/XkFOCjZt2OHaGLfQKFTyYOY0yPe9w=;
        b=VpR2Lqj6W4PWgGlO12ZZ0C24Q2ZPhxhDjVXsIPsB47ndzlBsDfKPbb8Y/YDomECeTP
         dVC9LKFhJQx2qZBvAtG/uL8lY7GALYxKGNPOhJLgXpHKMr2Qz2Upt0kwwM0JY9thZYVD
         CoMKO4BwGwDGkKGbm58WpTFSYiUx5Sl3ujLvRlHXAfcfoN6HvxcUcfi703W2siAI1tAz
         Jpi0jjHOnsjWir+BBhPK/wcTHGVeX8VlIWwaCJItaszu0ffvn3Xip7+MeZNDInwU9eSa
         GisZ5sqAS3rUXeWnR5KrS/MeWRxmtDXk1obWe5KT2lGN4FESvwp2T4x9b2wng/dYT8b7
         pLmA==
X-Gm-Message-State: AOAM530FI2X7iCwhnRJRL1kNGyPDA9TUXqDnafjderxFJRJ7/uggsODJ
	5wNUyzttoHExk8qdR5oDgww=
X-Google-Smtp-Source: ABdhPJwd+u8szoFSR1CMM8z8hBobMLvJ4Z1fdinUtjhYzvSepYT5FB3cQTiUZmVDovs8o2cWc/NeBw==
X-Received: by 2002:a17:907:7e8f:b0:6da:6352:a7be with SMTP id qb15-20020a1709077e8f00b006da6352a7bemr11651882ejc.612.1647084310533;
        Sat, 12 Mar 2022 03:25:10 -0800 (PST)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id ka6-20020a170907990600b006ce54c95e3csm4186601ejc.161.2022.03.12.03.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 03:25:10 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Heiko Stuebner <heiko@sntech.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Ming Qian <ming.qian@nxp.com>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 38/38] drivers: media: platform: move some manufacturer entries
Date: Sat, 12 Mar 2022 12:25:08 +0100
Message-ID: <4720554.31r3eYUQgx@kista>
In-Reply-To: <b1803d005b2f671d238fc8579882a493c173d1ef.1647006877.git.mchehab@kernel.org>
References: <cover.1647006877.git.mchehab@kernel.org> <b1803d005b2f671d238fc8579882a493c173d1ef.1647006877.git.mchehab@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 11. marec 2022 ob 15:07:51 CET je Mauro Carvalho Chehab napisal(a):
> As there are 4 manufacturer's directories with multiple sources
> (qcom, rockchip, sti and sunxi), move the sources from
> platform/Kconfig to their specific Konfig files.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/
C on the cover.
> See [PATCH v2 00/38] at: https://lore.kernel.org/all/cover.
1647006877.git.mchehab@kernel.org/
> 
>  drivers/media/platform/Kconfig          | 13 +++----------
>  drivers/media/platform/qcom/Kconfig     |  3 +++
>  drivers/media/platform/rockchip/Kconfig |  3 +++
>  drivers/media/platform/sti/Kconfig      |  5 +++++
>  drivers/media/platform/sunxi/Kconfig    |  2 ++

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

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
> diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/
qcom/Kconfig
> new file mode 100644
> index 000000000000..aa2428f641d3
> --- /dev/null
> +++ b/drivers/media/platform/qcom/Kconfig
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +source "drivers/media/platform/qcom/camss/Kconfig"
> +source "drivers/media/platform/qcom/venus/Kconfig"
> diff --git a/drivers/media/platform/rockchip/Kconfig b/drivers/media/platform/
rockchip/Kconfig
> new file mode 100644
> index 000000000000..c7ba06388780
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/Kconfig
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +source "drivers/media/platform/rockchip/rga/Kconfig"
> +source "drivers/media/platform/rockchip/rkisp1/Kconfig"
> diff --git a/drivers/media/platform/sti/Kconfig b/drivers/media/platform/sti/
Kconfig
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
> diff --git a/drivers/media/platform/sunxi/Kconfig b/drivers/media/platform/
sunxi/Kconfig
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
> 


