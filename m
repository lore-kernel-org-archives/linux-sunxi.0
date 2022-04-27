Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3B833E5
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 19:19:18 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id m20so5287641ejj.10
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 12:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6yTsPEOBY3cCKcYeHXwiu4LFE1vQQyqmVGUuUkNQfOY=;
        b=dr9rA1RXW7poH5DEv8lJxBydGsU3OVxR+olF87xFBBnZf7pSOJMmYRctilCAomiLIS
         3GipMSau/cDT7rbjeq6e/S6AfzQtZ3OeJ9Dijw06JP/EeSw/I2L0ePnXCDeJOCN1D6T9
         VetoMOtufApjI/F9qQYgGf2j/2mKepfTpmJEBUwf8Bu7vH/ept42+UC/8ehTbwBlJbII
         EtKoKaCdh2B4OvkQE9D/DNyXgP+Ts+x+VXg8OGIv6zW0rXuRB2TI2we3W94rClh+j9HF
         mENDuk40LW5+Ma/Ic0f2ijThwQmrG/Sqjb4toLJ1eh3/ERQxRkktmjZzxk69E3VQRbLW
         54Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6yTsPEOBY3cCKcYeHXwiu4LFE1vQQyqmVGUuUkNQfOY=;
        b=p2TVIYUj4B/vMpmIGcvd2LSIudi/iP2unAibkbFIHdAR8d5X0aNYtZ4uEsZq2G0DfE
         asMwxpTYJN1g9ObJ/6NeyTYIRQdbphX3es7HvQdvbxmalIhj/CXg5Qw6UByBkznOrji8
         ZwTdrI1c4DJ7F7g4aPIW45309FlTJLpzKirQK+v9W9pO5Lp50jwthzDmpzZrMwaFynuZ
         al6rkkKU2IAQHiaWK6R68laXKPZhD1ZT8dbTy++bkfTNoE17DqmqLrZ0nWbfL+OJwKAB
         bOTg9DVBEJtGGpuzcNUFfCqPMTFvAtOoXcvUaoUobLiS4ZyJ+BZG+5L3QtQM/0UdHarU
         +LrA==
X-Gm-Message-State: AOAM530JNqHo+bz8fbRaB8Jho8e4H9Z01x8Xqth02UBM3HjquZk/4BV9
	ODThWEbOVmhPSSLNEHXI9qs=
X-Google-Smtp-Source: ABdhPJyD6XH3nmRWwunfAap5tqWfZ7cDoEOrmA1D/uSHOLb1KHXH0zoeq4hrfV+Tjr8+gbTBSpX1pg==
X-Received: by 2002:a17:906:3f83:b0:6f3:c1ca:9c72 with SMTP id b3-20020a1709063f8300b006f3c1ca9c72mr5475697ejj.539.1651087156562;
        Wed, 27 Apr 2022 12:19:16 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id q17-20020a1709064cd100b006e78206fe2bsm7339272ejt.111.2022.04.27.12.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 12:19:16 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 22/45] media: sun6i-csi: Split stream sequences and irq code in capture
