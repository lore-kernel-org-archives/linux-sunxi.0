Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937BA3C0F
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Mar 2023 15:30:23 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id r17-20020a05683002f100b006a131458abfso2163908ote.2
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Mar 2023 08:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679931022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GyK2fUsSPD/ZhKF2aRPOTaEqWirYfYdqwsIGEX2UYRY=;
        b=ng82dkEKBmY+F793UaIZZnuno66YQ5a9cVKoNvfAJKo6ooOX8koQucPr4cgtRdOnYj
         dD/oA25J9OrIHWSIQtxzCqzqKJBODmekOy8fnR6BcD2SDIYiDfRfRn32Xi4yHSWAfQuw
         4vNvGKMlke/nnUbicbQq8Rt06Jdq21bgju+EGfl66RO1i4t6ha6KB6rdbVgqHEQKT8n0
         iYPlSmLrLdPvKZBArHclLRkWMKNsVvVYD6Y746OvGNQW5aQJ5v1pKDIrqrH9wEM91JGQ
         xjleMOFGXanoh4Hg2g8wDhqqBNxYAEFGlu0HIn9biu/BKwwxm1USIZtdBj15M2WMQ/i+
         R0xg==
X-Gm-Message-State: AO0yUKUC0xhlj7nsXAOgD8Aba6t3Ou1f1zsNOaSFZYPZpJA8vkaSGa36
	psRA6jGOGMbuaram6srTjg==
X-Google-Smtp-Source: AK7set/gGvswDR9Qi8QEAjTtwuOiAplRhNhucwkwiCcY/K2JNpIB9iD2QrPd5kmkGr8CtufM0mCkUA==
X-Received: by 2002:a9d:6642:0:b0:690:a6b3:a2f6 with SMTP id q2-20020a9d6642000000b00690a6b3a2f6mr6294603otm.0.1679931022551;
        Mon, 27 Mar 2023 08:30:22 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j15-20020a9d7f0f000000b0069fb32837a9sm4748248otq.42.2023.03.27.08.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 08:30:22 -0700 (PDT)
Received: (nullmailer pid 3908955 invoked by uid 1000);
	Mon, 27 Mar 2023 15:30:21 -0000
Date: Mon, 27 Mar 2023 10:30:21 -0500
From: Rob Herring <robh@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-sunxi@lists.linux.dev, Conor Dooley <conor@kernel.org>, linux-rockchip@lists.infradead.org, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, kernel@collabora.com, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 01/10] dt-bindings: serial: snps-dw-apb-uart: Switch
 dma-names order
Message-ID: <167993102075.3908904.11641161105077047331.robh@kernel.org>
References: <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
 <20230321215624.78383-2-cristian.ciocaltea@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321215624.78383-2-cristian.ciocaltea@collabora.com>


