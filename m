Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A156EA6
	for <linux-sunxi@lists.linux.dev>; Thu, 28 Apr 2022 07:19:27 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id gh6so7813690ejb.0
        for <linux-sunxi@lists.linux.dev>; Thu, 28 Apr 2022 00:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hAwV6IwbsKz6TK9I885ngU6STlgFg8jvqLzasreFMNs=;
        b=WWwtGR1t+tANDRVUo2TR9pMIModlr36I6OZLqGl0IETtQs0/rjC/uYLMlRDkNsP/eV
         2LXgsWIHL4XoHJpA14V2wkclfUNarpzbFHOEz5wVWsgrP4nikVJrpJCNjE8mKDsGTFLw
         uK2Raf8hS5WSmUAFPOeazZauXSjK7IF23+ltIA782RBeUZ3fAXByLWdr9VCPokU8LL0b
         XWv6Q4h0jEO0vu8zL62L2mTknqmb9UlvmCWNrshhxplOVVfLIttvt+RvTujsEVk+ZSQ2
         u1GIGtOx5ShFMR94uP8k6dKaqrvTsFRmr1ufo8PNJf6HZTqRkEFSLXKsDhE2TfcRIDSL
         muYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hAwV6IwbsKz6TK9I885ngU6STlgFg8jvqLzasreFMNs=;
        b=4VX3v8e0Kt2VKMXEAGuWatS9GqqgidL+sma/C+vRp1FXQLjnFK3rher/x/k2jSDsn5
         z0Fg/I2YWoRVHM50k5bj/2jbXLw+k2H6GWDmRjs+mz2nKJbY+NJyHA01PvGMJTnRTg35
         1FFNDdG9VNMTueaSrQv92e4yFe3DyulRWDcGie5RRHM8nRyzj2Dvut3YriyacjVAoWyz
         HR+foF9sy5ChtvtMU2O9ge+I5KPcJ0tqp1Y1AzMnTa6dbkTaH5I7Y8xH4W0COUzCEIki
         78mA57JeoW3vfUxsahvTKCl0u8uIsnhlOiqbezRqNT35y0vYQaCTNo4srImDdXW9iYbD
         UMbw==
X-Gm-Message-State: AOAM531onFZoxZOel/PZVS7gIvskrnmxmbhyEB6qv8eiEo2PM/2Q6/6j
	PbJlAsPyezY+CI2AN1bvjkxaEg==
X-Google-Smtp-Source: ABdhPJzKq+YlOiDMLykatXEFb35oBzrQM8EqzSpwuebdQwET0rBneBiC/nW+dHlQKkRccdp/GtUgfg==
X-Received: by 2002:a17:907:1623:b0:6e8:8678:640d with SMTP id hb35-20020a170907162300b006e88678640dmr30461002ejc.189.1651130366356;
        Thu, 28 Apr 2022 00:19:26 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l2-20020a1709060cc200b006d3d91e88c7sm7892815ejh.214.2022.04.28.00.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 00:19:25 -0700 (PDT)
Message-ID: <9dab1216-83fd-fd05-abe2-57371e365027@linaro.org>
Date: Thu, 28 Apr 2022 09:19:24 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/5] dt-bindings: iommu: sun50i: Add compatible for
 Allwinner D1
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org
Cc: Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20220428010401.11323-1-samuel@sholland.org>
 <20220428010401.11323-2-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220428010401.11323-2-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/04/2022 03:03, Samuel Holland wrote:

Thank you for your patch. There is something to discuss/improve.

> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - allwinner,sun50i-h6-iommu
> +
> +then:
> +  required:
> +    - resets

else:
  properties:
    resets: false

>  


Best regards,
Krzysztof
