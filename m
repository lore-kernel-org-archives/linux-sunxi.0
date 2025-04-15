Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19FF2528E1
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Apr 2025 23:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744758405; cv=none; b=u83/mZyi6pwN15gqpsWj3DP5ThXlc5pCaMevipJnRkH1BtOa9DDxWsedDWj+ok7o0DFrCLSUa5XieGOUhprIGLcvu9FDCdt4QUo1pH+7mAole1Ujil1gzvjAcnDdnSdv0AILePcvGpPOsjGptLo3apFUWVdKFaoVTmkjy1zSK6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744758405; c=relaxed/simple;
	bh=Z0748HkvcB4JD/wMW6S04ZaASEaXmWF1UzUpLXdaR38=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aLTPT5zl+3grGfdBNBZtegFa7Sy5BYR6ODzR4wi15wmb3HKw4OTs6SUdRdvyzoiGtdxcRi2t2Kheo5r7bH5tK6NlXv6Wc0fV+xsdJvV7wNBY9V5QwhPppLfsKtTt7HA0REZZwUSrmAcubd5ESDeB64PDIoyEW/LXev9KSTkIIyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C10C1595;
	Tue, 15 Apr 2025 16:06:39 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 792AB3F59E;
	Tue, 15 Apr 2025 16:06:40 -0700 (PDT)
Date: Wed, 16 Apr 2025 00:05:41 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: jagan@amarulasolutions.com, trini@konsulko.com, macromorgan@hotmail.com,
 uwu@icenowy.me, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/5] sunxi: H6: Remove useless DRAM timings parameter
Message-ID: <20250416000523.6303b411@minigeek.lan>
In-Reply-To: <20250411161439.4743-3-jernej.skrabec@gmail.com>
References: <20250411161439.4743-1-jernej.skrabec@gmail.com>
	<20250411161439.4743-3-jernej.skrabec@gmail.com>
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

On Fri, 11 Apr 2025 18:14:36 +0200
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

> This is just cosmetic fix for later easier rework.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h | 2 +-
>  arch/arm/mach-sunxi/dram_sun50i_h6.c             | 2 +-
>  arch/arm/mach-sunxi/dram_timings/h6_ddr3_1333.c  | 2 +-
>  arch/arm/mach-sunxi/dram_timings/h6_lpddr3.c     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h
> index f0caecc807dd..f05a1845b32b 100644
> --- a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h
> +++ b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h
> @@ -330,6 +330,6 @@ static inline int ns_to_t(int nanoseconds)
>  	return DIV_ROUND_UP(ctrl_freq * nanoseconds, 1000);
>  }
>  
> -void mctl_set_timing_params(struct dram_para *para);
> +void mctl_set_timing_params(void);
>  
>  #endif /* _SUNXI_DRAM_SUN50I_H6_H */
> diff --git a/arch/arm/mach-sunxi/dram_sun50i_h6.c b/arch/arm/mach-sunxi/dram_sun50i_h6.c
> index e7862bd06ea3..0adbda756639 100644
> --- a/arch/arm/mach-sunxi/dram_sun50i_h6.c
> +++ b/arch/arm/mach-sunxi/dram_sun50i_h6.c
> @@ -45,7 +45,7 @@ static bool mctl_core_init(struct dram_para *para)
>  	switch (para->type) {
>  	case SUNXI_DRAM_TYPE_LPDDR3:
>  	case SUNXI_DRAM_TYPE_DDR3:
> -		mctl_set_timing_params(para);
> +		mctl_set_timing_params();
>  		break;
>  	default:
>  		panic("Unsupported DRAM type!");
> diff --git a/arch/arm/mach-sunxi/dram_timings/h6_ddr3_1333.c b/arch/arm/mach-sunxi/dram_timings/h6_ddr3_1333.c
> index afe8e25c7f58..1ed46fed411f 100644
> --- a/arch/arm/mach-sunxi/dram_timings/h6_ddr3_1333.c
> +++ b/arch/arm/mach-sunxi/dram_timings/h6_ddr3_1333.c
> @@ -37,7 +37,7 @@ static u32 mr_ddr3[7] = {
>  };
>  
>  /* TODO: flexible timing */
> -void mctl_set_timing_params(struct dram_para *para)
> +void mctl_set_timing_params(void)
>  {
>  	struct sunxi_mctl_ctl_reg * const mctl_ctl =
>  			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
> diff --git a/arch/arm/mach-sunxi/dram_timings/h6_lpddr3.c b/arch/arm/mach-sunxi/dram_timings/h6_lpddr3.c
> index c243b574406d..c02f542c989f 100644
> --- a/arch/arm/mach-sunxi/dram_timings/h6_lpddr3.c
> +++ b/arch/arm/mach-sunxi/dram_timings/h6_lpddr3.c
> @@ -16,7 +16,7 @@ static u32 mr_lpddr3[12] = {
>  };
>  
>  /* TODO: flexible timing */
> -void mctl_set_timing_params(struct dram_para *para)
> +void mctl_set_timing_params(void)
>  {
>  	struct sunxi_mctl_ctl_reg * const mctl_ctl =
>  			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;

