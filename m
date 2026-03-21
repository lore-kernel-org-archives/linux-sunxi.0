Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBC32F49F1
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Mar 2026 18:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774117614; cv=none; b=MZUpB0I7fFLnDAqsMWaEa1KTOps5+jp5vmjA7rqCjuPu4uEPXO1maZKIcObwjkvn9We7laXkOzW2//5S1bUQbio2dzIqb8NGdXvLtE6zQCITCMOow2QxW0qv1wWbz/mdFB9cIj1DGiT5WV/tqREk4y2iibM9WtlpEwP5eiD8C8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774117614; c=relaxed/simple;
	bh=0VquoLxut6DoF9hdOrv/z1QR0so+DRDrZ5uHeR0aGUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBcicWGEj+8LNvWkVRYpRnP/nmRyPIWWfVRD0iq9bFdwUcxVBVuJKFFkQasUf64qbHyVXVHwnjIo2VAxohT0tL5lNwBQ2n3mSO1ut0sjGub3yf6GJxlAWRzr/LzePAXuDwvvVXlc2MWlpNzJysW58gSWY5s3Uh2OAcyilqgPGzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=hw4kM0HN; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="hw4kM0HN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1774117603; bh=0VquoLxut6DoF9hdOrv/z1QR0so+DRDrZ5uHeR0aGUg=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=hw4kM0HN/eYOLD1R99JcNJSbPTJF8XISXqnixZ++vK9ZwDzcpdHaQaxPutxrPWbvo
	 iUNr0JscCYcOkHh0d/jfFEZqwNzAQ+dPGPp0RgTrhoYQGtJ8AHsx0CzySZ3b5Xc9kq
	 e7cbp5XphEFBWuu1HPaSZEm8yd/IT787MkOHrBL4=
Date: Sat, 21 Mar 2026 19:26:43 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH] mfd: axp20x: Change volatile ranges on axp803
Message-ID: <voxgbzeunk7doe64ej3eq22kgxw7y4x7wwqsm72t546qreonmi@ypnuw5esnddo>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20260315124932.3669260-1-megi@xff.cz>
 <5084920.31r3eYUQgx@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5084920.31r3eYUQgx@jernej-laptop>

On Sat, Mar 21, 2026 at 07:25:49AM +0100, Jernej Škrabec wrote:
> Dne nedelja, 15. marec 2026 ob 13:49:31 Srednjeevropski standardni čas je Ondřej Jirman napisal(a):
> > From: Ondrej Jirman <megi@xff.cz>
> > 
> > Regulator control registers can be cached. They don't update by
> > themselves. Enable cache on them, to speed up voltage changes,
> > particularly DCDC2 which needs to be handled quickly due to being used
> > for CPUX cores and is changed very frequently by some cpufreq schedulers.
> 
> That's not really the case, DCDC2-DCDC6 registers have DVM finished status
> bit, which is volatile and it is right to have them in volatile range.
> However, it is true that other registers are non-volatile, so that range can
> be considerably shrinked. It seems that AXP288 have same register layout
> but I can't say for sure (I only found datasheet for AXP288C), so it's best
> to leave it alone and apply changes only to AXP803. 

While true, it's not used by any kernel drivers, and having the whole register
marked volatile for a single unused bit is contributing 10s of % of permanent
CPU load just from cpufreq DVFS operations alone when using schedutil governor,
which is doing DVFS hundred or more times per second.

If someone will want to use this bit in the regulator driver, they can use eg.
regmap_read_bypassed() to access the bit, while keepig the other parts of
regulator implementation performant.

But I guess it may deserve a comment in the code.

Kind regards,
	o.

