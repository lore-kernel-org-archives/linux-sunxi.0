Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428B725DB1A
	for <linux-sunxi@lists.linux.dev>; Sat, 26 Apr 2025 18:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745692986; cv=none; b=poWJE4kHAwE/5fNMUhpHXJ6OdBSFah11oNuhjt8oDRoAD/StXkIcY/u6JnZ2qUnIFu5+lw+1UvgQMK8WuZ+i2D5GtLBPZ2OxTuX0Co+aY4x98fDV8U73hP1d/syJoaX74HNz/R0FUzNmgLlgEpCIq0pA6qELI96iMqqJ4Xj2GzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745692986; c=relaxed/simple;
	bh=dxNqDmDBQh2Zd42UZ1CundlOeFIySeI7OiOO8GtFdfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tqv1JooVFszxMqvLHMoBTrOaw4HDzkHScGX7oZwD+zg3nuaUi0k0laHTV0A+cxb5ghbC3C1cPWTaaBn0JKLxn7xy77UvzPilkUUzU4aoTRdH9JrYe9G6idfPLrkWixlVXhH1AayPejQB9/KP292On5/tAy3MiTqvTrq/iTsBlwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5HotdbR; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5HotdbR"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so5323801a12.1
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Apr 2025 11:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745692982; x=1746297782; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DehPP6JpjFnVnYA2xWpzUjU2IIjRkGi0RkuvwVGtHZs=;
        b=S5HotdbR42HDkHIRdv+54Mevryk+HGXBtirAkjOpL5Fen9N83n2kMSSMKWgmJ4+f88
         i9mk2ZBUsc50fHqYfRdfRN0aKA/MUNT9ANwsr3UR5Rty9nW+Loh0mmuF0cUpebNfC2Iz
         RRC2zU6rAbRd23AbMnpLTYB9/kyaCxEt9hefftU6p62tJPm9RKuTYyqVioI10bU7WMLz
         SruVzJq3HXDW04FE+4oqSldneRLS+M2DD7GDXUdCkN0hrkOa/FK+ZvSeMnCyNkMm1s/q
         EVsxoSop49OqqphDi+H3WWfMYjpU0PCKdZ3LsmWMdZf2MxG+Fve0P/VcC44yp8ultF2j
         VC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745692982; x=1746297782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DehPP6JpjFnVnYA2xWpzUjU2IIjRkGi0RkuvwVGtHZs=;
        b=oFqmIFEH0WlY1oPR6JMj2iAgeRyZiEfZFG5TvHqXHHlGHIOvpozzeujmPkzqXjOW42
         UzHNXZAFn8SLfdMNfTXY5290q025jm8bcBtfYmjLhK44fWFSicn7VkkSK3jbNbIlifMD
         HjDfypeeZldj3SG8Vs/8vv99eIxFR/RkCRKAN0fayf72Aco9/XWhlXF2a6M5fDgvMh+Q
         6EyxJ4s2zGBdKPnMfd5Qw0NAjncitj/jmV04buRQbvyex34/7pngkYKZHg21lu+n8x53
         LVE3yJ24XgLmTztlwxwPQq5fcLGjqUsQwTkiMIgyx+Xkj1G1LtZLrTJnU/lI65LvzIcm
         d7IQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2CS6Nt9WM/xp08yktRahX2esH8uu/3tMLiur9qXfl5Dz6wshZkkiAJHDTKaOeLzL0W5SIemUiKnCyDA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwqzdDajp/tWJ8p/j0kMU22XElu28BKCtyu+9DcBqlmWC7HhfqI
	rDQROl/gzq472Y3FFRkKe40vl1aLAxlXzVRX0vVU0zfz2xO2wEdp
