Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9B63D82
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Apr 2022 21:09:01 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-d6ca46da48so18682fac.12
        for <linux-sunxi@lists.linux.dev>; Tue, 12 Apr 2022 14:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cJkmHfdBxf221GLO6Rp2mXWctk7aSf4CdfI04IRAEBI=;
        b=LzmqurT9xmVYyuKriqWuZyLrPkz69q40l+JDV3Khru9re0DgI0XTWFB5CcVQJYcnIu
         COkYqAgLX7zSBPptsoM4T21f7qc94dIXXJGFrF/aH8chOkiksL0e4+bB6vGd+4FmzVEj
         vivieOcCn/S8VomcwEu0HsERTCkIjS8E9IiKYMWLyxSYvKU+XBS3YH64EgMtTvYhhLqC
         X9PXrWR+kWymIY7ijydg2s8GWDuwUL4XwI2wyCNN2nHQ05fSDYZr8FEsQf4vFjKiKjNG
         ArzpQEHxYixbJBzxZxKfpJ17ucIY8K7ytglzn966//DkcM5P9ZMdj1LIYn2FD/euCBSd
         tvvg==
X-Gm-Message-State: AOAM532cF6x4A33TyWpqJcKK4BynQlnxfGrD7OgIImN+PlIm+XGBcmUq
	5Sq0UKZc2sSv6sIC+l/vUQ==
X-Google-Smtp-Source: ABdhPJxzHVBv05OKxWV0sTv8Hm3nF460ieQSkUefeU8+7dcceq2HdX1Y1OEyRNmYiktpO+V5nGy4WA==
X-Received: by 2002:a05:6870:4290:b0:e2:b4c9:ea5a with SMTP id y16-20020a056870429000b000e2b4c9ea5amr2900806oah.173.1649797740517;
        Tue, 12 Apr 2022 14:09:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d1-20020a056830138100b005cf2f29d89csm13533691otq.77.2022.04.12.14.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 14:09:00 -0700 (PDT)
Received: (nullmailer pid 946357 invoked by uid 1000);
	Tue, 12 Apr 2022 21:08:59 -0000
Date: Tue, 12 Apr 2022 16:08:59 -0500
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 02/14] dt-bindings: display: Add D1 display engine
 compatibles
Message-ID: <YlXqa5YH7ckHCf1m@robh.at.kernel.org>
References: <20220412042807.47519-1-samuel@sholland.org>
 <20220412042807.47519-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412042807.47519-3-samuel@sholland.org>

On Mon, Apr 11, 2022 at 11:27:54PM -0500, Samuel Holland wrote:
> Allwinner D1 contains a display engine 2.0. It features two mixers, a
> TCON TOP (with DSI and HDMI), one TCON LCD, and one TCON TV.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> (no changes since v1)
> 
>  .../allwinner,sun4i-a10-display-engine.yaml   |  1 +
>  .../display/allwinner,sun4i-a10-tcon.yaml     |  2 ++
>  .../allwinner,sun8i-a83t-de2-mixer.yaml       |  2 ++
>  .../display/allwinner,sun8i-r40-tcon-top.yaml | 34 +++++++++++++++++++
>  4 files changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
> index d4412aea7b73..c388ae5da1e4 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
> @@ -62,6 +62,7 @@ properties:
>        - allwinner,sun8i-r40-display-engine
>        - allwinner,sun8i-v3s-display-engine
>        - allwinner,sun9i-a80-display-engine
> +      - allwinner,sun20i-d1-display-engine
>        - allwinner,sun50i-a64-display-engine
>        - allwinner,sun50i-h6-display-engine
>  
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> index 3a7d5d731712..4a92a4c7dcd7 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> @@ -33,6 +33,8 @@ properties:
>        - const: allwinner,sun8i-v3s-tcon
>        - const: allwinner,sun9i-a80-tcon-lcd
>        - const: allwinner,sun9i-a80-tcon-tv
> +      - const: allwinner,sun20i-d1-tcon-lcd
> +      - const: allwinner,sun20i-d1-tcon-tv
>  
>        - items:
>            - enum:
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> index 4f91eec26de9..cb243bc58ef7 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> @@ -19,6 +19,8 @@ properties:
>        - allwinner,sun8i-r40-de2-mixer-0
>        - allwinner,sun8i-r40-de2-mixer-1
>        - allwinner,sun8i-v3s-de2-mixer
> +      - allwinner,sun20i-d1-de2-mixer-0
> +      - allwinner,sun20i-d1-de2-mixer-1
>        - allwinner,sun50i-a64-de2-mixer-0
>        - allwinner,sun50i-a64-de2-mixer-1
>        - allwinner,sun50i-h6-de3-mixer-0
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
> index 784b267635fb..cc32e2faed91 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
> @@ -41,6 +41,7 @@ properties:
>    compatible:
>      enum:
>        - allwinner,sun8i-r40-tcon-top
> +      - allwinner,sun20i-d1-tcon-top
>        - allwinner,sun50i-h6-tcon-top
>  
>    reg:
> @@ -154,6 +155,39 @@ allOf:
>              - port@2
>              - port@3
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: allwinner,sun20i-d1-tcon-top
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +          maxItems: 4

You shouldn't need minItems and maxItems here and the next 2 cases.

> +          items:
> +            - description: The TCON TOP interface clock
> +            - description: The TCON TOP TV0 clock
> +            - description: The TCON TOP TVE0 clock
> +            - description: The TCON TOP MIPI DSI clock
> +
> +        clock-names:
> +          minItems: 4
> +          maxItems: 4
> +          items:
> +            - const: bus
> +            - const: tcon-tv0
> +            - const: tve0
> +            - const: dsi
> +
> +        clock-output-names:
> +          minItems: 2
> +          maxItems: 2
> +          items:
> +            - description: TCON TV0 output clock name
> +            - description: DSI output clock name
> +
>    - if:
>        properties:
>          compatible:
> -- 
> 2.35.1
> 
> 
