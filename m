Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBB115481
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Dec 2023 07:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iHMl1QnL"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3333b46f26aso2563692f8f.1
        for <linux-sunxi@lists.linux.dev>; Mon, 04 Dec 2023 23:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701760213; x=1702365013; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SVAEj6IWcf3rrewE0PI9IiD451dQSPUt4SomApm71zI=;
        b=iHMl1QnLADpwRqEHAmNDdvuwDWfIFhVogTdPGD6CgLBprCiuCdv6DepmKIojR2JY7d
         cBp3IitpoOaVLr6c4ERVK9j9cU30/MQj/ZIVAVnEPksx3xQObMgbgk2q+YOHfnlgdQWc
         McKW31DWVHuNm/KN+3Ca34Z63IMcoQ6GQ94uWVfdh3tjCf0Olv/KJHUgOhQEG8c/XDnT
         xnYYRTr5UkTLpjHWa2EvJk+WYN1V0RMB3qanAfXxFFIL6KW3o0e4EA5wFJc6rp2oYrFO
         jhqyJkE/km/N3aFfS52GXfgSxhxO9eXv1+slVHOnFRQ3skzZ36suEcNi3de2ZyMf7NDs
         L7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701760213; x=1702365013;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SVAEj6IWcf3rrewE0PI9IiD451dQSPUt4SomApm71zI=;
        b=UPUf0LWrkcZWejnA5/poWC7J6qmhPWeacgQjQmVqtvBLKcAfNqZqhWWQ6PDxIYMBx0
         hWjwLK57OvW0nM6V7MlcCW9fLm6dru5X8ekVZYdDGkl5gCV7DgxrYrK302HvH+bKTJGn
         SukIX5w5UIad6F2gVGeqipxGjS8xssFhfjkpIXZ3uHKqY7yRgh82w83nE6pFyZ1Ock6/
         Xf0HCVxpWkSmo+RS750hbem6TvHczPuS6KfeDvKSZ8LM+kzbiddrxyGLxp7XHYscF3S9
         zxsQcOdLMjbuYn6BazGxH15KsKKQqesFYGDYOpjZUS6su5tv5jfYmlkKv3ORqcJiz98Z
         sPHA==
X-Gm-Message-State: AOJu0YzaGhxkf17pj+GzZjA4oPa9D61eqTYBlvwdlpMlJrmG2CBLYMQr
	q/eGJLFsEivuG3TqZO1V18kU8g==
X-Google-Smtp-Source: AGHT+IEh1yyse3RrKzXfWlgA1lUMYc5fycCT+yx7MiP8AVViKu4ufDcT0uk1l1kIAiwTjMwU4PiQFw==
X-Received: by 2002:adf:e612:0:b0:333:3a13:91dc with SMTP id p18-20020adfe612000000b003333a1391dcmr2619650wrm.86.1701760212746;
        Mon, 04 Dec 2023 23:10:12 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id q4-20020a05600000c400b003333fa3d043sm7376024wrx.12.2023.12.04.23.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 23:10:12 -0800 (PST)
Message-ID: <b97f04f6-cda2-4e9b-b729-a5149e36f978@linaro.org>
Date: Tue, 5 Dec 2023 08:10:09 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Frank Binns <frank.binns@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Adam Ford <aford173@gmail.com>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, =?UTF-8?Q?Beno=C3=AEt_Cousson?=
 <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Paul Cercueil <paul@crapouillou.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-mips@vger.kernel.org
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231204182245.33683-2-afd@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/12/2023 19:22, Andrew Davis wrote:
> The Imagination PowerVR Series5 "SGX" GPU is part of several SoCs from
> multiple vendors. Describe how the SGX GPU is integrated in these SoC,
> including register space and interrupts. Clocks, reset, and power domain
> information is SoC specific.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../devicetree/bindings/gpu/img,powervr.yaml  | 69 +++++++++++++++++--
>  1 file changed, 63 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr.yaml b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
> index a13298f1a1827..9f036891dad0b 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr.yaml
> @@ -11,11 +11,33 @@ maintainers:
>    - Frank Binns <frank.binns@imgtec.com>
>  
>  properties:
> +  $nodename:
> +    pattern: '^gpu@[a-f0-9]+$'

Why? We do not enforce it in other bindings.

> +
>    compatible:
> -    items:
> -      - enum:
> -          - ti,am62-gpu
> -      - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
> +    oneOf:
> +      - items:
> +          - enum:
> +              - ti,am62-gpu
> +          - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
> +      - items:
> +          - enum:
> +              - ti,omap3430-gpu # Rev 121
> +              - ti,omap3630-gpu # Rev 125
> +          - const: img,powervr-sgx530
> +      - items:
> +          - enum:
> +              - ingenic,jz4780-gpu # Rev 130
> +              - ti,omap4430-gpu # Rev 120
> +          - const: img,powervr-sgx540
> +      - items:
> +          - enum:
> +              - allwinner,sun6i-a31-gpu # MP2 Rev 115
> +              - ti,omap4470-gpu # MP1 Rev 112
> +              - ti,omap5432-gpu # MP2 Rev 105
> +              - ti,am5728-gpu # MP2 Rev 116
> +              - ti,am6548-gpu # MP1 Rev 117
> +          - const: img,powervr-sgx544
>  
>    reg:
>      maxItems: 1
> @@ -40,8 +62,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - clocks
> -  - clock-names

I don't think so... How can you run without clocks?

>    - interrupts
>  
>  additionalProperties: false
> @@ -56,6 +76,43 @@ allOf:
>        properties:
>          clocks:
>            maxItems: 1
> +      required:
> +        - clocks
> +        - clock-names

You need to define the clocks for your variants or disallow them. The
original code should be fixed as well and make the clocks fixed for all
img-axe cases.



Best regards,
Krzysztof

