Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE97432C85
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Apr 2025 13:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745847635; cv=none; b=mARBJNCB4axe5WLrdfIWaALMKPu5VyhoKU7hyjRg4U0xr0rsqbvwCAitC9lbiRsDCnOZTM/VqDma6X0oP9wzUHa+HReUd2aTvKwPhcbfUesmOMzY8BlGIBDJm8eLJIz7p26wha1ftQMA4Jy0Wlt92KqPiQwEXsfiNOZTXTKBlyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745847635; c=relaxed/simple;
	bh=CooQafcVNhTNaU8JEb8Gpo6KvYY3oTpAJfRA9kllof8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qAXUDJx6N7xU63VC7+CR/PYNpRqAN49UPMbXOv+qbe2lbKoVeYcZbzN2MozwuZJV8E2IxGYrcoLsLsBS5GI3W9NhEoHU5Hyf7N496zM+fM/TZ4d8JxWotth4oTj1vq4yT0XXiY/V0bf1rj8Uh3a7vog0tbfapjcNFhW+wEtm1T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE5421516;
	Mon, 28 Apr 2025 06:40:26 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15EE13F673;
	Mon, 28 Apr 2025 06:40:31 -0700 (PDT)
Date: Mon, 28 Apr 2025 14:40:29 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: jagan@amarulasolutions.com, trini@konsulko.com, macromorgan@hotmail.com,
 uwu@icenowy.me, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/5] sunxi: h6: dram: split dram_para struct
Message-ID: <20250428144029.0641d195@donnerap.manchester.arm.com>
In-Reply-To: <20250411161439.4743-5-jernej.skrabec@gmail.com>
References: <20250411161439.4743-1-jernej.skrabec@gmail.com>
	<20250411161439.4743-5-jernej.skrabec@gmail.com>
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

On Fri, 11 Apr 2025 18:14:38 +0200
Jernej Skrabec <jernej.skrabec@gmail.com> wrote:

