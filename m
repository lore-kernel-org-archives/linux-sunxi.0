Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD70321E
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 21:48:02 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id m15so103511edb.13
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 14:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiOoGqWP9QI63dNxXTXejVxT+J2IullvD3xHlr3pqqI=;
        b=CuhP6SJAJqI9WLUgkws2o7QpcR3KOtu+vk40JKMcNTB7ITFZWoZdoY54dgctUAZ/v/
         PVv0V7sCooD18SZJteKjKf+IFKQmwvqKqs3X+OGg9cmp+GfRj2Xw2Y1ufTvA3rJaufbe
         4ar5B+w/gqaICz56Gu7Jq/B/V5aB7lkoHne2ocKK3H3NDjDYUSmzDfUC0KiN+tT75lNw
         9bjBohG1r+V7twxDQCDLq3x3apOlrb1Tze0/i8X3/+GeqpkBQJrkRSKsl25kFFjljd8i
         go7KK2h4WiFd1BJH/62P6yfdzUDg812obYEZa5Wd/TFlY9ucggat20Z3KBo+AtAnrZF2
         jhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiOoGqWP9QI63dNxXTXejVxT+J2IullvD3xHlr3pqqI=;
        b=VlhiKKwlEja8ov9eH+I+1efMUpEwiFx/Cs4WVnwmc/QDBYshjkydkbYI1wXMKvrBEJ
         LBuBJLVtGQItxOI5oUHK9drTfdaY3WOa8LcpdjH2F2gKa/CPji1qflcQrc6UnTaRPzWg
         05yKAGi6q5y0qvv5qqPeryrFhn/Yv9A9KUqLQmkHvS0KI8t3wro6n/34/ObtFxl6Y3WS
         6AInDLYhf8MXMH5D8eqx0YC4cGPTd43lZh3EQTOkFGFVA5iogGx/6ie9qwXP1t1M2S8z
         e7pjadwVhe/pGCHZvBEw1isVz+tPwCzYOCTHkC1yUahFZ2VnpzwITJXWGMPpxWP9Qc7v
         F4FA==
X-Gm-Message-State: ACrzQf08XF069bJGsTOo1uIn/bO39/DLJLoO3eLjpWJDCkneT3QSKWO2
	Gj2l78xK61+VyInDC2nQGEk=
X-Google-Smtp-Source: AMsMyM5NKhZWo9SvUyqqCkby2CqZcu64sNYVrDopX0uUbIv+RX0/Berc7UxXx7bYGv1aVRFYuSrAeA==
X-Received: by 2002:a05:6402:5406:b0:452:1560:f9d4 with SMTP id ev6-20020a056402540600b004521560f9d4mr29573632edb.333.1665611280437;
        Wed, 12 Oct 2022 14:48:00 -0700 (PDT)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id ay8-20020a170906d28800b00788c622fa2csm1852551ejb.135.2022.10.12.14.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 14:47:59 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: sunxi: correct indentation
Date: Wed, 12 Oct 2022 23:47:58 +0200
Message-ID: <2599730.BddDVKsqQX@kista>
In-Reply-To: <20221002091959.68815-1-krzysztof.kozlowski@linaro.org>
References: <20221002091959.68815-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Krzysztof,

Dne nedelja, 02. oktober 2022 ob 11:19:59 CEST je Krzysztof Kozlowski 
napisal(a):
> Do not use spaces for indentation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi
> b/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi index
> e899d14f38c3..1d1d127cf38f 100644
> --- a/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi
> +++ b/arch/arm/boot/dts/sunxi-bananapi-m2-plus.dtsi
> @@ -89,13 +89,13 @@ switch-4 {
>  	};
> 
>  	reg_gmac_3v3: gmac-3v3 {
> -		      compatible = "regulator-fixed";
> -		      regulator-name = "gmac-3v3";
> -		      regulator-min-microvolt = <3300000>;
> -		      regulator-max-microvolt = <3300000>;
> -		      startup-delay-us = <100000>;
> -		      enable-active-high;
> -		      gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>;
> +		compatible = "regulator-fixed";
> +		regulator-name = "gmac-3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		startup-delay-us = <100000>;
> +		enable-active-high;
> +		gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>;
>  	};
> 
>  	wifi_pwrseq: wifi_pwrseq {
> --
> 2.34.1


