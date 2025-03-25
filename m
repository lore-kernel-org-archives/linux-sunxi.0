Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC592561BD
	for <linux-sunxi@lists.linux.dev>; Tue, 25 Mar 2025 13:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742910002; cv=none; b=OJ6hPs0c+wXO8Czt+xEDjmxqZwd1f5K0ygO8oXuT9kF5RZ5HnAcXNVIYWQXfitj/t2dHZ/yFk2K1qABuIPMMdgQruv3yaA9iUbED2lAMS6pd5vxBJ+sWj3szbx4E+lc6VtTDgh21sxrczQnHSZBrm0R+DM14xF5ueeg3xdsz+Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742910002; c=relaxed/simple;
	bh=i+AQDrDMB1sEhgw1FbwPkX1luX8qbLx0F0F1/IVlIJI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GG+oLls1kl+xNXBe0BcQiGloI0Z4/Ia/PlHrQ+y9htDNxxO49C7RWy+bXSHd+P54RSoYxLXDHt3F+6XdAAKEM0PgftXxakXHTYnNT9MuCJYvBGgYvFN/D20xYVUpuLYMmoR/eKqpgGmeCoW/MTuFvdVjX8XgI2hwUzF9Wrz5fcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F17D1756;
	Tue, 25 Mar 2025 06:40:04 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3C083F63F;
	Tue, 25 Mar 2025 06:39:57 -0700 (PDT)
Date: Tue, 25 Mar 2025 13:39:53 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: <eng.fan@nxp.com>, <jh80.chung@samsung.com>, <trini@konsulko.com>,
 <u-boot@lists.denx.de>, <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH] sunxi: mmc: Improve reset procedure
Message-ID: <20250325133953.1dab37c8@donnerap.manchester.arm.com>
In-Reply-To: <20250325011641.19b7d7e1@minigeek.lan>
References: <20250309061241.62170-1-jernej.skrabec@gmail.com>
	<20250325011641.19b7d7e1@minigeek.lan>
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

On Tue, 25 Mar 2025 01:16:41 +0000
Andre Przywara <andre.przywara@arm.com> wrote:

Hi,

the U-Boot CI just told me off:

....

