Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40CD27702D
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Oct 2025 20:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761165259; cv=none; b=UqaKS6dEIkg6K6gCwDE6Cm6l125L47XNLaldMTJniLKJ3PJ6xVqF7KU76/0ZcUqCX0FJIaiRwJlhcLOQQcugPoTJ/kUTkU6SfzvDVpAlRoOScT2eWL5qU7mtHtw2j95iP5YpE9RuzbAOAcddR0D/HmSYRmVKExXubPXbtpKDsc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761165259; c=relaxed/simple;
	bh=ZR9S9h5qBj4Q0x4frgo2DbK5WXKAGsOqnz0kgLbsxFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=re4OhoL7t0AQdAoF82md9rhyiL6EPFG26012vso9cuDuLyBQr2YmmIygvgcnXl0C/+YfzWcJqxDIYZUco0aiT8sVjtEKvSZXLfU68RbzubP9Peu3BiAGyFtEuxuyClHmJSKlyWy9CVxLNNWBoDWgavPJg1uypHXfh/i6Y1PeO5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C8891655;
	Wed, 22 Oct 2025 13:34:09 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F93C3F66E;
	Wed, 22 Oct 2025 13:34:16 -0700 (PDT)
Date: Wed, 22 Oct 2025 21:33:39 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: u-boot@lists.denx.de, Rudi Horn <dyn-git@rudi-horn.de>,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] sunxi: dram: detect non-power-of-2 sized DRAM chips
Message-ID: <20251022213339.2b9cb140@minigeek.lan>
In-Reply-To: <12763423.O9o76ZdvQC@jernej-laptop>
References: <20251021235334.7557-1-andre.przywara@arm.com>
	<12763423.O9o76ZdvQC@jernej-laptop>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 22 Oct 2025 17:48:27 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