Date: Wed, 27 Apr 2022 21:19:15 +0200
Message-ID: <3661760.kQq0lBPeGt@jernej-laptop>
In-Reply-To: <20220415152811.636419-23-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-23-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:27:48 CEST je Paul Kocialkowski napisal(a):
> Create minimal helpers that split the enable/disable flow, which will
> make it easier to move control over to the bridge later on.
> 
> Generally speaking the goal is to move register configuration to
> the capture code and later split it with the bridge code.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 26 ---------
>  .../platform/sunxi/sun6i-csi/sun6i_csi.h      |  7 ---
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 58 ++++++++++++++++++-
>  3 files changed, 55 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c index
> 98133c1dbf68..29892e8c2b9d 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> @@ -535,32 +535,6 @@ int sun6i_csi_update_config(struct sun6i_csi_device
> *csi_dev, return 0;
>  }
> 
> -void sun6i_csi_set_stream(struct sun6i_csi_device *csi_dev, bool enable)
> -{
> -	struct regmap *regmap = csi_dev->regmap;
> -
> -	if (!enable) {
> -		regmap_update_bits(regmap, SUN6I_CSI_CAP_REG,
> -				   SUN6I_CSI_CAP_VCAP_ON, 0);
> -		regmap_write(regmap, SUN6I_CSI_CH_INT_EN_REG, 0);
> -		return;
> -	}
> -
> -	regmap_write(regmap, SUN6I_CSI_CH_INT_STA_REG,
> -		     SUN6I_CSI_CH_INT_STA_CLEAR);
> -	regmap_write(regmap, SUN6I_CSI_CH_INT_EN_REG,
> -		     SUN6I_CSI_CH_INT_EN_VS |
> -		     SUN6I_CSI_CH_INT_EN_HB_OF |
> -		     SUN6I_CSI_CH_INT_EN_FIFO2_OF |
> -		     SUN6I_CSI_CH_INT_EN_FIFO1_OF |
> -		     SUN6I_CSI_CH_INT_EN_FIFO0_OF |
> -		     SUN6I_CSI_CH_INT_EN_FD |
> -		     SUN6I_CSI_CH_INT_EN_CD);
> -
> -	regmap_update_bits(regmap, SUN6I_CSI_CAP_REG, 
SUN6I_CSI_CAP_VCAP_ON,
> -			   SUN6I_CSI_CAP_VCAP_ON);
> -}
> -
>  /* Media */
> 
>  static const struct media_device_ops sun6i_csi_media_ops = {
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h index
> 44fc4d486877..155527961280 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> @@ -92,13 +92,6 @@ int sun6i_csi_set_power(struct sun6i_csi_device *csi_dev,
> bool enable); int sun6i_csi_update_config(struct sun6i_csi_device *csi_dev,
>  			    struct sun6i_csi_config *config);
> 
> -/**
> - * sun6i_csi_set_stream() - start/stop csi streaming
> - * @csi:	pointer to the csi
> - * @enable:	start/stop
> - */
> -void sun6i_csi_set_stream(struct sun6i_csi_device *csi_dev, bool enable);
> -
>  /* get bpp form v4l2 pixformat */
>  static inline int sun6i_csi_get_bpp(unsigned int pixformat)
>  {
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c index
> 7788cbab7810..72fcc60d2695 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -107,6 +107,51 @@ static bool sun6i_csi_capture_format_check(u32 format)
> 
>  /* Capture */
> 
> +static void sun6i_csi_capture_irq_enable(struct sun6i_csi_device *csi_dev)
> +{
> +	struct regmap *regmap = csi_dev->regmap;
> +
> +	regmap_write(regmap, SUN6I_CSI_CH_INT_EN_REG,
> +		     SUN6I_CSI_CH_INT_EN_VS |
> +		     SUN6I_CSI_CH_INT_EN_HB_OF |
> +		     SUN6I_CSI_CH_INT_EN_FIFO2_OF |
> +		     SUN6I_CSI_CH_INT_EN_FIFO1_OF |
> +		     SUN6I_CSI_CH_INT_EN_FIFO0_OF |
> +		     SUN6I_CSI_CH_INT_EN_FD |
> +		     SUN6I_CSI_CH_INT_EN_CD);
> +}
> +
> +static void sun6i_csi_capture_irq_disable(struct sun6i_csi_device *csi_dev)
> +{
> +	struct regmap *regmap = csi_dev->regmap;
> +
> +	regmap_write(regmap, SUN6I_CSI_CH_INT_EN_REG, 0);
> +}
> +
> +static void sun6i_csi_capture_irq_clear(struct sun6i_csi_device *csi_dev)
> +{
> +	struct regmap *regmap = csi_dev->regmap;
> +
> +	regmap_write(regmap, SUN6I_CSI_CH_INT_EN_REG, 0);
> +	regmap_write(regmap, SUN6I_CSI_CH_INT_STA_REG,
> +		     SUN6I_CSI_CH_INT_STA_CLEAR);
> +}
> +
> +static void sun6i_csi_capture_enable(struct sun6i_csi_device *csi_dev)
> +{
> +	struct regmap *regmap = csi_dev->regmap;
> +
> +	regmap_update_bits(regmap, SUN6I_CSI_CAP_REG, 
SUN6I_CSI_CAP_VCAP_ON,
> +			   SUN6I_CSI_CAP_VCAP_ON);
> +}
> +
> +static void sun6i_csi_capture_disable(struct sun6i_csi_device *csi_dev)
> +{
> +	struct regmap *regmap = csi_dev->regmap;
> +
> +	regmap_update_bits(regmap, SUN6I_CSI_CAP_REG, 
SUN6I_CSI_CAP_VCAP_ON, 0);
> +}
> +
>  static void
>  sun6i_csi_capture_buffer_configure(struct sun6i_csi_device *csi_dev,
>  				   struct sun6i_csi_buffer 
*csi_buffer)
> @@ -357,6 +402,10 @@ static int sun6i_csi_capture_start_streaming(struct
> vb2_queue *queue, goto error_media_pipeline;
>  	}
> 
> +	/* Clear */
> +
> +	sun6i_csi_capture_irq_clear(csi_dev);
> +
>  	/* Configure */
> 
>  	sun6i_csi_capture_configure(csi_dev);
> @@ -367,7 +416,8 @@ static int sun6i_csi_capture_start_streaming(struct
> vb2_queue *queue,
> 
>  	/* Enable */
> 
> -	sun6i_csi_set_stream(csi_dev, true);
> +	sun6i_csi_capture_irq_enable(csi_dev);
> +	sun6i_csi_capture_enable(csi_dev);
> 
>  	ret = v4l2_subdev_call(subdev, video, s_stream, 1);
>  	if (ret && ret != -ENOIOCTLCMD)
> @@ -376,7 +426,8 @@ static int sun6i_csi_capture_start_streaming(struct
> vb2_queue *queue, return 0;
> 
>  error_stream:
> -	sun6i_csi_set_stream(csi_dev, false);
> +	sun6i_csi_capture_disable(csi_dev);
> +	sun6i_csi_capture_irq_disable(csi_dev);
> 
>  error_media_pipeline:
>  	media_pipeline_stop(&video_dev->entity);
> @@ -397,7 +448,8 @@ static void sun6i_csi_capture_stop_streaming(struct
> vb2_queue *queue) if (subdev)
>  		v4l2_subdev_call(subdev, video, s_stream, 0);
> 
> -	sun6i_csi_set_stream(csi_dev, false);
> +	sun6i_csi_capture_disable(csi_dev);
> +	sun6i_csi_capture_irq_disable(csi_dev);
> 
>  	media_pipeline_stop(&capture->video_dev.entity);




