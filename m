Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49E622EF0
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 09:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713085813; cv=none; b=NSxgQChhDxkn3mOPaPfQAlRgPt/uhkR2arGY4gXi8ImG3SwQ8uXc4e9zs51pT+vghXxD6vvb3SuV+Nbx0TIQbsKesDveLB6M3Q1jxcma5kON0okuAk6p3R6mXQGcuhCTk35N9TxW913sPYBixAB+eZXhiV2i7k63nwljQmej948=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713085813; c=relaxed/simple;
	bh=VG0owNXFGNDuEEJ6HRiEaXklbtfWo1BMnyNxkJBGDKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLXOijl5dEYN4tgzDd+0xQ9+UFL9maz4StgfJBlf/Q883uEeB4JOJ6h6qLPcxBoUrwHOYNCOytJL9HzFiLdMpWt2/HrG6SdEJUfNO1Duw+P0fnWkyPCWeZEfRCtDCNrpXrVcVw1kOxbFzRckVIgzyvDZdX9JhdPKj5cO85XPb30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FnKGzdJG; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FnKGzdJG"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a524ecaf215so92214666b.2
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 02:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713085810; x=1713690610; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qUIus00I9YbNfD03SHuWbNcglTIhnydiZOYidEXVVLI=;
        b=FnKGzdJGRe/+zJpj0LKzr+E8iWUgDYbnB2LqEMU87KA1aCq9PhX5wehvy2rIowUSZk
         S1Zz6OWPEgRsaWNvaovhxrL7LnxSR55LUvoUrLIjhjpCQPDnh+8re9kQS55yCx4D7LFY
         cl8/sHFqYf2ugpMjt0Lz8SGK4BGZH+BMBbba9EKxOR3iQplLzJZItvcw/rsqoVS7AZXv
         NokbDeiXKkQUMzzTRCltvkzNXrqwWAPiZAOZl9siHwdbOi9xFMPKSrrVqzvzWJRDVTZh
         7wrdLREEWCDZKCEcu+shQ/0pSTnkqT0RyoMljI8gv6NLwvSgeIxSp6L4XAwoesBZSOqb
         qHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713085810; x=1713690610;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUIus00I9YbNfD03SHuWbNcglTIhnydiZOYidEXVVLI=;
        b=oHeMfLv1KA9jfxsDnFeFniICdH5KRvanFdpRVsDEXQsVZuwW/v1D53oogufWaqNY2x
         chCw6n88ep0WmA9umimO//1CKOWqxY5pcG/HhfGr7t4OrfDKfAQysWD0LHee4qLpHj4/
         PvxGSwb61sFzRE5V60+hOnZCXNVOyDvWGJKTOqkBfpy5YkZW9B+tCM1Zw4UbUbV2XeyO
         t2/MFjyQHWTXRoaqY9aTlT9DCepW2SRwrGx7FqAJyCGPY20+0pGRBtNNgMUSuUZkkaeI
         E42Ahen/xZE6yBfhZqJRGsbMhRR+BYDfHHiMV16RgwN6AtL+EoAyyh1dIqPlos8aUfSp
         C7bg==
X-Forwarded-Encrypted: i=1; AJvYcCVqXz/zWdYICXVZUnDOmHL1tIiQrtq1KW2cyv1vTQeobh6uTEZ1F6tSRn4gPIZWdRjbcuKzYsCjlycX447ItBrbcOqj/Z1fk/JF/Fs=
X-Gm-Message-State: AOJu0YzgGhqFFPkecCAh4MSCFzuoO0x8vuKYdA5eWiK/KmScdWaDnS5d
	FHsRCcvDHnwKJQUn1/dHvmOQeH7eOrwZOCFwvogadykeiQX5rC0WAK0TtMEqUVk=
X-Google-Smtp-Source: AGHT+IEfwOXnKMxshP0NpIw/LSWTfbVidZksgZmMZ8MWconsB/clEPF68rLb0cAhW+F31PNogcyCOA==
X-Received: by 2002:a17:907:7d8d:b0:a52:57d2:1cfa with SMTP id oz13-20020a1709077d8d00b00a5257d21cfamr1395641ejc.62.1713085809980;
        Sun, 14 Apr 2024 02:10:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id gt35-20020a1709072da300b00a522d25b7d9sm3323194ejc.63.2024.04.14.02.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Apr 2024 02:10:09 -0700 (PDT)
Message-ID: <eb3aaaef-e6cb-4b5d-90b4-b0f041a94215@linaro.org>
Date: Sun, 14 Apr 2024 11:10:08 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: allwinner: h700: Add RG35XX-Plus DTS
To: Ryan Walklin <ryan@testtoast.com>, Andre Przywara
 <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20240414083347.131724-2-ryan@testtoast.com>
 <20240414083347.131724-6-ryan@testtoast.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240414083347.131724-6-ryan@testtoast.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/04/2024 10:33, Ryan Walklin wrote:
> From: Ryan Walklin <ryan@testtoast.com>
> 
> The RG35XX-Plus adds a RTL8221CS SDIO Wifi/BT chip to the RG35XX (2024).
> 
> Enabled in this DTS:
> - WiFi
> - Bluetooth
> - Supporting power sequence and GPIOs
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../sun50i-h700-anbernic-rg35xx-plus.dts      | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
> new file mode 100644
> index 000000000000..b9a163ed5d0b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (C) 2024 Andre Przywara <andre.przywara@arm.com>.
> + * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
> + * Copyright (C) 2024 Chris Morgan <macroalpha82@gmail.com>.
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-h700-anbernic-rg35xx-2024.dts"
> +
> +/ {
> +    model = "Anbernic RG35XX Plus";
> +    compatible = "anbernic,rg35xx-plus", "allwinner,sun50i-h700";
> +
> +    wifi_pwrseq: wifi_pwrseq {
> +        compatible = "mmc-pwrseq-simple";
> +        clocks = <&rtc CLK_OSC32K_FANOUT>;
> +        clock-names = "ext_clock";
> +        pinctrl-0 = <&x32clk_fanout_pin>;
> +        pinctrl-names = "default";
> +        post-power-on-delay-ms = <200>;
> +        reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
> +    };
> +};
> +
> +/* SDIO WiFi RTL8821CS, powered by CLDO4, regon=PG18, hostwake=PG15 */
> +&mmc1 {
> +    vmmc-supply = <&reg_cldo4>;
> +    vqmmc-supply = <&reg_vcc1v8>;
> +    mmc-pwrseq = <&wifi_pwrseq>;
> +    bus-width = <4>;
> +    non-removable;
> +    status = "okay";
> +
> +    sdio_wifi: wifi@1 {
> +       reg = <1>;
> +       interrupt-parent = <&pio>;
> +       interrupts = <6 15 IRQ_TYPE_LEVEL_LOW>; /* PG15 */
> +       interrupt-names = "host-wake";
> +    };
> +};
> +
> +&uart0 {
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&uart0_ph_pins>;
> +    status = "okay";
> +};
> +
> +/* Bluetooth RTL8821CS, RST_N: PG19, BT_WAKE: PG17, BT_HOSTWAKE: PG16 */
> +&uart1 {
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
> +    uart-has-rtscts;
> +    status = "okay";
> +
> +    bluetooth {
> +        compatible = "realtek,rtl8821cs-bt", "realtek,rtl8723bs-bt";
> +        device-wake-gpios = <&pio 6 17 GPIO_ACTIVE_HIGH>;

Wrong indentation. Everywhere. Please follow DTS coding style.

Best regards,
Krzysztof

