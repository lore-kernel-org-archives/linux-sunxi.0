Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6B73BB21
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Aug 2024 07:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723705827; cv=none; b=e5FHJL+TzieccQsOe9W+kYC3oIyLv0aqPEFm45SM+LYFva4fQy0V+R/XRCd5woTuhcCef7MziwvEo97RmE42togdBbXzn6GVQevCnJN+p9uVeJSTz4Vp2OsPW6WwH5sui5xWWw185plDBNxO2/zrl+BNl8Rd2m/HXhI9HW3SDc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723705827; c=relaxed/simple;
	bh=+G2x58+Rfzt9S7NTB27xB1O9RQRhx/e+CR+izCKso3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oyZmcShUk2NpygAMZpH+dxBXk0APd1/xStJvPPU6B6PYGmbgbN/UbqhnhawdbM26t2pJIvFKgPw4izS9rnmYECcusyOKs7uGD1xxWd/xT3Avrh2s/33FP01chg8WJbt7JFd2G30H59JSL/8yI5ExSI4mcbDyBg58R9FV0qA3JM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AYiUC39b; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AYiUC39b"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7106e2d0ec1so487615b3a.2
        for <linux-sunxi@lists.linux.dev>; Thu, 15 Aug 2024 00:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723705825; x=1724310625; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J08p29teShFomh8KvO2Ddu4MMDaSeQCVywSAkToMLKQ=;
        b=AYiUC39bjQ10NdEHMNSznO8sSZrWq0UlpPcuhf0nLeLqTLkqcmnMRHOXA4lQnLybIU
         gqtOfOx2iCa6gfxKwqG8ad+55VK8oojmBf3tJw7dxYGKjV+YvLuEZXNZsA0m3h5Mqd/p
         PTRGHH23YlUcNdrzdbzqSMVUAAUleHiwDdmjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723705825; x=1724310625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J08p29teShFomh8KvO2Ddu4MMDaSeQCVywSAkToMLKQ=;
        b=qbdhtTnEGpyjAzuFbZ8MRUotb8yNcJ5zKrYdHwBED+TbFgFt1d0pgv61cKYT+elTuL
         sVf0nsgLMZ8hSZ00UTCqK586uUSbvOMABJ7eWhKW73FlpdLo8LotAe7TL0ocTydykGaE
         ZxTazho+Zlc10y+7fO19IuaO8WLlcrvU+egCJbLsJj/Riaji3S3aRc+ABRkt5FzB8ZMK
         t/iW1Nbep9wDxHfnpyldKjGuTvzP1uaGmNzpMbfE+mLVIVzXprpAfG0j8THGxANt2Obk
         Y0FCPyPYXGjebPZkCBEKW8tR4PRcN8I9918GU1tVI4Zp3uYWlqgpNUOeOSnqN3F4iqRY
         QAZw==
X-Forwarded-Encrypted: i=1; AJvYcCUMhSNHavCLYsK1CXyoTkCiMKQ/qid+Obhok7hFh8iDHDbOr09eFQCgfGOW1aw4Lh+h6B+bREcQtx70qzkOnpwk92NVttIqlLjEiAE=
X-Gm-Message-State: AOJu0YwiwolHJw32zN1vV3ImDVtqJeJbw9H47sUQDuquecc7ocQXIZ4A
	1pKu9Mr/5TOSHLcP1wqDdluqMsrEjJSmw2rDvKu58soTdrTcqgTPojFLYINKvg==
X-Google-Smtp-Source: AGHT+IHiXJsW+fRg102OhEnKAhvxwqG0Aaky2UVkllFzxbNrNdYCyuMBqkLJT5RdAPJhpDiPBU7AYw==
X-Received: by 2002:a05:6a00:4b49:b0:70e:8070:f9d0 with SMTP id d2e1a72fcca58-7126710d3a1mr6179895b3a.9.1723705824996;
        Thu, 15 Aug 2024 00:10:24 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:745d:58f7:b3cd:901f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af19683sm536163b3a.163.2024.08.15.00.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 00:10:24 -0700 (PDT)
Date: Thu, 15 Aug 2024 15:10:19 +0800
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
Subject: Re: [PATCH 1/7] thermal: of: Use scoped device node handling to
 simplify of_find_trip_id()
Message-ID: <20240815071019.GA350960@google.com>
References: <20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-thermal-v1-1-7a1381e1627e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-thermal-v1-1-7a1381e1627e@linaro.org>

On Wed, Aug 14, 2024 at 10:17:47PM +0200, Krzysztof Kozlowski wrote:
> Obtain the device node reference with scoped/cleanup.h and use scoped
> for_each_child_of_node_scoped() to reduce error handling in
> of_find_trip_id() and make the code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/thermal/thermal_of.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index 1f252692815a..a2278d4ad886 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -8,6 +8,7 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <linux/cleanup.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
>  #include <linux/of.h>
> @@ -22,11 +23,9 @@
>  
>  static int of_find_trip_id(struct device_node *np, struct device_node *trip)
>  {
> -	struct device_node *trips;
> -	struct device_node *t;
>  	int i = 0;
>  
> -	trips = of_get_child_by_name(np, "trips");
> +	struct device_node *trips __free(device_node) = of_get_child_by_name(np, "trips");
>  	if (!trips) {
>  		pr_err("Failed to find 'trips' node\n");
>  		return -EINVAL;
> @@ -35,20 +34,13 @@ static int of_find_trip_id(struct device_node *np, struct device_node *trip)
>  	/*
>  	 * Find the trip id point associated with the cooling device map
>  	 */
> -	for_each_child_of_node(trips, t) {
> -
> -		if (t == trip) {
> -			of_node_put(t);
> -			goto out;
> -		}
> +	for_each_child_of_node_scoped(trips, t) {
> +		if (t == trip)
> +			return i;
>  		i++;
>  	}
>  
> -	i = -ENXIO;
> -out:
> -	of_node_put(trips);
> -
> -	return i;
> +	return -ENXIO;
>  }
>  
>  /*
> 
> -- 
> 2.43.0
> 
