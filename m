Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309E9745C2
	for <linux-sunxi@lists.linux.dev>; Wed, 13 Dec 2023 20:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXY6XXYz"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c339d2b88so58960055e9.3
        for <linux-sunxi@lists.linux.dev>; Wed, 13 Dec 2023 12:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702499108; x=1703103908; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBw6RwQKyvab353WCHCowyhIbZpg2AL1dkTtUhZYR/w=;
        b=RXY6XXYz/AQ2WC9uMCVJB3vmhmgUhDTsdCMLxtps18pmaeOjJCa8/BUhE4yvssDMtq
         K7m2hx7l0fhcIsYIpd8TA+16lK8WX4Tzv0W+OL2a6SF9jxSVxYQ8l/YA5ff0eM/aSkY5
         gX3OwYXtwRpOolA0fwe5982sVuz2Gd0iYCAxoWJc/FuU3Kvg9FcxE7vBJWFEzrGskTDY
         A/UG+hthC5XuNafnWy5HPwpe79MpaVGk+BVNvMO73sbD+waYkr3OUGVbTYlFewq1MOgm
         pdE4Yy+NvZ5nztSgwwc2F8uGynE7/LEGp/CZkD/YVp84Cen4kszV9/9WgFTGq6nSubvf
         95QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702499108; x=1703103908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBw6RwQKyvab353WCHCowyhIbZpg2AL1dkTtUhZYR/w=;
        b=jTvlbY49XjgBkyqB7O0V5j+m5J9E9M11AGIQKkbl1jpSqVh+iELMU8yWyR6FmkGIsm
         XsYhEapBYJi6PZQ0T2V6q/OibdU5/2mIHLtQyRT5BDdjowhR7DUXat9gYSG19ZAA2hln
         KS7uase+b98DqA4pvhbdljfP6BwQacwianwuPBTkWdbORsym7cUdCBtSMoullob0lDvp
         WCVJmnxsDL4Q5nQNsOO4/nUeswmmvZ3pCo9DbR+t5WkJawAcdSnrQjBalWI6J+6UyIPZ
         qzMQssVirmMrw1qVHIKWA/5/BnoJRwFzORfsIgUAk4HAltRT3Y55QydohmcYrfaaZhSr
         gdeg==
X-Gm-Message-State: AOJu0YwdOps+lBo9UiYi0zFzHeXzIfo8tQ3odHNFMKoIAI93u+QciMRE
	/BZxMNHrduCRpMZhO+KOvDQnlkPnuSQ=
X-Google-Smtp-Source: AGHT+IGMJfezTktKT7qPOB4lTgQts74SBurQohWWXd09dJ/KV9sR7T5RT6n3lUUP60TNYauxrbskag==
X-Received: by 2002:a05:600c:3154:b0:40c:4c9a:7b02 with SMTP id h20-20020a05600c315400b0040c4c9a7b02mr2370491wmo.130.1702499108050;
        Wed, 13 Dec 2023 12:25:08 -0800 (PST)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id fl9-20020a05600c0b8900b0040b43da0bbasm21945141wmb.30.2023.12.13.12.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:25:07 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject:
 Re: [PATCH v7 6/7] ARM: dts: sun8i-a83t: Add BananaPi M3 OV5640 camera
 overlay
Date: Wed, 13 Dec 2023 21:25:06 +0100
Message-ID: <22116368.EfDdHjke4D@archlinux>
In-Reply-To: <20231122141426.329694-7-paul.kocialkowski@bootlin.com>
References:
 <20231122141426.329694-1-paul.kocialkowski@bootlin.com>
 <20231122141426.329694-7-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Paul!

