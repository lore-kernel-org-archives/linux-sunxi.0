Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913E9408E0
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Jun 2023 21:15:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30AABAB6;
	Fri,  9 Jun 2023 14:16:17 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FB423F663;
	Fri,  9 Jun 2023 14:15:29 -0700 (PDT)
Date: Fri, 9 Jun 2023 22:15:01 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, Mikhail Kalashnikov
 <iuncuim@gmail.com>, Samuel Holland <samuel@sholland.org>, Icenowy Zheng
 <uwu@icenowy.me>, Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 u-boot@lists.denx.de, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 5/5] sunxi: H616: add LPDDR3 DRAM support
Message-ID: <20230609221501.2e9a4ded@slackpad.lan>
In-Reply-To: <10288401.nUPlyArG6x@jernej-laptop>
References: <20230607000745.10245-1-andre.przywara@arm.com>
	<20230607000745.10245-6-andre.przywara@arm.com>
	<10288401.nUPlyArG6x@jernej-laptop>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 09 Jun 2023 22:38:38 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

> Dne sreda, 07. junij 2023 ob 02:07:45 CEST je Andre Przywara napisal(a):
> > From: iuncuim <iuncuim@gmail.com>
> >=20
> > The H616 SoC has support for several types of DRAM: DDR3, LPDDR3,
> > DDR4 and LPDDR4.
> > At the moment, the driver only supports DDR3 memory.
> > Let's extend the driver to support the LPDDR3 memory. All "magic"
> > values obtained from the boot0.
> > ---
> >  arch/arm/mach-sunxi/Kconfig                   |   8 +
> >  arch/arm/mach-sunxi/dram_sun50i_h616.c        | 193 +++++++++++++-----
> >  arch/arm/mach-sunxi/dram_timings/Makefile     |   1 +
> >  .../arm/mach-sunxi/dram_timings/h616_lpddr3.c |  95 +++++++++
> >  4 files changed, 242 insertions(+), 55 deletions(-)
> >  create mode 100644 arch/arm/mach-sunxi/dram_timings/h616_lpddr3.c
> >=20
> > diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
> > index 197d77ea658..5ce82a955c6 100644
> > --- a/arch/arm/mach-sunxi/Kconfig
> > +++ b/arch/arm/mach-sunxi/Kconfig
> > @@ -487,6 +487,14 @@ config SUNXI_DRAM_H6_DDR3_1333
> >  	This option is the DDR3 timing used by the boot0 on H6 TV boxes
> >  	which use a DDR3-1333 timing.
> > =20
> > +config SUNXI_DRAM_H616_LPDDR3
> > +	bool "LPDDR3 DRAM chips on the H616 DRAM controller"
> > +	select SUNXI_DRAM_LPDDR3
> > +	depends on DRAM_SUN50I_H616
> > +	---help---
> > +	This option is the LPDDR3 timing used by the stock boot0 by
> > +	Allwinner.
> > +
> >  config SUNXI_DRAM_H616_DDR3_1333
> >  	bool "DDR3-1333 boot0 timings on the H616 DRAM controller"
> >  	select SUNXI_DRAM_DDR3
> > diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sun=
xi/dram_sun50i_h616.c
> > index 4e988cebf59..082746ea7f3 100644
> > --- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
> > +++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> > @@ -228,10 +228,17 @@ static void mctl_set_addrmap(const struct dram_co=
nfig *config)
> >  }
> > =20
> >  static const u8 phy_init[] =3D {
> > +#ifdef CONFIG_SUNXI_DRAM_H616_DDR3_1333
> >  	0x07, 0x0b, 0x02, 0x16, 0x0d, 0x0e, 0x14, 0x19,
> >  	0x0a, 0x15, 0x03, 0x13, 0x04, 0x0c, 0x10, 0x06,
> >  	0x0f, 0x11, 0x1a, 0x01, 0x12, 0x17, 0x00, 0x08,
> >  	0x09, 0x05, 0x18
> > +#elif defined(CONFIG_SUNXI_DRAM_H616_LPDDR3)
> > +	0x18, 0x06, 0x00, 0x05, 0x04, 0x03, 0x09, 0x02,
> > +	0x08, 0x01, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
> > +	0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x07,
> > +	0x17, 0x19, 0x1a
> > +#endif
> >  };
> > =20
> >  static void mctl_phy_configure_odt(const struct dram_para *para)
> > @@ -263,19 +270,31 @@ static void mctl_phy_configure_odt(const struct d=
ram_para *para)
> >  	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x34c);
> > =20
> >  	val =3D para->dx_odt & 0x1f;
> > -	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x380);
> > +	if (para->type =3D=3D SUNXI_DRAM_TYPE_LPDDR3)
> > +		writel_relaxed(0, SUNXI_DRAM_PHY0_BASE + 0x380);
> > +	else
> > +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x380);
> >  	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x384);
> > =20
> >  	val =3D (para->dx_odt >> 8) & 0x1f;
> > -	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x3c0);
> > +	if (para->type =3D=3D SUNXI_DRAM_TYPE_LPDDR3)
> > +		writel_relaxed(0, SUNXI_DRAM_PHY0_BASE + 0x3c0);
> > +	else
> > +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x3c0);
> >  	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x3c4);
> > =20
> >  	val =3D (para->dx_odt >> 16) & 0x1f;
> > -	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x400);
> > +	if (para->type =3D=3D SUNXI_DRAM_TYPE_LPDDR3)
> > +		writel_relaxed(0, SUNXI_DRAM_PHY0_BASE + 0x400);
> > +	else
> > +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x400);
> >  	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x404);
> > =20
> >  	val =3D (para->dx_odt >> 24) & 0x1f;
> > -	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x440);
> > +	if (para->type =3D=3D SUNXI_DRAM_TYPE_LPDDR3)
> > +		writel_relaxed(0, SUNXI_DRAM_PHY0_BASE + 0x440);
> > +	else
> > +		writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x440);
> >  	writel_relaxed(val, SUNXI_DRAM_PHY0_BASE + 0x444); =20
>=20
> Above dx_odt oriented changes are not needed. They depend on Kconfig symb=
ol,
> which can simply be set to 0.

