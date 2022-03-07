Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BF17482
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Mar 2022 23:21:37 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id w3-20020a4ac183000000b0031d806bbd7eso19850743oop.13
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Mar 2022 15:21:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GwqBsAiwDA57OzBbnIQApP2KsOEcfE99XASAzmUckUs=;
        b=vhYpDMgwbU61+pm2r4+HzXRg+d9Exozdfui1CI89BBgYpcQDH0KHMqRtZwRWYxLD/J
         KeSxBQDJ0wD55iRHTw0BkY6zSbhUKHTLoDZp48LPq8SRXFmsVa4Aar5AAkDIfmM17Hp1
         jkSvomGKpAA8yMwIc1XhM+BoFWtd9y6blOAEM+9VxME7QY528yfRV8rj/NuLNGfYBlVp
         hflwlmcCPBRGv8lo3y7mpEXiv/D+3FzoxKAQGyhsRDxnIqefngxSUrTRgv2vdYFKGD+X
         DpQ83xMelbFf0A8jmGVx7Lp3HFvWy9EMJL890LxppcVnSGimnyJvX+UnyNE5cHe1hpxC
         zWww==
X-Gm-Message-State: AOAM532OXykSEXixYuQ+uILRLjLH13eKx/3hLw+cYgGWgZRY+z6DPKMd
	xeXgmXMfzn6nfjGGU8SW8A==
X-Google-Smtp-Source: ABdhPJw/AE1EhWJP6qxkDyeRTJYp+la3lVDGzD9DakazOBHyOJ9Qw5nCO7bMG8JD6/2WWxv5bamQjg==
X-Received: by 2002:a05:6870:d151:b0:da:4cd6:552e with SMTP id f17-20020a056870d15100b000da4cd6552emr788011oac.136.1646695296565;
        Mon, 07 Mar 2022 15:21:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ay44-20020a056808302c00b002d9d2b564absm2177987oib.43.2022.03.07.15.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 15:21:35 -0800 (PST)
Received: (nullmailer pid 3453254 invoked by uid 1000);
	Mon, 07 Mar 2022 23:21:34 -0000
Date: Mon, 7 Mar 2022 17:21:34 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Saravana Kannan <saravanak@google.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Maxime Ripard <mripard@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH RFC v3 1/8] of: Mark interconnects property supplier as
 optional
Message-ID: <YiaTfsMDs7RGob2N@robh.at.kernel.org>
References: <20220302211100.65264-1-paul.kocialkowski@bootlin.com>
 <20220302211100.65264-2-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302211100.65264-2-paul.kocialkowski@bootlin.com>

+Saravana

On Wed, Mar 02, 2022 at 10:10:53PM +0100, Paul Kocialkowski wrote:
> In order to set their correct DMA address offset, some devices rely on
> the device-tree interconnects property which identifies an
> interconnect node that provides a dma-ranges property that can be used
> to set said offset.
> 
> Since that logic is all handled by the generic openfirmware and driver
> code, the device-tree description could be enough to properly set
> the offset.
> 
> However the interconnects property is currently not marked as
> optional, which implies that a driver for the corresponding node
> must be loaded as a requirement. When no such driver exists, this
> results in an endless EPROBE_DEFER which gets propagated to the
> calling driver. This ends up in the driver never loading.
> 
> Marking the interconnects property as optional makes it possible
> to load the driver in that situation, since the EPROBE_DEFER return
> code will no longer be propagated to the driver.
> 
> There might however be undesirable consequences with this change,
> which I do not fully grasp at this point.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/of/property.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 8e90071de6ed..ef7c56b510e8 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1365,7 +1365,7 @@ static struct device_node *parse_interrupts(struct device_node *np,
>  
>  static const struct supplier_bindings of_supplier_bindings[] = {
>  	{ .parse_prop = parse_clocks, },
> -	{ .parse_prop = parse_interconnects, },
> +	{ .parse_prop = parse_interconnects, .optional = true,},
>  	{ .parse_prop = parse_iommus, .optional = true, },
>  	{ .parse_prop = parse_iommu_maps, .optional = true, },
>  	{ .parse_prop = parse_mboxes, },
> -- 
> 2.35.1
> 
> 
