Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A3933E5
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 19:56:17 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id gh6so5583353ejb.0
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 12:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gN8k3J6+AGfSC2A7B7atA6Q9/iYE5AGZYgSUrC71usY=;
        b=qWY+3h03mBlDupRslwfWJEbNre4v4Imvr+HAsd8iu8Lz7mCdqSbRjs879rk2cKmXyG
         VHS6yMhdHjR22YTahPkcx5Cz/R5uwqbJ1j5Ay2CmaNG+QRPuzMQ1/wxsx4sTT11x0fc3
         34PR/Ko5PBHMNgkXj1el1G+vXljPQig/2GuJFyXYhSzlKJJ61nWyOuP2FrRWolOvtPjN
         FsSPZMHci/Xb0qGq53VS07oUXGf9Fa7l+ulfcZg10LI+LMZidSbEEm2YE5b3fUCwHdgj
         1QkbFuIJVmAbpb4M8UA/Pf5nxAgowDaox8AVI4mNzjThaaS7XAGbSizCBMUcG6WBOrfL
         56iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gN8k3J6+AGfSC2A7B7atA6Q9/iYE5AGZYgSUrC71usY=;
        b=nUAio2FbTdVhGsPbiV2L1vR3/rSfF7klW0YoY+YcRWv6hNzETXzpPuUD4zzlrraH8N
         EuuHdVuKQayxNYS7lHkyBIrEgPdCrbG39PaybF9q/5EGjLAJYio18QeLLDvzZ8tgBuSt
         3J281x7B8DgNlDyCrD6NXMcG2S6Y5x4RwHFpHv74b+bn6mmv9xgVlSv2cXqCYIel68wv
         QnHks4EhhnA5ElKdQawv+zI9yoXXzUQ7uwksBPFDntbn21Wm+biRR4Lkdz6JHcg901l9
         n+JsOPOsRDlC3kKwLYoOp9hbXdX4TCAFrdNnJpt/WV/HA/vT1szJ+V80wS7eOm40hymU
         SDaw==
X-Gm-Message-State: AOAM532jhBtx4cfnot/TGwd3/nvAEy+LFJhUvQ6wWeReixBa3F82V7Ns
	aQALlzSDU4Q9mV8N2T5+oYM=
X-Google-Smtp-Source: ABdhPJyCPXTb5y7iPw9tQJA+FXZ2nVg/JfmRJ9zQ5u03LENIFoVSoPO7Qm9e1pfaJ0RdEW9pMcYDqA==
X-Received: by 2002:a17:907:7745:b0:6f3:674a:339 with SMTP id kx5-20020a170907774500b006f3674a0339mr24570539ejc.207.1651089375400;
        Wed, 27 Apr 2022 12:56:15 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id f5-20020a17090624c500b006cee6661b6esm7187032ejb.10.2022.04.27.12.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 12:56:14 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 40/45] media: sun6i-csi: Only configure capture when streaming
