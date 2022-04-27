Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C7933E5
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 19:30:51 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id z19so3087057edx.9
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 12:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=piMSvjwkeZ0nhfn9L0hEiy466navA71gRsgoGJRVmX8=;
        b=gvqMViz1jFk1SBFg27Ndd81xhaWDy6a5g4oiitZHCp+deLsjF/WBhs1c0jZW9tycJz
         XMlRZKbyc5WxR0YNtgus02Xq6UJ6/Y1qcMIB1FOv+vFdDCNL/nq80Xbk+zjWSC804hRw
         6Oishuu5CWRXU/ditXpeufNYF/n0n3Xy9a6BL/IfEMZNER6KYjzQFM+yg52pZE+4kOof
         j3mWpe+4zKKfqwh+P6IAgjbQ4No+Gfva3KgYRGbxQHbR/mhnNey7fDHKns4QNRGJST8C
         +kOnogvP7LKjGYJLZHLU65wz5myGluRntWljj9HW4yOpZAApfrKFmWKwRUVJ0yXTKsrN
         c8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=piMSvjwkeZ0nhfn9L0hEiy466navA71gRsgoGJRVmX8=;
        b=XeripeAi/cFwHDvh2Eul3/LkBwGKs/U6azeUy6as5Q02iGClq3fdg15wLYafXlCU95
         1l5RBGcAYw5ERWkOalbm+yH8z28K6PZTH0vDtHtIpe0r1Wly1OaSYfLugLLkWzia1gsi
         aThETU8c7UgvPKm0UR8B2mDhXLxF/UpwMQaG0iQyaki0z0U/M83XI+/2Hq+SO6EOmSYh
         +TCOKBHG74OH4LJOaPKVWrKpQccEvwekuRK5JCCSL4BmZ2TJeiXG6ESxO7HiMkq4SpGm
         DH/Qss8Pufp74p6JL79VKL0cOwv2FCAQAe3ALC1gZx8lnPCRbhLjmYgjNnNI4CXmn8fU
         0wXQ==
X-Gm-Message-State: AOAM532hUnArddJ2awXmFVJ1SKU4A+YayhXP317YWWFzOyMOjXh99x9H
	Q3CcpuOmnJs0+MEKmIZjIfA=
X-Google-Smtp-Source: ABdhPJxuZ1R1o4WDg8MNMs2EldDJiORw1uR54FBa1ILTCASJzOzteyrRkwrVnKarThxPWeqwJPs26g==
X-Received: by 2002:a05:6402:ca9:b0:425:ff4d:f6fd with SMTP id cn9-20020a0564020ca900b00425ff4df6fdmr9740737edb.405.1651087849664;
        Wed, 27 Apr 2022 12:30:49 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id g12-20020a170906c18c00b006f3b99d29e0sm2835262ejz.223.2022.04.27.12.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 12:30:49 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 26/45] media: sun6i-csi: Remove custom format helper and rework configure
