Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD201249E6
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 14:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710341006; cv=none; b=qkNICCTA25OAde6pi8pZAp/aDvnDOJzemCZDB9udnfbeZikYLag7p7EDOKmgG+NDHFLWd48mIW6R8Qdozs7UtlqN7T8TewqNdED6X8A3y4k/uOKnM4DcPf/oK7gR66msjh4zGYHhndpL6TPPYigeh1vPW6KbGqBWptjK7qbr/Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710341006; c=relaxed/simple;
	bh=lCaNQB2loTvOG12Rj6ZuqIpIL166wy5YgOYvmqL9w2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GfL+/vNotkfV6evqlo/jtTILnooycqDTDFdq+QH04RCuW8lUNAWUZHjaFy2xnPeKzxgATvS8a0kcU40xEVIf1so59N+oemeUag8riRF66ciEawOQnLu/HEQXT9VxVlLPq3uHTNWJmqr5WkQkIgNyzH3WshnFURofr8ZeDW77nKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EFMywwIv; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EFMywwIv"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33e76d653b5so1070313f8f.3
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Mar 2024 07:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710341001; x=1710945801; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wOyyWxqr4Zt5l8qx0EOpnngPAjzS6Yb2YM91AanmvQ0=;
        b=EFMywwIvg/7chQH7uPxB2M5adc8QhKdFKTlepnRpGnh3j1/fYyly89QaaSFnf/UyGL
         Yd9PQUI3h9gR6SGy9yreunWjOaU4560EDOYx2ZSt4etf+Z/JuC5GYUFjkOTRLqI13fhj
         l1wWJfOzlvMrdTUR5fmqcDV6ZdjHT5JVGUlrpcgI+oBWhDSck9U3dxM6UdW+vaVhMzEt
         ls6LAXFiVse3K5IEIzPZuDRL3J4GWHMp6M1aUsdY46azF1DCIUb7Znk74Fg4sv0Z860A
         3cErmyh4NkyihjpY49Bh/5WbU9hExCEEzSaAnS/U8h7Zc8XC7wyKxm+vpWNd+VrtaFsk
         hnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710341001; x=1710945801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOyyWxqr4Zt5l8qx0EOpnngPAjzS6Yb2YM91AanmvQ0=;
        b=VOz2oq99VwfYcuYcTf3das54nNmDmprnTBsUs+Pbx1ItBq6sVOmFPZri12lGEad7Go
         u1TCQXIdgf+hx0HTd7BhS8TTqlr1Hs8D2nFTu6aYooQ0U4/GWyeXUbwlWWHcMX3/55ol
         PUq/du3DXcFNilN3RLtn08QZuUNIC0RT8ia3qOg18/0PzfTTtXrJC3m8zCWG/2q3AOB5
         l1HK4jBcrb5xdxxiXf2PHSKyi/RSxXUWOCMgNZIdH9g8LrEGjoWiRv9ZPHjwBNTf++fQ
         iDyqyWMqfJDdQFhcJIx9WfCSrEb9wsXUoQu1c9152cqzH6VvEjsSPrnr7Nu5ziVtn8Tx
         slGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyduCM2Eo24iNNTWkb/1e6Ui5bvkacHriK3reBgDB3JRV8gRIlufhFIfcDoXIBjymGxxrGfqsehSiZu0k8zjK9fUXa5ITj7r1+w9A=
X-Gm-Message-State: AOJu0YyGjVWsyXSK4SzGtjU13wXsAa6vryel0jpaMUKlzlgbxEZHsJ9j
	RCAMKsBFhH+0/8BgWelpmwzPhvRPzx7DGWSVWsXf5XRFQJbnQ0fGi2kmDloRxSk=
X-Google-Smtp-Source: AGHT+IHnYo+Mfw14XHLEGD+XsgTuPyQnaH13Xt3Jsj4nuhLeGe0VgxyoZDpIhuF+vbZ90D3cZE0hww==
X-Received: by 2002:a5d:40d1:0:b0:33e:be35:d449 with SMTP id b17-20020a5d40d1000000b0033ebe35d449mr676795wrq.44.1710341001070;
        Wed, 13 Mar 2024 07:43:21 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id bj28-20020a0560001e1c00b0033e7de97214sm12107696wrb.40.2024.03.13.07.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 07:43:20 -0700 (PDT)
Message-ID: <42665ccc-d020-48c4-a5bb-2713f7cbb75c@linaro.org>
Date: Wed, 13 Mar 2024 15:43:19 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/timer-sun4i: Partially convert to a
 platform driver
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <apatel@ventanamicro.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240312192519.1602493-1-samuel.holland@sifive.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240312192519.1602493-1-samuel.holland@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/03/2024 20:25, Samuel Holland wrote:
> Commit 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a
> platform driver") broke the MMIO timer on the Allwinner D1 SoC because
> the IRQ domain is no longer available when timer_probe() is called:

Did you mean: s/no longer available/not yet available/ ?


>    [    0.000000] irq: no irq domain found for interrupt-controller@10000000 !
>    [    0.000000] Failed to map interrupt for /soc/timer@2050000
>    [    0.000000] Failed to initialize '/soc/timer@2050000': -22
> 
> Fix this by wrapping the timer initialization in a platform driver.
> builtin_platform_driver_probe() must be used because the driver uses
> timer_of_init(), which is marked as __init. Only convert the sun8i
> variants of the hardware, because some older SoCs still need the timer
> probed early for sched_clock().
> 
> Fixes: 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a platform driver")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>   drivers/clocksource/timer-sun4i.c | 24 ++++++++++++++++++++----
>   1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
> index 7bdcc60ad43c..728dac2baa84 100644
> --- a/drivers/clocksource/timer-sun4i.c
> +++ b/drivers/clocksource/timer-sun4i.c
> @@ -20,6 +20,7 @@
>   #include <linux/of.h>
>   #include <linux/of_address.h>
>   #include <linux/of_irq.h>
> +#include <linux/platform_device.h>
>   
>   #include "timer-of.h"
>   
> @@ -218,9 +219,24 @@ static int __init sun4i_timer_init(struct device_node *node)
>   }
>   TIMER_OF_DECLARE(sun4i, "allwinner,sun4i-a10-timer",
>   		       sun4i_timer_init);
> -TIMER_OF_DECLARE(sun8i_a23, "allwinner,sun8i-a23-timer",
> -		 sun4i_timer_init);
> -TIMER_OF_DECLARE(sun8i_v3s, "allwinner,sun8i-v3s-timer",
> -		 sun4i_timer_init);
>   TIMER_OF_DECLARE(suniv, "allwinner,suniv-f1c100s-timer",
>   		       sun4i_timer_init);
> +
> +static int __init sun4i_timer_probe(struct platform_device *pdev)
> +{
> +	return sun4i_timer_init(dev_of_node(&pdev->dev));
> +}
> +
> +static const struct of_device_id sun4i_timer_of_match[] = {
> +	{ .compatible = "allwinner,sun8i-a23-timer" },
> +	{ .compatible = "allwinner,sun8i-v3s-timer" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver sun4i_timer_driver = {
> +	.driver	= {
> +		.name		= "sun4i-timer",
> +		.of_match_table	= sun4i_timer_of_match,
> +	},
> +};
> +builtin_platform_driver_probe(sun4i_timer_driver, sun4i_timer_probe);

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

