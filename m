Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7421FA8
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Jul 2022 19:46:35 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id n8so6848725eda.0
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Jul 2022 12:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pxgS4p5kSBLMPAC2eDn0vC1WINPqdVlYglQ2y+OLFq0=;
        b=P8fte2uj6avL0LBr8PDdQ9JVQ/OYBIOZhsB28YwzuD091bzFB680uz3px5XZNQzHHS
         bhj2sAhivTNya+qNDvLbRspETnH3oHDsJ/lPttW5NSifWfOcLSixnc7hniRM3c35jib1
         jMDqZ5wjFc7+KsKmqzzObKfsNj+baQws2SbVEgiu4emBtDmcYYeVbRbE/TZw8BZiG2PM
         rqI/hsvetaFtO7nt7UZg9FWhCgmow9iLuWD3f2KBrPNOiDKRl7L22VjYmls821OXGAO0
         Urp0oMPHJsbXT4spyFsyobWZjVF4PM6lzuwTL3wDuhQ0FP+4Mob0reWVvrDpKn7D5283
         lPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pxgS4p5kSBLMPAC2eDn0vC1WINPqdVlYglQ2y+OLFq0=;
        b=GIFKZbxUZXy8qgGhGHgzO2Nynx0Fy+qOWJPXZb1BjDuDu9beozHrhb999WcYZIi4tq
         cmoYMfbiq2XPFrGLLsAf8cJHLGM7M8nv5X7R8b3atRaE+bg5u0VqxneVNh0e5rIS7lnJ
         K+CwGB1PA6LlZaSq5SjnMojq6vJpl8TXMyrsVmMjujTDB9jwTFOGLGx44s6jaez7YinS
         KqSHa8MnkmLaYIZjpBbh212sg5tn+OdMnKajbPpHA7vvgfjEZ9mG7BVwVWIg+79VkYvE
         tP7uBgVMkdpvlWOOp5x3tit9RVXqjxqTqhE1vIz+1axMgYy+LsC/wzlZaj6+lUWLKPPr
         NTeg==
X-Gm-Message-State: AJIora/1wFUbQRSt1pQWqtdrYfi+tA+SDjHBnFn6Vpip4CWBAAlPQ1/x
	dxULMmWHgI1++8kJnRXPJ8Y=
X-Google-Smtp-Source: AGRyM1vHamoI/ixQaistolqBSh9huvGvUWWXq43tTsjr7vwVzM2pB2/mq2J2KQ4PWWW4ed0WIIEoSQ==
X-Received: by 2002:a05:6402:13:b0:439:ffe8:bec9 with SMTP id d19-20020a056402001300b00439ffe8bec9mr3357376edu.297.1656791194162;
        Sat, 02 Jul 2022 12:46:34 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id kt26-20020a170906aada00b00726dbb18b59sm6373525ejb.130.2022.07.02.12.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 12:46:33 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <maxime@cerno.tech>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] dt-bindings: arm: sunxi: Add several MBUS compatibles
Date: Sat, 02 Jul 2022 21:46:32 +0200
Message-ID: <3618226.MHq7AAxBmi@jernej-laptop>
In-Reply-To: <20220702042447.26734-2-samuel@sholland.org>
References: <20220702042447.26734-1-samuel@sholland.org> <20220702042447.26734-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne sobota, 02. julij 2022 ob 06:24:47 CEST je Samuel Holland napisal(a):
> All of the sunxi SoCs since at least the A33 have a similar structure
> for the MBUS and DRAM controller, but they all have minor differences in
> MBUS port assignments and DRAM controller behavior. Give each SoC its
> own compatible.

Shouldn't be compatibles introduced when they are actually used either in 
driver or in DT file?

Best regards,
Jernej

> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml   | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml
> b/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml
> index 2b018feb56df..99566688d033 100644
> ---
> a/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml
> +++
> b/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml
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




