Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A3C7C
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Mar 2023 18:07:45 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id r16so14135807qtx.9
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Mar 2023 11:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679335664;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L3ZgQ6hbDwLFA0+/6XyOTTwas24M548/DGldx8bD/B4=;
        b=LpTTMMaMAGr1wg0gxQpPPQJcst7GYq7vYAPtjRVIP8cmaf+ovoh4ciEsHhfsjI72S3
         LNmMof4lp289jUlBGm0qH75LQ0CEWWtVzCRDcHNa1zAYsdAXZmdAnNtD4MLAi+g54KPj
         4H227WE8o8Kf40sjsZo96JnijcrGtUCo6gOS5QHwi1TfT2ZtLLmtiFq3AQd4IpH/iGc/
         XRmMRfibPzro/QdkcU+II9zbngeGi2EO0U2WjN2eA/BXgZBHd0ODyvvxwIfX1g2OpXjH
         8qDJcZy+sq6X/Oa5xQqs6yjdd2aYZHxya+sjOqGm/5hthoBF+rPcqikSfMc0B9dW26dC
         xVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679335664;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L3ZgQ6hbDwLFA0+/6XyOTTwas24M548/DGldx8bD/B4=;
        b=f/3voj3lm2YXXz9vE3Klwfw65sk3PxiKt7w886+f/RkNz0qjmPXQzfS9d3+0dElFg4
         TbGhEU48XszHil9qFhX7Z7JWryhMzIyEt1N5rs2pRC5frOMX0hKuEAXMyIIJt7VIo1EX
         SMYnWGWRrYX+RwiLaJO29saAvFm9pvJAEik4v16MRqTLI1echMlcfgbDwcJHW32zb2pJ
         r3uW0A+yc3+95jwr4paRqVc1FimUvoDsSxLDU0YaCbygANW38kloPO3jQ4ZFd1mOq0sE
         o1hlUM5m4Rrn6FhHWuP6Cj7aL1gQjHSDH2nkpmAyuQaOlgFepZ5GTvNTHpbBiEUDItoZ
         kauA==
X-Gm-Message-State: AO0yUKWcGRBEgUPqGoYGfiw7x//HZn4lqI9tjl2hnq4DZAFvzKWGlcAp
	S6RTqE+F/61kERFYrr0LCNs=
X-Google-Smtp-Source: AK7set8AD38+i11dYanB4qCBbmNUzfei9aCNLyXLYPG8CRg4osCls4SV6Aq39hM7qRY/j3bqRVDkuA==
X-Received: by 2002:a05:622a:180e:b0:3bf:bb1f:3c2b with SMTP id t14-20020a05622a180e00b003bfbb1f3c2bmr198499qtc.6.1679335664447;
        Mon, 20 Mar 2023 11:07:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id n3-20020a37bd03000000b007456b2759efsm7789701qkf.28.2023.03.20.11.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 11:07:43 -0700 (PDT)
Message-ID: <b7057b51-540f-54a5-aba2-8f44da832289@gmail.com>
Date: Mon, 20 Mar 2023 11:07:30 -0700
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: rtc: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230317233634.3968656-1-robh@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230317233634.3968656-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/17/23 16:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../devicetree/bindings/rtc/allwinner,sun4i-a10-rtc.yaml      | 2 +-
>   .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 2 +-
>   .../devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml         | 2 +-
>   .../devicetree/bindings/rtc/atmel,at91sam9260-rtt.yaml        | 2 +-
>   .../devicetree/bindings/rtc/brcm,brcmstb-waketimer.yaml       | 2 +-

Acked-by: Florian Fainelli <f.fainelli@gmail.com> 
#brcm,brcmstb-waketimer.yaml
-- 
Florian

