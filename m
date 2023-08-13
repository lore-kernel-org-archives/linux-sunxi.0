Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DD0847A
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Aug 2023 15:55:40 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-31768ce2e81so3266360f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Aug 2023 08:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691942138; x=1692546938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+v594WFhoKGKPhc9s5d1F0oYt8RtqM1zl2VBPjPdwo=;
        b=k8SP7JJWynqybM3Le4yktQeAKPxrJuuf626+ivR1d6Y57NiYHuw0U0m40K3vl25Ilg
         ITyTTf5+xvYNpx6ULPR8goTVGkdFffYUcbzx6bNlvyoFYWHRCXhs6ucaopiMgH96p63o
         w15x7aSSY8AlYRkaUY3vQ1Yu+6ydnhAoLrVdXrsSf7BOKaIpLfXnGmCpDR6c1qJuNhV9
         zKz3rfniPZBUj2AUO+7TAFTKJgszyjkcQxUQJCTks4c1PIyXYhfZDSHUSRt2wn6LkNbc
         1Kyo3fOE3Z1mIDrHAB4LCN+tvgB02B9ADraA7+DlU7WAWHDfhQtmjwAKdSgSZrFqo26r
         vfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691942138; x=1692546938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+v594WFhoKGKPhc9s5d1F0oYt8RtqM1zl2VBPjPdwo=;
        b=QhYIp1LvCqMEueAt9kHhArrzYVMklZebfylDQl5ky9WFkG83AMUK8dITcCcKzT4+lz
         uG72oNsR1+rAzXPdMfVCqMLKmPJjZYM6K+Lmj2TiUEsOYiQ22WqJGVf/2+a5Ruw2nIj+
         veWeRtZN9D2co+eMLXlK6kBH6rNMQyA9szplI3Nf4mHd9vha28DT1iPErsoddS8mwDsO
         7hwK0eEBeiwdOKFRxvstIRPMx/Ac1yaf4BJWxCI5v1JQuwDqMUbKcjLQCVwZI5ejXO+Q
         t+13C/zHBTed/TAbHQfKHes08fnbuZFXObKb9y50k0rZFpE/c0Wh0g6mEGcW3qJf9+ov
         tqXQ==
X-Gm-Message-State: AOJu0YxrLpEXYZmGEybgD1xzC2SjKa8H1Rr3J46JPgFFV+zFcWK6HsRq
	uakJnncrCBNqNEkisnx8O2A=
X-Google-Smtp-Source: AGHT+IGzEr6gwepzvVa0PljHgzzwXp1bmG0sdrcyd+0K06UKrhNmE/xCgn1h9hQZnYv/m8woAvekVQ==
X-Received: by 2002:a5d:4dcb:0:b0:319:12c2:59cd with SMTP id f11-20020a5d4dcb000000b0031912c259cdmr5244937wru.54.1691942138141;
        Sun, 13 Aug 2023 08:55:38 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id w4-20020adfcd04000000b003176eab8868sm11779092wrm.82.2023.08.13.08.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 08:55:37 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Martin Botka <martin.botka1@gmail.com>, Martin Botka <martin@biqu3d.com>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jami Kettunen <jamipkettunen@somainline.org>,
 Paul Bouchara <paul.bouchara@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Andre Przywara <andre.przywara@arm.com>, Martin Botka <martin@biqu3d.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Ludwig Kormann <ludwig.kormann@ict42.de>, Andrew Lunn <andrew@lunn.ch>,
 Icenowy Zheng <uwu@icenowy.me>, Heiko Stuebner <heiko@sntech.de>,
 Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>, Jagan Teki <jagan@edgeble.ai>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v4 4/4] arm64: dts: allwinner: h616: Add BigTreeTech Pi support
Date: Sun, 13 Aug 2023 17:55:35 +0200
Message-ID: <10318766.nUPlyArG6x@jernej-laptop>
In-Reply-To: <09BFA974F83AB0E8+20230807145349.2220490-5-martin@biqu3d.com>
References:
 <20230807145349.2220490-1-martin@biqu3d.com>
 <09BFA974F83AB0E8+20230807145349.2220490-5-martin@biqu3d.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 07. avgust 2023 ob 16:53:24 CEST je Martin Botka napisal(a):
> The BigTreeTech Pi is an H616 based board based on CB1.
> Just in Rpi format board.
> 
> It features the same internals as BTT CB1 but adds:
>     - Fan port
>     - IR receiver
>     - ADXL345 Accelerometer connector via SPI
>     - 24V DC power supply via terminal plugs
>     - USB to CAN module connector (The actual USB to CAN happens on the
> external module)
> 
> List of currently working things is same as BTT CB1 but also:
>     - IR receiver
>     - ADXL345 connector
> 
> Signed-off-by: Martin Botka <martin@biqu3d.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Changes in V2:
>     - Add UART alongside aliases and chosen for it
>     - Add model string
>     - Enable IR receiver
>     - Enable SPI0 for ADXL345 connector
> Changes in V3:
>     - Add missing semicolons
>     - Add pinctrl for SPI0
> 
>  arch/arm64/boot/dts/allwinner/Makefile        |  1 +
>  .../allwinner/sun50i-h616-bigtreetech-pi.dts  | 70 +++++++++++++++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644
> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile
> b/arch/arm64/boot/dts/allwinner/Makefile index 7b386428510b..0b6232a7f328
> 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -39,5 +39,6 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64-model-b.dtb
> dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6-mini.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-cb1-manta.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-pi.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts new file
> mode 100644
> index 000000000000..b0d0386e8f13
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +/*
> + * Copyright (C) 2023 Martin Botka <martin@biqu3d.com>.
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-h616-bigtreetech-cb1.dtsi"
> +
> +/ {
> +	model = "BigTreeTech Pi";
> +	compatible = "bigtreetech,pi", "allwinner,sun50i-h616";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
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
> +&ir {
> +	status = "okay";
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
> +&spi0 {
> +	/* SPI connection for onboard connector for ADXL345 accelerometer 
*/
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi0_pins>, <&spi0_cs0_pin>;

Driver and compatible for ADXL345 already exists, why don't you add child node 
for it?

Best regards,
Jernej

> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_ph_pins>;
> +	status = "okay";
> +};




