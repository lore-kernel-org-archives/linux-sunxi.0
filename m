Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A92453B7
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Apr 2023 10:15:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36F1FD75;
	Tue, 11 Apr 2023 03:15:46 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43C653F73F;
	Tue, 11 Apr 2023 03:15:01 -0700 (PDT)
Date: Tue, 11 Apr 2023 11:14:58 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: jagan@amarulasolutions.com, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 09/10] sunxi: Parameterize some of H616 DDR3 timings
Message-ID: <20230411111458.05c73227@donnerap.cambridge.arm.com>
In-Reply-To: <20230410082119.24616-10-jernej.skrabec@gmail.com>
References: <20230410082119.24616-1-jernej.skrabec@gmail.com>
 <20230410082119.24616-10-jernej.skrabec@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Apr 2023 10:21:18 +0200
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

> Currently twr2rd, trd2wr and twtp are constants, but according to
> vendor driver they are calculated from other values. Do that here too,
> in preparation for later introduction of new parameter.
> 
> While at it, introduce constant for t_wr_lat, which was incorrectly
> calculated from tcl before.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

The transformations look correct, though I cannot really judge their
meanings. Nevertheless:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm/mach-sunxi/dram_timings/h616_ddr3_1333.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-sunxi/dram_timings/h616_ddr3_1333.c b/arch/arm/mach-sunxi/dram_timings/h616_ddr3_1333.c
> index 8f508344bc17..f109e920820b 100644
> --- a/arch/arm/mach-sunxi/dram_timings/h616_ddr3_1333.c
> +++ b/arch/arm/mach-sunxi/dram_timings/h616_ddr3_1333.c
> @@ -48,10 +48,11 @@ void mctl_set_timing_params(struct dram_para *para)
>  	u8 tcl		= 7;			/* JEDEC: CL / 2 => 6 */
>  	u8 tcwl		= 5;			/* JEDEC: 8 */
>  	u8 t_rdata_en	= 9;			/* ? */
> +	u8 t_wr_lat	= 5;			/* ? */
>  
> -	u8 twtp		= 14;			/* (WL + BL / 2 + tWR) / 2 */
> -	u8 twr2rd	= trtp + 7;		/* (WL + BL / 2 + tWTR) / 2 */
> -	u8 trd2wr	= 5;			/* (RL + BL / 2 + 2 - WL) / 2 */
> +	u8 twtp		= tcl + 2 + tcwl;	/* (WL + BL / 2 + tWR) / 2 */
> +	u8 twr2rd	= trtp + 2 + tcwl;	/* (WL + BL / 2 + tWTR) / 2 */
> +	u8 trd2wr	= tcl + 3 - tcwl;	/* (RL + BL / 2 + 2 - WL) / 2 */
>  
>  	/* set DRAM timing */
>  	writel((twtp << 24) | (tfaw << 16) | (trasmax << 8) | tras,
> @@ -85,7 +86,7 @@ void mctl_set_timing_params(struct dram_para *para)
>  	clrsetbits_le32(&mctl_ctl->rankctl, 0xff0, 0x660);
>  
>  	/* Configure DFI timing */
> -	writel((tcl - 2) | 0x2000000 | (t_rdata_en << 16) | 0x808000,
> +	writel(t_wr_lat | 0x2000000 | (t_rdata_en << 16) | 0x808000,
>  	       &mctl_ctl->dfitmg0);
>  	writel(0x100202, &mctl_ctl->dfitmg1);
>  

