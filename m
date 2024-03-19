Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F04E5FB89
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Mar 2024 23:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710891236; cv=none; b=EyqX3DFrGW1dEl1Gm0B1+JaGNgX5GruJAwqIT6PFPLAqC+eKajkhjamYD0x42mSy0RCGbCHO/fDss8kCiGIIhoatI14SVs/+HimND7hKJJC9vV5KD5hwNrrTXFnai8vdZ68VafOKwnxqayr0wwFZNtD/Xfg0qsw6kckeQsGqw+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710891236; c=relaxed/simple;
	bh=BAeQnfJc0stM5hGfJ6yx1+xz23o3scQQ6R6mOB0fJ6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nAtiJnn/KTV76YLenAIvE+x72eBWxg6Pt41dQ4JfC428X4ciu7rxnCWg97RDxT9m4gEjuQDujK1rkAeGjyrJpNbg+psOq8Fs/YFVnri3s1epuwALWRk+8v4HneS8Fw4PQnQ26321UWcC3KIe7NGRaRxMqMhCHVitD8VnA0iSglo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPYgPnVd; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPYgPnVd"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-513d599dbabso7101332e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Mar 2024 16:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710891233; x=1711496033; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FLndC0G/3mltcgg2R8D275R89gDEgymvsh3WuwDlfNg=;
        b=RPYgPnVdJqpvTFWlKNeaKIVCCUGZHyw6fYDOQSK4kkaziJfyKhlMXwe8KswxXfiue9
         MnuuhHDk03tYs1Tnk9SskB4uWs+HUfPmN5MXxbuhz0SGuX2LmCRIjf49Ov6LWkG/7hah
         9FpxxVhPBExAxhSUYx1Zprw6umuInLwuu7suDZUW3cNxnntFe9I5AnSij5xGk7h6cjXI
         1wRX0sd4Rq7MrJblykMGFQ2FRDWmkbP0PbbXslL7zF4TlwXdsMGm+gagsvzpQ8BuzCZ6
         7QRhH4Sd7SUQxbunKrDHswhDkX9MomCJ4+a3ugzwfr7oNT28//uVUfOOHVoQBuCut8LH
         iRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710891233; x=1711496033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FLndC0G/3mltcgg2R8D275R89gDEgymvsh3WuwDlfNg=;
        b=DoiODdUrytrzJNcqX+5Q8RMfkut3/doSFyyq+geO9gkeW1KLgYLPE6WI4ympKwgaFz
         6MR+qAEZFq36zfYpsZit0wDa4NzfYYJ7QXwnnx+4csQDMJg0AcqcRN9MbL1rQyvSswYq
         Wd2KDcqp3xrPrBG60iEJwe5iGN1eeo9iu46OmvKp+dr2R1HYnGJB0KeAujmsG3pTi4gy
         MyiP0HKhZscNWNCz+XT96nGGp1iQPtbBq71j0XrsCysu5EEwfUjfQ3cggsKKOCK3HKf3
         XSprE/0oLQ1xC78Wef0osNg8Dp/rHHuoeSn3xuo2yfouED9fSr6Y2MiUKt0LcMNVbFLO
         +MZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc7LXFOAc1E0NIaE7b1lWuKBKHp47nqIEJ5YrOUYnhncf0sLhqzvnmI0z6RVeOF3QV4zAC0x7kjSr2uqWlWCy/coJFmpQonDeaA7s=
X-Gm-Message-State: AOJu0YzR0M13sx6Ofx6OlKKFw5uQDH8qZTVY97LIFncZ2R+ScwUeZca6
	m3L5zV36FQVDZfWHukUqn71SPUAknKmRoc6echgRbzX8ZCOYGL4e
X-Google-Smtp-Source: AGHT+IElRQsyC0gfWx4xAvsvJC7lFVi4nDJg4v7hclw7bZA7leEU1CFhGHHNMw1cc+OIkkfSA8z3Jg==
X-Received: by 2002:a05:6512:310c:b0:512:ee61:c32b with SMTP id n12-20020a056512310c00b00512ee61c32bmr2976573lfb.43.1710891232935;
        Tue, 19 Mar 2024 16:33:52 -0700 (PDT)
