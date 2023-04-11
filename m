Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711E953B7
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Apr 2023 10:14:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6582CD75;
	Tue, 11 Apr 2023 03:15:22 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5821A3F73F;
	Tue, 11 Apr 2023 03:14:37 -0700 (PDT)
Date: Tue, 11 Apr 2023 11:14:34 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: jagan@amarulasolutions.com, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 08/10] sunxi: Parameterize "unknown feature" in H616
 DRAM driver
Message-ID: <20230411111434.592527a7@donnerap.cambridge.arm.com>
In-Reply-To: <20230410082119.24616-9-jernej.skrabec@gmail.com>
References: <20230410082119.24616-1-jernej.skrabec@gmail.com>
 <20230410082119.24616-9-jernej.skrabec@gmail.com>
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

On Mon, 10 Apr 2023 10:21:17 +0200
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

> Part of the code, previously known as "unknown feature", also doesn't
> have constant values. They are derived from TPR0 parameter in vendor
> DRAM code.
> 
> Let's move that code to separate function and introduce TPR0 parameter
> here too, to ease adding new boards.

so the values written now don't really match the previously used ones (not
even for the OPi-Zero2 boot0 TPR0/10 registers), but then again this whole
code was not in use before. The whole transformation looks vaguely correct,
though, and it works on the X96 Mate (which now uses this code), so:

Acked-by: Andre Przywara <andre.przywara@arm.com>

Thanks,
Andre

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  .../include/asm/arch-sunxi/dram_sun50i_h616.h |  1 +
>  arch/arm/mach-sunxi/Kconfig                   |  6 +++
>  arch/arm/mach-sunxi/dram_sun50i_h616.c        | 47 ++++++++++++++-----
>  configs/x96_mate_defconfig                    |  1 +
>  4 files changed, 44 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
> index 034ba98bc243..615532c6eebb 100644
> --- a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
> +++ b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
> @@ -156,6 +156,7 @@ struct dram_para {
>  	u32 dx_dri;
>  	u32 ca_dri;
>  	u32 odt_en;
> +	u32 tpr0;
>  	u32 tpr10;
>  	u32 tpr11;
>  	u32 tpr12;
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index 7b38e83c2d7e..fe34755f88ec 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -73,6 +73,12 @@ config DRAM_SUN50I_H616_ODT_EN
>  	help
>  	  ODT EN value from vendor DRAM settings.
>  
> +config DRAM_SUN50I_H616_TPR0
> +	hex "H616 DRAM TPR0 parameter"
> +	default 0x0
> +	help
> +	  TPR0 value from vendor DRAM settings.
> +
>  config DRAM_SUN50I_H616_TPR10
>  	hex "H616 DRAM TPR10 parameter"
>  	help
> diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> index f5d8718fefff..44bb15367beb 100644
> --- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
> +++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> @@ -773,6 +773,39 @@ static void mctl_phy_bit_delay_compensation(struct dram_para *para)
>  	}
>  }
>  
> +static void mctl_phy_ca_bit_delay_compensation(struct dram_para *para)
> +{
> +	u32 val, *ptr;
> +	int i;
> +
> +	if (para->tpr0 & BIT(30))
> +		val = (para->tpr0 >> 7) & 0x3e;
> +	else
> +		val = (para->tpr10 >> 3) & 0x1e;
> +
> +	ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x780);
> +	for (i = 0; i < 32; i++)
> +		writel(val, &ptr[i]);
> +
> +	val = (para->tpr10 << 1) & 0x1e;
> +	writel(val, SUNXI_DRAM_PHY0_BASE + 0x7dc);
> +	writel(val, SUNXI_DRAM_PHY0_BASE + 0x7e0);
> +
> +	/* following configuration is DDR3 specific */
> +	val = (para->tpr10 >> 7) & 0x1e;
> +	writel(val, SUNXI_DRAM_PHY0_BASE + 0x7d4);
> +	if (para->ranks == 2) {
> +		val = (para->tpr10 >> 11) & 0x1e;
> +		writel(val, SUNXI_DRAM_PHY0_BASE + 0x79c);
> +	}
> +	if (para->tpr0 & BIT(31)) {
> +		val = (para->tpr0 << 1) & 0x3e;
> +		writel(val, SUNXI_DRAM_PHY0_BASE + 0x78c);
> +		writel(val, SUNXI_DRAM_PHY0_BASE + 0x7a4);
> +		writel(val, SUNXI_DRAM_PHY0_BASE + 0x7b8);
> +	}
> +}
> +
>  static bool mctl_phy_init(struct dram_para *para)
>  {
>  	struct sunxi_mctl_com_reg * const mctl_com =
> @@ -807,17 +840,8 @@ static bool mctl_phy_init(struct dram_para *para)
>  	for (i = 0; i < ARRAY_SIZE(phy_init); i++)
>  		writel(phy_init[i], &ptr[i]);
>  
> -	if (para->tpr10 & TPR10_CA_BIT_DELAY) {
> -		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x780);
> -		for (i = 0; i < 32; i++)
> -			writel(0x16, &ptr[i]);
> -		writel(0xe, SUNXI_DRAM_PHY0_BASE + 0x78c);
> -		writel(0xe, SUNXI_DRAM_PHY0_BASE + 0x7a4);
> -		writel(0xe, SUNXI_DRAM_PHY0_BASE + 0x7b8);
> -		writel(0x8, SUNXI_DRAM_PHY0_BASE + 0x7d4);
> -		writel(0xe, SUNXI_DRAM_PHY0_BASE + 0x7dc);
> -		writel(0xe, SUNXI_DRAM_PHY0_BASE + 0x7e0);
> -	}
> +	if (para->tpr10 & TPR10_CA_BIT_DELAY)
> +		mctl_phy_ca_bit_delay_compensation(para);
>  
>  	writel(0x80, SUNXI_DRAM_PHY0_BASE + 0x3dc);
>  	writel(0x80, SUNXI_DRAM_PHY0_BASE + 0x45c);
> @@ -1110,6 +1134,7 @@ unsigned long sunxi_dram_init(void)
>  		.dx_dri = CONFIG_DRAM_SUN50I_H616_DX_DRI,
>  		.ca_dri = CONFIG_DRAM_SUN50I_H616_CA_DRI,
>  		.odt_en = CONFIG_DRAM_SUN50I_H616_ODT_EN,
> +		.tpr0 = CONFIG_DRAM_SUN50I_H616_TPR0,
>  		.tpr10 = CONFIG_DRAM_SUN50I_H616_TPR10,
>  		.tpr11 = CONFIG_DRAM_SUN50I_H616_TPR11,
>  		.tpr12 = CONFIG_DRAM_SUN50I_H616_TPR12,
> diff --git a/configs/x96_mate_defconfig b/configs/x96_mate_defconfig
> index acc64898da19..aedb3277022a 100644
> --- a/configs/x96_mate_defconfig
> +++ b/configs/x96_mate_defconfig
> @@ -6,6 +6,7 @@ CONFIG_DRAM_SUN50I_H616_READ_CALIBRATION=y
>  CONFIG_DRAM_SUN50I_H616_DX_ODT=0x03030303
>  CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
>  CONFIG_DRAM_SUN50I_H616_CA_DRI=0x1c12
> +CONFIG_DRAM_SUN50I_H616_TPR0=0xc0000c05
>  CONFIG_DRAM_SUN50I_H616_TPR10=0x2f0007
>  CONFIG_DRAM_SUN50I_H616_TPR11=0xffffdddd
>  CONFIG_DRAM_SUN50I_H616_TPR12=0xfedf7557

