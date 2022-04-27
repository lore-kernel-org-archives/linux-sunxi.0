Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF3333E5
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 19:21:38 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id j6so5283125ejc.13
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 12:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1pzX66OsBnNRuIBQz0pI37xgHgmuvAdxapWLaoZpVz4=;
        b=mgI9NDd1ieXNF7QNWidr4aWzwJOOgDmiS6oC+dq25mEOwPWmmZfMbfbUaVEgrqDNJN
         BhUOGjj82d4P4XgLSxaj6zUuNnCsUMsyySl2TcsSPp7CL3MPoPDzS8zgeMhLjwL4H5r9
         xXrwoZVGE0EehHDynM903T+NnNhhly8qvlFtU5HPC2Le8F3v0sr424xNeqYldFuv/lx+
         Wr/DHZnIQlYPDY5eHbnBSaaadyF0D/k2z3Z3erWbvfroUXuHwVlvL5HR/QFDovcBaudN
         CoR7QUSt+xwG/BMK3Hr4kXTGJofkMkQa2UsifqaXddCuUBkLxnSi8oE8zPuQ32aTxhSi
         mJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1pzX66OsBnNRuIBQz0pI37xgHgmuvAdxapWLaoZpVz4=;
        b=Mj594c8r7p+b8UWgZITmXy9Mp8Ksy7/jxm7ifef+Vsl+8WNaChhbhr9NgS4zifkaQk
         liZ+7YQ7gv5o6AKqBUvcIngjHsySMia6OLPItPw2s9g1MfPhqDcKmyVGkg3erMdxT38o
         sSemww2Q/YDipYKuE4iefez38BVwr751vzq+C1ZUfeD8veZOi6fn4zMZnpl1+UywVPm+
         nodHWW7k5Xr9w9KrlgQLOJfiWGRSR7/rJFRfSqd0t3gaf1JByhw3QxMBGgfOmNEX09k5
         nTKLxqPRmK7/YlDov6eGCIFHllWCs4+VLr+2cYhWdCR2L/mpIx7ojpy+yEFbXFaeUR2j
         zAWQ==
X-Gm-Message-State: AOAM532RW3xfdBtAf2SQQ/GxrhNQddSMSvMwufJo1vo/uhcHd8UdrL9o
	2yJACg62VNceOPk0A2Rf5/P9p3Hi/cz1yQ==
X-Google-Smtp-Source: ABdhPJzXuvdaKSn1F0VRSzYT8LkBKGAMTiCWNvGj1LRVVyZfUiXEcy605iJSgEc+AlBZ5+UGN7zxuQ==
X-Received: by 2002:a17:906:d20c:b0:6f3:9901:bc08 with SMTP id w12-20020a170906d20c00b006f39901bc08mr15875211ejz.351.1651087296332;
        Wed, 27 Apr 2022 12:21:36 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id y5-20020a056402170500b0042617ba63d3sm65241edu.93.2022.04.27.12.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 12:21:35 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 23/45] media: sun6i-csi: Move power management to runtime pm in capture
