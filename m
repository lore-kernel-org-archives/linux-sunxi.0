Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E552591C
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Aug 2023 20:59:34 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-31757edd9edso1147749f8f.2
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Aug 2023 13:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691096373; x=1691701173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DP2b+AILmlpdJLSBdLdZp7i7Y6kRAXSbaj0B+upIxrM=;
        b=KzzRQ4S29CvAU+TMW8J+OxQJT0N2VhnDo449Nyam5kEaT/lCE1i/60oslFCK2Hsg9Y
         GJ8tR5nS/QQr2daknYxum4FyeNCoXDvPajZSppWA6fXsarteFlTEBTQle6I5+qDh5yVh
         ngnmh8QazL+AyBdq85o1BjPm/64gbyFgTStzkiooUU9Phj5GbPjSBKK5KeinEBVRMQLR
         MDoaI9uwvFjXnuP2iW6YwDSKktwQRl82ymGuY3S2+HdlfHslVj6n95vbQklGMBrrmdrM
         8IYb17FZ/8wMlU/YHeTfKrPsbOBC64FDYeO76bYT6bsFN3xrpmEJ2qCgl3q0dXPynKZV
         LtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691096373; x=1691701173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DP2b+AILmlpdJLSBdLdZp7i7Y6kRAXSbaj0B+upIxrM=;
        b=OnjXJzQ3FeCPDeDCc3DzsB+CijEp8B/5pIVvo0a6Z/N7fPHMMU9FQ9h1al5pl/npu9
         jl9IDv5bkLdYii9219vyYRjr+jqBVVy8uTqRrkN6Ix0zZN6dVndCl4JKJvCyAhY1C4au
         fZ4ikrOrCoUDZxcLCayIw1JufKBCPjLDy8r73pJOu/p+ntYlYxqFewzHsZBsMuXG4MvI
         0hiJLmz9TIyOvBX7R3rGIjNOf1w2zl62icn23EfBX7LyE8V50tl84kYgFOoE2jPQhZZH
         b0iPX2VeGywzZrBFz5f+wIAa+jspVPsA0RwCO1ANKAOA+vYfmqq39gBCrMgsCg1tUFO9
         s+RA==
X-Gm-Message-State: ABy/qLaJ8LFeJUIbPPy2YWjBa/Vr8TFwuqH/DoJ4aZp39RDfZ7Tu4MZL
	lpOsOxjl2QL/Qt9PvXhtTRGc8jQN5o1X/A==
X-Google-Smtp-Source: APBJJlHHfuo6kBelJvqwbXH9kUi+80SC8CQMEFEj5k03HeeeLJcquEgoQREJ2cxFra7O+czacV7ZcQ==
X-Received: by 2002:a5d:69c1:0:b0:314:c9c:bc96 with SMTP id s1-20020a5d69c1000000b003140c9cbc96mr7821541wrw.7.1691096372657;
        Thu, 03 Aug 2023 13:59:32 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id u7-20020a5d5147000000b0031437ec7ec1sm770658wrt.2.2023.08.03.13.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 13:59:32 -0700 (PDT)
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
 linux-kernel@vger.kernel.org, mkl@pengutronix.de
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Specify default CAN pins
Date: Thu, 03 Aug 2023 22:59:30 +0200
Message-ID: <3248110.44csPzL39Z@jernej-laptop>
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

/cc Marc

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

pinctrl-names and pinctrl-0 are usually at the top. However, since there is no 
hard rule (I've seen it mixed), I'm fine with it.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Since original DT node entry goes through netdev tree, this should be picked 
there or it can be dropped there and I pick both patches or I can pick patch 
for later kernel version.

Best regards,
Jernej

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




