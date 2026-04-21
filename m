Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4CD40DFA1
	for <linux-sunxi@lists.linux.dev>; Tue, 21 Apr 2026 05:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776748801; cv=pass; b=rL0gKYQl96TEskXvCui/Q+8vQGhnul8w2v71io2O8wrLysOWWZMJdD7b2kvpKugECmYNheDFtoOqrP/EMXPWbYdBR6hzucx928ne+U9so06AxaskSz46jtNZOJeAj3rNJ9IKL0L3abvVOPF+QhNqcB3M9UrTUNdBC57to5j+8rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776748801; c=relaxed/simple;
	bh=zo8jlfsbBf8iQ8bwANQlZ7lCoeKeOFubhbihX2dzvgk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b0tzNW8gHqrRvga/CAlEm4WXoExFlMKb9Te18VOkOg355wKbpwP2Xj8tfExrmZNnzmdmimv02oMHsbQtz6iWH/2pZPzjuNzbzbNSBxkYimp0wvKqHBPb05ZENNOM1WkXLDxfcIoIQwLOWFWCUCj4QDLfl3XJ90JLZVHwJt0WAkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=QjmQjgLK; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="QjmQjgLK"
ARC-Seal: i=1; a=rsa-sha256; t=1776748797; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M8O8bFHnRlk7C+twY35Su6MbZpeakMWbQEm2EQZRtIkQ7eNF5CKtQ11CN6QPY6HMimgoazHiLvUrN/zJ9qmzqitmvW+L6EV1T6i8qQp1m21lDLDwVniWyR9W7e9rXJgxlxsPY/L3HtfFTOA8+ZJWFbhs9HVpsa1hpfwHeCaOIEk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776748797; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Geq1OQynOihlqWQFvYfdxAYkxPpvK02UlEuH2IZRWTc=; 
	b=CjWfUNBRTcjSkcFV720ezhRiOIG3cGkJEhf6SXYY787W1E+Ig16SK1ehXS/m7rrw89pNr2GhvJs0QkwE1vPa+bwL0j+9trWJCDmAn7uaMqlv9oBCzaI+6Gv+XUHUojgr5Ez4r0qnWCrEiH98Ih//Kx+MoEhQirbEhloABBK2FEg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776748797;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=Geq1OQynOihlqWQFvYfdxAYkxPpvK02UlEuH2IZRWTc=;
	b=QjmQjgLKmNWLORUWu0zG6vq0J7J2Y7yAvskFNxzs0kHiajc3B0Kt2Ks9BsxWTIAf
	aoBMUajpkE0Z33P1cMZ6Bwat7L8IspRlQc6yxyM56IRz194w5+gzwZwFYADey1Oab3U
	S0nq7agtDnpx9av56twGCw8a9nv6C5uSUslOXvLF6FTm5Hdodtx2A8GUKpH02iYYRhu
	myowzXjgKOdhq08FmEZARCNja31+0rnnkyNCHv+HX29HhTJRHhj9ixm7+DfZQZ6PLtP
	4IFYTOs8+ethJBN4qo+oDUzAM4THZgod/GTGrONr06h7+PySiTB81+nsnuI+Z3PJBvH
	lW5OOMV62A==
Received: by mx.zohomail.com with SMTPS id 1776748795516222.02561140737646;
	Mon, 20 Apr 2026 22:19:55 -0700 (PDT)
Message-ID: <4cd64f5eba093d2dc122628a94cd0aba1071e626.camel@icenowy.me>
Subject: Re: [PATCH] mfd: axp20x: Change volatile ranges on axp803
From: Icenowy Zheng <uwu@icenowy.me>
To: Jernej =?gb2312?Q?=810=947krabec?= <jernej.skrabec@gmail.com>, 
	linux-sunxi@lists.linux.dev, =?gb2312?Q?Ond=810=940ej?= Jirman <megi@xff.cz>
Cc: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, Chen-Yu Tsai
	 <wens@kernel.org>
