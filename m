Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4CE7F
	for <linux-sunxi@lists.linux.dev>; Tue, 26 Sep 2023 04:06:29 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c012232792so133345131fa.0
        for <linux-sunxi@lists.linux.dev>; Mon, 25 Sep 2023 21:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695701188; x=1696305988; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGB+hW8EcgpXNNSjmf7fJ24sLwC+iJpETWg7Drt2OpU=;
        b=iDrksFTvUNxrblSslYni+hvTbz3GEsdlNE4CwFS3SOhY5eKXwJxXAE24ESQNNMZ/6X
         9xBPuo3U+07Eod04AAYheVUWJjjFNqnbIP3hVE2eVZkW+bcEUSqFOkk7rkUtLlmGvQd7
         qqtRcY+o7JtVTkBKb5YcQNnlZGT2989PCZ3f6CSLw9Hq4ea2Ck1uQsyHxJkMOjoUL0PN
         z/0XnNgJ0v3c9yHReL8f7SKM3hqObIAQsApnMMMi0XuWSUl8f7k4WWePs9hUpdxtY/z5
         K9/KxMWXVk6v4fSlJer6xMvHheAB3bh2wL0ZtPiSrrkewn7mHYMqZkNdcdI2KmqH82aY
         k9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695701188; x=1696305988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGB+hW8EcgpXNNSjmf7fJ24sLwC+iJpETWg7Drt2OpU=;
        b=uzhN/+aC6Nb/rBNpkKrDPIFOacLShsCHCrilr0833i7KkqsoKSFej2xvXLq46BOBYo
         O9Tv+usNkb1ZkTB3P2CiOG7l0lvxnfbB3xaR5HfaE7esoeNFIJeaKOEYcBO7QYq+Aylv
         J4FXW4MjxpkrU5IFTqtpmxGkJz8AedCNFereOtk7ZyFqQruy8Ty35Gcf82bWW6UPXjXE
         uE9HKQdWupuc89taIwQCI96URkTUonk03vveXjaC8kw/cM1OlMn9kSTcYhKaiIKRjwwA
         vjvCXJcx4amFTmiGknBXOZLskOH5oSbXxY8y0YBSQgWEfRIGFKpEVllqyU5KL4kBBKg9
         jhpQ==
X-Gm-Message-State: AOJu0YwV/UoyXIcZ+p4IKNkKbOcBbjfhR+gX+UagndjCWgciT0JUlpzj
	gn9edCklaXvplASoKuDIJPw=
X-Google-Smtp-Source: AGHT+IFnZUohBRjAdg6nVKhBrCjO2Fo24nnQvaYhhpnODnccZ+1NZtjpOOBB8jCfNGJgy9YzuEpoYA==
X-Received: by 2002:a05:651c:118:b0:2bc:d94f:ad04 with SMTP id a24-20020a05651c011800b002bcd94fad04mr6668385ljb.13.1695701187599;
        Mon, 25 Sep 2023 21:06:27 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id h1-20020a1709063c0100b0099bc038eb2bsm7137424ejg.58.2023.09.25.21.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 21:06:26 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>,
 Serge Semin <fancer.lancer@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>, Rob Herring <robh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject:
 Re: [PATCH] spi: dt-bindings: Make "additionalProperties: true" explicit
Date: Tue, 26 Sep 2023 06:06:25 +0200
Message-ID: <2783820.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230925212614.1974243-1-robh@kernel.org>
References: <20230925212614.1974243-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 25. september 2023 ob 23:26:00 CEST je Rob Herring napisal(a):
> Make it explicit that child nodes have additional properties and the
> child node schema is not complete. The complete schemas are applied
> separately based the compatible strings.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml        | 2 ++
>  .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml        | 2 ++

For Allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml | 1 +
>  Documentation/devicetree/bindings/spi/rockchip-sfc.yaml         | 2 ++
>  Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml      | 2 ++
>  5 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml
> index a6f34bdd1d3c..e1ab3f523ad6 100644
> --- a/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml
> @@ -46,6 +46,8 @@ properties:
>  patternProperties:
>    "^.*@[0-9a-f]+":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        reg:
>          items:
> diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> index 28b8ace63044..3b47b68b92cb 100644
> --- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
> @@ -68,6 +68,8 @@ properties:
>  patternProperties:
>    "^.*@[0-9a-f]+":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        reg:
>          items:
> diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
> index 9ae1611175f2..48e97e240265 100644
> --- a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
> +++ b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
> @@ -50,6 +50,7 @@ properties:
>  patternProperties:
>    "@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
>  
>      properties:
>        spi-rx-bus-width:
> diff --git a/Documentation/devicetree/bindings/spi/rockchip-sfc.yaml b/Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
> index 339fb39529f3..ac1503de0478 100644
> --- a/Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
> +++ b/Documentation/devicetree/bindings/spi/rockchip-sfc.yaml
> @@ -47,6 +47,8 @@ properties:
>  patternProperties:
>    "^flash@[0-3]$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        reg:
>          minimum: 0
> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> index a47cb144b09f..6348a387a21c 100644
> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -160,6 +160,8 @@ properties:
>  patternProperties:
>    "^.*@[0-9a-f]+$":
>      type: object
> +    additionalProperties: true
> +
>      properties:
>        reg:
>          minimum: 0
> 




