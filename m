Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B227F
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Nov 2022 08:22:11 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id ud5so23029139ejc.4
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Nov 2022 01:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8GelLgZYA3Vgt9nX6+7vM2CkBVxbreUB1cvPD6I5ws=;
        b=OotFQiWya9bBskjYnMUrAzFF0BhBomHxGJCP6vuAohO+pSS0nBMZoAxdjZId6ywvji
         sjHEquCputQ8wcBvVkso3JELs4gsYfNgUrpd0WeT+cV5GmknwCFkZYP6ldNoyV808p14
         WFT5U85CTcY62L01EgtCOX2VxCkE5obLo5ja3P66/Jt3PoPyxd7EnbLoarJo/m5pJslp
         dyWbqtOaXAhENd5BJLQpx1xunvdAEz4k5cIYaHYRu0eCRa8PYnkZJnCA/3NC3uWwR1Eo
         Pjn2T1cAlFWJSMACeyXdr9A0piAToRCkA6DE8TqmRlC9d2ZfYk5+jJ9M5uCxSEq09qQc
         bfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8GelLgZYA3Vgt9nX6+7vM2CkBVxbreUB1cvPD6I5ws=;
        b=X+jT6X9949VEeCE/MQ7myhm1PGmb+ZzAhhHSwxaI/svgYf7+wj614mwOa9lLF1NtSr
         i705jm+6jTI7ImvdkNvyJNxYpLSG9G2XXG4P4TU/MWNoOtm61RRmGBwF2JhwCjD875lc
         aYEf+kZnL+8gJUsJLZySWtHniSAINu1wifOTu7hR8UmXhyUjBq5rGnWz0yrqsYf1+Vb4
         L60Qjqmp2Tc+zt+riU/skD6A/uTgMKLZ2v+1y8EViJmxva+B/oBHc/Xut37lTBRIhaYC
         I9YUUEC3IvAa2ivLyL1y69pnuwSux/xANEuBRBiW27BLfr0FVU9yUfgtGB6AxbHoOPnM
         BkDw==
X-Gm-Message-State: ACrzQf2ptKSUe35fqlMVtisXhIXk01OXekv6k8ovhXVCTNYySXIP3tob
	tXtzNNsaYyH4efxbJ/X+3v0=
X-Google-Smtp-Source: AMsMyM6Cs1H5dB0jxz4M9iP6q2ipekXRaaelRwUbpTc5p/piVdnVPEEHQyvZ0el90BKeN48gAW5UXA==
X-Received: by 2002:a17:906:5a51:b0:7ad:cf9e:bfc6 with SMTP id my17-20020a1709065a5100b007adcf9ebfc6mr35747417ejc.445.1667722929860;
        Sun, 06 Nov 2022 01:22:09 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id 8-20020a170906300800b0078d22b0bcf2sm1832079ejz.168.2022.11.06.01.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 01:22:09 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 5/9] clk: sunxi-ng: f1c100s: Add IR mod clock
Date: Sun, 06 Nov 2022 09:22:08 +0100
Message-ID: <3519387.R56niFO833@jernej-laptop>
In-Reply-To: <20221101141658.3631342-6-andre.przywara@arm.com>
References: <20221101141658.3631342-1-andre.przywara@arm.com> <20221101141658.3631342-6-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 01. november 2022 ob 15:16:54 CET je Andre Przywara napisal(a):
> For some reason the mod clock for the Allwinner F1C100s CIR (infrared
> receiver) peripheral was not modeled in the CCU driver.
> 
> Add the clock description to the list, and wire it up in the clock list.
> By assigning a new clock ID at the end, it extends the number of clocks.
> 
> This allows to use the CIR peripheral on any F1C100s series board.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c      | 11 ++++++++++-
>  drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h      |  2 +-
>  include/dt-bindings/clock/suniv-ccu-f1c100s.h |  2 ++
>  3 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
> b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c index
> ed097c4f780ff..af4811e720b39 100644
> --- a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
> +++ b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
> @@ -239,7 +239,14 @@ static SUNXI_CCU_MUX_WITH_GATE(i2s_clk, "i2s",
> i2s_spdif_parents, static SUNXI_CCU_MUX_WITH_GATE(spdif_clk, "spdif",
> i2s_spdif_parents, 0x0b4, 16, 2, BIT(31), 0);
> 
> -/* The BSP header file has a CIR_CFG, but no mod clock uses this definition
> */ +static const char * const ir_parents[] = { "osc32k", "osc24M" };
> +static SUNXI_CCU_MP_WITH_MUX_GATE(ir_clk, "ir",
> +				  ir_parents, 0x0b8,
> +				  0, 4,		/* M */
> +				  16, 2,	/* P */
> +				  24, 1,        /* mux */

Let's follow user manual here and make mux 2 bits wide. That way we'll 
guarantee that bit 1 is always written 0.

Best regards,
Jernej

> +				  BIT(31),      /* gate */
> +				  0);
> 
>  static SUNXI_CCU_GATE(usb_phy0_clk,	"usb-phy0",	"osc24M",
>  		      0x0cc, BIT(1), 0);
> @@ -355,6 +362,7 @@ static struct ccu_common *suniv_ccu_clks[] = {
>  	&mmc1_output_clk.common,
>  	&i2s_clk.common,
>  	&spdif_clk.common,
> +	&ir_clk.common,
>  	&usb_phy0_clk.common,
>  	&dram_ve_clk.common,
>  	&dram_csi_clk.common,
> @@ -446,6 +454,7 @@ static struct clk_hw_onecell_data suniv_hw_clks = {
>  		[CLK_MMC1_OUTPUT]	= &mmc1_output_clk.common.hw,
>  		[CLK_I2S]		= &i2s_clk.common.hw,
>  		[CLK_SPDIF]		= &spdif_clk.common.hw,
> +		[CLK_IR]		= &ir_clk.common.hw,
>  		[CLK_USB_PHY0]		= 
&usb_phy0_clk.common.hw,
>  		[CLK_DRAM_VE]		= 
&dram_ve_clk.common.hw,
>  		[CLK_DRAM_CSI]		= 
&dram_csi_clk.common.hw,
> diff --git a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h
> b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h index
> b22484f1bb9a5..d56a4316289d8 100644
> --- a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h
> +++ b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.h
> @@ -29,6 +29,6 @@
> 
>  /* All bus gates, DRAM gates and mod clocks are exported */
> 
> -#define CLK_NUMBER		(CLK_AVS + 1)
> +#define CLK_NUMBER		(CLK_IR + 1)
> 
>  #endif /* _CCU_SUNIV_F1C100S_H_ */
> diff --git a/include/dt-bindings/clock/suniv-ccu-f1c100s.h
> b/include/dt-bindings/clock/suniv-ccu-f1c100s.h index
> f5ac155c9c70a..d7570765f424d 100644
> --- a/include/dt-bindings/clock/suniv-ccu-f1c100s.h
> +++ b/include/dt-bindings/clock/suniv-ccu-f1c100s.h
> @@ -67,4 +67,6 @@
>  #define CLK_CODEC		65
>  #define CLK_AVS			66
> 
> +#define CLK_IR			67
> +
>  #endif




