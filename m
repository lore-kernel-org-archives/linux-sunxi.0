Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD0D1D549
	for <linux-sunxi@lists.linux.dev>; Tue, 31 Oct 2023 11:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 772BBC15;
	Tue, 31 Oct 2023 04:55:29 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78D573F64C;
	Tue, 31 Oct 2023 04:54:46 -0700 (PDT)
Date: Tue, 31 Oct 2023 11:54:40 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: "Jaehoon Chung" <jh80.chung@samsung.com>
Cc: 'Jernej =?UTF-8?B?xaBrcmFiZWMn?= <jernej.skrabec@gmail.com>, "'Jagan
 Teki'" <jagan@amarulasolutions.com>, "'Samuel Holland'"
 <samuel@sholland.org>, "'SASANO	Takayoshi'" <uaa@mx5.nisiq.net>, "'Mikhail
 Kalashnikov'" <iuncuim@gmail.com>, "'Piotr Oniszczuk'"
 <piotr.oniszczuk@gmail.com>, <u-boot@lists.denx.de>,
 <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 1/3] sunxi: board: simplify early PMIC setup conditions
Message-ID: <20231031115428.0e9edf56@donnerap.manchester.arm.com>
In-Reply-To: <004e01da0bc5$7a210c60$6e632520$@samsung.com>
References: <20231018155014.383566-1-andre.przywara@arm.com>
	<20231018155014.383566-2-andre.przywara@arm.com>
	<1965267.usQuhbGJ8B@archlinux>
	<CGME20231021212022epcas1p1f34ed4f9c235d0e8aaace738f009feaf@epcas1p1.samsung.com>
	<20231021221911.16a6a145@slackpad.lan>
	<004e01da0bc5$7a210c60$6e632520$@samsung.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 31 Oct 2023 15:42:54 +0900
"Jaehoon Chung" <jh80.chung@samsung.com> wrote:

Hi Jaehoon,

