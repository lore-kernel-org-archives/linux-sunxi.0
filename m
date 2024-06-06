Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72EC013C67E
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Jun 2024 12:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717677323; cv=none; b=gGHCodYQoidSWjG/DpFDIa81r40xiPzbSXej9W2+S87UynzZVCS1zRsnS+dtiPaw4lJc2M2jGm73aczHZ1zNLnE8WgITuD4gXvza6TgyPW7fg3mWwWUxj2M8UsGQviSL/W7NDNTmuDaawW+nV6gojSuzHkDdmc4J8G6GjFn6zwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717677323; c=relaxed/simple;
	bh=sCPjVrukokJGZcygyXkUStl0v7oB68bT9GkUiMHhLy8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=trt3G+WVGxqmuh2QxGKBpNmghET71Bv1kZKL+VyPUy1aKwWdMdyCANsAudgAd6oFjm5bkVheEizJGng1V5Xd4iwXf14eMYjhD0Hf+lKxf7JMpNF6P8s06xWbVMhQP43JAvcAOLU+i8R4ApwZYPCpOP3m5+gxbIZ7mvU51CEraR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D1ED2F4;
	Thu,  6 Jun 2024 05:35:44 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E7AC3F64C;
	Thu,  6 Jun 2024 05:35:18 -0700 (PDT)
Date: Thu, 6 Jun 2024 13:35:15 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, mripard@kernel.org, ryan@testtoast.com,
 samuel@sholland.org, jernej.skrabec@gmail.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h700: Add Anbernic RG35XX-SP
Message-ID: <20240606133515.223b9c73@donnerap.manchester.arm.com>
In-Reply-To: <CAGb2v64uCCZSc0aY-gtcMNAhJAqDhb5=sPBJC=q0+nKwMO3f+A@mail.gmail.com>
References: <20240605185339.266833-1-macroalpha82@gmail.com>
	<20240605185339.266833-3-macroalpha82@gmail.com>
	<20240606105159.33a2b917@donnerap.manchester.arm.com>
	<CAGb2v64uCCZSc0aY-gtcMNAhJAqDhb5=sPBJC=q0+nKwMO3f+A@mail.gmail.com>
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

On Thu, 6 Jun 2024 19:58:07 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

Hi Chen-Yu,

> On Thu, Jun 6, 2024 at 5:52=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:
> >
> > On Wed,  5 Jun 2024 13:53:39 -0500
> > Chris Morgan <macroalpha82@gmail.com> wrote:
> > =20
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > >
> > > The Anbernic RG35XXSP is almost identical to the RG35XX-Plus, but in a
> > > clamshell form-factor. The key differences between the SP and the Plus
> > > is a lid switch and an RTC on the same i2c bus as the PMIC.
> > >
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/Makefile        |   3 +-
> > >  .../sun50i-h700-anbernic-rg35xx-sp.dts        | 145 ++++++++++++++++=
++
> > >  2 files changed, 147 insertions(+), 1 deletion(-)
> > >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anberni=
c-rg35xx-sp.dts
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot=
/dts/allwinner/Makefile
> > > index 0db7b60b49a1..00bed412ee31 100644
> > > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > > @@ -49,5 +49,6 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-orangepi-=
zero2w.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-orangepi-zero3.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h618-transpeed-8k618-t.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-2024.dtb
> > > -dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-plus.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-h.dtb
> > > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-plus.dtb
> > > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h700-anbernic-rg35xx-sp.dtb
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35x=
x-sp.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts
> > > new file mode 100644
> > > index 000000000000..a1d16b65ef5d
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dts
> > > @@ -0,0 +1,145 @@
> > > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +/*
> > > + * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
> > > + * Copyright (C) 2024 Chris Morgan <macroalpha82@gmail.com>.
> > > + */
> > > +
> > > +#include <dt-bindings/input/gpio-keys.h>
> > > +#include "sun50i-h700-anbernic-rg35xx-plus.dts"
> > > +
> > > +/ {
> > > +     model =3D "Anbernic RG35XX SP";
> > > +     compatible =3D "anbernic,rg35xx-sp", "allwinner,sun50i-h700";
> > > +
> > > +     gpio-keys-lid {
> > > +             compatible =3D "gpio-keys";
> > > +
> > > +             lid-switch {
> > > +                     label =3D "Lid Switch";
> > > +                     gpios =3D <&pio 4 7 GPIO_ACTIVE_LOW>; /* PE7 */
> > > +                     linux,can-disable;
> > > +                     linux,code =3D <SW_LID>;
> > > +                     linux,input-type =3D <EV_SW>;
> > > +                     wakeup-event-action =3D <EV_ACT_DEASSERTED>;
> > > +                     wakeup-source;
> > > +             };
> > > +     };
> > > +};
> > > +
> > > +/delete-node/ &r_rsb; =20
> >
> > I don't think deleting the *RSB* node is right here, if at all, I'd exp=
ect
> > status=3D"disabled", and then maybe deleting the axp717 node within?
> > Or maybe factor the AXP node out into a separate file, and include it f=
rom
> > the -2024.dts and from this one? =20
>=20
> Doesn't quite work because the unit address is different.

Ah, right, good point. It's a bit annoying because the node name itself is
mostly irrelevant, but I see that this wouldn't pass validation.

> > Or move every board to I2C? =20
>=20
> Doesn't this depend on the bootloader also running in RSB mode? My memory
> is a bit foggy on this, but IIRC we did a conversion on some other boards
> before?

