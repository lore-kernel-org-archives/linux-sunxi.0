Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65741522A
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 23:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742774280; cv=none; b=hfgcLI/d7Yg8YUl8OnynAYZyy4ObMpne80m0VQZcm6V24Q7MOWpyyRcJP+qfPM6HYbn928EdzvYWlMAL28XTIauAFfaYkSBJd/2IMEhln6AjK6TbjgbD998jBIEvfc/FhmZ/Qde1syNIcs3mYNPN7qyLU5nYrsZ5axFOPWGXkX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742774280; c=relaxed/simple;
	bh=9jlMTLvwesH1zrkn5S2UrXbv1ijrBnPzcW9zHLxt7xs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fcfhfWzOePhpJY+vgTspkJdHVSycgQxXq7MYnB3i5sJ8ADHdaAe4iiwEimUuycUIOoSOi4WNAToLGPIezzHV2ehGD8ZRdfv8ISoKDLhhQ/Wj3G06EBDf0FuHhSIR7T44QNoRD5AVftEl98mdeGnI5zWgZAbGMihTr3gDcGp1lQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E93F8106F;
	Sun, 23 Mar 2025 16:58:03 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E1D83F58B;
	Sun, 23 Mar 2025 16:57:56 -0700 (PDT)
Date: Sun, 23 Mar 2025 23:57:32 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, Mikhail
 Kalashnikov <iuncuim@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 13/34] sunxi: spl: add support for Allwinner A523
 watchdog
Message-ID: <20250323235732.22a203eb@minigeek.lan>
In-Reply-To: <13723892.uLZWGnKmhe@jernej-laptop>
References: <20250323113544.7933-1-andre.przywara@arm.com>
	<20250323113544.7933-14-andre.przywara@arm.com>
	<13723892.uLZWGnKmhe@jernej-laptop>
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

On Sun, 23 Mar 2025 13:15:46 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

> Dne nedelja, 23. marec 2025 ob 12:35:23 Srednjeevropski standardni =C4=8D=
as je Andre Przywara napisal(a):
> > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >=20
> > The watchdog in the Allwinner A523 SoC differs a bit from the one in the
> > previous SoCs: it lives in a separate register frame, so no longer
> > inside some timer device, and it manages to shuffle around some
> > registers a bit.
> >=20
> > Provide a new struct describing the register layout, and adjust the
> > address calculation in the SPL code accoringly. This is guarded by the
> > MACH_SUN55I_A523 Kconfig variable. =20
>=20
> This one is missing SoB, apparently by me :)

Yes, I don't think it's appropriate to add your Signed-off-by, so if
you could give it here.

>=20
> > ---
> >  arch/arm/include/asm/arch-sunxi/watchdog.h | 12 ++++++++++++
> >  arch/arm/mach-sunxi/board.c                |  6 ++++++
> >  2 files changed, 18 insertions(+)
> >=20
> > diff --git a/arch/arm/include/asm/arch-sunxi/watchdog.h b/arch/arm/incl=
ude/asm/arch-sunxi/watchdog.h
> > index 38e2ef2aca3..96d5725141e 100644
> > --- a/arch/arm/include/asm/arch-sunxi/watchdog.h
> > +++ b/arch/arm/include/asm/arch-sunxi/watchdog.h
> > @@ -26,6 +26,18 @@ struct sunxi_wdog {
> >  	u32 res[2];
> >  };
> > =20
> > +#elif defined(CONFIG_MACH_SUN55I_A523)
> > +
> > +struct sunxi_wdog {
> > +	u32 irq_en;		/* 0x00 */
> > +	u32 irq_sta;		/* 0x04 */
> > +	u32 srst;		/* 0x08 */
> > +	u32 ctl;		/* 0x0c */
> > +	u32 cfg;		/* 0x10 */
> > +	u32 mode;		/* 0x14 */
> > +	u32 ocfg;		/* 0x18 */
> > +}; =20
>=20
> Anyway, since you announced battle against C structures for register
> layout, it seems contraproductive to add it here. What do you think?

Well, I am all for it, but I guess that's another refactor patch first,
so please be my guest. I didn't deem this important enough to address
this now (it's not blocking as for the clocks), and this series is
already long enough, so I was just happy to take this working patch.
For development I really like having a working "reset" command ;-)

Cheers,
Andre

>=20
> Best regards,
> Jernej
>=20
> > +
> >  #else
> > =20
> >  #define WDT_CFG_RESET		(0x1)
> > diff --git a/arch/arm/mach-sunxi/board.c b/arch/arm/mach-sunxi/board.c
> > index 701899ee4b2..89aea61e8e8 100644
> > --- a/arch/arm/mach-sunxi/board.c
> > +++ b/arch/arm/mach-sunxi/board.c
> > @@ -495,6 +495,12 @@ void reset_cpu(void)
> >  		/* sun5i sometimes gets stuck without this */
> >  		writel(WDT_MODE_RESET_EN | WDT_MODE_EN, &wdog->mode);
> >  	}
> > +#elif defined(CONFIG_MACH_SUN55I_A523)
> > +	static const struct sunxi_wdog *wdog =3D
> > +		(struct sunxi_wdog *)SUNXI_TIMER_BASE;
> > +
> > +	writel(WDT_CTRL_KEY | WDT_CTRL_RESTART, &wdog->srst);
> > +	while (1) { }
> >  #elif defined(CONFIG_SUNXI_GEN_SUN6I) || defined(CONFIG_SUN50I_GEN_H6)=
 || defined(CONFIG_SUNXI_GEN_NCAT2)
> >  #if defined(CONFIG_MACH_SUN50I_H6)
> >  	/* WDOG is broken for some H6 rev. use the R_WDOG instead */
> >  =20
>=20
>=20
>=20
>=20
>=20