> Best regards,
> Jernej
> 
> > 
> > This shrinks register access over RSB bus to one write per voltage
> > change (down from 4 or so).
> > 
> > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > ---
> >  drivers/mfd/axp20x.c | 28 +++++++++++++++++++++++++++-
> >  1 file changed, 27 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> > index 0d0d40972eb8..2ea409029d2f 100644
> > --- a/drivers/mfd/axp20x.c
> > +++ b/drivers/mfd/axp20x.c
> > @@ -172,6 +172,18 @@ static const struct regmap_range axp288_volatile_ranges[] = {
> >  	regmap_reg_range(AXP20X_FG_RES, AXP288_FG_CC_CAP_REG),
> >  };
> >  
> > +static const struct regmap_range axp803_volatile_ranges[] = {
> > +	regmap_reg_range(AXP20X_PWR_INPUT_STATUS, AXP288_POWER_REASON),
> > +	regmap_reg_range(AXP288_BC_GLOBAL, AXP288_BC_GLOBAL),
> > +	regmap_reg_range(AXP288_BC_DET_STAT, AXP20X_VBUS_IPSOUT_MGMT),
> > +	regmap_reg_range(AXP20X_CHRG_BAK_CTRL, AXP20X_CHRG_BAK_CTRL),
> > +	regmap_reg_range(AXP20X_IRQ1_EN, AXP20X_IPSOUT_V_HIGH_L),
> > +	regmap_reg_range(AXP20X_TIMER_CTRL, AXP20X_TIMER_CTRL),
> > +	regmap_reg_range(AXP20X_GPIO1_CTRL, AXP22X_GPIO_STATE),
> > +	regmap_reg_range(AXP288_RT_BATT_V_H, AXP288_RT_BATT_V_L),
> > +	regmap_reg_range(AXP20X_FG_RES, AXP288_FG_CC_CAP_REG),
> > +};
> > +
> >  static const struct regmap_access_table axp288_writeable_table = {
> >  	.yes_ranges	= axp288_writeable_ranges,
> >  	.n_yes_ranges	= ARRAY_SIZE(axp288_writeable_ranges),
> > @@ -182,6 +194,11 @@ static const struct regmap_access_table axp288_volatile_table = {
> >  	.n_yes_ranges	= ARRAY_SIZE(axp288_volatile_ranges),
> >  };
> >  
> > +static const struct regmap_access_table axp803_volatile_table = {
> > +	.yes_ranges	= axp803_volatile_ranges,
> > +	.n_yes_ranges	= ARRAY_SIZE(axp803_volatile_ranges),
> > +};
> > +
> >  static const struct regmap_range axp806_writeable_ranges[] = {
> >  	regmap_reg_range(AXP20X_DATACACHE(0), AXP20X_DATACACHE(3)),
> >  	regmap_reg_range(AXP806_PWR_OUT_CTRL1, AXP806_CLDO3_V_CTRL),
> > @@ -456,6 +473,15 @@ static const struct regmap_config axp22x_regmap_config = {
> >  	.cache_type	= REGCACHE_MAPLE,
> >  };
> >  
> > +static const struct regmap_config axp803_regmap_config = {
> > +	.reg_bits	= 8,
> > +	.val_bits	= 8,
> > +	.wr_table	= &axp288_writeable_table,
> > +	.volatile_table	= &axp803_volatile_table,
> > +	.max_register	= AXP288_FG_TUNE5,
> > +	.cache_type	= REGCACHE_MAPLE,
> > +};
> > +
> >  static const struct regmap_config axp288_regmap_config = {
> >  	.reg_bits	= 8,
> >  	.val_bits	= 8,
> > @@ -1368,7 +1394,7 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
> >  	case AXP803_ID:
> >  		axp20x->nr_cells = ARRAY_SIZE(axp803_cells);
> >  		axp20x->cells = axp803_cells;
> > -		axp20x->regmap_cfg = &axp288_regmap_config;
> > +		axp20x->regmap_cfg = &axp803_regmap_config;
> >  		axp20x->regmap_irq_chip = &axp803_regmap_irq_chip;
> >  		break;
> >  	case AXP806_ID:
> > 
> 
> 
> 
> 