In the SPL we use I2C only, mostly because we have an SPL capable I2C
driver already.
In U-Boot proper we use whatever the DT says, that should work like in the
kernel.
In TF-A we used to have one hardcoded transport per SoC, and that happens
to be RSB everywhere at the moment, but I have a patch series [1] to
determine this dynamically, via the DT. As it stands, that chooses the
transport by looking at the PMIC (I2C for the AXP313, RSB for the AXP717
or AXP305), but I think it's fairly easy to check for the status property
of both RSB and I2C, or look at the parent node of the AXP node to find
the transport protocol to use.
I will sketch something up.

Chris has plans to auto-detect the exact Anbernic model in U-Boot, and
switch to the right DT then automatically. IIUC I2C devices play a role in
this, so switching to I2C for all Anbernic models would make this more
viable.
It just leaves a bit of a bitter taste that we now model the DT after this
particular requirement, and not after what the hardware looks like.

Cheers,
Andre.

[1] https://review.trustedfirmware.org/q/topic:%22h616_pmics%22

> > What do people think about this? =20
>=20
> "disabled" in RSB node and deleting the axp717 node is probably the right
> thing to do.
>=20
>=20
> > Cheers,
> > Andre
> > =20
> > > +
> > > +&r_i2c {
> > > +     pinctrl-0 =3D <&r_i2c_pins>;
> > > +     pinctrl-names =3D "default";
> > > +     status =3D "okay";
> > > +
> > > +     axp717: pmic@34 {
> > > +             compatible =3D "x-powers,axp717";
> > > +             reg =3D <0x34>;
> > > +             interrupt-controller;
> > > +             #interrupt-cells =3D <1>;
> > > +             interrupt-parent =3D <&nmi_intc>;
> > > +             interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> > > +
> > > +             vin1-supply =3D <&reg_vcc5v>;
> > > +             vin2-supply =3D <&reg_vcc5v>;
> > > +             vin3-supply =3D <&reg_vcc5v>;
> > > +             vin4-supply =3D <&reg_vcc5v>;
> > > +
> > > +             regulators {
> > > +                     reg_dcdc1: dcdc1 {
> > > +                             regulator-always-on;
> > > +                             regulator-min-microvolt =3D <900000>;
> > > +                             regulator-max-microvolt =3D <1100000>;
> > > +                             regulator-name =3D "vdd-cpu";
> > > +                     };
> > > +
> > > +                     reg_dcdc2: dcdc2 {
> > > +                             regulator-always-on;
> > > +                             regulator-min-microvolt =3D <940000>;
> > > +                             regulator-max-microvolt =3D <940000>;
> > > +                             regulator-name =3D "vdd-gpu-sys";
> > > +                     };
> > > +
> > > +                     reg_dcdc3: dcdc3 {
> > > +                             regulator-always-on;
> > > +                             regulator-min-microvolt =3D <1100000>;
> > > +                             regulator-max-microvolt =3D <1100000>;
> > > +                             regulator-name =3D "vdd-dram";
> > > +                     };
> > > +
> > > +                     reg_aldo1: aldo1 {
> > > +                             /* 1.8v - unused */
> > > +                     }; =20
>=20
> You can drop all the unused ones, unless you plan to include *this*
> file from another one and use those nodes/labels.
>=20
> ChenYu
>=20
> > > +
> > > +                     reg_aldo2: aldo2 {
> > > +                             /* 1.8v - unused */
> > > +                     };
> > > +
> > > +                     reg_aldo3: aldo3 {
> > > +                             /* 1.8v - unused */
> > > +                     };
> > > +
> > > +                     reg_aldo4: aldo4 {
> > > +                             regulator-min-microvolt =3D <1800000>;
> > > +                             regulator-max-microvolt =3D <1800000>;
> > > +                             regulator-name =3D "vcc-pg";
> > > +                     };
> > > +
> > > +                     reg_bldo1: bldo1 {
> > > +                             /* 1.8v - unused */
> > > +                     };
> > > +
> > > +                     reg_bldo2: bldo2 {
> > > +                             regulator-always-on;
> > > +                             regulator-min-microvolt =3D <1800000>;
> > > +                             regulator-max-microvolt =3D <1800000>;
> > > +                             regulator-name =3D "vcc-pll";
> > > +                     };
> > > +
> > > +                     reg_bldo3: bldo3 {
> > > +                             /* 2.8v - unused */
> > > +                     };
> > > +
> > > +                     reg_bldo4: bldo4 {
> > > +                             /* 1.2v - unused */
> > > +                     };
> > > +
> > > +                     reg_cldo1: cldo1 {
> > > +                             /* 3.3v - audio codec - not yet impleme=
nted */
> > > +                     };
> > > +
> > > +                     reg_cldo2: cldo2 {
> > > +                             /* 3.3v - unused */
> > > +                     };
> > > +
> > > +                     reg_cldo3: cldo3 {
> > > +                             regulator-always-on;
> > > +                             regulator-min-microvolt =3D <3300000>;
> > > +                             regulator-max-microvolt =3D <3300000>;
> > > +                             regulator-name =3D "vcc-io";
> > > +                     };
> > > +
> > > +                     reg_cldo4: cldo4 {
> > > +                             regulator-min-microvolt =3D <3300000>;
> > > +                             regulator-max-microvolt =3D <3300000>;
> > > +                             regulator-name =3D "vcc-wifi";
> > > +                     };
> > > +
> > > +                     reg_boost: boost {
> > > +                             regulator-min-microvolt =3D <5000000>;
> > > +                             regulator-max-microvolt =3D <5200000>;
> > > +                             regulator-name =3D "boost";
> > > +                     };
> > > +
> > > +                     reg_cpusldo: cpusldo {
> > > +                             /* unused */
> > > +                     };
> > > +             };
> > > +     };
> > > +
> > > +     rtc_ext: rtc@51 {
> > > +             compatible =3D "nxp,pcf8563";
> > > +             reg =3D <0x51>;
> > > +     };
> > > +}; =20
> >
> > =20

