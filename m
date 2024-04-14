Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D3C21A19
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 09:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713085770; cv=none; b=T9CYM7n0bbfjTocIyp/wal4bg1kCrSvVxGuz6fmhvB3+OmuyPn5EkjqEN2JdOVOBCoxc9YJAa/M0NCKvMknCCB0vLzJGsu+5y5ZianNyAbrJ0IWoMDNU9Sgv3m5NDyIC6fqYqO8/WgbCVA3jloussCAQ0p28HRngqLZDBQQbo48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713085770; c=relaxed/simple;
	bh=Er+CYh9FHJ9mlEBjd/YOvPjUVxvuTJYwdtx5i80ga0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ikPIEN3/hJO8iUTdSDEAbuNmXfuL9UkyBkj8dLCH3rqh52Y1kjJJYL6GD+NV0LeJO9w2OiHj02YMUyW1J4RFX7z5TzIQgizEel/flTPdidulOMubN08kKk7BbVsFNjBZnFC4r5JaEhp9CdvJZ2fOw8za8i9+UL1tUKlX6+3SCEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XGtKPzhZ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XGtKPzhZ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a51f9ad7684so143037766b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 02:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713085767; x=1713690567; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EMcHcmFyDnJKJzACwsJ4Nm10QcmzyItvyxrTFRQZWIs=;
        b=XGtKPzhZvyBbDagUUw3J6fjL5FaTKHEbUCs6Hu3DR+dWnUPf+6xZDRWpc+lkmiKN9F
         2QBfnV82PLvDmqmdwlLPSsN6RHnyEHTx56NeeYlMO53h/HRoWf5KuBjsbiKnFpu5eJaG
         s0JD0dANyAtZEyajLqAwQC7NqNTUXTsJhIJHs77IaOS2tZolQ3Jx6JOaOMsaXs3Ccc/a
         89lqZOBkvaSr+Mt47Q/2b7hGsFzJkL/XwRfN0pPz+VyFxA3TVootyVXd2TqSs9ewIEM/
         6Di1uJ+qrL86LY554sjKBqurH304uPXQcrYE0C6FE2iH30eynvcgw2KaFX0DFJigKbcm
         4xjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713085767; x=1713690567;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMcHcmFyDnJKJzACwsJ4Nm10QcmzyItvyxrTFRQZWIs=;
        b=u8w2kKvsrVy1BnutCG8N5u12KEsOvnNbyx0iq+Ib3OAlgTZ2dqsnDvFHXvOvJ8rPMQ
         QaygyiW9dUQLb/BdwQfKJ0+7zqSgZqV82xsBpaSkD3m0dDDVT8xWYdiJegQXSNiZUV6A
         jqNtL69C9wQItKr1V3HnaTuk6GmLHrdV5aG66u5XDlGciB/ygoeOVwI0fn0FBKiUrwDT
         x5Fx6L9zOJiJvSGP//268DaV2ZLY9UV7xgyusN0uy1N/ByjOEK611BMy4aByQOdZUdAj
         3OYAR3L+VjRsOb2/IJa1JqzMDPcYKU++QQFGjuYfenJnDJfaI6geDjoMuXw7jCO3pS+H
         AasA==
X-Forwarded-Encrypted: i=1; AJvYcCV7x1rri8V09KRQKRMAXinDGoZ24ZAMquae6z/lhsNxO+nmLZcyhLN6ua1QL4Jwvbbd4hL6BDejpgkgryYYIhFac0rO5IfYvGXpSaA=
X-Gm-Message-State: AOJu0YxIqtveQeRWFYtCv+MB2RCUigIDyW6lfxDjjjMlvkLzwtqTupda
	LX3WRy+vPDr5BYWau/fTtITiQWAtPLdu9FJAxbXj0+NlvwF1s0w5JVjn5Pdl4JA=
X-Google-Smtp-Source: AGHT+IEiyMz7ZxSi4H+tn+AeFl9v/pq801XHekzVA6cf33S2t70746pnPkNOP3pue1Ml6L0cC9PC5A==
X-Received: by 2002:a50:a6dc:0:b0:570:332:aad3 with SMTP id f28-20020a50a6dc000000b005700332aad3mr4637471edc.39.1713085767048;
        Sun, 14 Apr 2024 02:09:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id w22-20020a170907271600b00a4e48e52ecbsm3961053ejk.198.2024.04.14.02.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Apr 2024 02:09:26 -0700 (PDT)
Message-ID: <c615c0b0-3dd4-4bac-8bd5-654fd8a35d0c@linaro.org>
Date: Sun, 14 Apr 2024 11:09:25 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
To: Ryan Walklin <ryan@testtoast.com>, Andre Przywara
 <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20240414083347.131724-2-ryan@testtoast.com>
 <20240414083347.131724-5-ryan@testtoast.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240414083347.131724-5-ryan@testtoast.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/04/2024 10:33, Ryan Walklin wrote:
