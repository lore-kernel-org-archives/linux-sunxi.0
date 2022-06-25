Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07EE4A11
	for <linux-sunxi@lists.linux.dev>; Sat, 25 Jun 2022 10:43:58 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id z7so6624422edm.13
        for <linux-sunxi@lists.linux.dev>; Sat, 25 Jun 2022 03:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3aW4qIkW86Vdf1vFCbmOwdZe5y4/JqpNJsqdsqkmOSI=;
        b=FttiHQYp4hRHMayYQmDtQZVuq5SyEGV+6I0l3fN67WDHV1ACb5kbsHOeabSrjsNcvp
         rvGe/RR/s9uo7Bx5QHnnwfcz21CbRcx4mEF2mp1lmEKjraunMo9ZRwVZHueaMrIwSLiF
         359FmiIkPCfHrNCyn75Oob/zPPMIRROuxlbbr1K8YFtJgASNS0YQl99584r6XLkTy3LB
         wXpccWh93fAZxKQQwTmY3GmK7D0iZqs2dN5oglrmrYLe7cUWdtDBHzsPPa+fHnhuW7eA
         iR1aCQHcNe0OhJgAgQfpKnlzXZQ/wX9NPkZXEhRHDjLOnnW8GpyU0XhpnjkJYMbhuVo1
         glYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3aW4qIkW86Vdf1vFCbmOwdZe5y4/JqpNJsqdsqkmOSI=;
        b=YD7xvDf5W7N29CzFD0A/IhCezYEZF11eGXG7wDL31OvrUJ0B2jyTxl3NAzEBaoWFbJ
         EctMSkgCNnLlQ8G6M/WYdFa7tSazeeai7qHQafsEDnH/+srj0V1DFg/DVvD88fXpNp69
         VbqI63+JwSrJsHczPZKov4INdLZ1oatIiCcNBUCHdjrFQYUWjtHtKheVSxe0vYPWJGZb
         /BHq2AlSk7hqGvufxovQI+gqQ3LumeU53LnMkKGMWbvhLsDsNicZpYI10DKfRsqtuaSp
         7kH7n6jqsNUIZmZ4KD6E8lzAJVcgLppEo63I+jfV5jius7tDpK/Rtvm5F1IcSN93n0km
         qQcA==
X-Gm-Message-State: AJIora87PUps0JGI9qYl6mXw+W1Dt9zZxbkhSc+pFAtDP+EKDMjmotVT
	aFRoALtPn+awtbpTjICqXOo=
X-Google-Smtp-Source: AGRyM1vO6p+pwvghonjKX83gaxAyh9/RE44lFskiuPqOsUngK91OmnHFDnMwCUvdb2jGVMKo6Hp15w==
X-Received: by 2002:a05:6402:3594:b0:431:4cb8:c7b6 with SMTP id y20-20020a056402359400b004314cb8c7b6mr4295767edc.334.1656153837055;
        Sat, 25 Jun 2022 03:43:57 -0700 (PDT)
Received: from jernej-laptop.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id p24-20020a170906615800b00709343c0017sm2518105ejl.98.2022.06.25.03.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 03:43:55 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: peron.clem@gmail.com, Roman Stratiienko <r.stratiienko@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, mripard@kernel.org, wens@csie.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: sun50i: h6: Modify GPU clock configuration to support DFS
Date: Sat, 25 Jun 2022 12:43:54 +0200
Message-ID: <1779483.VLH7GnMWUR@jernej-laptop>
In-Reply-To: <20220624165211.4318-1-r.stratiienko@gmail.com>
References: <20220624165211.4318-1-r.stratiienko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Roman,

Dne petek, 24. junij 2022 ob 18:52:11 CEST je Roman Stratiienko napisal(a):
> Using simple bash script it was discovered that not all CCU registers
> can be safely used for DFS, e.g.:
> 
>     while true
>     do
>         devmem 0x3001030 4 0xb0003e02
>         devmem 0x3001030 4 0xb0001e02
>     done
> 
> Script above changes the GPU_PLL multiplier register value. While the
> script is running, the user should interact with the user interface.
> 
> Using this method the following results were obtained:
> | Register  | Name           | Bits  | Values | Result |
> | --        | --             | --    | --     | --     |
> | 0x3001030 | GPU_PLL.MULT   | 15..8 | 20-62  | OK     |
> | 0x3001030 | GPU_PLL.INDIV  |     1 | 0-1    | OK     |
> | 0x3001030 | GPU_PLL.OUTDIV |     0 | 0-1    | FAIL   |
> | 0x3001670 | GPU_CLK.DIV    |  3..0 | ANY    | FAIL   |
> 
> Once bits that caused system failure disabled (kept default 0),
> it was discovered that GPU_CLK.MUX was used during DFS for some
> reason and was causing the failure too.
> 
> After disabling GPU_PLL.OUTDIV the system started to fail during
> booting for some reason until the maximum frequency of GPU_PLL
> clock was limited to 756MHz.
> 
> After all the changes made DVFS started to work seamlessly.