On Tue, 21 Mar 2023 23:56:15 +0200, Cristian Ciocaltea wrote:
> Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
> dma-names properties") documented dma-names property to handle Allwinner
> D1 dtbs_check warnings, but relies on the rx->tx ordering, which is the
> reverse of what a different board expects:
> 
>   rk3326-odroid-go2.dtb: serial@ff030000: dma-names:0: 'rx' was expected
> 
> A quick and incomplete check shows the inconsistency is present in many
> other DTS files:
> 
> $ git grep -A10 snps,dw-apb-uart | grep dma-names | sort -u
> arch/arm64/boot/dts/rockchip/px30.dtsi-         dma-names = "tx", "rx";
> arch/arm64/boot/dts/rockchip/rk3328.dtsi-       dma-names = "tx", "rx";
> arch/arm64/boot/dts/rockchip/rk3588s.dtsi-      dma-names = "tx", "rx";
> arch/arm/boot/dts/rk3066a.dtsi-                 dma-names = "tx", "rx";
> arch/arm/boot/dts/rk3128.dtsi-                  dma-names = "tx", "rx";
> arch/arm/boot/dts/rk3288.dtsi-                  dma-names = "tx", "rx";
> arch/arm/boot/dts/rv1126.dtsi-                  dma-names = "tx", "rx";
> arch/arm/boot/dts/socfpga.dtsi-                 dma-names = "tx", "rx";
> arch/arm/boot/dts/sun6i-a31.dtsi-               dma-names = "rx", "tx";
> arch/arm/boot/dts/sun8i-a23-a33.dtsi-           dma-names = "rx", "tx";
> arch/arm/boot/dts/sun8i-v3s.dtsi-               dma-names = "rx", "tx";
> arch/arm/boot/dts/sunxi-h3-h5.dtsi-             dma-names = "rx", "tx";
> arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi-  dma-names = "rx", "tx";
> 
> The initial proposed solution was to allow a flexible dma-names order in
> the binding, due to potential ABI breakage concerns after fixing the DTS
> files. But luckily the Allwinner boards are not really affected, since
> all of them are using a shared DMA channel for rx and tx:
> 
> $ git grep -A10 snps,dw-apb-uart | grep 'sun.*dmas' | sort -u
> arch/arm/boot/dts/sun6i-a31.dtsi-       dmas = <&dma 10>, <&dma 10>;
> arch/arm/boot/dts/sun6i-a31.dtsi-       dmas = <&dma 22>, <&dma 22>;
> arch/arm/boot/dts/sun6i-a31.dtsi-       dmas = <&dma 6>, <&dma 6>;
> arch/arm/boot/dts/sun6i-a31.dtsi-       dmas = <&dma 7>, <&dma 7>;
> arch/arm/boot/dts/sun6i-a31.dtsi-       dmas = <&dma 8>, <&dma 8>;
> arch/arm/boot/dts/sun6i-a31.dtsi-       dmas = <&dma 9>, <&dma 9>;
> arch/arm/boot/dts/sun8i-a23-a33.dtsi-   dmas = <&dma 10>, <&dma 10>;
> arch/arm/boot/dts/sun8i-a23-a33.dtsi-   dmas = <&dma 6>, <&dma 6>;
> arch/arm/boot/dts/sun8i-a23-a33.dtsi-   dmas = <&dma 7>, <&dma 7>;
> arch/arm/boot/dts/sun8i-a23-a33.dtsi-   dmas = <&dma 8>, <&dma 8>;
> arch/arm/boot/dts/sun8i-a23-a33.dtsi-   dmas = <&dma 9>, <&dma 9>;
> arch/arm/boot/dts/sun8i-v3s.dtsi-       dmas = <&dma 6>, <&dma 6>;
> arch/arm/boot/dts/sun8i-v3s.dtsi-       dmas = <&dma 7>, <&dma 7>;
> arch/arm/boot/dts/sun8i-v3s.dtsi-       dmas = <&dma 8>, <&dma 8>;
> arch/arm/boot/dts/sunxi-h3-h5.dtsi-     dmas = <&dma 6>, <&dma 6>;
> arch/arm/boot/dts/sunxi-h3-h5.dtsi-     dmas = <&dma 7>, <&dma 7>;
> arch/arm/boot/dts/sunxi-h3-h5.dtsi-     dmas = <&dma 8>, <&dma 8>;
> arch/arm/boot/dts/sunxi-h3-h5.dtsi-     dmas = <&dma 9>, <&dma 9>;
> arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi-  dmas = <&dma 14>, <&dma 14>;
> arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi-  dmas = <&dma 15>, <&dma 15>;
> arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi-  dmas = <&dma 16>, <&dma 16>;
> arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi-  dmas = <&dma 17>, <&dma 17>;
> arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi-  dmas = <&dma 18>, <&dma 18>;
> arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi-  dmas = <&dma 19>, <&dma 19>;
> 
> Switch dma-names order to tx->rx as the first step in fixing the
> inconsistency. The remaining DTS fixes will be handled by separate
> patches.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