Date: Tue, 21 Apr 2026 13:19:50 +0800
In-Reply-To: <b2d1246045ac27562865c8b399f21a839b14b19e.camel@icenowy.me>
References: <20260315124932.3669260-1-megi@xff.cz>
		 <5084920.31r3eYUQgx@jernej-laptop>
	 <b2d1246045ac27562865c8b399f21a839b14b19e.camel@icenowy.me>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2026-04-21=E4=BA=8C=E7=9A=84 13:06 +0800=EF=BC=8CIcenowy Zheng=E5=
=86=99=E9=81=93=EF=BC=9A
> =E5=9C=A8 2026-03-21=E5=85=AD=E7=9A=84 07:25 +0100=EF=BC=8CJernej =C5=A0k=
rabec=E5=86=99=E9=81=93=EF=BC=9A
> > Dne nedelja, 15. marec 2026 ob 13:49:31 Srednjeevropski standardni
> > =C4=8Das je Ond=C5=99ej Jirman napisal(a):
> > > From: Ondrej Jirman <megi@xff.cz>
> > >=20
> > > Regulator control registers can be cached. They don't update by
> > > themselves. Enable cache on them, to speed up voltage changes,
> > > particularly DCDC2 which needs to be handled quickly due to being
> > > used
> > > for CPUX cores and is changed very frequently by some cpufreq
> > > schedulers.
> >=20
> > That's not really the case, DCDC2-DCDC6 registers have DVM finished
> > status
> > bit, which is volatile and it is right to have them in volatile
> > range.
> > However, it is true that other registers are non-volatile, so that
> > range can
> > be considerably shrinked. It seems that AXP288 have same register
> > layout
> > but I can't say for sure (I only found datasheet for AXP288C), so
> > it's best
> > to leave it alone and apply changes only to AXP803.=20
>=20
> I have AXP288 datasheet, and register map looks the same with
> AXP288C.
>=20
> BTW I think AXP288/288C/803/813(PMIC part) is the same die -- they
> have
> the same "IC type no" value of 0b010001, and their difference could
> be
> explained as package difference -- AXP803 doesn't wire AXP813's DCDC7
> and wire SWIN to DCDC1 out, and AXP288 doesn't wire AXP813's DCDC3.
> (As
> of RSB, all AXP PMICs boot at I2C mode by default, and the main SoC
> switches it to RSB when it's needed; AXP288 is paired with non-
> Allwinner SoCs (Intel ones) so it just doesn't advertise RSB.)

Forgot to mention that AXP8x3 also have dedicated VBUS and ACIN inputs
while AXP288 has only VBUS -- but in the AXP803 datasheet, VBUS and
ACIN shorted together is a valid use case and can be detected by the
PMIC, and when they're shorted the VBUS current limit is active (the
ACIN current limit is ignored); so for AXP288 it could be explained
that the ACIN is shorted with VBUS in the package.

Thanks,
Icenowy

