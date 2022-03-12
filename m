Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0079369
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Mar 2022 11:24:16 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id hw13so23373354ejc.9
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Mar 2022 03:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DHn3Z9DbBWxS+qG/5fkUXSjzX/ysPi9E9ORNMdllnKk=;
        b=kkSC3OQyWDvmBtjsWkiaaTlMWw1apV6WOkznHVdrQC2g6A73uvcOdiVddCZ4WmhRgK
         tapQfoTQPM9SIJ7egCe+HowcSIwGJ6DFpayAuyhNh0dEw5TDt9v33kwgnGeFe56inKk7
         I7iJTAiHtsgaqELfkcZ188s5P7nTQLXlr2O5uiAF1vxWylgRXGkOyhy9pWRqA2vracOr
         3RQSL7vAvqm/KWccPbK0+pZ/ns1I6ayw65u+qZJs7psNb7cNFcR7MmC1VmBvsngI1Zfk
         E2WNgMW9CTJwDiqfseJkNroNuD4FXjb66w5e1CYXGe/N/jP5QyPJQUXEBOTiEtFRTPdD
         qjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DHn3Z9DbBWxS+qG/5fkUXSjzX/ysPi9E9ORNMdllnKk=;
        b=Mb0aPPt3SvDfhoGH4WBVG4FeummypPVRLALpYwkqsnU7x05XQrNW+I2yy4td4FXZYc
         HUNaUzMyVYsV7RDbT7780WJpsfPeYCgHpcHJp4Oz319wTKE8E8qpPsV6EDlAiUC5KmKD
         lUlKb3P0AXeXhsKxpn3pvgCe5dtXYu4Sk0bCgvlip8vijIFNj4Gozg9PnOeR+bU/olZK
         ksRqw6/niwuCpxBdbjpbQUaaVYfy+PPxS1jdEBVJ8E75L4+CBiV8aEIX+5u9dbfhvQW4
         sfEJ4nteWwrG1QLVquWky7Z2vtyfSjwR+aKbwgeM6Vmt4UeYDF1jHuNxwxQfldVLwuoa
         IZ+A==
X-Gm-Message-State: AOAM532rrDt2zY9hOqhKLQ34vC4IxIx7J29AeyM5psVeH7tHJpGgigWt
	ecBKel/FIgcNngP3uhHWp3A=
X-Google-Smtp-Source: ABdhPJxkK1jYw+LV7yIu6/7xBnf2kmuhZKV25FlCDoQ4gasSi3FXz/oUizywpSyVzlGMCWvjaH3cFQ==
X-Received: by 2002:a17:907:a42a:b0:6db:c8f4:b732 with SMTP id sg42-20020a170907a42a00b006dbc8f4b732mr247947ejc.284.1647084254955;
        Sat, 12 Mar 2022 03:24:14 -0800 (PST)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id x17-20020a05640226d100b00418509be2b3sm1577983edd.10.2022.03.12.03.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 03:24:14 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Chen-Yu Tsai <wens@csie.org>, Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Ming Qian <ming.qian@nxp.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 28/38] media: platform: sun8i-di: move config to its own file
Date: Sat, 12 Mar 2022 12:24:13 +0100
Message-ID: <5546853.DvuYhMxLoT@kista>
In-Reply-To: <e551e94675be747c5377abed564fa73d3233e259.1647006877.git.mchehab@kernel.org>
References: <cover.1647006877.git.mchehab@kernel.org> <e551e94675be747c5377abed564fa73d3233e259.1647006877.git.mchehab@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 11. marec 2022 ob 15:07:41 CET je Mauro Carvalho Chehab napisal(a):
> In order to better organize the platform/Kconfig, place
> sun8i-di-specific config stuff on a separate Kconfig file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
> To avoid mailbombing on a large number of people, only mailing lists were C/
C on the cover.
> See [PATCH v2 00/38] at: https://lore.kernel.org/all/cover.
1647006877.git.mchehab@kernel.org/
> 
>  drivers/media/platform/Kconfig                | 15 +--------------
>  drivers/media/platform/sunxi/sun8i-di/Kconfig | 14 ++++++++++++++
>  2 files changed, 15 insertions(+), 14 deletions(-)
>  create mode 100644 drivers/media/platform/sunxi/sun8i-di/Kconfig
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 460ad793b89b..37103f24979f 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -70,6 +70,7 @@ source "drivers/media/platform/s3c-camif/Kconfig"
>  source "drivers/media/platform/s5p-g2d/Kconfig"
>  source "drivers/media/platform/sti/hva/Kconfig"
>  source "drivers/media/platform/stm32/Kconfig"
> +source "drivers/media/platform/sunxi/sun8i-di/Kconfig"
>  
>  config VIDEO_MUX
>  	tristate "Video Multiplexer"
> @@ -240,20 +241,6 @@ config VIDEO_TI_VPE_DEBUG
>  	help
>  	  Enable debug messages on VPE driver.
>  
> -config VIDEO_SUN8I_DEINTERLACE
> -	tristate "Allwinner Deinterlace driver"
> -	depends on V4L_MEM2MEM_DRIVERS
> -	depends on VIDEO_DEV && VIDEO_V4L2
> -	depends on ARCH_SUNXI || COMPILE_TEST
> -	depends on COMMON_CLK && OF
> -	depends on PM
> -	select VIDEOBUF2_DMA_CONTIG
> -	select V4L2_MEM2MEM_DEV
> -	help
> -	   Support for the Allwinner deinterlace unit with scaling
> -	   capability found on some SoCs, like H3.
> -	   To compile this driver as a module choose m here.
> -
>  config VIDEO_SUN8I_ROTATE
>  	tristate "Allwinner DE2 rotation driver"
>  	depends on V4L_MEM2MEM_DRIVERS
> diff --git a/drivers/media/platform/sunxi/sun8i-di/Kconfig b/drivers/media/
platform/sunxi/sun8i-di/Kconfig
> new file mode 100644
> index 000000000000..8d762e664d45
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun8i-di/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_SUN8I_DEINTERLACE
> +	tristate "Allwinner Deinterlace driver"
> +	depends on V4L_MEM2MEM_DRIVERS
> +	depends on VIDEO_DEV && VIDEO_V4L2
> +	depends on ARCH_SUNXI || COMPILE_TEST
> +	depends on COMMON_CLK && OF
> +	depends on PM
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_MEM2MEM_DEV
> +	help
> +	   Support for the Allwinner deinterlace unit with scaling
> +	   capability found on some SoCs, like H3.
> +	   To compile this driver as a module choose m here.
> -- 
> 2.35.1
> 
> 


