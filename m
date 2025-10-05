Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017D7288C2A
	for <linux-sunxi@lists.linux.dev>; Sun,  5 Oct 2025 16:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759681019; cv=none; b=lk9gRpobrdh03RU5dyMpTNVgoxrcuuanODYVUzDg+ZxbAxrJiJD+Yfp55c/SAvOGiCErX5AA839vkDAKU2vJVr1dZ3zA23FRAw9X5KI/c8/J1WIWUz83aqNV2OzNMI+ZjLEhny28KlVA5LN4EvX7DpSTPdGMHQlbW+c2Ss4cq5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759681019; c=relaxed/simple;
	bh=7ujCWKKGI4szmQbONj4wjAVf3f6RMEhyJkxuM/6qbQY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YfBPr19FjgDzQOcVwc3IXoJ8KfG6sM4hcc1o9WEruU+1GKvj0IFQUD49WJPLcdOgZYQyVcEh5RAjs47sdhtz521OvaUsJ/7HUs8/IhGg4jwHquNe47g/wCFVvOk2LHwoKfiqhjiQWP4FaHMHSJ5qrDmDFRO2i8Lx3Ab+LwYI7dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00BFF1C14;
	Sun,  5 Oct 2025 09:16:47 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 518BD3F59E;
	Sun,  5 Oct 2025 09:16:54 -0700 (PDT)
Date: Sun, 5 Oct 2025 17:16:35 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Rudi Horn <dyn-git@rudi-horn.de>, u-boot@lists.denx.de, linux-sunxi
 <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH] Fix detection of odd memory configurations on sunxi
Message-ID: <20251005171635.1374da9d@minigeek.lan>
In-Reply-To: <13857032.uLZWGnKmhe@jernej-laptop>
References: <56f44755-fca8-4364-905e-685e79fd1aea@rudi-horn.de>
	<20251005014021.4b1b035a@minigeek.lan>
	<13857032.uLZWGnKmhe@jernej-laptop>
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

On Sun, 05 Oct 2025 08:10:27 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

> Dne nedelja, 5. oktober 2025 ob 02:40:21 Srednjeevropski poletni =C4=8Das=
 je Andre Przywara napisal(a):
> > On Mon, 11 Aug 2025 09:35:19 +0200
> > Rudi Horn <dyn-git@rudi-horn.de> wrote:
> >=20
> > Hi Rudi,
> >=20
> > thanks for sending a patch to address this long-standing issue!
> >=20
> > But ... ;-)
> >  =20
> > > I encountered a bug where u-boot detects that my OrangePI zero 3 (wit=
h=20
> > > 1.5GB) has 2GB and crashes. =20
> >=20
> > As Jernej already said, this is a known limitation: we simply don't
> > support not-power-of-2 DRAM sizes at the moment.
> >  =20
> > > The orangepi u-boot source code contains an additional
> > > modification in the `mctl_calc_size` which removes a quarter of the=20
> > > memory the
> > > calculated last address cannot be written to:
> > >=20
> > > https://github.com/orangepi-xunlong/u-boot-orangepi/blob/v2024.01/arc=
h/arm/mach-sunxi/dram_sun50i_h616.c#L1365-L1368
> > >=20
> > > I'm not entirely sure if there is some specific logic that applies to=
 this
> > > modifier, but it does fix the issue on my system. =20
> >=20
> > So can someone shed some light on how this is supposed to work? If I
> > understand the code correctly, it checks for *aliasing* between the
> > first and the last word of DRAM, which doesn't make much sense to me: I
> > would expect a simple write/verify to see if the last quarter of DRAM
> > is for real, or to check for a known aliasing pattern with this "odd"
> > setup (as in: last quarter is aliased to first or third quarter or
> > something), but checking those two words for aliasing seems wrong. =20
>=20
> Hm... I've never tested this patch on HW, so you might have a point. Stil=
l,
> I think testing for aliasing makes sense. Just writing and reading might
> not be enough due to possible caching (not necessarily in CPU).

Sure, aliasing trumps verifying, but it might be easier to test the
latter?

> I should have some board with non-power-of-2 RAM size somewhere. I'll try
> to find it and test this.

I just realised that my Cubie A7A has 12GB(!) of DRAM, so I can actually do
some experiments here, in U-Boot proper, after boot0 has initialised the DR=
AM:
[5912]DRAM SIZE =3D12288 MBytes, para1 =3D a11a, para2 =3D 30001001, dram_t=
pr13 =3D 10065

> > And indeed the code also fires on a board with 512MB and 4GB, capping
> > the memory there as well (resulting in 384 MB and 3GB, respectively).
> > This is somewhat expected, as we never would expect aliasing between
> > those two particular words, I'd say.
> >=20
> > So since I don't have a board with an "uneven" DRAM size, can you
> > please test some ideas to detect this RAM setup?
> > - Read the content of the first word to not exist (@1.5GB), then write
> >   something else there, and see if you can read this back? Don't forget
> >   a write barrier (dsb();) when doing so.
> > - Write some test pattern to some known good DRAM locations, like the
> >   beginning of DRAM, @512MB, @1GB, and see if any of those values pop
> >   up @1.5GB, to see if there is an aliasing pattern?
> > - Can you post the exact label on that DRAM chip, so that we can see if
> >   we find a datasheet? I'd be curious about the actual organisation of
> >   the DRAM array.
> >=20
> > Jernej, do you happen to know how those DRAM chips are organised? Do
> > they just feature a non-power-of-2 number of rows or columns? =20
>=20
> I don't know details how such chips are organized internally. However,
> number of rows and columns was never power-of-2.