> Dne sreda, 22. oktober 2025 ob 01:53:34 Srednjeevropski poletni =C4=8Das =
je Andre Przywara napisal(a):
> > Some boards feature an "odd" DRAM size, where the total RAM is 1.5GB or
> > 3GB. Our existing DRAM size detection routines can only detect power-of=
-2
> > sized configuration, and on those boards the DRAM size is overestimated,
> > so this typically breaks the boot quite early.
> >=20
> > There doesn't seem to be an easy explicit way to detect those odd-sized
> > chips, but we can test whether the later part of the memory behaves like
> > memory, by verifying that a written pattern can be read back.
> > Experiments show that there is no aliasing effect here, as all locations
> > in the unimplemented range always return some fixed pattern, and cannot
> > be changed.
> >=20
> > Also so far all those boards use a factor of 3 of some lower power-of-2
> > number, or 3/4th of some higher number. The size detection routine
> > discovers the higher number, so we can check for some memory cells beyo=
nd
> > 75% of the detected size to be legit.
> >=20
> > Add a routine the inverts all bits at a given location in memory, and
> > reads that back to prove that the new value was stored.
> > Then test the memory cell at exactly 3/4th of the detected size, and cap
> > the size of the memory to 75% when this test fails.
> >=20
> > This enables boards which ship with such odd memory sizes.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> > Hi,
> >=20
> > I don't really have a board with such an odd size to test that, though =
the
> > function worked on a 12GB A733 board. But that's not supporting the SPL
> > or any kind of DRAM init yet, so was tested out of context.
> > I would be grateful if anyone with a 1.5GB or 3GB board could test this.
> >=20
> > Thanks,
> > Andre
> >=20
> >  arch/arm/include/asm/arch-sunxi/dram.h |  1 +
> >  arch/arm/mach-sunxi/dram_dw_helpers.c  | 16 +++++++++++++++-
> >  arch/arm/mach-sunxi/dram_helpers.c     | 12 ++++++++++++
> >  3 files changed, 28 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm/include/asm/arch-sunxi/dram.h b/arch/arm/include/=
asm/arch-sunxi/dram.h
> > index 0eccb1e6c28..59e2e980bfa 100644
> > --- a/arch/arm/include/asm/arch-sunxi/dram.h
> > +++ b/arch/arm/include/asm/arch-sunxi/dram.h
> > @@ -45,5 +45,6 @@ unsigned long sunxi_dram_init(void);
> >  void mctl_await_completion(u32 *reg, u32 mask, u32 val);
> >  bool mctl_mem_matches(u32 offset);
> >  bool mctl_mem_matches_base(u32 offset, ulong base);
> > +bool mctl_check_memory(phys_addr_t addr);
> > =20
> >  #endif /* _SUNXI_DRAM_H */
> > diff --git a/arch/arm/mach-sunxi/dram_dw_helpers.c b/arch/arm/mach-sunx=
i/dram_dw_helpers.c
> > index 24767354935..14f6b24c30f 100644
> > --- a/arch/arm/mach-sunxi/dram_dw_helpers.c
> > +++ b/arch/arm/mach-sunxi/dram_dw_helpers.c
> > @@ -143,8 +143,22 @@ void mctl_auto_detect_dram_size(const struct dram_=
para *para,
> > =20
> >  unsigned long mctl_calc_size(const struct dram_config *config)
> >  {
> > +	unsigned long size;
> >  	u8 width =3D config->bus_full_width ? 4 : 2;
> > =20
> >  	/* 8 banks */
> > -	return (1ULL << (config->cols + config->rows + 3)) * width * config->=
ranks;
> > +	size =3D (1ULL << (config->cols + config->rows + 3)) * width *
> > +		config->ranks;
> > +
> > +	/*
> > +	 * There are boards with non-power-of-2 sized DRAM chips, like 1.5GB
> > +	 * or 3GB. They are detected as the larger power-of-2 (2GB and 4GB),
> > +	 * so test the last quarter for being able to store values.
> > +	 */
> > +	if (!mctl_check_memory(CFG_SYS_SDRAM_BASE + size / 4 * 3)) {
> > +		size =3D (size / 4) * 3;
> > +		debug("capping memory at %ld MB\n", size >> 20); =20
>=20
> As I already commented in first version of this change, wouldn't it be go=
od to
> add additional check here, just to be sure there is no misconfiguration? =
In such
> case it would be better to panic than continue with unstable system.

Mmmh, but what check would that be? I mean this is mctl_calc_size(),
which is only called once, just at the end, before we return from
sunxi_dram_init(). And it just calculates the size, there is no probing
anymore, this has been done earlier, elsewhere.
At this point we assume everything is fine and properly setup, so I
don't understand what additional check we should do here. If we cannot
read back what we have written, we are in deeper trouble anyway, but we
would have missed that before anyway here, and it would have crashed
sooner or later, so I don't see a problem.

Cheers,
Andre


>=20
> Best regards,
> Jernej
>=20
> > +	}
> > +
> > +	return size;
> >  }
> > diff --git a/arch/arm/mach-sunxi/dram_helpers.c b/arch/arm/mach-sunxi/d=
ram_helpers.c
> > index 83dbe4ca98f..376b7d14f86 100644
> > --- a/arch/arm/mach-sunxi/dram_helpers.c
> > +++ b/arch/arm/mach-sunxi/dram_helpers.c
> > @@ -62,3 +62,15 @@ bool mctl_mem_matches(u32 offset)
> >  	return mctl_mem_matches_base(offset, CFG_SYS_SDRAM_BASE);
> >  }
> >  #endif
> > +
> > +bool mctl_check_memory(phys_addr_t addr)
> > +{
> > +	uint32_t orig, val;
> > +
> > +	orig =3D readl(addr);
> > +	writel(~orig, addr);
> > +	val =3D readl(addr);
> > +	writel(orig, addr);
> > +
> > +	return ~orig =3D=3D val;
> > +}
> >  =20
>=20
>=20
>=20
>=20
>=20

