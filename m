Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FFE748A
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 16:29:35 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id p8so20128499lfu.11
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 08:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W0kwIteVI0mAJe/8GLdwxLdQti9AntS3SZzoMzqhgLw=;
        b=h+UiIrgX+Ng2VmbHYOG251WZTuSNJRcr0jNlAisq+ip+CeyZEeDrUyciS9TkLlGYfj
         dbcy4Xo8B9kho4T4AX58DMJyARvO6fzLucdO64CbSBW78TQp2+zWLRcGxoWBqHC7Wqnl
         ugzUsNGQscNFeu933dFehPkEh6b4cOniqzEQE1+Bp+WZ99t7SA1mIGuOncHQUXJrH6dq
         BscEDosJLcdE0paxHh5JEvccFc656l5iIu0mXCKJAzu6rCFATTniodIXAb2KuKlOHf17
         bBPBh6Ic5QhDvY0OiDwsnR5ZrkdvdtYtGzOWrxShCBtW65XNwhucp/6jozvJK2d98+bJ
         zjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W0kwIteVI0mAJe/8GLdwxLdQti9AntS3SZzoMzqhgLw=;
        b=sSIs0EKQ6gw8kePrYADMlVWefzCcbbhduaZtuRC0iHc3mKlXYB4fJBiw2pQYL77X+a
         iUQ+k2d1Exb0v7PRIS8BKgI7ZnWaG5+V2HAKBO6IZDz5luvpbsEoxsiVxV7YnkuEsFrj
         DsKkGckOLjX90ir8mORPWP7cW9DfLZWZW8E6cmgpxT/53wZHcLGwhQTzpihJbAkUJ9Ga
         RBqKz6Mh6YBxu2n81b0TYUZp27Yx0beh1Jg5lzoz4PGxVh66fMaNNGZxjd8sL4vT9akF
         R9pwXsznd3DObVTrT6X4QsTVuhR+Ejlnq9I/pDTMmStFqYykgDRD6oP8Y58NPMQfAYn/
         1MHQ==
X-Gm-Message-State: ANoB5pkanY35JK+VpSblfQR1ZNnDlOGRzYUlWT+JUFrqqEp3N4Hyfas2
	R4ZJKTQnsq7djoyqTfqQH2l5rA==
X-Google-Smtp-Source: AA0mqf45dQqJidohn5XtTD5EwJO9nHDvzuBWzU55zXECDfvYOndhPvKLiASo8cnZl+ak2FavaQGSTQ==
X-Received: by 2002:a05:6512:3741:b0:4af:d4e:dfa7 with SMTP id a1-20020a056512374100b004af0d4edfa7mr4201645lfs.582.1668443373053;
        Mon, 14 Nov 2022 08:29:33 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e17-20020a05651c039100b002770d8625ffsm2069731ljp.88.2022.11.14.08.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 08:29:32 -0800 (PST)
Message-ID: <4ce3199e-1c9c-2fca-804e-dadc87a85704@linaro.org>
Date: Mon, 14 Nov 2022 17:29:31 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] arm64: dts: Add basic support for BIQU CB1
Content-Language: en-US
To: Martin Botka <martin.botka@somainline.org>, martin.botka1@gmail.com
Cc: ~postmarketos/upstreaming@lists.sr.ht,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jamipkettunen@somainline.org>,
 Paul Bouchara <paul.bouchara@somainline.org>, Yenda <jtrmal@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20221114162547.1802689-1-martin.botka@somainline.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221114162547.1802689-1-martin.botka@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/11/2022 17:25, Martin Botka wrote:
> CB1 is Compute Module style board that plugs into Rpi board style adapter or
> Manta 3D printer boards (M4P/M8P).
> 
> The board has:
> 	H616 SoC
> 	1GB of RAM
> 	AXP313A PMIC
> 
> And the actual boards that CB1 plugs in are just extension to it with ports and
> thus are not split in DT.
> 
> Boards have:
> 	4x (3x for Manta boards) USB and 1 USB OTG.
> 	SDcard slot for loading images.
> 	Ethernet port wired to the internal PHY.
> 	2x HDMI 2.0.
> 	Power and Status LEDs.
> 
> Currently working:
> 	Booting
> 	USB
> 	UART
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../dts/allwinner/sun50i-h616-biqu-cb1.dts    | 191 ++++++++++++++++++
>  2 files changed, 192 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index 6a96494a2e0a..223f1be73541 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -38,5 +38,6 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64-model-b.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6-mini.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-biqu-cb1.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1.dts
> new file mode 100644
> index 000000000000..2225a965dddc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-biqu-cb1.dts
> @@ -0,0 +1,191 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +/*
> + * Copyright (C) 2022 Arm Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-h616.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	model = "BIQU CB1";
> +	compatible = "allwinner,sun50i-h616";

That's not a proper board compatible.

> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			function = LED_FUNCTION_POWER;
> +			color = <LED_COLOR_ID_RED>;
> +			gpios = <&pio 2 12 GPIO_ACTIVE_HIGH>; /* PC12 */
> +			default-state = "on";
> +		};
> +
> +		led-1 {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&pio 2 13 GPIO_ACTIVE_HIGH>; /* PC13 */
> +		};
> +	};
> +
> +	reg_vcc5v: vcc5v {

regulator prefix. Keep it consistent.

> +		/* board wide 5V supply directly from the USB-C socket */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc-5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_usb1_vbus: regulator-usb1-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb1-vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&reg_vcc5v>;
> +		enable-active-high;
> +		gpio = <&pio 2 16 GPIO_ACTIVE_HIGH>; /* PC16 */
> +	};
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&ehci1 {
> +	status = "okay";
> +};
> +
> +&ehci2 {
> +	status = "okay";
> +};
> +
> +&ehci3 {
> +	status = "okay";
> +};
> +
> +&mmc0 {
> +	vmmc-supply = <&reg_dldo1>;
> +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
> +	no-1-8-v;
> +	bus-width = <4>;
> +	status = "disabled";
> +};
> +
> +&ohci0 {
> +	status = "okay";
> +};
> +
> +&ohci1 {
> +	status = "okay";
> +};
> +
> +&ohci2 {
> +	status = "okay";
> +};
> +
> +&ohci3 {
> +	status = "okay";
> +};
> +
> +&r_i2c {
> +	status = "okay";
> +
> +	axp1530: pmic@36 {
> +		compatible = "x-powers,axp1530";
> +		status = "okay";

Drop.

> +		reg = <0x36>;
> +		wakeup-source;
> +
> +		standby_param: standby_param {

Does not look like supported/documented/valid property. Test your DTS
with `make dtbs_check`.


Best regards,
Krzysztof

