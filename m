Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4BF7C
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Aug 2022 08:29:20 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id z25so18130378lfr.2
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Aug 2022 01:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=LlRoK8GCouttuQaBiu3XZNyJMKx9NckoSxJlAPIv4MY=;
        b=BNa4kzN4tStk2kyeoWATpkWYOOrU/u42HkDaDm2RyGzskUGA1OS98DKDu1ZO8TeyAc
         BHlGTLFvooBdLrQ7bsGjHyYLXjT7U/XTPw5XtNXVB4DmN/k3ooISitVoSvRIe0jo63MY
         lCcg1xcDs63reLeAyJgfToUbtlbtP1e/bJcsgIb9/ZFKekQUywKC+kfTTRYYfXkQpiVa
         GBXTd4Fhe8jOx6NHT4i8DvZN66P846rCuttcsOqO2aigTpUnw0k/d/vy7Kragknk0xEl
         +uTxBH1xVZUqPd1mz5kYCWkyV36LyiV5EWF/Ik0hqjJXCxdqwHlu2ac1m7hso6chDzRi
         QFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=LlRoK8GCouttuQaBiu3XZNyJMKx9NckoSxJlAPIv4MY=;
        b=LXjkKcS/3ycP2KXaAVGye5n7mUIAUZ4aBxNI+n4ijAANGVzzdL1SAh6LEPNvJRk36+
         Hsx2DDnX2aCa16A+XPLHhe5qRL5nEIMfVO9/w1k4v5Dl9xLkY6YO51RMlHhgWxwmd9Dl
         ji0Z5jUrgNj6dvO++GSwLlugj4ZCaG599uzAEWx2r+A5DnimqSN3q4Ymwr+n9vR6wb10
         DgByRVzT+ic7klv+aqKCgiw5uK2moCPzEGd8+XnE3Ufg9+RRp7cw0r3mR17zd+1wRb34
         Y/TIp2GqrpLOpR0x4KFs05ujvsAaPY+guQevubZTz11Pt2DyiNc2m1dlLRmLk3IQHroA
         PoAw==
X-Gm-Message-State: ACgBeo1AaHAnLDGMkn0sRJCYmz7cTOLPVT9QF9/pMBvDnEnTZJd76X9n
	3AVoHCj/42lOEbZwZ4/8E9n6qg==
X-Google-Smtp-Source: AA6agR4HHYiX+08ES6ynJULFRUES7PlCFeft6BMZRI/rn6fM+kl/t2dpDlDozOXX4PW1JsquPkATig==
X-Received: by 2002:a05:6512:3e0c:b0:48a:fdb2:f1c4 with SMTP id i12-20020a0565123e0c00b0048afdb2f1c4mr9470671lfv.379.1660724958883;
        Wed, 17 Aug 2022 01:29:18 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1b1c:14b7:109b:ed76? (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id e7-20020a05651c038700b0025df04af0f0sm2123207ljp.51.2022.08.17.01.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 01:29:18 -0700 (PDT)
Message-ID: <f9729b31-c487-ea0a-d329-2efb7765d5fe@linaro.org>
Date: Wed, 17 Aug 2022 11:29:16 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-7-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220815050815.22340-7-samuel@sholland.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/08/2022 08:08, Samuel Holland wrote:
> D1 is a SoC containing a single-core T-HEAD Xuantie C906 CPU, as well as
> one HiFi 4 DSP. The SoC is based on a design that additionally contained
> a pair of Cortex A7's. For that reason, some peripherals are duplicated.
> 
> This devicetree includes all of the peripherals that already have a
> documented binding.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

(...)

> +
> +		codec: audio-codec@2030000 {
> +			compatible = "simple-mfd", "syscon";

This alone is not correct. You must use device specific compatible.

> +			reg = <0x2030000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			regulators@2030348 {
> +				compatible = "allwinner,sun20i-d1-analog-ldos";
> +				reg = <0x2030348 0x4>;
> +				nvmem-cells = <&bg_trim>;
> +				nvmem-cell-names = "bg_trim";
> +
> +				reg_aldo: aldo {
> +				};
> +
> +				reg_hpldo: hpldo {
> +				};
> +			};
> +		};


Best regards,
Krzysztof
