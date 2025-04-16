Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F541AF0AE
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Apr 2025 16:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744821049; cv=none; b=rNF36yFCcXQN+JhD4N1gahuo9eSf2nojbJlJBchzg3Qn1O/SWyYMOKndK41Rvk++3/QtLWQsDO1TEf06MFqvklxQC6Y74ixtCKaqh238Atn2NXVqkpsRgRi/OQoYwTRFntMVyC/6tI058w4OMXHZd9qWCTrwCFUJ+rJs8OHzs1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744821049; c=relaxed/simple;
	bh=SCb13XGxxzPgNCZcuvUHxJ7yuGiruyaSpXlyqSkYPtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NJKqjUUHEWSnvzemH2xGTJ23+8HiB4wwcTzy1vf0E5uyNmZnYVurYurKFIPiJqZAIzzcQhlq245B+Ic4HEF3F5pkEVSh8A8imq43dYMpRnYA4co0q+ZkVrJEGfuc+7w+tSg+qxh3I/u1YNa+qz+Niih45I2Yb/Xnu+h3JZgN+Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaXv/te9; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QaXv/te9"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38f2f391864so4235836f8f.3
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Apr 2025 09:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744821045; x=1745425845; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKFlAPudsuz5dNBwkEvxa3b1wkVcUwtLBvTINOyLBqA=;
        b=QaXv/te9J5sHUheR0XEHlUoHFyPABQ3uBCPRhA/5SjluFnhm6bNzTdUmU0UCRuP2e1
         vxtyAez6cYHpafmMdLjHFllzaKBEkDI5l5GQ4Kn3rlIMEFYtVRs54I8mAgjRtQ51oaxo
         j+RHHdT3WHCt41fD4w+90PyRnx2jbKpScjvp3e4uJnNlx9JvBm+nGZfvDNBfaI5yGDNn
         2Wq8fzXR5E4vPdu0jTPe8pkfQji6ZCx/4/G6u7E1hFhe6mkTehaVBAEKnPT61fmOcg6d
         z+dcwR1xLVhyTUCc9I7CQ0FAoOKSPc08UhjsLK9nOTiFDzBWdXpyq6HTznxraz1EGGfU
         GBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744821045; x=1745425845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKFlAPudsuz5dNBwkEvxa3b1wkVcUwtLBvTINOyLBqA=;
        b=Ks15O7pVailC2Ln1rnvMHt9b033OImZuPoYxkOs505Wzh/TkbJnnEmcLr8GR0YhlaZ
         1X0NU5QUtEWOi+wsYieeJcwfjcjYl9oiKQFcpcIYnxCXMk3y/4uJmmUNMQHvwUEZcTKi
         1HUClZjMkaE4XfId/SbriBNd5gmluVnDSxS+jc5qeQ8g9OV1vkxueWcWhoYazVwmnTCw
         FX0Mco+L6HSwh1Kz65C3tIshOlr9djIQChk1R26gHgIBcWyLQGmik2/Gg2NnILNZ0pMy
         AlbLFOUjZIzr3AxRvEYIJ8BtKueL78Ww6uhbowAPJCxO7mTkrw41FRzzDp786TfJ8i+A
         wgEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNiY+Y/RydkyCLRhkpYiJGpvgeaqzZOFFcr659/tWj5IDFxZ0bWmxsjhqa9PVYYSO6VmXFXPik8WTiUw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywlp5lHAt1q7WykEpObgmS7RAK1WJZdCr0vFtlR5U5W6kpDYLPq
	VM8oi+Ki1e3QguXkNnq64f8UfQFpNVmnZcbvxC3pC5Ve8S4AfvC5
X-Gm-Gg: ASbGncs/ZILiImKntl3mdNix3S4euZkRy60OCB7A7caaYNfqLoEoGzVbHmCd/BH4dJ4
	ClorbP/+iMiTSCBs02dt4UEXX/xrAgODgNGGkJhUgX4xBbKB1ORQ2b+khKHDP6SY2Myvw8KGVnp
	83tAEBpejLF1k6FiFBbuiH13sfYNBYMLf7v8xYsBU4YeiFqyaF+6xN3YtZ2bU3BFokYmAHzR4oU
	cAigWoOdbTuWe7yQVydkU+b82VzXeRdB8VhxH4w9wymfkvK4TWfwxFfeGRiF8UduzvBru439e8O
	R2nZawvVIV8AI0rIy/XuEWdOXKkMeMbIH+48RawpJZ5SKVVkA9+/OcnpK3CAxIu6+RDrpbfqQj/
	bUcub6JZcioRyElfS
