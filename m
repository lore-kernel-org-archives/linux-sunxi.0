Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466D57C
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Jun 2022 12:41:36 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id h15-20020a9d600f000000b0060c02d737ecso2466842otj.1
        for <linux-sunxi@lists.linux.dev>; Tue, 07 Jun 2022 05:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Jqn5ENcnbUU/0+opNYmJQjgSQeuwZaQtQYaCaEQBiPI=;
        b=EfBNNu/iYNWZEw+b59EZt7f23G4b1uF2NCtoCOBprSRTS+oZIgAnvJq1pd3C5/P8QQ
         gcwmFmsvjMHKgGozGa6PghxD9u2bzm8Ub8MtJjwr2/8qkvB9CYbua5fXn0cPexgVavHr
         o2x6TgDk3XSqnbaQJpVADuvDimRSwG0ReMgtOUO6OwGK+VrDovhXWxvZXTLfz8+UoETf
         LWq074HO4nPPq0poPtAtyYBxfMGycUbS0rHEyfIOsqmzWJ50Tia99pZ4i/yxAfdqJ/8q
         8mNUQK6mxgxLirn1LpTyDd70tmW/wiz0VMrGVT0CZTl4RS/pmWz1Zc9YblQwPeQddvDp
         v3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Jqn5ENcnbUU/0+opNYmJQjgSQeuwZaQtQYaCaEQBiPI=;
        b=FsIpX8ISRwR2z0h7bWuh1U63RVKnY5VJb9vL7Ja+54JztwPS88MPqOPz+fKxa8ja+b
         nfqBsjIvG3WlM5YC0uMxpRxxzOi2sJDaAG6uyhJMjJuqh+Svf/VvFcyvP0Ekr1E3bt/I
         PNuUoGpmbY3YKB9TS8Oxgv6AiGQ1gwjQo/Bn81kRDzPup/s3Ta3SQypQPAlOenvmd7go
         EysYRFYjf7F1FY3ji9Cdw6kV3pJyHH9Bc8KYIKhSzn+Of6THaKKNWLyInJqi/6B8PVNn
         x6RCxWuCon134iwOc+Sc8NLD3zeBnoZjdVrK/AFXTNlIh9uidf01uV4zyYGXCjBmcQ+F
         VqeQ==
X-Gm-Message-State: AOAM530nLeWqIlaAIeKKrKqhLGz6r5qg01Reah1Lgc6dinP58s3LzKLX
	LLax5pyt6LMMUHdDsFGmBWU=
X-Google-Smtp-Source: ABdhPJyytTlsX8ZhKcQU08iE3UDQqgHYhIS1DZZphg+BE++3QrOjnl/yK7mT1LqXhi8fXU6f9NDzFw==
X-Received: by 2002:a9d:6081:0:b0:60b:c8f7:272e with SMTP id m1-20020a9d6081000000b0060bc8f7272emr10907645otj.11.1654605695311;
        Tue, 07 Jun 2022 05:41:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t11-20020a9d728b000000b0060b66b6641fsm8980343otj.5.2022.06.07.05.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 05:41:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <216b6e68-df86-4117-8519-01b7f1bf199b@roeck-us.net>
Date: Tue, 7 Jun 2022 05:41:32 -0700
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dt-bindings: Drop more redundant 'maxItems/minItems' in
 if/then schemas
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Hu Ziji <huziji@marvell.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20220606225137.1536010-1-robh@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220606225137.1536010-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/6/22 15:51, Rob Herring wrote:
> Another round from new cases in 5.19-rc of removing redundant
> minItems/maxItems when 'items' list is specified. This time it is in
> if/then schemas as the meta-schema was failing to check this case.
> 
> If a property has an 'items' list, then a 'minItems' or 'maxItems' with the
> same size as the list is redundant and can be dropped. Note that is DT
> schema specific behavior and not standard json-schema behavior. The tooling
> will fixup the final schema adding any unspecified minItems/maxItems.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../bindings/memory-controllers/nvidia,tegra186-mc.yaml        | 3 ---
>   Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.yaml | 1 -
>   .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml  | 1 -

Acked-by: Guenter Roeck <linux@roeck-us.net>

>   3 files changed, 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> index c7cfa6c2cd81..935d63d181d9 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> @@ -150,7 +150,6 @@ allOf:
>             description: 5 memory controller channels and 1 for stream-id registers
>   
>           reg-names:
> -          maxItems: 6
>             items:
>               - const: sid
>               - const: broadcast
> @@ -170,7 +169,6 @@ allOf:
>             description: 17 memory controller channels and 1 for stream-id registers
>   
>           reg-names:
> -          minItems: 18
>             items:
>               - const: sid
>               - const: broadcast
> @@ -202,7 +200,6 @@ allOf:
>             description: 17 memory controller channels and 1 for stream-id registers
>   
>           reg-names:
> -          minItems: 18
>             items:
>               - const: sid
>               - const: broadcast
> diff --git a/Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.yaml b/Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.yaml
> index c79639e9027e..7a2b22dd6d05 100644
> --- a/Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.yaml
> @@ -145,7 +145,6 @@ allOf:
>             items:
>               - description: Xenon IP registers
>               - description: Armada 3700 SoC PHY PAD Voltage Control register
> -          minItems: 2
>   
>           marvell,pad-type:
>             $ref: /schemas/types.yaml#/definitions/string
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index cbcf19f51411..ed6c1ca80dcc 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -64,7 +64,6 @@ if:
>   then:
>     properties:
>       clocks:
> -      minItems: 2
>         items:
>           - description: High-frequency oscillator input, divided internally
>           - description: Low-frequency oscillator input

