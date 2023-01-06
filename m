Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4962C7B
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Jan 2023 09:21:53 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id g25-20020a7bc4d9000000b003d97c8d4941so3103625wmk.4
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Jan 2023 01:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mIBwhXreyLm6L8pvnZwtbHNyGe5mj7GJLNgz4Wh6wQo=;
        b=rUSG4pEdZZLrEOMBnA8mTNPsn7JjkeFfcu9LagQ3wJ78obWtdOCbs/o/WuvChx67fD
         sQ4d/0Zy6qJ2bURTTu8YevguKYQF5FP2zjCxS8F0R2yFHERndGlPVLsrlesE/C4ZRF/2
         9zRpxtpep8sAJoSY5GLI0SDsZZVfNFH5TVsOmcON+O818kZGUzhJAKtLIl8cyb7V+aLl
         aE4VvJ7F/nbN0sr98J6iCdePjgv/lO1Z0lAipJeP0e3aeA9XgM2bY2Wdugybk53+1vSt
         9MvqNLM8Mgt117lsXOwrN/loBt0vm4XdjnIRIaTtxevLdzkdxR2kFtoXi6eNlyyQZe9F
         SPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mIBwhXreyLm6L8pvnZwtbHNyGe5mj7GJLNgz4Wh6wQo=;
        b=bDGDh185ALOUSE2dZ3uJc/exTOUySpY7yGGVi/kICNheA/zqSdKe+mub00VA4XORlj
         VKllwmybBIRNjudaiDHUx6QMr3qDq/nJ7HVDPLw7pgGRqy3kuTKkCOFTRuroM8YVtmaY
         BTHYP8ejWWXi47TnuZTH3PFYu5APxARdcfF4kpKxQXDUvCb7tJlNplGM0NP5+7xXDpJs
         ugNsVbAyY1vHim5ka1D654E4ktdTR8sfjkrE8AlMDObqdXdTb9Y6T3t+OtKvvriBZscm
         HGAmcJ2g5IUwHdsj789OyNKfxNZYYG2P0nZiatLe3lPMhl3wLz4Ja92lPLOmatoqdjpb
         NgZw==
X-Gm-Message-State: AFqh2kqJqzvWmM06lpp9vaZPe9E0VEdzhC92Kev74aOjOt+42Xet0k6s
	U6u96XRRpVI1ATkk+n55d69yMg==
X-Google-Smtp-Source: AMrXdXt1czt6+jNPwMhku9nPQSZYF/LqrQNaJuRT/gQVAVTaHXddn9UrPgdw+EhBKkv5Muaf+tmGYQ==
X-Received: by 2002:a7b:cb89:0:b0:3d2:2101:1f54 with SMTP id m9-20020a7bcb89000000b003d221011f54mr38609714wmi.4.1672996911573;
        Fri, 06 Jan 2023 01:21:51 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id az20-20020a05600c601400b003d96bdddd3dsm1047604wmb.15.2023.01.06.01.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 01:21:51 -0800 (PST)
Message-ID: <93915db1-9089-9c58-62f3-6a424c57bfa5@linaro.org>
Date: Fri, 6 Jan 2023 10:21:48 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 4/4] ARM: dts: sunxi: add MangoPi MQ-R board
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Icenowy Zheng <uwu@icenowy.me>, =?UTF-8?B?QW5kcsOhcyBTemVtesO2?=
 <szemzo.andras@gmail.com>, Fabien Poussin <fabien.poussin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org
References: <20230106010155.26868-1-andre.przywara@arm.com>
 <20230106010155.26868-5-andre.przywara@arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106010155.26868-5-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/01/2023 02:01, Andre Przywara wrote:
> The MangoPi MQ-R is a small SBC with the Allwinner T113-s3 SoC.
> The SoC features two Arm Cortex-A7 cores and 128 MB of co-packaged DDR3
> DRAM. The board adds mostly connectors and the required regulators, plus
> a Realtek RTL8189FTV WiFi chip.
> Power comes in via a USB-C connector wired as a peripheral, and there is
> a second USB-C connector usable as a host port.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../arm/boot/dts/sun8i-t113s-mangopi-mq-r.dts | 160 ++++++++++++++++++
>  2 files changed, 161 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-t113s-mangopi-mq-r.dts
> 
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index d08a3c450ce72..39fd893682924 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1390,6 +1390,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>  	sun8i-s3-elimo-initium.dtb \
>  	sun8i-s3-lichee-zero-plus.dtb \
>  	sun8i-s3-pinecube.dtb \
> +	sun8i-t113s-mangopi-mq-r.dtb \
>  	sun8i-t3-cqa3t-bv3.dtb \
>  	sun8i-v3-sl631-imx179.dtb \
>  	sun8i-v3s-licheepi-zero.dtb \
> diff --git a/arch/arm/boot/dts/sun8i-t113s-mangopi-mq-r.dts b/arch/arm/boot/dts/sun8i-t113s-mangopi-mq-r.dts
> new file mode 100644
> index 0000000000000..ed4d5217d7b0d
> --- /dev/null
> +++ b/arch/arm/boot/dts/sun8i-t113s-mangopi-mq-r.dts
> @@ -0,0 +1,160 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// Copyright (C) 2022 Arm Ltd.
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/dts-v1/;
> +
> +#include "sun8i-t113s.dtsi"
> +
> +/ {
> +	model = "MangoPi MQ-R";
> +	compatible = "widora,mangopi-mq-r", "allwinner,sun8i-t113s";
> +
> +	aliases {
> +		ethernet0 = &rtl8189ftv;
> +		serial3 = &uart3;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial3:115200n8";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			color = <LED_COLOR_ID_BLUE>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&pio 3 22 GPIO_ACTIVE_LOW>; /* PD22 */
> +		};
> +	};
> +
> +	/* board wide 5V supply directly from the USB-C socket */
> +	reg_vcc5v: vcc5v {

Generic node names, so matching style of other - with regulator prefix.

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc-5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	/* SY8008 DC/DC regulator on the board */
> +	reg_3v3: regulator-3v3 {


Best regards,
Krzysztof

