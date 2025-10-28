Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C667F345CDE
	for <linux-sunxi@lists.linux.dev>; Tue, 28 Oct 2025 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761668065; cv=none; b=QuOlIq2O8XH3DE7WJVqpUMB77DsVmeGYB0Lz9vWmVRK2jjolKJraAH4qRZqEIB+2DPyHS8uVuhvVy6bnWizKo9PQajZ8xDlkayo4W7CKqprbPEIXrSUlyX912kiCZDEm/KFZEq4G0iV3ALLbv6+X5RHec6VWtXLG2+U9vpYSIhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761668065; c=relaxed/simple;
	bh=ZUd3F24Aep/+7cTFQ97wf/UBkrskt0cFfzmp0C2FBPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBeB6FaU7bZrBy38xj37tNjpyRZ2HtxyofYGj71n2LT7Ug5dnzMYU5DvP8o6foFxeLdl/iM6nRglDf15dwWN4WMkYWe9ie2Q90C3zaflzra5ynuRR3+v+oh53pvAw/JHb7BkEreSyFtAUQ+IFVSWDcoiuDlEkPkVcSfYm0vg/eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jookia.org; spf=pass smtp.mailfrom=jookia.org; dkim=pass (2048-bit key) header.d=jookia.org header.i=@jookia.org header.b=lNuap1qS; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jookia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jookia.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jookia.org header.i=@jookia.org header.b="lNuap1qS"
Date: Wed, 29 Oct 2025 03:11:48 +1100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1761668057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NuCR3lo6Nd/kjORbeNKQIwXUm0LJEtYEUOanCS5SH30=;
	b=lNuap1qSEeWae72yNxZtwWeE+k/V8bUoYRUigq3QsRdJRj8rHFcxiIRbzkqwgnm13nT6qC
	/4YdgscdPwT1hp9ac0uc+hGsl9g4v8MVMmATo5CmBGACfNWhWnV376MV2uClGA+t9NTK+e
	+blJPLFXb9iJpb6l8w1dw4ObVnRarAffjlz8JWf2674eHlo5LyJGCPM3VSJvKIWCmbdKn6
	FysAuPL8rBARX6ID42Tr1p9BoZ9uFQNVJKHH+chj7ofmuHSFPZUFCI2/m4LQC+GCf7Mr3W
	TubUmiUHeAw2/msPBl3/rgDJnL6ZN4nyzsa9G7t8tOqjy5QyhvczWVyh/6Shjw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lukas Schmid <lukas.schmid@netcube.li>, Tom Rini <trini@konsulko.com>,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>, u-boot@lists.denx.de
Subject: Re: [PATCH v3] sunxi: extend R528/T113-s3/D1(s) DRAM initialisation
Message-ID: <aQDrRHmBntmylpoL@titan>
References: <20251026114118.3922714-1-lukas.schmid@netcube.li>
 <20251026160820.1947e762@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026160820.1947e762@minigeek.lan>
X-Migadu-Flow: FLOW_OUT

