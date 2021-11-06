Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0FA2C9A
	for <linux-sunxi@lists.linux.dev>; Sat,  6 Nov 2021 03:00:01 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id AB98E5C00B3;
	Fri,  5 Nov 2021 23:00:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 05 Nov 2021 23:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	to:cc:references:from:subject:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=m
	W3p7rLeq0cXNzKoc1q5wCwb9Hv17yO7PBxCXnhwzBs=; b=B/RCA9imyQ5H2/9uN
	g5/ViSbWtiZ4+dGGOMBsJRbCFJlsI4RaUH6t1897Xg7TMlb4fjvf1qjjIvBD6LTC
	uUeWPG1CB1aBU5WfRtgdN2URbSdvBel7CBeI8WJ9p0kUHvq4nnviT1uDDEWrwZku
	4qe/nWUX/GDE6D4dhJala4UovhHvMDRWdXIiWMyWBOdAG0UNPwmy8P9kP8VkHgpg
	lXCKbskr32DLQOGNkNYQdd+FkZ3y0aCbrpVNnluP/9YDbVndQ2yMUsVE3BR9uDcg
	h4M34d+RR8mN9ys7y5jshYihTBIwOUG6DCR+b1UJ/pY65tnl69nKaum8ZcF2r5Sg
	PtF8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=mW3p7rLeq0cXNzKoc1q5wCwb9Hv17yO7PBxCXnhwz
	Bs=; b=N+Em6ZNtb7uBwtPSI1tM/Gf/WIpCtBHGoegZPAQrmenhJs4VDKYV7yy1g
	xPhUwfoPFxl6SgKmRIfJpJVx02m7ptrxZ6NIWy8WChd0m81CUdJnSxPtIhc/ixpZ
	l+5bz2l7tjgMqMl1EiqgoUYGdMG94kU2zP1sydoyxeZYGR6AinzQZP5azQGvco5w
	6ItSYUmm2HpmP0D0db23eugMCnpwYaYvO1Yud0z/NTcy39ljH1jh6n+b2jRDWh41
	VW6kovxGkDDmAWtnPE/OASk4WEObHZmULQv3oQ2Q62/bXq7KmAGIw+wNxPsNg51F
	U0qu2/lLBky5TBdZF5Ym7/ks5CwyQ==
X-ME-Sender: <xms:sO-FYbKKuIlXx4d0Yypkadn5Pn23N2PkoBsiI8Hy0g9WS9XhntaxAQ>
    <xme:sO-FYfIVPfDYVj6VjEYc-XS-_yfx3XqksuUCTUCGjT_WXF1NJm33KlGT2oYapWp7r
    N0HGDpDWYbJsmPPwA>
X-ME-Received: <xmr:sO-FYTscMjrpEC569mVc-BH7Sy3pEpdJlN5wzcfKd0E3NUEtA4U5oss7LKzL0aviJ7JEXQLocmdx3rC5xi-jxCWl5yjZPFStHzQsIHxjp3_jiJHKqgMg08Wufg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdejgdehvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefvfhfhuffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedvtddtjeeiuddugfffveetkeffgeffgedutdfgfeekudevudekffeh
    tdefveeuvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:sO-FYUZz-kGLLRJiHNql3mpJ6rF15fRw6RsutfSU0HTzveES-EyMUg>
    <xmx:sO-FYSa9_08t90UoN47_qHIwQg_Xpg5hnURhJn9nRFqNYBWPYKyD5w>
    <xmx:sO-FYYBJwqfBvL3TtypTzlatTctZej5R40Qnzlcmiwc37K8GGndaCg>
    <xmx:sO-FYZXGcccZwfAua2I2vYW_FNTmCF6Wi1HmOjyHylEyj2pjMPGdXA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Nov 2021 23:00:00 -0400 (EDT)
To: Icenowy Zheng <icenowy@sipeed.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
References: <20210722063015.421923-1-icenowy@sipeed.com>
 <20210722063015.421923-6-icenowy@sipeed.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [RFC PATCH 05/13] sunxi: add support for R329 clocks
Message-ID: <ca6613b9-5b22-9a76-a656-77dd83da2589@sholland.org>
Date: Fri, 5 Nov 2021 21:59:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210722063015.421923-6-icenowy@sipeed.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 7/22/21 1:30 AM, Icenowy Zheng wrote:
> R329 has a quite different clock tree than other SoCs. It has only 4
> PLLs and its PLL-PERIPH has two post dividers, one for the normal
> PLL-PERIPH-2x output and another for a special PLL-PERIPH-800M output.
> In addition, its PLL configuration registers are in PRCM memory zone,
> not the ordinary CPUX CCU one.
> 
> Add support for basical R329 clock initialization.
> 
> Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>

Reviewed-by: Samuel Holland <samuel@sholland.org>

One minor comment below.