X-Gm-Gg: ASbGncuPInB9OzZrsRMH+hcGYSRrbSXur+YwBT1oP+nZDdXGDFChHLLl9THdqjqjgb9
	Zf3yKftgE/L++JGstA6WPU4yK8SD7MZN3W51lS4L/ARLbJwoQwS/tODKfwThq20Y/Pc6WBS46h4
	HoXxgP9z0hpIWgbwh4Z35aKBXLhUOr4lRrbEWZawciatcozk2V0H9Jtb2Kb4JLB3/Ifat1VOvuh
	qwLyjkTFTjMhn37NGiqVbRzqZUAardIUk0wF0jp7Nza93Zf9bbDUwKV9V1Ypl/P3sx29KhF/JJH
	LKrDA1j5zoKuuvS2UUnxylTu/o4YIxELp8Q6Xfm5AjHCRkQSr/Gg4oyn+rsuYw==
X-Google-Smtp-Source: AGHT+IHPPwitCcaPzj7NHpXgt/t1L15IpZcfizT11SJlipQocXrvgo33ohM1kQulBTvz3ZMx9m4oPw==
X-Received: by 2002:a17:907:97c9:b0:ace:63b0:6f70 with SMTP id a640c23a62f3a-ace84b71607mr311437166b.61.1745692982062;
        Sat, 26 Apr 2025 11:43:02 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf9a0csm329516066b.94.2025.04.26.11.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 11:43:01 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: jagan@amarulasolutions.com, trini@konsulko.com, macromorgan@hotmail.com,
 uwu@icenowy.me, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 5/5] sunxi: h6/h616: Reuse common DRAM infrastructure
Date: Sat, 26 Apr 2025 20:43:00 +0200
Message-ID: <6148409.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20250417011825.66f1a134@minigeek.lan>
References:
 <20250411161439.4743-1-jernej.skrabec@gmail.com>
 <12645199.O9o76ZdvQC@jernej-laptop> <20250417011825.66f1a134@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 17. april 2025 ob 02:18:25 Srednjeevropski poletni =C4=8D=
as je Andre Przywara napisal(a):
> On Wed, 16 Apr 2025 18:30:43 +0200
> Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
>=20
> > Dne sreda, 16. april 2025 ob 01:40:04 Srednjeevropski poletni =C4=8Das =
je Andre Przywara napisal(a):
> > > On Fri, 11 Apr 2025 18:14:39 +0200
> > > Jernej Skrabec <jernej.skrabec@gmail.com> wrote:
> > >=20
> > > Hi Jernej,
> > >  =20
> > > > H616 rank and size detection code is superior to the H6. Neverthele=
ss,
> > > > they are structurally the same. Split functions from H616 into new =
file
> > > > and reuse them in H6 DRAM driver too. This should also fix some bug=
s for
> > > > H6 too, like incorrect DRAM size detection. =20
> > >=20
> > > that's a nice patch, but actually breaks on my Pine H64:
> > >=20
> > > U-Boot SPL 2025.04-01089-g14694431269f (Apr 15 2025 - 22:55:07 +0100)
> > > DRAM:DRAM init failed: Can't detect number of columns!
> > > resetting ...
> > >=20
> > > It's none of the previous H6 reworks that causes the problem, but it's
> > > actually already in the current code somehow: If I apply the equivale=
nt
> > > of [PATCH 1/5] to the H6 code, it already complains. Replacing the
> > > panic with a printf() gives me (on mainline):
> > >=20
> > > U-Boot SPL 2025.04-01085-g7a43fe97dc86-dirty (Apr 15 2025 - 23:48:42 =
+0100)
> > > DRAM:detected 14 rows (found=3D1)
> > > detected 11 columns (found=3D0)
> > >  2048 MiB
> > > Trying to boot from FEL
> > > NOTICE:  BL31: v2.12.0(debug):v2.12.0-724-gf745e004a
> > >    < continues booting >
> > >=20
> > > So it seems like the match failed, but apparently 11 columns are corr=
ect anyway.
> > > And since the same happens after this patch, I assume that even the
> > > newer and better matching routine doesn't change that, unfortunately.
> > >=20
> > > The config on this board is: 2 ranks, full width, 11 cols, 14 rows =
=3D> 2GB.
> > > And that seems to work (in Linux).
> > > It's a single chip Elpida FA232A2MA JD-F, listed by Micron as
> > > EDFA232A2MA-JD-F-D, though I couldn't find a datasheet quickly. =20
> >=20
> > Thanks for testing! It looks like it's best just to drop first patch in=
 the
