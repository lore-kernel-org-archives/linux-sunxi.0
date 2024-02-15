Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1A41361
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Feb 2024 01:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707960609; cv=none; b=Iytv1t6vip0lrO9KqXCdOhYHQwe5EyFWnt96p4meFEdctQmB8X9KG8Hip9LBhSPKhM9K+nkzt6a0YEpsD65Q9a4+khuA9IE0iUT2CI5LnGPRvRwPYP9Hbzu3oJAtOQmRrGcRBsihHy7jbNcIiZr5ALozo1sFha7OyStWOKg/URE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707960609; c=relaxed/simple;
	bh=j4y+oYzFDpLtjS+IP4m5Jl8dpeyTDhYGTff+PyAWbfg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uulDBvEzJKBIMvoL/2ieqz6X6AJ++JMouGWCpIKuY0kHsHFPJKo1trQaABBT0BbI8ghT2VGpja2fiXo6pWm/DSpTA5+cFUxDG3UAT9AF+FNSgC0Y3Z7QAxJYXVY531DO308Sa2WOnJxVyxFiB0/bOXy5NFR3NRGnbfg+6j8pFq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 394141FB;
	Wed, 14 Feb 2024 17:30:45 -0800 (PST)
Received: from minigeek.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12C383F762;
	Wed, 14 Feb 2024 17:30:01 -0800 (PST)
Date: Thu, 15 Feb 2024 01:28:47 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li
 <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>, Maksim
 Kiselev <bigunclemax@gmail.com>, Bob McChesney <bob@electricworry.net>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v4 1/7] soc: sunxi: sram: export register 0 for THS on
 H616
Message-ID: <20240215012847.7d0eeda9@minigeek.lan>
In-Reply-To: <2172811.irdbgypaU6@jernej-laptop>
References: <20240209144221.3602382-1-andre.przywara@arm.com>
	<20240209144221.3602382-2-andre.przywara@arm.com>
	<2172811.irdbgypaU6@jernej-laptop>
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

On Wed, 14 Feb 2024 21:29:30 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

thanks for having a look and the tags on the other patches!

> Dne petek, 09. februar 2024 ob 15:42:15 CET je Andre Przywara napisal(a):
> > The Allwinner H616 SoC contains a mysterious bit at register offset 0x0
> > in the SRAM control block. If bit 16 is set (the reset value), the
> > temperature readings of the THS are way off, leading to reports about
> > 200C, at normal ambient temperatures. Clearing this bits brings the
> > reported values down to reasonable ranges.
> > The BSP code clears this bit in firmware (U-Boot), and has an explicit
> > comment about this, but offers no real explanation.
> >=20
> > Since we should not rely on firmware settings, allow other code (the THS
> > driver) to access this register, by exporting it through the already
> > existing regmap. This mimics what we already do for the LDO control and
> > the EMAC register. =20
>=20
> Are you sure that this bit doesn't control actual SRAM region?

Pretty much so, yes: I did some experiments from U-Boot:
I filled SRAM C with some pattern, then read this back. Then flipped bit
16, read again: same result. Then wrote something again and read it
back: no change. In fact no bits at 0x3000000 had any effect on SRAM
accessibility, only clearing bit 24 in 0x3000004 made the whole SRAM C
(0x28000-0x47fff) go read-as-zero/write-ignore, from the CPU side.

I then triggered the THS device, to do temperature readings, but
this didn't change a single byte in the SRAM regions, with or without
bit 16 set. It only changed the returned values, at 0x50704c0.

So yes, I am pretty certain there is no SRAM region that gets switched.
Even if we would want to claim there is: I wouldn't know which
address values to put into the SRAM DT node.

So I guess it's another example of: oh, we have this spare bit here. Or
it's some kind of chicken bit? I don't know, and I think the BSP code
we have seen didn't offer an explanation as well.

Cheers,
Andre
>=20
> Best regards,
> Jernej
>=20
> >=20
> > Since this bit is in the very same register as the actual SRAM switch,
> > we need to change the regmap lock to the SRAM lock. Fortunately regmap
> > has provisions for that, so we just need to hook in there.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/soc/sunxi/sunxi_sram.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >=20
> > diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_s=
ram.c
> > index 4458b2e0562b0..71cdd1b257eeb 100644
> > --- a/drivers/soc/sunxi/sunxi_sram.c
> > +++ b/drivers/soc/sunxi/sunxi_sram.c
> > @@ -287,6 +287,7 @@ EXPORT_SYMBOL(sunxi_sram_release);
> >  struct sunxi_sramc_variant {
> >  	int num_emac_clocks;
> >  	bool has_ldo_ctrl;
> > +	bool has_ths_offset;
> >  };
> > =20
> >  static const struct sunxi_sramc_variant sun4i_a10_sramc_variant =3D {
> > @@ -308,8 +309,10 @@ static const struct sunxi_sramc_variant sun50i_a64=
_sramc_variant =3D {
> > =20
> >  static const struct sunxi_sramc_variant sun50i_h616_sramc_variant =3D {
> >  	.num_emac_clocks =3D 2,
> > +	.has_ths_offset =3D true,
> >  };
> > =20
> > +#define SUNXI_SRAM_THS_OFFSET_REG	0x0
> >  #define SUNXI_SRAM_EMAC_CLOCK_REG	0x30
> >  #define SUNXI_SYS_LDO_CTRL_REG		0x150
> > =20
> > @@ -318,6 +321,8 @@ static bool sunxi_sram_regmap_accessible_reg(struct=
 device *dev,
> >  {
> >  	const struct sunxi_sramc_variant *variant =3D dev_get_drvdata(dev);
> > =20
> > +	if (reg =3D=3D SUNXI_SRAM_THS_OFFSET_REG && variant->has_ths_offset)
> > +		return true;
> >  	if (reg >=3D SUNXI_SRAM_EMAC_CLOCK_REG &&
> >  	    reg <  SUNXI_SRAM_EMAC_CLOCK_REG + variant->num_emac_clocks * 4)
> >  		return true;
> > @@ -327,6 +332,21 @@ static bool sunxi_sram_regmap_accessible_reg(struc=
t device *dev,
> >  	return false;
> >  }
> > =20
> > +
> > +static void sunxi_sram_lock(void *_lock)
> > +{
> > +	spinlock_t *lock =3D _lock;
> > +
> > +	spin_lock(lock);
> > +}
> > +
> > +static void sunxi_sram_unlock(void *_lock)
> > +{
> > +	spinlock_t *lock =3D _lock;
> > +
> > +	spin_unlock(lock);
> > +}
> > +
> >  static struct regmap_config sunxi_sram_regmap_config =3D {
> >  	.reg_bits       =3D 32,
> >  	.val_bits       =3D 32,
> > @@ -336,6 +356,9 @@ static struct regmap_config sunxi_sram_regmap_confi=
g =3D {
> >  	/* other devices have no business accessing other registers */
> >  	.readable_reg	=3D sunxi_sram_regmap_accessible_reg,
> >  	.writeable_reg	=3D sunxi_sram_regmap_accessible_reg,
> > +	.lock		=3D sunxi_sram_lock,
> > +	.unlock		=3D sunxi_sram_unlock,
> > +	.lock_arg	=3D &sram_lock,
> >  };
> > =20
> >  static int __init sunxi_sram_probe(struct platform_device *pdev)
> >  =20
>=20
>=20
>=20
>=20
>=20

