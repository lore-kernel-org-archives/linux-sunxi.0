Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B5818A956
	for <linux-sunxi@lists.linux.dev>; Sun,  5 Oct 2025 06:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759646317; cv=none; b=VKzn7GnYVMs/OOMHYgafA13sbWzhv1rzmnGLfB+ThlWZADEZmcUe+itH6lGFp+ZP87ouwuSIGqrROQz4ODyWz+ytYQYiQN2URtJ+KbGaJDFQpo20AyED5HMC/fdQVs/2qK+7nmJuCMDqG5jiYtOBwZD1nYDdyC2FHcdePA8owsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759646317; c=relaxed/simple;
	bh=8LGtkA1Fsv4KuMAbGY2gjAZt8ua9M0SWQiKLf/6kRcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qycsy+t3lcW2VlPRtRViPqCYDJrv5/uMN+YnBJeh53UKKJAw9GsvhUOe8y6WVmhLW9Dwa6paRBE0rMSXzFuNnhyFsdsDSFyHUTSxa5dQSOWlBcCx9jjOVnJdN4zp4ZzMEUEiOkFCi0vgYtIriO1kdZ7Uel4S3QRCwlFlQ9YoJJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4ht4iNq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4ht4iNq"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e430494ccso22004255e9.1
        for <linux-sunxi@lists.linux.dev>; Sat, 04 Oct 2025 23:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759646314; x=1760251114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2VZ7EfE9AUggSem9zhcRWBhzrHYADLpTsqQqot4tQ8=;
        b=D4ht4iNqsOPjaKqnaxO/iVHReHiPSQYQNWYqJX+TZUMQvtO7+/BSfzCFu/17XGkKLN
         4kVt9uq3+C6kvcdV7D78QT8IWK9q6x8wmobGBvnTi6mQfE1cHPbXuLUScx3Ml3dvkrVh
         5sFsALEOEkmd7nZWZ1Kn09ZwvQ7UjsVNDANWOFg74tvT3brGsLvxGXn+4SmuJ0nKaQoW
         iReNebSJzCjRW2Vf+uQTuAMS3A74Sely9eD1vw5I+UBufxg9a4lqZWvvtY+X7KPFnmYc
         AtzqerQQGPhS1/eDvWaKFuNS4gF6YDhoMycwWJnyP8mdhCJ/a4DZ88CNrZZwZi+mlj/d
         tPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759646314; x=1760251114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2VZ7EfE9AUggSem9zhcRWBhzrHYADLpTsqQqot4tQ8=;
        b=pJGwWUgORmUOfkA9t72SmrThhZyWVqgKjCerigC8ghpkvPJwxmb2FzxAFeUUrbKVB3
         YoToZXoBCPyj8b/M5W5Zr2e3LG3bYKg7aDDbGKQTPAkvEj+7XzM9XKlvz2A0Bi+6n40h
         9PFJGTYXFYnpyBXRKRh5Qkms0MSG8TiRwfxeRfyFNuPf+E52vAty/etSKqUsKERZKit9
         riXiVIHgq0VY13L2sl9vx0npeRl+SXbHVpNNH++ZPsgluK2K19Bxk4mUtW70FI9qnmOC
         Z/jTXig5ecAPkFsKaohbIkru31Ak2Zs+y8F6mC/xPVKraTjjOPCVunxDiE6Szr3AuIWm
         0tqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDRFydvb9gfsfXW1GVaenJbEqliHuiUc2Z2wpNMG39IQsfhQOLYh0Lf17g0bqU7T3NrAUrxfU/ol/yAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAQ46D0AtzNE+Ht2iC4HhpXExZ9fBi8NPnBIFxwPXTptnRO5Jj
	Vw2uEdXszemunN7TWVgWAmLb81cGDyl118556DqLlS7VnrB3HMMUAys6
