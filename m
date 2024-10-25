Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6631632CD
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Oct 2024 15:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729869947; cv=none; b=cDhifeO4NphTgyWX59yo774eEET8vbDIxCt1wv6yqJGIT6AX4Aocuy9+tv0Oq+pHYntQ/sd8tQqrw7Y9EvMDmm+klvyyqE7lrZ3uZcbN61ayZ1jXOyr4WcYbexzz7A8IsV3xosMV1lDqMaf0RQzKGtbs72RyzwTS6RwGIX4HwKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729869947; c=relaxed/simple;
	bh=QJ4ct5R+k4JUhIXK2DaM7a3tGaDmIy4b9aiqlPb9fXs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OdjFx/S8mNjuoWAeJHzXc5C4a1QxxY9R1c5em8Ovksq3K0OcBAezN5RFtWPcSaCezti40M7PGF074ostCvCbfXbjh/SG6SC3rCy5pHpoqS5GtVWOcffx8+dPYVYQ4Yjh+SRUiog1QptRSqpOuhXP8Rd07qpKvtLHiOVN1aKcjJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DA69339;
	Fri, 25 Oct 2024 08:26:13 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA4AB3F73B;
	Fri, 25 Oct 2024 08:25:41 -0700 (PDT)
Date: Fri, 25 Oct 2024 16:25:39 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] ARM: dts: cubieboard4: Fix DCDC5 regulator constraints
Message-ID: <20241025162539.425660a2@donnerap.manchester.arm.com>
In-Reply-To: <CAGb2v65oHDkNG4dp3+Zh-wmMTMvRnBNPGLiGi68WGXzSR+64=g@mail.gmail.com>
References: <20241007222916.19013-1-andre.przywara@arm.com>
	<CAGb2v65oHDkNG4dp3+Zh-wmMTMvRnBNPGLiGi68WGXzSR+64=g@mail.gmail.com>
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

On Fri, 25 Oct 2024 22:42:14 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

> On Tue, Oct 8, 2024 at 6:30=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
> >
> > The DCDC5 voltage rail in the X-Powers AXP809 PMIC has a resolution of
> > 50mV, so the currently enforced limits of 1.475 and 1.525 volts cannot
> > be set, when the existing regulator value is beyond this range.
> >
> > This will lead to the whole regulator driver to give up and fail
> > probing, which in turn will hang the system, as essential devices depend
> > on the PMIC.
> > In this case a bug in U-Boot set the voltage to 1.75V (meant for DCDC4),
> > and the AXP driver's attempt to correct this lead to this error:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [    4.447653] axp20x-rsb sunxi-rsb-3a3: AXP20X driver loaded
> > [    4.450066] vcc-dram: Bringing 1750000uV into 1575000-1575000uV
> > [    4.460272] vcc-dram: failed to apply 1575000-1575000uV constraint: =
-EINVAL
> > [    4.474788] axp20x-regulator axp20x-regulator.0: Failed to register =
dcdc5
> > [    4.482276] axp20x-regulator axp20x-regulator.0: probe with driver a=
xp20x-regulator failed with error -22
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Set the limits to values that can be programmed, so any correction will
> > be successful.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com> =20
>=20
> Maybe
>=20
> Fixes: 1e1dea72651b ("ARM: dts: sun9i: cubieboard4: Add AXP809 PMIC
> device node and regulators")
>=20
> What do you think? I can add it when applying.

Well, I thought about it, but then it's a DT patch, so the Fixes: tag
doesn't make much sense here, IMHO. Put it there if you see fit, but for
my part I am just waiting for the commit hash, to pull into U-Boot, and
then it would be done, even for older kernels.

Cheers,
Andre.

> ChenYu
>=20
> > ---
> >  arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts b/ar=
ch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts
> > index c8ca8cb7f5c94..52ad95a2063aa 100644
> > --- a/arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts
> > +++ b/arch/arm/boot/dts/allwinner/sun9i-a80-cubieboard4.dts
> > @@ -280,8 +280,8 @@ reg_dcdc4: dcdc4 {
> >
> >                         reg_dcdc5: dcdc5 {
> >                                 regulator-always-on;
> > -                               regulator-min-microvolt =3D <1425000>;
> > -                               regulator-max-microvolt =3D <1575000>;
> > +                               regulator-min-microvolt =3D <1450000>;
> > +                               regulator-max-microvolt =3D <1550000>;
> >                                 regulator-name =3D "vcc-dram";
> >                         };
> >
> > --
> > 2.46.2
> > =20