Date: Wed, 27 Apr 2022 21:21:34 +0200
Message-ID: <8925609.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <20220415152811.636419-24-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-24-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:27:49 CEST je Paul Kocialkowski napisal(a):
> Let's just enable the module when we start using it (at stream on)
> and benefit from runtime pm instead of enabling it at first open.
> 
> Also reorder the call to v4l2_pipeline_pm_get.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 24 -----------
>  .../platform/sunxi/sun6i-csi/sun6i_csi.h      |  7 ----
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 41 ++++++++++---------
>  3 files changed, 22 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c index
> 29892e8c2b9d..7801f5abe47e 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> @@ -148,30 +148,6 @@ bool sun6i_csi_is_format_supported(struct
> sun6i_csi_device *csi_dev, return false;
>  }
> 
> -int sun6i_csi_set_power(struct sun6i_csi_device *csi_dev, bool enable)
> -{
> -	struct device *dev = csi_dev->dev;
> -	struct regmap *regmap = csi_dev->regmap;
> -	int ret;
> -
> -	if (!enable) {
> -		regmap_update_bits(regmap, SUN6I_CSI_EN_REG,
> -				   SUN6I_CSI_EN_CSI_EN, 0);
> -		pm_runtime_put(dev);
> -
> -		return 0;
> -	}
> -
> -	ret = pm_runtime_resume_and_get(dev);
> -	if (ret < 0)
> -		return ret;
> -
> -	regmap_update_bits(regmap, SUN6I_CSI_EN_REG, SUN6I_CSI_EN_CSI_EN,
> -			   SUN6I_CSI_EN_CSI_EN);
> -
> -	return 0;
> -}
> -
>  static enum csi_input_fmt get_csi_input_format(struct sun6i_csi_device
> *csi_dev, u32 mbus_code, u32 pixformat)
>  {
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h index
> 155527961280..3a4f2b45d267 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> @@ -77,13 +77,6 @@ struct sun6i_csi_variant {
>  bool sun6i_csi_is_format_supported(struct sun6i_csi_device *csi_dev,
>  				   u32 pixformat, u32 mbus_code);
> 
> -/**
> - * sun6i_csi_set_power() - power on/off the csi
> - * @csi:	pointer to the csi
> - * @enable:	on/off
> - */
> -int sun6i_csi_set_power(struct sun6i_csi_device *csi_dev, bool enable);
> -
>  /**
>   * sun6i_csi_update_config() - update the csi register settings
>   * @csi:	pointer to the csi
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c index
> 72fcc60d2695..3e5c4f7df48d 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -6,6 +6,7 @@
>   */
> 
>  #include <linux/of.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> 
>  #include <media/v4l2-device.h>
> @@ -141,6 +142,9 @@ static void sun6i_csi_capture_enable(struct
> sun6i_csi_device *csi_dev) {
>  	struct regmap *regmap = csi_dev->regmap;
> 
> +	regmap_update_bits(regmap, SUN6I_CSI_EN_REG, SUN6I_CSI_EN_CSI_EN,
> +			   SUN6I_CSI_EN_CSI_EN);
> +
>  	regmap_update_bits(regmap, SUN6I_CSI_CAP_REG, 
SUN6I_CSI_CAP_VCAP_ON,
>  			   SUN6I_CSI_CAP_VCAP_ON);
>  }
> @@ -150,6 +154,7 @@ static void sun6i_csi_capture_disable(struct
> sun6i_csi_device *csi_dev) struct regmap *regmap = csi_dev->regmap;
> 
>  	regmap_update_bits(regmap, SUN6I_CSI_CAP_REG, 
SUN6I_CSI_CAP_VCAP_ON, 0);
> +	regmap_update_bits(regmap, SUN6I_CSI_EN_REG, SUN6I_CSI_EN_CSI_EN, 
0);
>  }
> 
>  static void
> @@ -382,6 +387,7 @@ static int sun6i_csi_capture_start_streaming(struct
> vb2_queue *queue, struct sun6i_csi_capture *capture = &csi_dev->capture;
>  	struct sun6i_csi_capture_state *state = &capture->state;
>  	struct video_device *video_dev = &capture->video_dev;
> +	struct device *dev = csi_dev->dev;
>  	struct v4l2_subdev *subdev;
>  	int ret;
> 
> @@ -402,6 +408,12 @@ static int sun6i_csi_capture_start_streaming(struct
> vb2_queue *queue, goto error_media_pipeline;
>  	}
> 
> +	/* PM */
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0)
> +		goto error_media_pipeline;
> +
>  	/* Clear */
> 
>  	sun6i_csi_capture_irq_clear(csi_dev);
> @@ -429,6 +441,8 @@ static int sun6i_csi_capture_start_streaming(struct
> vb2_queue *queue, sun6i_csi_capture_disable(csi_dev);
>  	sun6i_csi_capture_irq_disable(csi_dev);
> 
> +	pm_runtime_put(dev);
> +
>  error_media_pipeline:
>  	media_pipeline_stop(&video_dev->entity);
> 
> @@ -442,6 +456,7 @@ static void sun6i_csi_capture_stop_streaming(struct
> vb2_queue *queue) {
>  	struct sun6i_csi_device *csi_dev = vb2_get_drv_priv(queue);
>  	struct sun6i_csi_capture *capture = &csi_dev->capture;
> +	struct device *dev = csi_dev->dev;
>  	struct v4l2_subdev *subdev;
> 
>  	subdev = sun6i_csi_capture_remote_subdev(capture, NULL);
> @@ -451,6 +466,8 @@ static void sun6i_csi_capture_stop_streaming(struct
> vb2_queue *queue) sun6i_csi_capture_disable(csi_dev);
>  	sun6i_csi_capture_irq_disable(csi_dev);
> 
> +	pm_runtime_put(dev);
> +
>  	media_pipeline_stop(&capture->video_dev.entity);
> 
>  	sun6i_csi_capture_state_cleanup(csi_dev, true);
> @@ -639,27 +656,20 @@ static int sun6i_csi_capture_open(struct file *file)
>  	if (mutex_lock_interruptible(&capture->lock))
>  		return -ERESTARTSYS;
> 
> -	ret = v4l2_fh_open(file);
> +	ret = v4l2_pipeline_pm_get(&capture->video_dev.entity);
>  	if (ret < 0)
>  		goto error_lock;
> 
> -	ret = v4l2_pipeline_pm_get(&capture->video_dev.entity);
> +	ret = v4l2_fh_open(file);
>  	if (ret < 0)
> -		goto error_v4l2_fh;
> -
> -	/* Power on at first open. */
> -	if (v4l2_fh_is_singular_file(file)) {
> -		ret = sun6i_csi_set_power(csi_dev, true);
> -		if (ret < 0)
> -			goto error_v4l2_fh;
> -	}
> +		goto error_pipeline;
> 
>  	mutex_unlock(&capture->lock);
> 
>  	return 0;
> 
> -error_v4l2_fh:
> -	v4l2_fh_release(file);
> +error_pipeline:
> +	v4l2_pipeline_pm_put(&capture->video_dev.entity);
> 
>  error_lock:
>  	mutex_unlock(&capture->lock);
> @@ -671,19 +681,12 @@ static int sun6i_csi_capture_close(struct file *file)
>  {
>  	struct sun6i_csi_device *csi_dev = video_drvdata(file);
>  	struct sun6i_csi_capture *capture = &csi_dev->capture;
> -	bool last_close;
> 
>  	mutex_lock(&capture->lock);
> 
> -	last_close = v4l2_fh_is_singular_file(file);
> -
>  	_vb2_fop_release(file, NULL);
>  	v4l2_pipeline_pm_put(&capture->video_dev.entity);
> 
> -	/* Power off at last close. */
> -	if (last_close)
> -		sun6i_csi_set_power(csi_dev, false);
> -
>  	mutex_unlock(&capture->lock);
> 
>  	return 0;




