Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7178923AD
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Apr 2025 00:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849167; cv=none; b=qHKzfXtGoHBYd3YH/nDQf3AJAxpBV8AM4xhRRIjusEKMznU/zz3HFkGxEZcTjoYrEai4JcaA2U+H+j3OvXllm+22g5sRBYUWAYIOTg8VApiXzx2UbXGfQ06S7i81F5rOMwdVz6+LLvrltqz4C0XeGle75QTnYvR2H50bGGTNC14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849167; c=relaxed/simple;
	bh=0AN4NgLXRn5C32RQjVxOeGQdHIT3KGlj0f64bdDhCEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QO2RyjwVSdru9EAL+fn7TWW2ePgKojkoc70kwWxOt3kBsFan3+EHvDo4GoVoadbQyKpl8d+iVbxqybnl1ouD8CGG0HXDr4cT6WwDUvD8Wtrb3UgpOFFpu5tIrc4Cgh5//jCsEWe3bah9M+UHS9gRq+Pllp1Lp1uf8HjbfwtOO3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63A2A152B;
	Wed, 16 Apr 2025 17:19:21 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE9CA3F66E;
	Wed, 16 Apr 2025 17:19:22 -0700 (PDT)
Date: Thu, 17 Apr 2025 01:18:25 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: jagan@amarulasolutions.com, trini@konsulko.com, macromorgan@hotmail.com,
 uwu@icenowy.me, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 5/5] sunxi: h6/h616: Reuse common DRAM infrastructure
Message-ID: <20250417011825.66f1a134@minigeek.lan>
In-Reply-To: <12645199.O9o76ZdvQC@jernej-laptop>
References: <20250411161439.4743-1-jernej.skrabec@gmail.com>
	<20250411161439.4743-6-jernej.skrabec@gmail.com>
	<20250416003942.12d13ee4@minigeek.lan>
	<12645199.O9o76ZdvQC@jernej-laptop>
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

On Wed, 16 Apr 2025 18:30:43 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

> Dne sreda, 16. april 2025 ob 01:40:04 Srednjeevropski poletni =C4=8Das je=
 Andre Przywara napisal(a):
> > On Fri, 11 Apr 2025 18:14:39 +0200
> > Jernej Skrabec <jernej.skrabec@gmail.com> wrote:
> >=20
> > Hi Jernej,
> >  =20
> > > H616 rank and size detection code is superior to the H6. Nevertheless,
> > > they are structurally the same. Split functions from H616 into new fi=
le
> > > and reuse them in H6 DRAM driver too. This should also fix some bugs =
for
> > > H6 too, like incorrect DRAM size detection. =20
> >=20
> > that's a nice patch, but actually breaks on my Pine H64:
> >=20
> > U-Boot SPL 2025.04-01089-g14694431269f (Apr 15 2025 - 22:55:07 +0100)
> > DRAM:DRAM init failed: Can't detect number of columns!
> > resetting ...
> >=20
> > It's none of the previous H6 reworks that causes the problem, but it's
> > actually already in the current code somehow: If I apply the equivalent
> > of [PATCH 1/5] to the H6 code, it already complains. Replacing the
> > panic with a printf() gives me (on mainline):
> >=20
> > U-Boot SPL 2025.04-01085-g7a43fe97dc86-dirty (Apr 15 2025 - 23:48:42 +0=
100)
> > DRAM:detected 14 rows (found=3D1)
> > detected 11 columns (found=3D0)
> >  2048 MiB
> > Trying to boot from FEL
> > NOTICE:  BL31: v2.12.0(debug):v2.12.0-724-gf745e004a
> >    < continues booting >
> >=20
> > So it seems like the match failed, but apparently 11 columns are correc=
t anyway.
> > And since the same happens after this patch, I assume that even the
> > newer and better matching routine doesn't change that, unfortunately.
> >=20
> > The config on this board is: 2 ranks, full width, 11 cols, 14 rows =3D>=
 2GB.
> > And that seems to work (in Linux).
> > It's a single chip Elpida FA232A2MA JD-F, listed by Micron as
> > EDFA232A2MA-JD-F-D, though I couldn't find a datasheet quickly. =20
>=20
> Thanks for testing! It looks like it's best just to drop first patch in t=
he
> series. 11 columns is for sure valid. Not that sure about 17 rows, but
> better leave it as is.
> What do you think?

