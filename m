Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F56157480
	for <linux-sunxi@lists.linux.dev>; Sun,  5 Oct 2025 06:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759644633; cv=none; b=BEHVgZPAPQcAqtigxVZ7Ko6KF/Xf04ISlebYDUzu4cKYG3B/shvc6dscXD3pP73prAZRk9ntxlKY2wYwdWvK61/xj4VfqP790DWR8JDjC4w/+lgVgs5aHPPxqNyeMZJNG+ahXKx2aCyx2CngA+KtbtIgh4lmShvC45cppGBxuIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759644633; c=relaxed/simple;
	bh=pTdPu+fOa/jy4BmpB1vuynZRSgCd0U2hMknvV/4R6E0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gBD3e8SNObURhpGtry9WXoCSdHPhdtjAkaB/IDgKWzZJz+9MV08Mge5aLaNpWkUQAkNoyOyQV6O21nPSkZvwx0YonEDVMF5tP1PBzfdR5l1q79p02UVzt0UWejeDW79nlqxmwXhmYd5SMaDFah2lAcvcR0KNIFceqc8NOyYQYRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0eIxHZO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0eIxHZO"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e42fa08e4so34990295e9.3
        for <linux-sunxi@lists.linux.dev>; Sat, 04 Oct 2025 23:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759644630; x=1760249430; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iU5hi8B2vYy6i9UW6C2MMrvER8kh7uGJmLNMLhLKjo=;
        b=V0eIxHZO/DYDuYUdZL+Zx2DLwin7CqZZUdfaBN2bGFpwyFAIzcB8XE7dHgNPhFJb8X
         IZfNp86RCAowwDvJRuzVWvzZazh6227VsamJRlYWVmzpW/rChlv7lK4uQ2t1aSLnG+Lp
         eMhW47O+q1Ssja3/ZwO5E6CXr+yAtV+i8ursVgXdSsdFg+DZhcIsYzb1mX/Obc1PXJOn
         9VT/8nNJ845m65a88DK8p6kWRQLw6YTix7u3PWsk9OF23sFokF6jMSfZzMZTrgde6Ok5
         3gdNepNr2/xswNqp+ViG8HDpP/rNcxepOTxw0xV6uvjUlB9bxVy3DP1ciZwDGffEXOAF
         wzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759644630; x=1760249430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iU5hi8B2vYy6i9UW6C2MMrvER8kh7uGJmLNMLhLKjo=;
        b=pBigzxMUVxPR9Uw1p5yBBSdkrPBnt2me5OM8MXzgGOzpHc1gTxB74vsJdXI94TqJ9o
         DaUZ5kyU1aqIiNdeRAHWN0nLkmegaAdJ2/J3k/RJtKU1DfMZU/+G1+nYDnL4CEPncepk
         aHF7G4I0AigELpI1JRhULIdpi+8iIT7UppgaFcvCVUm/Rw1LMYrrJ/MNn8zJ+JmijPSi
         pWHdU+83qamhHwSYIeLUGgo7nL/TzeignTN1Z8bL1sU2QM8II/mdfMR+MbAwZVvVt/0w
         5isT0PyeuuT/0CTfuDKkPJvagfi1P+T7DYWnuEYSzy+dvVmuWkOtZzxVYaB+OEn1jYvk
         bDBA==
X-Forwarded-Encrypted: i=1; AJvYcCX4wC7972Z1EAv3pG0+EDfUhKhZ7LFP2+kYtQbXDizOdBRj3sJ9nWAqT3h4d6W/6CYnUYhwoDuuTgXBRA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0yitpRrcnidivetPq/pyRR2C3waKTXi/6XFytyztap9F9JffN
	KxBnqTGCmlwrHFcGW13Lea6ctOUppQIfZgVqdF2rBlJNwKVhXqyyWwQO
X-Gm-Gg: ASbGncuBGhQu7kZIzRQR6s6Ndl2sQSyIFaqeuMPp9yrvGL3s6AukzD0YHBxboNVxpV4
	xcfyvIlQzdMe56QxnUxLpTFS+X6ckal9f5aSTOYjBcc7aTidH0lIelB05HbLznadClxuiZ1AJXe
	RKGGYdKYfklO8iMggwRrOrJa/k8O3MxjOpZcR6PsOmWjZTLCC1t0StB3p+FGc/z+R4N7sPBxNdd
	B7HEB+t8FR8FeEHgG3+niPpZ4EOhauX3fyC5QGp24hbieJ41r9ByHY3sRm9K9jvPLrAt5x6v17P
	rrWTKPV0m2V7N88/iqzimFBVgYD7+tqBZzSpsCEGTe9bBFEZno1rXWfztU5y3a9917pVESn3mBX
	25mnL4xsNzQkccq4vIRK25hGg5vRkl2atONibVXPo20wKQcgh8itA6iEDP3lXx2UGeBdBNn3wi0
	OVxD8fp9iVRCwtlyQ9z9NsJjKDvgtMqAkljBsI6A==
