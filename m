Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBE32565
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 08:29:28 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id l12so4603752lfp.6
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Nov 2022 00:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+G+Z3fRjw+YmVPah8QnDEbPwrQNevzGVNtku2Zteqko=;
        b=p/Ivu84VjaM2s6AOOjS2hGlpuazO2Ifv/qX1ZLT5UgyP37/xADglycLuhgfyqSjppS
         a85YRL3hjoYVYNjpEANZEBQw4A3ra2/S7Lx6eI6Jxqdk0+oqUWkAK5LDMKqRGsEMPASK
         9X+itdiBrXDbpxpEPygy9iOHvWAk9xvIVOpGy2sVlc1/Un5ZBNaOP5Xuej51L9khne6P
         jz8jfGaPMEzTRoSyt7ACKf3kXdxiFGoj3PnGkfjAY3/uVsdBpoB7DevdXZDv9Z+m9dxa
         RBnjjk27Yt3Mbme5DRNBNyc+yAG6pQaAJrXQIx4t7K9kfoYc2emH1pPLWY+fPCjEb9JP
         TpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+G+Z3fRjw+YmVPah8QnDEbPwrQNevzGVNtku2Zteqko=;
        b=chpzg9Hy0hxAAOfU2lPp//5fXerc3SsHfQzlNS3mM0rwiEHBkH+KYB8oI8NyKyTI9x
         kwi3hkzjGqbiPlMs4L6ITMJzO0+2JidH+s91Z7kCMIcf0kbHZRmwZvRqLpnl6+sfC8WE
         3DwON+CUCc5VimfZ2Gs9g6TLLsIxsgF64ADJvNt6lzwzk11ZdO1BDm/V0XB0F7JINJnJ
         2ezzvzZJt34pyw7yL/97CpjqBaiLTgPtwGzc37pB5BpGcZG9rl9TpkXlyRXa6C39PqCf
         VamEu4DXJ2poc4EHFmyXBg+uLLeM6V5r9XyBxScL/qRnl1c9AxREFizIeQy3Ei/y4z0S
         XhXg==
X-Gm-Message-State: ACrzQf1pXm/NUPrLRWt0RYvn0RvcCEobjAu6PW1yojnMzbV7BUZI2iI8
	NitxuJ4oQi8AXaquEew+X2Fffg==
X-Google-Smtp-Source: AMsMyM4itr+2Ipxo0hSi6ESJOXGaPvYia4F+z40sfL+6uusvTHsZiF9bFWl1BTOgHUrh5IA2WU92fQ==
X-Received: by 2002:ac2:5dd5:0:b0:4a2:2960:a855 with SMTP id x21-20020ac25dd5000000b004a22960a855mr18201090lfq.399.1667809766713;
        Mon, 07 Nov 2022 00:29:26 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id a17-20020a056512201100b004a26b9cea32sm1114789lfb.271.2022.11.07.00.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 00:29:26 -0800 (PST)
Message-ID: <334c5f69-2f25-aeb1-b87f-500cf2a6c205@linaro.org>
Date: Mon, 7 Nov 2022 09:29:25 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] arm64: allwinner: a64: add device tree for SoPine with
 clusterboard
Content-Language: en-US
To: renze@rnplus.nl, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
References: <b3b8320f0d2b54a0557331977582d05c@rnplus.nl>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b3b8320f0d2b54a0557331977582d05c@rnplus.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2022 22:40, renze@rnplus.nl wrote:
> The Pine64 clusterboard needs a to have the tx delay changed to
> 500ps for ethernet to work. This solution was described by multiple
> people on the Pine64 forum years ago and nobody has submitted it.
> 
> Add a device tree for SoPine with the clusterboard.
> 
> Signed-off-by: Renze Nicolai <renze@rnplus.nl>
> ---
>   arch/arm64/boot/dts/allwinner/Makefile                 |  1 +
>   .../dts/allwinner/sun50i-a64-sopine-clusterboard.dts   | 10 ++++++++++
>   2 files changed, 11 insertions(+)
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

This does not look like matching indentation of other entries...

>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
> diff --git 
> a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-clusterboard.dts 
> b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-clusterboard.dts
> new file mode 100644
> index 000000000000..6f8020a22670
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-clusterboard.dts
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (c) 2022 Renze Nicolai <renze@rnplus.nl>
> +
> +/dts-v1/;
> +
> +#include "sun50i-a64-sopine-baseboard.dts"

You miss compatible and model. You need to document the compatible in
bindings (just like other top-level).

> +
> +&emac {
> +       allwinner,tx-delay-ps = <500>;
> +};

Best regards,
Krzysztof

