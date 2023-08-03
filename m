Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ADD2591C
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Aug 2023 20:54:12 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-317b31203c7so1299807f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Aug 2023 13:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691096050; x=1691700850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf1shgUQGecS6+2Jrf1Rltefiiin3z+1dw5kwESQLOE=;
        b=I6Svwboa/Lf/XyjqjzLySQ9kXd+YTlRJ8bqidzr0kT/mN0bm9TJmPdDtGmjQcXnC0g
         zBQcpCDi35SqsW4FPFXJHJj1RZUVxAG9y3+pn5FcNg+hMxFImMO4JlkCc7O3h49ok1V8
         G/20JB9KiEbch9eu2VgRw53YLAthzMbfB9hN0mvkNqWW9kQrPE/hV2NIulEL5VRoAnXS
         evmwhdHh7JDKmSF6Y/M4AdK9qWhx3PFjZO4y4hKiuXkoQ6gxswG6Axdus7k3PRoWYMTP
         4D7au3z7X+c80V1G7thDEkn34K/tsUprsXm94oz75+/9csJ5cy2vfl5U+fW7nNy78IwX
         KCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691096050; x=1691700850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gf1shgUQGecS6+2Jrf1Rltefiiin3z+1dw5kwESQLOE=;
        b=XcugLgvmZazw6eHJYbfnsYSlmeAHhYVKd+QVQIyrLK/jnwEg5jknUUN2rYAjfIWRJO
         ppttIfYmepvaaBX53LPt4Bg0MKKNJC8RlJIdWCK85pj1cIho4TX6FIs07iWmZM28j2YF
         LJB2HUp/EVBfgZN4p0gYcX4ibCBEoNykDDNVDS1oHCJ7zpgChxPYQN2ZIEFIv0ckv7Hv
         NE87vHIjD0L5OshJxZhQQ3cZyEYKE0uXGDzsi0Fq3TsWy2qSkTrxab94/iFpzadaCBCh
         iyT5zMLvU/9gb0ygJzgtlC0sYYx9k0oLDjAM3dBQ+5stDHvM/4TTewVXgDSDsCjXdo9s
         WzHA==
X-Gm-Message-State: ABy/qLZRwuf4Vlk9g6qVFVawO6/ZNZy2yb+Q1Wb6poBLzlo+T5xcQA1s
	vJiLMeXoGatCzKVbyBrS1hEuIbSX/AnSBQ==
X-Google-Smtp-Source: APBJJlFSz8tLD3zPBalpC68JbS4T65s5zlyPapVF+FrzONfDahN32ei4XWvdQHLX7eTvk9Ddujpkrg==
X-Received: by 2002:adf:e105:0:b0:314:11f3:ca94 with SMTP id t5-20020adfe105000000b0031411f3ca94mr8109045wrz.41.1691096050225;
        Thu, 03 Aug 2023 13:54:10 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id d6-20020adff2c6000000b003172510d19dsm743046wrp.73.2023.08.03.13.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 13:54:09 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, John Watts <contact@jookia.org>
Cc: John Watts <contact@jookia.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maksim Kiselev <bigunclemax@gmail.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Specify default CAN pins
Date: Thu, 03 Aug 2023 22:54:08 +0200
Message-ID: <2151031.irdbgypaU6@jernej-laptop>
In-Reply-To: <20230731023701.2581713-1-contact@jookia.org>
References: <20230731023701.2581713-1-contact@jookia.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 31. julij 2023 ob 04:36:59 CEST je John Watts napisal(a):
> There are only one set of CAN pins available on these chips.
> Specify these as the default to avoid redundancy in board device trees.
> 
> Signed-off-by: John Watts <contact@jookia.org>
> ---
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi index
> 4086c0cc0f9d..b27c3fc13b0d 100644
> --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -898,6 +898,8 @@ can0: can@2504000 {
>  			interrupts = <SOC_PERIPHERAL_IRQ(21) 
IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&ccu CLK_BUS_CAN0>;
>  			resets = <&ccu RST_BUS_CAN0>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&can0_pins>;
>  			status = "disabled";
>  		};
> 
> @@ -907,6 +909,8 @@ can1: can@2504400 {
>  			interrupts = <SOC_PERIPHERAL_IRQ(22) 
IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&ccu CLK_BUS_CAN1>;
>  			resets = <&ccu RST_BUS_CAN1>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&can1_pins>;
>  			status = "disabled";
>  		};
>  	};