I appreciate testing effort, but I don't think userspace approach is good way 
for testing DVFS. I see 2 issues:
- As name already suggest, voltage also plays crucial role for stability. You 
didn't say on which board you tested this, but I assume it has PMIC. Did you 
make sure GPU voltage regulator is always at 1.04 V, which is needed for 756 
MHz?
- Kernel clock driver always goes through proper procedure for clock rate 
change, which involves several steps. Bypassing them might also cause some 
stability problems.

I agree that GPU PLL should be limited to 756 MHz max. This seems to be 
maximum operating point specified at vendor DT. But I managed to extract some 
more information from vendor GPU driver. More specifically, from this snippet, 
located in modules/gpu/mali-midgard/kernel_mode/driver/drivers/gpu/arm/
midgard/platform/sunxi/mali_kbase_config_sunxi.c:

pll_freq = target->freq;
while (pll_freq < 288000000)
	pll_freq *= 2;

err = clk_set_rate(sunxi_mali->gpu_pll_clk, pll_freq);
<...>
err = clk_set_rate(kbdev->clock, target->freq);
<...>

Apparently, minimum stable PLL frequency is 288 MHz (this should be added) and 
divider in peripheral clock can really be used, although preferably not. 
Vendor GPU operating points specify only 2 lower than 288 MHz points - at 264 
MHz and 216 MHz. I'm fully aware that they may not be really stable and given 
that these two and next two all share minimum voltage of 810 mV, power and 
thermal savings are probably not that great, so we can skip them and pin 
peripheral divider to 1, as you already did.

Another discrepancy I see is that vendor DT has two operating points, at 336 
MHz and 384 MHz, which also use factor P (also known as d2 in vendor clock 
source). This can be again an oversight or alternatively, it can be that P 
factor can actually be used, but just with lower frequencies.

Can you please make another test with GPU operating points specified in DT and 
check if it works with P factor left in?

For reference, vendor DT has following operating points (kHz, uV):
756000 1040000
624000 950000
576000 930000
540000 910000
504000 890000
456000 870000
432000 860000
420000 850000
408000 840000
384000 830000
360000 820000
336000 810000
312000 810000
264000 810000
216000 810000

Best regards,
Jernej

> 
> Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
> b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c index 2ddf0a0da526f..d941238cd178a
> 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
> @@ -95,13 +95,14 @@ static struct ccu_nkmp pll_periph1_clk = {
>  	},
>  };
> 
> +/* For GPU PLL, using an output divider for DFS causes system to fail */
>  #define SUN50I_H6_PLL_GPU_REG		0x030
>  static struct ccu_nkmp pll_gpu_clk = {
>  	.enable		= BIT(31),
>  	.lock		= BIT(28),
>  	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
>  	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
> -	.p		= _SUNXI_CCU_DIV(0, 1), /* output divider 
*/
> +	.max_rate	= 756000000UL,
>  	.common		= {
>  		.reg		= 0x030,
>  		.hw.init	= CLK_HW_INIT("pll-gpu", "osc24M",
> @@ -294,12 +295,9 @@ static SUNXI_CCU_M_WITH_MUX_GATE(deinterlace_clk,
> "deinterlace", static SUNXI_CCU_GATE(bus_deinterlace_clk,
> "bus-deinterlace", "psi-ahb1-ahb2", 0x62c, BIT(0), 0);
> 
> -static const char * const gpu_parents[] = { "pll-gpu" };
> -static SUNXI_CCU_M_WITH_MUX_GATE(gpu_clk, "gpu", gpu_parents, 0x670,
> -				       0, 3,	/* M */
> -				       24, 1,	/* mux */
> -				       BIT(31),	/* gate */
> -				       CLK_SET_RATE_PARENT);
> +/* GPU_CLK divider kept disabled to avoid interferences with DFS */
> +static SUNXI_CCU_GATE(gpu_clk, "gpu", "pll-gpu", 0x670,
> +		      BIT(31), CLK_SET_RATE_PARENT);
> 
>  static SUNXI_CCU_GATE(bus_gpu_clk, "bus-gpu", "psi-ahb1-ahb2",
>  		      0x67c, BIT(0), 0);




