Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8F37A
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Mar 2022 19:31:16 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id yy13so43764545ejb.2
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Mar 2022 12:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SF7IgGhp+9o85mKWfP8kscVz0pSLrrsqPcAQ8jalhmo=;
        b=WRpYLEGOnlkzefN2BJ6kRoYK5vLtDps1w7cAmdnQ2XhNc+I/yb6PAibQfQxE3nYR2C
         Xet5ex/Qp06CJoetB4NueLsEvLG7AIfT+T7tyifST8gPlBgixp5z1pO7ComuN7gMd6Vq
         7YbPFkTYKDTmav4ThAte4typ32UhuO7TNUEYbUURaaT4ZYl2ghkGCzDUJE6q+s9n2I9m
         VynNMZcKhSL8rHhIMqPWbENJvY/8mDo1MGjE6g1cZMSwISbmX2CaJBndMLO3uc5c+iYf
         BaEoSruOBBGawn+H6iTUjXgArp8pkhWGRlKGeWryMXEawZOOp8Xsn5U9jGiP945nwuXN
         jRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SF7IgGhp+9o85mKWfP8kscVz0pSLrrsqPcAQ8jalhmo=;
        b=L6e+KqU4RY7pMLh2Za8zJ0XX7cwlyKRlIvchkySDY53zg6YV1cG8/q9Ve6yxGf0+06
         OYQUIQVblVFpbOv6C7XeCG3KMH/Zd84mBpLLARWeVVHkp3pSYN6NN7er7uibDvYix/um
         VZTBr3McgyjdlcQFDUAdXXaXbbNOCyFFwwMY7zJPDNeZbWydna6DCy1lwf8KAqO7CPNQ
         PWAc6Uqgcy5VSsmvfvewea2PsK3zuZGEmMQJ4gLZ6oi1emYMOSPHhQtwUBkG9VuL4Lit
         Vke0ffdIxqtJfDwJLKYfh75DaxEgTv0xi7ntNhMBRPqZSBglOOsn3n73AnOH0D49WPpU
         vV9w==
X-Gm-Message-State: AOAM531uQxtZWmtjNs111ABe0xXbEqoDgATBu+xu9VyRENdP3Bb+sYtq
	dorTrnpXfeBT6aq8uJRSln8=
X-Google-Smtp-Source: ABdhPJxNjnwRnV6JCivFveTPgjxD+iRyjMCErU60znyaQ6x5BHWiiYu3hDzvwmfqsCb7mT4kodKOBQ==
X-Received: by 2002:a17:906:3ec9:b0:6bb:2eb9:84f with SMTP id d9-20020a1709063ec900b006bb2eb9084fmr23892050ejj.86.1647372674681;
        Tue, 15 Mar 2022 12:31:14 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id q16-20020a170906145000b006bdaf981589sm8507976ejc.81.2022.03.15.12.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 12:31:14 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 06/46] media: sun6i-csi: Define and use variant to get module clock rate
Date: Tue, 15 Mar 2022 20:31:13 +0100
Message-ID: <2060330.OBFZWjSADL@kista>
In-Reply-To: <20220311143532.265091-7-paul.kocialkowski@bootlin.com>
References: <20220311143532.265091-1-paul.kocialkowski@bootlin.com> <20220311143532.265091-7-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 11. marec 2022 ob 15:34:52 CET je Paul Kocialkowski napisal(a):
> Introduce a proper variant structure with the module clock rate
> instead of hardcoding it with a manual check on the compatible.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 48 ++++++++++++++-----
>  .../platform/sunxi/sun6i-csi/sun6i_csi.h      |  4 ++
>  2 files changed, 40 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/
media/platform/sunxi/sun6i-csi/sun6i_csi.c
> index 2355088fdc37..4a0d08e0ac25 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> @@ -811,11 +811,17 @@ static int sun6i_csi_resources_setup(struct 
sun6i_csi_device *csi_dev,
>  				     struct platform_device 
*platform_dev)
>  {
>  	struct device *dev = csi_dev->dev;
> -	unsigned long clk_mod_rate;
> +	const struct sun6i_csi_variant *variant;

Ideally, this should be sorted from longest to shortest.

>  	void __iomem *io_base;
>  	int ret;
>  	int irq;
>  
> +	/* Variant */

I don't think this comment is very useful (nor one below for that matter.) 
Please remove it.

With that:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> +
> +	variant = of_device_get_match_data(dev);
> +	if (!variant)
> +		return -EINVAL;
> +
>  	/* Registers */
>  
>  	io_base = devm_platform_ioremap_resource(platform_dev, 0);
> @@ -849,12 +855,7 @@ static int sun6i_csi_resources_setup(struct 
sun6i_csi_device *csi_dev,
>  		return PTR_ERR(csi_dev->clk_ram);
>  	}
>  
> -	if (of_device_is_compatible(dev->of_node, "allwinner,sun50i-a64-
csi"))
> -		clk_mod_rate = 300000000;
> -	else
> -		clk_mod_rate = 297000000;
> -
> -	ret = clk_set_rate_exclusive(csi_dev->clk_mod, clk_mod_rate);
> +	ret = clk_set_rate_exclusive(csi_dev->clk_mod, variant-
>clk_mod_rate);
>  	if (ret) {
>  		dev_err(dev, "failed to set mod clock rate\n");
>  		return ret;
> @@ -937,12 +938,35 @@ static int sun6i_csi_remove(struct platform_device 
*pdev)
>  	return 0;
>  }
>  
> +static const struct sun6i_csi_variant sun6i_a31_csi_variant = {
> +	.clk_mod_rate	= 297000000,
> +};
> +
> +static const struct sun6i_csi_variant sun50i_a64_csi_variant = {
> +	.clk_mod_rate	= 300000000,
> +};
> +
>  static const struct of_device_id sun6i_csi_of_match[] = {
> -	{ .compatible = "allwinner,sun6i-a31-csi", },
> -	{ .compatible = "allwinner,sun8i-a83t-csi", },
> -	{ .compatible = "allwinner,sun8i-h3-csi", },
> -	{ .compatible = "allwinner,sun8i-v3s-csi", },
> -	{ .compatible = "allwinner,sun50i-a64-csi", },
> +	{
> +		.compatible	= "allwinner,sun6i-a31-csi",
> +		.data		= &sun6i_a31_csi_variant,
> +	},
> +	{
> +		.compatible	= "allwinner,sun8i-a83t-csi",
> +		.data		= &sun6i_a31_csi_variant,
> +	},
> +	{
> +		.compatible	= "allwinner,sun8i-h3-csi",
> +		.data		= &sun6i_a31_csi_variant,
> +	},
> +	{
> +		.compatible	= "allwinner,sun8i-v3s-csi",
> +		.data		= &sun6i_a31_csi_variant,
> +	},
> +	{
> +		.compatible	= "allwinner,sun50i-a64-csi",
> +		.data		= &sun50i_a64_csi_variant,
> +	},
>  	{},
>  };
>  
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drivers/
media/platform/sunxi/sun6i-csi/sun6i_csi.h
> index 356661b413f8..3c4a3af6b897 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
> @@ -59,6 +59,10 @@ struct sun6i_csi_device {
>  	int				planar_offset[3];
>  };
>  
> +struct sun6i_csi_variant {
> +	unsigned long	clk_mod_rate;
> +};
> +
>  /**
>   * sun6i_csi_is_format_supported() - check if the format supported by csi
>   * @csi:	pointer to the csi
> -- 
> 2.35.1
> 
> 


