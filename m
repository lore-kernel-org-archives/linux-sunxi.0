Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977801108
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Sep 2022 10:59:25 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id a3so2205415lfk.9
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Sep 2022 03:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=CMrXYaGd9ZuPwxoNdr3XH/ga8t3rjLvzGOmRkyTn3g4=;
        b=EewBJK9lJIVVIFZKkl8dLluz2Rdy1ntj1KjhRquGAFJS+M1ds/Xwvtbd+2yebKnSY/
         d3kTQ+Vz1KIH4DhRg8Cw8xACvbVVXAsvID4WBMm/nkUZP2npSatCoYOXaRoa9kc/Tkt7
         /topHc7fSV4h6p58PvDBiDHJNpY85eULd6TZwcJN44bJW16l4EgHp2oBXlYwVLpZMI5H
         XmtjwOs8q7SQxC/rUL8HwxjfrquHiU6zH+RK6YFhHltQFV5gNhNeW+VNoqh438fAl01q
         yzTFzxjOVwTsCnebCWWYsziqICUrMR8b9sPuf3yg7UzElZ7936iArGpJJkMOlTHMkQqM
         wdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CMrXYaGd9ZuPwxoNdr3XH/ga8t3rjLvzGOmRkyTn3g4=;
        b=dfcl5rQ4YhJVCTH13gPJ0JmRB17DNZDxkgeIxUt2/ouWcWO66uls12KRjry0arHCQo
         d1pBCxUa1WZNe5ULBiOYHK1slE3fO6Z5WW+WbqvE2JevbPr2rnjuMTQ5ACAb2M/iACxS
         R8AqjW2KqN7bL/1Qgo/bo9HoZtMMP8OPW2VgqTxSu5GJhQk+kN7k1DEL8QMkKX+LZKb/
         JQB0RuZ4rzVbKp/Vt3r4LJ0mqRSzrgSQ1cNXi8a61eKcVBGl/JCDon8I8h1w91zrMS8z
         w6yghcI32W3B4vl4JQVrsm4kSm6Z/7O9IJ8KcT8K7Rggrw5VLONqjV8N35h+LVQY5IOS
         W/KA==
X-Gm-Message-State: ACgBeo2ASU/486RCv8FoT4s9rKhHGktJDxSQ2PODZSL2sIf6kc4iu0/1
	mCyLFOkWTYqHwfJGigAHEnh3kg==
X-Google-Smtp-Source: AA6agR79u4VfbHvM2AGUDo4UiTk9vFf7uaAXP5srMfNWlWtZd7B/cZLyZS3VkamXHLZWSSjOiS3nkw==
X-Received: by 2002:a05:6512:409:b0:49a:eadb:5ec9 with SMTP id u9-20020a056512040900b0049aeadb5ec9mr622074lfk.253.1662980363641;
        Mon, 12 Sep 2022 03:59:23 -0700 (PDT)
Received: from [10.129.96.84] ([109.232.243.34])
        by smtp.gmail.com with ESMTPSA id be30-20020a056512251e00b00492a0f02758sm1009117lfb.28.2022.09.12.03.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 03:59:23 -0700 (PDT)
Message-ID: <b372688e-8e4c-f726-667f-b79f1bb2bca9@linaro.org>
Date: Mon, 12 Sep 2022 12:59:20 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/7] dt-bindings: usb: Add special clock for Allwinner
 H616 PHY
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Karl Kurbjun <karl.os@veroson.com>,
 Icenowy Zheng <icenowy@aosc.io>
References: <20220911235945.6635-1-andre.przywara@arm.com>
 <20220911235945.6635-3-andre.przywara@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220911235945.6635-3-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2022 01:59, Andre Przywara wrote:

Thank you for your patch. There is something to discuss/improve.

>    clocks:
> +    minItems: 4
>      items:
>        - description: USB OTG PHY bus clock
>        - description: USB Host 0 PHY bus clock
>        - description: USB Host 1 PHY bus clock
>        - description: USB Host 2 PHY bus clock
> +      - description: PMU clock for host port 2
>  
>    clock-names:
> +    minItems: 4
>      items:
>        - const: usb0_phy
>        - const: usb1_phy
>        - const: usb2_phy
>        - const: usb3_phy
> +      - const: pmu2_clk
>  
>    resets:
>      items:
> @@ -98,6 +102,21 @@ required:
>  
>  additionalProperties: false
>  
> +if:

Please enclose it within allOf: block. Helps to reduce indentation
changes later when this grows.

> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - sun50i-h616-usb-phy
> +
> +then:
> +  properties:
> +    clocks:
> +      minItems: 5
> +
> +    clock-names:
> +      minItems: 5

I assume other variants do not have this clock? If correct, then:

else:
  clocks:
    maxItems: 4

and the same for clock-names

> +
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>


Best regards,
Krzysztof
