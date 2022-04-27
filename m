Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ACB33E5
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 19:54:10 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id gh6so5573780ejb.0
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 12:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wcy/yHzsTgQ28Wq5AenKD6lTaaPcG2J9+67ZI1nrh40=;
        b=g5Ex7jHfsDmdL14aRE4w2MGOkO+9ZJ1v9eEPQxjTl/pylYazCi9sW+cRG94GWIALtv
         XsyUfm/i3DYQAo5w+aiBFUF5DRp7Z9rEL087sWd4O8QKdhfmzpa+TG+dhqR5ze+MlWL2
         KeJz0z9PhXut/sO1vcWGEVbY9SW58+3se/yIDT0TOI85VsUp4vBwzbrDZADoYjDwnzqU
         NxjcAPO1F+cvrdqFnBu7yOPwqOKqbl0nJ6Nj0haW2lvyF2rMdYffnNinuwfgSf0KAHGZ
         bFocbsAj8K14+i8QTu++XCkJmsbWF+M6b5/ygTOpzmZzuUG6Pug0r7CpcCNhK2UWUH5u
         CXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wcy/yHzsTgQ28Wq5AenKD6lTaaPcG2J9+67ZI1nrh40=;
        b=EYGINvvOjFc48lCTzUWz6g16SAYv38Oomq4rdZ8IHEBRCZWi1c6ed1Qojre/G4Gwgb
         9LwJhVhZLzQ10Ifr03FPNA4rq+sLlfu6t3oY6y1eSchD0C4hA9V5tcTaw+/JWltSkVxF
         zBXK/KMKpSsYs5/xGQHC9Y7OlGOEbwvwFSjqAEA+5JjrXPBgLXIOR62M7Tkq+Z0yS33x
         jXgbV4Zp9+/8h3vKNWvstDaDyv7rHpSxpkoL6W4Pk4BLpAUU4IWaB0IDFrPjNSnLdBaG
         OqskesGVsijw8c0k38CrS2ZRTLG8tZ+vFMQp5ZnM5JTKvBFEAcSwxTpftBHZRwn0xWrt
         na3Q==
X-Gm-Message-State: AOAM532rDIFKOTlZlN6rgG3EaSV1nYvUYzPb7g4eFsdozWv28KPQs8kx
	JlGCR92sWnrxm4SXSdwND9bD1zBV4oSCrA==
X-Google-Smtp-Source: ABdhPJwwBqiertU6+0kXkNFEFcXH+3N/DokNjpIGwaiyxbu4o439QT/7JwN4XodQNQiW6Dvkxzuf1g==
X-Received: by 2002:a17:906:478d:b0:6e8:8ee0:1f9f with SMTP id cw13-20020a170906478d00b006e88ee01f9fmr28106026ejc.296.1651089248702;
        Wed, 27 Apr 2022 12:54:08 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id t12-20020a1709067c0c00b006e86db76851sm7214275ejo.193.2022.04.27.12.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 12:54:08 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 39/45] media: sun6i-csi: Add support for MIPI CSI-2 to the bridge code
