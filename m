Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A64953B7
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Apr 2023 10:15:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D98E8FEC;
	Tue, 11 Apr 2023 03:16:15 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC3463F73F;
	Tue, 11 Apr 2023 03:15:30 -0700 (PDT)
Date: Tue, 11 Apr 2023 11:15:28 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: jagan@amarulasolutions.com, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 10/10] sunxi: Add TPR2 parameter for H616 DRAM driver
Message-ID: <20230411111528.1f30492f@donnerap.cambridge.arm.com>
In-Reply-To: <20230410082119.24616-11-jernej.skrabec@gmail.com>
References: <20230410082119.24616-1-jernej.skrabec@gmail.com>
 <20230410082119.24616-11-jernej.skrabec@gmail.com>
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

On Mon, 10 Apr 2023 10:21:19 +0200
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

Hi,

> It turns out that some H616 and related SoCs (like H313) need TPR2
> parameter for proper working. Add it.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

I don't have any boards that don't use a TPR2 value of 0, so
cannot test the new case, but for TPR2==0 the same values will be
written into the registers as before. So:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks,
Andre

> ---
>  .../include/asm/arch-sunxi/dram_sun50i_h616.h |  1 +
>  arch/arm/mach-sunxi/Kconfig                   |  6 ++
>  arch/arm/mach-sunxi/dram_sun50i_h616.c        | 75 +++++++++++++------
>  .../mach-sunxi/dram_timings/h616_ddr3_1333.c  | 17 ++++-
>  4 files changed, 75 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
> index 615532c6eebb..6db869c0985b 100644
> --- a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
> +++ b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
> @@ -157,6 +157,7 @@ struct dram_para {
>  	u32 ca_dri;
>  	u32 odt_en;
>  	u32 tpr0;
> +	u32 tpr2;
>  	u32 tpr10;
>  	u32 tpr11;
>  	u32 tpr12;
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index fe34755f88ec..6be8a4de53fe 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -79,6 +79,12 @@ config DRAM_SUN50I_H616_TPR0
>  	help
>  	  TPR0 value from vendor DRAM settings.
>  
> +config DRAM_SUN50I_H616_TPR2
> +	hex "H616 DRAM TPR2 parameter"
> +	default 0x0
> +	help
> +	  TPR2 value from vendor DRAM settings.
> +
>  config DRAM_SUN50I_H616_TPR10
>  	hex "H616 DRAM TPR10 parameter"
>  	help
> diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> index 44bb15367beb..1f9416d6eaf5 100644
> --- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
> +++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> @@ -788,21 +788,37 @@ static void mctl_phy_ca_bit_delay_compensation(struct dram_para *para)
>  		writel(val, &ptr[i]);
>  
>  	val = (para->tpr10 << 1) & 0x1e;
> +	writel(val, SUNXI_DRAM_PHY0_BASE + 0x7d8);
>  	writel(val, SUNXI_DRAM_PHY0_BASE + 0x7dc);
>  	writel(val, SUNXI_DRAM_PHY0_BASE + 0x7e0);
> +	writel(val, SUNXI_DRAM_PHY0_BASE + 0x7f4);
>  
>  	/* following configuration is DDR3 specific */
>  	val = (para->tpr10 >> 7) & 0x1e;
> -	writel(val, SUNXI_DRAM_PHY0_BASE + 0x7d4);
> -	if (para->ranks == 2) {
> -		val = (para->tpr10 >> 11) & 0x1e;
> -		writel(val, SUNXI_DRAM_PHY0_BASE + 0x79c);
> -	}
> -	if (para->tpr0 & BIT(31)) {
> -		val = (para->tpr0 << 1) & 0x3e;
> -		writel(val, SUNXI_DRAM_PHY0_BASE + 0x78c);
> -		writel(val, SUNXI_DRAM_PHY0_BASE + 0x7a4);
> -		writel(val, SUNXI_DRAM_PHY0_BASE + 0x7b8);
> +	if (para->tpr2 & 1) {
> +		writel(val, SUNXI_DRAM_PHY0_BASE + 0x794);
> +		if (para->ranks == 2) {
> +			val = (para->tpr10 >> 11) & 0x1e;
> +			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7e4);
> +		}
> +		if (para->tpr0 & BIT(31)) {
> +			val = (para->tpr0 << 1) & 0x3e;
> +			writel(val, SUNXI_DRAM_PHY0_BASE + 0x790);
> +			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7b8);
> +			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7cc);
> +		}
> +	} else {
> +		writel(val, SUNXI_DRAM_PHY0_BASE + 0x7d4);
> +		if (para->ranks == 2) {
> +			val = (para->tpr10 >> 11) & 0x1e;
> +			writel(val, SUNXI_DRAM_PHY0_BASE + 0x79c);
> +		}
> +		if (para->tpr0 & BIT(31)) {
> +			val = (para->tpr0 << 1) & 0x3e;
> +			writel(val, SUNXI_DRAM_PHY0_BASE + 0x78c);
> +			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7a4);
> +			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7b8);
> +		}
>  	}
>  }
>  
> @@ -812,7 +828,7 @@ static bool mctl_phy_init(struct dram_para *para)
>  			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
>  	struct sunxi_mctl_ctl_reg * const mctl_ctl =
>  			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
> -	u32 val, *ptr;
> +	u32 val, val2, *ptr, mr0, mr2;
>  	int i;
>  
>  	if (para->bus_full_width)
> @@ -821,20 +837,28 @@ static bool mctl_phy_init(struct dram_para *para)
>  		val = 3;
>  	clrsetbits_le32(SUNXI_DRAM_PHY0_BASE + 0x3c, 0xf, val);
>  
> -	writel(0xd, SUNXI_DRAM_PHY0_BASE + 0x14);
> -	writel(0xd, SUNXI_DRAM_PHY0_BASE + 0x35c);
> -	writel(0xd, SUNXI_DRAM_PHY0_BASE + 0x368);
> -	writel(0xd, SUNXI_DRAM_PHY0_BASE + 0x374);
> +	if (para->tpr2 & 0x100) {
> +		val = 9;
> +		val2 = 7;
> +	} else {
> +		val = 13;
> +		val2 = 9;
> +	}
> +
> +	writel(val, SUNXI_DRAM_PHY0_BASE + 0x14);
> +	writel(val, SUNXI_DRAM_PHY0_BASE + 0x35c);
> +	writel(val, SUNXI_DRAM_PHY0_BASE + 0x368);
> +	writel(val, SUNXI_DRAM_PHY0_BASE + 0x374);
>  
>  	writel(0, SUNXI_DRAM_PHY0_BASE + 0x18);
>  	writel(0, SUNXI_DRAM_PHY0_BASE + 0x360);
>  	writel(0, SUNXI_DRAM_PHY0_BASE + 0x36c);
>  	writel(0, SUNXI_DRAM_PHY0_BASE + 0x378);
>  
> -	writel(9, SUNXI_DRAM_PHY0_BASE + 0x1c);
> -	writel(9, SUNXI_DRAM_PHY0_BASE + 0x364);
> -	writel(9, SUNXI_DRAM_PHY0_BASE + 0x370);
> -	writel(9, SUNXI_DRAM_PHY0_BASE + 0x37c);
> +	writel(val2, SUNXI_DRAM_PHY0_BASE + 0x1c);
> +	writel(val2, SUNXI_DRAM_PHY0_BASE + 0x364);
> +	writel(val2, SUNXI_DRAM_PHY0_BASE + 0x370);
> +	writel(val2, SUNXI_DRAM_PHY0_BASE + 0x37c);
>  
>  	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0xc0);
>  	for (i = 0; i < ARRAY_SIZE(phy_init); i++)
> @@ -890,7 +914,15 @@ static bool mctl_phy_init(struct dram_para *para)
>  	writel(1, &mctl_ctl->swctl);
>  	mctl_await_completion(&mctl_ctl->swstat, 1, 1);
>  
> -	writel(0x1f14, &mctl_ctl->mrctrl1);
> +	if (para->tpr2 & 0x100) {
> +		mr0 = 0x1b50;
> +		mr2 = 0x10;
> +	} else {
> +		mr0 = 0x1f14;
> +		mr2 = 0x20;
> +	}
> +
> +	writel(mr0, &mctl_ctl->mrctrl1);
>  	writel(0x80000030, &mctl_ctl->mrctrl0);
>  	mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
>  
> @@ -898,7 +930,7 @@ static bool mctl_phy_init(struct dram_para *para)
>  	writel(0x80001030, &mctl_ctl->mrctrl0);
>  	mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
>  
> -	writel(0x20, &mctl_ctl->mrctrl1);
> +	writel(mr2, &mctl_ctl->mrctrl1);
>  	writel(0x80002030, &mctl_ctl->mrctrl0);
>  	mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
>  
> @@ -1135,6 +1167,7 @@ unsigned long sunxi_dram_init(void)
>  		.ca_dri = CONFIG_DRAM_SUN50I_H616_CA_DRI,
>  		.odt_en = CONFIG_DRAM_SUN50I_H616_ODT_EN,
>  		.tpr0 = CONFIG_DRAM_SUN50I_H616_TPR0,
> +		.tpr2 = CONFIG_DRAM_SUN50I_H616_TPR2,
>  		.tpr10 = CONFIG_DRAM_SUN50I_H616_TPR10,
>  		.tpr11 = CONFIG_DRAM_SUN50I_H616_TPR11,
>  		.tpr12 = CONFIG_DRAM_SUN50I_H616_TPR12,
> diff --git a/arch/arm/mach-sunxi/dram_timings/h616_ddr3_1333.c b/arch/arm/mach-sunxi/dram_timings/h616_ddr3_1333.c
> index f109e920820b..eea4d6abec81 100644
> --- a/arch/arm/mach-sunxi/dram_timings/h616_ddr3_1333.c
> +++ b/arch/arm/mach-sunxi/dram_timings/h616_ddr3_1333.c
> @@ -50,9 +50,20 @@ void mctl_set_timing_params(struct dram_para *para)
>  	u8 t_rdata_en	= 9;			/* ? */
>  	u8 t_wr_lat	= 5;			/* ? */
>  
> -	u8 twtp		= tcl + 2 + tcwl;	/* (WL + BL / 2 + tWR) / 2 */
> -	u8 twr2rd	= trtp + 2 + tcwl;	/* (WL + BL / 2 + tWTR) / 2 */
> -	u8 trd2wr	= tcl + 3 - tcwl;	/* (RL + BL / 2 + 2 - WL) / 2 */
> +	u8 twtp;				/* (WL + BL / 2 + tWR) / 2 */
> +	u8 twr2rd;				/* (WL + BL / 2 + tWTR) / 2 */
> +	u8 trd2wr;				/* (RL + BL / 2 + 2 - WL) / 2 */
> +
> +	if (para->tpr2 & 0x100) {
> +		tcl = 5;
> +		tcwl = 4;
> +		t_rdata_en = 5;
> +		t_wr_lat = 3;
> +	}
> +
> +	twtp   = tcl + 2 + tcwl;
> +	twr2rd = trtp + 2 + tcwl;
> +	trd2wr = tcl + 3 - tcwl;
>  
>  	/* set DRAM timing */
>  	writel((twtp << 24) | (tfaw << 16) | (trasmax << 8) | tras,