Received: from [192.168.100.117] (89-76-44-138.dynamic.chello.pl. [89.76.44.138])
        by smtp.gmail.com with ESMTPSA id m24-20020aa7d358000000b0056729e902f7sm6227771edr.56.2024.03.19.16.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 16:33:52 -0700 (PDT)
Message-ID: <ff3b061a-27b7-42b3-b741-1d25c06487ae@gmail.com>
Date: Wed, 20 Mar 2024 00:33:50 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: allwinner: h616: add support for T95
 tv boxes
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20240319-add-t95-axp313-support-v4-0-6204b6d23229@gmail.com>
 <20240319-add-t95-axp313-support-v4-3-6204b6d23229@gmail.com>
 <20240319232236.07007592@minigeek.lan>
Content-Language: pl
From: Kamil Kasperski <ressetkk@gmail.com>
In-Reply-To: <20240319232236.07007592@minigeek.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



W dniu 20.03.2024 o 00:22, Andre Przywara pisze:
> On Tue, 19 Mar 2024 18:50:24 +0100
> Kamil Kasperski <ressetkk@gmail.com> wrote:
>
> Hi Kamil,
>
>> Add dtsi file for T95 tv boxes and add initial support for T95 5G AXP313A
>> variant with a board name H616-T95MAX-AXP313A-v3.0 Internal storage is not
>> accessible due to lack of support for H616 NAND controller.
>>
>> Signed-off-by: Kamil Kasperski <ressetkk@gmail.com>
> thanks for the changes, looks good now, although a bit minimal ;-)
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>
> Please can you wait till the -rc1 release on Sunday, and send a rebased
> version next week? There is a small merge conflict in the dts Makefile
> as of now.
>
> Cheers,
> Andre

Sure, no problem. Thank you very much for a review.

Once it gets merged I'll get back to u-boot patch.

Cheers,
Kamil

