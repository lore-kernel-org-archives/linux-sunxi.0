Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0931A632
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Nov 2022 05:08:49 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id q96-20020a17090a1b6900b00218b8f9035cso1069812pjq.5
        for <linux-sunxi@lists.linux.dev>; Sun, 20 Nov 2022 21:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oM4t9dSTJRNYdl1z0tkjCktIi2YLG2NdBqaOTxJOnfw=;
        b=LWtOZYu4jsTpQIJaiOHNEV7J1U5Hekz/2o745TGAHoP4cneloLCtSQcf2+7QCorM2v
         /xUrXy8tc3AyizxEql9WLY1OdpX3pQbIVxJtcFYql5RA3M4NDSaLMbPVj5dbObnT+KSU
         mczGTwZmAOwUux/wZ8ifvi0F01VtKfJ2/n71J43DQXUfTPipabpUdKiLGhjOMu1er+fR
         qpGgEsviAEicpqjzPwJSF+kZar5OCuUon7HJXQSuacsEE6kvxwtPpgVtTm/A/sLEJVHN
         qxeu2eQb8ByOQLwRwijUs3sPFsoh7Q/NUQWZepaz/G6oM8gj5IAM41nqgSYfzxRnFHnj
         8Fkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oM4t9dSTJRNYdl1z0tkjCktIi2YLG2NdBqaOTxJOnfw=;
        b=fwbXVTpAYvCH1BhFzly/WwjKE6CdduVi8V53GjzRYMi6Oam7APlze9kc9SITl9KJnh
         uS3MFdy8NkqcQootRG6ZIFcyIK+wMcYKU1g8Q3cFosKkMSM5hQ/qhyck9Np2lZwTCLoP
         q4hDm+2oEcAIzKLvvEPpOQTfEIQXByM9gpqh/vFlgOyx6oaXJHDrW4elcmz860XehPuS
         NX61WZINx71HmXD2Su8GyaUb8ZLcLdc2XWfWVP40HlD+UNLk2Xz18MlI3C+FVCz3Jpc9
         0H+jKWCm0V26WKvX5haIvMYlff7T57dWLDJSMUl/wpGpC3bKpr0UFXOWtqP1E0GRA/1D
         L3LQ==
X-Gm-Message-State: ANoB5pktOJmIfPZc3PMogYNwPr8VeO2rCyymCXd7VP6jjCD8b7ylyVRi
	IjTEzUm013s/5bEbGyp6U0jpPg==
X-Google-Smtp-Source: AA0mqf7JM7TMYC6I8OTgp5yVOi9dOvfTXAD2akuhU7ByBbq+4L3OQY/x8/g9Bql+etELz/ggxI+lHw==
X-Received: by 2002:a17:90a:b706:b0:212:e75b:1602 with SMTP id l6-20020a17090ab70600b00212e75b1602mr18701960pjr.139.1669007329319;
        Sun, 20 Nov 2022 21:08:49 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id z7-20020aa79f87000000b005625d5ae760sm7895356pfr.11.2022.11.20.21.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 21:08:48 -0800 (PST)
Date: Mon, 21 Nov 2022 10:38:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Ilia Lin <ilia.lin@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Yangtao Li <tiny.windzz@gmail.com>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Javier Martinez Canillas <javier@dowhile0.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Maxime Ripard <mripard@kernel.org>, Daniel Mack <zonque@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Add missing start and/or end of line regex
 anchors
Message-ID: <20221121050846.m7w52iygltb5xivt@vireshk-i7>
References: <20221118223728.1721589-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118223728.1721589-1-robh@kernel.org>

On 18-11-22, 16:37, Rob Herring wrote:
> json-schema patterns by default will match anywhere in a string, so
> typically we want at least the start or end anchored. Fix the obvious
> cases where the anchors were forgotten.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml       | 2 +-
>  Documentation/devicetree/bindings/hwmon/adt7475.yaml          | 4 ++--
>  .../bindings/opp/allwinner,sun50i-h6-operating-points.yaml    | 4 ++--
>  .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 2 +-
>  .../devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml        | 2 +-
>  Documentation/devicetree/bindings/regulator/max8660.yaml      | 2 +-
>  .../devicetree/bindings/regulator/maxim,max77802.yaml         | 2 +-
>  Documentation/devicetree/bindings/regulator/regulator.yaml    | 2 +-
>  .../devicetree/bindings/regulator/rohm,bd9576-regulator.yaml  | 2 +-
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml     | 2 +-
>  .../devicetree/bindings/spi/nvidia,tegra210-quad.yaml         | 2 +-
>  11 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> index a11e1b867379..3c00ad09eeaa 100644
> --- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> @@ -38,7 +38,7 @@ properties:
>      type: object
>  
>      patternProperties:
> -      'cpu@[0-9a-f]+':
> +      '^cpu@[0-9a-f]+$':
>          type: object
>  
>          properties:

> diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> index 385b0692261c..51f62c3ae194 100644
> --- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> +++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> @@ -41,7 +41,7 @@ required:
>    - nvmem-cells
>  
>  patternProperties:
> -  "opp-[0-9]+":
> +  "^opp-[0-9]+$":
>      type: object
>  
>      properties:
> @@ -49,7 +49,7 @@ patternProperties:
>        clock-latency-ns: true
>  
>      patternProperties:
> -      "opp-microvolt-.*": true
> +      "^opp-microvolt-speed[0-9]$": true
>  
>      required:
>        - opp-hz

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
