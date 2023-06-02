Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B6353A0
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Jun 2023 08:38:27 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9745c5fed21so107673166b.3
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Jun 2023 01:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685695106; x=1688287106;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pPYsqCw+S4frzdamGly3+8lmKwz0DvRF1BFqk4pDJOk=;
        b=OAdnQ1kBlBpFTnXu6dS3B59LrW5AVp8ZcAJsAfNCUqiphvo3vuLfQ2jQojKHK8uIu+
         mkYHn25y1tDmdVsZEYIACwOPC1mChfuvNucUnrQPPJYoWH90zfogqm1WlPjHFhLiHvDn
         zUejvooWWmDBxSVkq1+jelu+5yBDbIxrA7qptcGtSrCXHkPoMcGKltkB6InEmFYlqKip
         qVkl3R/iTD3QMkpIskH6E5HD5IpLSLYkBnXw33jvZnnPkTX21eTThiXpXwAOcZA4tuSD
         yHV3IG9eobPhR60HzBNIBtqxsECxUBM6oLTe+nAgdWiMxlGTuKuud6NJA5A2fJHNyieV
         MBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685695106; x=1688287106;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pPYsqCw+S4frzdamGly3+8lmKwz0DvRF1BFqk4pDJOk=;
        b=EQ49nE3ZhHGSKzGETohbATR9MNiBiSdkIWUmxU+gS+E31qK+cMJtxzprvVNWdyJaU9
         MqRCNYzSjYhXIitiKqm7idTaSw8/uQ4buh+izjUcPsiJcq1NawFavi1cPXKW1/wZ58Kd
         3lXgt6JxzzDKCT9QVv0VPJbK2gYJjYbagS2PvMWIWu4N4kwSVmcq0sU8myYpAu3134Ph
         Ce2qZ6nBFZrHeO691BR77A3kPk69G52XVmuT619lEKUq4yIL4prWgchHJqhA1vXhJeXG
         X70WoTJV4bIfB4oAfLZIGo094kQ89VieFv5iRLBeijMbDZ+9XYdeXTZpxjKKF2crFxyO
         ChFg==
X-Gm-Message-State: AC+VfDzHwpEcoyMEDjNFzWwflMPdiCfdaNyDOw5QWq8BPB9VWFWLxvGn
	Z+P/WrtoGziMFzwCY4k7vcX5nQ==
X-Google-Smtp-Source: ACHHUZ7U7Nk9Xfw9ScoLkNnQ7voAB8/uUOjSN+gFT7/29x62vxLDRSi2u8Ebdcr4cCP2ctPddFy3iw==
X-Received: by 2002:a17:907:3f14:b0:96a:5e38:ba49 with SMTP id hq20-20020a1709073f1400b0096a5e38ba49mr12594130ejc.2.1685695105825;
        Fri, 02 Jun 2023 01:38:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id h19-20020a17090619d300b0096f641a4c01sm472053ejd.179.2023.06.02.01.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 01:38:25 -0700 (PDT)
Message-ID: <fbcc5688-387c-32fb-edac-17848c92b936@linaro.org>
Date: Fri, 2 Jun 2023 10:38:21 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 2/3] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329/T507 SoCs GPADC
Content-Language: en-US
To: Maksim Kiselev <bigunclemax@gmail.com>, linux-iio@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Cosmin Tanislav <demonsingur@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 William Breathitt Gray <william.gray@linaro.org>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Mike Looijmans <mike.looijmans@topic.nl>,
 ChiYuan Huang <cy_huang@richtek.com>,
 Ramona Bolboaca <ramona.bolboaca@analog.com>,
 Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 ChiaEn Wu <chiaen_wu@richtek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230601223104.1243871-1-bigunclemax@gmail.com>
 <20230601223104.1243871-3-bigunclemax@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230601223104.1243871-3-bigunclemax@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/06/2023 00:30, Maksim Kiselev wrote:
> From: Maxim Kiselev <bigunclemax@gmail.com>
> 
> Allwinner's D1/T113s/R329/T507 SoCs have a new general purpose ADC.
> This ADC is the same for all of this SoCs. The only difference is
> the number of available channels.

Except that it wasn't tested...

> 
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
> ---
>  .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
> new file mode 100644
> index 000000000000..94f15bb48231
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: GPL-2.0

dual license

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.


> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/allwinner,sun20i-d1-gpadc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner D1 General Purpose ADC
> +
> +properties:
> +  "#io-channel-cells":
> +    const: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  compatible:
> +    enum:
> +      - allwinner,sun20i-d1-gpadc

compatible is first property

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - "#io-channel-cells"
> +  - clocks
> +  - compatible
> +  - interrupts
> +  - reg
> +  - resets

required: block goes after all properties.

> +
> +patternProperties:
> +  "^channel@([0-15])$":
> +    $ref: adc.yaml
> +    type: object
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      Represents the internal channels of the ADC.
> +
> +    properties:
> +      reg:

> +        description: |
Do not need '|' unless you need to preserve formatting.

> +          The channel number.
> +          Up to 16 channels, numbered from 0 to 15.

Don't repeat constraints in free form text.

> +        items:
> +          minimum: 0
> +          maximum: 15
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false

Hm? So you do not allow anything from adc.yaml related? Are you sure
this is your intention?

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpadc: adc@2009000 {
> +        compatible = "allwinner,sun20i-d1-gpadc";
> +        reg = <0x2009000 0x1000>;
> +        clocks = <&ccu 80>;
> +        resets = <&ccu 32>;
> +        interrupts = <0 57 4>;

Use proper defines

> +        #io-channel-cells = <1>;
> +
> +        channel@0 {
> +          reg = <0>;

Broken indentation.
Use 4 spaces for example indentation.

> +        };
> +
> +        channel@1 {
> +          reg = <1>;
> +        };
> +    };
> +
> +...

Best regards,
Krzysztof

