Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2167F5
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 18:40:22 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id m20so5105665ejj.10
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Apr 2022 11:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uUiRj9ShaGcXVoRdp82isoIpzg+6vO7GGhdlgaIYleg=;
        b=ovdIFcyYsKX0OmrCtG+rCtvekfXilVxP4wrdcpgZkNgDV0pwvS4pPXOFZbYmLz6XLM
         pgj7SBIHzQLZlp6ArPaqLnGXvmGcTcPWAQRbGqsS5WAuTe/H1ok7nVLed9RNArKRXfAt
         wILj8xuimsEPxs6FO1WXLvvnNarPvigxHwJKkPTQn5+6SdsZNTOilxACtTaYb/Ozx4b6
         kKBvoWnN1AvOmeFl1nSh6IpoOs6eenP3OJzcrM3I4/6Swkb7/qS7BuDdMi0WURzTQ/AN
         5AjXmn79EumMY4YgKUFP1cKrhj6KgGGeYnfEgRjF6T0N0ERK5kNsshw6ziIY0IpE6DkA
         fLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uUiRj9ShaGcXVoRdp82isoIpzg+6vO7GGhdlgaIYleg=;
        b=l4OXEjI5OEw3IQks5fEs+Y1Kk+YHOpQ+YVw8+5O9CpTdarx90SE/2Uws1aDgfkNCxw
         +kUNh7PItwKSuAVczMtka3k9wQ5NnPNrVWLxPBuZSpQRsFc4+rtQckIuG6A+8tlNjiF7
         MatuvlJw25DwODk+XOiI7bK8XSnMQnp+Ap73ZIcx5jfpEGlX6/IWMLYSg4j8iQLalLiT
         HrMZuwGVnBR86tv90Nt/YUAAByR4xXOMu5OHfGZqsgeuJpGeC3pnshn3HgOUZ5k0BiSV
         ScjzSb34rJdtl2hFDEXQ2w8Ol+GWSvaf4zZPrhY//+UHkFU2pIkD4/aXQgDCXm5YNi9q
         6zoA==
X-Gm-Message-State: AOAM532buv6H36GAccfbe6WCUOVt72eAYVB26jh/DoDqWVJ5xO9zpzHr
	q5oMjzgFudUF9/0xxrovllkaW/ZmrVE/5w==
X-Google-Smtp-Source: ABdhPJwRK7vAdKSdfZ4tlKvfNpSu+/S0SuSAbrR1yFRd62z9h3UhDj7Wo9IYoPztJOgWcvIyofl3qw==
X-Received: by 2002:a17:907:1b05:b0:6f0:18d8:7be0 with SMTP id mp5-20020a1709071b0500b006f018d87be0mr27886541ejc.561.1651084820483;
        Wed, 27 Apr 2022 11:40:20 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id l26-20020a1709062a9a00b006e7ee7ad20bsm7288205eje.149.2022.04.27.11.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 11:40:20 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 11/45] media: sun6i-csi: Register the media device after creation
Date: Wed, 27 Apr 2022 20:40:18 +0200
Message-ID: <2235027.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20220415152811.636419-12-paul.kocialkowski@bootlin.com>
References: <20220415152811.636419-1-paul.kocialkowski@bootlin.com> <20220415152811.636419-12-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 15. april 2022 ob 17:27:37 CEST je Paul Kocialkowski napisal(a):
> There is no particular need to register the media device in the
> subdev notify complete callback.
> 
> Register it in the v4l2 code instead where it's more in-context.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Ideally, error path could use new label, but since media_device_unregister() 
check for if it was registered, this works too.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c index
> 198275e09865..e59ee3e3f372 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> @@ -638,7 +638,7 @@ static int sun6i_subdev_notify_complete(struct
> v4l2_async_notifier *notifier) if (ret < 0)
>  		return ret;
> 
> -	return media_device_register(&v4l2->media_dev);
> +	return 0;
>  }
> 
>  static const struct v4l2_async_notifier_operations sun6i_csi_async_ops = {
> @@ -687,6 +687,12 @@ static int sun6i_csi_v4l2_setup(struct sun6i_csi_device
> *csi_dev)
> 
>  	media_device_init(media_dev);
> 
> +	ret = media_device_register(media_dev);
> +	if (ret) {
> +		dev_err(dev, "failed to register media device: %d\n", 
ret);
> +		goto error_media;
> +	}
> +
>  	/* V4L2 Control Handler */
> 
>  	ret = v4l2_ctrl_handler_init(&v4l2->ctrl_handler, 0);
> @@ -746,6 +752,7 @@ static int sun6i_csi_v4l2_setup(struct sun6i_csi_device
> *csi_dev) v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
> 
>  error_media:
> +	media_device_unregister(media_dev);
>  	media_device_cleanup(media_dev);
> 
>  	return ret;