> On Sun,  9 Mar 2025 07:12:41 +0100
> Jernej Skrabec <jernej.skrabec@gmail.com> wrote:
> 
> Hi Jernej,
> 
> many thanks for your investigation and this fix here! Not having
> working eMMC access was a major annoyance for those TV boxes, and this
> indeed seems to be fixed now, judging by my experiments. Also checked
> boot partition access, works fine (though data partitions seem to take
> precedence on most devices).
> 
> > Cards should always be reset and threshold set. This fixes eMMC on H616.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>  
> 
> Acked-by: Andre Przywara <andre.przywara@arm.com>
> 
> Cheers,
> Andre
> 
> > ---
> >  drivers/mmc/sunxi_mmc.c | 28 ++++++++++++++++++++++------
> >  drivers/mmc/sunxi_mmc.h | 15 +++++++++++++--
> >  2 files changed, 35 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/mmc/sunxi_mmc.c b/drivers/mmc/sunxi_mmc.c
> > index 0b56d1405bee..335def4b9738 100644
> > --- a/drivers/mmc/sunxi_mmc.c
> > +++ b/drivers/mmc/sunxi_mmc.c
> > @@ -442,6 +442,26 @@ out:
> >  	return error;
> >  }
> >  
> > +static void sunxi_mmc_reset(struct sunxi_mmc *regs)
> > +{
> > +	/* Reset controller */
> > +	writel(SUNXI_MMC_GCTRL_RESET, &regs->gctrl);
> > +	udelay(1000);
> > +
> > +	if (IS_ENABLED(CONFIG_SUN50I_GEN_H6) || IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2)) {
> > +		/* Reset card */
> > +		writel(SUNXI_MMC_HWRST_ASSERT, &regs->hwrst);
> > +		udelay(10);
> > +		writel(SUNXI_MMC_HWRST_DEASSERT, &regs->hwrst);
> > +		udelay(300);
> > +
> > +		/* Setup FIFO R/W threshold. Needed on H616. */
> > +		writel(SUNXI_MMC_THLDC_READ_THLD(512) |
> > +		       SUNXI_MMC_THLDC_WRITE_EN |
> > +		       SUNXI_MMC_THLDC_READ_EN, &regs->thldc);
> > +	}
> > +}
> > +
> >  /* non-DM code here is used by the (ARM) SPL only */
> >  
> >  #if !CONFIG_IS_ENABLED(DM_MMC)
> > @@ -489,9 +509,7 @@ static int sunxi_mmc_core_init(struct mmc *mmc)
> >  {
> >  	struct sunxi_mmc_priv *priv = mmc->priv;
> >  
> > -	/* Reset controller */
> > -	writel(SUNXI_MMC_GCTRL_RESET, &priv->reg->gctrl);
> > -	udelay(1000);
> > +	sunxi_mmc_reset(priv->reg);
> >  
> >  	return 0;
> >  }
> > @@ -684,9 +702,7 @@ static int sunxi_mmc_probe(struct udevice *dev)
> >  
> >  	upriv->mmc = &plat->mmc;
> >  
> > -	/* Reset controller */
> > -	writel(SUNXI_MMC_GCTRL_RESET, &priv->reg->gctrl);
> > -	udelay(1000);
> > +	sunxi_mmc_reset(priv->reg);
> >  
> >  	return 0;
> >  }
> > diff --git a/drivers/mmc/sunxi_mmc.h b/drivers/mmc/sunxi_mmc.h
> > index f4ae5a790c87..9d55904c213c 100644
> > --- a/drivers/mmc/sunxi_mmc.h
> > +++ b/drivers/mmc/sunxi_mmc.h
> > @@ -37,7 +37,9 @@ struct sunxi_mmc {
> >  	u32 res0;		/* 0x54 reserved */
> >  	u32 a12a;		/* 0x58 Auto command 12 argument */
> >  	u32 ntsr;		/* 0x5c	New timing set register */
> > -	u32 res1[8];
> > +	u32 res1[6];
> > +	u32 hwrst;		/* 0x78 Hardware Reset */
> > +	u32 res5;
> >  	u32 dmac;		/* 0x80 internal DMA control */
> >  	u32 dlba;		/* 0x84 internal DMA descr list base address */
> >  	u32 idst;		/* 0x88 internal DMA status */
> > @@ -46,7 +48,8 @@ struct sunxi_mmc {
> >  	u32 cbda;		/* 0x94 */
> >  	u32 res2[26];
> >  #if defined(CONFIG_SUNXI_GEN_SUN6I) || defined(CONFIG_SUN50I_GEN_H6) || defined(CONFIG_SUNXI_GEN_NCAT2)
> > -	u32 res3[17];
> > +	u32 thldc;		/* 0x100 Threshold control */

That being in an #ifdef triggers a build failure for older SoCs (A10), as
reported by the CI. You did the right thing by using IS_ENABLED() above,
but this means the thldc member name is still visible to the compiler in
the .c file. Another reason for not describing register frames in a struct
;-)

There are like 18 registers used, so rewriting that is a bit of churn. Not
sure we want to do that now, or just #define SUNXI_MMC_THLDC_OFFSET and use
that in the .c file, as an interim measure? Because I would really like to
take this patch rather sooner than later.

Cheers,
Andre

> > +	u32 res3[16];
> >  	u32 samp_dl;
> >  	u32 res4[46];
> >  #endif
> > @@ -123,6 +126,9 @@ struct sunxi_mmc {
> >  
> >  #define SUNXI_MMC_NTSR_MODE_SEL_NEW		(0x1 << 31)
> >  
> > +#define SUNXI_MMC_HWRST_ASSERT		(0x0 << 0)
> > +#define SUNXI_MMC_HWRST_DEASSERT	(0x1 << 0)
> > +
> >  #define SUNXI_MMC_IDMAC_RESET		(0x1 << 0)
> >  #define SUNXI_MMC_IDMAC_FIXBURST	(0x1 << 1)
> >  #define SUNXI_MMC_IDMAC_ENABLE		(0x1 << 7)
> > @@ -133,6 +139,11 @@ struct sunxi_mmc {
> >  #define SUNXI_MMC_COMMON_CLK_GATE		(1 << 16)
> >  #define SUNXI_MMC_COMMON_RESET			(1 << 18)
> >  
> > +#define SUNXI_MMC_THLDC_READ_EN		(0x1 << 0)
> > +#define SUNXI_MMC_THLDC_BSY_CLR_INT_EN	(0x1 << 1)
> > +#define SUNXI_MMC_THLDC_WRITE_EN	(0x1 << 2)
> > +#define SUNXI_MMC_THLDC_READ_THLD(x)	(((x) & 0xfff) << 16)
> > +
> >  #define SUNXI_MMC_CAL_DL_SW_EN		(0x1 << 7)
> >  
> >  #endif /* _SUNXI_MMC_H */  
> 
> 

