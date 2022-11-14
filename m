Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706D11864
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 06:27:04 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id s8so578582lfc.8
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Nov 2022 22:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bY5kKgtWBUsOEnjOURvV21DJ7RyovgQzTi4nUpuhn6E=;
        b=RWoFR0RCznAXxCcma5tOh2FeyZ1CdkJh+9ErJc+Mj2+I6ETqbdJ9mXOix2hFBZgXb8
         rD0lmcyLg++DIE93cK/wKV7whH20lou+fZW0XZN/RQ19UUaEnuzpoQYrg9gp/1llV1QG
         2midhjXRO2dLFg30DzL6FXvwvd4a7n8ZW5CgB1GLndM/87fPCCOCLDmRNYZPzftn7x3h
         hlgHgOnhZid4//3+2UxYKqdGDJJjsfMdUxvMy0VVUKnybsVqGFTCogACwewbsYk8F1VA
         WnIqL+45h4H/LlVdFg5P7I2L7VJ7uSoNookOOUYBf08Gp8C7zR1utTYnMbMtMdi/yXAW
         uFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bY5kKgtWBUsOEnjOURvV21DJ7RyovgQzTi4nUpuhn6E=;
        b=KDwCZhC7qj7nrSQAC3hvjmJ+WZfniaJti3kaE1994hWs/pD9g7+AP05OZB4BtjydJ5
         N/JR7Xe7lhNucpTwe0zitzE1de25gfMNdxQBYzLMNYnW55OnXfG0JwObUwO1HtI3BQ0X
         3sJlkUwWfCVJGG+VZ5ZeNXObVpfbPUplgF3Lnpl0qkDwKSqDVa5FQTpMOsdGF0VRIp6m
         G/c3vgLSn4EE/V+mRi5mWEUboFwzHHhQjptTI2/pbHzIFyxp9oumMO8xyRJ07Yr4/ZhS
         qaJAbEewWQrggs/xdAsUFLQRipEAXhKuDOxoZubwgVv7aKAfKV+zWaBLdWoHRKNrvMkb
         NCaA==
X-Gm-Message-State: ANoB5pkZgqYrOhS9rLte5DPdBviUpJWZB9WLRgB6RXaFbFBUZByHS8bC
	zkMr5EYgB/DOYIzhG+hPeWc=
X-Google-Smtp-Source: AA0mqf4JSHFS2ZAHw4fixGUPDmVLkK7LMQzd/VLb684CUupzxmt17Ynb8cN9YKkTCNC3KpwUAb+tyA==
X-Received: by 2002:ac2:51ac:0:b0:4a9:9827:68ed with SMTP id f12-20020ac251ac000000b004a9982768edmr3395051lfk.45.1668407222388;
        Sun, 13 Nov 2022 22:27:02 -0800 (PST)
Received: from ?IPV6:2001:14ba:16f3:4a00::7? (dc75zzyyyyyyyyyyyyydt-3.rev.dnainternet.fi. [2001:14ba:16f3:4a00::7])
        by smtp.gmail.com with ESMTPSA id f15-20020a05651c160f00b002770f0a742bsm1844891ljq.41.2022.11.13.22.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Nov 2022 22:27:01 -0800 (PST)
Message-ID: <b76ab78d-4785-bc8a-7f56-f21a189584c0@gmail.com>
Date: Mon, 14 Nov 2022 08:27:01 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 11/18] mfd: rohm-bd718x7: Drop useless mask_invert flag on
 irqchip
Content-Language: en-US
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, lee@kernel.org
Cc: mani@kernel.org, cristian.ciocaltea@gmail.com, wens@csie.org,
 tharvey@gateworks.com, cw00.choi@samsung.com,
 krzysztof.kozlowski@linaro.org, brgl@bgdev.pl, orsonzhai@gmail.com,
 baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
 jernej.skrabec@gmail.com, samuel@sholland.org, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-12-aidanmacdonald.0x0@gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20221112151835.39059-12-aidanmacdonald.0x0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/22 17:18, Aidan MacDonald wrote:
> Setting mask_invert to false is pointless because that's the
> default. The flag is also deprecated, so drop it.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

> ---
>   drivers/mfd/rohm-bd718x7.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
> index bfd81f78beae..ad6c0971a997 100644
> --- a/drivers/mfd/rohm-bd718x7.c
> +++ b/drivers/mfd/rohm-bd718x7.c
> @@ -70,7 +70,6 @@ static struct regmap_irq_chip bd718xx_irq_chip = {
>   	.mask_base = BD718XX_REG_MIRQ,
>   	.ack_base = BD718XX_REG_IRQ,
>   	.init_ack_masked = true,
> -	.mask_invert = false,
>   };
>   
>   static const struct regmap_range pmic_status_range = {

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