> ---
>  arch/arm/mach-sunxi/clock_sun50i_h6.c | 49 ++++++++++++++++++++++++---
>  1 file changed, 44 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-sunxi/clock_sun50i_h6.c b/arch/arm/mach-sunxi/clock_sun50i_h6.c
> index a947463e0a..28bc5fccd8 100644
> --- a/arch/arm/mach-sunxi/clock_sun50i_h6.c
> +++ b/arch/arm/mach-sunxi/clock_sun50i_h6.c
> @@ -9,6 +9,13 @@ void clock_init_safe(void)
>  {
>  	struct sunxi_ccm_reg *const ccm =
>  		(struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
> +#ifdef CONFIG_MACH_SUN50I_R329
> +	struct sunxi_prcm_reg *const prcm =
> +		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
> +	struct sunxi_prcm_reg *const pllccm = prcm;
> +#else
> +	struct sunxi_ccm_reg *const pllccm = ccm;
> +#endif
>  
>  	/* this seems to enable PLLs on H616 */
>  	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616))
> @@ -16,22 +23,26 @@ void clock_init_safe(void)
>  
>  	clock_set_pll1(408000000);
>  
> -	writel(CCM_PLL6_DEFAULT, &ccm->pll6_cfg);
> -	while (!(readl(&ccm->pll6_cfg) & CCM_PLL6_LOCK))
> +	writel(CCM_PLL6_DEFAULT, &pllccm->pll6_cfg);
> +	while (!(readl(&pllccm->pll6_cfg) & CCM_PLL6_LOCK))
>  		;
>  
>  	clrsetbits_le32(&ccm->cpu_axi_cfg, CCM_CPU_AXI_APB_MASK | CCM_CPU_AXI_AXI_MASK,
>  			CCM_CPU_AXI_DEFAULT_FACTORS);
>  
>  	writel(CCM_PSI_AHB1_AHB2_DEFAULT, &ccm->psi_ahb1_ahb2_cfg);
> +#ifdef CCM_AHB3_DEFAULT
>  	writel(CCM_AHB3_DEFAULT, &ccm->ahb3_cfg);
> +#endif
>  	writel(CCM_APB1_DEFAULT, &ccm->apb1_cfg);
>  
> +#ifndef CONFIG_MACH_SUN50I_R329
>  	/*
>  	 * The mux and factor are set, but the clock will be enabled in
>  	 * DRAM initialization code.
>  	 */
>  	writel(MBUS_CLK_SRC_PLL6X2 | MBUS_CLK_M(3), &ccm->mbus_cfg);
> +#endif
>  }
>  #endif
>  
> @@ -60,8 +71,20 @@ void clock_set_pll1(unsigned int clk)
>  {
>  	struct sunxi_ccm_reg * const ccm =
>  		(struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
> +#ifdef CONFIG_MACH_SUN50I_R329
> +	struct sunxi_prcm_reg *const prcm =
> +		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
> +	struct sunxi_prcm_reg *const pllccm = prcm;
> +#else
> +	struct sunxi_ccm_reg *const pllccm = ccm;
> +#endif
>  	u32 val;
>  
> +#ifdef CONFIG_MACH_SUN50I_R329
> +	/* Fix undervoltage reset threshold */
> +	clrsetbits_le32(0x070901f4, 0xfff, 0xc0);
> +#endif
> +
>  	/* Do not support clocks < 288MHz as they need factor P */
>  	if (clk < 288000000) clk = 288000000;
>  
> @@ -73,11 +96,11 @@ void clock_set_pll1(unsigned int clk)
>  
>  	/* clk = 24*n/p, p is ignored if clock is >288MHz */
>  	writel(CCM_PLL1_CTRL_EN | CCM_PLL1_LOCK_EN | CCM_PLL1_CLOCK_TIME_2 |
> -#ifdef CONFIG_MACH_SUN50I_H616
> +#ifndef CONFIG_MACH_SUN50I_H6
>  	       CCM_PLL1_OUT_EN |
>  #endif
> -	       CCM_PLL1_CTRL_N(clk / 24000000), &ccm->pll1_cfg);
> -	while (!(readl(&ccm->pll1_cfg) & CCM_PLL1_LOCK)) {}
> +	       CCM_PLL1_CTRL_N(clk / 24000000), &pllccm->pll1_cfg);
> +	while (!(readl(&pllccm->pll1_cfg) & CCM_PLL1_LOCK)) {}
>  
>  	/* Switch CPU to PLL1 */
>  	val = readl(&ccm->cpu_axi_cfg);
> @@ -87,6 +110,7 @@ void clock_set_pll1(unsigned int clk)
>  }
>  #endif
>  
> +#ifndef CONFIG_MACH_SUN50I_R329

The negative condition here will make it messier to add more branches in
the future, so I suggest flipping the conditional block.

>  unsigned int clock_get_pll6(void)
>  {
>  	struct sunxi_ccm_reg *const ccm =
> @@ -102,6 +126,21 @@ unsigned int clock_get_pll6(void)
>  	/* The register defines PLL6-2X or PLL6-4X, not plain PLL6 */
>  	return 24000000 / m * n / div1 / div2;
>  }
> +#else
> +unsigned int clock_get_pll6(void)
> +{
> +	struct sunxi_prcm_reg *const prcm =
> +		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
> +
> +	uint32_t rval = readl(&prcm->pll6_cfg);
> +	int m = ((rval & CCM_PLL6_CTRL_M_MASK) >> CCM_PLL6_CTRL_M_SHIFT) + 1;
> +	int n = ((rval & CCM_PLL6_CTRL_N_MASK) >> CCM_PLL6_CTRL_N_SHIFT) + 1;
> +	int div1 = ((rval & CCM_PLL6_CTRL_DIV1_MASK) >>
> +			CCM_PLL6_CTRL_DIV1_SHIFT) + 1;
> +	/* The register defines PLL6-2X, not plain PLL6 */
> +	return 24000000 / m * n / div1 / 2;
> +}
> +#endif
>  
>  int clock_twi_onoff(int port, int state)
>  {
> 