>=20
> Thanks,
> Icenowy
>=20
> >=20
> > Best regards,
> > Jernej
> >=20
> > >=20
> > > This shrinks register access over RSB bus to one write per
> > > voltage
> > > change (down from 4 or so).
> > >=20
> > > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > > ---
> > > =C2=A0drivers/mfd/axp20x.c | 28 +++++++++++++++++++++++++++-
> > > =C2=A01 file changed, 27 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> > > index 0d0d40972eb8..2ea409029d2f 100644
> > > --- a/drivers/mfd/axp20x.c
> > > +++ b/drivers/mfd/axp20x.c
> > > @@ -172,6 +172,18 @@ static const struct regmap_range
> > > axp288_volatile_ranges[] =3D {
> > > =C2=A0	regmap_reg_range(AXP20X_FG_RES, AXP288_FG_CC_CAP_REG),
> > > =C2=A0};
> > > =C2=A0
> > > +static const struct regmap_range axp803_volatile_ranges[] =3D {
> > > +	regmap_reg_range(AXP20X_PWR_INPUT_STATUS,
> > > AXP288_POWER_REASON),
> > > +	regmap_reg_range(AXP288_BC_GLOBAL, AXP288_BC_GLOBAL),
> > > +	regmap_reg_range(AXP288_BC_DET_STAT,
> > > AXP20X_VBUS_IPSOUT_MGMT),
> > > +	regmap_reg_range(AXP20X_CHRG_BAK_CTRL,
> > > AXP20X_CHRG_BAK_CTRL),
> > > +	regmap_reg_range(AXP20X_IRQ1_EN,
> > > AXP20X_IPSOUT_V_HIGH_L),
> > > +	regmap_reg_range(AXP20X_TIMER_CTRL, AXP20X_TIMER_CTRL),
> > > +	regmap_reg_range(AXP20X_GPIO1_CTRL, AXP22X_GPIO_STATE),
> > > +	regmap_reg_range(AXP288_RT_BATT_V_H,
> > > AXP288_RT_BATT_V_L),
> > > +	regmap_reg_range(AXP20X_FG_RES, AXP288_FG_CC_CAP_REG),
> > > +};
> > > +
> > > =C2=A0static const struct regmap_access_table axp288_writeable_table =
=3D
> > > {
> > > =C2=A0	.yes_ranges	=3D axp288_writeable_ranges,
> > > =C2=A0	.n_yes_ranges	=3D ARRAY_SIZE(axp288_writeable_ranges),
> > > @@ -182,6 +194,11 @@ static const struct regmap_access_table
> > > axp288_volatile_table =3D {
> > > =C2=A0	.n_yes_ranges	=3D ARRAY_SIZE(axp288_volatile_ranges),
> > > =C2=A0};
> > > =C2=A0
> > > +static const struct regmap_access_table axp803_volatile_table =3D
> > > {
> > > +	.yes_ranges	=3D axp803_volatile_ranges,
> > > +	.n_yes_ranges	=3D ARRAY_SIZE(axp803_volatile_ranges),
> > > +};
> > > +
> > > =C2=A0static const struct regmap_range axp806_writeable_ranges[] =3D =
{
> > > =C2=A0	regmap_reg_range(AXP20X_DATACACHE(0),
> > > AXP20X_DATACACHE(3)),
> > > =C2=A0	regmap_reg_range(AXP806_PWR_OUT_CTRL1,
> > > AXP806_CLDO3_V_CTRL),
> > > @@ -456,6 +473,15 @@ static const struct regmap_config
> > > axp22x_regmap_config =3D {
> > > =C2=A0	.cache_type	=3D REGCACHE_MAPLE,
> > > =C2=A0};
> > > =C2=A0
> > > +static const struct regmap_config axp803_regmap_config =3D {
> > > +	.reg_bits	=3D 8,
> > > +	.val_bits	=3D 8,
> > > +	.wr_table	=3D &axp288_writeable_table,
> > > +	.volatile_table	=3D &axp803_volatile_table,
> > > +	.max_register	=3D AXP288_FG_TUNE5,
> > > +	.cache_type	=3D REGCACHE_MAPLE,
> > > +};
> > > +
> > > =C2=A0static const struct regmap_config axp288_regmap_config =3D {
> > > =C2=A0	.reg_bits	=3D 8,
> > > =C2=A0	.val_bits	=3D 8,
> > > @@ -1368,7 +1394,7 @@ int axp20x_match_device(struct axp20x_dev
> > > *axp20x)
> > > =C2=A0	case AXP803_ID:
> > > =C2=A0		axp20x->nr_cells =3D ARRAY_SIZE(axp803_cells);
> > > =C2=A0		axp20x->cells =3D axp803_cells;
> > > -		axp20x->regmap_cfg =3D &axp288_regmap_config;
> > > +		axp20x->regmap_cfg =3D &axp803_regmap_config;
> > > =C2=A0		axp20x->regmap_irq_chip =3D
> > > &axp803_regmap_irq_chip;
> > > =C2=A0		break;
> > > =C2=A0	case AXP806_ID:
> > >=20
> >=20
> >=20
> >=20
> >=20