X-Google-Smtp-Source: AGHT+IGWUu8hU+Rcq2vNIi0zR0PJApMAiGtqPuPxuiLkced2X27k/Ol5xl9uYXNerlZmR4xCQvjAGQ==
X-Received: by 2002:a05:600c:3b08:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-46e71101a79mr61565505e9.6.1759644629621;
        Sat, 04 Oct 2025 23:10:29 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e6b23d4c5sm141813355e9.17.2025.10.04.23.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 23:10:29 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rudi Horn <dyn-git@rudi-horn.de>, Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, linux-sunxi <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH] Fix detection of odd memory configurations on sunxi
Date: Sun, 05 Oct 2025 08:10:27 +0200
Message-ID: <13857032.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20251005014021.4b1b035a@minigeek.lan>
References:
 <56f44755-fca8-4364-905e-685e79fd1aea@rudi-horn.de>
 <20251005014021.4b1b035a@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Andre!

Dne nedelja, 5. oktober 2025 ob 02:40:21 Srednjeevropski poletni =C4=8Das j=
e Andre Przywara napisal(a):
> On Mon, 11 Aug 2025 09:35:19 +0200
> Rudi Horn <dyn-git@rudi-horn.de> wrote:
>=20
> Hi Rudi,
>=20
> thanks for sending a patch to address this long-standing issue!
>=20
> But ... ;-)
>=20
> > I encountered a bug where u-boot detects that my OrangePI zero 3 (with=
=20
> > 1.5GB) has 2GB and crashes.
>=20
> As Jernej already said, this is a known limitation: we simply don't
> support not-power-of-2 DRAM sizes at the moment.
>=20
> > The orangepi u-boot source code contains an additional
> > modification in the `mctl_calc_size` which removes a quarter of the=20
> > memory the
> > calculated last address cannot be written to:
> >=20
> > https://github.com/orangepi-xunlong/u-boot-orangepi/blob/v2024.01/arch/=
arm/mach-sunxi/dram_sun50i_h616.c#L1365-L1368
> >=20
> > I'm not entirely sure if there is some specific logic that applies to t=
his
> > modifier, but it does fix the issue on my system.
>=20
> So can someone shed some light on how this is supposed to work? If I
> understand the code correctly, it checks for *aliasing* between the
> first and the last word of DRAM, which doesn't make much sense to me: I
> would expect a simple write/verify to see if the last quarter of DRAM
> is for real, or to check for a known aliasing pattern with this "odd"
> setup (as in: last quarter is aliased to first or third quarter or
> something), but checking those two words for aliasing seems wrong.

Hm... I've never tested this patch on HW, so you might have a point. Still,
I think testing for aliasing makes sense. Just writing and reading might
not be enough due to possible caching (not necessarily in CPU).

I should have some board with non-power-of-2 RAM size somewhere. I'll try
to find it and test this.

>=20
> And indeed the code also fires on a board with 512MB and 4GB, capping
> the memory there as well (resulting in 384 MB and 3GB, respectively).
> This is somewhat expected, as we never would expect aliasing between
> those two particular words, I'd say.
>=20
> So since I don't have a board with an "uneven" DRAM size, can you
> please test some ideas to detect this RAM setup?
> - Read the content of the first word to not exist (@1.5GB), then write
>   something else there, and see if you can read this back? Don't forget
>   a write barrier (dsb();) when doing so.
> - Write some test pattern to some known good DRAM locations, like the
>   beginning of DRAM, @512MB, @1GB, and see if any of those values pop
>   up @1.5GB, to see if there is an aliasing pattern?
> - Can you post the exact label on that DRAM chip, so that we can see if
>   we find a datasheet? I'd be curious about the actual organisation of
>   the DRAM array.
>=20
> Jernej, do you happen to know how those DRAM chips are organised? Do
> they just feature a non-power-of-2 number of rows or columns?

I don't know details how such chips are organized internally. However,
number of rows and columns was never power-of-2.

Btw, I think I saw 3 GB DRAM boards too somewhere, but not sure where.
Quick search confirms that 24 Gb DRAM chips also exists, so I would leave
this check as general 3/4 size fixup, not limited to any capacity.