> This change is same as in 78aa00c38e86 ("sunxi: H616: dram: split struct
> dram_para"), but for H6. This is needed in order to extract common code
> between H6 and H616 later.

Thanks for doing that, and like that other patch, that results in some
code savings: I count more than 450 bytes.

> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  .../include/asm/arch-sunxi/dram_sun50i_h6.h   |   7 +-
>  arch/arm/mach-sunxi/dram_sun50i_h6.c          | 145 ++++++++++--------
>  2 files changed, 82 insertions(+), 70 deletions(-)
> 
> diff --git a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h
> index f05a1845b32b..af6cd337d7e0 100644
> --- a/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h
> +++ b/arch/arm/include/asm/arch-sunxi/dram_sun50i_h6.h
> @@ -315,12 +315,15 @@ check_member(sunxi_mctl_phy_reg, dx[3].reserved_0xf0, 0xaf0);
>  struct dram_para {
>  	u32 clk;
>  	enum sunxi_dram_type type;
> +	const u8 dx_read_delays[NR_OF_BYTE_LANES][RD_LINES_PER_BYTE_LANE];
> +	const u8 dx_write_delays[NR_OF_BYTE_LANES][WR_LINES_PER_BYTE_LANE];
> +};
> +
> +struct dram_config {
>  	u8 cols;
>  	u8 rows;
>  	u8 ranks;
>  	u8 bus_full_width;
> -	const u8 dx_read_delays[NR_OF_BYTE_LANES][RD_LINES_PER_BYTE_LANE];
> -	const u8 dx_write_delays[NR_OF_BYTE_LANES][WR_LINES_PER_BYTE_LANE];
>  };
>  
>  static inline int ns_to_t(int nanoseconds)
> diff --git a/arch/arm/mach-sunxi/dram_sun50i_h6.c b/arch/arm/mach-sunxi/dram_sun50i_h6.c
> index 24b2cb1579f4..6a9e53f965eb 100644
> --- a/arch/arm/mach-sunxi/dram_sun50i_h6.c
> +++ b/arch/arm/mach-sunxi/dram_sun50i_h6.c
> @@ -35,13 +35,16 @@
>   */
>  
>  static void mctl_sys_init(u32 clk_rate);
> -static void mctl_com_init(const struct dram_para *para);
> -static bool mctl_channel_init(const struct dram_para *para);
> +static void mctl_com_init(const struct dram_para *para,
> +			  const struct dram_config *config);
> +static bool mctl_channel_init(const struct dram_para *para,
> +			      const struct dram_config *config);
>  
> -static bool mctl_core_init(struct dram_para *para)
> +static bool mctl_core_init(const struct dram_para *para,
> +			   const struct dram_config *config)
>  {
>  	mctl_sys_init(para->clk);
> -	mctl_com_init(para);
> +	mctl_com_init(para, config);
>  	switch (para->type) {
>  	case SUNXI_DRAM_TYPE_LPDDR3:
>  	case SUNXI_DRAM_TYPE_DDR3:
> @@ -50,7 +53,7 @@ static bool mctl_core_init(struct dram_para *para)
>  	default:
>  		panic("Unsupported DRAM type!");
>  	};
> -	return mctl_channel_init(para);
> +	return mctl_channel_init(para, config);
>  }
>  
>  /* PHY initialisation */
> @@ -196,15 +199,15 @@ static void mctl_sys_init(u32 clk_rate)
>  	writel(0x8000, &mctl_ctl->unk_0x00c);
>  }
>  
> -static void mctl_set_addrmap(const struct dram_para *para)
> +static void mctl_set_addrmap(const struct dram_config *config)
>  {
>  	struct sunxi_mctl_ctl_reg * const mctl_ctl =
>  			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
> -	u8 cols = para->cols;
> -	u8 rows = para->rows;
> -	u8 ranks = para->ranks;
> +	u8 cols = config->cols;
> +	u8 rows = config->rows;
> +	u8 ranks = config->ranks;
>  
> -	if (!para->bus_full_width)
> +	if (!config->bus_full_width)
>  		cols -= 1;
>  
>  	/* Ranks */
> @@ -282,7 +285,8 @@ static void mctl_set_addrmap(const struct dram_para *para)
>  	mctl_ctl->addrmap[8] = 0x3F3F;
>  }
>  
> -static void mctl_com_init(const struct dram_para *para)
> +static void mctl_com_init(const struct dram_para *para,
> +			  const struct dram_config *config)
>  {
>  	struct sunxi_mctl_com_reg * const mctl_com =
>  			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
> @@ -292,7 +296,7 @@ static void mctl_com_init(const struct dram_para *para)
>  			(struct sunxi_mctl_phy_reg *)SUNXI_DRAM_PHY0_BASE;
>  	u32 reg_val, tmp;
>  
> -	mctl_set_addrmap(para);
> +	mctl_set_addrmap(config);
>  
>  	setbits_le32(&mctl_com->cr, BIT(31));
>  
> @@ -311,12 +315,12 @@ static void mctl_com_init(const struct dram_para *para)
>  	clrsetbits_le32(&mctl_com->unk_0x008, 0x3f00, reg_val);
>  
>  	/* TODO: DDR4 */
> -	reg_val = MSTR_BURST_LENGTH(8) | MSTR_ACTIVE_RANKS(para->ranks);
> +	reg_val = MSTR_BURST_LENGTH(8) | MSTR_ACTIVE_RANKS(config->ranks);
>  	if (para->type == SUNXI_DRAM_TYPE_LPDDR3)
>  		reg_val |= MSTR_DEVICETYPE_LPDDR3;
>  	if (para->type == SUNXI_DRAM_TYPE_DDR3)
>  		reg_val |= MSTR_DEVICETYPE_DDR3 | MSTR_2TMODE;
> -	if (para->bus_full_width)
> +	if (config->bus_full_width)
>  		reg_val |= MSTR_BUSWIDTH_FULL;
>  	else
>  		reg_val |= MSTR_BUSWIDTH_HALF;
> @@ -328,7 +332,7 @@ static void mctl_com_init(const struct dram_para *para)
>  		reg_val = DCR_DDR3 | DCR_DDR8BANK | DCR_DDR2T;
>  	writel(reg_val | 0x400, &mctl_phy->dcr);
>  
> -	if (para->ranks == 2)
> +	if (config->ranks == 2)
>  		writel(0x0303, &mctl_ctl->odtmap);
>  	else
>  		writel(0x0201, &mctl_ctl->odtmap);
> @@ -346,7 +350,7 @@ static void mctl_com_init(const struct dram_para *para)
>  	}
>  	writel(reg_val, &mctl_ctl->odtcfg);
>  
> -	if (!para->bus_full_width) {
> +	if (!config->bus_full_width) {
>  		writel(0x0, &mctl_phy->dx[2].gcr[0]);
>  		writel(0x0, &mctl_phy->dx[3].gcr[0]);
>  	}
> @@ -411,7 +415,8 @@ static void mctl_bit_delay_set(const struct dram_para *para)
>  	}
>  }
>  
> -static bool mctl_channel_init(const struct dram_para *para)
> +static bool mctl_channel_init(const struct dram_para *para,
> +			      const struct dram_config *config)
>  {
>  	struct sunxi_mctl_com_reg * const mctl_com =
>  			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
> @@ -446,14 +451,14 @@ static bool mctl_channel_init(const struct dram_para *para)
>  
>  	udelay(100);
>  
> -	if (para->ranks == 2)
> +	if (config->ranks == 2)
>  		setbits_le32(&mctl_phy->dtcr[1], 0x30000);
>  	else
>  		clrsetbits_le32(&mctl_phy->dtcr[1], 0x30000, 0x10000);
>  
>  	if (sunxi_dram_is_lpddr(para->type))
>  		clrbits_le32(&mctl_phy->dtcr[1], BIT(1));
> -	if (para->ranks == 2) {
> +	if (config->ranks == 2) {
>  		writel(0x00010001, &mctl_phy->rankidr);
>  		writel(0x20000, &mctl_phy->odtcr);
>  	} else {
> @@ -555,11 +560,12 @@ static bool mctl_channel_init(const struct dram_para *para)
>  	return true;
>  }
>  
> -static void mctl_auto_detect_rank_width(struct dram_para *para)
> +static void mctl_auto_detect_rank_width(const struct dram_para *para,
> +					struct dram_config *config)
>  {
>  	/* this is minimum size that it's supported */
> -	para->cols = 8;
> -	para->rows = 13;
> +	config->cols = 8;
> +	config->rows = 13;
>  
>  	/*
>  	 * Previous versions of this driver tried to auto detect the rank
> @@ -575,68 +581,69 @@ static void mctl_auto_detect_rank_width(struct dram_para *para)
>  	 */
>  
>  	debug("testing 32-bit width, rank = 2\n");
> -	para->bus_full_width = 1;
> -	para->ranks = 2;
> -	if (mctl_core_init(para))
> +	config->bus_full_width = 1;
> +	config->ranks = 2;
> +	if (mctl_core_init(para, config))
>  		return;
>  
>  	debug("testing 32-bit width, rank = 1\n");
> -	para->bus_full_width = 1;
> -	para->ranks = 1;
> -	if (mctl_core_init(para))
> +	config->bus_full_width = 1;
> +	config->ranks = 1;
> +	if (mctl_core_init(para, config))
>  		return;
>  
>  	debug("testing 16-bit width, rank = 2\n");
> -	para->bus_full_width = 0;
> -	para->ranks = 2;
> -	if (mctl_core_init(para))
> +	config->bus_full_width = 0;
> +	config->ranks = 2;
> +	if (mctl_core_init(para, config))
>  		return;
>  
>  	debug("testing 16-bit width, rank = 1\n");
> -	para->bus_full_width = 0;
> -	para->ranks = 1;
> -	if (mctl_core_init(para))
> +	config->bus_full_width = 0;
> +	config->ranks = 1;
> +	if (mctl_core_init(para, config))
>  		return;
>  
>  	panic("This DRAM setup is currently not supported.\n");
>  }
>  
> -static void mctl_auto_detect_dram_size(struct dram_para *para)
> +static void mctl_auto_detect_dram_size(const struct dram_para *para,
> +				       struct dram_config *config)
>  {
>  	/* TODO: non-(LP)DDR3 */
>  
>  	/* detect row address bits */
> -	para->cols = 8;
> -	para->rows = 18;
> -	mctl_core_init(para);
> +	config->cols = 8;
> +	config->rows = 18;
> +	mctl_core_init(para, config);
>  
> -	for (para->rows = 13; para->rows < 18; para->rows++) {
> +	for (config->rows = 13; config->rows < 18; config->rows++) {
>  		/* 8 banks, 8 bit per byte and 16/32 bit width */
> -		if (mctl_mem_matches((1 << (para->rows + para->cols +
> -					    4 + para->bus_full_width))))
> +		if (mctl_mem_matches((1 << (config->rows + config->cols +
> +					    4 + config->bus_full_width))))
>  			break;
>  	}
>  
>  	/* detect column address bits */
> -	para->cols = 11;
> -	mctl_core_init(para);
> +	config->cols = 11;
> +	mctl_core_init(para, config);
>  
> -	for (para->cols = 8; para->cols < 11; para->cols++) {
> +	for (config->cols = 8; config->cols < 11; config->cols++) {
>  		/* 8 bits per byte and 16/32 bit width */
> -		if (mctl_mem_matches(1 << (para->cols + 1 +
> -					   para->bus_full_width)))
> +		if (mctl_mem_matches(1 << (config->cols + 1 +
> +					   config->bus_full_width)))
>  			break;
>  	}
>  }
>  
> -unsigned long mctl_calc_size(struct dram_para *para)
> +unsigned long mctl_calc_size(const struct dram_config *config)
>  {
> -	u8 width = para->bus_full_width ? 4 : 2;
> +	u8 width = config->bus_full_width ? 4 : 2;
>  
>  	/* TODO: non-(LP)DDR3 */
>  
>  	/* 8 banks */
> -	return (1ULL << (para->cols + para->rows + 3)) * width * para->ranks;
> +	return (1ULL << (config->cols + config->rows + 3)) * width * config->ranks;
>  }
>  
>  #define SUN50I_H6_LPDDR3_DX_WRITE_DELAYS			\
> @@ -661,36 +668,38 @@ unsigned long mctl_calc_size(struct dram_para *para)
>  	 {  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 },	\
>  	 {  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 }}
>  
> -unsigned long sunxi_dram_init(void)
> -{
> -	struct sunxi_mctl_com_reg * const mctl_com =
> -			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
> -	struct sunxi_prcm_reg *const prcm =
> -		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
> -	struct dram_para para = {
> -		.clk = CONFIG_DRAM_CLK,
> +static const struct dram_para para = {
> +	.clk = CONFIG_DRAM_CLK,
>  #ifdef CONFIG_SUNXI_DRAM_H6_LPDDR3
> -		.type = SUNXI_DRAM_TYPE_LPDDR3,
> -		.dx_read_delays  = SUN50I_H6_LPDDR3_DX_READ_DELAYS,
> -		.dx_write_delays = SUN50I_H6_LPDDR3_DX_WRITE_DELAYS,
> +	.type = SUNXI_DRAM_TYPE_LPDDR3,
> +	.dx_read_delays  = SUN50I_H6_LPDDR3_DX_READ_DELAYS,
> +	.dx_write_delays = SUN50I_H6_LPDDR3_DX_WRITE_DELAYS,
>  #elif defined(CONFIG_SUNXI_DRAM_H6_DDR3_1333)
> -		.type = SUNXI_DRAM_TYPE_DDR3,
> -		.dx_read_delays  = SUN50I_H6_DDR3_DX_READ_DELAYS,
> -		.dx_write_delays = SUN50I_H6_DDR3_DX_WRITE_DELAYS,
> +	.type = SUNXI_DRAM_TYPE_DDR3,
> +	.dx_read_delays  = SUN50I_H6_DDR3_DX_READ_DELAYS,
> +	.dx_write_delays = SUN50I_H6_DDR3_DX_WRITE_DELAYS,
>  #endif
> -	};
> +};
> +
> +unsigned long sunxi_dram_init(void)
> +{
> +	struct sunxi_mctl_com_reg * const mctl_com =
> +			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
> +	struct sunxi_prcm_reg *const prcm =
> +		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
> +	struct dram_config config;
>  
>  	unsigned long size;
>  
>  	setbits_le32(&prcm->res_cal_ctrl, BIT(8));
>  	clrbits_le32(&prcm->ohms240, 0x3f);
>  
> -	mctl_auto_detect_rank_width(&para);
> -	mctl_auto_detect_dram_size(&para);
> +	mctl_auto_detect_rank_width(&para, &config);
> +	mctl_auto_detect_dram_size(&para, &config);
>  
> -	mctl_core_init(&para);
> +	mctl_core_init(&para, &config);
>  
> -	size = mctl_calc_size(&para);
> +	size = mctl_calc_size(&config);
>  
>  	clrsetbits_le32(&mctl_com->cr, 0xf0, (size >> (10 + 10 + 4)) & 0xf0);
>  

