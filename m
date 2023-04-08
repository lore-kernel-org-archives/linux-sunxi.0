Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D431841
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Apr 2023 12:13:18 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id dm2so2547135ejc.8
        for <linux-sunxi@lists.linux.dev>; Sat, 08 Apr 2023 05:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680955997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJmx+f31axUvoi/dHkgurPuWKlYeJjKe0B/02y5c1hI=;
        b=a+IjEn62kIWwcZ1L/0L2xqhD74h6hRmUfo3qpuksXoLGNeOb3o0LNm5Rkuhy1ceoZj
         G2FqB3KjrcvLilfhlREqtlyPFpLTyIcWqGv3DbCi7nMiZzC0yAyQvD4eFDsMp2pGJCDd
         Iw3QZkste1SEC1xUqFgC+mySd6T8WPFhNtNzcqOKWigvWcWPFju0Rs+rnn1Ij3oP70v+
         UC5hlnB3eI+HSAYZYtkG2LFxQnrUbMox7Q4THkgLdbqrIVYTgbW7nzskqqQA0HQH7OOr
         fXmaenBIXmo4jZke7XPI9VH2iY63pKwDMnufg4g8yUbERhcUXDNbmnbzI8IApZ0NxGw6
         LYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680955997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJmx+f31axUvoi/dHkgurPuWKlYeJjKe0B/02y5c1hI=;
        b=bbOnY63M+MuY2GcV2x+YiY6ug8hiR3Zx6apUYMuU4UYT01vqTsh7hjpCna3HpcvEPf
         eLDpG3XyDeZ7X6mp8oYWmYX0GwtsPq6E8NTs91TDV2BcVRjfOwBztYYA5PczsCAxS9Xi
         oIGVDk/XjLV6hRZusZtlhegL+k1CkFgUacyG6KvTCEVJwpr490O7z+o5PGQahXWJk05r
         xvl3l+8B6pktWV9QH5gPRuiQM8nmZaItzXm3axBnJe2213FerYOsOgaFZTIr1WATdLkV
         gv+bdhKxU0FqIN6ucwwN9ZSmaYUMLciwAOyA+LKjZVd9pfB8cCHIi2pwlTJ4lHBVhoZH
         T0QA==
X-Gm-Message-State: AAQBX9cuwgHnZJrpH9/4h1ksscJh9i1ETF/6KvCDra7ga2aCd4jHUs8T
	LCbRl5kgqxVYCFQaFbXYSFo=
X-Google-Smtp-Source: AKy350b94j/ZxQUi+lYQF+Fq1CVL4fCn0M+Vx7zcnJOgNusGmaSl0GNLXQqXyciV5Dpd1F/TZOyYoA==
X-Received: by 2002:a17:907:6d90:b0:8aa:c090:a9ef with SMTP id sb16-20020a1709076d9000b008aac090a9efmr2550022ejc.55.1680955996826;
        Sat, 08 Apr 2023 05:13:16 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090617c100b00930b13f6abdsm3108700eje.98.2023.04.08.05.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 05:13:16 -0700 (PDT)
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
 Re: [PATCH v2 05/10] ARM: dts: sunxi: h3/h5: Switch dma-names order for
 snps,dw-apb-uart nodes
Date: Sat, 08 Apr 2023 14:13:14 +0200
Message-ID: <1754521.VLH7GnMWUR@jernej-laptop>
In-Reply-To: <20230321215624.78383-6-cristian.ciocaltea@collabora.com>
References:
 <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
 <20230321215624.78383-6-cristian.ciocaltea@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 21. marec 2023 ob 22:56:19 CEST je Cristian Ciocaltea napisal(a):
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
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> b/arch/arm/boot/dts/sunxi-h3-h5.dtsi index 686193bd6bd9..ade1cd50e445
> 100644
> --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> @@ -710,7 +710,7 @@ uart0: serial@1c28000 {
>  			clocks = <&ccu CLK_BUS_UART0>;
>  			resets = <&ccu RST_BUS_UART0>;
>  			dmas = <&dma 6>, <&dma 6>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -723,7 +723,7 @@ uart1: serial@1c28400 {
>  			clocks = <&ccu CLK_BUS_UART1>;
>  			resets = <&ccu RST_BUS_UART1>;
>  			dmas = <&dma 7>, <&dma 7>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -736,7 +736,7 @@ uart2: serial@1c28800 {
>  			clocks = <&ccu CLK_BUS_UART2>;
>  			resets = <&ccu RST_BUS_UART2>;
>  			dmas = <&dma 8>, <&dma 8>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};
> 
> @@ -749,7 +749,7 @@ uart3: serial@1c28c00 {
>  			clocks = <&ccu CLK_BUS_UART3>;
>  			resets = <&ccu RST_BUS_UART3>;
>  			dmas = <&dma 9>, <&dma 9>;
> -			dma-names = "rx", "tx";
> +			dma-names = "tx", "rx";
>  			status = "disabled";
>  		};




