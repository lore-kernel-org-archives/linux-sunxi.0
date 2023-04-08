Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667261841
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Apr 2023 12:12:16 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id gb34so2593314ejc.12
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Apr 2023 05:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680955934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsp6bAaqdkC+3l7L0QU9gWWFuWF86YUu16J9MyhyV3E=;
        b=Vzms7iQnafiqUkeMs1GMmPsw583bn+6RhHpsqKO6zfkfU10NzcwiOfy+EMZesNx5vb
         W+YGKbjYybKIxFFaYXDNotsBdrMm6NKOWtzAu6Yvjv3USDondpL9Ns2QsTGtrVTgd0Wg
         stS2FNX2Z3XSzrNDITuRIme9HfeIEahuuNLWvC06exD1Qjg1lv9/wjHLnb+arT4M2mtH
         g8w9lhCldDRNFrIV5VY1w98FYZKIwEDJqt0SUy2epVSqNrUkcsKdQfGAsgRMuDcVrFBi
         dhkdgQDTnRXFVF3EEBUsF5hphK0cX6AdpsOQoyHLUCyAiZ4sEQgNlvshf4rmgrD1cXEI
         ReZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680955934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsp6bAaqdkC+3l7L0QU9gWWFuWF86YUu16J9MyhyV3E=;
        b=Z/2VXhdjREhn7Lz8LCZlDVAXi7Hdo0XuEs6GV0c2GwIpnvHCosYG1figkKLq0KFkM3
         xYY/817xXtzvnZaJskHW1XOQ1l1sTNNQY3mddxMHjgqzOsVXZQVJXALamhsMeHnszTf1
         Wyq0BkkvoacaGfMp14C7d9RmUWNCfNSgc6zEZiUjKJwQyk6INJ7dCiWD1aSwGh193qOa
         UATO7bO/B2hsVr6kPs81oCtu+UHIUgLVI2pXnoNy2Dw9AG1ZxFrU8oDDcb6B2+1c41O6
         ezAnKgED8CuQjc1FNn4colMcyOfhKAai565mENK0dMDANm3qCKuvLSOdZ3/n1oXeVBIi
         gG4A==
X-Gm-Message-State: AAQBX9dsvaun2iEdS4pz6Xn5N6HCfVW0Eozx5AygDrBSBT2gV1+Ggl02
	RbVp3mdpc79ks7JFLWhYZQA=
X-Google-Smtp-Source: AKy350ZoljWQmJaFYZYXyiATILTnWWThGxROLCrvBR/uFCN9linJDLlNU8p8TFP9b2zvbHhV1DPxfg==
X-Received: by 2002:a17:907:e91:b0:920:254c:1e2d with SMTP id ho17-20020a1709070e9100b00920254c1e2dmr2670313ejc.39.1680955934385;
        Sat, 08 Apr 2023 05:12:14 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id m2-20020a1709062ac200b008b176df2899sm3072135eje.160.2023.04.08.05.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 05:12:13 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
Subject:
 Re: [PATCH v2 02/10] ARM: dts: sun6i: a31: Switch dma-names order for
 snps,dw-apb-uart nodes
Date: Sat, 08 Apr 2023 14:12:12 +0200
Message-ID: <7505967.EvYhyI6sBW@jernej-laptop>
In-Reply-To: <20230321215624.78383-3-cristian.ciocaltea@collabora.com>
References:
 <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
 <20230321215624.78383-3-cristian.ciocaltea@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 21. marec 2023 ob 22:56:16 CEST je Cristian Ciocaltea napisal(a):
> Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
> dma-names properties") documented dma-names property to handle Allwinner
> D1 dtbs_check warnings, but relies on the rx->tx ordering, which is the
> reverse of what a bunch of different boards expect.
> 
> The initial proposed solution was to allow a flexible dma-names order in
> the binding, due to potential ABI breakage concerns after fixing the DTS
> files. But luckily the Allwinner boards are not affected, since they are
> using a shared DMA channel for rx and tx.
> 
> Hence, the first step in fixing the inconsistency was to change
> dma-names order in the binding to tx->rx.
> 
> Do the same for the snps,dw-apb-uart nodes in the DTS file.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm/boot/dts/sun6i-a31.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi
> b/arch/arm/boot/dts/sun6i-a31.dtsi index 6cdadba6a3ac..5cce4918f84c 100644
> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
> @@ -822,7 +822,7 @@ uart0: serial@1c28000 {
>  			clocks = <&ccu CLK_APB2_UART0>;
>  			resets = <&ccu RST_APB2_UART0>;
>  			dmas = <&dma 6>, <&dma 6>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -835,7 +835,7 @@ uart1: serial@1c28400 {
>  			clocks = <&ccu CLK_APB2_UART1>;
>  			resets = <&ccu RST_APB2_UART1>;
>  			dmas = <&dma 7>, <&dma 7>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -848,7 +848,7 @@ uart2: serial@1c28800 {
>  			clocks = <&ccu CLK_APB2_UART2>;
>  			resets = <&ccu RST_APB2_UART2>;
>  			dmas = <&dma 8>, <&dma 8>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -861,7 +861,7 @@ uart3: serial@1c28c00 {
>  			clocks = <&ccu CLK_APB2_UART3>;
>  			resets = <&ccu RST_APB2_UART3>;
>  			dmas = <&dma 9>, <&dma 9>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -874,7 +874,7 @@ uart4: serial@1c29000 {
>  			clocks = <&ccu CLK_APB2_UART4>;
>  			resets = <&ccu RST_APB2_UART4>;
>  			dmas = <&dma 10>, <&dma 10>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -887,7 +887,7 @@ uart5: serial@1c29400 {
>  			clocks = <&ccu CLK_APB2_UART5>;
>  			resets = <&ccu RST_APB2_UART5>;
>  			dmas = <&dma 22>, <&dma 22>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};




