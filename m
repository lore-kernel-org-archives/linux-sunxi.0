Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBAF7B
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Jan 2023 09:21:08 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id z16so737976wrw.1
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Jan 2023 01:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uAfhATkIYXFpgazLFZ+AK9Lq1o03ZdKMm34LM7SHmEU=;
        b=f1UmUxyILCnWGJP6qQZ7GcSBmaoU7z3kYlpph2vCbELXC7Xz7KHHFFxp+kUamJ+2t9
         dm3GhM0EF/kBYDcV4aolDZWukCmIZLXLm0S/7lOnmYDmfWx2bXT8IAoB5M2ySYkW81R6
         OwqTPM8Mmz+pvtNjtE08dy7FSYk83CiICoZ3T0XbLHiHP2uCmXSJx8dpH5opGReUsrBT
         +ZdwGnyizkf+X3ghhIckgWqo99alISOiAjxja7b54BzRqLLQC08qLJ3JV75Owq/K5Cnu
         KEx8+jwyEyu1XmrqlWoxhgk6SsExL+WZ+xYT05K+Yj5/p26r54DSCHzJFSvFUdQ92zBQ
         dzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uAfhATkIYXFpgazLFZ+AK9Lq1o03ZdKMm34LM7SHmEU=;
        b=a+INUbOpXWMrCuwRNMytrSySwNzRpboXBjFsZZmd2Dz0oAO+vWqTGIgbKr1nA9XkXi
         WTvIKAYfIjaPHL0RcoI1Do0/4tJ2sGaFT1g/bPK+j7Oe/e8ogixdPzqo/ufPh9H9U1l8
         A70SNKMRZvtGN+/w4n5qpXE5+wkNuWKIZJThhDm+rxssJX8hBW3Oie0grJG1UpH84lTS
         D+FsQ9V8yGu/JmtRUGRn/UVlqExQ7knKrnXDSmknjzb9v+ROMf4hmZd5WnGEKUlRDiHy
         pol0uqtOwZmuUlLb1UzK3rps4fKL4TPmrcYepapE4QG0W6BrvO/JCGbV7F5xrfj+pKdc
         ZIZw==
X-Gm-Message-State: AFqh2kqvHC3gpxa388P8JdJGCNhS+TVZinSBNDrHnJvslq+kShq2f9rh
	ADjfSrt5WvWQheYrmKN+EU0+5Q==
X-Google-Smtp-Source: AMrXdXu9fepmPpgEfQ6cshSmsZ+6857dtpUM6/8+Vafn1HbdY34/Rzfs18skEvxTNG6/20H2UhzJ3Q==
X-Received: by 2002:adf:dec7:0:b0:242:115d:bee4 with SMTP id i7-20020adfdec7000000b00242115dbee4mr32938927wrn.16.1672996867159;
        Fri, 06 Jan 2023 01:21:07 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z8-20020a5d6548000000b0028df2d57204sm689153wrv.81.2023.01.06.01.21.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 01:21:06 -0800 (PST)
Message-ID: <4d6aec55-c53e-0aba-1168-8a9a80a3b598@linaro.org>
Date: Fri, 6 Jan 2023 10:21:04 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/4] dt-bindings: arm: sunxi: document MangoPi MQ-R board
 name
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Icenowy Zheng <uwu@icenowy.me>, =?UTF-8?B?QW5kcsOhcyBTemVtesO2?=
 <szemzo.andras@gmail.com>, Fabien Poussin <fabien.poussin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230106010155.26868-1-andre.przywara@arm.com>
 <20230106010155.26868-4-andre.przywara@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106010155.26868-4-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/01/2023 02:01, Andre Przywara wrote:
> The MangoPi MQ-R board is a close relative to its Allwinner D1/D1s
> siblings, but features two Arm Cortex-A7 cores instead of a RISC-V core.
> 
> Add the board/SoC compatible string pair to the list of known boards.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index 3ad1cd50e3fe0..ce445c5ed81c8 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -843,6 +843,11 @@ properties:
>            - const: wexler,tab7200
>            - const: allwinner,sun7i-a20
>  
> +      - description: MangoPi MQ-R board
> +        items:
> +          - const: widora,mangopi-mq-r

Not documented vendor prefix.

Best regards,
Krzysztof