X-Google-Smtp-Source: AGHT+IGB+Xu6HxgWBpW1dknqn4U7Y3tB3nAW4cMTP2KU3IiHERyjLU0FyI5biJKH04XK/toNh2PNGQ==
X-Received: by 2002:a5d:47cc:0:b0:39c:e14:cd70 with SMTP id ffacd0b85a97d-39ee5b37f25mr2677853f8f.34.1744821045059;
        Wed, 16 Apr 2025 09:30:45 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c8263sm26033505e9.4.2025.04.16.09.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 09:30:44 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: jagan@amarulasolutions.com, trini@konsulko.com, macromorgan@hotmail.com,
 uwu@icenowy.me, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 5/5] sunxi: h6/h616: Reuse common DRAM infrastructure
Date: Wed, 16 Apr 2025 18:30:43 +0200
Message-ID: <12645199.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20250416003942.12d13ee4@minigeek.lan>
References:
 <20250411161439.4743-1-jernej.skrabec@gmail.com>
 <20250411161439.4743-6-jernej.skrabec@gmail.com>
 <20250416003942.12d13ee4@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 16. april 2025 ob 01:40:04 Srednjeevropski poletni =C4=8Das je A=
ndre Przywara napisal(a):
> On Fri, 11 Apr 2025 18:14:39 +0200
> Jernej Skrabec <jernej.skrabec@gmail.com> wrote:
>=20
> Hi Jernej,
>=20
> > H616 rank and size detection code is superior to the H6. Nevertheless,
> > they are structurally the same. Split functions from H616 into new file
> > and reuse them in H6 DRAM driver too. This should also fix some bugs for
> > H6 too, like incorrect DRAM size detection.
>=20
> that's a nice patch, but actually breaks on my Pine H64:
>=20
> U-Boot SPL 2025.04-01089-g14694431269f (Apr 15 2025 - 22:55:07 +0100)
> DRAM:DRAM init failed: Can't detect number of columns!
> resetting ...
>=20
> It's none of the previous H6 reworks that causes the problem, but it's
> actually already in the current code somehow: If I apply the equivalent
> of [PATCH 1/5] to the H6 code, it already complains. Replacing the
> panic with a printf() gives me (on mainline):
>=20
> U-Boot SPL 2025.04-01085-g7a43fe97dc86-dirty (Apr 15 2025 - 23:48:42 +010=
0)
> DRAM:detected 14 rows (found=3D1)
> detected 11 columns (found=3D0)
>  2048 MiB
> Trying to boot from FEL
> NOTICE:  BL31: v2.12.0(debug):v2.12.0-724-gf745e004a
>    < continues booting >
>=20
> So it seems like the match failed, but apparently 11 columns are correct =
anyway.
> And since the same happens after this patch, I assume that even the
> newer and better matching routine doesn't change that, unfortunately.
>=20
> The config on this board is: 2 ranks, full width, 11 cols, 14 rows =3D> 2=
GB.
> And that seems to work (in Linux).
> It's a single chip Elpida FA232A2MA JD-F, listed by Micron as
> EDFA232A2MA-JD-F-D, though I couldn't find a datasheet quickly.

Thanks for testing! It looks like it's best just to drop first patch in the
series. 11 columns is for sure valid. Not that sure about 17 rows, but
better leave it as is.

What do you think?

Best regards,
Jernej

