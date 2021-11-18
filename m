Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575F968
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Nov 2021 05:55:50 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id g18so4880626pfk.5
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Nov 2021 21:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H8bNW+/3U4emAhklg4BSuX8zNKroe2K7jyAYYwHKqm4=;
        b=mg3XzZdbe7EcdZZtXLojwHiBR6uWTSvFY9ntHbhfEGw7cOVLLhR7iq2jHlKjYvZKje
         tE98js5JX9B6xqseBuRndexsGHMMuU3ADEDlh5H+HXgIHthM6leIFNy7PjWvB+41wDCY
         Fw0EYqNAn3Zoep9Guk6z59BfYRGIufh7KG6fajD72OY0h62Di+Q14hviUQbzYjJzFJWv
         2dFsxxpuCFs/oNzXPT1S4WqVgrzvvcfCPlTD+yX2NnbtnO4UB7ulEOKr9yTK0ylpw1Yn
         zw7oT68jRtVyd/Bpj5yWFVXwEA7JEysMP4L8wqZ/fabFYwGG8LnV28erijgAGOcQ+Jxp
         H2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H8bNW+/3U4emAhklg4BSuX8zNKroe2K7jyAYYwHKqm4=;
        b=rCExwbH0vc3z3XJCo66iw9DGXgf/5LZRVSkMlNFJXRwpWikv6e/eWHB75HEn9aGADI
         pd7LBzlzfMgtbhFl5KPIeVvp3I4MLBsXgLQ4Xz67XpR7YX4KY7NgeYk9WCzY3rn5TUJe
         NMTjEFdBbLRAEDz92E5IAi2xE4F/LXhqgd0Pd8B9P9hOkC4QJWfpvIc+nfwbB4mKtLOC
         FCX7i5joIKZcH8BkrmWoNPw2WIUuvhqc1UWyVPZW60in7lQba4Gr8atyP3ImuyqlFxat
         RcG+LT09d7MoxWEjJ2mGHZxyAS8smPBdd6n5sd8ASf1P0A4DBE4JIJdwhSh3Agoear0U
         VleQ==
X-Gm-Message-State: AOAM533dURsO4xw8MJNGc5Y2jrT2A4loEC1ugG96q7LGFiWEH4ojtNOb
	m3eHaKC6qNmmXVgWXIEIbLs=
X-Google-Smtp-Source: ABdhPJy0bmOuMEiQB/QKzFcS3+3GEWN0C50DyDQSp5zYyw2lNe4d9dYFO/p2JPM66iyRTU1smPLeIg==
X-Received: by 2002:a63:b502:: with SMTP id y2mr9363870pge.214.1637214949470;
        Wed, 17 Nov 2021 21:55:49 -0800 (PST)
Received: from google.com ([2620:15c:202:201:e863:bb5d:673b:3a6d])
        by smtp.gmail.com with ESMTPSA id d2sm1502726pfu.203.2021.11.17.21.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 21:55:48 -0800 (PST)
Date: Wed, 17 Nov 2021 21:55:45 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Ondrej Jirman <megous@megous.com>
Subject: Re: [RERESEND PATCH v3] Input: sun4i-lradc-keys -  Add wakup support
Message-ID: <YZXq4Z/7HHNtn2bj@google.com>
References: <20211118033013.43116-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118033013.43116-1-samuel@sholland.org>

Hi,

On Wed, Nov 17, 2021 at 09:30:13PM -0600, Samuel Holland wrote:
> From: Ondrej Jirman <megous@megous.com>
> 
> Allow the driver to wake the system on key press if the "wakeup-source"
> property is provided in the device tree. Using the LRADC as a wakeup
> source requires keeping the AVCC domain active during sleep. Since this
> has a nontrivial impact on power consumption (sometimes doubling it),
> disable the LRADC wakeup source by default.
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> Changes since resend v3:
>   - An entirely different, but equivalent, DT binding patch was merged,
>     so there is only one patch left...
> 
> Changes since v2:
>   - Dropped unnecessary pr_err in platform_get_irq() error path
>   - Dropped patch 3 (DT update) as it was merged
>   - Added Acked-by/Reviewed-by tags
> 
> Changes since v1:
>   - Add requisite DT binding change
>   - Only add wakeup capability if "wakeup-source" is present
>   - Warn but do not error out if setting the wake IRQ fails
>   - Add "wakeup-source" property to PinePhone device tree
> 
> ---
>  drivers/input/keyboard/sun4i-lradc-keys.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
> index 4a796bed48ac..af1683d68c8c 100644
> --- a/drivers/input/keyboard/sun4i-lradc-keys.c
> +++ b/drivers/input/keyboard/sun4i-lradc-keys.c
> @@ -22,6 +22,8 @@
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_wakeirq.h>
> +#include <linux/pm_wakeup.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  
> @@ -226,8 +228,7 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
>  {
>  	struct sun4i_lradc_data *lradc;
>  	struct device *dev = &pdev->dev;
> -	int i;
> -	int error;
> +	int error, i, irq;
>  
>  	lradc = devm_kzalloc(dev, sizeof(struct sun4i_lradc_data), GFP_KERNEL);
>  	if (!lradc)
> @@ -272,8 +273,11 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
>  	if (IS_ERR(lradc->base))
>  		return PTR_ERR(lradc->base);
>  
> -	error = devm_request_irq(dev, platform_get_irq(pdev, 0),
> -				 sun4i_lradc_irq, 0,
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	error = devm_request_irq(dev, irq, sun4i_lradc_irq, 0,
>  				 "sun4i-a10-lradc-keys", lradc);
>  	if (error)
>  		return error;
> @@ -282,6 +286,14 @@ static int sun4i_lradc_probe(struct platform_device *pdev)
>  	if (error)
>  		return error;
>  
> +	if (device_property_read_bool(dev, "wakeup-source")) {
> +		device_set_wakeup_capable(dev, true);
> +
> +		error = dev_pm_set_wake_irq(dev, irq);
> +		if (error)
> +			dev_warn(dev, "Failed to set wake IRQ\n");

Should we make it

		else
			device_set_wakeup_capable(dev, true);

?

Thanks.

-- 
Dmitry
