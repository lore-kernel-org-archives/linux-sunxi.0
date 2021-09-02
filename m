Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84A72FAE
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Sep 2021 15:27:56 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id c19-20020a9d6153000000b0051829acbfc7so2955645otk.9
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Sep 2021 08:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bqpAdctft+FNwBQ21zVwpW5d55hAXSJQXRl03yYe76s=;
        b=OHYtJt0JtKYzWIBO1X5VNdwyhtZ7t+ilQMGZmVkAthvo1UjOCHdTdbwQ7/hVz7l7Ox
         hfUg48ks5BuHCmThrM3RYuVehYmY7JBAezO7SrGupSOBLQrAvTp37rf5vS4niLga/4br
         nlVeq0c/dE56R0l9LsiaRtCJEPObpIO2NX53ZKWbI7DxTQkg/YzPU2JUw1B1m/gdWk7z
         fMlytGmKJlDOtjamQG32k/jnmB+otJkjiwMEQ0bVsKaZK9Q7y2zhts33Oiz/ZM5hOGc8
         XRI3Z4ILJF5jNTYY0XX+KdnsCF27LlFkoWTQRRqZAUuEs72PxdoIlnPybfCWluJ0M8av
         nbtw==
X-Gm-Message-State: AOAM5331wspoig1vitvOspzQWBGG6ui3e72vJEVJ+prOcGyjL0Vtkttr
	+hJ7f3vvbKzdDpU9Q6c4TA==
X-Google-Smtp-Source: ABdhPJzEwGyey7HM+GJpRspaIwtYhFX2S77YtjWMNY2eHNOIzFXRViC3QKyJRTICTcJ3y3YNpyYroQ==
X-Received: by 2002:a9d:798c:: with SMTP id h12mr3067596otm.215.1630596476006;
        Thu, 02 Sep 2021 08:27:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id c7sm391314otl.30.2021.09.02.08.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 08:27:55 -0700 (PDT)
Received: (nullmailer pid 950168 invoked by uid 1000);
	Thu, 02 Sep 2021 15:27:54 -0000
Date: Thu, 2 Sep 2021 10:27:54 -0500
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/7] dt-bindings: rtc: sun6i: Add H616 and R329
 compatibles
Message-ID: <YTDtelCx5If3J5cM@robh.at.kernel.org>
References: <20210901053951.60952-1-samuel@sholland.org>
 <20210901053951.60952-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901053951.60952-2-samuel@sholland.org>

On Wed, Sep 01, 2021 at 12:39:45AM -0500, Samuel Holland wrote:
> For these new SoCs, start requiring a complete list of input clocks.
> 
> For H616, this means bus, hosc, and pll-32k. For R329, this means ahb,
> bus, and hosc; and optionally ext-osc32k.
> 
> I'm not sure how to best represent this in the binding...
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 55 +++++++++++++++++--
>  include/dt-bindings/clock/sun50i-rtc.h        | 12 ++++
>  2 files changed, 61 insertions(+), 6 deletions(-)
>  create mode 100644 include/dt-bindings/clock/sun50i-rtc.h
> 
> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> index beeb90e55727..3e085db1294f 100644
> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> @@ -26,6 +26,8 @@ properties:
>            - const: allwinner,sun50i-a64-rtc
>            - const: allwinner,sun8i-h3-rtc
>        - const: allwinner,sun50i-h6-rtc
> +      - const: allwinner,sun50i-h616-rtc
> +      - const: allwinner,sun50i-r329-rtc

Can you please make all the single entry cases a single 'enum'.

>  
>    reg:
>      maxItems: 1
> @@ -37,7 +39,24 @@ properties:
>        - description: RTC Alarm 1
>  
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 4
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      - anyOf:

This says the first entry is any of these. What about the rest of them?

> +          - const: ahb
> +            description: AHB parent for SPI bus clock

The description should go in 'clocks'. The order should be defined as 
well with the first clock being the one that existed previously.

> +          - const: bus
> +            description: AHB/APB bus clock for register access
> +          - const: ext-osc32k
> +            description: External 32768 Hz oscillator input
> +          - const: hosc
> +            description: 24 MHz oscillator input
> +          - const: pll-32k
> +            description: 32 kHz clock divided from a PLL
>  
>    clock-output-names:
>      minItems: 1
> @@ -85,6 +104,9 @@ allOf:
>              enum:
>                - allwinner,sun8i-h3-rtc
>                - allwinner,sun50i-h5-rtc
> +              - allwinner,sun50i-h6-rtc
> +              - allwinner,sun50i-h616-rtc
> +              - allwinner,sun50i-r329-rtc
>  
>      then:
>        properties:
> @@ -96,13 +118,35 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: allwinner,sun50i-h6-rtc
> +            enum:
> +              - allwinner,sun50i-h616-rtc
> +              - allwinner,sun50i-r329-rtc
>  
>      then:
> +      clocks:
> +        minItems: 3 # bus, hosc, and (pll-32k [H616] or ahb [R329])
> +
> +      clock-names:
> +        minItems: 3
> +
> +      required:
> +        - clock-names
> +
> +    else:
> +      required:
> +        - clock-output-names
> +
> +  - if:
> +      properties: clock-names
> +
> +    then:
> +      required:
> +        - clocks # hosc is required
> +
> +    else:
>        properties:
> -        clock-output-names:
> -          minItems: 3
> -          maxItems: 3
> +        clocks:
> +          maxItems: 1 # only ext-osc32k is allowed
>  
>    - if:
>        properties:
> @@ -127,7 +171,6 @@ required:
>    - compatible
>    - reg
>    - interrupts
> -  - clock-output-names
>  
>  additionalProperties: false
>  
> diff --git a/include/dt-bindings/clock/sun50i-rtc.h b/include/dt-bindings/clock/sun50i-rtc.h
> new file mode 100644
> index 000000000000..d45e3ff4e105
> --- /dev/null
> +++ b/include/dt-bindings/clock/sun50i-rtc.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Dual license please.

> +
> +#ifndef _DT_BINDINGS_CLK_SUN50I_RTC_CCU_H_
> +#define _DT_BINDINGS_CLK_SUN50I_RTC_CCU_H_
> +
> +#define CLK_OSC32K		0
> +#define CLK_OSC32K_FANOUT	1
> +#define CLK_IOSC		2
> +
> +#define CLK_RTC_SPI		8
> +
> +#endif /* _DT_BINDINGS_CLK_SUN50I_RTC_CCU_H_ */
> -- 
> 2.31.1
> 
> 
