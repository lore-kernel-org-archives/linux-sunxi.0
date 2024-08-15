Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFA039FF3
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Aug 2024 07:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723706146; cv=none; b=pWUxGQ41Gp9GdaHBWectrJIvXEDsex5zIWw6V495IFmWsNq88eKDtSdAClQf2nlYzQgRUyPUzTdd13gwQat0qylTN0zSJzr+doOY7e7Svg7R/ErkPJCm22WCMVCH2KqHMJnWTOeH3HQfxJshLMQfOQtu3zA7J9namGnqJsW/qHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723706146; c=relaxed/simple;
	bh=GiHqZmyxScam6mzZQKuZVjPKqh8K83cFLfgDpQE6uR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjjCyTtFBJA7JDrkPF6nmBBT/45ItePnlJag6CGtgxVNoBhEy/LhQt6k2oU6drFxoBTRTiIYarHignv05np2jwNf+1DXFHbk1FUu6xPhSHmfrl8XcOrHS9S+IJDRZ8TfzG0C9UIdZV7MXbTeKX7ywQ08wSaLXgjmnJk3ki2btf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bqihzO9+; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bqihzO9+"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7c3ebba7fbbso564452a12.1
        for <linux-sunxi@lists.linux.dev>; Thu, 15 Aug 2024 00:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723706144; x=1724310944; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R9JmgHsK2eXcLrFjeKXovclXcr+2gfKF6M2PZSpS0PY=;
        b=bqihzO9+63i8Qd0HLUZV7WuiPpm5QVtcEDCZuI0RRoogQng/F53LgRoF5y+jF9YMeQ
         JaFHcrt3hxFuu+JOeJLkGofeBQ8WqYnJvkzp1qke+sxYmm05npw7PQ0b8nrOrcKAgDyH
         k9ju7a4qGFhB7jeInPEZF5gh8aJx3xl9O8MvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723706144; x=1724310944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9JmgHsK2eXcLrFjeKXovclXcr+2gfKF6M2PZSpS0PY=;
        b=UfeCQKSLRl04yXZligfeK9w3W0lrXIS4uJ7dW+Mu3P5Fh3rXh3pgdg+OHDXJ6jAAW7
         D5XUu79eH/iOEIKHENn79EzlyYfMIH4ikv9/dMBko3Zweig53TGznu4SLxbuwDJLpMif
         waykm8kzUOxjr4pF/zQqwbfbegSOJe67w3p4oSOAZ6sFuevZhaiS76rLD+hZEmU/mUbY
         TOsqEtCw497Mmr3eKsZjhsByXp6+ATJB/0QgJwslF5xtNfjEsri/IHLTxjb+w7osOena
         BYVj85V4Vvojj+hLn3IDh8Oa46nG6i3K8YbA5NnvbqNGZpCK6ijskbyVsR2vJJeh70og
         M4sw==
X-Forwarded-Encrypted: i=1; AJvYcCWTT3foyjWgKZiBovZwJQCy+dIHYxr6nat3deqDm16Ym0dt4yRdzl8ZQPraKKyOv7MvrfC9rQDzHjhheOZj7l060QWTf2pmVRjhg24=
X-Gm-Message-State: AOJu0Yw+8DUpVnrSCS+DxT/B0645qOd87a8gdDxTtgQIE2LgaPvZpszo
	2Y3+HssmqsUMOgmScdUhxXPcZEAGDXzbOPo5gRLzvg/HWGwBdq1HlciJY89H/g==
X-Google-Smtp-Source: AGHT+IGNNH+hyCCACdJtYZXI0gh62w46gVKcCAEgz5OV9CHzEwQIVxs+/U2Ky/c7OF20qNjl/7/JGQ==
X-Received: by 2002:a17:90b:2dc8:b0:2d3:b976:e30e with SMTP id 98e67ed59e1d1-2d3b976e58emr4016575a91.37.1723706143698;
        Thu, 15 Aug 2024 00:15:43 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:745d:58f7:b3cd:901f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac845f55sm2898845a91.36.2024.08.15.00.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 00:15:43 -0700 (PDT)
Date: Thu, 15 Aug 2024 15:15:38 +0800
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
Subject: Re: [PATCH 2/7] thermal: of: Use scoped device node handling to
 simplify thermal_of_trips_init()
Message-ID: <20240815071538.GB350960@google.com>
References: <20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-thermal-v1-2-7a1381e1627e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-thermal-v1-2-7a1381e1627e@linaro.org>

On Wed, Aug 14, 2024 at 10:17:48PM +0200, Krzysztof Kozlowski wrote:
> Obtain the device node reference with scoped/cleanup.h to reduce error
> handling and make the code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/thermal/thermal_of.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index a2278d4ad886..c8ded4462bb8 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -117,10 +117,9 @@ static int thermal_of_populate_trip(struct device_node *np,
>  static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *ntrips)
>  {
>  	struct thermal_trip *tt;
> -	struct device_node *trips;
>  	int ret, count;
>  
> -	trips = of_get_child_by_name(np, "trips");
> +	struct device_node *trips __free(device_node) = of_get_child_by_name(np, "trips");
>  	if (!trips) {
>  		pr_err("Failed to find 'trips' node\n");
>  		return ERR_PTR(-EINVAL);
> @@ -129,15 +128,12 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
>  	count = of_get_child_count(trips);
>  	if (!count) {
>  		pr_err("No trip point defined\n");
> -		ret = -EINVAL;
> -		goto out_of_node_put;
> +		return ERR_PTR(-EINVAL);
>  	}
>  
>  	tt = kzalloc(sizeof(*tt) * count, GFP_KERNEL);
> -	if (!tt) {
> -		ret = -ENOMEM;
> -		goto out_of_node_put;
> -	}
> +	if (!tt)
> +		return ERR_PTR(-ENOMEM);
>  
>  	*ntrips = count;

Also drop the "of_node_put(trips);" in the successful path?

Once fixed,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

And I plan to send a patch on top of this making "tt" auto released,
thereby eliminating the error path.

>  
> @@ -155,8 +151,6 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
>  out_kfree:
>  	kfree(tt);
>  	*ntrips = 0;
> -out_of_node_put:
> -	of_node_put(trips);
>  
>  	return ERR_PTR(ret);
>  }
> 
> -- 
> 2.43.0
> 
