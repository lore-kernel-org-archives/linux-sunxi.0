Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA0B148FE6
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 16:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714147564; cv=none; b=BPoX8zbbEDfSyplXT3zLGhV7hggMOZhH0JlmMbjkaNIZ5KZcWgcdZBBaHJVP50YwOSCjdM7mYxOfgHJnHd5s0AlAm8MK7FymcF1ptI3avnwScyKRYnJZaOVeiLUqtxaAmbqInpBGeWpeZZqsOQVCgfW5ngKVVytDx3bS4R20Vok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714147564; c=relaxed/simple;
	bh=G70njpUzltHirqMDt+qUGmfxB4e2EJ7vG9+cIWMSu9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bExLU+4X+8uLYPv6bPjAC6ia9JcxKzuc+NJ3R5yEenuhOwKvVjLhpBQYv8BM8SduiTqU4v14QqzmH3DVR/y/OaF2omB9nUO4qdZo42gbIzPbGdAiX1dv02kBo82Rtfrl9Gs++yuJlMSmoyyzBWM/Kx6VJiI4ombrSSyvJJ407Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7ShaMDt; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7ShaMDt"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-34a7e47d164so1661670f8f.3
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Apr 2024 09:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714147561; x=1714752361; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BreyMNwH07eEsN1UQMlqTNbeq4uFPEeBPKL0N+e7pEE=;
        b=K7ShaMDtfmZ5KMJOC1Hv0gOqwiEfd1YRizmFOoJomr1OMB/KgqVI830/sHKQ1laCWD
         n3ItBxLJ95CPOVYacXHUHkoUkaIFPSfcWdtqQz0B/QpD0YE7t5/yLCGxCSZnRwV4YTeR
         2/OO6uQMyU2PACcjmWnInqQ6BWGZ20Yt7ACP38b/VOpsOq5ayHvXBbTrqMCrU8nRvijl
         lp/72fq+4ybEYQOz8HrD55aCp8EUi+T+yhgOJlxJn7RdnsGOmeEBOchnAHCs0gyI4345
         G/RdVAOE2MfLnrpvvKUYuZfvc75mP8lzyllNxUVvpO3ewWty9WQKknP3O5LEerBYEdaT
         rv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714147561; x=1714752361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BreyMNwH07eEsN1UQMlqTNbeq4uFPEeBPKL0N+e7pEE=;
        b=ZZ3HT84kDNJ8VeHHVTb1jcZBECgg0KDVxg9/Rxli1guYfb10rLG1Mn3CvjwsyWSM8z
         /UzHfg2nKUqLG3ILIp6cCbnsmyi5xtmfn7CmIIiLbVTFcO+apdFb21p5QdRUtGdo7rz6
         6NSsi70YCRLgSxc9wQfuSmlGoEjI1OcEXnCTmdqgvVn6rcqXSrHO/fCdbrfPJuywZpeg
         majvW2mC3Kl/v0JxpEO/hCsJuXuu46g/UicMvDhY7xYUocoO4j7tE7SlAfRvlaA0yttN
         ODr6rMFgnhTzlOKRMnvlJC4dH3NwJI9ujLjzB1VlcLIND/lQY+3giYBjfGE1yUJy2OIx
         1Scg==
X-Forwarded-Encrypted: i=1; AJvYcCVC1rQXeIH02zHDvhdXTTkJeh9T72vDzFsTa7SpSLjA8jWtRqFayyVMYRrMOmGZKesQirHmptkGsvHUu79JVP0ZpuYFzWvcPHKgF2k=
X-Gm-Message-State: AOJu0YwyCIb3TmQ9esw/Smh4DWux+HZe8B3nHReLRlnWxHp0ezQYGFb+
	JftADkAb1SeIrpDqU+YDxU8krXhJDt1mlVkyucto+BHwUpxZW2QZ
