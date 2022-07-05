Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6487D7C
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Jul 2022 16:07:12 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id d2so22512973ejy.1
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Jul 2022 09:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bodYuUINtdfT+usu5Iuy+nZ7zDLIoEW71RzOe9gY+CE=;
        b=m6yBjGgY8If7QfJ6vQGnVzIhmqsmbiAS4ZCld01cuJaPqLXSR9hTZPpgxOBUxZ1wj3
         fww5Jy5wPiy8naN7KtFTi6LpZbrrIUiG3gLrORbc9Zt6jyHUJzIqVlZfplgc67iIwEPC
         07vAw075CO3Rmym+EZ384IRrZNhnpH8UEpXzlRLZ6rZJwTif8aVy7lwgRG7nsqK2/i1d
         b8RX7ApWzcaRnKoAHe+lPVyxTh/e3sNpZg9xJfBo1VJFHAgmKMbmiylnK9qn5nqKeKKC
         rg2qCer+PvsxCYDnd/792wN30kT035jFYgnA+Zj1goF4L0/G3prLZf63Rw/HdQbfpHmY
         Inug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bodYuUINtdfT+usu5Iuy+nZ7zDLIoEW71RzOe9gY+CE=;
        b=6HLIBlsNzKORMP+dXBypVquj840xQKGypPUPVoRFSnl6xHenpWHgLXXcPLa3X0cPuh
         YgXTRbgfLwwj/0lyn6eYLk/XSjRYLs7sa1/a1JrQy/vlzfdEOtR9iZiQxse3TYtgjv6k
         c3QeyFGOwfjRbE2567C+3JvpoxW/jtGyUAFifz4k7MAK5yrHAVSmQWbLAUmWBBHvQbLM
         9zZpBsgSFmbHwVOHv41aL09lbP7nsiWL0XB5D1/QA3kionT5AV+QK2VjutAY0twuEtE3
         8//cACbgD0aj3ZaPCTn1ohiWaLWeyVLiz+m8Q7kk1CSfXma/ptaajkfxnUpNiULSYpdO
         QICQ==
X-Gm-Message-State: AJIora9Qjmae02+ZTdNqs+LaXWgGuRtMbOh7JftHMNHj5/Ob4arhqcBy
	2m4mWFSRLjwLLGzwllqQL90=
X-Google-Smtp-Source: AGRyM1uxGpRjQDzVyLzlwrHoo5ArTyiF+3VeQwC5ferd+XpUXT9jYRp0YRVlO5AqVTzmJl2/MRHALw==
X-Received: by 2002:a17:906:2086:b0:715:7983:a277 with SMTP id 6-20020a170906208600b007157983a277mr34808586ejq.386.1657037230525;
        Tue, 05 Jul 2022 09:07:10 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id z8-20020aa7d408000000b0043a37e1d8easm5876809edq.32.2022.07.05.09.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 09:07:09 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: samuel@sholland.org, Roman Stratiienko <r.stratiienko@gmail.com>
Cc: peron.clem@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, mripard@kernel.org, wens@csie.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Roman Stratiienko <r.stratiienko@gmail.com>
Subject: Re: [PATCH v3] clk: sunxi-ng: sun50i: h6: Modify GPU clock configuration to support DFS
Date: Tue, 05 Jul 2022 18:07:08 +0200
Message-ID: <5580615.DvuYhMxLoT@kista>
In-Reply-To: <20220705075226.359475-1-r.stratiienko@gmail.com>
References: <20220705075226.359475-1-r.stratiienko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Roman,

Dne torek, 05. julij 2022 ob 09:52:26 CEST je Roman Stratiienko napisal(a):
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
> DVFS started to work seamlessly once dividers which caused the
> glitches were set to fixed values.
> 
> Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
> 
> ---
> 
> Changelog:
> 
> V2:
> - Drop changes related to mux
> - Drop frequency limiting
> - Add unused dividers initialization
> 
> V3:
> - Adjust comments

I don't see any comment fixed, at least not to "1", as we discussed. Did I miss 
anything? Also, please add min and max. I also consent to R-B, which you 
didn't include. Did you resend v2 instead of v3?

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
> b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c index 2ddf0a0da526f..068d1a6b2ebf3
> 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
> @@ -95,13 +95,13 @@ static struct ccu_nkmp pll_periph1_clk = {
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
>  	.common		= {
>  		.reg		= 0x030,
>  		.hw.init	= CLK_HW_INIT("pll-gpu", "osc24M",
> @@ -294,9 +294,9 @@ static SUNXI_CCU_M_WITH_MUX_GATE(deinterlace_clk,
> "deinterlace", static SUNXI_CCU_GATE(bus_deinterlace_clk,
> "bus-deinterlace", "psi-ahb1-ahb2", 0x62c, BIT(0), 0);
> 
> +/* Keep GPU_CLK divider const to avoid DFS instability. */
>  static const char * const gpu_parents[] = { "pll-gpu" };
> -static SUNXI_CCU_M_WITH_MUX_GATE(gpu_clk, "gpu", gpu_parents, 0x670,
> -				       0, 3,	/* M */
> +static SUNXI_CCU_MUX_WITH_GATE(gpu_clk, "gpu", gpu_parents, 0x670,
>  				       24, 1,	/* mux */
>  				       BIT(31),	/* gate */
>  				       CLK_SET_RATE_PARENT);
> @@ -1193,6 +1193,16 @@ static int sun50i_h6_ccu_probe(struct platform_device
> *pdev) if (IS_ERR(reg))
>  		return PTR_ERR(reg);
> 
> +	/* Force PLL_GPU output divider bits to 0 */
> +	val = readl(reg + SUN50I_H6_PLL_GPU_REG);
> +	val &= ~BIT(0);
> +	writel(val, reg + SUN50I_H6_PLL_GPU_REG);
> +
> +	/* Force GPU_CLK divider bits to 0 */
> +	val = readl(reg + gpu_clk.common.reg);
> +	val &= ~GENMASK(3, 0);
> +	writel(val, reg + gpu_clk.common.reg);
> +
>  	/* Enable the lock bits on all PLLs */
>  	for (i = 0; i < ARRAY_SIZE(pll_regs); i++) {
>  		val = readl(reg + pll_regs[i]);
> --
> 2.34.1