Well, that certainly works, and I will probably take it, as the series
itself is a nice cleanup and is in the right direction. However this
leaves this problem still being around: the mctl_check_pattern()
function fails, even if this is apparently the right configuration. So
we should figure out what's going on, even though with 1/5 dropped and
5/5 changed accordingly it works (TM) the same as before.

Cheers,
Andre

>=20
>=20
> Best regards,
> Jernej
>=20
> >=20
> > Cheers,
> > Andre
> >  =20
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > ---
> > >  .../include/asm/arch-sunxi/dram_dw_helpers.h  |  22 +++
> > >  arch/arm/mach-sunxi/Makefile                  |   4 +-
> > >  arch/arm/mach-sunxi/dram_dw_helpers.c         | 160 ++++++++++++++++=
++
> > >  arch/arm/mach-sunxi/dram_sun50i_h6.c          |  91 +---------
> > >  arch/arm/mach-sunxi/dram_sun50i_h616.c        | 155 +----------------
> > >  5 files changed, 190 insertions(+), 242 deletions(-)
> > >  create mode 100644 arch/arm/include/asm/arch-sunxi/dram_dw_helpers.h
> > >  create mode 100644 arch/arm/mach-sunxi/dram_dw_helpers.c
> > >=20
> > > diff --git a/arch/arm/include/asm/arch-sunxi/dram_dw_helpers.h b/arch=
/arm/include/asm/arch-sunxi/dram_dw_helpers.h
> > > new file mode 100644
> > > index 000000000000..bc9e0d868c55
> > > --- /dev/null
> > > +++ b/arch/arm/include/asm/arch-sunxi/dram_dw_helpers.h
> > > @@ -0,0 +1,22 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/*
> > > + * Helpers that are commonly used with DW memory controller.
> > > + *
> > > + * (C) Copyright 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> > > + *
> > > + */
> > > +
> > > +#ifndef _DRAM_DW_HELPERS_H
> > > +#define _DRAM_DW_HELPERS_H
> > > +
> > > +#include <asm/arch/dram.h>
> > > +
> > > +bool mctl_core_init(const struct dram_para *para,
> > > +		    const struct dram_config *config);
> > > +void mctl_auto_detect_rank_width(const struct dram_para *para,
> > > +				 struct dram_config *config);
> > > +void mctl_auto_detect_dram_size(const struct dram_para *para,
> > > +				struct dram_config *config);
> > > +unsigned long mctl_calc_size(const struct dram_config *config);
> > > +
> > > +#endif
> > > diff --git a/arch/arm/mach-sunxi/Makefile b/arch/arm/mach-sunxi/Makef=
ile
> > > index eb6a49119a13..a33cd5b0f07a 100644
> > > --- a/arch/arm/mach-sunxi/Makefile
> > > +++ b/arch/arm/mach-sunxi/Makefile
> > > @@ -41,8 +41,8 @@ obj-$(CONFIG_DRAM_SUN9I)	+=3D dram_sun9i.o
> > >  obj-$(CONFIG_SPL_SPI_SUNXI)	+=3D spl_spi_sunxi.o
> > >  obj-$(CONFIG_SUNXI_DRAM_DW)	+=3D dram_sunxi_dw.o
> > >  obj-$(CONFIG_SUNXI_DRAM_DW)	+=3D dram_timings/
> > > -obj-$(CONFIG_DRAM_SUN50I_H6)	+=3D dram_sun50i_h6.o
> > > +obj-$(CONFIG_DRAM_SUN50I_H6)	+=3D dram_sun50i_h6.o dram_dw_helpers.o
> > >  obj-$(CONFIG_DRAM_SUN50I_H6)	+=3D dram_timings/
> > > -obj-$(CONFIG_DRAM_SUN50I_H616)	+=3D dram_sun50i_h616.o
> > > +obj-$(CONFIG_DRAM_SUN50I_H616)	+=3D dram_sun50i_h616.o dram_dw_helpe=
rs.o
> > >  obj-$(CONFIG_DRAM_SUN50I_H616)	+=3D dram_timings/
> > >  endif
> > > diff --git a/arch/arm/mach-sunxi/dram_dw_helpers.c b/arch/arm/mach-su=
nxi/dram_dw_helpers.c
> > > new file mode 100644
> > > index 000000000000..885d1f2c0b12
> > > --- /dev/null
> > > +++ b/arch/arm/mach-sunxi/dram_dw_helpers.c
> > > @@ -0,0 +1,160 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Helpers that are commonly used with DW memory controller.
> > > + *
> > > + * (C) Copyright 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> > > + *
> > > + */
> > > +
> > > +#include <init.h>
> > > +#include <asm/arch/dram_dw_helpers.h>
> > > +
> > > +void mctl_auto_detect_rank_width(const struct dram_para *para,
> > > +				 struct dram_config *config)
> > > +{
> > > +	/* this is minimum size that it's supported */
> > > +	config->cols =3D 8;
> > > +	config->rows =3D 13;
> > > +
> > > +	/*
> > > +	 * Strategy here is to test most demanding combination first and le=
ast
> > > +	 * demanding last, otherwise HW might not be fully utilized. For
> > > +	 * example, half bus width and rank =3D 1 combination would also wo=
rk
> > > +	 * on HW with full bus width and rank =3D 2, but only 1/4 RAM would=
 be
> > > +	 * visible.
> > > +	 */
> > > +
> > > +	debug("testing 32-bit width, rank =3D 2\n");
> > > +	config->bus_full_width =3D 1;
> > > +	config->ranks =3D 2;
> > > +	if (mctl_core_init(para, config))
> > > +		return;
> > > +
> > > +	debug("testing 32-bit width, rank =3D 1\n");
> > > +	config->bus_full_width =3D 1;
> > > +	config->ranks =3D 1;
> > > +	if (mctl_core_init(para, config))
> > > +		return;
> > > +
> > > +	debug("testing 16-bit width, rank =3D 2\n");
> > > +	config->bus_full_width =3D 0;
> > > +	config->ranks =3D 2;
> > > +	if (mctl_core_init(para, config))
> > > +		return;
> > > +
> > > +	debug("testing 16-bit width, rank =3D 1\n");
> > > +	config->bus_full_width =3D 0;
> > > +	config->ranks =3D 1;
> > > +	if (mctl_core_init(para, config))
> > > +		return;
> > > +
> > > +	panic("This DRAM setup is currently not supported.\n");
> > > +}
> > > +
> > > +static void mctl_write_pattern(void)
> > > +{
> > > +	unsigned int i;
> > > +	u32 *ptr, val;
> > > +
> > > +	ptr =3D (u32 *)CFG_SYS_SDRAM_BASE;
> > > +	for (i =3D 0; i < 16; ptr++, i++) {
> > > +		if (i & 1)
> > > +			val =3D ~(ulong)ptr;
> > > +		else
> > > +			val =3D (ulong)ptr;
> > > +		writel(val, ptr);
> > > +	}
> > > +}
> > > +
> > > +static bool mctl_check_pattern(ulong offset)
> > > +{
> > > +	unsigned int i;
> > > +	u32 *ptr, val;
> > > +
> > > +	ptr =3D (u32 *)CFG_SYS_SDRAM_BASE;
> > > +	for (i =3D 0; i < 16; ptr++, i++) {
> > > +		if (i & 1)
> > > +			val =3D ~(ulong)ptr;
> > > +		else
> > > +			val =3D (ulong)ptr;
> > > +		if (val !=3D *(ptr + offset / 4))
> > > +			return false;
> > > +	}
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +void mctl_auto_detect_dram_size(const struct dram_para *para,
> > > +				struct dram_config *config)
> > > +{
> > > +	unsigned int shift, cols, rows, found;
> > > +	u32 buffer[16];
> > > +
> > > +	/* max. config for columns, but not rows */
> > > +	config->cols =3D 11;
> > > +	config->rows =3D 13;
> > > +	mctl_core_init(para, config);
> > > +
> > > +	/*
> > > +	 * Store content so it can be restored later. This is important
> > > +	 * if controller was already initialized and holds any data
> > > +	 * which is important for restoring system.
> > > +	 */
> > > +	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
> > > +
> > > +	mctl_write_pattern();
> > > +
> > > +	shift =3D config->bus_full_width + 1;
> > > +
> > > +	/* detect column address bits */
> > > +	found =3D 0;
> > > +	for (cols =3D 8; cols < 11; cols++) {
> > > +		if (mctl_check_pattern(1ULL << (cols + shift))) {
> > > +			found =3D 1;
> > > +			break;
> > > +		}
> > > +	}
> > > +	if (!found)
> > > +		panic("DRAM init failed: Can't detect number of columns!");
> > > +	debug("detected %u columns\n", cols);
> > > +
> > > +	/* restore data */
> > > +	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
> > > +
> > > +	/* reconfigure to make sure that all active rows are accessible */
> > > +	config->cols =3D 8;
> > > +	config->rows =3D 17;
> > > +	mctl_core_init(para, config);
> > > +
> > > +	/* store data again as it might be moved */
> > > +	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
> > > +
> > > +	mctl_write_pattern();
> > > +
> > > +	/* detect row address bits */
> > > +	shift =3D config->bus_full_width + 4 + config->cols;
> > > +	found =3D 0;
> > > +	for (rows =3D 13; rows < 17; rows++) {
> > > +		if (mctl_check_pattern(1ULL << (rows + shift))) {
> > > +			found =3D 1;
> > > +			break;
> > > +		}
> > > +	}
> > > +	if (!found)
> > > +		panic("DRAM init failed: Can't detect number of rows!");
> > > +	debug("detected %u rows\n", rows);
> > > +
> > > +	/* restore data again */
> > > +	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
> > > +
> > > +	config->cols =3D cols;
> > > +	config->rows =3D rows;
> > > +}
> > > +
> > > +unsigned long mctl_calc_size(const struct dram_config *config)
> > > +{
> > > +	u8 width =3D config->bus_full_width ? 4 : 2;
> > > +
> > > +	/* 8 banks */
> > > +	return (1ULL << (config->cols + config->rows + 3)) * width * config=
->ranks;
> > > +}
> > > diff --git a/arch/arm/mach-sunxi/dram_sun50i_h6.c b/arch/arm/mach-sun=
xi/dram_sun50i_h6.c
> > > index 6a9e53f965eb..fbb865131e08 100644
> > > --- a/arch/arm/mach-sunxi/dram_sun50i_h6.c
> > > +++ b/arch/arm/mach-sunxi/dram_sun50i_h6.c
> > > @@ -10,6 +10,7 @@
> > >  #include <asm/io.h>
> > >  #include <asm/arch/clock.h>
> > >  #include <asm/arch/dram.h>
> > > +#include <asm/arch/dram_dw_helpers.h>
> > >  #include <asm/arch/cpu.h>
> > >  #include <asm/arch/prcm.h>
> > >  #include <linux/bitops.h>
> > > @@ -40,8 +41,8 @@ static void mctl_com_init(const struct dram_para *p=
ara,
> > >  static bool mctl_channel_init(const struct dram_para *para,
> > >  			      const struct dram_config *config);
> > > =20
> > > -static bool mctl_core_init(const struct dram_para *para,
> > > -			   const struct dram_config *config)
> > > +bool mctl_core_init(const struct dram_para *para,
> > > +		    const struct dram_config *config)
> > >  {
> > >  	mctl_sys_init(para->clk);
> > >  	mctl_com_init(para, config);
> > > @@ -560,92 +561,6 @@ static bool mctl_channel_init(const struct dram_=
para *para,
> > >  	return true;
> > >  }
> > > =20
> > > -static void mctl_auto_detect_rank_width(const struct dram_para *para,
> > > -					struct dram_config *config)
> > > -{
> > > -	/* this is minimum size that it's supported */
> > > -	config->cols =3D 8;
> > > -	config->rows =3D 13;
> > > -
> > > -	/*
> > > -	 * Previous versions of this driver tried to auto detect the rank
> > > -	 * and width by looking at controller registers. However this proved
> > > -	 * to be not reliable, so this approach here is the more robust
> > > -	 * solution. Check the git history for details.
> > > -	 *
> > > -	 * Strategy here is to test most demanding combination first and le=
ast
> > > -	 * demanding last, otherwise HW might not be fully utilized. For
> > > -	 * example, half bus width and rank =3D 1 combination would also wo=
rk
> > > -	 * on HW with full bus width and rank =3D 2, but only 1/4 RAM would=
 be
> > > -	 * visible.
> > > -	 */
> > > -
> > > -	debug("testing 32-bit width, rank =3D 2\n");
> > > -	config->bus_full_width =3D 1;
> > > -	config->ranks =3D 2;
> > > -	if (mctl_core_init(para, config))
> > > -		return;
> > > -
> > > -	debug("testing 32-bit width, rank =3D 1\n");
> > > -	config->bus_full_width =3D 1;
> > > -	config->ranks =3D 1;
> > > -	if (mctl_core_init(para, config))
> > > -		return;
> > > -
> > > -	debug("testing 16-bit width, rank =3D 2\n");
> > > -	config->bus_full_width =3D 0;
> > > -	config->ranks =3D 2;
> > > -	if (mctl_core_init(para, config))
> > > -		return;
> > > -
> > > -	debug("testing 16-bit width, rank =3D 1\n");
> > > -	config->bus_full_width =3D 0;
> > > -	config->ranks =3D 1;
> > > -	if (mctl_core_init(para, config))
> > > -		return;
> > > -
> > > -	panic("This DRAM setup is currently not supported.\n");
> > > -}
> > > -
> > > -static void mctl_auto_detect_dram_size(const struct dram_para *para,
> > > -				       struct dram_config *config)
> > > -{
> > > -	/* TODO: non-(LP)DDR3 */
> > > -
> > > -	/* detect row address bits */
> > > -	config->cols =3D 8;
> > > -	config->rows =3D 18;
> > > -	mctl_core_init(para, config);
> > > -
> > > -	for (config->rows =3D 13; config->rows < 18; config->rows++) {
> > > -		/* 8 banks, 8 bit per byte and 16/32 bit width */
> > > -		if (mctl_mem_matches((1 << (config->rows + config->cols +
> > > -					    4 + config->bus_full_width))))
> > > -			break;
> > > -	}
> > > -
> > > -	/* detect column address bits */
> > > -	config->cols =3D 11;
> > > -	mctl_core_init(para, config);
> > > -
> > > -	for (config->cols =3D 8; config->cols < 11; config->cols++) {
> > > -		/* 8 bits per byte and 16/32 bit width */
> > > -		if (mctl_mem_matches(1 << (config->cols + 1 +
> > > -					   config->bus_full_width)))
> > > -			break;
> > > -	}
> > > -}
> > > -
> > > -unsigned long mctl_calc_size(const struct dram_config *config)
> > > -{
> > > -	u8 width =3D config->bus_full_width ? 4 : 2;
> > > -
> > > -	/* TODO: non-(LP)DDR3 */
> > > -
> > > -	/* 8 banks */
> > > -	return (1ULL << (config->cols + config->rows + 3)) * width * config=
->ranks;
> > > -}
> > > -
> > >  #define SUN50I_H6_LPDDR3_DX_WRITE_DELAYS			\
> > >  	{{  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 },	\
> > >  	 {  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 },	\
> > > diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-s=
unxi/dram_sun50i_h616.c
> > > index d1768a7e7d3a..80d9de557876 100644
> > > --- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
> > > +++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> > > @@ -17,6 +17,7 @@
> > >  #include <asm/io.h>
> > >  #include <asm/arch/clock.h>
> > >  #include <asm/arch/dram.h>
> > > +#include <asm/arch/dram_dw_helpers.h>
> > >  #include <asm/arch/cpu.h>
> > >  #include <asm/arch/prcm.h>
> > >  #include <linux/bitops.h>
> > > @@ -1310,164 +1311,14 @@ static bool mctl_ctrl_init(const struct dram=
_para *para,
> > >  	return true;
> > >  }
> > > =20
> > > -static bool mctl_core_init(const struct dram_para *para,
> > > -			   const struct dram_config *config)
> > > +bool mctl_core_init(const struct dram_para *para,
> > > +		    const struct dram_config *config)
> > >  {
> > >  	mctl_sys_init(para->clk);
> > > =20
> > >  	return mctl_ctrl_init(para, config);
> > >  }
> > > =20
> > > -static void mctl_auto_detect_rank_width(const struct dram_para *para,
> > > -					struct dram_config *config)
> > > -{
> > > -	/* this is minimum size that it's supported */
> > > -	config->cols =3D 8;
> > > -	config->rows =3D 13;
> > > -
> > > -	/*
> > > -	 * Strategy here is to test most demanding combination first and le=
ast
> > > -	 * demanding last, otherwise HW might not be fully utilized. For
> > > -	 * example, half bus width and rank =3D 1 combination would also wo=
rk
> > > -	 * on HW with full bus width and rank =3D 2, but only 1/4 RAM would=
 be
> > > -	 * visible.
> > > -	 */
> > > -
> > > -	debug("testing 32-bit width, rank =3D 2\n");
> > > -	config->bus_full_width =3D 1;
> > > -	config->ranks =3D 2;
> > > -	if (mctl_core_init(para, config))
> > > -		return;
> > > -
> > > -	debug("testing 32-bit width, rank =3D 1\n");
> > > -	config->bus_full_width =3D 1;
> > > -	config->ranks =3D 1;
> > > -	if (mctl_core_init(para, config))
> > > -		return;
> > > -
> > > -	debug("testing 16-bit width, rank =3D 2\n");
> > > -	config->bus_full_width =3D 0;
> > > -	config->ranks =3D 2;
> > > -	if (mctl_core_init(para, config))
> > > -		return;
> > > -
> > > -	debug("testing 16-bit width, rank =3D 1\n");
> > > -	config->bus_full_width =3D 0;
> > > -	config->ranks =3D 1;
> > > -	if (mctl_core_init(para, config))
> > > -		return;
> > > -
> > > -	panic("This DRAM setup is currently not supported.\n");
> > > -}
> > > -
> > > -static void mctl_write_pattern(void)
> > > -{
> > > -	unsigned int i;
> > > -	u32 *ptr, val;
> > > -
> > > -	ptr =3D (u32 *)CFG_SYS_SDRAM_BASE;
> > > -	for (i =3D 0; i < 16; ptr++, i++) {
> > > -		if (i & 1)
> > > -			val =3D ~(ulong)ptr;
> > > -		else
> > > -			val =3D (ulong)ptr;
> > > -		writel(val, ptr);
> > > -	}
> > > -}
> > > -
> > > -static bool mctl_check_pattern(ulong offset)
> > > -{
> > > -	unsigned int i;
> > > -	u32 *ptr, val;
> > > -
> > > -	ptr =3D (u32 *)CFG_SYS_SDRAM_BASE;
> > > -	for (i =3D 0; i < 16; ptr++, i++) {
> > > -		if (i & 1)
> > > -			val =3D ~(ulong)ptr;
> > > -		else
> > > -			val =3D (ulong)ptr;
> > > -		if (val !=3D *(ptr + offset / 4))
> > > -			return false;
> > > -	}
> > > -
> > > -	return true;
> > > -}
> > > -
> > > -static void mctl_auto_detect_dram_size(const struct dram_para *para,
> > > -				       struct dram_config *config)
> > > -{
> > > -	unsigned int shift, cols, rows, found;
> > > -	u32 buffer[16];
> > > -
> > > -	/* max. config for columns, but not rows */
> > > -	config->cols =3D 11;
> > > -	config->rows =3D 13;
> > > -	mctl_core_init(para, config);
> > > -
> > > -	/*
> > > -	 * Store content so it can be restored later. This is important
> > > -	 * if controller was already initialized and holds any data
> > > -	 * which is important for restoring system.
> > > -	 */
> > > -	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
> > > -
> > > -	mctl_write_pattern();
> > > -
> > > -	shift =3D config->bus_full_width + 1;
> > > -
> > > -	/* detect column address bits */
> > > -	found =3D 0;
> > > -	for (cols =3D 8; cols < 11; cols++) {
> > > -		if (mctl_check_pattern(1ULL << (cols + shift))) {
> > > -			found =3D 1;
> > > -			break;
> > > -		}
> > > -	}
> > > -	if (!found)
> > > -		panic("DRAM init failed: Can't detect number of columns!");
> > > -	debug("detected %u columns\n", cols);
> > > -
> > > -	/* restore data */
> > > -	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
> > > -
> > > -	/* reconfigure to make sure that all active rows are accessible */
> > > -	config->cols =3D 8;
> > > -	config->rows =3D 17;
> > > -	mctl_core_init(para, config);
> > > -
> > > -	/* store data again as it might be moved */
> > > -	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
> > > -
> > > -	mctl_write_pattern();
> > > -
> > > -	/* detect row address bits */
> > > -	shift =3D config->bus_full_width + 4 + config->cols;
> > > -	found =3D 0;
> > > -	for (rows =3D 13; rows < 17; rows++) {
> > > -		if (mctl_check_pattern(1ULL << (rows + shift))) {
> > > -			found =3D 1;
> > > -			break;
> > > -		}
> > > -	}
> > > -	if (!found)
> > > -		panic("DRAM init failed: Can't detect number of rows!");
> > > -	debug("detected %u rows\n", rows);
> > > -
> > > -	/* restore data again */
> > > -	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
> > > -
> > > -	config->cols =3D cols;
> > > -	config->rows =3D rows;
> > > -}
> > > -
> > > -static unsigned long mctl_calc_size(const struct dram_config *config)
> > > -{
> > > -	u8 width =3D config->bus_full_width ? 4 : 2;
> > > -
> > > -	/* 8 banks */
> > > -	return (1ULL << (config->cols + config->rows + 3)) * width * config=
->ranks;
> > > -}
> > > -
> > >  static const struct dram_para para =3D {
> > >  	.clk =3D CONFIG_DRAM_CLK,
> > >  #ifdef CONFIG_SUNXI_DRAM_H616_DDR3_1333 =20
> >=20
> >  =20
>=20
>=20
>=20
>=20
>=20

