Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F93A17CB
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Nov 2022 13:26:29 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id q7so8032586ljp.9
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Nov 2022 05:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o4HSsW8BSppm65SzOgKkp1ueBN0+yQmM4nOdtdewie4=;
        b=fQ948lgQWtUyPvTbVqFz9q/GMnUuxAq/xfBCHkJL16BWRoGwSi7N3Ll1/vKlrlTWf1
         LN96gsqTnvCQpGN5YjYG10xuR+YaL9zM4L9WUOz8Xvv/hqroWL6TL3HT309cLxm2/KBG
         eCLfmz7owAKXhMPNkUHj3S0eRZidLboTGGrQwNMJE7IkX0/mvqgGT/rW5cwGPyNDqE7l
         ghJ5zdtCgdSttJXsAZjStUGWjArFUF3kjd7WbsSD6HxDO++Jp1lZM81h3ML1cpov6FmI
         82K6z1t3VYJgrwpxQfkNtIMovDVq3xdq/yyUPZ01D40tY1sWMoYYT774LPidZ0QcrhD/
         rlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o4HSsW8BSppm65SzOgKkp1ueBN0+yQmM4nOdtdewie4=;
        b=3C4VZzuEy/3eUUI+MyXoFS1gHDz53xg7thhqs8CU2agbo47oDyI7zP9X6047A4Rmqs
         S2rOWE3F3LZJqrmRV2SRsiJiRKMczODJFLwTYr+Mc1a/tdh1NhNYMA8+0YQqEy8eb0qV
         bRP4dFyMWWVQPQgZFtzcQ/PrDWPALJxmPr0ioXhK77FVZYweiLEWPDN8kJmfTm/pJtnk
         K+ES9Nwf3TO8ujBBr6vaG3AuMH/V9YCXUA9uRSWZc5OcltsdP9m1nsE3E6W+yIRnvdeb
         Ols6m28YCofQhHTDTsncpJMAzHXJmF4f5Abj39VsxK5vxZDFEfv93ffzJjLSH/x0bZXb
         qBrg==
X-Gm-Message-State: ANoB5plZ1sMuOn/xV6PA1/4jN+Y/8wz+2WM+H1hvWZwOWnJDoM2JhSJC
	McKn/yNKXv2BnTvlbIqc62j2Tw==
X-Google-Smtp-Source: AA0mqf4diqUCufc5o5ynb6ePA7iRhvGzndvX4FgyVTV8biyv9XJ3eZhD7JtIGLRQ2Y+XGxyaz98WZg==
X-Received: by 2002:a05:651c:11c1:b0:279:7b1c:9add with SMTP id z1-20020a05651c11c100b002797b1c9addmr5996583ljo.151.1669469187372;
        Sat, 26 Nov 2022 05:26:27 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y30-20020a0565123f1e00b004a2386b8cf9sm931748lfa.206.2022.11.26.05.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 05:26:26 -0800 (PST)
Message-ID: <5b05317d-28cc-bfc8-f415-e6acf453dc7c@linaro.org>
Date: Sat, 26 Nov 2022 14:26:25 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/3] dt-bindings: net: sun8i-emac: Fix snps,dwmac.yaml
 inheritance
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, netdev@vger.kernel.org
References: <20221125202008.64595-1-samuel@sholland.org>
 <20221125202008.64595-3-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221125202008.64595-3-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/11/2022 21:20, Samuel Holland wrote:
> The sun8i-emac binding extends snps,dwmac.yaml, and should accept all
> properties defined there, including "mdio", "resets", and "reset-names".
> However, validation currently fails for these properties because the

validation does not fail:
make dt_binding_check -> no problems

Maybe you meant that DTS do not pass dtbs_check?


> local binding sets "unevaluatedProperties: false", and snps,dwmac.yaml
> is only included inside an allOf block. Fix this by referencing
> snps,dwmac.yaml at the top level.

There is nothing being fixed here...

> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml     | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> index 1432fda3b603..34a47922296d 100644
> --- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> +++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
> @@ -10,6 +10,8 @@ maintainers:
>    - Chen-Yu Tsai <wens@csie.org>
>    - Maxime Ripard <mripard@kernel.org>
>  
> +$ref: "snps,dwmac.yaml#"
> +
>  properties:
>    compatible:
>      oneOf:
> @@ -60,7 +62,6 @@ required:
>    - syscon
>  
>  allOf:
> -  - $ref: "snps,dwmac.yaml#"
>    - if:
>        properties:
>          compatible:

Best regards,
Krzysztof