On Sun, Oct 26, 2025 at 04:08:20PM +0000, Andre Przywara wrote:
> On Sun, 26 Oct 2025 12:41:17 +0100
> Lukas Schmid <lukas.schmid@netcube.li> wrote:
> 
> Hi,
> 
> > The T113-s4 SoC is using the same die as the T113-s3, but comes with
> > 256MiB of co-packaged DRAM. Besides the doubled size, the DRAM chip
> > seems to be connected slightly differently, which requires to use a
> > different pin remapping.
> > 
> > Extend the DRAM initialisation code to add support for the T113-S4 aka
> > T113M4020DC0 by checking the SoC's CHIPID, which is stored in the first
> > word of the SID efuses.
> > 
> > Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> > Tested-by: John Watts <contact@jookia.org>
> > Reviewed-by: John Watts <contact@jookia.org>
> > Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Careful with those tags: those were given for quite a different version
> of the patch, I wouldn't carry them over, since there were quite some
> changes since then.
> 
> > ---
> > Changes in v3:
> >   - Move the Chip-ID list link to a comment in the header file
> >   - Use andre's suggested commit message
> >   - Drop out of remapping early for T113M4020DC0 instead of doing it in the
> >     switch-case
> > 
> > Changes in v2:
> >   - Use uint32_t instead of u32 for sid_read_soc_chipid return type
> >   - Add descriptive comment about source of Chip-ID list and register
> > 
> >  drivers/ram/sunxi/dram_sun20i_d1.c | 10 ++++++++++
> >  drivers/ram/sunxi/dram_sun20i_d1.h | 11 +++++++++++
> >  2 files changed, 21 insertions(+)
> > 
> > diff --git a/drivers/ram/sunxi/dram_sun20i_d1.c b/drivers/ram/sunxi/dram_sun20i_d1.c
> > index a1794032f3b..d851deac7a5 100644
> > --- a/drivers/ram/sunxi/dram_sun20i_d1.c
> > +++ b/drivers/ram/sunxi/dram_sun20i_d1.c
> > @@ -54,6 +54,11 @@ static void sid_read_ldoB_cal(const dram_para_t *para)
> >  	clrsetbits_le32(0x3000150, 0xff00, reg << 8);
> >  }
> >  
> > +static uint32_t sid_read_soc_chipid(void)
> > +{
> > +	return readl(SUNXI_SID_BASE + 0x00) & 0xffff;
> > +}
> > +
> >  static void dram_voltage_set(const dram_para_t *para)
> >  {
> >  	int vol;
> > @@ -663,6 +668,11 @@ static void mctl_phy_ac_remapping(const dram_para_t *para,
> >  
> >  	fuse = (readl(SUNXI_SID_BASE + 0x28) & 0xf00) >> 8;
> >  	debug("DDR efuse: 0x%x\n", fuse);
> > +	debug("SoC Chip ID: 0x%08x\n", sid_read_soc_chipid());
> > +
> > +	if (sid_read_soc_chipid() == SUNXI_CHIPID_T113M4020DC0) {
> 
> You don't need braces for a single statement in the "if" branch (but I
> can fix this up).
> 
> Other than that this looks quite good to me now. If someone with a
> board (John?) could confirm that this works, I am happy to take it.

Tested on the same T113-S4 and T113-S3 boards as before.
Works great in both cases.

Reviewed-by: John Watts <contact@jookia.org>
Tested-by: John Watts <contact@jookia.org>

John.

> 
> Thanks,
> Andre
> 
> 
> > +		return;
> > +	}
> >  
> >  	if (para->dram_type == SUNXI_DRAM_TYPE_DDR2) {
> >  		if (fuse == 15)
> > diff --git a/drivers/ram/sunxi/dram_sun20i_d1.h b/drivers/ram/sunxi/dram_sun20i_d1.h
> > index 91383f6cf10..83ae7eb36cd 100644
> > --- a/drivers/ram/sunxi/dram_sun20i_d1.h
> > +++ b/drivers/ram/sunxi/dram_sun20i_d1.h
> > @@ -19,6 +19,17 @@ enum sunxi_dram_type {
> >  	SUNXI_DRAM_TYPE_LPDDR3 = 7,
> >  };
> >  
> > +/*
> > + * Chip-IDs taken from
> > + * https://github.com/ua1arn/hftrx/blob/25d8cb9e4cfe1d7d0e4a2f641025c88a9ec5e758/inc/clocks.h#L250
> > + */
> > +enum sunxi_soc_chipid {
> > +	SUNXI_CHIPID_F133A = 0x5C00,
> > +	SUNXI_CHIPID_D1S = 0x5E00,
> > +	SUNXI_CHIPID_T113S3 = 0x6000,
> > +	SUNXI_CHIPID_T113M4020DC0 = 0x7200,
> > +};
> > +
> >  /*
> >   * This structure contains a mixture of fixed configuration settings,
> >   * variables that are used at runtime to communicate settings between
> 
