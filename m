Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228BC2F5B
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Mar 2025 01:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742865243; cv=none; b=cSRFOIt2G+C2arxLKv7TtAiPJWQ2o0qHzdWSj0gDAkpt/c6+Kb4vcTmjsTngN4llAboxLZGpcMoLFSfccEX3kSnGU2z3ldXz7VvmVxmc68zbDh9yiAPKrJy6l/kX78aHq90J+EXSnf9PmX3s9z0V+gS5+nDXwY350PE4206V9Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742865243; c=relaxed/simple;
	bh=+BdegROz2GAKu01I0EmdF/cqhSBR9i9o53zlLn2jA44=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mu2gWzBT6auP2hrRhnnF0Owa3UmKvBagDJLbMHnen8sMlhO8AZd1kdJyMVxRhdobOg9V4v5NLNg0OOC7I+/S7VWo7QfSBQe49LE7vMnC8rkS1wcFAONOewdW6+jxIJNkurFBsld99foCnWc8OM4+bwuhp5CfVLGhwvxFjxStbR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B3391596;
	Mon, 24 Mar 2025 18:14:05 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E37953F58B;
	Mon, 24 Mar 2025 18:13:57 -0700 (PDT)
Date: Tue, 25 Mar 2025 01:13:29 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: jagan@amarulasolutions.com, trini@konsulko.com, macromorgan@hotmail.com,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] sunxi: H616: dram: Improve address wrapping
 detection
Message-ID: <20250325011329.51176143@minigeek.lan>
In-Reply-To: <20250309063143.62859-3-jernej.skrabec@gmail.com>
References: <20250309063143.62859-1-jernej.skrabec@gmail.com>
	<20250309063143.62859-3-jernej.skrabec@gmail.com>
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

On Sun,  9 Mar 2025 07:31:43 +0100
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

Hi,

> It turns out that checking just one write is not enough. Due to
> unexplained reasons scan procedure detected double the size. By making
> 16 dword writes and comparisons that never happens.
> 
> New procedure is also inverted. Instead of writing two different values
> to base address and some offset and then reading both and comparing
> values, simplify this by writing pattern at the base address and then
> search for this pattern at some offset.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Thanks for improving this, I guess we want to eventually move this to
more generic code, and use this for more SoCs?

Anyway:
Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm/mach-sunxi/dram_sun50i_h616.c | 58 +++++++++++++++++++++++++-
>  1 file changed, 56 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> index 6f84e59e39cd..1e21f5dd451f 100644
> --- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
> +++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> @@ -1360,38 +1360,92 @@ static void mctl_auto_detect_rank_width(const struct dram_para *para,
>  	panic("This DRAM setup is currently not supported.\n");
>  }
>  
> +static void mctl_write_pattern(void)
> +{
> +	unsigned int i;
> +	u32 *ptr, val;
> +
> +	ptr = (u32 *)CFG_SYS_SDRAM_BASE;
> +	for (i = 0; i < 16; ptr++, i++) {
> +		if (i & 1)
> +			val = ~(ulong)ptr;
> +		else
> +			val = (ulong)ptr;
> +		writel(val, ptr);
> +	}
> +}
> +
> +static bool mctl_check_pattern(ulong offset)
> +{
> +	unsigned int i;
> +	u32 *ptr, val;
> +
> +	ptr = (u32 *)CFG_SYS_SDRAM_BASE;
> +	for (i = 0; i < 16; ptr++, i++) {
> +		if (i & 1)
> +			val = ~(ulong)ptr;
> +		else
> +			val = (ulong)ptr;
> +		if (val != *(ptr + offset / 4))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>  static void mctl_auto_detect_dram_size(const struct dram_para *para,
>  				       struct dram_config *config)
>  {
>  	unsigned int shift, cols, rows;
> +	u32 buffer[16];
>  
>  	/* max. config for columns, but not rows */
>  	config->cols = 11;
>  	config->rows = 13;
>  	mctl_core_init(para, config);
>  
> +	/*
> +	 * Store content so it can be restored later. This is important
> +	 * if controller was already initialized and holds any data
> +	 * which is important for restoring system.
> +	 */
> +	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
> +
> +	mctl_write_pattern();
> +
>  	shift = config->bus_full_width + 1;
>  
>  	/* detect column address bits */
>  	for (cols = 8; cols < 11; cols++) {
> -		if (mctl_mem_matches(1ULL << (cols + shift)))
> +		if (mctl_check_pattern(1ULL << (cols + shift)))
>  			break;
>  	}
>  	debug("detected %u columns\n", cols);
>  
> +	/* restore data */
> +	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
> +
>  	/* reconfigure to make sure that all active rows are accessible */
>  	config->cols = 8;
>  	config->rows = 17;
>  	mctl_core_init(para, config);
>  
> +	/* store data again as it might be moved */
> +	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
> +
> +	mctl_write_pattern();
> +
>  	/* detect row address bits */
>  	shift = config->bus_full_width + 4 + config->cols;
>  	for (rows = 13; rows < 17; rows++) {
> -		if (mctl_mem_matches(1ULL << (rows + shift)))
> +		if (mctl_check_pattern(1ULL << (rows + shift)))
>  			break;
>  	}
>  	debug("detected %u rows\n", rows);
>  
> +	/* restore data again */
> +	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
> +
>  	config->cols = cols;
>  	config->rows = rows;
>  }

