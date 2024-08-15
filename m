Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6DD17BB25
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Aug 2024 07:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723707068; cv=none; b=NvSGP4BZVxVLP/XEXhOLjqxma1KNpHS7Vzd/vNJS8saovi8sf6u/2ipqYcS3ShtqJfnLjrAmJ2ONXCxC9W/2J8MWs7yH1cei+AxJ6jb8cX/A29SOOr3eDWqcRoVUep6Wd3V1QK/D+l76jL06uftVn/L1RXMxDzr0gBgNWH1NNKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723707068; c=relaxed/simple;
	bh=4PE6mZrr8H7PR8eBnAu+UMXSqK7YbiUSYrQYtoLYBqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ow/9g+iqdKNM9Pz3l3nt/i3fy6sUxX7IikVz7S6qZpgTk24tbQRWX7p8j5p2B8UqbaTtgMR03iun8vKGpfsRTi1rKXhaIGc8kGCFusCIn2Z/17dhaxizwd3j9Z4EAA0fctcWLavgvJjKiIzj6emjVVhyMR65B74PC1kDMWpwL4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RfWEWWA/; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RfWEWWA/"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-710bdddb95cso427757b3a.3
        for <linux-sunxi@lists.linux.dev>; Thu, 15 Aug 2024 00:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723707066; x=1724311866; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K/0W+4K7PrRjUu9VD4koOfW7NXqyGwydvnf3SEGRUt4=;
        b=RfWEWWA/Uqz7PDYckqOu7UsLn0iurO/goEv5uz+jQap/uN9XHyheIZ9O0AEJ3uqVlK
         m6VYtVCTjyf74cTtLqkN/8gobDKtSrpmYglGceRqgSF7bG2UWSsGqw6mETwqVxrmRvGr
         B3Bd4VXw0SaMm5Y7Z3yMHx7NDMRWjrVBqribo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723707066; x=1724311866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/0W+4K7PrRjUu9VD4koOfW7NXqyGwydvnf3SEGRUt4=;
        b=WSETpxfjBAcCPdgWEbysnOoGFlmg+2u5x2h9tmc80246xZ+G28ffnsFXIzQ4G3jZxV
         KL3RE1+FL3LIz5E4ak1lQgaG8Xwokt0vRHaPu5GOyDD/Im0MybnA38VJ1uv2TJfPWP0G
         FzOu5uqKl67LrIeO8oaxIOd/AGsqG3Qqn/KZTDgVLD4wbFDeOIhbpAQHL3W9e1Mv4oEn
         EvspUg+P9PymjFxPYndxaObMUPOB2hM0nzyLvYg0yBoiZZqTNJz91hzVsWALgwJY9UNU
         DqirRBo1iKL5EOYjtY2dtn6u0Of/FzLoc9qkxHZlJALyPlxkBrZgWnGvMW191hqUcxML
         /1fw==
X-Forwarded-Encrypted: i=1; AJvYcCXrEJS2Vj9q6A/YrVRFEz81zXocEm/jLZReoHGEH7UTw6phMcMVRbMA1/QZ44+HQNqldHOSqjjVxNOtJcLICBr+sdey4yfaOPPG32Q=
X-Gm-Message-State: AOJu0Yz2RYy1suQKPQpnmXOH0qE8QTN+NTOwK/bu2MLVmqhb7j/qFt9v
	ZukV/mes5TbMAmfy/MW1K/DdtuaaDMRdC9p2odew6wAN15OzE3yd1HseyxHh3Q==
X-Google-Smtp-Source: AGHT+IGej8YvuGdBMRMsXjNlbIbtoIi0LLSQzAkjZWVd/ikaWZkP42kYpFajA9fEuF1NPTDRfj3RWQ==
X-Received: by 2002:a05:6a20:d706:b0:1c6:fc7d:5546 with SMTP id adf61e73a8af0-1c8eaf59d37mr7069297637.37.1723707065853;
        Thu, 15 Aug 2024 00:31:05 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:745d:58f7:b3cd:901f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af188a4sm559611b3a.164.2024.08.15.00.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 00:31:05 -0700 (PDT)
Date: Thu, 15 Aug 2024 15:31:00 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 6/7] thermal: tegra: Simplify with scoped for each OF
 child loop
Message-ID: <20240815073100.GF350960@google.com>
References: <20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-thermal-v1-6-7a1381e1627e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-thermal-v1-6-7a1381e1627e@linaro.org>

On Wed, Aug 14, 2024 at 10:17:52PM +0200, Krzysztof Kozlowski wrote:
> Use scoped for_each_child_of_node_scoped() when iterating over device
> nodes to make code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/thermal/tegra/soctherm.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
> index a023c948afbd..ff4eedb553fb 100644
> --- a/drivers/thermal/tegra/soctherm.c
> +++ b/drivers/thermal/tegra/soctherm.c
> @@ -1651,7 +1651,7 @@ static void soctherm_init_hw_throt_cdev(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct tegra_soctherm *ts = dev_get_drvdata(dev);
> -	struct device_node *np_stc, *np_stcc;
> +	struct device_node *np_stc;
>  	const char *name;
>  	int i;
>  
> @@ -1668,7 +1668,7 @@ static void soctherm_init_hw_throt_cdev(struct platform_device *pdev)
>  		return;
>  	}
>  
> -	for_each_child_of_node(np_stc, np_stcc) {
> +	for_each_child_of_node_scoped(np_stc, np_stcc) {
>  		struct soctherm_throt_cfg *stc;
>  		struct thermal_cooling_device *tcd;
>  		int err;
> @@ -1683,7 +1683,6 @@ static void soctherm_init_hw_throt_cdev(struct platform_device *pdev)
>  
>  		if (stc->init) {
>  			dev_err(dev, "throttle-cfg: %s: redefined!\n", name);
> -			of_node_put(np_stcc);
>  			break;
>  		}
>  
> 
> -- 
> 2.43.0
> 