Ha, I thought so as well, but if you look closely, it's only *one* of
the two writes which turn to zero, the other register stays at the
Kconfig value. Annoying, I know ;-)
I couldn't think of a shorter or even cleaner way to express this,
really, apart from a macro maybe, so I guess we have to live with it.

Cheers,
Andre


> I didn't do detailed check, but if it works, it should be ok. Were calcul=
ated
> values here compared to vendor driver?
>=20
> Best regards,
> Jernej
>=20
> > =20
> >  	dmb();
> > @@ -794,31 +813,47 @@ static void mctl_phy_ca_bit_delay_compensation(co=
nst struct dram_para *para,
> >  	writel(val, SUNXI_DRAM_PHY0_BASE + 0x7e0);
> >  	writel(val, SUNXI_DRAM_PHY0_BASE + 0x7f4);
> > =20
> > -	/* following configuration is DDR3 specific */
> > -	val =3D (para->tpr10 >> 7) & 0x1e;
> > -	if (para->tpr2 & 1) {
> > -		writel(val, SUNXI_DRAM_PHY0_BASE + 0x794);
> > -		if (config->ranks =3D=3D 2) {
> > -			val =3D (para->tpr10 >> 11) & 0x1e;
> > -			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7e4);
> > -		}
> > -		if (para->tpr0 & BIT(31)) {
> > -			val =3D (para->tpr0 << 1) & 0x3e;
> > -			writel(val, SUNXI_DRAM_PHY0_BASE + 0x790);
> > -			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7b8);
> > -			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7cc);
> > -		}
> > -	} else {
> > -		writel(val, SUNXI_DRAM_PHY0_BASE + 0x7d4);
> > -		if (config->ranks =3D=3D 2) {
> > -			val =3D (para->tpr10 >> 11) & 0x1e;
> > -			writel(val, SUNXI_DRAM_PHY0_BASE + 0x79c);
> > +	if (para->type =3D=3D SUNXI_DRAM_TYPE_DDR3) {
> > +		val =3D (para->tpr10 >> 7) & 0x1e;
> > +		if (para->tpr2 & 1) {
> > +			writel(val, SUNXI_DRAM_PHY0_BASE + 0x794);
> > +			if (config->ranks =3D=3D 2) {
> > +				val =3D (para->tpr10 >> 11) & 0x1e;
> > +				writel(val, SUNXI_DRAM_PHY0_BASE + 0x7e4);
> > +			}
> > +			if (para->tpr0 & BIT(31)) {
> > +				val =3D (para->tpr0 << 1) & 0x3e;
> > +				writel(val, SUNXI_DRAM_PHY0_BASE + 0x790);
> > +				writel(val, SUNXI_DRAM_PHY0_BASE + 0x7b8);
> > +				writel(val, SUNXI_DRAM_PHY0_BASE + 0x7cc);
> > +			}
> > +		} else {
> > +			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7d4);
> > +			if (config->ranks =3D=3D 2) {
> > +				val =3D (para->tpr10 >> 11) & 0x1e;
> > +				writel(val, SUNXI_DRAM_PHY0_BASE + 0x79c);
> > +			}
> > +			if (para->tpr0 & BIT(31)) {
> > +				val =3D (para->tpr0 << 1) & 0x3e;
> > +				writel(val, SUNXI_DRAM_PHY0_BASE + 0x78c);
> > +				writel(val, SUNXI_DRAM_PHY0_BASE + 0x7a4);
> > +				writel(val, SUNXI_DRAM_PHY0_BASE + 0x7b8);
> > +			}
> >  		}
> > -		if (para->tpr0 & BIT(31)) {
> > -			val =3D (para->tpr0 << 1) & 0x3e;
> > -			writel(val, SUNXI_DRAM_PHY0_BASE + 0x78c);
> > -			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7a4);
> > -			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7b8);
> > +	} else if (para->type =3D=3D SUNXI_DRAM_TYPE_LPDDR3) {
> > +		val =3D (para->tpr10 >> 7) & 0x1e;
> > +		if (para->tpr2 & 1) {
> > +			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7a0);
> > +			if (config->ranks =3D=3D 2) {
> > +				val =3D (para->tpr10 >> 11) & 0x1e;
> > +				writel(val, SUNXI_DRAM_PHY0_BASE + 0x79c);
> > +			}
> > +		} else {
> > +			writel(val, SUNXI_DRAM_PHY0_BASE + 0x7e8);
> > +			if (config->ranks =3D=3D 2) {
> > +				val =3D (para->tpr10 >> 11) & 0x1e;
> > +				writel(val, SUNXI_DRAM_PHY0_BASE + 0x7f8);
> > +			}
> >  		}
> >  	}
> >  }
> > @@ -840,11 +875,22 @@ static bool mctl_phy_init(const struct dram_para =
*para,
> >  	clrsetbits_le32(SUNXI_DRAM_PHY0_BASE + 0x3c, 0xf, val);
> > =20
> >  	if (para->tpr2 & 0x100) {
> > -		val =3D 9;
> > -		val2 =3D 7;
> > +		if (para->type =3D=3D SUNXI_DRAM_TYPE_DDR3) {
> > +			val =3D 9;
> > +			val2 =3D 7;
> > +		} else if (para->type =3D=3D SUNXI_DRAM_TYPE_LPDDR3) {
> > +			// TODO: untested setup: use some values for now =20
>=20
> I'm not fan of such todos.
>=20
> > +			val =3D 14;
> > +			val2 =3D 8;
> > +		}
> >  	} else {
> > -		val =3D 13;
> > -		val2 =3D 9;
> > +		if (para->type =3D=3D SUNXI_DRAM_TYPE_DDR3) {
> > +			val =3D 13;
> > +			val2 =3D 9;
> > +		} else if (para->type =3D=3D SUNXI_DRAM_TYPE_LPDDR3) {
> > +			val =3D 14;
> > +			val2 =3D 8;
> > +		}
> >  	}
> > =20
> >  	writel(val, SUNXI_DRAM_PHY0_BASE + 0x14);
> > @@ -869,12 +915,20 @@ static bool mctl_phy_init(const struct dram_para =
*para,
> >  	if (para->tpr10 & TPR10_CA_BIT_DELAY)
> >  		mctl_phy_ca_bit_delay_compensation(para, config);
> > =20
> > -	writel(0x80, SUNXI_DRAM_PHY0_BASE + 0x3dc);
> > -	writel(0x80, SUNXI_DRAM_PHY0_BASE + 0x45c);
> > +	if (para->type =3D=3D SUNXI_DRAM_TYPE_DDR3)
> > +		val =3D 0x80;
> > +	else if (para->type =3D=3D SUNXI_DRAM_TYPE_LPDDR3)
> > +		val =3D 0xc0;
> > +	writel(val, SUNXI_DRAM_PHY0_BASE + 0x3dc);
> > +	writel(val, SUNXI_DRAM_PHY0_BASE + 0x45c);
> > =20
> >  	mctl_phy_configure_odt(para);
> > =20
> > -	clrsetbits_le32(SUNXI_DRAM_PHY0_BASE + 4, 7, 0xa);
> > +	if (para->type =3D=3D SUNXI_DRAM_TYPE_DDR3) {
> > +		clrsetbits_le32(SUNXI_DRAM_PHY0_BASE + 4, 7, 0xa);
> > +	} else if (para->type =3D=3D SUNXI_DRAM_TYPE_LPDDR3) {
> > +		clrsetbits_le32(SUNXI_DRAM_PHY0_BASE + 4, 7, 0xb);
> > +	} =20
>=20
> To be consistent code style wise, above block could be rewritten to set v=
al
> variable to either 0xa or 0xb and set block after that.
>=20
> > =20
> >  	if (para->clk <=3D 672)
> >  		writel(0xf, SUNXI_DRAM_PHY0_BASE + 0x20);
> > @@ -924,21 +978,39 @@ static bool mctl_phy_init(const struct dram_para =
*para,
> >  		mr2 =3D 0x20;
> >  	}
> > =20
> > -	writel(mr0, &mctl_ctl->mrctrl1);
> > -	writel(0x80000030, &mctl_ctl->mrctrl0);
> > -	mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > -
> > -	writel(4, &mctl_ctl->mrctrl1);
> > -	writel(0x80001030, &mctl_ctl->mrctrl0);
> > -	mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > -
> > -	writel(mr2, &mctl_ctl->mrctrl1);
> > -	writel(0x80002030, &mctl_ctl->mrctrl0);
> > -	mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > -
> > -	writel(0, &mctl_ctl->mrctrl1);
> > -	writel(0x80003030, &mctl_ctl->mrctrl0);
> > -	mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > +	if (para->type =3D=3D SUNXI_DRAM_TYPE_DDR3) {
> > +		writel(mr0, &mctl_ctl->mrctrl1);
> > +		writel(0x80000030, &mctl_ctl->mrctrl0);
> > +		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > +
> > +		writel(4, &mctl_ctl->mrctrl1);
> > +		writel(0x80001030, &mctl_ctl->mrctrl0);
> > +		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > +
> > +		writel(mr2, &mctl_ctl->mrctrl1);
> > +		writel(0x80002030, &mctl_ctl->mrctrl0);
> > +		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > +
> > +		writel(0, &mctl_ctl->mrctrl1);
> > +		writel(0x80003030, &mctl_ctl->mrctrl0);
> > +		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > +	} else if (para->type =3D=3D SUNXI_DRAM_TYPE_LPDDR3) {
> > +		writel(mr0, &mctl_ctl->mrctrl1);
> > +		writel(0x800000f0, &mctl_ctl->mrctrl0);
> > +		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > +
> > +		writel(4, &mctl_ctl->mrctrl1);
> > +		writel(0x800000f0, &mctl_ctl->mrctrl0);
> > +		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > +
> > +		writel(mr2, &mctl_ctl->mrctrl1);
> > +		writel(0x800000f0, &mctl_ctl->mrctrl0);
> > +		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > +
> > +		writel(0x301, &mctl_ctl->mrctrl1);
> > +		writel(0x800000f0, &mctl_ctl->mrctrl0);
> > +		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > +	}
> > =20
> >  	writel(0, SUNXI_DRAM_PHY0_BASE + 0x54);
> > =20
> > @@ -1014,7 +1086,10 @@ static bool mctl_ctrl_init(const struct dram_par=
a *para,
> >  	setbits_le32(&mctl_com->unk_0x008, 0xff00);
> > =20
> >  	reg_val =3D MSTR_BURST_LENGTH(8) | MSTR_ACTIVE_RANKS(config->ranks);
> > -	reg_val |=3D MSTR_DEVICETYPE_DDR3 | MSTR_2TMODE;
> > +	if (para->type =3D=3D SUNXI_DRAM_TYPE_DDR3)
> > +		reg_val |=3D MSTR_DEVICETYPE_DDR3 | MSTR_2TMODE;
> > +	else if (para->type =3D=3D SUNXI_DRAM_TYPE_LPDDR3)
> > +		reg_val |=3D MSTR_DEVICETYPE_LPDDR3;
> >  	if (config->bus_full_width)
> >  		reg_val |=3D MSTR_BUSWIDTH_FULL;
> >  	else
> > @@ -1026,10 +1101,14 @@ static bool mctl_ctrl_init(const struct dram_pa=
ra *para,
> >  	else
> >  		writel(0x0201, &mctl_ctl->odtmap);
> > =20
> > -	writel(0x06000400, &mctl_ctl->odtcfg);
> > -	writel(0x06000400, &mctl_ctl->unk_0x2240);
> > -	writel(0x06000400, &mctl_ctl->unk_0x3240);
> > -	writel(0x06000400, &mctl_ctl->unk_0x4240);
> > +	if (para->type =3D=3D SUNXI_DRAM_TYPE_DDR3)
> > +		reg_val =3D 0x06000400;
> > +	else if (para->type =3D=3D SUNXI_DRAM_TYPE_LPDDR3)
> > +		reg_val =3D 0x09020400;
> > +	writel(reg_val, &mctl_ctl->odtcfg);
> > +	writel(reg_val, &mctl_ctl->unk_0x2240);
> > +	writel(reg_val, &mctl_ctl->unk_0x3240);
> > +	writel(reg_val, &mctl_ctl->unk_0x4240);
> > =20
> >  	writel(BIT(31), &mctl_com->cr);
> > =20
> > @@ -1163,7 +1242,11 @@ static unsigned long mctl_calc_size(const struct=
 dram_config *config)
> > =20
> >  static const struct dram_para para =3D {
> >  	.clk =3D CONFIG_DRAM_CLK,
> > +#ifdef CONFIG_SUNXI_DRAM_H616_DDR3_1333
> >  	.type =3D SUNXI_DRAM_TYPE_DDR3,
> > +#elif defined(CONFIG_SUNXI_DRAM_H616_LPDDR3)
> > +	.type =3D SUNXI_DRAM_TYPE_LPDDR3,
> > +#endif
> >  	.dx_odt =3D CONFIG_DRAM_SUN50I_H616_DX_ODT,
> >  	.dx_dri =3D CONFIG_DRAM_SUN50I_H616_DX_DRI,
> >  	.ca_dri =3D CONFIG_DRAM_SUN50I_H616_CA_DRI,
> > diff --git a/arch/arm/mach-sunxi/dram_timings/Makefile b/arch/arm/mach-=
sunxi/dram_timings/Makefile
> > index 4d78c04c9ae..8bfd99448a8 100644
> > --- a/arch/arm/mach-sunxi/dram_timings/Makefile
> > +++ b/arch/arm/mach-sunxi/dram_timings/Makefile
> > @@ -4,3 +4,4 @@ obj-$(CONFIG_SUNXI_DRAM_DDR2_V3S)	+=3D ddr2_v3s.o
> >  obj-$(CONFIG_SUNXI_DRAM_H6_LPDDR3)	+=3D h6_lpddr3.o
> >  obj-$(CONFIG_SUNXI_DRAM_H6_DDR3_1333)	+=3D h6_ddr3_1333.o
> >  obj-$(CONFIG_SUNXI_DRAM_H616_DDR3_1333)	+=3D h616_ddr3_1333.o
> > +obj-$(CONFIG_SUNXI_DRAM_H616_LPDDR3)	+=3D h616_lpddr3.o
> > diff --git a/arch/arm/mach-sunxi/dram_timings/h616_lpddr3.c b/arch/arm/=
mach-sunxi/dram_timings/h616_lpddr3.c
> > new file mode 100644
> > index 00000000000..b6d6a687468
> > --- /dev/null
> > +++ b/arch/arm/mach-sunxi/dram_timings/h616_lpddr3.c
> > @@ -0,0 +1,95 @@
> > +/*
> > + * sun50i H616 LPDDR3 timings, as programmed by Allwinner's boot0
> > + *
> > + * The chips are probably able to be driven by a faster clock, but boo=
t0
> > + * uses a more conservative timing (as usual).
> > + *
> > + * (C) Copyright 2020 Jernej Skrabec <jernej.skrabec@siol.net>
> > + * Based on H6 DDR3 timings:
> > + * (C) Copyright 2018,2019 Arm Ltd.
> > + *
> > + * SPDX-License-Identifier:	GPL-2.0+
> > + */
> > +
> > +#include <common.h>
> > +#include <asm/arch/dram.h>
> > +#include <asm/arch/cpu.h>
> > +
> > +void mctl_set_timing_params(const struct dram_para *para)
> > +{
> > +	struct sunxi_mctl_ctl_reg * const mctl_ctl =3D
> > +			(struct sunxi_mctl_ctl_reg *)SUNXI_DRAM_CTL0_BASE;
> > +
> > +	u8 tccd		=3D 2;
> > +	u8 tfaw		=3D ns_to_t(50);
> > +	u8 trrd		=3D max(ns_to_t(6), 4);
> > +	u8 trcd		=3D ns_to_t(24);
> > +	u8 trc		=3D ns_to_t(70);
> > +	u8 txp		=3D max(ns_to_t(8), 3);
> > +	u8 trtp		=3D max(ns_to_t(8), 2);
> > +	u8 trp		=3D ns_to_t(27);
> > +	u8 tras		=3D ns_to_t(41);
> > +	u16 trefi	=3D ns_to_t(7800) / 64;
> > +	u16 trfc	=3D ns_to_t(210);
> > +	u16 txsr	=3D 88;
> > +
> > +	u8 tmrw		=3D 5;
> > +	u8 tmrd		=3D 5;
> > +	u8 tmod		=3D max(ns_to_t(15), 12);
> > +	u8 tcke		=3D max(ns_to_t(6), 3);
> > +	u8 tcksrx	=3D max(ns_to_t(12), 4);
> > +	u8 tcksre	=3D max(ns_to_t(12), 4);
> > +	u8 tckesr	=3D tcke + 2;
> > +	u8 trasmax	=3D (para->clk / 2) / 16;
> > +	u8 txs		=3D ns_to_t(360) / 32;
> > +	u8 txsdll	=3D 16;
> > +	u8 txsabort	=3D 4;
> > +	u8 txsfast	=3D 4;
> > +	u8 tcl		=3D 7;
> > +	u8 tcwl		=3D 4;
> > +	u8 t_rdata_en	=3D 12;
> > +	u8 t_wr_lat	=3D 6;
> > +
> > +	u8 twtp		=3D 16;
> > +	u8 twr2rd	=3D trtp + 9;
> > +	u8 trd2wr	=3D 13;
> > +
> > +	/* DRAM timing grabbed from tvbox with LPDDR3 memory */
> > +	writel((twtp << 24) | (tfaw << 16) | (trasmax << 8) | tras,
> > +	       &mctl_ctl->dramtmg[0]);
> > +	writel((txp << 16) | (trtp << 8) | trc, &mctl_ctl->dramtmg[1]);
> > +	writel((tcwl << 24) | (tcl << 16) | (trd2wr << 8) | twr2rd,
> > +	       &mctl_ctl->dramtmg[2]);
> > +	writel((tmrw << 20) | (tmrd << 12) | tmod, &mctl_ctl->dramtmg[3]);
> > +	writel((trcd << 24) | (tccd << 16) | (trrd << 8) | trp,
> > +	       &mctl_ctl->dramtmg[4]);
> > +	writel((tcksrx << 24) | (tcksre << 16) | (tckesr << 8) | tcke,
> > +	       &mctl_ctl->dramtmg[5]);
> > +	/* Value suggested by ZynqMP manual and used by libdram */
> > +	writel((txp + 2) | 0x02020000, &mctl_ctl->dramtmg[6]);
> > +	writel((txsfast << 24) | (txsabort << 16) | (txsdll << 8) | txs,
> > +	       &mctl_ctl->dramtmg[8]);
> > +	writel(0x00020208, &mctl_ctl->dramtmg[9]);
> > +	writel(0xE0C05, &mctl_ctl->dramtmg[10]);
> > +	writel(0x440C021C, &mctl_ctl->dramtmg[11]);
> > +	writel(8, &mctl_ctl->dramtmg[12]);
> > +	writel(0xA100002, &mctl_ctl->dramtmg[13]);
> > +	writel(txsr, &mctl_ctl->dramtmg[14]);
> > +
> > +	writel(0x4f0112, &mctl_ctl->init[0]);
> > +	writel(0x420000, &mctl_ctl->init[1]);
> > +	writel(0xd05, &mctl_ctl->init[2]);
> > +	writel(0x83001c, &mctl_ctl->init[3]);
> > +	writel(0x00010000, &mctl_ctl->init[4]);
> > +
> > +	writel(0, &mctl_ctl->dfimisc);
> > +	clrsetbits_le32(&mctl_ctl->rankctl, 0xff0, 0x660);
> > +
> > +	/* Configure DFI timing */
> > +	writel(t_wr_lat | 0x2000000 | (t_rdata_en << 16) | 0x808000,
> > +	       &mctl_ctl->dfitmg0);
> > +	writel(0x100202, &mctl_ctl->dfitmg1);
> > +
> > +	/* set refresh timing */
> > +	writel((trefi << 16) | trfc, &mctl_ctl->rfshtmg);
> > +}
> >  =20
>=20
>=20
>=20
>=20

