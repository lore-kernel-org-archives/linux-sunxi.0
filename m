Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F34B369
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Mar 2022 11:23:52 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id d10so24189745eje.10
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Mar 2022 03:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3f+ibCQHYhTXQxUBNEK2juHi8lBsmqsUoSUZZ8pGA8w=;
        b=WFsof7h/DWoEA4aa3AcV6OW1zKC+pvshdXwFujuf9dDsuK2yISxJ13BkVmZS+54QuY
         Pm7rSBHQVBapi8rTUm5LEodgjxh9KvBg88OTVmSdHjN441gskyv83nigVpQ1bO0AHX2o
         hFEGKTP8fDlYM8t4m/Eu4A7tTJaJefGgKKO76HSTZBTF9gE3vi6OhscfBzwbO6iAO2x2
         0mXZjrqXXdxMJ+/oF5+1tSKSGW3ikbakxba5wPD5bjf/amBym4dWdQ3UZjEoCQzM+Qos
         tKjG04iJNHBO3eTxZ8OZ3kiIvR68nMPYUSO/yP1pbgTEBgLvRBmp0prKz+QIitPaYmzV
         tcUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3f+ibCQHYhTXQxUBNEK2juHi8lBsmqsUoSUZZ8pGA8w=;
        b=ELTg6zT4n6ARayEeBbom0nwaU7gd9Bv2n2MMfzbJNr/jN3LyVMUSvn0x15Pp0XJSAs
         P6lZLNiEvuR5oP3evc+gy0V9bS9m15hDDEZCuFlXb7dKlczPjz34UR8uMcVGYAlUwcGM
         R85XtIdm3iuctiezBcxXhwAA14tS0gvUGx6DF7hHh8TzXPS49HCbKRAEeQvgXH2xhbXT
         DXz6UeaeJx8Mk8CsLA5B5iNgU6LBv4uoWRIsBWV3nT1oZ1eKu+Y6p9fmPXEpmn1fZ3PW
         4CZWibvpTjdZRxWcRJcmFBR4k8w6GPkg0pe+4snslbATWaQkuAWqMr64VtxxucY2BRpX
         +GPA==
X-Gm-Message-State: AOAM530sGT4M/d06E4XgZTBHzwCMBfzjGHpEnb3pUr5fctz7/38JaO7l
	zrsYn25UWHCHh6XcGuGoD+I=
X-Google-Smtp-Source: ABdhPJxgA2H/bN1nGZKBG20n06Z/JGFlfDtEt1jrDZkcOzT5HlHGrlcgclUA2ihc7ep5CyZC5OTpnA==
X-Received: by 2002:a17:907:2d90:b0:6d8:9fc9:ac36 with SMTP id gt16-20020a1709072d9000b006d89fc9ac36mr11900287ejc.28.1647084230371;
        Sat, 12 Mar 2022 03:23:50 -0800 (PST)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id zk1-20020a17090733c100b006dab4a41df8sm4071929ejb.111.2022.03.12.03.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 03:23:49 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Chen-Yu Tsai <wens@csie.org>, Dmitry Osipenko <digetx@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Ming Qian <ming.qian@nxp.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 29/38] media: platform: sun8i-rotate: move config to its own file
Date: Sat, 12 Mar 2022 12:23:48 +0100
Message-ID: <2619690.mvXUDI8C0e@kista>
In-Reply-To: <bd96344ebc563aa632a3a1c5ddad7b7d7ee6fc0a.1647006877.git.mchehab@kernel.org>
References: <cover.1647006877.git.mchehab@kernel.org> <bd96344ebc563aa632a3a1c5ddad7b7d7ee6fc0a.1647006877.git.mchehab@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 11. marec 2022 ob 15:07:42 CET je Mauro Carvalho Chehab napisal(a):
> In order to better organize the platform/Kconfig, place
> sun8i-rotate-specific config stuff on a separate Kconfig file.
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
>  drivers/media/platform/Kconfig                    | 14 +-------------
>  drivers/media/platform/sunxi/sun8i-rotate/Kconfig | 14 ++++++++++++++
>  2 files changed, 15 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/Kconfig
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 37103f24979f..8d0fa9670eaa 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -71,6 +71,7 @@ source "drivers/media/platform/s5p-g2d/Kconfig"
>  source "drivers/media/platform/sti/hva/Kconfig"
>  source "drivers/media/platform/stm32/Kconfig"
>  source "drivers/media/platform/sunxi/sun8i-di/Kconfig"
> +source "drivers/media/platform/sunxi/sun8i-rotate/Kconfig"
>  
>  config VIDEO_MUX
>  	tristate "Video Multiplexer"
> @@ -241,19 +242,6 @@ config VIDEO_TI_VPE_DEBUG
>  	help
>  	  Enable debug messages on VPE driver.
>  
> -config VIDEO_SUN8I_ROTATE
> -	tristate "Allwinner DE2 rotation driver"
> -	depends on V4L_MEM2MEM_DRIVERS
> -	depends on VIDEO_DEV && VIDEO_V4L2
> -	depends on ARCH_SUNXI || COMPILE_TEST
> -	depends on COMMON_CLK && OF
> -	depends on PM
> -	select VIDEOBUF2_DMA_CONTIG
> -	select V4L2_MEM2MEM_DEV
> -	help
> -	   Support for the Allwinner DE2 rotation unit.
> -	   To compile this driver as a module choose m here.
> -
>  config VIDEO_TEGRA_VDE
>  	tristate "NVIDIA Tegra Video Decoder Engine driver"
>  	depends on V4L_MEM2MEM_DRIVERS
> diff --git a/drivers/media/platform/sunxi/sun8i-rotate/Kconfig b/drivers/
media/platform/sunxi/sun8i-rotate/Kconfig
> new file mode 100644
> index 000000000000..64a8ea76e917
> --- /dev/null
> +++ b/drivers/media/platform/sunxi/sun8i-rotate/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config VIDEO_SUN8I_ROTATE
> +	tristate "Allwinner DE2 rotation driver"
> +	depends on V4L_MEM2MEM_DRIVERS
> +	depends on VIDEO_DEV && VIDEO_V4L2
> +	depends on ARCH_SUNXI || COMPILE_TEST
> +	depends on COMMON_CLK && OF
> +	depends on PM
> +	select VIDEOBUF2_DMA_CONTIG
> +	select V4L2_MEM2MEM_DEV
> +	help
> +	   Support for the Allwinner DE2 rotation unit.
> +	   To compile this driver as a module choose m here.
> -- 
> 2.35.1
> 
> 


