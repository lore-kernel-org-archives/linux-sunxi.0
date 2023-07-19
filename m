Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE9F275DF
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Jul 2023 19:56:33 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fba8e2aa52so63975e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Jul 2023 12:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689796591; x=1692388591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkXfqP5HTc7LAT471rM4RtSLWgyDDA4RKqfhTSA/bHM=;
        b=Ur6fXRxqNVu6iJfQVwhSvCj8F/Ub6ioJGh7LOMqSUduRNJ5g723VsQ3iS5DTqLbDPi
         LM3fTKR8y2LLZkbP/K1+550CBQ6qVN7I/j9R/2LfV47wk0ygWxvRbAD+bJu0uxO0vJCS
         1qTuPTjblcCvUd5+R2JwFuLqpVdGC02ud8M2sPOomwQNJKcUPCceKjlbI/Yi26s8fv8O
         tGFgSvHwXxNIEG136IZMdJYdeeGHq0NxbPfFMJ+cTHnL6YHY1ipyWJuVZhq4JnkMaWfl
         5gdcBXWA8wxg7fW99UtS5X9wAeO3FEIfL6xEaA2OIoFO/z5d4jLZetn6i4xm97sfv1r6
         0jUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689796591; x=1692388591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HkXfqP5HTc7LAT471rM4RtSLWgyDDA4RKqfhTSA/bHM=;
        b=U8rIeC2wKgZKZ4fOMxhjCFzPhGf6d/CIme+kxdhE/iV9ShkQvLU0hYActooiXOPpcW
         D7ZVO99rdtlH1HopA0CvmDbJMQ9OGCqLQTdsNQmJOGiaQfKBceV1HRUYzCAQ0gU7reNI
         d415eAE3eykxiD1+DLHWOlVuhKTofulsl60JuG+Ii5uw4A29ThhENV3em+IQR+1pE5vt
         4Gf+WqSLtSsXjMpGqmk/qvzqdaWNoNXHyfGB3Ud3FkgaY9F/y6VUm5p01yNzO+jySwTU
         J86JVK/bXXzUxXcip7G8wR+f8zf8MLMf+aNh7Z0yepCNcUC2QjXWuIdeEAssfVcknWQs
         a4wQ==
X-Gm-Message-State: ABy/qLY3ydTvUgDm430k6tcPu1aqAnUUxCAwDFMF5fbG32cx0N/LUNOo
	Nl6nddacIr7IG2FxPuzhEKE=
X-Google-Smtp-Source: APBJJlFr+x78/f/4ot76lC8mJxJeAa7g9BNSia7Aug5kEv7lgO0VS3TFcD/HAU9e5hLbCT97nsVT4w==
X-Received: by 2002:a05:600c:2494:b0:3fb:b1fd:4183 with SMTP id 20-20020a05600c249400b003fbb1fd4183mr316396wms.12.1689796591016;
        Wed, 19 Jul 2023 12:56:31 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id w13-20020a5d680d000000b00313e2abfb8dsm6093571wru.92.2023.07.19.12.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 12:56:30 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
 Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject:
 Re: [PATCH] thermal/drivers/sun8i: Free calibration nvmem after reading it
Date: Wed, 19 Jul 2023 21:56:27 +0200
Message-ID: <13308789.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20230719-thermal-sun8i-free-nvmem-v1-1-f553d5afef79@kernel.org>
References: <20230719-thermal-sun8i-free-nvmem-v1-1-f553d5afef79@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sreda, 19. julij 2023 ob 02:58:54 CEST je Mark Brown napisal(a):
> The sun8i thermal driver reads calibration data via the nvmem API at
> startup, updating the device configuration and not referencing the data
> again.  Rather than explicitly freeing the nvmem data the driver relies
> on devm_ to release it, even though the data is never referenced again.
> The allocation is still tracked so it's not leaked but this is notable
> when looking at the code and is a little wasteful so let's instead
> explicitly free the nvmem after we're done with it.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/thermal/sun8i_thermal.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/sun8i_thermal.c
> b/drivers/thermal/sun8i_thermal.c index 195f3c5d0b38..af3098717e3c 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -286,7 +286,7 @@ static int sun8i_ths_calibrate(struct ths_device *tmdev)
> size_t callen;
>  	int ret = 0;
> 
> -	calcell = devm_nvmem_cell_get(dev, "calibration");
> +	calcell = nvmem_cell_get(dev, "calibration");
>  	if (IS_ERR(calcell)) {
>  		if (PTR_ERR(calcell) == -EPROBE_DEFER)
>  			return -EPROBE_DEFER;
> @@ -316,6 +316,8 @@ static int sun8i_ths_calibrate(struct ths_device *tmdev)
> 
>  	kfree(caldata);
>  out:
> +	if (!IS_ERR(calcell))
> +		nvmem_cell_put(calcell);
>  	return ret;
>  }
> 
> 
> ---
> base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
> change-id: 20230718-thermal-sun8i-free-nvmem-3e9e21306e3e
> 
> Best regards,




