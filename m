Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98274195
	for <linux-sunxi@lists.linux.dev>; Mon, 24 Mar 2025 01:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742779162; cv=none; b=Gk9G1Cb6EIfrOFBKb2tYb/yWgpFoAxhpJ46kS5FVdBTRzMFPWz2TZzVzULLfrzC4UF3iJ/dHk089EOzNJ9nYW/yoPSagivdvyqklGJNfRQei5Zp538DzgRA7yirOyWA1+VITJXI56mYIrhTmpPzMBdayWVMJ2QKznAAP/d3Ts+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742779162; c=relaxed/simple;
	bh=xLwGjqdTa0FMHWpiAu7Z3+qbiFwlOa20+ksHqfHYtKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RqngeeUGi+kyh+atPvCJxDYitOuo4sXrAWFiUdJBbiANup6Vk36UGHrF3ViVi3rWrBXuqdP1aU/E6jm2opMz7FIZEW1Pjg2z2ljSc1waYfs21cmBCpbJnUvCqFYAuCYNJ9LhiYbZBcv+J/8dz9K3+E4EUi0O5DgIvLJN3XMaETw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29FD5106F;
	Sun, 23 Mar 2025 18:19:25 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B661C3F694;
	Sun, 23 Mar 2025 18:19:17 -0700 (PDT)
Date: Mon, 24 Mar 2025 01:18:54 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: jagan@amarulasolutions.com, trini@konsulko.com, macromorgan@hotmail.com,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/2] sunxi: h616: dram: Rework size detection
Message-ID: <20250324011854.0a05d29b@minigeek.lan>
In-Reply-To: <20250309063143.62859-2-jernej.skrabec@gmail.com>
References: <20250309063143.62859-1-jernej.skrabec@gmail.com>
	<20250309063143.62859-2-jernej.skrabec@gmail.com>
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

On Sun,  9 Mar 2025 07:31:42 +0100
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

thanks for keeping digging into this long-standing problem!

> Since there is quite a few possible DRAM configurations in terms of bus
> width, rank and rows and columns count, size detection algorithm must be
> very careful not to test combination which would be bigger than H616 is
> actually capable of handling.
> 
> Ideally, we should always detect memory aliasing, even for 4 GB memory
> size, which is the maximum amount of memory that H616 is capable of
> handling. For this reason, we have to configure minimum amount of
> supported rows when testing for columns and vice versa. This way test
> code will never step out of 4 GB boundary.
> 
> While at it, check for 17 rows maximum. This aligns code with BSP DRAM
> driver. There is probably no such configuration which would make sense
> with 4 GB memory.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

The change itself looks good to me, I have not done enough tests myself
to confirm its reliability, but I trust the reports from others who
were more affected by this.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre


> ---
>  arch/arm/mach-sunxi/dram_sun50i_h616.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> index b3554cc64bf5..6f84e59e39cd 100644
> --- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
> +++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> @@ -1363,7 +1363,7 @@ static void mctl_auto_detect_rank_width(const struct dram_para *para,
>  static void mctl_auto_detect_dram_size(const struct dram_para *para,
>  				       struct dram_config *config)
>  {
> -	unsigned int shift;
> +	unsigned int shift, cols, rows;
>  
>  	/* max. config for columns, but not rows */
>  	config->cols = 11;
> @@ -1373,23 +1373,27 @@ static void mctl_auto_detect_dram_size(const struct dram_para *para,
>  	shift = config->bus_full_width + 1;
>  
>  	/* detect column address bits */
> -	for (config->cols = 8; config->cols < 11; config->cols++) {
> -		if (mctl_mem_matches(1ULL << (config->cols + shift)))
> +	for (cols = 8; cols < 11; cols++) {
> +		if (mctl_mem_matches(1ULL << (cols + shift)))
>  			break;
>  	}
> -	debug("detected %u columns\n", config->cols);
> +	debug("detected %u columns\n", cols);
>  
>  	/* reconfigure to make sure that all active rows are accessible */
> -	config->rows = 18;
> +	config->cols = 8;
> +	config->rows = 17;
>  	mctl_core_init(para, config);
>  
>  	/* detect row address bits */
>  	shift = config->bus_full_width + 4 + config->cols;
> -	for (config->rows = 13; config->rows < 18; config->rows++) {
> -		if (mctl_mem_matches(1ULL << (config->rows + shift)))
> +	for (rows = 13; rows < 17; rows++) {
> +		if (mctl_mem_matches(1ULL << (rows + shift)))
>  			break;
>  	}
> -	debug("detected %u rows\n", config->rows);
> +	debug("detected %u rows\n", rows);
> +
> +	config->cols = cols;
> +	config->rows = rows;
>  }
>  
>  static unsigned long mctl_calc_size(const struct dram_config *config)

