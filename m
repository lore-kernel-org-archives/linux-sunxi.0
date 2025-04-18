Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CB7224F6
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Apr 2025 13:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744983506; cv=none; b=RSXvHwwKmLQTugy8tO6oRuYl+SLjYnS4uGKAbygsqrSCarcfiACG2n7pvH9VXWFWSA+h1SdcC0x7KfkOzdckDVlSC7v7XOXU1y2Nsv4vOTEZBE3SL0pVmxy9mpaqukfULgK2PujERPL6T6C76+1vuCj9NJSi2kIn3eawbH+q+m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744983506; c=relaxed/simple;
	bh=uNPAmOkyXrXKI21dJPKiHtF/AiAGws8IUUtspmfI4uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:In-Reply-To:
	 From:Content-Type; b=ZEdZJTCZyEzepW9vP/oucbFXS1Wx9y8/dXhoKiPhMT34h9hP6iDsEwLvCeiGFCW02i53+PzlBweaGttcFhUAU0aYkEJcq/ZfI2MfPCh4nYR5kMBZXHuds51vB3yspLEMu4GX/kp++wSPhanNyySBRDQR9ugPUBLDjKkZnOQDo84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6AnSUjf; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6AnSUjf"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22409402574so3510705ad.1
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Apr 2025 06:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744983504; x=1745588304; darn=lists.linux.dev;
        h=content-transfer-encoding:from:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gPTcC0Qo0IfweDpTBHJVf2QO3zsuTW+Lm6WypoA0fRY=;
        b=H6AnSUjfanfUbcGpeMg1gHphE+wg/3NIUe+gKNZQgC9mDstjkF7TakcPJOoiOcg16L
         aeO+odoorVCHkYSAfxBmeH6NWb/J7bIMU6XqfvBCUnUEV8e8B3A9BYtei4BffgbUNgnJ
         QMquulNJqtqwJUY6jntnLZ18QuNJTtpYGgkrDQBeh5wlcnU3Svfd/d5SUnCvC5IK4+++
         N5lyJNeOwko3+mffBEct4kWGFKSw2URx9jd2Yg06FjsElPNKR0lmzwL67HrdZ7TFo6UM
         /EogrVxNKpr/WbuWrj0wHL6ht2JLlULXficiBcbP3A9zqCiIM12mYshYdGykFDkmhsqZ
         Nvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744983504; x=1745588304;
        h=content-transfer-encoding:from:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gPTcC0Qo0IfweDpTBHJVf2QO3zsuTW+Lm6WypoA0fRY=;
        b=F4Tr/Q773is0AfWzZPmmNlaVu7qfYb2ULxwZva7rF2Ez+1TlgnWpmsSSzR5Irv9no0
         q0/NdD8b2VNBJ7/EhfucV+f6GCnx0HBJa/uDk8lWgw1/vxK2AQXtJ3DJ3dD6NWzOPtEk
         sVbzMFzF81hOOpDj0k2i2z6gtyHUnkKUR6yuN9w6YzwxWqoH5GpWeAZxW0Di3bzRnb/c
         8ZC6RUa3c6jpdqjUXe6FLuZ8sfzHpmmdksKpBfhZM32pcuIy04A91fNOeGZKo8CkQBzN
         eZB+/ouZ2tZElchLtuzZYTHByjuzp5PQ/G2x+6NrCwOVL/TaGquw5rkZccHr/rdXXqas
         P/vQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8bLk/E7GNhE0KbhyG/yJ/iz605+3FR2Y6YfFIzUURRuz/GhgVU8mzTeYxLDuOEWdjcvHqAuxrl5QKIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsNs65G5vPKjJE8CW03l8zEV4SP9A3K9YNf+2HLUxnyUYP5uwz
	eaZfl7R/dXJzZVfcfOUP9uoaO8LRu9bO5592uHOp58rsbmvI/rgx
X-Gm-Gg: ASbGncsEphB8lcpeBWxoTZjqQcyLbI2rwQEsZ5UCc6aopPorBjxohuqeryenn/DEMUO
	sK0k6zkWL538vJ3+LA9e+5KSSg9yVjFGHLPXS4VJRyp2zi/ycL68gI8so6vVNfvjtV5HD/JGnny
	FnhG/0OttAK9YR8s3kQUgXJcomoX5W6CarG+bW3ep+cXlgLkluI3J5JlF8DESpn9z4xehSsuyJ2
	sFxynbSFC03cMKc8OnQ8BBw0ISkqT8WP4q0ztIPpnpPqFrZLQ08bKsdV9CdqivCa95aikq7/UI4
	cuAx2WwrkHr19I4Ekr+T37ym1ZyhL1iCluuLMUHk7QZaxwkzVtMGwTEiaboP9Q/e43AVR0wr7rg
	qKsvsMXykIZuM213Wi8rvycc5DA==
X-Google-Smtp-Source: AGHT+IEYryzzRgr0FcDDUzJNYZVMf5qL5xMbHqFRL9xrVSNiBPnB48rP0O+OYmAEiF3wFKWEMbeD2w==
X-Received: by 2002:a17:902:d4cc:b0:215:a57e:88d6 with SMTP id d9443c01a7336-22c530bc997mr14523115ad.0.1744983503877;
        Fri, 18 Apr 2025 06:38:23 -0700 (PDT)