Date: Wed, 27 Apr 2022 21:56:13 +0200
Message-ID: <4415490.cEBGB3zze1@jernej-laptop>
In-Reply-To: <20220415152811.636419-41-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-41-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:28:06 CEST je Paul Kocialkowski napisal(a):
> Add a streaming element to the capture state structure to know if the
> capture device is used or not. Only configure things related to output
> when streaming, including the output format, irq, state (dma buffer)
> and window configuration registers.
> 
> After this change, it becomes possible to use the bridge without the
> capture device, which will be the case in the isp media flow.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 50 ++++++++++++-------
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 11 +++-
>  .../sunxi/sun6i-csi/sun6i_csi_capture.h       |  1 +
>  3 files changed, 41 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c index
> 27289d904d5c..8e9eded0df28 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> @@ -338,6 +338,7 @@ sun6i_csi_bridge_configure_mipi_csi2(struct
> sun6i_csi_device *csi_dev) static void
> sun6i_csi_bridge_configure_format(struct sun6i_csi_device *csi_dev) {
>  	struct regmap *regmap = csi_dev->regmap;
> +	bool capture_streaming = csi_dev->capture.state.streaming;
>  	const struct sun6i_csi_bridge_format *bridge_format;
>  	const struct sun6i_csi_capture_format *capture_format;
>  	u32 mbus_code, field, pixelformat;
> @@ -353,26 +354,29 @@ static void sun6i_csi_bridge_configure_format(struct
> sun6i_csi_device *csi_dev) input_format = bridge_format->input_format;
>  	input_yuv_seq = bridge_format->input_yuv_seq;
> 
> -	sun6i_csi_capture_format(csi_dev, &pixelformat, NULL);
> +	if (capture_streaming) {
> +		sun6i_csi_capture_format(csi_dev, &pixelformat, NULL);
> 
> -	capture_format = sun6i_csi_capture_format_find(pixelformat);
> -	if (WARN_ON(!capture_format))
> -		return;
> +		capture_format = 
sun6i_csi_capture_format_find(pixelformat);
> +		if (WARN_ON(!capture_format))
> +			return;
> 
> -	if (capture_format->input_format_raw)
> -		input_format = SUN6I_CSI_INPUT_FMT_RAW;
> +		if (capture_format->input_format_raw)
> +			input_format = SUN6I_CSI_INPUT_FMT_RAW;
> 
> -	if (capture_format->input_yuv_seq_invert)
> -		input_yuv_seq = bridge_format->input_yuv_seq_invert;
> +		if (capture_format->input_yuv_seq_invert)
> +			input_yuv_seq = bridge_format-
>input_yuv_seq_invert;
> 
> -	if (field == V4L2_FIELD_INTERLACED ||
> -	    field == V4L2_FIELD_INTERLACED_TB ||
> -	    field == V4L2_FIELD_INTERLACED_BT)
> -		output_format = capture_format->output_format_field;
> -	else
> -		output_format = capture_format->output_format_frame;
> +		if (field == V4L2_FIELD_INTERLACED ||
> +		    field == V4L2_FIELD_INTERLACED_TB ||
> +		    field == V4L2_FIELD_INTERLACED_BT)
> +			output_format = capture_format-
>output_format_field;
> +		else
> +			output_format = capture_format-
>output_format_frame;
> +
> +		value |= SUN6I_CSI_CH_CFG_OUTPUT_FMT(output_format);
> +	}
> 
> -	value |= SUN6I_CSI_CH_CFG_OUTPUT_FMT(output_format);
>  	value |= SUN6I_CSI_CH_CFG_INPUT_FMT(input_format);
>  	value |= SUN6I_CSI_CH_CFG_INPUT_YUV_SEQ(input_yuv_seq);
> 
> @@ -406,6 +410,7 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev
> *subdev, int on) struct sun6i_csi_device *csi_dev =
> v4l2_get_subdevdata(subdev);
>  	struct sun6i_csi_bridge *bridge = &csi_dev->bridge;
>  	struct media_entity *bridge_entity = &bridge->subdev.entity;
> +	bool capture_streaming = csi_dev->capture.state.streaming;
>  	struct device *dev = csi_dev->dev;
>  	struct sun6i_csi_bridge_source *source;
>  	struct v4l2_subdev *source_subdev;
> @@ -448,15 +453,20 @@ static int sun6i_csi_bridge_s_stream(struct
> v4l2_subdev *subdev, int on) /* Configure */
> 
>  	sun6i_csi_bridge_configure(csi_dev, source);
> -	sun6i_csi_capture_configure(csi_dev);
> +
> +	if (capture_streaming)
> +		sun6i_csi_capture_configure(csi_dev);
> 
>  	/* State Update */
> 
> -	sun6i_csi_capture_state_update(csi_dev);
> +	if (capture_streaming)
> +		sun6i_csi_capture_state_update(csi_dev);
> 
>  	/* Enable */
> 
> -	sun6i_csi_bridge_irq_enable(csi_dev);
> +	if (capture_streaming)
> +		sun6i_csi_bridge_irq_enable(csi_dev);
> +
>  	sun6i_csi_bridge_enable(csi_dev);
> 
>  	ret = v4l2_subdev_call(source_subdev, video, s_stream, 1);
> @@ -466,7 +476,9 @@ static int sun6i_csi_bridge_s_stream(struct v4l2_subdev
> *subdev, int on) return 0;
> 
>  disable:
> -	sun6i_csi_bridge_irq_disable(csi_dev);
> +	if (capture_streaming)
> +		sun6i_csi_bridge_irq_disable(csi_dev);
> +
>  	sun6i_csi_bridge_disable(csi_dev);
> 
>  	pm_runtime_put(dev);
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c index
> f1581b877819..17145ce53395 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -616,13 +616,17 @@ static int sun6i_csi_capture_start_streaming(struct
> vb2_queue *queue, if (ret < 0)
>  		goto error_state;
> 
> +	state->streaming = true;
> +
>  	ret = v4l2_subdev_call(subdev, video, s_stream, 1);
>  	if (ret && ret != -ENOIOCTLCMD)
> -		goto error_media_pipeline;
> +		goto error_streaming;
> 
>  	return 0;
> 
> -error_media_pipeline:
> +error_streaming:
> +	state->streaming = false;
> +
>  	media_pipeline_stop(&video_dev->entity);
> 
>  error_state:
> @@ -634,11 +638,14 @@ static int sun6i_csi_capture_start_streaming(struct
> vb2_queue *queue, static void sun6i_csi_capture_stop_streaming(struct
> vb2_queue *queue) {
>  	struct sun6i_csi_device *csi_dev = vb2_get_drv_priv(queue);
> +	struct sun6i_csi_capture_state *state = &csi_dev->capture.state;
>  	struct video_device *video_dev = &csi_dev->capture.video_dev;
>  	struct v4l2_subdev *subdev = &csi_dev->bridge.subdev;
> 
>  	v4l2_subdev_call(subdev, video, s_stream, 0);
> 
> +	state->streaming = false;
> +
>  	media_pipeline_stop(&video_dev->entity);
> 
>  	sun6i_csi_capture_state_cleanup(csi_dev, true);
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h index
> ceceb030aef6..29893cf96f6b 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
> @@ -44,6 +44,7 @@ struct sun6i_csi_capture_state {
>  	struct sun6i_csi_buffer		*complete;
> 
>  	unsigned int			sequence;
> +	bool				streaming;
>  };
> 
>  struct sun6i_csi_capture {




