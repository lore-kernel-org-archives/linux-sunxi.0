Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994D51FD8
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Jul 2023 11:58:25 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4fbf09a9139so8948213e87.2
        for <linux-sunxi@lists.linux.dev>; Tue, 18 Jul 2023 04:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689681503; x=1692273503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RmzXJ/X/20IP2NA5ydey9UTdXMIFoNTFLzhDsg2LXMg=;
        b=nJFiW2ZbXNxGhKubnuOrt5ngvuDj0od2YfIxKpLcORLneePwIEoJcO2ELJPoPonRgu
         XIleKJxMvqwUVlgvq6anzdvNirAbHSEx8bzzPuvUzoUgVSowNzuA5/gPg6Aahw3b121I
         vbRWlVWZJ5muJ9Wu76Q7wSvxFBe7/CyOV2pXqFLGBF25w8IvkRDv99T7sqnWvNPvjsQA
         7Ds+nGGSDZXDZJYSrqf3Z4JzUyL6J1KZA5xWUlsO3WP4AyXj44QHam8A9Wte4cetKQvR
         p039qDr9OwjYkVOZUxvHIZdxcrQgDqPq/g719tv02B0XGjLm9VnsZZS3ri/U1fzTgnDh
         oeng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689681503; x=1692273503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RmzXJ/X/20IP2NA5ydey9UTdXMIFoNTFLzhDsg2LXMg=;
        b=Y1hvkgt7XnBKTM0Bc+Mg/QngzH2qRBAcL0hWm6/UJye2aFzTqoT5xmZDr+UX549iFx
         r72QJYx+lu9Mr5WQf0nh40pGAYpATin7lk7o5hG6JNAiEGjz95IO/VLM+768qNAdcFJP
         iGdWUwvW/TPgPs/JyrxIyfLMmdmtfrwwnF4bztH/IcSmrZWVp9KI4RNruiGcVNENMO8u
         CEPw2hMzNo8YG8uts0FzeTzUY1WWN3J1gRNQsBURNbntl4hskGG1UJZCb4XCY8d4m0yY
         9rWbUf91I2mnoGXxseOU+cTPd1hb7f7VntJJHTvA13qfzhvUr23lcPkf7eWuKdXi5hLB
         5H7w==
X-Gm-Message-State: ABy/qLYiKQQDJhMklkJkry7RlQs84mSm3/Ml2601t2daaguMXIbV8y5d
	lk9Aq+fdPcXqbWGVSlsQcoqQ8w==
X-Google-Smtp-Source: APBJJlHEr/9/LyGDc4PQ9CWREuuL/dRt4KsNlQE2idmsGPnKHF4L0VIePfG0k40n+cMuFT5L1d6HTg==
X-Received: by 2002:ac2:5450:0:b0:4fb:8afa:4dc9 with SMTP id d16-20020ac25450000000b004fb8afa4dc9mr9666103lfn.49.1689681503490;
        Tue, 18 Jul 2023 04:58:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w5-20020aa7dcc5000000b005217a24addbsm1129824edu.20.2023.07.18.04.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 04:58:23 -0700 (PDT)
Message-ID: <e1cad60d-6db0-1820-0f2e-84fd36a46555@linaro.org>
Date: Tue, 18 Jul 2023 13:58:21 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] arm64: dts: allwinner: h616: Add Mango Pi MQ-Quad DTS
Content-Language: en-US
To: Matthew Croughan <matthew.croughan@nix.how>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230718111908.1178727-1-matthew.croughan@nix.how>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718111908.1178727-1-matthew.croughan@nix.how>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/07/2023 13:19, Matthew Croughan wrote:
> Mango Pi MQ Quad is a H616 based SBC, add basic support for the board
> and its peripherals
> ---
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../allwinner/sun50i-h616-mangopi-mq-quad.dts | 183 ++++++++++++++++++
>  2 files changed, 184 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-mangopi-mq-quad.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index 6a96494a2e0a..fbc64885ef79 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -40,3 +40,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6-mini.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-mangopi-mq-quad.dtb

Keep alphabetical order.

> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-mangopi-mq-quad.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-mangopi-mq-quad.dts
> new file mode 100644
> index 000000000000..752e5296c4af
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-mangopi-mq-quad.dts
> @@ -0,0 +1,183 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (C) 2020 Arm Ltd.
> +/*
> + * Copyright (C) 2023 Matthew Croughan <matthew.croughan@nix.how>
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-h616.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	model = "MangoPi MQ-Quad";
> +	compatible = "allwinner,sun50i-h616";

Missing board compatible, missing bindings.

> +



Best regards,
Krzysztof