Date: Wed, 27 Apr 2022 21:30:48 +0200
Message-ID: <1817191.CQOukoFCf9@jernej-laptop>
In-Reply-To: <20220415152811.636419-27-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-27-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:27:52 CEST je Paul Kocialkowski napisal(a):
> Remove the custom sun6i_csi_get_bpp helper in favor of common v4l2
> infrastructure and rework the related window configuration code.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../platform/sunxi/sun6i-csi/sun6i_csi.h      | 49 -------------
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 70 +++++++++----------
>  2 files changed, 35 insertions(+), 84 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h index
> f54ad2f438f8..dd90ffdae5d5 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> @@ -60,53 +60,4 @@ struct sun6i_csi_variant {
>  bool sun6i_csi_is_format_supported(struct sun6i_csi_device *csi_dev,
>  				   u32 pixformat, u32 mbus_code);
> 
> -/* get bpp form v4l2 pixformat */
> -static inline int sun6i_csi_get_bpp(unsigned int pixformat)
> -{
> -	switch (pixformat) {
> -	case V4L2_PIX_FMT_SBGGR8:
> -	case V4L2_PIX_FMT_SGBRG8:
> -	case V4L2_PIX_FMT_SGRBG8:
> -	case V4L2_PIX_FMT_SRGGB8:
> -	case V4L2_PIX_FMT_JPEG:
> -		return 8;
> -	case V4L2_PIX_FMT_SBGGR10:
> -	case V4L2_PIX_FMT_SGBRG10:
> -	case V4L2_PIX_FMT_SGRBG10:
> -	case V4L2_PIX_FMT_SRGGB10:
> -		return 10;
> -	case V4L2_PIX_FMT_SBGGR12:
> -	case V4L2_PIX_FMT_SGBRG12:
> -	case V4L2_PIX_FMT_SGRBG12:
> -	case V4L2_PIX_FMT_SRGGB12:
> -	case V4L2_PIX_FMT_NV12_16L16:
> -	case V4L2_PIX_FMT_NV12:
> -	case V4L2_PIX_FMT_NV21:
> -	case V4L2_PIX_FMT_YUV420:
> -	case V4L2_PIX_FMT_YVU420:
> -		return 12;
> -	case V4L2_PIX_FMT_YUYV:
> -	case V4L2_PIX_FMT_YVYU:
> -	case V4L2_PIX_FMT_UYVY:
> -	case V4L2_PIX_FMT_VYUY:
> -	case V4L2_PIX_FMT_NV16:
> -	case V4L2_PIX_FMT_NV61:
> -	case V4L2_PIX_FMT_YUV422P:
> -	case V4L2_PIX_FMT_RGB565:
> -	case V4L2_PIX_FMT_RGB565X:
> -		return 16;
> -	case V4L2_PIX_FMT_RGB24:
> -	case V4L2_PIX_FMT_BGR24:
> -		return 24;
> -	case V4L2_PIX_FMT_RGB32:
> -	case V4L2_PIX_FMT_BGR32:
> -		return 32;
> -	default:
> -		WARN(1, "Unsupported pixformat: 0x%x\n", pixformat);
> -		break;
> -	}
> -
> -	return 0;
> -}
> -
>  #endif /* __SUN6I_CSI_H__ */
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c index
> 2aa65a4ddb85..c4e803a38851 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -483,68 +483,68 @@ static void sun6i_csi_capture_configure_format(struct
> sun6i_csi_device *csi_dev)
> 
>  static void sun6i_csi_capture_configure_window(struct sun6i_csi_device
> *csi_dev) {
> +	struct regmap *regmap = csi_dev->regmap;
> +	const struct v4l2_format_info *info;
> +	u32 hsize_len, vsize_len;
> +	u32 luma_line, chroma_line = 0;
>  	u32 pixelformat, field;
>  	u32 width, height;
> -	u32 bytesperline_y;
> -	u32 bytesperline_c;
> -	u32 hor_len;
> 
>  	sun6i_csi_capture_dimensions(csi_dev, &width, &height);
>  	sun6i_csi_capture_format(csi_dev, &pixelformat, &field);
> 
> -	hor_len = width;
> +	hsize_len = width;
> +	vsize_len = height;
> 
>  	switch (pixelformat) {
>  	case V4L2_PIX_FMT_YUYV:
>  	case V4L2_PIX_FMT_YVYU:
>  	case V4L2_PIX_FMT_UYVY:
>  	case V4L2_PIX_FMT_VYUY:
> -		dev_dbg(csi_dev->dev,
> -			"Horizontal length should be 2 times of 
width for packed YUV
> formats!\n"); -		hor_len = width * 2;
> +		/*
> +		 * Horizontal length should be 2 times of width for 
packed
> +		 * YUV formats.
> +		 */
> +		hsize_len *= 2;
>  		break;
>  	default:
>  		break;
>  	}
> 
> -	regmap_write(csi_dev->regmap, SUN6I_CSI_CH_HSIZE_REG,
> -		     SUN6I_CSI_CH_HSIZE_LEN(hor_len) |
> +	regmap_write(regmap, SUN6I_CSI_CH_HSIZE_REG,
> +		     SUN6I_CSI_CH_HSIZE_LEN(hsize_len) |
>  		     SUN6I_CSI_CH_HSIZE_START(0));
> -	regmap_write(csi_dev->regmap, SUN6I_CSI_CH_VSIZE_REG,
> -		     SUN6I_CSI_CH_VSIZE_LEN(height) |
> +
> +	regmap_write(regmap, SUN6I_CSI_CH_VSIZE_REG,
> +		     SUN6I_CSI_CH_VSIZE_LEN(vsize_len) |
>  		     SUN6I_CSI_CH_VSIZE_START(0));
> 
>  	switch (pixelformat) {
> -	case V4L2_PIX_FMT_NV12_16L16:
> -	case V4L2_PIX_FMT_NV12:
> -	case V4L2_PIX_FMT_NV21:
> -	case V4L2_PIX_FMT_NV16:
> -	case V4L2_PIX_FMT_NV61:
> -		bytesperline_y = width;
> -		bytesperline_c = width;
> +	case V4L2_PIX_FMT_RGB565X:
> +		luma_line = width * 2;
>  		break;
> -	case V4L2_PIX_FMT_YUV420:
> -	case V4L2_PIX_FMT_YVU420:
> -		bytesperline_y = width;
> -		bytesperline_c = width / 2;
> +	case V4L2_PIX_FMT_NV12_16L16:
> +		luma_line = width;
> +		chroma_line = width;
>  		break;
> -	case V4L2_PIX_FMT_YUV422P:
> -		bytesperline_y = width;
> -		bytesperline_c = width / 2;
> +	case V4L2_PIX_FMT_JPEG:
> +		luma_line = width;
>  		break;
> -	default: /* raw */
> -		dev_dbg(csi_dev->dev,
> -			"Calculating pixelformat(0x%x)'s 
bytesperline as a packed format\n",
> -			pixelformat);
> -		bytesperline_y = (sun6i_csi_get_bpp(pixelformat) *
> -				  width) / 8;
> -		bytesperline_c = 0;
> +	default:
> +		info = v4l2_format_info(pixelformat);
> +		if (WARN_ON(!info))
> +			return;
> +
> +		luma_line = width * info->bpp[0];
> +
> +		if (info->comp_planes > 1)
> +			chroma_line = width * info->bpp[1] / info-
>hdiv;
>  		break;
>  	}
> 
> -	regmap_write(csi_dev->regmap, SUN6I_CSI_CH_BUF_LEN_REG,
> -		     SUN6I_CSI_CH_BUF_LEN_CHROMA_LINE(bytesperline_c) |
> -		     SUN6I_CSI_CH_BUF_LEN_LUMA_LINE(bytesperline_y));
> +	regmap_write(regmap, SUN6I_CSI_CH_BUF_LEN_REG,
> +		     SUN6I_CSI_CH_BUF_LEN_CHROMA_LINE(chroma_line) |
> +		     SUN6I_CSI_CH_BUF_LEN_LUMA_LINE(luma_line));
>  }
> 
>  static void sun6i_csi_capture_configure(struct sun6i_csi_device *csi_dev)