>=20
> Oh, and also this patch was heavily malformed - line breaks and spaces
> instead of tabs. Please try to fix this. Simplest is probably "git
> format-patch", then sending this via "git send-email". Your email
> server seems to be postfix, so you could just give the SMTP details and
> credentials to git.
>=20
> Cheers,
> Andre
>=20
>=20
> >=20
> > I propose the following patch, but am open to any further suggestions.
> >=20
> > Thanks,
> > Rudi Horn
> >=20
> > Note: Submitted in my personal capacity and is not affiliated with my=20
> > employer.
> >=20
> >=20
> >  From 2199f3b28e5fc853ed1921586358c33f3f1502d3 Mon Sep 17 00:00:00 2001
> > From: Rudi Horn <dyn-git@rudi-horn.de>
> > Date: Mon, 11 Aug 2025 08:58:34 +0200
> > Subject: [PATCH] arch: arm: mach-sonxi: Fix detection of odd memory
> >   configurations
> >=20
> > Fix detection of odd memory configurations. Previously 1.5GB devices we=
re
> > incorrectly detected as 2GB devices, causing u-boot to crash.
> >=20
> > Signed-off-by: Rudi Horn <dyn-git@rudi-horn.de>
> > ---
> >   arch/arm/include/asm/arch-sunxi/dram.h |  1 +
> >   arch/arm/mach-sunxi/dram_dw_helpers.c  | 10 +++++++++-
> >   arch/arm/mach-sunxi/dram_helpers.c     |  8 ++++++++
> >   3 files changed, 18 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm/include/asm/arch-sunxi/dram.h=20
> > b/arch/arm/include/asm/arch-sunxi/dram.h
> > index 0eccb1e6c28..7580421ca77 100644
> > --- a/arch/arm/include/asm/arch-sunxi/dram.h
> > +++ b/arch/arm/include/asm/arch-sunxi/dram.h
> > @@ -44,6 +44,7 @@
> >   unsigned long sunxi_dram_init(void);
> >   void mctl_await_completion(u32 *reg, u32 mask, u32 val);
> >   bool mctl_mem_matches(u32 offset);
> > +bool mctl_mem_matches_upto(u32 offset);
> >   bool mctl_mem_matches_base(u32 offset, ulong base);
> >=20
> >   #endif /* _SUNXI_DRAM_H */
> > diff --git a/arch/arm/mach-sunxi/dram_dw_helpers.c=20
> > b/arch/arm/mach-sunxi/dram_dw_helpers.c
> > index 24767354935..5bcd2672465 100644
> > --- a/arch/arm/mach-sunxi/dram_dw_helpers.c
> > +++ b/arch/arm/mach-sunxi/dram_dw_helpers.c
> > @@ -146,5 +146,13 @@ unsigned long mctl_calc_size(const struct=20
> > dram_config *config)
> >          u8 width =3D config->bus_full_width ? 4 : 2;
> >=20
> >          /* 8 banks */
> > -       return (1ULL << (config->cols + config->rows + 3)) * width *=20
> > config->ranks;
> > +       unsigned long size =3D (1ULL << (config->cols + config->rows + =
3))=20
> > * width * config->ranks;
> > +
> > +       /* some memory configurations such as 1.5GB rely on this to=20
> > compute the correct size */
> > +       if (!mctl_mem_matches_upto(size)) {
> > +               size =3D (size * 3) / 4;
> > +               debug("capping memory at 0x%lx\n", size);
> > +       }
> > +
> > +  return size;
> >   }
> > diff --git a/arch/arm/mach-sunxi/dram_helpers.c=20
> > b/arch/arm/mach-sunxi/dram_helpers.c
> > index 83dbe4ca98f..68c75fa07a6 100644
> > --- a/arch/arm/mach-sunxi/dram_helpers.c
> > +++ b/arch/arm/mach-sunxi/dram_helpers.c
> > @@ -61,4 +61,12 @@ bool mctl_mem_matches(u32 offset)
> >   {
> >          return mctl_mem_matches_base(offset, CFG_SYS_SDRAM_BASE);
> >   }
> > +
> > +/*
> > + * Test if memory at offset matches memory at end of DRAM
> > + */
> > +bool mctl_mem_matches_upto(u32 offset)
> > +{
> > +       return mctl_mem_matches_base(offset - sizeof(u32),=20
> > CFG_SYS_SDRAM_BASE);
> > +}
> >   #endif
> > --
> > 2.43.0
> >=20
>=20
>=20




