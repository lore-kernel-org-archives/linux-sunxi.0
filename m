Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610F57F
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Jun 2022 10:43:17 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id a2so21519540lfg.5
        for <linux-sunxi@lists.linux.dev>; Tue, 07 Jun 2022 03:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8XdRg5mTQzw6nhVkPbcttepeHu1kmSLwBbs3fva93xc=;
        b=N1DSIYQ2tUBiiR928h/wpbuAkWoyNemmJ20vBlcsKVQyNN84AnPudb55G8X5EEHZc5
         VrfLCbnWDAtsrhHYhabH4L0BcK6Yj8HILDRD4QS8o9jivIkV09uQ9k8+flwSL9YhpfOf
         EKIY6RpNWcq9H5P5HOecjEdKbfbUTACnthsEE+FVdO9ZPFQkU20CO5hbDY+TsXwi7Gyk
         XR89OVy0Qnt+8Lqc8HgO4+mf7B2XbeP3Iw4IkdQhRpmxypzV+y4NmZjw14ztQ0cTRyjV
         Vc9XiSpbooXYnaIEGWYbXJ0j+c6+AycmpTWR911QhQRT0pklscDEgFFUW/dz8ZLGdIVr
         VVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8XdRg5mTQzw6nhVkPbcttepeHu1kmSLwBbs3fva93xc=;
        b=EXezC4TDT2xSNwCmeP+wy/60Dc54D2UVUe6TXkhdtkYhb5YTyX7YikBw2vo2ggpu84
         ToCDs7rZ1BUraft3IzzG0zq7VB3nCfdncbZJ1EOm5kkVh2JtfOr5tWltR7yF38hC0owb
         YC1CC+bYIb67CIFOhidaxRdyiZ4oYB0uEEaGKPxye6eXWIvMKJSTC9ms7wksrczEWyuf
         menKaVEopa5i4TyjTDz6nS9H6hZwi997wR9VVNJdSnrJchvlIR947P25LPugUmpvFCfT
         26fWs+ttC10CdVQre+5mhrejUga3wD7++8EFbMFAII8g+bPPTLqFoCCiwq4FyGrB7H7n
         aCUw==
X-Gm-Message-State: AOAM530O1xKCzsBlOSKwgLN/IospIB115yZDdwyZigjMpLwzqGOHrdrc
	ldXtxDlUk9wL7fAPJLFU639dotU9FG92exBCon4u5w==
X-Google-Smtp-Source: ABdhPJzxvjAZjQF6R+Mrr94IoW1X7wi8uwFKBgPf5GLnc+Gvu4doMpfp0SK0kukM6bfhDVOV0zyEW3g+vrtCParwkeY=
X-Received: by 2002:a05:6512:403:b0:479:1627:a9b7 with SMTP id
 u3-20020a056512040300b004791627a9b7mr15634227lfk.233.1654598595349; Tue, 07
 Jun 2022 03:43:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220606225137.1536010-1-robh@kernel.org>
In-Reply-To: <20220606225137.1536010-1-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 7 Jun 2022 12:42:38 +0200
Message-ID: <CAPDyKFqNiJB_2aEaQpBo4=Vzc60-986=aKKw4JZtXvO=X9WTqQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop more redundant 'maxItems/minItems' in
 if/then schemas
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Hu Ziji <huziji@marvell.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jun 2022 at 00:51, Rob Herring <robh@kernel.org> wrote:
>
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

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  .../bindings/memory-controllers/nvidia,tegra186-mc.yaml        | 3 ---
>  Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.yaml | 1 -
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml  | 1 -
>  3 files changed, 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> index c7cfa6c2cd81..935d63d181d9 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> @@ -150,7 +150,6 @@ allOf:
>            description: 5 memory controller channels and 1 for stream-id registers
>
>          reg-names:
> -          maxItems: 6
>            items:
>              - const: sid
>              - const: broadcast
> @@ -170,7 +169,6 @@ allOf:
>            description: 17 memory controller channels and 1 for stream-id registers
>
>          reg-names:
> -          minItems: 18
>            items:
>              - const: sid
>              - const: broadcast
> @@ -202,7 +200,6 @@ allOf:
>            description: 17 memory controller channels and 1 for stream-id registers
>
>          reg-names:
> -          minItems: 18
>            items:
>              - const: sid
>              - const: broadcast
> diff --git a/Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.yaml b/Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.yaml
> index c79639e9027e..7a2b22dd6d05 100644
> --- a/Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.yaml
> +++ b/Documentation/devicetree/bindings/mmc/marvell,xenon-sdhci.yaml
> @@ -145,7 +145,6 @@ allOf:
>            items:
>              - description: Xenon IP registers
>              - description: Armada 3700 SoC PHY PAD Voltage Control register
> -          minItems: 2
>
>          marvell,pad-type:
>            $ref: /schemas/types.yaml#/definitions/string
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index cbcf19f51411..ed6c1ca80dcc 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -64,7 +64,6 @@ if:
>  then:
>    properties:
>      clocks:
> -      minItems: 2
>        items:
>          - description: High-frequency oscillator input, divided internally
>          - description: Low-frequency oscillator input
> --
> 2.34.1
>
