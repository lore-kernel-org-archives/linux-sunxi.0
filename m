Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE33A179A0
	for <linux-sunxi@lists.linux.dev>; Tue, 12 Sep 2023 15:54:33 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9a9f139cd94so653086866b.2
        for <linux-sunxi@lists.linux.dev>; Tue, 12 Sep 2023 08:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694534072; x=1695138872; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8oHJ2ujiJlxAUemtJ2j3LYJnlvFVhGLWaN0VZa8yeI=;
        b=B/aa3pT3OSqAL1r94OagLGIYuKKEI5EizAvW3ga/5tc+IlzxblH9w4z7VpZ2oXtJl/
         VJ96GGXqPBRmOHtlIpFkT9WagVTuNbuMuv2FABB4mDWM7gsp3ERuGnxhDtBUdmJpVvbk
         MSQC0kDEyHd3SbKN4YT/OD0VWeRa9wHvhReqjD5U/fGsgYZbxRHWSCDmaUeweVznFuxl
         8D6YIgdmfKc8opRD5It6DtlhSxIm3Vh7sC3Y4Z/zIjO0h8Jbcl0OnhH3063UsskR2wae
         fWu2Pr8Xlh5vAO0flaDcGMO7Ehgk0p0XDQmtDoxyDLVmvGXZHSLEBFy6wMESn1JrXaU8
         o5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694534072; x=1695138872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8oHJ2ujiJlxAUemtJ2j3LYJnlvFVhGLWaN0VZa8yeI=;
        b=iFQD1QYLjJpTnugyWZsorRwYNAfTq2P7/PiI6vK5M0G5ZJouNMHqZxSGb51CGfHyup
         kzSDsMRXQXHEvPbWW5suqzqeKJAtndmiLwRNaZMqKgjT9C8Za/tfcJtox4S2icCLR4Vt
         p6Zt4t6aOeLY0OmSmzR0WbenhDsupkvGnDY4M2UGamV6NrSq6l/+HP7/+3CIoLYyJ3mp
         D7zV9JnWuQlCibXl+t35LAwKrJRO7ytedpNw38rb54GrC/4qCufacoHa2dUkC64yKsf4
         5dDIgYy6A4dITWALqxg2nvKXOvPyz/3LkB17iuyDl9OpnK3VslxUk77FNqbNNAqs9dti
         MK/g==
X-Gm-Message-State: AOJu0YwsdtE1vAqR2C01ArPh+qeKjlTPy+SByu0gewofnk1k6FDeMiIO
	zBkrUADbZYZhLR5qKtbzlw6PUFO+HP1lr/Q7
X-Google-Smtp-Source: AGHT+IEEM/bk4nQRqipf1BKh7nG712N1GnvGVrUcH4eqH2pGf0pFfIu2q7I8cr4PaxHXmrgjqYI4VA==
X-Received: by 2002:a17:906:2101:b0:9a1:6318:4d39 with SMTP id 1-20020a170906210100b009a163184d39mr11291101ejt.29.1694534072102;
        Tue, 12 Sep 2023 08:54:32 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id lf28-20020a170907175c00b0099bcf1c07c6sm7032766ejc.138.2023.09.12.08.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 08:54:31 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Martin Botka <martin.botka@somainline.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>,
 Alan Ma <tech@biqu3d.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Martin Botka <martin@biqu3d.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rogerio Goncalves <rogerlz@gmail.com>,
 Martin Botka <martin.botka@somainline.org>
Subject:
 Re: [PATCH v6 4/4] arm64: dts: allwinner: h616: Add BigTreeTech Pi support
Date: Tue, 12 Sep 2023 17:54:30 +0200
Message-ID: <1769061.VLH7GnMWUR@jernej-laptop>
In-Reply-To: <20230912-b4-cb1-v6-4-bb11238f3a9c@somainline.org>
References:
 <20230912-b4-cb1-v6-0-bb11238f3a9c@somainline.org>
 <20230912-b4-cb1-v6-4-bb11238f3a9c@somainline.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 12. september 2023 ob 13:20:50 CEST je Martin Botka napisal(a):
> From: Martin Botka <martin@biqu3d.com>
> 
> The BigTreeTech Pi is an H616 based board based on CB1.
> Just in Rpi format board.
> 
> It features the same internals as BTT CB1 but adds:
>     - Fan port
>     - IR receiver
>     - ADXL345 Accelerometer connector via SPI
>     - 24V DC power supply via terminal plugs
>     - USB to CAN module connector (External Module)
> 
> List of currently working things is same as BTT CB1 but also:
>     - IR receiver
>     - ADXL345 connector
> 
> Signed-off-by: Martin Botka <martin@biqu3d.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/Makefile             |  1 +
>  .../dts/allwinner/sun50i-h616-bigtreetech-pi.dts   | 63
> ++++++++++++++++++++++ 2 files changed, 64 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile
> b/arch/arm64/boot/dts/allwinner/Makefile index 42e525b9d4b9..3aca6787a167
> 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -39,6 +39,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64-model-b.dtb
> dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6-mini.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-cb1-manta.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-pi.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
> b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts new file
> mode 100644
> index 000000000000..832f08b2b260
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dts
> @@ -0,0 +1,63 @@
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
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_ph_pins>;
> +	status = "okay";
> +};




