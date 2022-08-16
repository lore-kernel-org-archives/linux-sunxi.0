Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77ED33CC
	for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 09:57:35 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id v2so14223277lfi.6
        for <linux-sunxi@lists.linux.dev>; Tue, 16 Aug 2022 02:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=J81JV8hikPsZojzsvlP6ILAJmYNXwPnWvXa+KmRWS0Q=;
        b=jQQ+eLT7HYQLMb9V/o5Ded/h8BWxCiDtI/PoG0ObjjGccnrgEph81/L11DMGNa5VSx
         iSsWR3L/RelHi1s7Hy6B/ms0E7wFYWjJgftDMTEpCF8Oc2aGCvnlhgjAYuWe9204VNrT
         h58IUY0eTvayl5HBu8vWSfh0g5DkPWiKseWZzyVL9BM1bWMEVlZQqtaAt4afXf12Ln+7
         J2IFswj4RWJXN3bBRKggBFgCGCF3USyAVfbyZGVfqAPY3q89DJxMhvQJSQ2Qc2ZpyZ5p
         Diqfrbo52SaMc5Pw2DMYrZd2Ju2RGqbVrmyq4QzdJYVHTcA0yj1pYu1Up4dHUIiEZcmI
         EgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=J81JV8hikPsZojzsvlP6ILAJmYNXwPnWvXa+KmRWS0Q=;
        b=cJ1BCcSo9KnkEzJH1U7AQlDawOdAn2HEaBXNdZBheMOqNwas6wkyu4s0eHZdbw1A4i
         GRgqwFKLYazTsrATXmaH4Lzjtwq5lDVmq7b6dDBWHeCtBAFJ+EAh39VPVFK3vRdhwger
         esEn7tEQ5JLoo41UtIzRDLVhUiOz1NOsK9ehu46nicLefNh7iL8oUpwrVIfwW6/kITea
         3Y4iPn1Rbe8SqlS31AzLDvWoTzND0aG7E2bUz5U4Eh2IoZhnfGSVCJIBfIE/0JnKACy1
         buuR45pUDf5X6HOjAly99gIQ4zNMhAz+A3DK0JlHT6lEbOXTMV+Iy+n+2PkrM8tX5bLt
         p2Lg==
X-Gm-Message-State: ACgBeo2JNWDm8W/iE1ntQpqZVbbhQx2MrCCD+7zX8YAwXbSV7QhWDFUY
	37VZiCUqxZCVF7RNSxY61kH91g==
X-Google-Smtp-Source: AA6agR5BXtY+i9FUTQzbBUsXLd2vZVPfTFvV7zCU6pC5DN18tLDE/qWfQ2L1Ip3a8zZIsZ8WLZHO7A==
X-Received: by 2002:a05:6512:c19:b0:48a:f3bc:5537 with SMTP id z25-20020a0565120c1900b0048af3bc5537mr6670576lfu.490.1660643853696;
        Tue, 16 Aug 2022 02:57:33 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id h4-20020a19ca44000000b0048b0aa2f87csm1335298lfj.181.2022.08.16.02.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 02:57:33 -0700 (PDT)
Message-ID: <3b5358e3-9ba6-49a8-fa37-da237ba56ddb@linaro.org>
Date: Tue, 16 Aug 2022 12:57:31 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/4] regulator: dt-bindings: Add Allwinner D1 LDOs
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20220815043436.20170-1-samuel@sholland.org>
 <20220815043436.20170-2-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220815043436.20170-2-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/08/2022 07:34, Samuel Holland wrote:
> +  reg:
> +    maxItems: 1
> +
> +  nvmem-cells:
> +    items:
> +      - description: NVMEM cell for the calibrated bandgap reference trim value
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: bg_trim
> +
> +patternProperties:
> +  "^(a|hp)ldo$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - nvmem-cells
> +  - nvmem-cell-names
> +
> +unevaluatedProperties: false

one more: this must be additionalProperties:false, because you do not
reference any other schema in top level. Same in second file.

Best regards,
Krzysztof
