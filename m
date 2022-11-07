Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DD315AD
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 21:39:53 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id b2so33708805eja.6
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Nov 2022 13:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWppGLhyRbk0twcMAe1fFy3XdHnUGasdqpAlH5c197I=;
        b=BY8RcMc9oenknF5UieWwhxCKspnvAyK4KI638WUeKiYt+pUT1gsmRNZHw3ahjNFKPu
         SIFxyprUdLaoluN5Amon3TdTLLfVDr8QNivMgNSq1kNKM08nba9X194a24McafGI6XQ4
         GdrjjoaPyr6+3W9V2fulejJCfmaenZTTmBOYcRsgoYa3dslyiK9YvGFRAjQCPD0BoGJS
         ZA3r14KVlBAOkDmOo+yM915L6g4rZjLGT2LvWUXQbmSsBbVsO7/J4YViDNh6WTcEVEBy
         uCDsOG+v+IKLHze7qN0q8PTQOSzgNGJGCR016ia3sZyrRkOTITnRCSYbYCLoD0gYtLws
         z8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWppGLhyRbk0twcMAe1fFy3XdHnUGasdqpAlH5c197I=;
        b=vzSRdiiqWOCA1jWxNYGhWxZs4LgNKbRaQrbIs20yHC3PW5ycB5OA30cGCH7fO4CLQP
         XTDbfZIXRyCUfWrD/Hfj2dulkB9tZ7CZWa4M2qdYHa6P6DLFghfU3pTcgAbdZsPQykKx
         kVXJnZVQls5rb+8VI/5AErU9xRYy6QwHdZ3HgSlONwZVti3OrBWx45+yiTqAUnk3ADj8
         hv8CYbXv1pMvuJ1T4lhSScPPVn4Hx9mrrKhk8GNVtgGCmiHv85KlZsr/RmVhIU0CA2tY
         n85NgtPCBrhCUGNJDW1SdtMWkb7yodzDqUoYdNzPXb58nqUgh7Xf+n0ICSUiVK8Nxe6E
         UKHA==
X-Gm-Message-State: ACrzQf1J1ch64NoKdGu/uEIYCscJuTbSKw9EXaBwk0z0ulriAlx0WIN1
	hZETRn2MlxefphTxT77Rqbo=
X-Google-Smtp-Source: AMsMyM4Kv6wnMGpf32QajhqCSVNKnlD7xXpfKe/1VaxQW5a3xhNU78Ryn3zVFVJbmdzmzD/0FnxyWg==
X-Received: by 2002:a17:907:3e01:b0:730:a690:a211 with SMTP id hp1-20020a1709073e0100b00730a690a211mr49594056ejc.596.1667857191997;
        Mon, 07 Nov 2022 13:39:51 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906310100b00773c60c2129sm3954556ejx.141.2022.11.07.13.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 13:39:51 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Renze Nicolai <renze@rnplus.nl>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2] arm64: allwinner: a64: add device tree for SoPine with clusterboard
Date: Mon, 07 Nov 2022 22:39:50 +0100
Message-ID: <3166097.AJdgDx1Vlc@kista>
In-Reply-To: <c2523181268451aa04a2474a2cf5bedb@rnplus.nl>
References: <b3b8320f0d2b54a0557331977582d05c@rnplus.nl> <334c5f69-2f25-aeb1-b87f-500cf2a6c205@linaro.org> <c2523181268451aa04a2474a2cf5bedb@rnplus.nl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 07. november 2022 ob 21:55:04 CET je Renze Nicolai napisal(a):
> Hello Krzysztof,
> 
> Thank you for your feedback! I've fixed the indentation and I've added
> the compatible and model elements.

You didn't document compatible in bindings as instructed by Krzysztof. That 
should be in a patch preceding this one.

Comments like this, which are not part of commit message, should be either in 
cover letter or right below --- line, so they are ignored when patch is 
applied. While above comment can be considered as changelog of sort, it's 
preferred to write it as list, point by point, in area which is ignored when 
applying patch.

I guess you don't use "git send-email" to send your patches? New versions 
should not be send in reply to old ones.

> 
> Greetings,
> Renze Nicolai
> 
> 
> The Pine64 clusterboard needs a to have the tx delay changed to
> 500ps for ethernet to work. This solution was described by multiple
> people on the Pine64 forum years ago and nobody has submitted it.

When you're adding new board, commit message should describe new board either 
by stating features or telling which board is similar and what are the 
differences. Something like that clusterboard is almost the same as baseboard 
except ethernet TX delay, which is 500 ps. Omit second part of second 
statement, it's not relevant.

Best regards,
Jernej

> 
> Add a device tree for SoPine with the clusterboard.
> 
> Signed-off-by: Renze Nicolai <renze@rnplus.nl>
> ---
>   arch/arm64/boot/dts/allwinner/Makefile           |  1 +
>   .../allwinner/sun50i-a64-sopine-clusterboard.dts | 16 ++++++++++++++++
>   2 files changed, 17 insertions(+)
>   create mode 100644
> arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-clusterboard.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile
> b/arch/arm64/boot/dts/allwinner/Makefile
> index 6a96494a2e0a..15b011d1aaea 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=
> sun50i-a64-pinephone-1.2.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab-early-adopter.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-clusterboard.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
> diff --git
> a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-clusterboard.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-clusterboard.dts
> new file mode 100644
> index 000000000000..f75325d43d76
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-clusterboard.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (c) 2022 Renze Nicolai <renze@rnplus.nl>
> +
> +/dts-v1/;
> +
> +#include "sun50i-a64-sopine-baseboard.dts"
> +
> +/ {
> +	model = "SoPine with clusterboard";
> +	compatible = "pine64,sopine-clusterboard", "pine64,sopine",
> +		     "allwinner,sun50i-a64";
> +};
> +
> +&emac {
> +	allwinner,tx-delay-ps = <500>;
> +};
> --
> 2.38.1


