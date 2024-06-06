Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF541990CE
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Jun 2024 17:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717694938; cv=none; b=pk5HGoF1cjLwUHrAD1sKpRiFY87nMv5LKDHhepkHKsnc3X0FlhOSuaMIKXClIfecfkSjAOEOOeHr0/uncWud5M5RsOeEBxZepoyMhZLpbrqannAjbDaTQRAKsLYq5fH6ad9hZYKn4t6em1nElbN5sUQ7nfzRH8Cx0KaUPA/Vh1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717694938; c=relaxed/simple;
	bh=JNak2+njFem8PE62GoSC3QHk+AwtR9bWjoX4scDPfz0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I3l5yqm9v2ctvS1rsSJOa2LqTLodaUFo7nyAPXbw8UjSp69Lnc9HRn1Tgoefee3wM58jnjklGgkHOGjna352DWe6VGHRDYp5lGZHfQFqQs03+mHmtFr2PsJd8fZKznqEX8Kqm3ZO7uUt/bZN2P9ibBdzqYFax+qaADvT1KRMZs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8F552F4;
	Thu,  6 Jun 2024 10:29:16 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA1F43F792;
	Thu,  6 Jun 2024 10:28:50 -0700 (PDT)
Date: Thu, 6 Jun 2024 18:28:48 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Chris Morgan <macroalpha82@gmail.com>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 mripard@kernel.org, ryan@testtoast.com, samuel@sholland.org,
 jernej.skrabec@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h700: Add Anbernic RG35XX-SP
Message-ID: <20240606182848.59e8d3a5@donnerap.manchester.arm.com>
In-Reply-To: <DM4PR05MB922995CB8DE2589E025E486FA5FA2@DM4PR05MB9229.namprd05.prod.outlook.com>
References: <20240605185339.266833-1-macroalpha82@gmail.com>
	<20240605185339.266833-3-macroalpha82@gmail.com>
	<20240606105159.33a2b917@donnerap.manchester.arm.com>
	<CAGb2v64uCCZSc0aY-gtcMNAhJAqDhb5=sPBJC=q0+nKwMO3f+A@mail.gmail.com>
	<20240606133515.223b9c73@donnerap.manchester.arm.com>
	<DM4PR05MB922995CB8DE2589E025E486FA5FA2@DM4PR05MB9229.namprd05.prod.outlook.com>
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

On Thu, 6 Jun 2024 12:06:54 -0500
Chris Morgan <macromorgan@hotmail.com> wrote:

Hi,

> On Thu, Jun 06, 2024 at 01:35:15PM +0100, Andre Przywara wrote:
> > On Thu, 6 Jun 2024 19:58:07 +0800
> > Chen-Yu Tsai <wens@csie.org> wrote:
> >=20
> > Hi Chen-Yu,
> >  =20
> > > On Thu, Jun 6, 2024 at 5:52=E2=80=AFPM Andre Przywara <andre.przywara=
@arm.com> wrote: =20
> > > >
> > > > On Wed,  5 Jun 2024 13:53:39 -0500
> > > > Chris Morgan <macroalpha82@gmail.com> wrote:
> > > >   =20
> > > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > >
> > > > > The Anbernic RG35XXSP is almost identical to the RG35XX-Plus, but=
 in a
> > > > > clamshell form-factor. The key differences between the SP and the=
 Plus
> > > > > is a lid switch and an RTC on the same i2c bus as the PMIC.
> > > > >
> > > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/allwinner/Makefile        |   3 +-
> > > > >  .../sun50i-h700-anbernic-rg35xx-sp.dts        | 145 ++++++++++++=
++++++
> > > > >  2 files changed, 147 insertions(+), 1 deletion(-)
> > > > >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anb=
ernic-rg35xx-sp.dts
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/=
boot/dts/allwinner/Makefile
> > > > > index 0db7b60b49a1..00bed412ee31 100644
> > > > > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > > > > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > > > > @@ -49,5 +49,6 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-orang=
epi-zero2w.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-orangepi-zero3.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-transpeed-8k618-t.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-2024.d=
tb
> > > > > -dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-plus.d=
tb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-h.dtb
> > > > > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-plus.d=
tb
> > > > > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-sp.dtb
> > > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-r=
g35xx-sp.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp=
.dts
> > > > > new file mode 100644
> > > > > index 000000000000..a1d16b65ef5d
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-s=
p.dts
> > > > > @@ -0,0 +1,145 @@
> > > > > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +/*
> > > > > + * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
> > > > > + * Copyright (C) 2024 Chris Morgan <macroalpha82@gmail.com>.
> > > > > + */
> > > > > +
> > > > > +#include <dt-bindings/input/gpio-keys.h>
> > > > > +#include "sun50i-h700-anbernic-rg35xx-plus.dts"
> > > > > +
> > > > > +/ {
> > > > > +     model =3D "Anbernic RG35XX SP";
> > > > > +     compatible =3D "anbernic,rg35xx-sp", "allwinner,sun50i-h700=
";
> > > > > +
> > > > > +     gpio-keys-lid {
> > > > > +             compatible =3D "gpio-keys";
> > > > > +
> > > > > +             lid-switch {
> > > > > +                     label =3D "Lid Switch";
> > > > > +                     gpios =3D <&pio 4 7 GPIO_ACTIVE_LOW>; /* PE=
7 */
> > > > > +                     linux,can-disable;
> > > > > +                     linux,code =3D <SW_LID>;
> > > > > +                     linux,input-type =3D <EV_SW>;
> > > > > +                     wakeup-event-action =3D <EV_ACT_DEASSERTED>;
> > > > > +                     wakeup-source;
> > > > > +             };
> > > > > +     };
> > > > > +};
> > > > > +
> > > > > +/delete-node/ &r_rsb;   =20
> > > >
> > > > I don't think deleting the *RSB* node is right here, if at all, I'd=
 expect
