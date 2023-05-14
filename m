Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C3BED1
	for <linux-sunxi@lists.linux.dev>; Sun, 14 May 2023 09:53:11 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-50bd37ca954so102774099a12.0
        for <linux-sunxi@lists.linux.dev>; Sun, 14 May 2023 02:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684057989; x=1686649989;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5td1zFzjwswdtQUzZm2qAYTb8ma7e15DGPOsN8yybJM=;
        b=l7IkWqf7it6z5yyMPRfguVicyVGXYVQQqJACIRbu6caKtShQVVJWXDGnE7qzDKr1DT
         1pqkEOQSZAYQAA5pvFvInzyzyQENqajcbE/fEKlfdA/512f/ItLq07GwfBHC09jHmfGU
         lAbJHoW2UNaRdRPxB7/SF/0mRs08zL0ZwilP/SfneLADWKPbi3B3vocLbfYwYfc3stvU
         dBiVPVAM99DEyLRC1LeDFaPGjKI7E4FL9BSHWEuCRBGDZlABiUUEPpwvZImLshoUQT+L
         /XRs3TYZmSJzfKRUf7vpfrs4wP9TpXkVLXc8FLWNAVXNIiqdJz1gn+B2I4RWJawxPMRo
         yqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684057989; x=1686649989;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5td1zFzjwswdtQUzZm2qAYTb8ma7e15DGPOsN8yybJM=;
        b=PHHPUJMiKYFMnBeo35y9TbIj2ZrJhsJVqBczpnco9zzK/BRS0+woOJJkiw0QP/XOl8
         eYJYwrHrbfttDz+1J4bGkjEKHyuWy3rIAVLzX72MqP8ySmO0mT4/LxQyyCPW2FwjE4uq
         Z8aUkT8p5qk3IHZXV26Tq4elTGKZmpTEuozy9WUV4fZyzgEvTdrHzaolpopdJ958tUS/
         3mTITm790qWJrszaHvrRtzyoZf69zvKxJxrWcpxRJrbdI+n3JaNYN/NSOyfIEB+fgTXV
         aqkgESn8IT1YoiQI0KFnCDrFrfDWNrIo4RRnc+vzmdS1D2qUKtVL8xsTL6MoZhCT5sY1
         dVZQ==
X-Gm-Message-State: AC+VfDyog0NnYq/TQM23qG106Ypz7vNoQ/jKF1JuNMeEPCLIcTEYz0Wb
	OtVyHuku4EAtVpzdlk99Btq7JQ==
X-Google-Smtp-Source: ACHHUZ6CkXWd/pZpqvfVoXJ5tZLiTdhX5tO5tmv1SAUtxGzZlxT8mwVGfi0k090uOBPNv69O2GtcDg==
X-Received: by 2002:aa7:ccc6:0:b0:50b:dfe2:91 with SMTP id y6-20020aa7ccc6000000b0050bdfe20091mr26633387edt.7.1684057989471;
        Sun, 14 May 2023 02:53:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:715f:ddce:f2ba:123b? ([2a02:810d:15c0:828:715f:ddce:f2ba:123b])
        by smtp.gmail.com with ESMTPSA id r23-20020aa7d157000000b0050bfed94702sm5715746edo.77.2023.05.14.02.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 02:53:08 -0700 (PDT)
Message-ID: <37db7c8e-a715-61a1-159b-0ffe15f1c7c2@linaro.org>
Date: Sun, 14 May 2023 11:53:07 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] dt-bindings: net: realtek-bluetooth: Add RTL8822BS
Content-Language: en-US
To: Rudi Heitbaum <rudi@heitbaum.com>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, marcel@holtmann.org,
 johan.hedberg@gmail.com, luiz.dentz@gmail.com, anarsoul@gmail.com,
 alistair@alistair23.me
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-bluetooth@vger.kernel.org
References: <20230514074731.70614-1-rudi@heitbaum.com>
 <20230514074731.70614-2-rudi@heitbaum.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230514074731.70614-2-rudi@heitbaum.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/05/2023 09:47, Rudi Heitbaum wrote:
> Add compatible string for RTL8822BS for existing Realtek Bluetooth
> driver.
> 
> Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> ---
>  .../devicetree/bindings/net/realtek-bluetooth.yaml  | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/realtek-bluetooth.yaml b/Documentation/devicetree/bindings/net/realtek-bluetooth.yaml
> index 8cc2b9924680..d2103931fc1c 100644
> --- a/Documentation/devicetree/bindings/net/realtek-bluetooth.yaml
> +++ b/Documentation/devicetree/bindings/net/realtek-bluetooth.yaml
> @@ -4,16 +4,16 @@
>  $id: http://devicetree.org/schemas/net/realtek-bluetooth.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: RTL8723BS/RTL8723CS/RTL8821CS/RTL8822CS Bluetooth
> +title: RTL8723BS/RTL8723CS/RTL8821CS/RTL8822BS/RTL8822CS Bluetooth
>  
>  maintainers:
>    - Vasily Khoruzhick <anarsoul@gmail.com>
>    - Alistair Francis <alistair@alistair23.me>
>  
>  description:
> -  RTL8723CS/RTL8723CS/RTL8821CS/RTL8822CS is a WiFi + BT chip. WiFi part
> -  is connected over SDIO, while BT is connected over serial. It speaks
> -  H5 protocol with few extra commands to upload firmware and change
> +  RTL8723CS/RTL8723CS/RTL8821CS/RTL8822BS/RTL8822CS is a WiFi + BT chip.
> +  WiFi part is connected over SDIO, while BT is connected over serial. It
> +  speaks H5 protocol with few extra commands to upload firmware and change
>    module speed.
>  
>  properties:
> @@ -23,11 +23,14 @@ properties:
>            - realtek,rtl8723bs-bt
>            - realtek,rtl8723cs-bt
>            - realtek,rtl8723ds-bt
> +          - realtek,rtl8822bs-bt
>            - realtek,rtl8822cs-bt
>        - items:
>            - enum:
>                - realtek,rtl8821cs-bt
> -          - const: realtek,rtl8822cs-bt
> +          - const:
> +              - realtek,rtl8822bs-bt
> +              - realtek,rtl8822cs-bt

This won't work, wasn't tested and does not actually make sense.
Depending on your goal this could be added to the enum above... or
anything else.

Best regards,
Krzysztof

