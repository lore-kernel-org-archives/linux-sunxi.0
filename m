Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9724A7F5
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 18:32:56 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id dk23so5100903ejb.8
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 11:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1ykLgsZ2QlE1M7OwXCk5WzQH9ZVlust3l+kbAqWy/V0=;
        b=eazrrzFemQukZR+kzqWVGV9QkujKB62L2LH7gA7suk0eQH04G1Lb9QyMlUYPNi/M3Q
         QWBpyViQOe+Rdi4oaKO7Rk1bOWXXMllDhtR3NokDZWndrD6OVerGMkTIPEYPEG2jQfzJ
         qMKLMblIqHjVrOk93Hf+xh6WGnzCc6eyogEdf9W31QN0H7p/c6r+FcEOJQHp3EsDn8Sq
         jM2spyG0FqYQDHRkR53co9d9ZTCFMvvQ1Hm8oF654+xl5CjpVSg5mBLxKglYvgyAQRRE
         AQPV5em/r0rGvR7PXH6Id+Vs6YUKrIhGhU5W0KdnqKxt3nUoXCtMjc33Q3EJdev8MZt1
         pulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1ykLgsZ2QlE1M7OwXCk5WzQH9ZVlust3l+kbAqWy/V0=;
        b=S4wa+GSCZcBfwoDubd9RBn4BMBAdOk1508Kkvjhqzh3QmqqTm7GiFq83plPFKjfnA4
         +fCvUOALg+cpG4Kk+8/U4dmp2/IziPkR1yppuSLZ6Cf/QiCNvh/eZ9H4RW0OhMlCffTr
         3ytk7OCVSrtaaV8iRkal79o19OWmQ5CinNpYxad+kEx7uhnVFLjC/GcNLK31FzpMG6E3
         P5IY2DEg7eMc2OTakodCvrwGlzXM1nHZu5VCRn9FCuemaRydtqOMoahvASgBuMkfn6f/
         CPcF2ddnZ6yPw4lzgchSXuy6e4AT84JfuPLQ78fPjG0WX4of+dPw5H6o4a58YTiAgOCt
         3O4w==
X-Gm-Message-State: AOAM533Eaqy5ePIm0QIrxykVEtQsjCL/7D/B9mHQ03zz3X1gnPs999Ts
	7B19BUFb/KtQF7Pb8P5vmBKwDsqpDyefug==
X-Google-Smtp-Source: ABdhPJxVXR6+zaLC+fJtfU/oZaqR14NMUWhuS5XKtR5VqDK78U8hcwb8xay7XMkmuAvdo4EsASj1+Q==
X-Received: by 2002:a17:906:4408:b0:6da:bec1:2808 with SMTP id x8-20020a170906440800b006dabec12808mr27582935ejo.543.1651084374856;
        Wed, 27 Apr 2022 11:32:54 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id c4-20020a170906170400b006e87c7b8ffasm7256447eje.32.2022.04.27.11.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 11:32:54 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 07/45] media: sun6i-csi: Tidy up Kconfig
Date: Wed, 27 Apr 2022 20:32:52 +0200
Message-ID: <5560019.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20220415152811.636419-8-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-8-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:27:33 CEST je Paul Kocialkowski napisal(a):
> Update the option title and help, group related options together,
> add dependency on VIDEO_DEV since the driver uses it and update the
> description.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/media/platform/sunxi/sun6i-csi/Kconfig | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/Kconfig
> b/drivers/media/platform/sunxi/sun6i-csi/Kconfig index
> 965fbd937841..fe50f9bb8fd1 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/Kconfig
> +++ b/drivers/media/platform/sunxi/sun6i-csi/Kconfig
> @@ -1,13 +1,15 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config VIDEO_SUN6I_CSI
> -	tristate "Allwinner V3s Camera Sensor Interface driver"
> -	depends on V4L_PLATFORM_DRIVERS
> -	depends on VIDEO_DEV && COMMON_CLK  && HAS_DMA && PM
> +	tristate "Allwinner A31 Camera Sensor Interface (CSI) Driver"
> +	depends on V4L_PLATFORM_DRIVERS && VIDEO_DEV
>  	depends on ARCH_SUNXI || COMPILE_TEST
> +	depends on PM && COMMON_CLK && HAS_DMA
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEOBUF2_DMA_CONTIG
> -	select REGMAP_MMIO
>  	select V4L2_FWNODE
> +	select REGMAP_MMIO
>  	help
> -	   Support for the Allwinner Camera Sensor Interface Controller on 
V3s.
> +	   Support for the Allwinner A31 Camera Sensor Interface (CSI)
> +	   controller, also found on other platforms such as the A83T, H3,
> +	   V3/V3s or A64.