> > > > status=3D"disabled", and then maybe deleting the axp717 node within?
> > > > Or maybe factor the AXP node out into a separate file, and include =
it from
> > > > the -2024.dts and from this one?   =20
> > >=20
> > > Doesn't quite work because the unit address is different. =20
> >=20
> > Ah, right, good point. It's a bit annoying because the node name itself=
 is
> > mostly irrelevant, but I see that this wouldn't pass validation.
> >  =20
> > > > Or move every board to I2C?   =20
> > >=20
> > > Doesn't this depend on the bootloader also running in RSB mode? My me=
mory
> > > is a bit foggy on this, but IIRC we did a conversion on some other bo=
ards
> > > before? =20
> >=20
> > In the SPL we use I2C only, mostly because we have an SPL capable I2C
> > driver already.
> > In U-Boot proper we use whatever the DT says, that should work like in =
the
> > kernel.
> > In TF-A we used to have one hardcoded transport per SoC, and that happe=
ns
> > to be RSB everywhere at the moment, but I have a patch series [1] to
> > determine this dynamically, via the DT. As it stands, that chooses the
> > transport by looking at the PMIC (I2C for the AXP313, RSB for the AXP717
> > or AXP305), but I think it's fairly easy to check for the status proper=
ty
> > of both RSB and I2C, or look at the parent node of the AXP node to find
> > the transport protocol to use.
> > I will sketch something up.
> >=20
> > Chris has plans to auto-detect the exact Anbernic model in U-Boot, and
> > switch to the right DT then automatically. IIUC I2C devices play a role=
 in
> > this, so switching to I2C for all Anbernic models would make this more
> > viable.
> > It just leaves a bit of a bitter taste that we now model the DT after t=
his
> > particular requirement, and not after what the hardware looks like. =20
>=20
> I honestly would rather simply have the Linux tree use i2c for all
> devices, to be honest. For at least the Anbernic RG35XXSP device
> as well as a device I haven't started yet (the RG28XX) there is an
> external rtc on the same i2c bus as the PMIC at 0x51. This device
> does not appear to be present on the other devices.
>=20
> I'm thinking that with U-Boot I can use a single bootloader and load
> one of five device trees based on what happens when I check for this
> RTC at 0x51, when I attempt to communicate with mmc1 (wifi), and when
> I check GPIO PE11. I don't need to actually use the wifi in U-Boot,
> just find out if it's there.
>=20
> This means basically:
>=20
> GPIO PE11 - RG35XX-H
> RTC present, wifi present - RG35XX-SP
> RTC present, wifi missing - RG28XX
> RTC missing, wifi missing - RG35XX-2024
> RTC missing, wifi present - RG35XX-Plus
>=20
> Regardless of this though, I will find a way to manage no matter what
> we decide here. But for the RG35XX-SP and RG28XX (not yet submitted) I
> want to run the PMIC off i2c so I can use the external RTC too.

Yes, if you have I2C devices connected to those pins, then we *need* to
use I2C for the PMIC. We have the same situation for the Pine H64 board,
check sun50i-h6-pine-h64.dts.
That's why the idea to switch the others, too.

Cheers,
Andre

