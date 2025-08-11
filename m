Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513111A9FB8
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Aug 2025 16:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754928505; cv=none; b=Q00Zm9cDusns3Cp4G5bK/C2lKkWqvWgWJcXrg8Qo21G6XR/xVlTRXsrsTmgZKn3avLDXZVY8DXnvrXGHQfhGoZOtedHPDXddHmF32WDBqS/qUaJVGfYW8cG3I0na3rmtipHyiyVpxNSDqnoSXKnP35yvP/3XuN3lD+qQ5/wEANU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754928505; c=relaxed/simple;
	bh=YvFfx2kGtmU2TH8EluqfotKZpC9f+z3IdqoZ6FImgSU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rwu5PHDdsiBIVd/CVyKD+HOzJwSXhnTiPJHdJJVEKSQ8V+YSb0nyIJTFZLsDDWlLxjd5AM5LRWQmMM0kJy/dhO6ofxJpz7SxAY7LpWiLe0Cf2Y2eSmV6r6LY4VICDQSWdn1W9wX8sLCUn50ok28DIK69i50uJv19455gxI/vk2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BC0D266C;
	Mon, 11 Aug 2025 09:08:13 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2609F3F738;
	Mon, 11 Aug 2025 09:08:20 -0700 (PDT)
Date: Mon, 11 Aug 2025 17:08:16 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: u-boot@lists.denx.de, Tom Rini <trini@konsulko.com>, Cody Eksal
 <masterr3c0rd@epochal.quest>, Chris Morgan <macromorgan@hotmail.com>,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/3] sunxi: H616: dram: fix LPDDR3 mode register
 settings
Message-ID: <20250811170816.60e57b14@donnerap.manchester.arm.com>
In-Reply-To: <7836068.EvYhyI6sBW@jernej-laptop>
References: <20250801234918.19176-1-andre.przywara@arm.com>
	<20250801234918.19176-4-andre.przywara@arm.com>
	<7836068.EvYhyI6sBW@jernej-laptop>
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

On Mon, 11 Aug 2025 17:49:06 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

many thanks for having a look!

> Dne sobota, 2. avgust 2025 ob 01:49:18 Srednjeevropski poletni =C4=8Das j=
e Andre Przywara napisal(a):
> > The JEDEC LPDDR3 spec defines mode register 0 (MR0) as being read-only,
> > so there is no point in trying to set its value.
> > Also the H616 memory controller encodes the mode register index to be
> > written starting from bit 8 in MRCTRL1 (for LPDDR3 and LPDDR4 chips), so
> > we need to OR in that number to tell the controller which MR to program.
> >=20
> > On top of that, the mode registers between DDR3 and LPDDR3 are
> > completely different, so writing values crafted for DDR3 into a LPDDR3
> > chip is just wrong. Due to the above mentioned bugs the writes for
> > MR0-MR2 did not have any effect (as they were all trying to set the
> > read-only MR0), so the mode registers just stayed unchanged. =20
>=20
> Nice catch! Looking at BSP DRAM code, it only sets MR1, MR2 and MR3.
>=20
> >=20
> > Looking at the LPDDR3 spec and the BSP code, let's write the proper MR
> > values into LPDDR3 chips, using the proper addressing mode. =20
>=20
> Please explain how you find those values. Are they always set in this way
> for all boards using LPDDR3?

Yeah, that's a good question! At first, I tried using what JEDEC describes
as the default settings, but that didn't work. Then I looked into some
parameters found in some BSP image dumps, but that didn't work either.
JEDEC describes those MRs as write-only, and I haven't tried whether
reading them would work nevertheless, not sure about the exact algorithm
for reading MRs anyway.
What eventually worked was to use the BSP values written by exactly the
boot0 on the eMMC that boots an LPDDR3 system - which is actually only one
in mainline: the Tanix TX1.

So yeah, those values work for me (TM), and there is only one LPDDR3 board
supported, so fingers crossed. But actually I wonder if those MR values
really belong into the timing routine (mctl_set_timing_params(), since
parts depend on the speed bin. I see some other SoC/DRAM type combinations
doing that already (H6 DDR3/LPDDR3 and A523 LPDDR4), maybe we should
follow suit here?

Cheers,
Andre


>=20
> Best regards,
> Jernej
>=20
> > Use the opportunity to document the LPDDR3 mode register bits written.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm/mach-sunxi/dram_sun50i_h616.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sun=
xi/dram_sun50i_h616.c
> > index 877181016f3..3345c9b8e82 100644
> > --- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
> > +++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
> > @@ -1078,18 +1078,18 @@ static bool mctl_phy_init(const struct dram_par=
a *para,
> >  		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> >  		break;
> >  	case SUNXI_DRAM_TYPE_LPDDR3:
> > -		writel(mr0, &mctl_ctl->mrctrl1);
> > -		writel(0x800000f0, &mctl_ctl->mrctrl0);
> > -		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > -
> > -		writel(4, &mctl_ctl->mrctrl1);
> > +		/* MR0 is read-only */
> > +		/* MR1: nWR=3D14, BL8 */
> > +		writel(0x183, &mctl_ctl->mrctrl1);
> >  		writel(0x800000f0, &mctl_ctl->mrctrl0);
> >  		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > =20
> > -		writel(mr2, &mctl_ctl->mrctrl1);
> > +		/* MR2: no WR leveling, WL set A, use nWR>9, nRL=3D14/nWL=3D8 */
> > +		writel(0x21c, &mctl_ctl->mrctrl1);
> >  		writel(0x800000f0, &mctl_ctl->mrctrl0);
> >  		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> > =20
> > +		/* MR3: 34.3 Ohm pull-up/pull-down resistor */
> >  		writel(0x301, &mctl_ctl->mrctrl1);
> >  		writel(0x800000f0, &mctl_ctl->mrctrl0);
> >  		mctl_await_completion(&mctl_ctl->mrctrl0, BIT(31), 0);
> >  =20
>=20
>=20
>=20
>=20

