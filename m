Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DAE28ED
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 09:59:54 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id a15so16809474ljb.7
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 01:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=we5icLF5qMbtdyi+O3fAzjYqkzl4E8jlaLkt16W+v8Y=;
        b=UIzFfmDJK39st7JSIT5v2XYzdCLguFhqQa4GDHWXZgztsgu4AnwMAMhxqvyiTZCKJA
         9Pddz+uMl5M3gmWWvkAQmHgbGk4v6fzwlMvb1HhuVnJWLRWi3ePD8RtR4hMHXNs0x/Q/
         g936CDTJp/vP0E4a/DXDiHvGDC52Ji6EY7CirgMQ61VDvrgWTSIXM9BS8KLPMe7ZFYnX
         AhZVmGK13uu2ppQzD9HJEodFV6Ve8+rbPRBSqr/8vtpfQTdiDvBuFQvJpB3slutHGL8+
         OYo3dF3L/EIvpNHyKii1kP7RH423eHgJhz+EVBygoO+5bfHkMiGgV7FPwRASQeWB5gN2
         c3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=we5icLF5qMbtdyi+O3fAzjYqkzl4E8jlaLkt16W+v8Y=;
        b=I/+Bpbfh1hH5Q9XlKfF68lbXpy9bI1/fsfHexXFfN3Sb8xbke6WRkO8ID/6/OzS7zP
         KG0Dj5Qm2frBSfAQZhKTK0R9TLWlQq4cg84218iABT2WGq1xAynwA7zfF5RtuBZtVRqu
         /bLT5+FMifSwX9A9ESJxU/TjHNdbcs3dZdHTuM0gNOjXC34tlW4HYaBjnwJvREqJI0t6
         K7wO5kPCW74nTbNrPznz3AXEZZTsZTPTbES5jrxDY/9GHHGM9OieHgM11iTwBi5D/Kzc
         arSKXIZltx8yymcw7BXOJt+3wyST0sE3Rk4K4eSQlKlW1HGp8+VxGzcCTucg/VucgHPG
         47ZA==
X-Gm-Message-State: ANoB5pk0+DHnmrWGXxohrtCCAbjHQLfMd0ClNUlW3l8/7YQCvQ4dZg7n
	u9lDZgNlxpjXhQsx/vNzhv4Gyw==
X-Google-Smtp-Source: AA0mqf5kKzTZwy3o3Cf4h9p/7Ric73X3MaF+6pxIjfDZhcnddYTepNSi9exl7I5gdGM8r5bEH3I+iA==
X-Received: by 2002:a2e:7217:0:b0:26d:fe34:6dc0 with SMTP id n23-20020a2e7217000000b0026dfe346dc0mr6088126ljc.477.1668506392241;
        Tue, 15 Nov 2022 01:59:52 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v4-20020a2ea604000000b0027713ef5360sm2434920ljp.71.2022.11.15.01.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 01:59:51 -0800 (PST)
Message-ID: <d88f85af-0de3-ab2a-b507-58ac3f8c5518@linaro.org>
Date: Tue, 15 Nov 2022 10:59:50 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: sunxi: Add BIQU CB1
Content-Language: en-US
To: Martin Botka <martin.botka@somainline.org>, martin.botka1@gmail.com
Cc: ~postmarketos/upstreaming@lists.sr.ht,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jamipkettunen@somainline.org>,
 Paul Bouchara <paul.bouchara@somainline.org>, Jan Trmal <jtrmal@gmail.com>,
 Tom <takuya@takuya.tech>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara
 <andre.przywara@arm.com>, Maxime Ripard <maxime@cerno.tech>,
 Andrew Lunn <andrew@lunn.ch>, Conley Lee <conleylee@foxmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221114214452.1993744-1-martin.botka@somainline.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114214452.1993744-1-martin.botka@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/11/2022 22:44, Martin Botka wrote:
> Add a name & compatible for BIQU CB1
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
> Changes in V2:
> Add compatible and name to dt-bindings
> Changes in V3:
> None
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index 3ad1cd50e3fe..d886924023f5 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -151,6 +151,11 @@ properties:
>            - const: roofull,beelink-x2
>            - const: allwinner,sun8i-h3
>  
> +      - description: Biqu CB1
> +        items:
> +          - const: biqu,cb1

Undocumented vendor prefix. Did you run checkpatch?

Best regards,
Krzysztof