X-Gm-Gg: ASbGnctjms3yeHWAiDa/nDTI+pbxACSrdlylTkzv6heK8mToelh9v/AryPUc7zzOyRF
	IoxiH4Rtlh6rXPkUQ2GBrRpmDapKsJdXI/PlrzR4Q6sQ0QV843BxQmd7snKYFkMb9tn1aAOKFxv
	B6lweDcMgxSKcDmksTeIt/59pQsblA+g+s17TFwbjcEcKC46H6n1fU9OH8AgarXI0aNWFcmiG5V
	2XTGVibJiP3pGSulVbkHidMgvY0qAZnRb2tfo+9ema9GABhNRiwv5fmxjqOzzZPYWcsF4U9ykFW
	bFt55TVsjv914bHT5iJ61BZgssgoF9eJgC+je49TmvTCZ3aN64Ho8+5/k+3KBI+swbz1gWROVtH
	MhJ4AzgEt+1xQUGTb1MI/JqJHMjYJRqq5EE4XcuaQZ1/5DIdFrCzL/y2wc/w8sYz7i9VK6um5gm
	0ICioY9v7sJ6TM5FbrSvz2HeDc7xa8
X-Google-Smtp-Source: AGHT+IEEepuRZbTCL1qHdTwFrRwuVSeeABI6mNBxdPlXeLjcarbbq5KCkmIjoB8PR+tnQKJHPED96w==
X-Received: by 2002:a05:600c:8409:b0:46e:5aac:54f9 with SMTP id 5b1f17b1804b1-46e7115c89fmr60446995e9.37.1759646313661;
        Sat, 04 Oct 2025 23:38:33 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ac750sm15313849f8f.24.2025.10.04.23.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 23:38:33 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rudi Horn <dyn-git@rudi-horn.de>, Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, linux-sunxi <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH] Fix detection of odd memory configurations on sunxi
Date: Sun, 05 Oct 2025 08:38:32 +0200
Message-ID: <10731113.nUPlyArG6x@jernej-laptop>
In-Reply-To: <13857032.uLZWGnKmhe@jernej-laptop>
References:
 <56f44755-fca8-4364-905e-685e79fd1aea@rudi-horn.de>
 <20251005014021.4b1b035a@minigeek.lan> <13857032.uLZWGnKmhe@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 5. oktober 2025 ob 08:10:27 Srednjeevropski poletni =C4=8Das j=
e Jernej =C5=A0krabec napisal(a):
> Hi Andre!
>=20
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
> >=20
> > > I encountered a bug where u-boot detects that my OrangePI zero 3 (wit=
h=20
> > > 1.5GB) has 2GB and crashes.
> >=20
> > As Jernej already said, this is a known limitation: we simply don't
> > support not-power-of-2 DRAM sizes at the moment.
> >=20
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
> > > modifier, but it does fix the issue on my system.
> >=20
> > So can someone shed some light on how this is supposed to work? If I
> > understand the code correctly, it checks for *aliasing* between the
> > first and the last word of DRAM, which doesn't make much sense to me: I
> > would expect a simple write/verify to see if the last quarter of DRAM
> > is for real, or to check for a known aliasing pattern with this "odd"
> > setup (as in: last quarter is aliased to first or third quarter or
> > something), but checking those two words for aliasing seems wrong.
>=20
> Hm... I've never tested this patch on HW, so you might have a point. Stil=
l,
> I think testing for aliasing makes sense. Just writing and reading might
> not be enough due to possible caching (not necessarily in CPU).

I see where the confusion comes from. Rudi tried to replicate OrangePi code
but inadvertently used function for aliasing check instead of write/verify
as noticed by Andre.

While probably using OrangePi approach [1] would work fine, I learned to
distrust simple write/verify checks, especially when size is only 1 word.
I would be still more confortable to use current aliasing check, which uses
16 words check.

Best regards,
Jernej

[1] https://github.com/orangepi-xunlong/u-boot-orangepi/blob/v2024.01/arch/=
arm/mach-sunxi/dram_helpers.c#L48-L63

>=20
> I should have some board with non-power-of-2 RAM size somewhere. I'll try
> to find it and test this.
>=20
> >=20
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
> > they just feature a non-power-of-2 number of rows or columns?
>=20
> I don't know details how such chips are organized internally. However,
> number of rows and columns was never power-of-2.
>=20
> Btw, I think I saw 3 GB DRAM boards too somewhere, but not sure where.
> Quick search confirms that 24 Gb DRAM chips also exists, so I would leave
> this check as general 3/4 size fixup, not limited to any capacity.
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
> >=20
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
> > >=20
> >=20
> >=20
>=20
>=20
>=20
>=20
>=20