> Hi,
>=20
> > -----Original Message-----
> > From: Andre Przywara <andre.przywara@arm.com>
> > Sent: Sunday, October 22, 2023 6:19 AM
> > To: Jernej =C5=A0krabec <jernej.skrabec@gmail.com>
> > Cc: Jagan Teki <jagan@amarulasolutions.com>; Jaehoon Chung <jh80.chung@=
samsung.com>; Samuel Holland
> > <samuel@sholland.org>; SASANO Takayoshi <uaa@mx5.nisiq.net>; Mikhail Ka=
lashnikov <iuncuim@gmail.com>;
> > Piotr Oniszczuk <piotr.oniszczuk@gmail.com>; u-boot@lists.denx.de; linu=
x-sunxi@lists.linux.dev
> > Subject: Re: [PATCH 1/3] sunxi: board: simplify early PMIC setup condit=
ions
> >=20
> > On Sat, 21 Oct 2023 08:34:06 +0200
> > Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
> >  =20
> > > On Wednesday, October 18, 2023 5:50:12 PM CEST Andre Przywara wrote: =
=20
> > > > So far we have a convoluted #ifdef mesh that guards the early AXP P=
MIC
> > > > setup in board.c. That combination of &&, || and negations is very =
hard
> > > > to read, maintain and especially to extend.
> > > >
> > > > Fortunately we have those same conditions already modelled in the
> > > > Kconfig file, so they are actually redundant. On top of that the re=
al
> > > > reason we have those preprocessor guards in the first place is abou=
t the
> > > > symbols that are *conditionally* defined: without #ifdefs the build
> > > > would break because of them being undefined for many boards.
> > > >
> > > > To simplify this, just change the guards to actually look at the sy=
mbols
> > > > needed, so CONFIG_AXP_xxx_VOLT instead of CONFIG_AXPyyy_POWER.
> > > > This drastically improves the readability of this code, and makes a=
dding
> > > > PMIC support a pure Kconfig matter.
> > > >
> > > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > > ---
> > > >  board/sunxi/board.c   | 32 ++++++++++++++------------------
> > > >  drivers/power/Kconfig |  2 +-
> > > >  2 files changed, 15 insertions(+), 19 deletions(-)
> > > >
> > > > diff --git a/board/sunxi/board.c b/board/sunxi/board.c
> > > > index ebaa9431984..65d79a02c25 100644
> > > > --- a/board/sunxi/board.c
> > > > +++ b/board/sunxi/board.c
> > > > @@ -597,50 +597,46 @@ void sunxi_board_init(void)
> > > >  		}
> > > >  	}
> > > >
> > > > -#if defined CONFIG_AXP221_POWER || defined CONFIG_AXP809_POWER || \
> > > > -	defined CONFIG_AXP818_POWER
> > > > +#ifdef CONFIG_AXP_DCDC1_VOLT
> > > >  	power_failed |=3D axp_set_dcdc1(CONFIG_AXP_DCDC1_VOLT);
> > > > +	power_failed |=3D axp_set_dcdc5(CONFIG_AXP_DCDC5_VOLT);
> > > >  #endif
> > > > -#if !defined(CONFIG_AXP305_POWER)
> > > > +#ifdef CONFIG_AXP_DCDC2_VOLT
> > > >  	power_failed |=3D axp_set_dcdc2(CONFIG_AXP_DCDC2_VOLT);
> > > >  	power_failed |=3D axp_set_dcdc3(CONFIG_AXP_DCDC3_VOLT);
> > > >  #endif
> > > > -#if !defined(CONFIG_AXP209_POWER) && !defined(CONFIG_AXP818_POWER)
> > > > +#ifdef CONFIG_AXP_DCDC4_VOLT
> > > >  	power_failed |=3D axp_set_dcdc4(CONFIG_AXP_DCDC4_VOLT);
> > > >  #endif
> > > > -#if defined CONFIG_AXP221_POWER || defined CONFIG_AXP809_POWER || \
> > > > -	defined CONFIG_AXP818_POWER
> > > > -	power_failed |=3D axp_set_dcdc5(CONFIG_AXP_DCDC5_VOLT);
> > > > -#endif
> > > >
> > > > -#if defined CONFIG_AXP221_POWER || defined CONFIG_AXP809_POWER || \
> > > > -	defined CONFIG_AXP818_POWER
> > > > +#ifdef CONFIG_AXP_ALDO1_VOLT
> > > >  	power_failed |=3D axp_set_aldo1(CONFIG_AXP_ALDO1_VOLT);
> > > >  #endif
> > > > -#if !defined(CONFIG_AXP305_POWER)
> > > > +#ifdef CONFIG_AXP_ALDO2_VOLT
> > > >  	power_failed |=3D axp_set_aldo2(CONFIG_AXP_ALDO2_VOLT);
> > > >  #endif
> > > > -#if !defined(CONFIG_AXP152_POWER) && !defined(CONFIG_AXP305_POWER)
> > > > +#ifdef CONFIG_AXP_ALDO3_VOLT
> > > >  	power_failed |=3D axp_set_aldo3(CONFIG_AXP_ALDO3_VOLT);
> > > >  #endif
> > > > -#ifdef CONFIG_AXP209_POWER
> > > > +#ifdef CONFIG_AXP_ALDO4_VOLT
> > > >  	power_failed |=3D axp_set_aldo4(CONFIG_AXP_ALDO4_VOLT);
> > > >  #endif
> > > >
> > > > -#if defined(CONFIG_AXP221_POWER) || defined(CONFIG_AXP809_POWER) |=
| \
> > > > -	defined(CONFIG_AXP818_POWER)
> > > > +#ifdef CONFIG_AXP_DLDO1_VOLT
> > > >  	power_failed |=3D axp_set_dldo(1, CONFIG_AXP_DLDO1_VOLT);
> > > >  	power_failed |=3D axp_set_dldo(2, CONFIG_AXP_DLDO2_VOLT);
> > > > -#if !defined CONFIG_AXP809_POWER
> > > > +#endif
> > > > +#ifdef CONFIG_AXP_DLDO3_VOLT
> > > >  	power_failed |=3D axp_set_dldo(3, CONFIG_AXP_DLDO3_VOLT);
> > > >  	power_failed |=3D axp_set_dldo(4, CONFIG_AXP_DLDO4_VOLT);
> > > >  #endif
> > > > +#ifdef CONFIG_AXP_ELDO1_VOLT
> > > >  	power_failed |=3D axp_set_eldo(1, CONFIG_AXP_ELDO1_VOLT);
> > > >  	power_failed |=3D axp_set_eldo(2, CONFIG_AXP_ELDO2_VOLT);
> > > >  	power_failed |=3D axp_set_eldo(3, CONFIG_AXP_ELDO3_VOLT);
> > > >  #endif
> > > >
> > > > -#ifdef CONFIG_AXP818_POWER
> > > > +#ifdef CONFIG_AXP_FLDO1_VOLT
> > > >  	power_failed |=3D axp_set_fldo(1, CONFIG_AXP_FLDO1_VOLT);
> > > >  	power_failed |=3D axp_set_fldo(2, CONFIG_AXP_FLDO2_VOLT);
> > > >  	power_failed |=3D axp_set_fldo(3, CONFIG_AXP_FLDO3_VOLT);
> > > > @@ -649,7 +645,7 @@ void sunxi_board_init(void)
> > > >  #if defined CONFIG_AXP809_POWER || defined CONFIG_AXP818_POWER
> > > >  	power_failed |=3D axp_set_sw(IS_ENABLED(CONFIG_AXP_SW_ON));
> > > >  #endif
> > > > -#endif
> > > > +#endif	/* CONFIG_AXPxxx_POWER */
> > > >  	printf("DRAM:");
> > > >  	gd->ram_size =3D sunxi_dram_init();
> > > >  	printf(" %d MiB\n", (int)(gd->ram_size >> 20));
> > > > diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
> > > > index 7f3b990d231..83cb31c937a 100644
> > > > --- a/drivers/power/Kconfig
> > > > +++ b/drivers/power/Kconfig
> > > > @@ -180,7 +180,7 @@ config AXP_DCDC3_VOLT
> > > >
> > > >  config AXP_DCDC4_VOLT
> > > >  	int "axp pmic dcdc4 voltage"
> > > > -	depends on AXP152_POWER || AXP221_POWER || AXP809_POWER || =20
> > > AXP818_POWER || =20
> > > > AXP305_POWER +	depends on AXP152_POWER || AXP221_POWER || AXP809_PO=
WER =20
> > > || =20
> > > > AXP305_POWER default 1250 if AXP152_POWER
> > > >  	default 1200 if MACH_SUN6I
> > > >  	default 0 if MACH_SUN8I =20
> > >
> > > This patch is great, but this last change doesn't seem to be directly
> > > connected? =20
> >=20
> > It is an existing bug: there is no axp_set_dcdc4() for the AXP818, but
> > since the AXP818 is not included in the guards at the calling site
> > in board.c above, we didn't notice.
> > So without this change, all A83T boards (the only ones using AXP818)
> > would fail compilation.
> > I just forgot to mention it in the commit message, will add it. =20
>=20
> Will you resend this patch after updating the commit message?

Well, I was actually thinking of merging it straight away (with the
updated commit message), since I think that plus a tiny typo were the only
changes requested in that series.
Unless there is more from your side?

Cheers,
Andre
