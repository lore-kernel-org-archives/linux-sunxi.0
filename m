Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5BF3C34
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Apr 2023 13:05:20 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id dx24so37455647ejb.11
        for <linux-sunxi@lists.linux.dev>; Wed, 19 Apr 2023 06:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681909519; x=1684501519;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hi3fgFRhMB+S3dlh3roixUjoWYSplX6ENDKFiGEt44s=;
        b=rb1Bms81I/ziLmKbwd/v+cz02jqm3Gq1oJRkwXmWPC6yFC48TkkrGOh5ij+cD/3JrX
         WdnJs8urDCYfw6zy867Ux3vUdUEN2GBHtYQl9u0LtgKLgw3CqodwNLQJx2CrdROMn6Xv
         t3UIbDR8BWaIyaDmapy44ivnVmMqeUOBRocyOTOF/H1ErVfRD+AfhHbAjWF6W2Kc1yhX
         Z2URsG4GCJrF7MrwzpxPqRwgcJXNv4XZrZahypdJGq98el1NvJaezLvnBNHoV0JadFKw
         MrSzS/H/W2+6HjWN4canOaNgqO5SSFY3tyo8BabOyy7Ghwhj7mM5oxKd2v6eQwXQqSeT
         O53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681909519; x=1684501519;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hi3fgFRhMB+S3dlh3roixUjoWYSplX6ENDKFiGEt44s=;
        b=gl70NsH2zf1sbRvMfMMubynvKzGts3XNT/nLdP6aFdODf5vi39A3FL/uoc+lW91ads
         NSkIi4xj+8SUdzIghwO7KvQ45SIEydlEwHH5X2/iIlD2Addfs/QzZCJv3wVlBjZgV5FG
         2S99RTwLqYxeHewrzhdrhR45/CXYKdAa1y0W2y9f3jHKS2YhjlHcfVPzVuZ3OF735Iam
         ppGcFp8tN3jPJMjcQ9xbrrEbkQAQ+VaMzXB2hKYLJYkz0FlaRcGS8MNSJyba1yNaiZC2
         dFUUBoU8zAtXPPmWrV5JlLoYCgKtxFaSWYCbcRzTjzy5w1oOHVepKboZssDEDv1SHSK2
         794w==
X-Gm-Message-State: AAQBX9czLcCfzm3ytsDSgWkZASfB5gLEyQVnvbV6PWrsXwHyoaaOm9jM
	TdVs9qKFiHBmh3m1EFyVSl03Tw==
X-Google-Smtp-Source: AKy350aUdyUtTTZAbTCtx75ZVrYOCUfdp/gOoEHJVNnO1QgfIx++OeGz6GvOhM7t7WeEhJ40a4rRPg==
X-Received: by 2002:a17:907:a08d:b0:94f:8f37:d4e with SMTP id hu13-20020a170907a08d00b0094f8f370d4emr7915556ejc.65.1681909518851;
        Wed, 19 Apr 2023 06:05:18 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b7d8:d88b:1fac:c802? ([2a02:810d:15c0:828:b7d8:d88b:1fac:c802])
        by smtp.gmail.com with ESMTPSA id n19-20020a170906725300b0095334355a34sm1569509ejk.96.2023.04.19.06.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 06:05:18 -0700 (PDT)
Message-ID: <b84537c0-cb58-621a-2b6d-3bbaac5091de@linaro.org>
Date: Wed, 19 Apr 2023 15:05:17 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/1] arm: dts: sunxi: Add ICnova A20 ADB4006 board
 support
Content-Language: en-US
To: Ludwig Kormann <ludwig.kormann@in-circuit.de>, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, andre.przywara@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230419121229.1384024-1-ludwig.kormann@in-circuit.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230419121229.1384024-1-ludwig.kormann@in-circuit.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/04/2023 14:12, Ludwig Kormann wrote:
> Add board support for ICnova A20 SomPi compute module on
> ICnova ADB4006 development board.
> 
> Specification:
> SoM
> - Processor: Allwinner A20 Cortex-A7 Dual Core at 1GHz
> - 512MB DDR3 RAM
> - Fast Ethernet (Phy: Realtek RTL8201CP)
> ADB4006
> - I2C
> - 2x USB 2.0
> - 1x Fast Ethernet port
> - 1x SATA
> - 2x buttons (PWRON, Boot)
> - 2x LEDS
> - serial console
> - HDMI
> - µSD-Card slot
> - Audio Line-In / Line-Out
> - GPIO pinheaders
> 
> https://wiki.in-circuit.de/index.php5?title=ICnova_ADB4006
> https://wiki.in-circuit.de/index.php5?title=ICnova_A20_SODIMM
> 
> ---
> 
> changes in v2:
> - use short licensing header
> - remove deprecated elements from led nodes
> - disable csi power supply
> - add missing pins in usbphy node
> - split dts into SoM dtsi and carrier board dts
> 
> v1 of this patch was sent to the uboot mailing list [1].
> 
> [1] https://lists.denx.de/pipermail/u-boot/2023-April/514605.html
> 
> Signed-off-by: Ludwig Kormann <ludwig.kormann@in-circuit.de>
> ---
>  .../devicetree/bindings/arm/sunxi.yaml        |   6 +

Bindings are always separate patches. checkpatch did not complain?

>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../boot/dts/sun7i-a20-icnova-a20-adb4006.dts | 137 ++++++++++++++++++
>  arch/arm/boot/dts/sun7i-a20-icnova-a20.dtsi   |  63 ++++++++
>  4 files changed, 207 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts
>  create mode 100644 arch/arm/boot/dts/sun7i-a20-icnova-a20.dtsi
> 
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
> index 013821f4a7b8..12f0c236f17b 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -305,6 +305,12 @@ properties:
>            - const: allwinner,i12-tvbox
>            - const: allwinner,sun7i-a20
>  
> +      - description: ICNova A20 ADB4006
> +        items:
> +          - const: incircuit,icnova-a20-adb4006
> +          - const: incircuit,icnova-a20
> +          - const: allwinner,sun7i-a20
> +
>        - description: ICNova A20 SWAC
>          items:
>            - const: incircuit,icnova-a20-swac
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 3cc32722c394..b6b408417261 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1321,6 +1321,7 @@ dtb-$(CONFIG_MACH_SUN7I) += \
>  	sun7i-a20-hummingbird.dtb \
>  	sun7i-a20-itead-ibox.dtb \
>  	sun7i-a20-i12-tvbox.dtb \
> +	sun7i-a20-icnova-a20-adb4006.dtb \
>  	sun7i-a20-icnova-swac.dtb \
>  	sun7i-a20-lamobo-r1.dtb \
>  	sun7i-a20-linutronix-testbox-v2.dtb \
> diff --git a/arch/arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts b/arch/arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts
> new file mode 100644
> index 000000000000..c1606c085e4e
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun7i-a20-icnova-a20-adb4006.dts
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)

Unusual license. Are you sure you are ok with GPLv5.0?

Also, at the end of your files - drop stray blank lines.

Best regards,
Krzysztof

