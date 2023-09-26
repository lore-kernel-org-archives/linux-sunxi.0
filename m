Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05A0107B9
	for <linux-sunxi@lists.linux.dev>; Tue, 26 Sep 2023 08:59:33 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so136236761fa.2
        for <linux-sunxi@lists.linux.dev>; Tue, 26 Sep 2023 01:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695718772; x=1696323572; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RDxyIanx1EgUP6RwXNa3/gfvrl1yPz037Py9AOoQmr8=;
        b=ZGCdIoGunxJZJX+jGW0Yt7Pvrhfp0ReiZh85C1MXfH08Kiefv5KAzxmsAtBdOe+VGT
         f1nq36emaLf0m4hWqW0lO83Oj1jUfyNuPUvyBgGLWmVxbeITBdlxDuwvrO09oNPKKp7X
         bZrNQ22oqN95b64CwyW7jDgqHxF1UCJ0j8oj+yhPxHYVd6tHgIUJMoHXTuT7n252gts6
         Y16iZYYjMVeDgypULG5GuKg+JQoglmlCw1AqrkggKI2iYMUyZ6nC3bL9dMdEF3eTzEnm
         2ySChwV+y+7N6umEjj2sI6eBDSCrj0ZrQnu4LxdarI6JC7T6uff5QNmfJ39EnIz6/0FW
         XI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695718772; x=1696323572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDxyIanx1EgUP6RwXNa3/gfvrl1yPz037Py9AOoQmr8=;
        b=HeNKwmSwmpjKpkAGQwlwtNsMkw64X9nntRmOjoUhP19arV5SIyZRqH1rlMtfXC48jK
         rA4pHB2L2ioGkUVVrAC2RZn/E2SmKHMvAvuTCRzQfLOOJVVb6+kkHFx+fK7YRAQuoesn
         Q5alaTIUae/Yn1cLgwEki0Wgs8eROmiN0z1JrLqXiv2yiAfk1r1UPLBzBcYYpY7JqOnS
         1VvuN38Te+ChxNYpvynnMWLbSDom7IskYb0xhyNhThXFzRB1ILmi13zr0QGqMZcWW/9H
         WQawAxeHamps2niiTPLIf1yhfhq+F1mxWUC71NqNTtYiVzaZ/1jU6homITAUcCCrIYUR
         KbcQ==
X-Gm-Message-State: AOJu0Yy7i4QQgIv+TRw4QADN3gNJsroOdasBu9d9B042RhYpfo8ghqNG
	HVXG6MdddPRn2tjcAq1QTI8=
X-Google-Smtp-Source: AGHT+IFcY99Qsw63+nqFSyAl4/ZRgH21dvMnWnaxUZA3NccBZXaLNtFD9rYkablw31Fpuvzev55HJA==
X-Received: by 2002:a2e:964d:0:b0:2bf:f9b3:d335 with SMTP id z13-20020a2e964d000000b002bff9b3d335mr7914172ljh.15.1695718771564;
        Tue, 26 Sep 2023 01:59:31 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id t6-20020a2e9c46000000b002bcda31af28sm2552580ljj.42.2023.09.26.01.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 01:59:31 -0700 (PDT)
Date: Tue, 26 Sep 2023 11:59:28 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <mripard@kernel.org>, 
	Chris Morgan <macromorgan@hotmail.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] spi: dt-bindings: Make "additionalProperties: true"
 explicit
Message-ID: <666tt3bztep2zapk7o7h2psx32z53leitd4sm6xicxlhxhf4pv@vm6e32xszxq2>
References: <20230925212614.1974243-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925212614.1974243-1-robh@kernel.org>

On Mon, Sep 25, 2023 at 04:26:00PM -0500, Rob Herring wrote:
> Make it explicit that child nodes have additional properties and the
> child node schema is not complete. The complete schemas are applied
> separately based the compatible strings.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

For the DW APB/AHB SSI bindings:
Acked-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  .../devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml        | 2 ++
>  .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml        | 2 ++
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
> -- 
> 2.40.1
> 
