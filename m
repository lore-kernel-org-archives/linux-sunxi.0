Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC6133E5
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 19:47:30 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id gh6so5542984ejb.0
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 12:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LONo22GFE8+qb+RTFT1FYUQE4k/LGm5GxuD++oCjNCo=;
        b=oVQ5t51PpqRAKOMWTnUjjYB06RAXdeQijIcB3h4gxPdrJg919IHzOauTtrCaKnUB7p
         jrj+4kHdkxThd9OtNJgoJjy4qllr60TxUP6f2E8aVsBjZv7/LXEyKM2TdQ+m9i9ABzHN
         ta2jM7RaQ/rIby5LSeUxG03DlsalsdUlvbcOitNiJ6cJ8Bx+XXxMFfxEwAx1tF5h0m8j
         0BT7Azw8ss+JqOhBijJrAvTAmwr9xhjfxbEyTqrebMJv8xjrkQbgUin+aWphFPGDAj5C
         60w1oj59WmxZ2l8g/h66lzVQZnaKmNUWql4qtC/zAts+sHjQ4sUZFhyfd97SNJQNyqgO
         K13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LONo22GFE8+qb+RTFT1FYUQE4k/LGm5GxuD++oCjNCo=;
        b=0bE8lzuGwGt6nmImkk5JGFeS3ZeGknNULLMuatrXGI7efPlTb2qbuoVeUEPH6Td4v4
         1Z/Bji/qGcFgBuywIZ/X+rcCfgDOvCqY4digh/7IcqJcNToP/gNsdNddIDSGggkgAyn7
         TbRqB7hIaxpWYZRHq/05TZlxI5Nt7SaAGA0hFHKwVr+bF30G5YJ4vk/kgMsFi5NvySUi
         Ie/gSI3bIZOfRwX+HqH8AFemrxFY7hC8LbeYzkHuKSuwqr+6o5jI/BpxhEe7Mq02LdhM
         QCHrBzM9qSeL6OtFUPSzbY2wgUoKcQmDTg0YyLAxLdw83/mJrMWGb2y1a7bcA3q6n/RW
         ATXQ==
X-Gm-Message-State: AOAM533PWv/W5vr/tUfM2lEz+S6zBYxEKpldUIBiQC6VtEMvYrD/gzs2
	dfVWTRRbLWxfA6i1DD04+EXfxv2JRh7fGg==
X-Google-Smtp-Source: ABdhPJzJatD17YnXsrf0yTeXgTJ1voZs9XJLvJEFIxSvdL3rgPSW4gimCHVTuvtYjbFSC2UjbCAuhQ==
X-Received: by 2002:a17:907:968f:b0:6db:a3c5:ae3e with SMTP id hd15-20020a170907968f00b006dba3c5ae3emr29230108ejc.770.1651088848727;
        Wed, 27 Apr 2022 12:47:28 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id s25-20020aa7d799000000b0042617ba6397sm96065edq.33.2022.04.27.12.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 12:47:28 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 35/45] media: sun6i-csi: Get bridge subdev directly in capture stream ops
Date: Wed, 27 Apr 2022 21:47:27 +0200
Message-ID: <2128504.NgBsaNRSFp@jernej-laptop>
In-Reply-To: <20220415152811.636419-36-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-36-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:28:01 CEST je Paul Kocialkowski napisal(a):
> The remote subdev connected to the capture video device is always
> our bridge, so get the bridge subdev directly instead of using a
> dedicated helper (which is removed by this commit).
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 30 ++-----------------
>  1 file changed, 3 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c index
> b3452ed825ad..b92f8aa55a92 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
> @@ -42,22 +42,6 @@ void sun6i_csi_capture_format(struct sun6i_csi_device
> *csi_dev, *field = csi_dev->capture.format.fmt.pix.field;
>  }
> 
> -static struct v4l2_subdev *
> -sun6i_csi_capture_remote_subdev(struct sun6i_csi_capture *capture, u32
> *pad) -{
> -	struct media_pad *remote;
> -
> -	remote = media_entity_remote_pad(&capture->pad);
> -
> -	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
> -		return NULL;
> -
> -	if (pad)
> -		*pad = remote->index;
> -
> -	return media_entity_to_v4l2_subdev(remote->entity);
> -}
> -
>  /* Format */
> 
>  static const struct sun6i_csi_capture_format sun6i_csi_capture_formats[] =
> { @@ -822,8 +806,8 @@ static int sun6i_csi_capture_start_streaming(struct
> vb2_queue *queue, struct sun6i_csi_capture *capture = &csi_dev->capture;
>  	struct sun6i_csi_capture_state *state = &capture->state;
>  	struct video_device *video_dev = &capture->video_dev;
> +	struct v4l2_subdev *subdev = &csi_dev->bridge.subdev;
>  	struct device *dev = csi_dev->dev;
> -	struct v4l2_subdev *subdev;
>  	int ret;
> 
>  	state->sequence = 0;
> @@ -832,12 +816,6 @@ static int sun6i_csi_capture_start_streaming(struct
> vb2_queue *queue, if (ret < 0)
>  		goto error_state;
> 
> -	subdev = sun6i_csi_capture_remote_subdev(capture, NULL);
> -	if (!subdev) {
> -		ret = -EINVAL;
> -		goto error_media_pipeline;
> -	}
> -
>  	/* PM */
> 
>  	ret = pm_runtime_resume_and_get(dev);
> @@ -886,12 +864,10 @@ static void sun6i_csi_capture_stop_streaming(struct
> vb2_queue *queue) {
>  	struct sun6i_csi_device *csi_dev = vb2_get_drv_priv(queue);
>  	struct sun6i_csi_capture *capture = &csi_dev->capture;
> +	struct v4l2_subdev *subdev = &csi_dev->bridge.subdev;
>  	struct device *dev = csi_dev->dev;
> -	struct v4l2_subdev *subdev;
> 
> -	subdev = sun6i_csi_capture_remote_subdev(capture, NULL);
> -	if (subdev)
> -		v4l2_subdev_call(subdev, video, s_stream, 0);
> +	v4l2_subdev_call(subdev, video, s_stream, 0);
> 
>  	sun6i_csi_capture_disable(csi_dev);
>  	sun6i_csi_capture_irq_disable(csi_dev);