>
>> ---
>>  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
>>  arch/arm64/boot/dts/allwinner/sun50i-h616-t95.dtsi | 109 +++++++++++++++++++++
>>  .../dts/allwinner/sun50i-h616-t95max-axp313.dts    |  84 ++++++++++++++++
>>  3 files changed, 194 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
>> index 21149b346a60..294921f12b73 100644
>> --- a/arch/arm64/boot/dts/allwinner/Makefile
>> +++ b/arch/arm64/boot/dts/allwinner/Makefile
>> @@ -42,6 +42,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6-mini.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-cb1-manta.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-pi.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
>> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-t95max-axp313.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-longanpi-3h.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-t95.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-t95.dtsi
>> new file mode 100644
>> index 000000000000..4c02408733bc
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-t95.dtsi
>> @@ -0,0 +1,109 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (C) 2024 Kamil Kasperski <ressetkk@gmail.com>
>> + *
>> + * Common DT nodes for H616-based T95 TV boxes
>> + * There are two versions reported with different PMIC variants.
>> + */
>> +
>> +#include "sun50i-h616.dtsi"
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +/ {
>> +	aliases {
>> +		ethernet1 = &sdio_wifi;
>> +		serial0 = &uart0;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +
>> +	reg_vcc5v: vcc5v {
>> +		/* board wide 5V supply directly from the DC input */
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vcc-5v";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	reg_vcc3v3: vcc3v3 {
>> +		/* discrete 3.3V regulator */
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vcc-3v3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	wifi_pwrseq: pwrseq {
>> +		compatible = "mmc-pwrseq-simple";
>> +		clocks = <&rtc CLK_OSC32K_FANOUT>;
>> +		clock-names = "ext_clock";
>> +		pinctrl-0 = <&x32clk_fanout_pin>;
>> +		pinctrl-names = "default";
>> +		reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
>> +	};
>> +};
>> +
>> +&ehci0 {
>> +	status = "okay";
>> +};
>> +
>> +&ehci2 {
>> +	status = "okay";
>> +};
>> +
>> +&ir {
>> +	status = "okay";
>> +};
>> +
>> +&mmc0 {
>> +	cd-gpios = <&pio 8 16 GPIO_ACTIVE_LOW>;	/* PI16 */
>> +	bus-width = <4>;
>> +	status = "okay";
>> +};
>> +
>> +&mmc1 {
>> +	mmc-pwrseq = <&wifi_pwrseq>;
>> +	bus-width = <4>;
>> +	non-removable;
>> +	status = "okay";
>> +
>> +	sdio_wifi: wifi@1 {
>> +		reg = <1>;
>> +	};
>> +};
>> +
>> +&ohci0 {
>> +	status = "okay";
>> +};
>> +
>> +&ohci2 {
>> +	status = "okay";
>> +};
>> +
>> +&uart0 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&uart0_ph_pins>;
>> +	status = "okay";
>> +};
>> +
>> +&uart1 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
>> +	uart-has-rtscts;
>> +	status = "okay";
>> +};
>> +
>> +&usbotg {
>> +	dr_mode = "host";	/* USB A type receptable */
>> +	status = "okay";
>> +};
>> +
>> +&usbphy {
>> +	status = "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-t95max-axp313.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-t95max-axp313.dts
>> new file mode 100644
>> index 000000000000..08a6b4fcc235
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-t95max-axp313.dts
>> @@ -0,0 +1,84 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (C) 2024 Kamil Kasperski <ressetkk@gmail.com>
>> + *
>> + * Configuration for T95 TV box with board label H616-T95MAX-AXP313A-v3.0
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "sun50i-h616-t95.dtsi"
>> +
>> +/ {
>> +	model = "T95 5G (AXP313)";
>> +	compatible = "t95,t95max-axp313", "allwinner,sun50i-h616";
>> +};
>> +
>> +&mmc0 {
>> +	vmmc-supply = <&reg_dldo1>;
>> +};
>> +
>> +&mmc1 {
>> +	vmmc-supply = <&reg_dldo1>;
>> +	vqmmc-supply = <&reg_aldo1>;
>> +};
>> +
>> +&r_i2c {
>> +	status = "okay";
>> +
>> +	axp313: pmic@36 {
>> +		compatible = "x-powers,axp313a";
>> +		reg = <0x36>;
>> +		#interrupt-cells = <1>;
>> +		interrupt-controller;
>> +
>> +		vin1-supply = <&reg_vcc5v>;
>> +		vin2-supply = <&reg_vcc5v>;
>> +		vin3-supply = <&reg_vcc5v>;
>> +
>> +		regulators {
>> +			reg_aldo1: aldo1 {
>> +				regulator-always-on;
>> +				regulator-min-microvolt = <1800000>;
>> +				regulator-max-microvolt = <1800000>;
>> +				regulator-name = "vcc1v8";
>> +			};
>> +
>> +			reg_dldo1: dldo1 {
>> +				regulator-always-on;
>> +				regulator-min-microvolt = <3300000>;
>> +				regulator-max-microvolt = <3300000>;
>> +				regulator-name = "vcc3v3";
>> +			};
>> +
>> +			reg_dcdc1: dcdc1 {
>> +				regulator-always-on;
>> +				regulator-min-microvolt = <810000>;
>> +				regulator-max-microvolt = <990000>;
>> +				regulator-name = "vdd-gpu-sys";
>> +			};
>> +
>> +			reg_dcdc2: dcdc2 {
>> +				regulator-always-on;
>> +				regulator-min-microvolt = <810000>;
>> +				regulator-max-microvolt = <1100000>;
>> +				regulator-name = "vdd-cpu";
>> +			};
>> +
>> +			reg_dcdc3: dcdc3 {
>> +				regulator-always-on;
>> +				regulator-min-microvolt = <1500000>;
>> +				regulator-max-microvolt = <1500000>;
>> +				regulator-name = "vdd-dram";
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&pio {
>> +	vcc-pc-supply = <&reg_aldo1>;
>> +	vcc-pf-supply = <&reg_dldo1>;
>> +	vcc-pg-supply = <&reg_aldo1>;
>> +	vcc-ph-supply = <&reg_dldo1>;
>> +	vcc-pi-supply = <&reg_dldo1>;
>> +};
>>

