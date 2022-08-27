Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92A92FB6
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Aug 2022 11:07:20 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id fy31so6906921ejc.6
        for <linux-sunxi@lists.linux.dev>; Sat, 27 Aug 2022 04:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=lZkqJmVYM3ykRrVvKK3+sQgQEcfYpd4wOkyRNuV/eyk=;
        b=ePJXSuH5zgUtF44lCwqnSIlcACdLRfTXPbwOOZeDgwAjs4cU0IH7E++ZnVbSCBdB7j
         i+zbogJiPaED7oWlWeyzopVx4VVc0XFMJKbANcHDDLuj5M3d6DcX6kioJ7AtK3A66cht
         9yOVFxxZysnShDXaQFC/P5LBOvqiGGI4U+4/gWo6/uxr2N/YOgVAjF2fN+u1V+Uk9yPs
         4T6V5PF5vwYXDv+COWbyo9dfAFBPAU3iOYUIvmDu6O0S9c+gDHr+ARH8jegz58gdjmix
         1lYn4+1iLHljg3x60e/ixXN/lE27zvSKNNqCf7wt6ndqq/h+N6sQh9jIQIPRrhyYSqaG
         4BTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=lZkqJmVYM3ykRrVvKK3+sQgQEcfYpd4wOkyRNuV/eyk=;
        b=FnIqcuF0iwNYqhuJBfCR80kW5ZiNEgWQZM3mg/67IbahnabU4KlZHQPyVpNjE+ZeWf
         Zm4vRQyXagoTKR+A859NYxU1O3D1k+HpDzr6Mvr0DBI/D0YNBqLTBW1An9AhvePh5rlW
         nPE3YX5dRa/u5+AQMfwrYTKuIteoB625r4WUoGo3j+uXuYr2HMGIoubqK7ayxCSVhHqJ
         QVQ0Tg7lXpXserEiI/whWb/Cr3fhcxGazFHPkGVnH/vTFJ4hF8U+a2iCQ/DKR0b3ddhm
         FJIBFaIZ8gmaok80gOb9qLl4Na+wfGy495+ToBxzSsMgVoHNlYKQ9gxypgk8/p6gjz36
         04JA==
X-Gm-Message-State: ACgBeo1Bab/W5uZH0KkJxWEbxV+MM4miBOlObFxRsKYAvkn4zzK0hr+r
	e5j2crRrLC7I5NajyY+IOrg=
X-Google-Smtp-Source: AA6agR7Gi23MJctCXw2Z3gvYmOl9hVU/qWDfBKurCmq0eWo8haTLOx5zMtsyglzY8FL8EvsuCSM14g==
X-Received: by 2002:a17:907:a06b:b0:73d:dde9:75a7 with SMTP id ia11-20020a170907a06b00b0073ddde975a7mr5673771ejc.52.1661598438898;
        Sat, 27 Aug 2022 04:07:18 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id dk1-20020a0564021d8100b0043bea0a48d0sm2636109edb.22.2022.08.27.04.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 04:07:18 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, wens@csie.org
Subject: Re: [PATCH -next 1/3] clk: sunxi-ng: sun8i-de2: Use dev_err_probe() helper
Date: Sat, 27 Aug 2022 13:07:17 +0200
Message-ID: <5859328.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20220827094151.3323450-1-yangyingliang@huawei.com>
References: <20220827094151.3323450-1-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 27. avgust 2022 ob 11:41:49 CEST je Yang Yingliang napisal(a):
> dev_err() can be replace with dev_err_probe() which will check if error
> code is -EPROBE_DEFER.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c index 2f6f02f00be2..b70b312e7483
> 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> @@ -256,29 +256,19 @@ static int sunxi_de2_clk_probe(struct platform_device
> *pdev) return PTR_ERR(reg);
> 
>  	bus_clk = devm_clk_get(&pdev->dev, "bus");
> -	if (IS_ERR(bus_clk)) {
> -		ret = PTR_ERR(bus_clk);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "Couldn't get bus clk: 
%d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(bus_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(bus_clk),
> +				     "Couldn't get bus clk\n");
> 
>  	mod_clk = devm_clk_get(&pdev->dev, "mod");
> -	if (IS_ERR(mod_clk)) {
> -		ret = PTR_ERR(mod_clk);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "Couldn't get mod clk: 
%d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(mod_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(mod_clk),
> +				     "Couldn't get mod clk\n");
> 
>  	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> -	if (IS_ERR(rstc)) {
> -		ret = PTR_ERR(rstc);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(&pdev->dev,
> -				"Couldn't get reset control: 
%d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
> +				     "Couldn't get reset 
control\n");
> 
>  	/* The clocks need to be enabled for us to access the registers */
>  	ret = clk_prepare_enable(bus_clk);




