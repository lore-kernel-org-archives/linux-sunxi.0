Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA35353B7
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Apr 2023 10:14:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94D94D75;
	Tue, 11 Apr 2023 03:14:57 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 877533F73F;
	Tue, 11 Apr 2023 03:14:12 -0700 (PDT)
Date: Tue, 11 Apr 2023 11:14:09 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: jagan@amarulasolutions.com, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 07/10] sunxi: Parameterize bit delay code in H616
 DRAM driver
Message-ID: <20230411111409.2bfaf43b@donnerap.cambridge.arm.com>
In-Reply-To: <20230410082119.24616-8-jernej.skrabec@gmail.com>
References: <20230410082119.24616-1-jernej.skrabec@gmail.com>
 <20230410082119.24616-8-jernej.skrabec@gmail.com>
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

On Mon, 10 Apr 2023 10:21:16 +0200
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

> These values are highly board specific and thus make sense to add
> parameter for them. To ease adding support for new boards, let's make
> them same as in vendor DRAM settings.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Some bits still look odd, as mentioned in the previous review, but I
guess there is really not much we can do about it. Meh. Seems to work,
though, and the values seem to match before and after, so:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre


> ---
>  .../include/asm/arch-sunxi/dram_sun50i_h616.h |   3 +
>  arch/arm/mach-sunxi/Kconfig                   |  18 ++
>  arch/arm/mach-sunxi/dram_sun50i_h616.c        | 189 +++++++++++++-----
>  configs/x96_mate_defconfig                    |   2 +
>  4 files changed, 163 insertions(+), 49 deletions(-)
> 
> diff --git a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
> index dbdc6b694ec1..034ba98bc243 100644
> --- a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
> +++ b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h616.h
> @@ -155,7 +155,10 @@ struct dram_para {
>  	u32 dx_odt;
>  	u32 dx_dri;
>  	u32 ca_dri;
> +	u32 odt_en;
>  	u32 tpr10;
> +	u32 tpr11;
> +	u32 tpr12;
>  };
>  
>  
> diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> index 4300d388e066..7b38e83c2d7e 100644
> --- a/arch/arm/mach-sunxi/Kconfig
> +++ b/arch/arm/mach-sunxi/Kconfig
> @@ -67,11 +67,29 @@ config DRAM_SUN50I_H616_CA_DRI
>  	help
>  	  CA DRI value from vendor DRAM settings.
>  
> +config DRAM_SUN50I_H616_ODT_EN
> +	hex "H616 DRAM ODT EN parameter"
> +	default 0x1
> +	help
> +	  ODT EN value from vendor DRAM settings.
> +
>  config DRAM_SUN50I_H616_TPR10
>  	hex "H616 DRAM TPR10 parameter"
>  	help
>  	  TPR10 value from vendor DRAM settings. It tells which features
>  	  should be configured, like write leveling, read calibration, etc.
> +
> +config DRAM_SUN50I_H616_TPR11
> +	hex "H616 DRAM TPR11 parameter"
> +	default 0x0
> +	help
> +	  TPR11 value from vendor DRAM settings.
> +
> +config DRAM_SUN50I_H616_TPR12
> +	hex "H616 DRAM TPR12 parameter"
> +	default 0x0
> +	help
> +	  TPR12 value from vendor DRAM settings.
>  endif
>  
>  config SUN6I_PRCM
> diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> index 3fe45845b78e..f5d8718fefff 100644
> --- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
> +++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> @@ -574,7 +574,7 @@ static bool mctl_phy_write_training(struct dram_para *para)
>  
>  static void mctl_phy_bit_delay_compensation(struct dram_para *para)
>  {
> -	u32 *ptr;
> +	u32 *ptr, val;
>  	int i;
>  
>  	if (para->tpr10 & TPR10_DX_BIT_DELAY1) {
> @@ -582,49 +582,93 @@ static void mctl_phy_bit_delay_compensation(struct dram_para *para)
>  		setbits_le32(SUNXI_DRAM_PHY0_BASE + 8, 8);
>  		clrbits_le32(SUNXI_DRAM_PHY0_BASE + 0x190, 0x10);
>  
> +		if (para->tpr10 & BIT(30))
> +			val = para->tpr11 & 0x3f;
> +		else
> +			val = (para->tpr11 & 0xf) << 1;
> +
>  		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x484);
>  		for (i = 0; i < 9; i++) {
> -			writel_relaxed(0x16, ptr);
> -			writel_relaxed(0x16, ptr + 0x30);
> +			writel_relaxed(val, ptr);
> +			writel_relaxed(val, ptr + 0x30);
>  			ptr += 2;
>  		}
> -		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x4d0);
> -		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x590);
> -		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x4cc);
> -		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x58c);
> +
> +		if (para->tpr10 & BIT(30))
> +			val = (para->odt_en >> 15) & 0x1e;
> +		else
> +			val = (para->tpr11 >> 15) & 0x1e;
> +
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x4d0);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x590);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x4cc);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x58c);
> +
> +		if (para->tpr10 & BIT(30))
> +			val = (para->tpr11 >> 8) & 0x3f;
> +		else
> +			val = (para->tpr11 >> 3) & 0x1e;
>  
>  		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x4d8);
>  		for (i = 0; i < 9; i++) {
> -			writel_relaxed(0x1a, ptr);
> -			writel_relaxed(0x1a, ptr + 0x30);
> +			writel_relaxed(val, ptr);
> +			writel_relaxed(val, ptr + 0x30);
>  			ptr += 2;
>  		}
> -		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x524);
> -		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x5e4);
> -		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x520);
> -		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x5e0);
> +
> +		if (para->tpr10 & BIT(30))
> +			val = (para->odt_en >> 19) & 0x1e;
> +		else
> +			val = (para->tpr11 >> 19) & 0x1e;
> +
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x524);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x5e4);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x520);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x5e0);
> +
> +		if (para->tpr10 & BIT(30))
> +			val = (para->tpr11 >> 16) & 0x3f;
> +		else
> +			val = (para->tpr11 >> 7) & 0x1e;
>  
>  		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x604);
>  		for (i = 0; i < 9; i++) {
> -			writel_relaxed(0x1a, ptr);
> -			writel_relaxed(0x1a, ptr + 0x30);
> +			writel_relaxed(val, ptr);
> +			writel_relaxed(val, ptr + 0x30);
>  			ptr += 2;
>  		}
> -		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x650);
> -		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x710);
> -		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x64c);
> -		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x70c);
> +
> +		if (para->tpr10 & BIT(30))
> +			val = (para->odt_en >> 23) & 0x1e;
> +		else
> +			val = (para->tpr11 >> 23) & 0x1e;
> +
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x650);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x710);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x64c);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x70c);
> +
> +		if (para->tpr10 & BIT(30))
> +			val = (para->tpr11 >> 24) & 0x3f;
> +		else
> +			val = (para->tpr11 >> 11) & 0x1e;
>  
>  		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x658);
>  		for (i = 0; i < 9; i++) {
> -			writel_relaxed(0x1a, ptr);
> -			writel_relaxed(0x1a, ptr + 0x30);
> +			writel_relaxed(val, ptr);
> +			writel_relaxed(val, ptr + 0x30);
>  			ptr += 2;
>  		}
> -		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x6a4);
> -		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x764);
> -		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x6a0);
> -		writel_relaxed(0x1e, SUNXI_DRAM_PHY0_BASE + 0x760);
> +
> +		if (para->tpr10 & BIT(30))
> +			val = (para->odt_en >> 27) & 0x1e;
> +		else
> +			val = (para->tpr11 >> 27) & 0x1e;
> +
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x6a4);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x764);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x6a0);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x760);
>  
>  		dmb();
>  
> @@ -635,49 +679,93 @@ static void mctl_phy_bit_delay_compensation(struct dram_para *para)
>  		clrbits_le32(SUNXI_DRAM_PHY0_BASE + 0x54, 0x80);
>  		clrbits_le32(SUNXI_DRAM_PHY0_BASE + 0x190, 4);
>  
> +		if (para->tpr10 & BIT(30))
> +			val = para->tpr12 & 0x3f;
> +		else
> +			val = (para->tpr12 & 0xf) << 1;
> +
>  		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x480);
>  		for (i = 0; i < 9; i++) {
> -			writel_relaxed(0x10, ptr);
> -			writel_relaxed(0x10, ptr + 0x30);
> +			writel_relaxed(val, ptr);
> +			writel_relaxed(val, ptr + 0x30);
>  			ptr += 2;
>  		}
> -		writel_relaxed(0x18, SUNXI_DRAM_PHY0_BASE + 0x528);
> -		writel_relaxed(0x18, SUNXI_DRAM_PHY0_BASE + 0x5e8);
> -		writel_relaxed(0x18, SUNXI_DRAM_PHY0_BASE + 0x4c8);
> -		writel_relaxed(0x18, SUNXI_DRAM_PHY0_BASE + 0x588);
> +
> +		if (para->tpr10 & BIT(30))
> +			val = (para->odt_en << 1) & 0x1e;
> +		else
> +			val = (para->tpr12 >> 15) & 0x1e;
> +
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x528);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x5e8);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x4c8);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x588);
> +
> +		if (para->tpr10 & BIT(30))
> +			val = (para->tpr12 >> 8) & 0x3f;
> +		else
> +			val = (para->tpr12 >> 3) & 0x1e;
>  
>  		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x4d4);
>  		for (i = 0; i < 9; i++) {
> -			writel_relaxed(0x12, ptr);
> -			writel_relaxed(0x12, ptr + 0x30);
> +			writel_relaxed(val, ptr);
> +			writel_relaxed(val, ptr + 0x30);
>  			ptr += 2;
>  		}
> -		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x52c);
> -		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x5ec);
> -		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x51c);
> -		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x5dc);
> +
> +		if (para->tpr10 & BIT(30))
> +			val = (para->odt_en >> 3) & 0x1e;
> +		else
> +			val = (para->tpr12 >> 19) & 0x1e;
> +
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x52c);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x5ec);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x51c);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x5dc);
> +
> +		if (para->tpr10 & BIT(30))
> +			val = (para->tpr12 >> 16) & 0x3f;
> +		else
> +			val = (para->tpr12 >> 7) & 0x1e;
>  
>  		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x600);
>  		for (i = 0; i < 9; i++) {
> -			writel_relaxed(0x12, ptr);
> -			writel_relaxed(0x12, ptr + 0x30);
> +			writel_relaxed(val, ptr);
> +			writel_relaxed(val, ptr + 0x30);
>  			ptr += 2;
>  		}
> -		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x6a8);
> -		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x768);
> -		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x648);
> -		writel_relaxed(0x1a, SUNXI_DRAM_PHY0_BASE + 0x708);
> +
> +		if (para->tpr10 & BIT(30))
> +			val = (para->odt_en >> 7) & 0x1e;
> +		else
> +			val = (para->tpr12 >> 23) & 0x1e;
> +
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x6a8);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x768);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x648);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x708);
> +
> +		if (para->tpr10 & BIT(30))
> +			val = (para->tpr12 >> 24) & 0x3f;
> +		else
> +			val = (para->tpr12 >> 11) & 0x1e;
>  
>  		ptr = (u32 *)(SUNXI_DRAM_PHY0_BASE + 0x654);
>  		for (i = 0; i < 9; i++) {
> -			writel_relaxed(0x14, ptr);
> -			writel_relaxed(0x14, ptr + 0x30);
> +			writel_relaxed(val, ptr);
> +			writel_relaxed(val, ptr + 0x30);
>  			ptr += 2;
>  		}
> -		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x6ac);
> -		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x76c);
> -		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x69c);
> -		writel_relaxed(0x1c, SUNXI_DRAM_PHY0_BASE + 0x75c);
> +
> +		if (para->tpr10 & BIT(30))
> +			val = (para->odt_en >> 11) & 0x1e;
> +		else
> +			val = (para->tpr12 >> 27) & 0x1e;
> +
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x6ac);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x76c);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x69c);
> +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x75c);
>  
>  		dmb();
>  
> @@ -1021,7 +1109,10 @@ unsigned long sunxi_dram_init(void)
>  		.dx_odt = CONFIG_DRAM_SUN50I_H616_DX_ODT,
>  		.dx_dri = CONFIG_DRAM_SUN50I_H616_DX_DRI,
>  		.ca_dri = CONFIG_DRAM_SUN50I_H616_CA_DRI,
> +		.odt_en = CONFIG_DRAM_SUN50I_H616_ODT_EN,
>  		.tpr10 = CONFIG_DRAM_SUN50I_H616_TPR10,
> +		.tpr11 = CONFIG_DRAM_SUN50I_H616_TPR11,
> +		.tpr12 = CONFIG_DRAM_SUN50I_H616_TPR12,
>  	};
>  	unsigned long size;
>  
> diff --git a/configs/x96_mate_defconfig b/configs/x96_mate_defconfig
> index b00daa458b28..acc64898da19 100644
> --- a/configs/x96_mate_defconfig
> +++ b/configs/x96_mate_defconfig
> @@ -7,6 +7,8 @@ CONFIG_DRAM_SUN50I_H616_DX_ODT=0x03030303
>  CONFIG_DRAM_SUN50I_H616_DX_DRI=0x0e0e0e0e
>  CONFIG_DRAM_SUN50I_H616_CA_DRI=0x1c12
>  CONFIG_DRAM_SUN50I_H616_TPR10=0x2f0007
> +CONFIG_DRAM_SUN50I_H616_TPR11=0xffffdddd
> +CONFIG_DRAM_SUN50I_H616_TPR12=0xfedf7557
>  CONFIG_MACH_SUN50I_H616=y
>  CONFIG_R_I2C_ENABLE=y
>  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set

