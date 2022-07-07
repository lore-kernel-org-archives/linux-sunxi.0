Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DA328F2
	for <linux-sunxi@lists.linux.dev>; Thu,  7 Jul 2022 20:06:54 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id o18so19261304pgu.9
        for <linux-sunxi@lists.linux.dev>; Thu, 07 Jul 2022 13:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=98EN1f5/i2LzYWeXUWVEmbBzCCPBpI9i3gg9XzfXb9c=;
        b=hCntgRRaF+staQV7p+Zao9Z5wzI8MfIg0AxDo9EyOVwju9ZjeKvvIJ9QiYz0IPme8V
         gAKsyoQBK33SyU4QiX9DVDaEeXcRDxEAgwbdUCsusfsFKFb6E8jP3mVwXSDRzMhb4m2c
         dtYmCYRHI0Nii/nhSSJice4ub5t68hy+3ye8bUFIA74MWPBQ+B01AdSnL4jNTbPH3Mnd
         6YOiAxixNAc8S5DC7qUtkHPpvl03ZyyUW9D8tkfbMGJgsFiFZkzUz9GmJLrLuoPs1EDQ
         NcMt22lZfS5ZORKSNCB8Rao601RQkNRIFvGIITVDxXTGMG0ebzAXEESWvUmskqYae2qI
         0lSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=98EN1f5/i2LzYWeXUWVEmbBzCCPBpI9i3gg9XzfXb9c=;
        b=1aXqpolYDxIIkVt6N17NGMPM/7DUjffSujf5BCKDEW1e0EPlsG5wnIy0kc9QkL5hgL
         JMGWLd4zQNnfBUUTN+V7uL6Pl2iMaKHlOOFVg9DUlsyEMjMP2U1MQcKfSXmXaeMyBwvu
         FFoncXso4IM3w65LM9ZjTXLqrWjMPhYSN5LZ6/8bkZIg9OHUKJSzzOU6VjU+4zriKAOH
         ni8dNSMWQ59ghCyO2vnXE9lLTA7w2SDCewjBJgUuveg6Aok9qFJKtOZcpx03XZoXHdW2
         nw1N29G7KfkjIXiMP/1mwoggwM0z9oPRPyKefJth9yMC36zGLHbHIaGstF7e5zv/bLuD
         ffiw==
X-Gm-Message-State: AJIora/Yckd2Q0dEvbC861D40RUa6YoZXsV13O6TY9XtX4UFat4toQLg
	rj9+eqx6emdpnI4CIMv0/Is=
X-Google-Smtp-Source: AGRyM1vy66Z/+Xo6fItZ1jRS5GZdetQUfu6iuqR5iLkdqPeiRLW/dYGBPYWyq3gDenoFALAvW3pxNw==
X-Received: by 2002:a17:90a:e4ce:b0:1ef:87dc:e377 with SMTP id e14-20020a17090ae4ce00b001ef87dce377mr6847562pju.25.1657224413822;
        Thu, 07 Jul 2022 13:06:53 -0700 (PDT)
Received: from [172.30.1.47] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id p14-20020a170902a40e00b0016bd72887fcsm11267147plq.59.2022.07.07.13.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 13:06:53 -0700 (PDT)
Message-ID: <59e565e3-8930-9010-7642-2b13607cba61@gmail.com>
Date: Fri, 8 Jul 2022 05:06:48 +0900
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] dt-bindings: arm: sunxi: Add several MBUS compatibles
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20220702042447.26734-1-samuel@sholland.org>
 <20220702042447.26734-2-samuel@sholland.org>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20220702042447.26734-2-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Samuel,

On 22. 7. 2. 13:24, Samuel Holland wrote:
> All of the sunxi SoCs since at least the A33 have a similar structure
> for the MBUS and DRAM controller, but they all have minor differences in
> MBUS port assignments and DRAM controller behavior. Give each SoC its
> own compatible.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml   | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml b/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml
> index 2b018feb56df..99566688d033 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml
> @@ -29,10 +29,20 @@ properties:
>    compatible:
>      enum:
>        - allwinner,sun5i-a13-mbus
> +      - allwinner,sun8i-a33-mbus
> +      - allwinner,sun8i-a50-mbus
> +      - allwinner,sun8i-a83t-mbus
>        - allwinner,sun8i-h3-mbus
>        - allwinner,sun8i-r40-mbus
> +      - allwinner,sun8i-v3s-mbus
> +      - allwinner,sun8i-v536-mbus
> +      - allwinner,sun20i-d1-mbus
>        - allwinner,sun50i-a64-mbus
> +      - allwinner,sun50i-a100-mbus
>        - allwinner,sun50i-h5-mbus
> +      - allwinner,sun50i-h6-mbus
> +      - allwinner,sun50i-h616-mbus
> +      - allwinner,sun50i-r329-mbus
>  
>    reg:
>      minItems: 1

I have a question. 
Are there the device drivers for the newly added compatible?

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi
