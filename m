Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9167F
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Nov 2022 08:25:58 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id ud5so23039357ejc.4
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Nov 2022 01:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMkkVzTjokrGWbF60wePAUHPChBzzzz4VP13xe+Pvl4=;
        b=VkQHyBRVLM3X/7q9r4x+KFZ3krHyQtPrjhPFn7ae/KZ/TqT2OmbLJEkqSy1gPyWiZs
         o+/X0cLgik/Yf7Vgkb021OCvwActcxXhFDyrfkykPBJ4k/pmFjpkWIP/yrUnMxMPWrt5
         zJ5OOrkjVE8k5Jsk9OXuS0TfUWIg6HERB5HR4ayxdMU6A7ff/uO62lviQ9rX4kvBTwut
         uJ2XsryPQFVxCfaMOPLEuDlRz/Kmravra1aLuwzJXQmrZPZWE/kw+qb1f/gy3WYP5rb1
         6ZLXbWoOLNc/EZTzrT29YmS/quh4w5/2YcATJlpjV4X2H4JTEGGf6xAh7g6ZI610oOFg
         xnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMkkVzTjokrGWbF60wePAUHPChBzzzz4VP13xe+Pvl4=;
        b=MBdjrB7n3slp3wUm09rpAcV/1Jx4vQ0OPnRzCAA6c6flIa7tyxzHfRgTtvaJ4Qie/r
         KKzyeekxINsNWINyXXzBtgFUDCdFYuvIS9dG6gnMRGmRJpGQ7TjE2m+n4Ur4Pv00ft9N
         QbOKRKnOmUzx4EyWJT52C1xi0xVKHPxy1MX1gQQCUWwKNqwSnQfYy02J+yVwaZaL9dVW
         PDRqqlbLV6El4JoDqqOFBByGZcr5s8uRffiFQ9BOirX5SoEp2sU+Wafpxosf0A+xFE4h
         jCLoKoG7yBYslzg2pRlQ4jq4D7/mgIIhicxzy/VJcnidzGxaUFt4isZDsG/XGdY4ohkP
         dlaQ==
X-Gm-Message-State: ACrzQf0rilNPsuVr249e1fg1bOibm1sikZWcNb3xxnJrZPJmAxdrY0Ib
	4e5IOmtu8AVaxZE6BjqX0ME=
X-Google-Smtp-Source: AMsMyM47mGYqM7uM25Nj6eKtulEjXm3wNmW2uNtAL8wo8j6Up4cBvqLEI6qqJbWvwFQXObbvEik9mA==
X-Received: by 2002:a17:906:9bd4:b0:7ad:2d86:418c with SMTP id de20-20020a1709069bd400b007ad2d86418cmr42896478ejc.380.1667723156918;
        Sun, 06 Nov 2022 01:25:56 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id em3-20020a056402364300b00458824aee80sm2334858edb.38.2022.11.06.01.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 01:25:56 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>, Hans de Goede <hdegoede@redhat.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH 9/9] ARM: dts: suniv: f1c100s: add LRADC node
Date: Sun, 06 Nov 2022 09:25:55 +0100
Message-ID: <45074583.fMDQidcC6G@jernej-laptop>
In-Reply-To: <20221101141658.3631342-10-andre.przywara@arm.com>
References: <20221101141658.3631342-1-andre.przywara@arm.com> <20221101141658.3631342-10-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 01. november 2022 ob 15:16:58 CET je Andre Przywara napisal(a):
> The Allwinner F1C100s series of SoCs contain a LRADC (aka. KEYADC)
> compatible to the version in other SoCs.
> The manual doesn't mention the ratio of the input voltage that is used,
> but comparing actual measurements with the values in the register
> suggests that it is 3/4 of Vref.
> 
> Add the DT node describing the base address and interrupt. As in the
> older SoCs, there is no explicit reset or clock gate, also there is a
> dedicated, non-multiplexed pin, so need for more properties.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/boot/dts/suniv-f1c100s.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> b/arch/arm/boot/dts/suniv-f1c100s.dtsi index d29b48f23b89a..03592c8e63fed
> 100644
> --- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> +++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> @@ -262,6 +262,14 @@ ir: ir@1c22c00 {
>  			status = "disabled";
>  		};
> 
> +		lradc: lradc@1c23400 {
> +			compatible = "allwinner,suniv-f1c100s-
lradc",
> +				     "allwinner,sun8i-a83t-r-
lradc";
> +			reg = <0x01c23400 0x100>;

User manual says 0x400 is reserved for this peripheral. With that fixed:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> +			interrupts = <22>;
> +			status = "disabled";
> +		};
> +
>  		uart0: serial@1c25000 {
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0x01c25000 0x400>;




