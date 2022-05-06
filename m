Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F487F
	for <linux-sunxi@lists.linux.dev>; Fri,  6 May 2022 16:11:07 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id c12so1770214edv.10
        for <linux-sunxi@lists.linux.dev>; Fri, 06 May 2022 09:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3tVCRctusR50NsJqvwU9ayy4TOZg/tJq1P3xPHYXtsk=;
        b=i1diYqUiflUn78SzAR+JrxbLULT9uZMaQSTddCm1jzoW63mWs9o/6wUCZCkPpxzSmo
         KcoTpc0j+8g6QFq54SoaRdLe0avqJ+Sl5W6MS1qkr1BnWf0Y85jq/ajYjP0l0cMQ53aD
         37fTe/MYOAilcDfsrCXwhGLp5+5U+dTPWX3xKnZr/pI12HA5VJ1J2Ny7vOuGQNpBaJZh
         iXEqX+Pq6PJq50V2ZnFgbU7Q71vjZyQeYyiQOfcGP+jEe/rSNqb2G+j2qAh8YHlbqkFy
         wzfPuETIcT9/lCIIrUFAcuC0n99X8oxK2sfUgwBb0qVr6UvIU9BMaP2VGa21SkTiR2VR
         Ziug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3tVCRctusR50NsJqvwU9ayy4TOZg/tJq1P3xPHYXtsk=;
        b=mvvlemlmmKYusKaAWOBZGcYhROmIGbIwWu7XV8vXAN8QDjls2+yAIJGpCAL7BpXffY
         By9LdG1veGxubLcejAa/RZXk0zP764rezhZkCm6rfYnOxnDCK5Ll4NgoBiPQi8FRySEH
         g8YZB2D/R0D+TlHLrhP+wrDV9EYDap9Qht3JkLXY83IeZdD4l9IJFIv+MqVIDJ5wM+FH
         +TDDRfpPiSFuv+j4JLoctSCRZW8GUkOLBw4tes+XT2KcXx1il0EyPn7331NkTEPFmrSw
         NtFJvkI4Qrgcz+4ijqN/ns4Eyt0kV0gx5nX9NKg4KtHbxIA0i8s8ObHWtN2OzqvbfbCh
         afnA==
X-Gm-Message-State: AOAM533h8l5ubVvUGaBncpdsfzS/oSUavYFnZxf/A/7vnae3inNAiepg
	JU/omH05WDktlxwXMn8H2fo=
X-Google-Smtp-Source: ABdhPJz6k0eo2Uhvh2qOblVPcJzuQ5qSlxygttmHjSaUEbOY57FCjq8PIQAgtt3jlGaXjKhpf9kmdg==
X-Received: by 2002:a05:6402:520e:b0:428:22d0:e996 with SMTP id s14-20020a056402520e00b0042822d0e996mr4135931edd.250.1651853465786;
        Fri, 06 May 2022 09:11:05 -0700 (PDT)
Received: from kista.localnet (cpe1-3-76.cable.triera.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id qs24-20020a170906459800b006f3ef214e1bsm2027255ejc.129.2022.05.06.09.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 09:11:05 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Icenowy Zheng <icenowy@aosc.io>, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v11 2/6] clk: sunxi-ng: h616: Add PLL derived 32KHz clock
Date: Fri, 06 May 2022 18:11:04 +0200
Message-ID: <3607837.MHq7AAxBmi@kista>
In-Reply-To: <20220428230933.15262-3-andre.przywara@arm.com>
References: <20220428230933.15262-1-andre.przywara@arm.com> <20220428230933.15262-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne petek, 29. april 2022 ob 01:09:29 CEST je Andre Przywara napisal(a):
> The RTC section of the H616 manual mentions in a half-sentence the
> existence of a clock "32K divided by PLL_PERI(2X)". This is used as
> one of the possible inputs for the mux that selects the clock for the
> 32 KHz fanout pad. On the H616 this is routed to pin PG10, and some
> boards use that clock output to compensate for a missing 32KHz crystal.
> On the OrangePi Zero2 this is for instance connected to the LPO pin of
> the WiFi/BT chip.
> The new RTC clock binding requires this clock to be named as one input
> clock, so we need to expose this to the DT. In contrast to the D1 SoC
> there does not seem to be a gate for this clock, so just use a fixed
> divider clock, using a newly assigned clock number.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Samuel Holland <samuel@sholland.org>

Applied to sunxi/clk-for-5.19, thanks!

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c      | 8 ++++++++
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.h      | 2 +-
>  include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
>  3 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/
ccu-sun50i-h616.c
> index 49a2474cf314..21e918582aa5 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -704,6 +704,13 @@ static CLK_FIXED_FACTOR_HWS(pll_periph0_2x_clk, "pll-
periph0-2x",
>  			    pll_periph0_parents,
>  			    1, 2, 0);
>  
> +static const struct clk_hw *pll_periph0_2x_hws[] = {
> +	&pll_periph0_2x_clk.hw
> +};
> +
> +static CLK_FIXED_FACTOR_HWS(pll_system_32k_clk, "pll-system-32k",
> +			    pll_periph0_2x_hws, 36621, 1, 0);
> +
>  static const struct clk_hw *pll_periph1_parents[] = {
>  	&pll_periph1_clk.common.hw
>  };
> @@ -852,6 +859,7 @@ static struct clk_hw_onecell_data sun50i_h616_hw_clks = 
{
>  		[CLK_PLL_DDR1]		= 
&pll_ddr1_clk.common.hw,
>  		[CLK_PLL_PERIPH0]	= &pll_periph0_clk.common.hw,
>  		[CLK_PLL_PERIPH0_2X]	= &pll_periph0_2x_clk.hw,
> +		[CLK_PLL_SYSTEM_32K]	= &pll_system_32k_clk.hw,
>  		[CLK_PLL_PERIPH1]	= &pll_periph1_clk.common.hw,
>  		[CLK_PLL_PERIPH1_2X]	= &pll_periph1_2x_clk.hw,
>  		[CLK_PLL_GPU]		= 
&pll_gpu_clk.common.hw,
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h b/drivers/clk/sunxi-ng/
ccu-sun50i-h616.h
> index dd671b413f22..fdd2f4d5103f 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.h
> @@ -51,6 +51,6 @@
>  
>  #define CLK_BUS_DRAM		56
>  
> -#define CLK_NUMBER		(CLK_BUS_HDCP + 1)
> +#define CLK_NUMBER		(CLK_PLL_SYSTEM_32K + 1)
>  
>  #endif /* _CCU_SUN50I_H616_H_ */
> diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-
bindings/clock/sun50i-h616-ccu.h
> index 4fc08b0df2f3..1191aca53ac6 100644
> --- a/include/dt-bindings/clock/sun50i-h616-ccu.h
> +++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
> @@ -111,5 +111,6 @@
>  #define CLK_BUS_TVE0		125
>  #define CLK_HDCP		126
>  #define CLK_BUS_HDCP		127
> +#define CLK_PLL_SYSTEM_32K	128
>  
>  #endif /* _DT_BINDINGS_CLK_SUN50I_H616_H_ */
> -- 
> 2.35.3
> 
> 