Date: Wed, 27 Apr 2022 21:54:07 +0200
Message-ID: <8974124.rMLUfLXkoz@jernej-laptop>
In-Reply-To: <20220415152811.636419-40-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-40-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:28:05 CEST je Paul Kocialkowski napisal(a):
> Introduce MIPI CSI-2 support to the bridge with a new port, source
> and hardware configuration helper.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../platform/sunxi/sun6i-csi/sun6i_csi.h      |  1 +
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 46 +++++++++++++++++--
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |  1 +
>  3 files changed, 44 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h index
> 1aeaef84abba..6aa83dd11684 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> @@ -21,6 +21,7 @@
> 
>  enum sun6i_csi_port {
>  	SUN6I_CSI_PORT_PARALLEL		= 0,
> +	SUN6I_CSI_PORT_MIPI_CSI2	= 1,
>  };
> 
>  struct sun6i_csi_buffer {
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c index
> ec3e04353106..27289d904d5c 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> @@ -226,7 +226,7 @@ static void sun6i_csi_bridge_disable(struct
> sun6i_csi_device *csi_dev) }
> 
>  static void
> -sun6i_csi_bridge_configure_interface(struct sun6i_csi_device *csi_dev)
> +sun6i_csi_bridge_configure_parallel(struct sun6i_csi_device *csi_dev)
>  {
>  	struct device *dev = csi_dev->dev;
>  	struct regmap *regmap = csi_dev->regmap;
> @@ -316,6 +316,25 @@ sun6i_csi_bridge_configure_interface(struct
> sun6i_csi_device *csi_dev) regmap_write(regmap, SUN6I_CSI_IF_CFG_REG,
> value);
>  }
> 
> +static void
> +sun6i_csi_bridge_configure_mipi_csi2(struct sun6i_csi_device *csi_dev)
> +{
> +	struct regmap *regmap = csi_dev->regmap;
> +	u32 value = SUN6I_CSI_IF_CFG_IF_MIPI;
> +	u32 field;
> +
> +	sun6i_csi_bridge_format(csi_dev, NULL, &field);
> +
> +	if (field == V4L2_FIELD_INTERLACED ||
> +	    field == V4L2_FIELD_INTERLACED_TB ||
> +	    field == V4L2_FIELD_INTERLACED_BT)
> +		value |= SUN6I_CSI_IF_CFG_SRC_TYPE_INTERLACED;
> +	else
> +		value |= SUN6I_CSI_IF_CFG_SRC_TYPE_PROGRESSIVE;
> +
> +	regmap_write(regmap, SUN6I_CSI_IF_CFG_REG, value);
> +}
> +
>  static void sun6i_csi_bridge_configure_format(struct sun6i_csi_device
> *csi_dev) {
>  	struct regmap *regmap = csi_dev->regmap;
> @@ -367,9 +386,16 @@ static void sun6i_csi_bridge_configure_format(struct
> sun6i_csi_device *csi_dev) regmap_write(regmap, SUN6I_CSI_CH_CFG_REG,
> value);
>  }
> 
> -static void sun6i_csi_bridge_configure(struct sun6i_csi_device *csi_dev)
> +static void sun6i_csi_bridge_configure(struct sun6i_csi_device *csi_dev,
> +				       struct 
sun6i_csi_bridge_source *source)
>  {
> -	sun6i_csi_bridge_configure_interface(csi_dev);
> +	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
> +
> +	if (source == &bridge->source_parallel)
> +		sun6i_csi_bridge_configure_parallel(csi_dev);
> +	else
> +		sun6i_csi_bridge_configure_mipi_csi2(csi_dev);
> +
>  	sun6i_csi_bridge_configure_format(csi_dev);
>  }
> 
> @@ -381,6 +407,7 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev
> *subdev, int on) struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
>  	struct media_entity *bridge_entity = &bridge->subdev.entity;
>  	struct device *dev = csi_dev->dev;
> +	struct sun6i_csi_bridge_source *source;
>  	struct v4l2_subdev *source_subdev;
>  	struct media_link *link;
>  	/* Initialize to 0 to use both in disable label (ret != 0) and off. 
*/
> @@ -398,6 +425,11 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev
> *subdev, int on)
> 
>  	source_subdev = media_entity_to_v4l2_subdev(link->source->entity);
> 
> +	if (source_subdev == bridge->source_parallel.subdev)
> +		source = &bridge->source_parallel;
> +	else
> +		source = &bridge->source_mipi_csi2;
> +
>  	if (!on) {
>  		v4l2_subdev_call(source_subdev, video, s_stream, 0);
>  		goto disable;
> @@ -415,7 +447,7 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev
> *subdev, int on)
> 
>  	/* Configure */
> 
> -	sun6i_csi_bridge_configure(csi_dev);
> +	sun6i_csi_bridge_configure(csi_dev, source);
>  	sun6i_csi_capture_configure(csi_dev);
> 
>  	/* State Update */
> @@ -607,6 +639,7 @@ sun6i_csi_bridge_notifier_bound(struct
> v4l2_async_notifier *notifier, struct sun6i_csi_bridge_async_subdev
> *bridge_async_subdev =
>  		container_of(async_subdev, struct 
sun6i_csi_bridge_async_subdev,
>  			     async_subdev);
> +	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
>  	struct sun6i_csi_bridge_source *source = bridge_async_subdev-
>source;
>  	bool enabled;
> 
> @@ -614,6 +647,9 @@ sun6i_csi_bridge_notifier_bound(struct
> v4l2_async_notifier *notifier, case SUN6I_CSI_PORT_PARALLEL:
>  		enabled = true;
>  		break;
> +	case SUN6I_CSI_PORT_MIPI_CSI2:
> +		enabled = !bridge->source_parallel.expected;
> +		break;
>  	default:
>  		break;
>  	}
> @@ -760,6 +796,8 @@ int sun6i_csi_bridge_setup(struct sun6i_csi_device
> *csi_dev) sun6i_csi_bridge_source_setup(csi_dev, &bridge->source_parallel,
> SUN6I_CSI_PORT_PARALLEL,
>  				      parallel_mbus_types);
> +	sun6i_csi_bridge_source_setup(csi_dev, &bridge->source_mipi_csi2,
> +				      SUN6I_CSI_PORT_MIPI_CSI2, 
NULL);
> 
>  	ret = v4l2_async_nf_register(v4l2_dev, notifier);
>  	if (ret) {
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h index
> cb3b27af4607..ee592a14b9c5 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
> @@ -46,6 +46,7 @@ struct sun6i_csi_bridge {
>  	struct mutex			lock; /* Mbus format lock. */
> 
>  	struct sun6i_csi_bridge_source	source_parallel;
> +	struct sun6i_csi_bridge_source	source_mipi_csi2;
>  };
> 
>  /* Helpers */