> From: Ryan Walklin <ryan@testtoast.com>
> 
> The base model RG35XX (2024) is a handheld gaming device based on an Allwinner 
> H700 chip.
> 
> The H700 is a H616 variant (4x ARM Cortex-A53 cores @ 1.5Ghz with Mali G31 GPU) 
> which exposes RGB LCD and NMI pins.
> 
> Device features:
> - Allwinner H700 @ 1.5GHz
> - 1GB LPDDR4 DRAM
> - X-Powers AXP717 PMIC
> - 3.5" 640x480 RGB LCD
> - Two microSD slots
> - Mini-HDMI out
> - GPIO keypad
> - 3.5mm headphone jack
> 
> Enabled in this DTS:
> - AXP717 PMIC with regulators (interrupt controller TBC/TBD)
> - Power LED (charge LED on device controlled directly by PMIC)
> - Serial UART (accessible from PIN headers on the board)
> - MMC slots
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 405 ++++++++++++++++++
>  1 file changed, 405 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> new file mode 100644
> index 000000000000..b4140d450687
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> @@ -0,0 +1,405 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (C) 2024 Andre Przywara <andre.przywara@arm.com>.
> + * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
> + * Copyright (C) 2024 Chris Morgan <macroalpha82@gmail.com>.
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-h616.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +    model = "Anbernic RG35XX 2024";
> +    compatible = "anbernic,rg35xx-2024", "allwinner,sun50i-h700";
> +
> +    aliases {
> +        mmc0 = &mmc0;
> +        mmc1 = &mmc2;
> +        mmc2 = &mmc1;
> +        serial0 = &uart0;
> +    };
> +
> +    chosen {
> +        stdout-path = "serial0:115200n8";
> +    };
> +
> +    leds {
> +        compatible = "gpio-leds";
> +
> +        led-0 {
> +            function = LED_FUNCTION_POWER;
> +            color = <LED_COLOR_ID_GREEN>;
> +            gpios = <&pio 8 12 GPIO_ACTIVE_HIGH>; /* PI12 */
> +            default-state = "on";
> +        };
> +    };
> +
> +    gpio-keys {
> +       compatible = "gpio-keys";
> +
> +       keyUp {

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

No uppercase letters are allowed as node names.

...

> +
> +        keyVol+ {

Neither this

> +            label = "Key Volume Up";
> +            gpios = <&pio 4 1 GPIO_ACTIVE_LOW>; /* PE1 */
> +            linux,input-type = <EV_KEY>;
> +            linux,code = <KEY_VOLUMEUP>;
> +        };
> +
> +        keyVol- {

Although it is allowed but not consistent and readable.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +            label = "Key Volume Down";
> +            gpios = <&pio 4 2 GPIO_ACTIVE_LOW>; /* PE2 */
> +            linux,input-type = <EV_KEY>;
> +            linux,code = <KEY_VOLUMEDOWN>;
> +        };
> +    };
> +
> +    reg_vcc5v: vcc5v {

Use some common reasonable prefix, e.g. regulator

> +        compatible = "regulator-fixed";
> +        regulator-name = "vcc-5v";
> +        regulator-always-on;
> +        regulator-boot-on;
> +        regulator-min-microvolt = <5000000>;
> +        regulator-max-microvolt = <5000000>;
> +    };
> +
> +    vcc_5v0_usb: vcc-5v0-usb { /* needs gpios */
> +            compatible = "regulator-fixed";
> +            regulator-name = "vcc_5v0_usb";
> +            regulator-min-microvolt = <5000000>;
> +            regulator-max-microvolt = <5000000>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +    reg_vcc3v3: vcc3v3 {
> +        gpio = <&pio 4 4 GPIO_ACTIVE_HIGH>;
> +        compatible = "regulator-fixed";
> +        regulator-name = "vcc-3v3";
> +        regulator-always-on;
> +        regulator-boot-on;
> +        regulator-min-microvolt = <3300000>;
> +        regulator-max-microvolt = <3300000>;
> +
> +    };
> +
> +    reg_vcc1v8: vcc1v8 {
> +        compatible = "regulator-fixed";
> +        regulator-name = "vcc-1v8";
> +        regulator-always-on;
> +        regulator-min-microvolt = <1800000>;
> +        regulator-max-microvolt = <1800000>;
> +    };
> +};
> +
> +&cpu0 {
> +    cpu-supply = <&reg_dcdc1>;
> +};
> +
> +&mmc0 {
> +    vmmc-supply = <&reg_vcc3v3>;
> +    disable-wp;
> +    cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
> +    bus-width = <4>;
> +    status = "okay";
> +};
> +
> +&mmc2 {
> +    vmmc-supply = <&reg_vcc3v3>;
> +    vqmmc-supply = <&reg_aldo1>;
> +    cd-gpios = <&pio 4 22 GPIO_ACTIVE_LOW>; /* PE 22 */
> +    //cd-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>;  /* PE16 */

Please do not add dead code without explanation.

> +    bus-width = <4>;
> +    status = "okay";
> +};
> +
> +&ohci0 {
> +    status = "okay";
> +};
> +
> +&ehci1 {
> +    status = "okay";
> +};
> +
> +&i2c3 {
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&i2c3_ph_pins>;
> +    status = "okay";
> +};
> +
> +&r_rsb {
> +   status = "okay";
> +
> +   axp717: pmic@3a3 {
> +       compatible = "x-powers,axp717";
> +       //interrupt-controller;
> +       //#interrupt-cells = <1>;
> +       reg = <0x3a3>;
> +       //interrupt-parent = <&r_intc>; /* test */
> +       //interrupts = <0 IRQ_TYPE_LEVEL_LOW>; /* test */

Keep test and dead code outside upstream submission.



Best regards,
Krzysztof

