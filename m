Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E8E224FA
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Jan 2026 00:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767314538; cv=none; b=WAv41SOrXhbrkeLtP6hxU5nYx60oO2Zn6DxliXsaYf2KMnD0QyjsmGLDfKQz5jtPoNAYy1YQIsUzKWLLwQDkE7Ion4W38dkymLhurZcm+339aiBm4CilkfV1sOlIqo8fYKEGpOZgFkzuhQgk+LTksvm09zgMMzb0t0JN12ux03k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767314538; c=relaxed/simple;
	bh=CY0hKa1/Ja/iRIAM8sSUBAYdbfe7E3w9ZFJsLhiotro=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q8TwHvQBY+/j5JKlFYTU9zK63aWErK6YKh8sJac2Mn6sSm9pvA/54o8uJnyfyCjzPYqHq9xJpABsxZBdg8Utvm8DChGhjBbHFBGPxnS/WbcLlnGnZ4/Uc5h70c++FycmmoU2e2Qzg1DaF0OrEuwMHxOEilx38D3uhd+ZSvIUL54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED5F6497;
	Thu,  1 Jan 2026 16:42:08 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 21A603F694;
	Thu,  1 Jan 2026 16:42:13 -0800 (PST)
Date: Fri, 2 Jan 2026 01:41:24 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: u-boot@lists.denx.de, linux-sunxi@lists.linux.dev, Jagan Teki
 <jagan@amarulasolutions.com>, Tom Rini <trini@konsulko.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Paul Kocialkowski <contact@paulk.fr>, Samuel
 Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 10/10] sunxi: mmc: enable support for A733
Message-ID: <20260102014124.3b35207c@minigeek.lan>
In-Reply-To: <20251130-01-a733-soc-support-v2-10-18bdd4376fad@gentoo.org>
References: <20251130-01-a733-soc-support-v2-0-18bdd4376fad@gentoo.org>
	<20251130-01-a733-soc-support-v2-10-18bdd4376fad@gentoo.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 30 Nov 2025 21:45:19 +0000
Yixun Lan <dlan@gentoo.org> wrote:

> Minor clock adjustment for new A733 MMC controller, the SMHC0_CLK_REG
> start at offset 0x400, and with step size of 0x10.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/mmc/sunxi_mmc.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
> index e28c81afffe..689bec6693c 100644
> --- a/drivers/mmc/sunxi_mmc.c
> +++ b/drivers/mmc/sunxi_mmc.c
> @@ -112,6 +112,9 @@ static int mmc_set_mod_clk(struct sunxi_mmc_priv *priv, unsigned int hz)
>  			if (priv->mmc_no == 2)
>  				pll_hz *= 2;
>  		}
> +
> +		if (IS_ENABLED(CONFIG_MACH_SUN60I_A733))
> +			pll_hz /= 3;
>  	}
>  
>  	div = pll_hz / hz;
> @@ -167,7 +170,8 @@ static int mmc_set_mod_clk(struct sunxi_mmc_priv *priv, unsigned int hz)
>  	}
>  
>  	/* The A523 has a second divider, not a shift. */
> -	if (IS_ENABLED(CONFIG_MACH_SUN55I_A523))
> +	if (IS_ENABLED(CONFIG_MACH_SUN55I_A523) ||
> +		IS_ENABLED(CONFIG_MACH_SUN60I_A733))
>  		n = (1U << n) - 1;
>  
>  	writel(CCM_MMC_CTRL_ENABLE| pll | CCM_MMC_CTRL_N(n) |
> @@ -661,17 +665,28 @@ static const struct dm_mmc_ops sunxi_mmc_ops = {
>  	.get_cd		= sunxi_mmc_getcd,
>  };
>  
> -static unsigned get_mclk_offset(void)
> +static unsigned int get_mclk_offset(void)
>  {
>  	if (IS_ENABLED(CONFIG_MACH_SUN9I_A80))
>  		return 0x410;
>  
> +	if (IS_ENABLED(CONFIG_MACH_SUN60I_A733))
> +		return 0xd00;
> +
>  	if (IS_ENABLED(CONFIG_SUN50I_GEN_H6) || IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2))
>  		return 0x830;
>  
>  	return 0x88;
>  };
>  
> +static unsigned int get_mclk_size(void)

Can you please fold this function into the one above, passing in the
MMC controller number?
static unsigned int get_mclk_offset(int mmc_no);

Thanks,
Andre

> +{
> +	if (IS_ENABLED(CONFIG_MACH_SUN60I_A733))
> +		return 0x10;
> +
> +	return 0x4;
> +};
> +
>  static int sunxi_mmc_probe(struct udevice *dev)
>  {
>  	struct mmc_uclass_priv *upriv = dev_get_uclass_priv(dev);
> @@ -707,7 +722,7 @@ static int sunxi_mmc_probe(struct udevice *dev)
>  	ccu_reg = (u32 *)(uintptr_t)ofnode_get_addr(args.node);
>  
>  	priv->mmc_no = ((uintptr_t)priv->reg - SUNXI_MMC0_BASE) / 0x1000;
> -	priv->mclkreg = (void *)ccu_reg + get_mclk_offset() + priv->mmc_no * 4;
> +	priv->mclkreg = (void *)ccu_reg + get_mclk_offset() + priv->mmc_no * get_mclk_size();
>  
>  	ret = clk_get_by_name(dev, "ahb", &gate_clk);
>  	if (!ret)
> 

