Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA610C14B
	for <linux-sunxi@lists.linux.dev>; Mon,  4 Sep 2023 19:31:38 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so271306466b.3
        for <linux-sunxi@lists.linux.dev>; Mon, 04 Sep 2023 12:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693855896; x=1694460696; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJfzYAIKnwPTaNVAAkVDsZyLFKgbTLwbTGas3wSGj30=;
        b=DjQY63OwURzhRSZD4O7nfl2OhqTGE7n26Mh8+TJsG4D0u9q2FFHWMB7Y2ktvcOd77T
         8CQkkqO0qIzQkdNuGiBQ8WYzl7XR5NWWioRfVNi7+xMcm2vFML45aqSy6DN8vao4EGdA
         BBgUZE2p9h4qSzLAQRQiFBqkpvAeA9nRwO813wV00UEyV4ftvmwiWr5fTKjUZD/fn+N9
         rAgrE1iLuSrfmZFvtOHf3JA8tA79BZ1Q4jHRC4oDfTNft+mPWXcozlE/Sus9kTRKA/Rp
         5dsfhv2x8HxG97LGnh9PIG8ApoUAGuZeN0Z9vTni+WnixtpN4Nq32j+sHlbB0KW8tlgQ
         K6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693855896; x=1694460696;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJfzYAIKnwPTaNVAAkVDsZyLFKgbTLwbTGas3wSGj30=;
        b=Kwz1FiiGdP2PFYTb0HNjfPp/qUKyABo2Ly3xEL0LyVVj2nlTWqo5J3QzW/w03vlz+l
         IwEHgLrQSzzHsxAn9LDp/K99nP7yYo3gnkEVCh9oJ9r5A+A5pMyaFsKrF+d/wNi/6Lnv
         McYzo484No+PyHfPexB7sMExpcVzDqDkMoUb3IwxJZDp7qfVVLV+UvqkGGddmPXuKtHI
         YTF6/J3P2tBfoOHy8CLt7VFOW7we/KOPzGHMiF8gef9wayhGn4WQfNC22Y9gbbhGJAVJ
         h0mPjC+ENpaOiZ54P+gvTJFHJqDdDsZZTJ4+S3QvqyF3YMTZfnL4Y2BECNK3YZ3ybK53
         tVjw==
X-Gm-Message-State: AOJu0YxS4Q6WktQPsfn0+rxMJwByY4VuTgwIIWu1BtEgR1PlDipEsKDM
	jrDnj+xBwMvfyYzHkY0e1l8UoA==
X-Google-Smtp-Source: AGHT+IHXIXug6nzry8NP/bG9picjl2qkVPdjAfH7GKSh1orCmcs5A6HXOx/Za69iL81di4h4TtnnlQ==
X-Received: by 2002:a17:906:109:b0:9a4:88af:b82 with SMTP id 9-20020a170906010900b009a488af0b82mr6112989eje.77.1693855896681;
        Mon, 04 Sep 2023 12:31:36 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id mc24-20020a170906eb5800b009829d2e892csm6659123ejb.15.2023.09.04.12.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 12:31:36 -0700 (PDT)
Message-ID: <f512f11a-6b66-5892-ad9e-cc45d4abc508@linaro.org>
Date: Mon, 4 Sep 2023 21:31:34 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/6] dt-bindings: opp: Add compatible for H616
Content-Language: en-US
To: Martin Botka <martin.botka@somainline.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 Alan Ma <tech@biqu3d.com>, Luke Harrison <bttuniversity@biqu3d.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rogerio Goncalves <rogerlz@gmail.com>, Martin Botka <martin@biqu3d.com>
References: <20230904-cpufreq-h616-v1-0-b8842e525c43@somainline.org>
 <20230904-cpufreq-h616-v1-3-b8842e525c43@somainline.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230904-cpufreq-h616-v1-3-b8842e525c43@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2023 17:57, Martin Botka wrote:
> We need to add compatible for H616 to H6 cpufreq driver bindings.

Please describe the hardware, not what is needed for drivers.

> 
> Also enable opp_supported_hw property that will be needed for H616.
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
>  .../bindings/opp/allwinner,sun50i-h6-operating-points.yaml          | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> index 51f62c3ae194..2fa1199f2d23 100644
> --- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> +++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> @@ -23,7 +23,10 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: allwinner,sun50i-h6-operating-points
> +    contains:

This does not look like part of allOf, so contains is no correct here.
This must be specific, so drop contains.

> +      enum:
> +        - allwinner,sun50i-h6-operating-points
> +        - allwinner,sun50i-h616-operating-points
>  
>    nvmem-cells:
>      description: |
> @@ -47,6 +50,7 @@ patternProperties:
>      properties:
>        opp-hz: true
>        clock-latency-ns: true
> +      opp-supported-hw: true

Why? It is already allowed. You should rather explain the values.

> 

Best regards,
Krzysztof

