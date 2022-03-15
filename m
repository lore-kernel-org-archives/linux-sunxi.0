Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13067A
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Mar 2022 19:51:28 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a8so43826577ejc.8
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Mar 2022 12:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c4mW0RIi6ae0ro8RnphpYWbFSmPVIVZ/Yq/iQ15Ckcc=;
        b=VkovmwjNTFIcCmhapNNDEz0ANIJtO1Eo5FmGf1ZyJKNtWOiVrrHj45CObw+UwQSV4e
         wJeQfjsGyrHMPS+WUN2mHLED6ydXQsFVwKIo8O5k6PjN/M8OONaxc6/WrTwplNxlLGNt
         sru4h639itvUkezFz+Lgu9hOsiV+gkhfdPZUoLyPnNQwMki3e1wcteL4BhebPdQExLYr
         KgCWH8kcA+t6q6AsBvADshjq6otkargoJsCXmJAeGXpCzf4n58Qbt8lzFhrgSq8STi1o
         lHrmIE7G67hZvJzXPvmTbzDhZ6PYnG9b2tmYqUC0yC/jP2HwdIIRYNgHq1YJ6YfRM91a
         S+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c4mW0RIi6ae0ro8RnphpYWbFSmPVIVZ/Yq/iQ15Ckcc=;
        b=UZFyREJLbqrIEVgrdLmKVjEH56aKGykEOshjA8wuyXGzZqfDd37VJ5Ja4XxfG1mcuO
         xtkidCpX5GVlIr3JuXrzl2pbV+y1wNLKCukWqQwMsv7irIuxbOoSyXJeX064U+zAQFXa
         LGmaFMpEiWy7y5k5UPQ1/hR1GttITbs6smjx4AHdIzfZwLHD6V9ncK7yy6HQsDMSdUhN
         hsx6LeR19jhPXZxVIFdJ2F6C/CyYgqrTlcR3HTFgqsJnTTp7hL6bOtRc22m+b/r+g43p
         opZnx+HjIBJNmvFy7VjEgN6nlEMWDQXC4xqNluqxA++EMhS7s7s7XkGgvwW5jmr1szia
         Teag==
X-Gm-Message-State: AOAM532a47R1xgNE9zoc3jSd5Gh2HnWUdscLB4bCYIA6fM34UuHmFuFt
	78wNslRu845LSuuQN9rrpJE=
X-Google-Smtp-Source: ABdhPJwxOJVNfqcyOw+90b/wsi8sy2CbO7R38IKLMwGLeMuVFc+KW08b442TMAY+dr+jgagXCOtN2A==
X-Received: by 2002:a17:906:53c7:b0:6ce:6f32:ce53 with SMTP id p7-20020a17090653c700b006ce6f32ce53mr24232089ejo.352.1647373886996;
        Tue, 15 Mar 2022 12:51:26 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id w6-20020a170906d20600b006ca00cb99e0sm6019ejz.34.2022.03.15.12.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 12:51:26 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 08/46] media: sun6i-csi: Tidy up Kconfig
Date: Tue, 15 Mar 2022 20:51:25 +0100
Message-ID: <1737020.TLkxdtWsSY@kista>
In-Reply-To: <20220311143532.265091-9-paul.kocialkowski@bootlin.com>
References: <20220311143532.265091-1-paul.kocialkowski@bootlin.com> <20220311143532.265091-9-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 11. marec 2022 ob 15:34:54 CET je Paul Kocialkowski napisal(a):
> Update the option title and help, group related options together,
> add dependency on VIDEO_DEV since the driver uses it.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/media/platform/sunxi/sun6i-csi/Kconfig | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/Kconfig b/drivers/media/
platform/sunxi/sun6i-csi/Kconfig
> index fd03e48f0c8a..a88978eba455 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/Kconfig
> +++ b/drivers/media/platform/sunxi/sun6i-csi/Kconfig
> @@ -1,12 +1,13 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config VIDEO_SUN6I_CSI
> -	tristate "Allwinner V3s Camera Sensor Interface driver"
> -	depends on PM && VIDEO_V4L2 && COMMON_CLK  && HAS_DMA
> +	tristate "Allwinner A31 Camera Sensor Interface (CSI) Driver"
>  	depends on ARCH_SUNXI || COMPILE_TEST
> +	depends on PM && COMMON_CLK && HAS_DMA
> +	depends on VIDEO_DEV && VIDEO_V4L2
> +	select REGMAP_MMIO
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEOBUF2_DMA_CONTIG
> -	select REGMAP_MMIO
>  	select V4L2_FWNODE
>  	help
> -	   Support for the Allwinner Camera Sensor Interface Controller on 
V3s.
> +	   Support for the Allwinner A31 Camera Sensor Interface (CSI) 
controller.

While at it, it would be nice to somehow indicate that it's compatible with 
more than one SoC.

Best regards,
Jernej

> -- 
> 2.35.1
> 
> 