Received: from ?IPV6:2406:3400:21b:310:2ef0:5dff:fe09:98db? ([2406:3400:21b:310:2ef0:5dff:fe09:98db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdb1d2sm16663205ad.25.2025.04.18.06.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 06:38:23 -0700 (PDT)
Message-ID: <417a77f3-8532-4528-9c3d-89671d1e6177@gmail.com>
Date: Fri, 18 Apr 2025 23:38:16 +1000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/panfrost: reorder pd/clk/rst sequence
To: Philippe Simons <simons.philippe@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20250403055210.54486-1-simons.philippe@gmail.com>
 <20250403055210.54486-4-simons.philippe@gmail.com>
Content-Language: en-US
In-Reply-To: <20250403055210.54486-4-simons.philippe@gmail.com>
From: John Williams <porschemad911@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I have regression tested this patch on the following devices:

Powkiddy RGB10X - Rockchip RK3326 (Mali G31)

Powkiddy RGB20 Pro - Rockchip RK3566 (Mali G52)

Odroid Go Ultra - Amlogic S922X (Mali G52)

Gameforce ACE - Rockchip RK3588S (Mali G610)

No regressions found during cold boot or with wake after sleep.

Tested-by: John Williams <porschemad911@gmail.com>

On 3/4/25 16:52, Philippe Simons wrote:
> According to Mali manuals, the powerup sequence should be
> enable pd, asserting the reset then enabling the clock and
> the reverse for powerdown.
>
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> ---
>   drivers/gpu/drm/panfrost/panfrost_device.c | 38 +++++++++++-----------
>   1 file changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index 93d48e97ce10..5d35076b2e6d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -209,10 +209,20 @@ int panfrost_device_init(struct panfrost_device *pfdev)
>   
>   	spin_lock_init(&pfdev->cycle_counter.lock);
>   
> +	err = panfrost_pm_domain_init(pfdev);
> +	if (err)
> +		return err;
> +
> +	err = panfrost_reset_init(pfdev);
> +	if (err) {
> +		dev_err(pfdev->dev, "reset init failed %d\n", err);
> +		goto out_pm_domain;
> +	}
> +
>   	err = panfrost_clk_init(pfdev);
>   	if (err) {
>   		dev_err(pfdev->dev, "clk init failed %d\n", err);
> -		return err;
> +		goto out_reset;
>   	}
>   
>   	err = panfrost_devfreq_init(pfdev);
> @@ -229,25 +239,15 @@ int panfrost_device_init(struct panfrost_device *pfdev)
>   			goto out_devfreq;
>   	}
>   
> -	err = panfrost_reset_init(pfdev);
> -	if (err) {
> -		dev_err(pfdev->dev, "reset init failed %d\n", err);
> -		goto out_regulator;
> -	}
> -
> -	err = panfrost_pm_domain_init(pfdev);
> -	if (err)
> -		goto out_reset;
> -
>   	pfdev->iomem = devm_platform_ioremap_resource(pfdev->pdev, 0);
>   	if (IS_ERR(pfdev->iomem)) {
>   		err = PTR_ERR(pfdev->iomem);
> -		goto out_pm_domain;
> +		goto out_regulator;
>   	}
>   
>   	err = panfrost_gpu_init(pfdev);
>   	if (err)
> -		goto out_pm_domain;
> +		goto out_regulator;
>   
>   	err = panfrost_mmu_init(pfdev);
>   	if (err)
> @@ -268,16 +268,16 @@ int panfrost_device_init(struct panfrost_device *pfdev)
>   	panfrost_mmu_fini(pfdev);
>   out_gpu:
>   	panfrost_gpu_fini(pfdev);
> -out_pm_domain:
> -	panfrost_pm_domain_fini(pfdev);
> -out_reset:
> -	panfrost_reset_fini(pfdev);
>   out_regulator:
>   	panfrost_regulator_fini(pfdev);
>   out_devfreq:
>   	panfrost_devfreq_fini(pfdev);
>   out_clk:
>   	panfrost_clk_fini(pfdev);
> +out_reset:
> +	panfrost_reset_fini(pfdev);
> +out_pm_domain:
> +	panfrost_pm_domain_fini(pfdev);
>   	return err;
>   }
>   
> @@ -287,11 +287,11 @@ void panfrost_device_fini(struct panfrost_device *pfdev)
>   	panfrost_job_fini(pfdev);
>   	panfrost_mmu_fini(pfdev);
>   	panfrost_gpu_fini(pfdev);
> -	panfrost_pm_domain_fini(pfdev);
> -	panfrost_reset_fini(pfdev);
>   	panfrost_devfreq_fini(pfdev);
>   	panfrost_regulator_fini(pfdev);
>   	panfrost_clk_fini(pfdev);
> +	panfrost_reset_fini(pfdev);
> +	panfrost_pm_domain_fini(pfdev);
>   }
>   
>   #define PANFROST_EXCEPTION(id) \
