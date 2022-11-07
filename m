Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964BA12294
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 18:00:13 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id n12so32218898eja.11
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Nov 2022 10:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qXYfH922nz60/C2ufg0GwkxiRdJKrLocdXP1wbKGBg=;
        b=f7rLot3YbAnFTqU/eAGjP36tD/WbjTGB/d7HVVGa4NwIhxDeLBcw31G1ZEWd0jFa+i
         S0KCN78AdrYspz3daBt6/18jhviRbiaPRdniIpZshxmiywDEZzqZdelcNCw+QrLAat+b
         +O2aXs2JL40wkVk4yLNLa1beabzaDYE5APoLWOF5HDKBxtRy34HtD9s7fKjqv45WsX6b
         Nl+j5oYUmHaxnkTqGYTfVhf3OYSzovdwc/nQ9llH9UCQc4NrxHodW9e4nx5gZrmM/s26
         91WzqjrVccJ2j9bT9WwN8N3Zb6oGA/IfII0DWKDdJ5lpXyLQcBPbjC5Ofaz6/rtOUeQU
         tctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qXYfH922nz60/C2ufg0GwkxiRdJKrLocdXP1wbKGBg=;
        b=6jYDNSj0Qddi8tPjvCTHAyDd5K0WXcSpsLexCypWcPkjVaTq+6uZA7SS4yrPrSj5bA
         BznWToAOWVHXT//NOmH2rn5mJQQEZ1WkWvg67vZ5YBaaNAgmETsYc4rr2g7bebsfFB1+
         Yr83w0lEJlewY+yZheYTzKJnM9NnDSkXfdU2+jw1SHPRRZeL6IaplUmiyestqWSQo4tk
         zYvpEURLY5jGBhZIsxbZzViV1RWMYm1SDN+KLY98aVq56C7+Tt02RMV9JYpja1WuiMpF
         GZ7DZ0/vxrFk8m/+4efFsUGo52gB1gcx5k8zNaqyGt5xLqeEoE1EGjs4yvcTG4FkfXO2
         wrjA==
X-Gm-Message-State: ACrzQf36VqKQ3395SJnVCd5K/S5fUoejSBRAfgazIGSUGyEf7MegbnQL
	wpxuIXZxlZJT42RlPqeP9sk=
X-Google-Smtp-Source: AMsMyM7UPfq/X2hAwiOl4KMSOHF8gEmbKBuGKWyMVpNPRUANx4uudsW0OpHCas2ISvqvwr+aSFH9iw==
X-Received: by 2002:a17:907:9615:b0:7ae:1219:7032 with SMTP id gb21-20020a170907961500b007ae12197032mr24624962ejc.658.1667844011844;
        Mon, 07 Nov 2022 10:00:11 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id 8-20020a170906300800b0073dd8e5a39fsm3664768ejz.156.2022.11.07.10.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 10:00:11 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andre Przywara <andre.przywara@arm.com>
Cc: =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 03/10] ARM: dts: suniv: f1c100s: add I2C DT nodes
Date: Mon, 07 Nov 2022 19:00:10 +0100
Message-ID: <7447015.EvYhyI6sBW@kista>
In-Reply-To: <20221107005433.11079-4-andre.przywara@arm.com>
References: <20221107005433.11079-1-andre.przywara@arm.com> <20221107005433.11079-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 07. november 2022 ob 01:54:26 CET je Andre Przywara 
napisal(a):
> The Allwinner F1C100s series of SoCs contain three I2C controllers
> compatible to the ones used in other Allwinner SoCs.
> 
> Add the DT nodes describing the resources of the controllers.
> I2C1 has only one possible pinmux, so add the pinctrl properties for
> that already.

Above statement doesn't match current changes anymore. With that removed:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

If nothing else pops up, I can fix this while applying.

Best regards,
Jernej

> At least one board connects an on-board I2C chip to PD0/PD12 (I2C0), so
> include those pins already, to simplify referencing them later.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/boot/dts/suniv-f1c100s.dtsi | 42 ++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> b/arch/arm/boot/dts/suniv-f1c100s.dtsi index 81749d5da12f..4f45168cea42
> 100644
> --- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> +++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> @@ -192,6 +192,12 @@ mmc0_pins: mmc0-pins {
>  				drive-strength = <30>;
>  			};
> 
> +			/omit-if-no-ref/
> +			i2c0_pd_pins: i2c0-pd-pins {
> +				pins = "PD0", "PD12";
> +				function = "i2c0";
> +			};
> +
>  			spi0_pc_pins: spi0-pc-pins {
>  				pins = "PC0", "PC1", "PC2", 
"PC3";
>  				function = "spi0";
> @@ -203,6 +209,42 @@ uart0_pe_pins: uart0-pe-pins {
>  			};
>  		};
> 
> +		i2c0: i2c@1c27000 {
> +			compatible = "allwinner,suniv-f1c100s-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x01c27000 0x400>;
> +			interrupts = <7>;
> +			clocks = <&ccu CLK_BUS_I2C0>;
> +			resets = <&ccu RST_BUS_I2C0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@1c27400 {
> +			compatible = "allwinner,suniv-f1c100s-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x01c27400 0x400>;
> +			interrupts = <8>;
> +			clocks = <&ccu CLK_BUS_I2C1>;
> +			resets = <&ccu RST_BUS_I2C1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@1c27800 {
> +			compatible = "allwinner,suniv-f1c100s-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x01c27800 0x400>;
> +			interrupts = <9>;
> +			clocks = <&ccu CLK_BUS_I2C2>;
> +			resets = <&ccu RST_BUS_I2C2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		timer@1c20c00 {
>  			compatible = "allwinner,suniv-f1c100s-
timer";
>  			reg = <0x01c20c00 0x90>;
> --
> 2.35.5