> >=20
> > [1] https://review.trustedfirmware.org/q/topic:%22h616_pmics%22
> >  =20
> > > > What do people think about this?   =20
> > >=20
> > > "disabled" in RSB node and deleting the axp717 node is probably the r=
ight
> > > thing to do.
> > >=20
> > >  =20
> > > > Cheers,
> > > > Andre
> > > >   =20
> > > > > +
> > > > > +&r_i2c {
> > > > > +     pinctrl-0 =3D <&r_i2c_pins>;
> > > > > +     pinctrl-names =3D "default";
> > > > > +     status =3D "okay";
> > > > > +
> > > > > +     axp717: pmic@34 {
> > > > > +             compatible =3D "x-powers,axp717";
> > > > > +             reg =3D <0x34>;
> > > > > +             interrupt-controller;
> > > > > +             #interrupt-cells =3D <1>;
> > > > > +             interrupt-parent =3D <&nmi_intc>;
> > > > > +             interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> > > > > +
> > > > > +             vin1-supply =3D <&reg_vcc5v>;
> > > > > +             vin2-supply =3D <&reg_vcc5v>;
> > > > > +             vin3-supply =3D <&reg_vcc5v>;
> > > > > +             vin4-supply =3D <&reg_vcc5v>;
> > > > > +
> > > > > +             regulators {
> > > > > +                     reg_dcdc1: dcdc1 {
> > > > > +                             regulator-always-on;
> > > > > +                             regulator-min-microvolt =3D <900000=
>;
> > > > > +                             regulator-max-microvolt =3D <110000=
0>;
> > > > > +                             regulator-name =3D "vdd-cpu";
> > > > > +                     };
> > > > > +
> > > > > +                     reg_dcdc2: dcdc2 {
> > > > > +                             regulator-always-on;
> > > > > +                             regulator-min-microvolt =3D <940000=
>;
> > > > > +                             regulator-max-microvolt =3D <940000=
>;
> > > > > +                             regulator-name =3D "vdd-gpu-sys";
> > > > > +                     };
> > > > > +
> > > > > +                     reg_dcdc3: dcdc3 {
> > > > > +                             regulator-always-on;
> > > > > +                             regulator-min-microvolt =3D <110000=
0>;
> > > > > +                             regulator-max-microvolt =3D <110000=
0>;
> > > > > +                             regulator-name =3D "vdd-dram";
> > > > > +                     };
> > > > > +
> > > > > +                     reg_aldo1: aldo1 {
> > > > > +                             /* 1.8v - unused */
> > > > > +                     };   =20
> > >=20
> > > You can drop all the unused ones, unless you plan to include *this*
> > > file from another one and use those nodes/labels.
> > >=20
> > > ChenYu
> > >  =20
> > > > > +
> > > > > +                     reg_aldo2: aldo2 {
> > > > > +                             /* 1.8v - unused */
> > > > > +                     };
> > > > > +
> > > > > +                     reg_aldo3: aldo3 {
> > > > > +                             /* 1.8v - unused */
> > > > > +                     };
> > > > > +
> > > > > +                     reg_aldo4: aldo4 {
> > > > > +                             regulator-min-microvolt =3D <180000=
0>;
> > > > > +                             regulator-max-microvolt =3D <180000=
0>;
> > > > > +                             regulator-name =3D "vcc-pg";
> > > > > +                     };
> > > > > +
> > > > > +                     reg_bldo1: bldo1 {
> > > > > +                             /* 1.8v - unused */
> > > > > +                     };
> > > > > +
> > > > > +                     reg_bldo2: bldo2 {
> > > > > +                             regulator-always-on;
> > > > > +                             regulator-min-microvolt =3D <180000=
0>;
> > > > > +                             regulator-max-microvolt =3D <180000=
0>;
> > > > > +                             regulator-name =3D "vcc-pll";
> > > > > +                     };
> > > > > +
> > > > > +                     reg_bldo3: bldo3 {
> > > > > +                             /* 2.8v - unused */
> > > > > +                     };
> > > > > +
> > > > > +                     reg_bldo4: bldo4 {
> > > > > +                             /* 1.2v - unused */
> > > > > +                     };
> > > > > +
> > > > > +                     reg_cldo1: cldo1 {
> > > > > +                             /* 3.3v - audio codec - not yet imp=
lemented */
> > > > > +                     };
> > > > > +
> > > > > +                     reg_cldo2: cldo2 {
> > > > > +                             /* 3.3v - unused */
> > > > > +                     };
> > > > > +
> > > > > +                     reg_cldo3: cldo3 {
> > > > > +                             regulator-always-on;
> > > > > +                             regulator-min-microvolt =3D <330000=
0>;
> > > > > +                             regulator-max-microvolt =3D <330000=
0>;
> > > > > +                             regulator-name =3D "vcc-io";
> > > > > +                     };
> > > > > +
> > > > > +                     reg_cldo4: cldo4 {
> > > > > +                             regulator-min-microvolt =3D <330000=
0>;
> > > > > +                             regulator-max-microvolt =3D <330000=
0>;
> > > > > +                             regulator-name =3D "vcc-wifi";
> > > > > +                     };
> > > > > +
> > > > > +                     reg_boost: boost {
> > > > > +                             regulator-min-microvolt =3D <500000=
0>;
> > > > > +                             regulator-max-microvolt =3D <520000=
0>;
> > > > > +                             regulator-name =3D "boost";
> > > > > +                     };
> > > > > +
> > > > > +                     reg_cpusldo: cpusldo {
> > > > > +                             /* unused */
> > > > > +                     };
> > > > > +             };
> > > > > +     };
> > > > > +
> > > > > +     rtc_ext: rtc@51 {
> > > > > +             compatible =3D "nxp,pcf8563";
> > > > > +             reg =3D <0x51>;
> > > > > +     };
> > > > > +};   =20
> > > >
> > > >   =20
> >  =20