X-Google-Smtp-Source: AGHT+IECHS/Q1s2GT5uX6QAsT6giook1s8zUG6WiMLTJS0ugML+6jElcEYiKcdXAdQ9bH6B20F6N1g==
X-Received: by 2002:a5d:5b8d:0:b0:349:fc93:1e2 with SMTP id df13-20020a5d5b8d000000b00349fc9301e2mr11526wrb.9.1714147561072;
        Fri, 26 Apr 2024 09:06:01 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id e4-20020adff344000000b0034349225fbcsm22655082wrp.114.2024.04.26.09.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 09:06:00 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chris Morgan <macromorgan@hotmail.com>, Ryan Walklin <ryan@testtoast.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Ryan Walklin <ryan@testtoast.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: allwinner: h700: Add RG35XX-Plus DTS
Date: Fri, 26 Apr 2024 18:05:59 +0200
Message-ID: <2602381.Lt9SDvczpP@jernej-laptop>
In-Reply-To: <20240426095141.13602-5-ryan@testtoast.com>
References:
 <20240426095141.13602-2-ryan@testtoast.com>
 <20240426095141.13602-5-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne petek, 26. april 2024 ob 11:51:41 GMT +2 je Ryan Walklin napisal(a):
> The RG35XX-Plus adds a RTL8221CS SDIO Wifi/BT chip to the RG35XX (2024).
> 
> Enabled in this DTS:
> - WiFi
> - Bluetooth
> - Supporting power sequence and GPIOs
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> Changelog v1..v2:
> - Update copyright
> - Spaces -> Tabs
> - Remove redundant &uart0 node and DTS version tag
> - Add GPIO bank comments
> - Use generic pwrseq name
> 
> Changelog v2..v3:
> - Add DTB to Makefile
> - Correct Wifi vqmmc-supply to ALDO4
> - Move changelog below fold-line
> 
> Changelog v3..v4:
> - Fix sdio_wifi node indent
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile        |  1 +
>  .../sun50i-h700-anbernic-rg35xx-plus.dts      | 53 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index 6f997157968e..4217328b1889 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -48,3 +48,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-2024.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-plus.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
> new file mode 100644
> index 000000000000..60a8e4922103
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
> + */
> +
> +#include "sun50i-h700-anbernic-rg35xx-2024.dts"
> +
> +/ {
> +	model = "Anbernic RG35XX Plus";
> +	compatible = "anbernic,rg35xx-plus", "allwinner,sun50i-h700";
> +
> +	wifi_pwrseq: pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		clocks = <&rtc CLK_OSC32K_FANOUT>;
> +		clock-names = "ext_clock";
> +		pinctrl-0 = <&x32clk_fanout_pin>;
> +		pinctrl-names = "default";
> +		post-power-on-delay-ms = <200>;
> +		reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
> +	};
> +};
> +
> +/* SDIO WiFi RTL8821CS */
> +&mmc1 {
> +	vmmc-supply = <&reg_cldo4>;
> +	vqmmc-supply = <&reg_aldo4>;
> +	mmc-pwrseq = <&wifi_pwrseq>;
> +	bus-width = <4>;
> +	non-removable;
> +	status = "okay";
> +
> +	sdio_wifi: wifi@1 {
> +		reg = <1>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <6 15 IRQ_TYPE_LEVEL_LOW>; /* PG15 */
> +		interrupt-names = "host-wake";
> +	};
> +};
> +
> +/* Bluetooth RTL8821CS */
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
> +	uart-has-rtscts;
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "realtek,rtl8821cs-bt", "realtek,rtl8723bs-bt";
> +		device-wake-gpios = <&pio 6 17 GPIO_ACTIVE_HIGH>; /* PG17 */
> +		enable-gpios = <&pio 6 19 GPIO_ACTIVE_HIGH>; /* PG19 */
> +		host-wake-gpios = <&pio 6 16 GPIO_ACTIVE_HIGH>; /* PG16 */
> +	};
> +};
> 




