Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EC5321E
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 21:53:23 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a26so91046ejc.4
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Oct 2022 14:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/UAQonY1jdtSDxe6mG/GSNINyt/UsNb0npebwXSigc=;
        b=JzgUWg8xRuGnBKhabW6f9oVrX/dtov7QQSv5AblnWE+IphRPFYyXHxp0aa1gj/sOjL
         jIj9NjDn+q1Vr7xgRyH9vi/O3ykh3aSmcVbziGCwsjs7ozBwMv1uKzvV1PRm0I/+r9xy
         H8rMl5j7umJzV3fdZB1IQRO6NFN1k7N/uewVl6JA1dKZaqgj3RPKiC/u8z62MrhdnbAL
         jDiG54Ryee+x/P6b1lfF7tVqBuOUvLm+c4xFioji0No37mAoNWifcy4FztJSSWLI+L3X
         CHzpg+NZ12LZxL88J0LQA0DI9kZRA4FUvvJLO7LTZQ3FrSJEeIE7hFigHGThq/oTv1Mz
         fPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/UAQonY1jdtSDxe6mG/GSNINyt/UsNb0npebwXSigc=;
        b=AHiNIgkzHIVkZii6daz4jWSVspAyi5EO/zM4CVtk82yAJh4ClqK+gVGCdGDQWQduSu
         LAsObi9ud8Z3Efw5waK3RsP2m5qsM9PdyB3EuUE3OL1Ld7Q+knmMeo2hpNQ5xudkVqNl
         VkVvYuSOQf7FWqNJIa0QPw7GY3Ct4huxsJ0URzIgqdS5jM0h7IiXviJM93iMaAjtV7Wv
         75RmXRr5apU3qncnPy5w3cm84MdGPDZ9sVNWwjyREqHqXool96boUx/IdgEdk1YJmwYA
         b2ozzmrqbYGKqrhk7ojfK8TNMnzGs5CCZMa4cvlECgWPmTzHIQa+N7mt/d8Kh2Iu/TjW
         MbmQ==
X-Gm-Message-State: ACrzQf1gQyve5rYSEt4jMqzzw98cSE1A4HuuuEUgM23W1nwtNzDC2xvR
	rA3Vwd5JIHFdNr+qr6dHd5Q=
X-Google-Smtp-Source: AMsMyM5sK8vks8yeD99LKu/TvT/nZWJrqvIvXzWohkOK08pjY9d2ehQSA6pozuLJKbsjtBrx+kIZVw==
X-Received: by 2002:a17:907:7d8d:b0:78d:d467:dd3 with SMTP id oz13-20020a1709077d8d00b0078dd4670dd3mr8553455ejc.547.1665611601720;
        Wed, 12 Oct 2022 14:53:21 -0700 (PDT)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id ay8-20020a170906d28800b00788c622fa2csm1857593ejb.135.2022.10.12.14.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 14:53:21 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 2/2] ARM: dts: axp22x/axp809: Add GPIO controller nodes
Date: Wed, 12 Oct 2022 23:53:20 +0200
Message-ID: <9053509.rMLUfLXkoz@kista>
In-Reply-To: <20220916042751.47906-3-samuel@sholland.org>
References: <20220916042751.47906-1-samuel@sholland.org> <20220916042751.47906-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Samuel,

Dne petek, 16. september 2022 ob 06:27:51 CEST je Samuel Holland napisal(a):
> These PMICs all contain a GPIO controller. Now that the binding for this
> variant is documented, wire up the controller in the device tree.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> 
> Changes in v3:
>  - Remove "ldo" pinctrl children from new nodes
> 
>  arch/arm/boot/dts/axp22x.dtsi | 6 ++++++
>  arch/arm/boot/dts/axp809.dtsi | 7 +++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/axp22x.dtsi b/arch/arm/boot/dts/axp22x.dtsi
> index a020c12b2884..f79650afd0a7 100644
> --- a/arch/arm/boot/dts/axp22x.dtsi
> +++ b/arch/arm/boot/dts/axp22x.dtsi
> @@ -67,6 +67,12 @@ battery_power_supply: battery-power {
>  		status = "disabled";
>  	};
> 
> +	axp_gpio: gpio {
> +		compatible = "x-powers,axp221-gpio";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +
>  	regulators {
>  		/* Default work frequency for buck regulators */
>  		x-powers,dcdc-freq = <3000>;
> diff --git a/arch/arm/boot/dts/axp809.dtsi b/arch/arm/boot/dts/axp809.dtsi
> index ab8e5f2d9246..d134d4c00bd8 100644
> --- a/arch/arm/boot/dts/axp809.dtsi
> +++ b/arch/arm/boot/dts/axp809.dtsi
> @@ -50,4 +50,11 @@ &axp809 {
>  	compatible = "x-powers,axp809";
>  	interrupt-controller;
>  	#interrupt-cells = <1>;
> +
> +	axp_gpio: gpio {
> +		compatible = "x-powers,axp809-gpio",
> +			     "x-powers,axp221-gpio";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
>  };
> --
> 2.35.1


