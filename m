Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11897256D
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 10:22:03 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id d20so12481829ljc.12
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 02:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=49ivR/hLqgiIv6OqrmbBxE2JsrRkoVPBA0UvfU8gm7A=;
        b=l/uTJzzSuAgXfDj8m5PhL7yvhXNKhzoGsmDj0JX7Suu+H3cmDxCrPfKGiOzsGJt49T
         gAh6TVWrK0jJXzpG6hb4UW1KM/WvKtjIFB6tLKxfVmz80aYmhatH9oFzeQp7ZnbZZGhI
         4jIFn2NCHw6AWiQVqOG7ak+nw9MVWr0sOJcJ4WsUwe/GNqcxtEgjloXs11hhrf2fx0mp
         pG64xF/TP0pIpMFkY1TSjRA3LwJff/FJwBGbMN0MbEY+IAsAhSXtEB6eatOxcNJLGS+3
         d5jHZ2fAH71M7Z5YKLmbmROdY415BkgPWa4ZsKTG48H0uA9fLPuxBKP4e4ANj85l77lz
         EhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=49ivR/hLqgiIv6OqrmbBxE2JsrRkoVPBA0UvfU8gm7A=;
        b=cDsG5cr56Fa4/OE9MwBi2u+UTQ9AaB6jkITpBFVj3owMuHmYcy5mkZdAhhATXFMCh1
         Gnbbqu3tVazJN51Z5LfMaWSSrx9hH45qCHgPmODb0+WvCrNhIE66ffOgJYLCY7b6ZUqe
         QdLAxWR+wefFsxwMX8pkulbmHOAhBdgvPfXIGvdbh4zemXa7jS4wweqYqynrG7MKvWOr
         xRoyaMKM+J1/mYicf3oAa3g8R0NYA0wAIbla1Qt3wZ0UOhNYRjelml+gTpVkwRiYNQMB
         5jWc4DrY3X9cVyzcAP746Kxp1KrAXBxQpSZRDS8fmEPM3NqthSf5jTbI6Dk5p2e/dZBV
         SlGA==
X-Gm-Message-State: ANoB5plXV9logqhRN/2EIsfuuWXm9yBAhHeg8vMHQl6rtIqaTnXVMIiH
	BZdq7JmQkNdPrbQmUnYlR8J0Bg==
X-Google-Smtp-Source: AA0mqf7l8bh0quUrWupe/mrB5RNgcjOTA4Xt7T1LJfExKiUMll8vKYtDKCJcM8pf87jCy1PMmbEozg==
X-Received: by 2002:a2e:b705:0:b0:277:1c8f:7e8c with SMTP id j5-20020a2eb705000000b002771c8f7e8cmr4243094ljo.296.1668421321248;
        Mon, 14 Nov 2022 02:22:01 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t13-20020a19ad0d000000b004946e72711bsm1759717lfc.76.2022.11.14.02.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 02:22:00 -0800 (PST)
Message-ID: <1ac3e532-566c-77d0-a9cd-516d0914d311@linaro.org>
Date: Mon, 14 Nov 2022 11:21:59 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 08/18] mfd: max77843: Drop useless mask_invert flag on
 irqchip
Content-Language: en-US
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, lee@kernel.org
Cc: mani@kernel.org, cristian.ciocaltea@gmail.com, wens@csie.org,
 tharvey@gateworks.com, cw00.choi@samsung.com, brgl@bgdev.pl,
 mazziesaccount@gmail.com, orsonzhai@gmail.com,
 baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
 jernej.skrabec@gmail.com, samuel@sholland.org, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
 <20221112151835.39059-9-aidanmacdonald.0x0@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221112151835.39059-9-aidanmacdonald.0x0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/11/2022 16:18, Aidan MacDonald wrote:
> Setting mask_invert to false is pointless because that's the
> default. The flag is also deprecated, so drop it.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

