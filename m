Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D786B2562
	for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 15:39:01 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id bv19so30393976ejb.6
        for <linux-sunxi@lists.linux.dev>; Mon, 25 Apr 2022 08:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pYmQqIYD75N8SfHaj0AHYF+l6GG1We6pvmxz4RUic0U=;
        b=HcSKLFcQ39VMWJjtBZOifOr7HgnGBAnQ/2K6mqcHILLQHQEUof1EcH0ST5RP2UyCJW
         sPlugYviZSHSzfhUOdEgns1D2XbP9ik5vVLAa8eQyh+ujOu3Lu7vfKwOvBGFzAgZvNbU
         IVSox7dVLyL/HoeY3CNQ+eVnLotEv6w2ejPCurmWyENlL9f+Jtx40Z/cAX0ihd6LUeJH
         4LTCpaJ6ib1GjFQ1g7nKC9zvclPmJkQy1D4af2UW1r3iG3PFl9M5GO8Qtswn7ipHZde0
         YxEIzYVmsQWrtVf2akEMf6LfzlFWMJknvrruua5q5qcfAX/sW+18ZYvIuUX6M5J1ojo/
         O5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pYmQqIYD75N8SfHaj0AHYF+l6GG1We6pvmxz4RUic0U=;
        b=HOA7x5TOt1Bt5mj/1lxHJ98tMV2ipdYqLI5aPaD1IJgfY/lHDBK1dSg3RtAjN1+Eah
         ztlv/746xG8eAlHb9icPZ/lcD/1/D5XZ1YdYyn2LmR1et5zdMyaI0j+J3ht+E8Nj2aPn
         J250r/6HvlYXAO7t7ZP8QXELIqfj0oeLPO6cW9hRPpIUGzZAbHLj9tlz1ibOX3bFSM5E
         x3zrGKB7q2L9Lnjnz4FmNOpuADl6nCUwq06ZEl7W6bmEnzrDklRKXbM+VMUiKczWSqY1
         YVW1jRGUUQ5MOyvfPxIaygH7ceNQ6g+MA+ff39dGgv/q3Qq9Fz3sivmgS1sf8EmSs7Dl
         lxNw==
X-Gm-Message-State: AOAM532wRk5ygTgK87Npcm6iqskQZ/oA62CmxX7y4kMyYSGmn7El3cKS
	nJI9ioTYEzbRy0vzKoCfQX4=
X-Google-Smtp-Source: ABdhPJwwSkqiGf16KxdNekflI3QJP2lMS26OvuOMJjFrLD26JHb5D0s3BuIki9ZRVb340m/EuLrD8Q==
X-Received: by 2002:a17:907:2daa:b0:6da:924e:955 with SMTP id gt42-20020a1709072daa00b006da924e0955mr16948119ejc.1.1650901139986;
        Mon, 25 Apr 2022 08:38:59 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id s1-20020a056402036100b004240a3fc6b4sm4838063edw.82.2022.04.25.08.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 08:38:59 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Dang Huynh <danct12@riseup.net>, Dang Huynh <danct12@riseup.net>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: sunxi: nanopi: Remove input-name property
Date: Mon, 25 Apr 2022 17:38:58 +0200
Message-ID: <3427349.iIbC2pHGDl@kista>
In-Reply-To: <20220425064231.243482-1-danct12@riseup.net>
References: <20220425064231.243482-1-danct12@riseup.net>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 25. april 2022 ob 08:42:32 CEST je Dang Huynh napisal(a):
> This property doesn't seem to exist in the documentation nor
> in source code, but for some reason it is defined in a bunch
> of device trees.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> This patch is a split of this treewide patch [1] to ease the 
> maintainers. 
> 
> [1]: https://patchwork.kernel.org/patch/12633497/
> 
>  arch/arm/boot/dts/sun8i-h3-nanopi.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi b/arch/arm/boot/dts/
sun8i-h3-nanopi.dtsi
> index fc45d5aaa67f..a9f749f49beb 100644
> --- a/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
> +++ b/arch/arm/boot/dts/sun8i-h3-nanopi.dtsi
> @@ -75,7 +75,6 @@ led-1 {
>  
>  	r_gpio_keys {
>  		compatible = "gpio-keys";
> -		input-name = "k1";
>  
>  		k1 {
>  			label = "k1";
> -- 
> 2.36.0
> 
> 