>=20
> Cheers,
> Andre
>=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  .../include/asm/arch-sunxi/dram_dw_helpers.h  |  22 +++
> >  arch/arm/mach-sunxi/Makefile                  |   4 +-
> >  arch/arm/mach-sunxi/dram_dw_helpers.c         | 160 ++++++++++++++++++
> >  arch/arm/mach-sunxi/dram_sun50i_h6.c          |  91 +---------
> >  arch/arm/mach-sunxi/dram_sun50i_h616.c        | 155 +----------------
> >  5 files changed, 190 insertions(+), 242 deletions(-)
> >  create mode 100644 arch/arm/include/asm/arch-sunxi/dram_dw_helpers.h
> >  create mode 100644 arch/arm/mach-sunxi/dram_dw_helpers.c
> >=20
> > diff --git a/arch/arm/include/asm/arch-sunxi/dram_dw_helpers.h b/arch/a=
rm/include/asm/arch-sunxi/dram_dw_helpers.h
> > new file mode 100644
> > index 000000000000..bc9e0d868c55
> > --- /dev/null
> > +++ b/arch/arm/include/asm/arch-sunxi/dram_dw_helpers.h
> > @@ -0,0 +1,22 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * Helpers that are commonly used with DW memory controller.
> > + *
> > + * (C) Copyright 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> > + *
> > + */
> > +
> > +#ifndef _DRAM_DW_HELPERS_H
> > +#define _DRAM_DW_HELPERS_H
> > +
> > +#include <asm/arch/dram.h>
> > +
> > +bool mctl_core_init(const struct dram_para *para,
> > +		    const struct dram_config *config);
> > +void mctl_auto_detect_rank_width(const struct dram_para *para,
> > +				 struct dram_config *config);
> > +void mctl_auto_detect_dram_size(const struct dram_para *para,
> > +				struct dram_config *config);
> > +unsigned long mctl_calc_size(const struct dram_config *config);
> > +
> > +#endif
> > diff --git a/arch/arm/mach-sunxi/Makefile b/arch/arm/mach-sunxi/Makefile
> > index eb6a49119a13..a33cd5b0f07a 100644
> > --- a/arch/arm/mach-sunxi/Makefile
> > +++ b/arch/arm/mach-sunxi/Makefile
> > @@ -41,8 +41,8 @@ obj-$(CONFIG_DRAM_SUN9I)	+=3D dram_sun9i.o
> >  obj-$(CONFIG_SPL_SPI_SUNXI)	+=3D spl_spi_sunxi.o
> >  obj-$(CONFIG_SUNXI_DRAM_DW)	+=3D dram_sunxi_dw.o
> >  obj-$(CONFIG_SUNXI_DRAM_DW)	+=3D dram_timings/
> > -obj-$(CONFIG_DRAM_SUN50I_H6)	+=3D dram_sun50i_h6.o
> > +obj-$(CONFIG_DRAM_SUN50I_H6)	+=3D dram_sun50i_h6.o dram_dw_helpers.o
> >  obj-$(CONFIG_DRAM_SUN50I_H6)	+=3D dram_timings/
> > -obj-$(CONFIG_DRAM_SUN50I_H616)	+=3D dram_sun50i_h616.o
> > +obj-$(CONFIG_DRAM_SUN50I_H616)	+=3D dram_sun50i_h616.o dram_dw_helpers=
=2Eo
> >  obj-$(CONFIG_DRAM_SUN50I_H616)	+=3D dram_timings/
> >  endif
> > diff --git a/arch/arm/mach-sunxi/dram_dw_helpers.c b/arch/arm/mach-sunx=
i/dram_dw_helpers.c
> > new file mode 100644
> > index 000000000000..885d1f2c0b12
> > --- /dev/null
> > +++ b/arch/arm/mach-sunxi/dram_dw_helpers.c
> > @@ -0,0 +1,160 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Helpers that are commonly used with DW memory controller.
> > + *
> > + * (C) Copyright 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> > + *
> > + */
> > +
> > +#include <init.h>
> > +#include <asm/arch/dram_dw_helpers.h>
> > +
> > +void mctl_auto_detect_rank_width(const struct dram_para *para,
> > +				 struct dram_config *config)
> > +{
> > +	/* this is minimum size that it's supported */
> > +	config->cols =3D 8;
> > +	config->rows =3D 13;
> > +
> > +	/*
> > +	 * Strategy here is to test most demanding combination first and least
> > +	 * demanding last, otherwise HW might not be fully utilized. For
> > +	 * example, half bus width and rank =3D 1 combination would also work
> > +	 * on HW with full bus width and rank =3D 2, but only 1/4 RAM would be
> > +	 * visible.
> > +	 */
> > +
> > +	debug("testing 32-bit width, rank =3D 2\n");
> > +	config->bus_full_width =3D 1;
> > +	config->ranks =3D 2;
> > +	if (mctl_core_init(para, config))
> > +		return;
> > +
> > +	debug("testing 32-bit width, rank =3D 1\n");
> > +	config->bus_full_width =3D 1;
> > +	config->ranks =3D 1;
> > +	if (mctl_core_init(para, config))
> > +		return;
> > +
> > +	debug("testing 16-bit width, rank =3D 2\n");
> > +	config->bus_full_width =3D 0;
> > +	config->ranks =3D 2;
> > +	if (mctl_core_init(para, config))
> > +		return;
> > +
> > +	debug("testing 16-bit width, rank =3D 1\n");
> > +	config->bus_full_width =3D 0;
> > +	config->ranks =3D 1;
> > +	if (mctl_core_init(para, config))
> > +		return;
> > +
> > +	panic("This DRAM setup is currently not supported.\n");
> > +}
> > +
> > +static void mctl_write_pattern(void)
> > +{
> > +	unsigned int i;
> > +	u32 *ptr, val;
> > +
> > +	ptr =3D (u32 *)CFG_SYS_SDRAM_BASE;
> > +	for (i =3D 0; i < 16; ptr++, i++) {
> > +		if (i & 1)
> > +			val =3D ~(ulong)ptr;
> > +		else
> > +			val =3D (ulong)ptr;
> > +		writel(val, ptr);
> > +	}
> > +}
> > +
> > +static bool mctl_check_pattern(ulong offset)
> > +{
> > +	unsigned int i;
> > +	u32 *ptr, val;
> > +
> > +	ptr =3D (u32 *)CFG_SYS_SDRAM_BASE;
> > +	for (i =3D 0; i < 16; ptr++, i++) {
> > +		if (i & 1)
> > +			val =3D ~(ulong)ptr;
> > +		else
> > +			val =3D (ulong)ptr;
> > +		if (val !=3D *(ptr + offset / 4))
> > +			return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > +void mctl_auto_detect_dram_size(const struct dram_para *para,
> > +				struct dram_config *config)
> > +{
> > +	unsigned int shift, cols, rows, found;
> > +	u32 buffer[16];
> > +
> > +	/* max. config for columns, but not rows */
> > +	config->cols =3D 11;
> > +	config->rows =3D 13;
> > +	mctl_core_init(para, config);
> > +
> > +	/*
> > +	 * Store content so it can be restored later. This is important
> > +	 * if controller was already initialized and holds any data
> > +	 * which is important for restoring system.
> > +	 */
> > +	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
> > +
> > +	mctl_write_pattern();
> > +
> > +	shift =3D config->bus_full_width + 1;
> > +
> > +	/* detect column address bits */
> > +	found =3D 0;
> > +	for (cols =3D 8; cols < 11; cols++) {
> > +		if (mctl_check_pattern(1ULL << (cols + shift))) {
> > +			found =3D 1;
> > +			break;
> > +		}
> > +	}
> > +	if (!found)
> > +		panic("DRAM init failed: Can't detect number of columns!");
> > +	debug("detected %u columns\n", cols);
> > +
> > +	/* restore data */
> > +	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
> > +
> > +	/* reconfigure to make sure that all active rows are accessible */
> > +	config->cols =3D 8;
> > +	config->rows =3D 17;
> > +	mctl_core_init(para, config);
> > +
> > +	/* store data again as it might be moved */
> > +	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
> > +
> > +	mctl_write_pattern();
> > +
> > +	/* detect row address bits */
> > +	shift =3D config->bus_full_width + 4 + config->cols;
> > +	found =3D 0;
> > +	for (rows =3D 13; rows < 17; rows++) {
> > +		if (mctl_check_pattern(1ULL << (rows + shift))) {
> > +			found =3D 1;
> > +			break;
> > +		}
> > +	}
> > +	if (!found)
> > +		panic("DRAM init failed: Can't detect number of rows!");
> > +	debug("detected %u rows\n", rows);
> > +
> > +	/* restore data again */
> > +	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
> > +
> > +	config->cols =3D cols;
> > +	config->rows =3D rows;
> > +}
> > +
> > +unsigned long mctl_calc_size(const struct dram_config *config)
> > +{
> > +	u8 width =3D config->bus_full_width ? 4 : 2;
> > +
> > +	/* 8 banks */
> > +	return (1ULL << (config->cols + config->rows + 3)) * width * config->=
ranks;
> > +}
> > diff --git a/arch/arm/mach-sunxi/dram_sun50i_h6.c b/arch/arm/mach-sunxi=
/dram_sun50i_h6.c
> > index 6a9e53f965eb..fbb865131e08 100644
> > --- a/arch/arm/mach-sunxi/dram_sun50i_h6.c
> > +++ b/arch/arm/mach-sunxi/dram_sun50i_h6.c
> > @@ -10,6 +10,7 @@
> >  #include <asm/io.h>
> >  #include <asm/arch/clock.h>
> >  #include <asm/arch/dram.h>
> > +#include <asm/arch/dram_dw_helpers.h>
> >  #include <asm/arch/cpu.h>
> >  #include <asm/arch/prcm.h>
> >  #include <linux/bitops.h>
> > @@ -40,8 +41,8 @@ static void mctl_com_init(const struct dram_para *par=
a,
> >  static bool mctl_channel_init(const struct dram_para *para,
> >  			      const struct dram_config *config);
> > =20
> > -static bool mctl_core_init(const struct dram_para *para,
> > -			   const struct dram_config *config)
> > +bool mctl_core_init(const struct dram_para *para,
> > +		    const struct dram_config *config)
> >  {
> >  	mctl_sys_init(para->clk);
> >  	mctl_com_init(para, config);
> > @@ -560,92 +561,6 @@ static bool mctl_channel_init(const struct dram_pa=
ra *para,
> >  	return true;
> >  }
> > =20
> > -static void mctl_auto_detect_rank_width(const struct dram_para *para,
> > -					struct dram_config *config)
> > -{
> > -	/* this is minimum size that it's supported */
> > -	config->cols =3D 8;
> > -	config->rows =3D 13;
> > -
> > -	/*
> > -	 * Previous versions of this driver tried to auto detect the rank
> > -	 * and width by looking at controller registers. However this proved
> > -	 * to be not reliable, so this approach here is the more robust
> > -	 * solution. Check the git history for details.
> > -	 *
> > -	 * Strategy here is to test most demanding combination first and least
> > -	 * demanding last, otherwise HW might not be fully utilized. For
> > -	 * example, half bus width and rank =3D 1 combination would also work
> > -	 * on HW with full bus width and rank =3D 2, but only 1/4 RAM would be
> > -	 * visible.
> > -	 */
> > -
> > -	debug("testing 32-bit width, rank =3D 2\n");
> > -	config->bus_full_width =3D 1;
> > -	config->ranks =3D 2;
> > -	if (mctl_core_init(para, config))
> > -		return;
> > -
> > -	debug("testing 32-bit width, rank =3D 1\n");
> > -	config->bus_full_width =3D 1;
> > -	config->ranks =3D 1;
> > -	if (mctl_core_init(para, config))
> > -		return;
> > -
> > -	debug("testing 16-bit width, rank =3D 2\n");
> > -	config->bus_full_width =3D 0;
> > -	config->ranks =3D 2;
> > -	if (mctl_core_init(para, config))
> > -		return;
> > -
> > -	debug("testing 16-bit width, rank =3D 1\n");
> > -	config->bus_full_width =3D 0;
> > -	config->ranks =3D 1;
> > -	if (mctl_core_init(para, config))
> > -		return;
> > -
> > -	panic("This DRAM setup is currently not supported.\n");
> > -}
> > -
> > -static void mctl_auto_detect_dram_size(const struct dram_para *para,
> > -				       struct dram_config *config)
> > -{
> > -	/* TODO: non-(LP)DDR3 */
> > -
> > -	/* detect row address bits */
> > -	config->cols =3D 8;
> > -	config->rows =3D 18;
> > -	mctl_core_init(para, config);
> > -
> > -	for (config->rows =3D 13; config->rows < 18; config->rows++) {
> > -		/* 8 banks, 8 bit per byte and 16/32 bit width */
> > -		if (mctl_mem_matches((1 << (config->rows + config->cols +
> > -					    4 + config->bus_full_width))))
> > -			break;
> > -	}
> > -
> > -	/* detect column address bits */
> > -	config->cols =3D 11;
> > -	mctl_core_init(para, config);
> > -
> > -	for (config->cols =3D 8; config->cols < 11; config->cols++) {
> > -		/* 8 bits per byte and 16/32 bit width */
> > -		if (mctl_mem_matches(1 << (config->cols + 1 +
> > -					   config->bus_full_width)))
> > -			break;
> > -	}
> > -}
> > -
> > -unsigned long mctl_calc_size(const struct dram_config *config)
> > -{
> > -	u8 width =3D config->bus_full_width ? 4 : 2;
> > -
> > -	/* TODO: non-(LP)DDR3 */
> > -
> > -	/* 8 banks */
> > -	return (1ULL << (config->cols + config->rows + 3)) * width * config->=
ranks;
> > -}
> > -
> >  #define SUN50I_H6_LPDDR3_DX_WRITE_DELAYS			\
> >  	{{  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 },	\
> >  	 {  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 },	\
> > diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sun=
xi/dram_sun50i_h616.c
> > index d1768a7e7d3a..80d9de557876 100644
> > --- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
> > +++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> > @@ -17,6 +17,7 @@
> >  #include <asm/io.h>
> >  #include <asm/arch/clock.h>
> >  #include <asm/arch/dram.h>
> > +#include <asm/arch/dram_dw_helpers.h>
> >  #include <asm/arch/cpu.h>
> >  #include <asm/arch/prcm.h>
> >  #include <linux/bitops.h>
> > @@ -1310,164 +1311,14 @@ static bool mctl_ctrl_init(const struct dram_p=
ara *para,
> >  	return true;
> >  }
> > =20
> > -static bool mctl_core_init(const struct dram_para *para,
> > -			   const struct dram_config *config)
> > +bool mctl_core_init(const struct dram_para *para,
> > +		    const struct dram_config *config)
> >  {
> >  	mctl_sys_init(para->clk);
> > =20
> >  	return mctl_ctrl_init(para, config);
> >  }
> > =20
> > -static void mctl_auto_detect_rank_width(const struct dram_para *para,
> > -					struct dram_config *config)
> > -{
> > -	/* this is minimum size that it's supported */
> > -	config->cols =3D 8;
> > -	config->rows =3D 13;
> > -
> > -	/*
> > -	 * Strategy here is to test most demanding combination first and least
> > -	 * demanding last, otherwise HW might not be fully utilized. For
> > -	 * example, half bus width and rank =3D 1 combination would also work
> > -	 * on HW with full bus width and rank =3D 2, but only 1/4 RAM would be
> > -	 * visible.
> > -	 */
> > -
> > -	debug("testing 32-bit width, rank =3D 2\n");
> > -	config->bus_full_width =3D 1;
> > -	config->ranks =3D 2;
> > -	if (mctl_core_init(para, config))
> > -		return;
> > -
> > -	debug("testing 32-bit width, rank =3D 1\n");
> > -	config->bus_full_width =3D 1;
> > -	config->ranks =3D 1;
> > -	if (mctl_core_init(para, config))
> > -		return;
> > -
> > -	debug("testing 16-bit width, rank =3D 2\n");
> > -	config->bus_full_width =3D 0;
> > -	config->ranks =3D 2;
> > -	if (mctl_core_init(para, config))
> > -		return;
> > -
> > -	debug("testing 16-bit width, rank =3D 1\n");
> > -	config->bus_full_width =3D 0;
> > -	config->ranks =3D 1;
> > -	if (mctl_core_init(para, config))
> > -		return;
> > -
> > -	panic("This DRAM setup is currently not supported.\n");
> > -}
> > -
> > -static void mctl_write_pattern(void)
> > -{
> > -	unsigned int i;
> > -	u32 *ptr, val;
> > -
> > -	ptr =3D (u32 *)CFG_SYS_SDRAM_BASE;
> > -	for (i =3D 0; i < 16; ptr++, i++) {
> > -		if (i & 1)
> > -			val =3D ~(ulong)ptr;
> > -		else
> > -			val =3D (ulong)ptr;
> > -		writel(val, ptr);
> > -	}
> > -}
> > -
> > -static bool mctl_check_pattern(ulong offset)
> > -{
> > -	unsigned int i;
> > -	u32 *ptr, val;
> > -
> > -	ptr =3D (u32 *)CFG_SYS_SDRAM_BASE;
> > -	for (i =3D 0; i < 16; ptr++, i++) {
> > -		if (i & 1)
> > -			val =3D ~(ulong)ptr;
> > -		else
> > -			val =3D (ulong)ptr;
> > -		if (val !=3D *(ptr + offset / 4))
> > -			return false;
> > -	}
> > -
> > -	return true;
> > -}
> > -
> > -static void mctl_auto_detect_dram_size(const struct dram_para *para,
> > -				       struct dram_config *config)
> > -{
> > -	unsigned int shift, cols, rows, found;
> > -	u32 buffer[16];
> > -
> > -	/* max. config for columns, but not rows */
> > -	config->cols =3D 11;
> > -	config->rows =3D 13;
> > -	mctl_core_init(para, config);
> > -
> > -	/*
> > -	 * Store content so it can be restored later. This is important
> > -	 * if controller was already initialized and holds any data
> > -	 * which is important for restoring system.
> > -	 */
> > -	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
> > -
> > -	mctl_write_pattern();
> > -
> > -	shift =3D config->bus_full_width + 1;
> > -
> > -	/* detect column address bits */
> > -	found =3D 0;
> > -	for (cols =3D 8; cols < 11; cols++) {
> > -		if (mctl_check_pattern(1ULL << (cols + shift))) {
> > -			found =3D 1;
> > -			break;
> > -		}
> > -	}
> > -	if (!found)
> > -		panic("DRAM init failed: Can't detect number of columns!");
> > -	debug("detected %u columns\n", cols);
> > -
> > -	/* restore data */
> > -	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
> > -
> > -	/* reconfigure to make sure that all active rows are accessible */
> > -	config->cols =3D 8;
> > -	config->rows =3D 17;
> > -	mctl_core_init(para, config);
> > -
> > -	/* store data again as it might be moved */
> > -	memcpy(buffer, (u32 *)CFG_SYS_SDRAM_BASE, sizeof(buffer));
> > -
> > -	mctl_write_pattern();
> > -
> > -	/* detect row address bits */
> > -	shift =3D config->bus_full_width + 4 + config->cols;
> > -	found =3D 0;
> > -	for (rows =3D 13; rows < 17; rows++) {
> > -		if (mctl_check_pattern(1ULL << (rows + shift))) {
> > -			found =3D 1;
> > -			break;
> > -		}
> > -	}
> > -	if (!found)
> > -		panic("DRAM init failed: Can't detect number of rows!");
> > -	debug("detected %u rows\n", rows);
> > -
> > -	/* restore data again */
> > -	memcpy((u32 *)CFG_SYS_SDRAM_BASE, buffer, sizeof(buffer));
> > -
> > -	config->cols =3D cols;
> > -	config->rows =3D rows;
> > -}
> > -
> > -static unsigned long mctl_calc_size(const struct dram_config *config)
> > -{
> > -	u8 width =3D config->bus_full_width ? 4 : 2;
> > -
> > -	/* 8 banks */
> > -	return (1ULL << (config->cols + config->rows + 3)) * width * config->=
ranks;
> > -}
> > -
> >  static const struct dram_para para =3D {
> >  	.clk =3D CONFIG_DRAM_CLK,
> >  #ifdef CONFIG_SUNXI_DRAM_H616_DDR3_1333
>=20
>=20