On Wednesday, November 22, 2023 3:14:24 PM CET Paul Kocialkowski wrote:
> Add an overlay supporting the OV5640 from the BananaPi Camera v3
> peripheral board. The board has two sensors (OV5640 and OV8865)
> which cannot be supported in parallel as they share the same reset
> pin and the kernel currently has no support for this case.
> 
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  arch/arm/boot/dts/allwinner/Makefile          |   1 +
>  .../sun8i-a83t-bananapi-m3-camera-ov5640.dtso | 117 ++++++++++++++++++
>  2 files changed, 118 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dtso
> 
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
> index eebb5a0c873a..a0a9aa6595e4 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -277,6 +277,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>  	sun8i-a33-sinlinx-sina33.dtb \
>  	sun8i-a83t-allwinner-h8homlet-v2.dtb \
>  	sun8i-a83t-bananapi-m3.dtb \
> +	sun8i-a83t-bananapi-m3-camera-ov5640.dtbo \
>  	sun8i-a83t-cubietruck-plus.dtb \
>  	sun8i-a83t-tbs-a711.dtb \
>  	sun8i-h2-plus-bananapi-m2-zero.dtb \
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dtso b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dtso
> new file mode 100644
> index 000000000000..5868ef11bdee
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-a83t-bananapi-m3-camera-ov5640.dtso
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: GPL-2.0 OR X11
> +/*
> + * Copyright 2022 Bootlin
> + * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/sun8i-a83t-ccu.h>
> +#include <dt-bindings/gpio/gpio.h>

I think you should tie this overlay to BananaPi M3 board by specifying its
compatible here, like:

/ {
	compatible = "sinovoip,bpi-m3";
};

> +
> +&{/} {
> +	/*
> +	 * These regulators actually have DLDO4 tied to their EN pin, which is
> +	 * described as input supply here for lack of a better representation.
> +	 * Their actual supply is PS, which is always-on.
> +	 */
> +
> +	ov5640_avdd: ov5640-avdd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ov5640-avdd";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		vin-supply = <&reg_dldo4>;
> +	};
> +
> +	ov5640_dovdd: ov5640-dovdd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ov5640-dovdd";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		vin-supply = <&reg_dldo4>;
> +	};
> +
> +	ov5640_dvdd: ov5640-dvdd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ov5640-dvdd";
> +		regulator-min-microvolt = <1500000>;
> +		regulator-max-microvolt = <1500000>;
> +		vin-supply = <&reg_dldo4>;
> +	};
> +};
> +
> +&csi {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&csi_8bit_parallel_pins>;
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			csi_in_ov5640: endpoint {
> +				remote-endpoint = <&ov5640_out_csi>;
> +				bus-width = <8>;
> +				data-shift = <2>;
> +				hsync-active = <1>;
> +				vsync-active = <1>;
> +				pclk-sample = <1>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c2_pe_pins>;
> +	status = "okay";
> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	ov5640: camera@3c {
> +		compatible = "ovti,ov5640";
> +		reg = <0x3c>;
> +
> +		clocks = <&ccu CLK_CSI_MCLK>;
> +		clock-names = "xclk";
> +		assigned-clocks = <&ccu CLK_CSI_MCLK>;
> +		assigned-clock-parents = <&osc24M>;
> +		assigned-clock-rates = <24000000>;

Are those really necessary? If so, can it be moved to the driver? Assigned
clock rates have no guarantee that they will stay at that rate. Additionally,
same sensor in pinetab doesn't need that. What's the difference?

> +
> +		AVDD-supply = <&ov5640_avdd>;
> +		DOVDD-supply = <&ov5640_dovdd>;
> +		DVDD-supply = <&ov5640_dvdd>;
> +
> +		powerdown-gpios = <&pio 3 15 GPIO_ACTIVE_HIGH>; /* PD15 */
> +		reset-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>; /* PE16 */
> +
> +		rotation = <180>;
> +
> +		port {
> +			ov5640_out_csi: endpoint {
> +				remote-endpoint = <&csi_in_ov5640>;
> +				bus-width = <8>;
> +				data-shift = <2>;
> +				hsync-active = <1>; 
> +				vsync-active = <1>;
> +				pclk-sample = <1>;
> +			};
> +		};
> +	};
> +};
> +
> +&pio {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&csi_mclk_pin>;

This should be moved to ov5640 node.

Best regards,
Jernej

> +};
> +
> +&reg_dldo4 {
> +	regulator-min-microvolt = <2800000>;
> +	regulator-max-microvolt = <2800000>;
> +};
> 