Ah right, brain fart on my end, those are of course the exponents in the
calculation, so result in the eventual power-of-2 number. I then wonder
where the factor of 3 comes in, are there 6 banks, or 3 ranks (doubt
that)? I could not find a datasheet of one of those 12Gbit Samsung
chips yet.

> Btw, I think I saw 3 GB DRAM boards too somewhere, but not sure where.
> Quick search confirms that 24 Gb DRAM chips also exists, so I would leave
> this check as general 3/4 size fixup, not limited to any capacity.

Oh, definitely, the only constant here would be the 3/4th. So the plan
would be to detect some oddity (either through aliasing or because of
missing DRAM cells at the end), then assume it's 3/4 of the detected
capacity.

Cheers,
Andre

>=20
> >=20
> > Oh, and also this patch was heavily malformed - line breaks and spaces
> > instead of tabs. Please try to fix this. Simplest is probably "git
> > format-patch", then sending this via "git send-email". Your email
> > server seems to be postfix, so you could just give the SMTP details and
> > credentials to git.
> >=20
> > Cheers,
> > Andre
> >=20
> >  =20
> > >=20
> > > I propose the following patch, but am open to any further suggestions.
> > >=20
> > > Thanks,
> > > Rudi Horn
> > >=20
> > > Note: Submitted in my personal capacity and is not affiliated with my=
=20
> > > employer.
> > >=20
> > >=20
> > >  From 2199f3b28e5fc853ed1921586358c33f3f1502d3 Mon Sep 17 00:00:00 20=
01
> > > From: Rudi Horn <dyn-git@rudi-horn.de>
> > > Date: Mon, 11 Aug 2025 08:58:34 +0200
> > > Subject: [PATCH] arch: arm: mach-sonxi: Fix detection of odd memory
> > >   configurations
> > >=20
> > > Fix detection of odd memory configurations. Previously 1.5GB devices =
were
> > > incorrectly detected as 2GB devices, causing u-boot to crash.
> > >=20
> > > Signed-off-by: Rudi Horn <dyn-git@rudi-horn.de>
> > > ---
> > >   arch/arm/include/asm/arch-sunxi/dram.h |  1 +
> > >   arch/arm/mach-sunxi/dram_dw_helpers.c  | 10 +++++++++-
> > >   arch/arm/mach-sunxi/dram_helpers.c     |  8 ++++++++
> > >   3 files changed, 18 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/arm/include/asm/arch-sunxi/dram.h=20
> > > b/arch/arm/include/asm/arch-sunxi/dram.h
> > > index 0eccb1e6c28..7580421ca77 100644
> > > --- a/arch/arm/include/asm/arch-sunxi/dram.h
> > > +++ b/arch/arm/include/asm/arch-sunxi/dram.h
> > > @@ -44,6 +44,7 @@
> > >   unsigned long sunxi_dram_init(void);
> > >   void mctl_await_completion(u32 *reg, u32 mask, u32 val);
> > >   bool mctl_mem_matches(u32 offset);
> > > +bool mctl_mem_matches_upto(u32 offset);
> > >   bool mctl_mem_matches_base(u32 offset, ulong base);
> > >=20
> > >   #endif /* _SUNXI_DRAM_H */
> > > diff --git a/arch/arm/mach-sunxi/dram_dw_helpers.c=20
> > > b/arch/arm/mach-sunxi/dram_dw_helpers.c
> > > index 24767354935..5bcd2672465 100644
> > > --- a/arch/arm/mach-sunxi/dram_dw_helpers.c
> > > +++ b/arch/arm/mach-sunxi/dram_dw_helpers.c
> > > @@ -146,5 +146,13 @@ unsigned long mctl_calc_size(const struct=20
> > > dram_config *config)
> > >          u8 width =3D config->bus_full_width ? 4 : 2;
> > >=20
> > >          /* 8 banks */
> > > -       return (1ULL << (config->cols + config->rows + 3)) * width *=
=20
> > > config->ranks;
> > > +       unsigned long size =3D (1ULL << (config->cols + config->rows =
+ 3))=20
> > > * width * config->ranks;
> > > +
> > > +       /* some memory configurations such as 1.5GB rely on this to=20
> > > compute the correct size */
> > > +       if (!mctl_mem_matches_upto(size)) {
> > > +               size =3D (size * 3) / 4;
> > > +               debug("capping memory at 0x%lx\n", size);
> > > +       }
> > > +
> > > +  return size;
> > >   }
> > > diff --git a/arch/arm/mach-sunxi/dram_helpers.c=20
> > > b/arch/arm/mach-sunxi/dram_helpers.c
> > > index 83dbe4ca98f..68c75fa07a6 100644
> > > --- a/arch/arm/mach-sunxi/dram_helpers.c
> > > +++ b/arch/arm/mach-sunxi/dram_helpers.c
> > > @@ -61,4 +61,12 @@ bool mctl_mem_matches(u32 offset)
> > >   {
> > >          return mctl_mem_matches_base(offset, CFG_SYS_SDRAM_BASE);
> > >   }
> > > +
> > > +/*
> > > + * Test if memory at offset matches memory at end of DRAM
> > > + */
> > > +bool mctl_mem_matches_upto(u32 offset)
> > > +{
> > > +       return mctl_mem_matches_base(offset - sizeof(u32),=20
> > > CFG_SYS_SDRAM_BASE);
> > > +}
> > >   #endif
> > > --
> > > 2.43.0
> > >  =20
> >=20
> >  =20
>=20
>=20
>=20
>=20
>=20