> > series. 11 columns is for sure valid. Not that sure about 17 rows, but
> > better leave it as is.
> > What do you think?
>=20
> Well, that certainly works, and I will probably take it, as the series
> itself is a nice cleanup and is in the right direction. However this
> leaves this problem still being around: the mctl_check_pattern()
> function fails, even if this is apparently the right configuration. So
> we should figure out what's going on, even though with 1/5 dropped and
> 5/5 changed accordingly it works (TM) the same as before.

I just checked JEDEC LPDDR3 standard and 11 columns is max. for full bus
(32 lines) configuration. It's used for 2 GB chips, which it is in this
case, so everything is fine.

Code just scans if there is less than 11 columns. Not matching anything
means there are 11 columns.

I would say everything is in order.

Best regards,
Jernej

>=20
> Cheers,
> Andre
>=20
> >=20
> >=20
> > Best regards,
> > Jernej
> >=20
> > >=20
> > > Cheers,
> > > Andre
> > >  =20
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > ---
> > > >  .../include/asm/arch-sunxi/dram_dw_helpers.h  |  22 +++
> > > >  arch/arm/mach-sunxi/Makefile                  |   4 +-
> > > >  arch/arm/mach-sunxi/dram_dw_helpers.c         | 160 ++++++++++++++=
++++
> > > >  arch/arm/mach-sunxi/dram_sun50i_h6.c          |  91 +---------
> > > >  arch/arm/mach-sunxi/dram_sun50i_h616.c        | 155 +-------------=
=2D--
> > > >  5 files changed, 190 insertions(+), 242 deletions(-)
> > > >  create mode 100644 arch/arm/include/asm/arch-sunxi/dram_dw_helpers=
=2Eh
> > > >  create mode 100644 arch/arm/mach-sunxi/dram_dw_helpers.c
> > > >=20
> > > > diff --git a/arch/arm/include/asm/arch-sunxi/dram_dw_helpers.h b/ar=
ch/arm/include/asm/arch-sunxi/dram_dw_helpers.h
> > > > new file mode 100644
> > > > index 000000000000..bc9e0d868c55
> > > > --- /dev/null
> > > > +++ b/arch/arm/include/asm/arch-sunxi/dram_dw_helpers.h
> > > > @@ -0,0 +1,22 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > > +/*
> > > > + * Helpers that are commonly used with DW memory controller.
> > > > + *
> > > > + * (C) Copyright 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > + *
> > > > + */
> > > > +
> > > > +#ifndef _DRAM_DW_HELPERS_H
> > > > +#define _DRAM_DW_HELPERS_H
> > > > +
> > > > +#include <asm/arch/dram.h>
> > > > +
> > > > +bool mctl_core_init(const struct dram_para *para,
> > > > +		    const struct dram_config *config);
> > > > +void mctl_auto_detect_rank_width(const struct dram_para *para,
> > > > +				 struct dram_config *config);
> > > > +void mctl_auto_detect_dram_size(const struct dram_para *para,
> > > > +				struct dram_config *config);
> > > > +unsigned long mctl_calc_size(const struct dram_config *config);
> > > > +
> > > > +#endif
> > > > diff --git a/arch/arm/mach-sunxi/Makefile b/arch/arm/mach-sunxi/Mak=
efile
> > > > index eb6a49119a13..a33cd5b0f07a 100644
> > > > --- a/arch/arm/mach-sunxi/Makefile
> > > > +++ b/arch/arm/mach-sunxi/Makefile
> > > > @@ -41,8 +41,8 @@ obj-$(CONFIG_DRAM_SUN9I)	+=3D dram_sun9i.o
> > > >  obj-$(CONFIG_SPL_SPI_SUNXI)	+=3D spl_spi_sunxi.o
> > > >  obj-$(CONFIG_SUNXI_DRAM_DW)	+=3D dram_sunxi_dw.o
> > > >  obj-$(CONFIG_SUNXI_DRAM_DW)	+=3D dram_timings/
> > > > -obj-$(CONFIG_DRAM_SUN50I_H6)	+=3D dram_sun50i_h6.o
> > > > +obj-$(CONFIG_DRAM_SUN50I_H6)	+=3D dram_sun50i_h6.o dram_dw_helpers=
=2Eo
> > > >  obj-$(CONFIG_DRAM_SUN50I_H6)	+=3D dram_timings/
> > > > -obj-$(CONFIG_DRAM_SUN50I_H616)	+=3D dram_sun50i_h616.o
> > > > +obj-$(CONFIG_DRAM_SUN50I_H616)	+=3D dram_sun50i_h616.o dram_dw_hel=
pers.o
> > > >  obj-$(CONFIG_DRAM_SUN50I_H616)	+=3D dram_timings/
> > > >  endif
> > > > diff --git a/arch/arm/mach-sunxi/dram_dw_helpers.c b/arch/arm/mach-=
sunxi/dram_dw_helpers.c
> > > > new file mode 100644
> > > > index 000000000000..885d1f2c0b12
> > > > --- /dev/null
> > > > +++ b/arch/arm/mach-sunxi/dram_dw_helpers.c
> > > > @@ -0,0 +1,160 @@
> > > > +// SPDX-License-Identifier: GPL-2.0+
> > > > +/*
> > > > + * Helpers that are commonly used with DW memory controller.
> > > > + *
> > > > + * (C) Copyright 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > + *
> > > > + */
> > > > +
> > > > +#include <init.h>
> > > > +#include <asm/arch/dram_dw_helpers.h>
> > > > +
> > > > +void mctl_auto_detect_rank_width(const struct dram_para *para,
> > > > +				 struct dram_config *config)
> > > > +{
> > > > +	/* this is minimum size that it's supported */
> > > > +	config->cols =3D 8;
> > > > +	config->rows =3D 13;
> > > > +
> > > > +	/*
> > > > +	 * Strategy here is to test most demanding combination first and =
least
> > > > +	 * demanding last, otherwise HW might not be fully utilized. For
> > > > +	 * example, half bus width and rank =3D 1 combination would also =
work
> > > > +	 * on HW with full bus width and rank =3D 2, but only 1/4 RAM wou=
ld be
> > > > +	 * visible.
> > > > +	 */
> > > > +
> > > > +	debug("testing 32-bit width, rank =3D 2\n");
> > > > +	config->bus_full_width =3D 1;
> > > > +	config->ranks =3D 2;
> > > > +	if (mctl_core_init(para, config))
> > > > +		return;
> > > > +
> > > > +	debug("testing 32-bit width, rank =3D 1\n");
> > > > +	config->bus_full_width =3D 1;
> > > > +	config->ranks =3D 1;
> > > > +	if (mctl_core_init(para, config))
> > > > +		return;
> > > > +
> > > > +	debug("testing 16-bit width, rank =3D 2\n");
> > > > +	config->bus_full_width =3D 0;
> > > > +	config->ranks =3D 2;
> > > > +	if (mctl_core_init(para, config))
> > > > +		return;
> > > > +
> > > > +	debug("testing 16-bit width, rank =3D 1\n");
> > > > +	config->bus_full_width =3D 0;
> > > > +	config->ranks =3D 1;
> > > > +	if (mctl_core_init(para, config))
> > > > +		return;
> > > > +
> > > > +	panic("This DRAM setup is currently not supported.\n");
> > > > +}
> > > > +
> > > > +static void mctl_write_pattern(void)
> > > > +{
> > > > +	unsigned int i;
> > > > +	u32 *ptr, val;
> > > > +
> > > > +	ptr =3D (u32 *)CFG_SYS_SDRAM_BASE;
> > > > +	for (i =3D 0; i < 16; ptr++, i++) {
> > > > +		if (i & 1)
> > > > +			val =3D ~(ulong)ptr;
> > > > +		else
> > > > +			val =3D (ulong)ptr;
> > > > +		writel(val, ptr);
> > > > +	}
> > > > +}
> > > > +
> > > > +static bool mctl_check_pattern(ulong offset)
> > > > +{
> > > > +	unsigned int i;
> > > > +	u32 *ptr, val;
> > > > +
> > > > +	ptr =3D (u32 *)CFG_SYS_SDRAM_BASE;
> > > > +	for (i =3D 0; i < 16; ptr++, i++) {
> > > > +		if (i & 1)
> > > > +			val =3D ~(ulong)ptr;
> > > > +		else
> > > > +			val =3D (ulong)ptr;
> > > > +		if (val !=3D *(ptr + offset / 4))
> > > > +			return false;
> > > > +	}
> > > > +
> > > > +	return true;
> > > > +}
> > > > +
> > > > +void mctl_auto_detect_dram_size(const struct dram_para *para,
> > > > +				struct dram_config *config)
> > > > +{
> > > > +	unsigned int shift, cols, rows, found;
> > > > +	u32 buffer[16];
> > > > +
> > > > +	/* max. config for columns, but not rows */
> > > > +	config->cols =3D 11;
> > > > +	config->rows =3D 13;
> > > > +	mctl_core_init(para, config);
> > > > +
> > > > +	/*
> > > > +	 * Store content so it can be restored later. This is important
> > > > +	 * if controller was already initialized and holds any data
> > > > +	 * which is important for restoring system.
> > > > +	 */
> > > > +	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
> > > > +
> > > > +	mctl_write_pattern();
> > > > +
> > > > +	shift =3D config->bus_full_width + 1;
> > > > +
> > > > +	/* detect column address bits */
> > > > +	found =3D 0;
> > > > +	for (cols =3D 8; cols < 11; cols++) {
> > > > +		if (mctl_check_pattern(1ULL << (cols + shift))) {
> > > > +			found =3D 1;
> > > > +			break;
> > > > +		}
> > > > +	}
> > > > +	if (!found)
> > > > +		panic("DRAM init failed: Can't detect number of columns!");
> > > > +	debug("detected %u columns\n", cols);
> > > > +
> > > > +	/* restore data */
> > > > +	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
> > > > +
> > > > +	/* reconfigure to make sure that all active rows are accessible */
> > > > +	config->cols =3D 8;
> > > > +	config->rows =3D 17;
> > > > +	mctl_core_init(para, config);
> > > > +
> > > > +	/* store data again as it might be moved */
> > > > +	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
> > > > +
> > > > +	mctl_write_pattern();
> > > > +
> > > > +	/* detect row address bits */
> > > > +	shift =3D config->bus_full_width + 4 + config->cols;
> > > > +	found =3D 0;
> > > > +	for (rows =3D 13; rows < 17; rows++) {
> > > > +		if (mctl_check_pattern(1ULL << (rows + shift))) {
> > > > +			found =3D 1;
> > > > +			break;
> > > > +		}
> > > > +	}
> > > > +	if (!found)
> > > > +		panic("DRAM init failed: Can't detect number of rows!");
> > > > +	debug("detected %u rows\n", rows);
> > > > +
> > > > +	/* restore data again */
> > > > +	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
> > > > +
> > > > +	config->cols =3D cols;
> > > > +	config->rows =3D rows;
> > > > +}
> > > > +
> > > > +unsigned long mctl_calc_size(const struct dram_config *config)
> > > > +{
> > > > +	u8 width =3D config->bus_full_width ? 4 : 2;
> > > > +
> > > > +	/* 8 banks */
> > > > +	return (1ULL << (config->cols + config->rows + 3)) * width * conf=
ig->ranks;
> > > > +}
> > > > diff --git a/arch/arm/mach-sunxi/dram_sun50i_h6.c b/arch/arm/mach-s=
unxi/dram_sun50i_h6.c
> > > > index 6a9e53f965eb..fbb865131e08 100644
> > > > --- a/arch/arm/mach-sunxi/dram_sun50i_h6.c
> > > > +++ b/arch/arm/mach-sunxi/dram_sun50i_h6.c
> > > > @@ -10,6 +10,7 @@
> > > >  #include <asm/io.h>
> > > >  #include <asm/arch/clock.h>
> > > >  #include <asm/arch/dram.h>
> > > > +#include <asm/arch/dram_dw_helpers.h>
> > > >  #include <asm/arch/cpu.h>
> > > >  #include <asm/arch/prcm.h>
> > > >  #include <linux/bitops.h>
> > > > @@ -40,8 +41,8 @@ static void mctl_com_init(const struct dram_para =
*para,
> > > >  static bool mctl_channel_init(const struct dram_para *para,
> > > >  			      const struct dram_config *config);
> > > > =20
> > > > -static bool mctl_core_init(const struct dram_para *para,
> > > > -			   const struct dram_config *config)
> > > > +bool mctl_core_init(const struct dram_para *para,
> > > > +		    const struct dram_config *config)
> > > >  {
> > > >  	mctl_sys_init(para->clk);
> > > >  	mctl_com_init(para, config);
> > > > @@ -560,92 +561,6 @@ static bool mctl_channel_init(const struct dra=
m_para *para,
> > > >  	return true;
> > > >  }
> > > > =20
> > > > -static void mctl_auto_detect_rank_width(const struct dram_para *pa=
ra,
> > > > -					struct dram_config *config)
> > > > -{
> > > > -	/* this is minimum size that it's supported */
> > > > -	config->cols =3D 8;
> > > > -	config->rows =3D 13;
> > > > -
> > > > -	/*
> > > > -	 * Previous versions of this driver tried to auto detect the rank
> > > > -	 * and width by looking at controller registers. However this pro=
ved
> > > > -	 * to be not reliable, so this approach here is the more robust
> > > > -	 * solution. Check the git history for details.
> > > > -	 *
> > > > -	 * Strategy here is to test most demanding combination first and =
least
> > > > -	 * demanding last, otherwise HW might not be fully utilized. For
> > > > -	 * example, half bus width and rank =3D 1 combination would also =
work
> > > > -	 * on HW with full bus width and rank =3D 2, but only 1/4 RAM wou=
ld be
> > > > -	 * visible.
> > > > -	 */
> > > > -
> > > > -	debug("testing 32-bit width, rank =3D 2\n");
> > > > -	config->bus_full_width =3D 1;
> > > > -	config->ranks =3D 2;
> > > > -	if (mctl_core_init(para, config))
> > > > -		return;
> > > > -
> > > > -	debug("testing 32-bit width, rank =3D 1\n");
> > > > -	config->bus_full_width =3D 1;
> > > > -	config->ranks =3D 1;
> > > > -	if (mctl_core_init(para, config))
> > > > -		return;
> > > > -
> > > > -	debug("testing 16-bit width, rank =3D 2\n");
> > > > -	config->bus_full_width =3D 0;
> > > > -	config->ranks =3D 2;
> > > > -	if (mctl_core_init(para, config))
> > > > -		return;
> > > > -
> > > > -	debug("testing 16-bit width, rank =3D 1\n");
> > > > -	config->bus_full_width =3D 0;
> > > > -	config->ranks =3D 1;
> > > > -	if (mctl_core_init(para, config))
> > > > -		return;
> > > > -
> > > > -	panic("This DRAM setup is currently not supported.\n");
> > > > -}
> > > > -
> > > > -static void mctl_auto_detect_dram_size(const struct dram_para *par=
a,
> > > > -				       struct dram_config *config)
> > > > -{
> > > > -	/* TODO: non-(LP)DDR3 */
> > > > -
> > > > -	/* detect row address bits */
> > > > -	config->cols =3D 8;
> > > > -	config->rows =3D 18;
> > > > -	mctl_core_init(para, config);
> > > > -
> > > > -	for (config->rows =3D 13; config->rows < 18; config->rows++) {
> > > > -		/* 8 banks, 8 bit per byte and 16/32 bit width */
> > > > -		if (mctl_mem_matches((1 << (config->rows + config->cols +
> > > > -					    4 + config->bus_full_width))))
> > > > -			break;
> > > > -	}
> > > > -
> > > > -	/* detect column address bits */
> > > > -	config->cols =3D 11;
> > > > -	mctl_core_init(para, config);
> > > > -
> > > > -	for (config->cols =3D 8; config->cols < 11; config->cols++) {
> > > > -		/* 8 bits per byte and 16/32 bit width */
> > > > -		if (mctl_mem_matches(1 << (config->cols + 1 +
> > > > -					   config->bus_full_width)))
> > > > -			break;
> > > > -	}
> > > > -}
> > > > -
> > > > -unsigned long mctl_calc_size(const struct dram_config *config)
> > > > -{
> > > > -	u8 width =3D config->bus_full_width ? 4 : 2;
> > > > -
> > > > -	/* TODO: non-(LP)DDR3 */
> > > > -
> > > > -	/* 8 banks */
> > > > -	return (1ULL << (config->cols + config->rows + 3)) * width * conf=
ig->ranks;
> > > > -}
> > > > -
> > > >  #define SUN50I_H6_LPDDR3_DX_WRITE_DELAYS			\
> > > >  	{{  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 },	\
> > > >  	 {  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 },	\
> > > > diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach=
=2Dsunxi/dram_sun50i_h616.c
> > > > index d1768a7e7d3a..80d9de557876 100644
> > > > --- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
> > > > +++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> > > > @@ -17,6 +17,7 @@
> > > >  #include <asm/io.h>
> > > >  #include <asm/arch/clock.h>
> > > >  #include <asm/arch/dram.h>
> > > > +#include <asm/arch/dram_dw_helpers.h>
> > > >  #include <asm/arch/cpu.h>
> > > >  #include <asm/arch/prcm.h>
> > > >  #include <linux/bitops.h>
> > > > @@ -1310,164 +1311,14 @@ static bool mctl_ctrl_init(const struct dr=
am_para *para,
> > > >  	return true;
> > > >  }
> > > > =20
> > > > -static bool mctl_core_init(const struct dram_para *para,
> > > > -			   const struct dram_config *config)
> > > > +bool mctl_core_init(const struct dram_para *para,
> > > > +		    const struct dram_config *config)
> > > >  {
> > > >  	mctl_sys_init(para->clk);
> > > > =20
> > > >  	return mctl_ctrl_init(para, config);
> > > >  }
> > > > =20
> > > > -static void mctl_auto_detect_rank_width(const struct dram_para *pa=
ra,
> > > > -					struct dram_config *config)
> > > > -{
> > > > -	/* this is minimum size that it's supported */
> > > > -	config->cols =3D 8;
> > > > -	config->rows =3D 13;
> > > > -
> > > > -	/*
> > > > -	 * Strategy here is to test most demanding combination first and =
least
> > > > -	 * demanding last, otherwise HW might not be fully utilized. For
> > > > -	 * example, half bus width and rank =3D 1 combination would also =
work
> > > > -	 * on HW with full bus width and rank =3D 2, but only 1/4 RAM wou=
ld be
> > > > -	 * visible.
> > > > -	 */
> > > > -
> > > > -	debug("testing 32-bit width, rank =3D 2\n");
> > > > -	config->bus_full_width =3D 1;
> > > > -	config->ranks =3D 2;
> > > > -	if (mctl_core_init(para, config))
> > > > -		return;
> > > > -
> > > > -	debug("testing 32-bit width, rank =3D 1\n");
> > > > -	config->bus_full_width =3D 1;
> > > > -	config->ranks =3D 1;
> > > > -	if (mctl_core_init(para, config))
> > > > -		return;
> > > > -
> > > > -	debug("testing 16-bit width, rank =3D 2\n");
> > > > -	config->bus_full_width =3D 0;
> > > > -	config->ranks =3D 2;
> > > > -	if (mctl_core_init(para, config))
> > > > -		return;
> > > > -
> > > > -	debug("testing 16-bit width, rank =3D 1\n");
> > > > -	config->bus_full_width =3D 0;
> > > > -	config->ranks =3D 1;
> > > > -	if (mctl_core_init(para, config))
> > > > -		return;
> > > > -
> > > > -	panic("This DRAM setup is currently not supported.\n");
> > > > -}
> > > > -
> > > > -static void mctl_write_pattern(void)
> > > > -{
> > > > -	unsigned int i;
> > > > -	u32 *ptr, val;
> > > > -
> > > > -	ptr =3D (u32 *)CFG_SYS_SDRAM_BASE;
> > > > -	for (i =3D 0; i < 16; ptr++, i++) {
> > > > -		if (i & 1)
> > > > -			val =3D ~(ulong)ptr;
> > > > -		else
> > > > -			val =3D (ulong)ptr;
> > > > -		writel(val, ptr);
> > > > -	}
> > > > -}
> > > > -
> > > > -static bool mctl_check_pattern(ulong offset)
> > > > -{
> > > > -	unsigned int i;
> > > > -	u32 *ptr, val;
> > > > -
> > > > -	ptr =3D (u32 *)CFG_SYS_SDRAM_BASE;
> > > > -	for (i =3D 0; i < 16; ptr++, i++) {
> > > > -		if (i & 1)
> > > > -			val =3D ~(ulong)ptr;
> > > > -		else
> > > > -			val =3D (ulong)ptr;
> > > > -		if (val !=3D *(ptr + offset / 4))
> > > > -			return false;
> > > > -	}
> > > > -
> > > > -	return true;
> > > > -}
> > > > -
> > > > -static void mctl_auto_detect_dram_size(const struct dram_para *par=
a,
> > > > -				       struct dram_config *config)
> > > > -{
> > > > -	unsigned int shift, cols, rows, found;
> > > > -	u32 buffer[16];
> > > > -
> > > > -	/* max. config for columns, but not rows */
> > > > -	config->cols =3D 11;
> > > > -	config->rows =3D 13;
> > > > -	mctl_core_init(para, config);
> > > > -
> > > > -	/*
> > > > -	 * Store content so it can be restored later. This is important
> > > > -	 * if controller was already initialized and holds any data
> > > > -	 * which is important for restoring system.
> > > > -	 */
> > > > -	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
> > > > -
> > > > -	mctl_write_pattern();
> > > > -
> > > > -	shift =3D config->bus_full_width + 1;
> > > > -
> > > > -	/* detect column address bits */
> > > > -	found =3D 0;
> > > > -	for (cols =3D 8; cols < 11; cols++) {
> > > > -		if (mctl_check_pattern(1ULL << (cols + shift))) {
> > > > -			found =3D 1;
> > > > -			break;
> > > > -		}
> > > > -	}
> > > > -	if (!found)
> > > > -		panic("DRAM init failed: Can't detect number of columns!");
> > > > -	debug("detected %u columns\n", cols);
> > > > -
> > > > -	/* restore data */
> > > > -	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
> > > > -
> > > > -	/* reconfigure to make sure that all active rows are accessible */
> > > > -	config->cols =3D 8;
> > > > -	config->rows =3D 17;
> > > > -	mctl_core_init(para, config);
> > > > -
> > > > -	/* store data again as it might be moved */
> > > > -	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
> > > > -
> > > > -	mctl_write_pattern();
> > > > -
> > > > -	/* detect row address bits */
> > > > -	shift =3D config->bus_full_width + 4 + config->cols;
> > > > -	found =3D 0;
> > > > -	for (rows =3D 13; rows < 17; rows++) {
> > > > -		if (mctl_check_pattern(1ULL << (rows + shift))) {
> > > > -			found =3D 1;
> > > > -			break;
> > > > -		}
> > > > -	}
> > > > -	if (!found)
> > > > -		panic("DRAM init failed: Can't detect number of rows!");
> > > > -	debug("detected %u rows\n", rows);
> > > > -
> > > > -	/* restore data again */
> > > > -	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
> > > > -
> > > > -	config->cols =3D cols;
> > > > -	config->rows =3D rows;
> > > > -}
> > > > -
> > > > -static unsigned long mctl_calc_size(const struct dram_config *conf=
ig)
> > > > -{
> > > > -	u8 width =3D config->bus_full_width ? 4 : 2;
> > > > -
> > > > -	/* 8 banks */
> > > > -	return (1ULL << (config->cols + config->rows + 3)) * width * conf=
ig->ranks;
> > > > -}
> > > > -
> > > >  static const struct dram_para para =3D {
> > > >  	.clk =3D CONFIG_DRAM_CLK,
> > > >  #ifdef CONFIG_SUNXI_DRAM_H616_DDR3_1333 =20
> > >=20
> > >  =20
> >=20
> >=20
> >=20
> >=20
> >=20
>=20
>=20




