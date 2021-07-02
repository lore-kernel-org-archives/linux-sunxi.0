Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C0472
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Jul 2021 12:24:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E82021FB;
	Fri,  2 Jul 2021 05:24:39 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 057123F718;
	Fri,  2 Jul 2021 05:24:38 -0700 (PDT)
Date: Fri, 2 Jul 2021 13:24:09 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: qianfan <qianfanguijin@163.com>, wens@csie.org,
 linux-sunxi@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: sun8i: r40: bananapi-m2-ultra: Enable
 usb_otg
Message-ID: <20210702132409.6c2e7bd4@slackpad.fritz.box>
In-Reply-To: <20210702120601.22k44u6cdlag57ku@gilmour>
References: <20210701015009.13985-1-qianfanguijin@163.com>
	<20210701015009.13985-3-qianfanguijin@163.com>
	<20210701153720.42c1f512@slackpad.fritz.box>
	<CAGb2v67-BAn=OMid-=MoJ15QUdt0NQ2RVfLTN-bkgUstyXNj2A@mail.gmail.com>
	<55b9f018-95da-fe3f-24a4-c499babb9ef3@163.com>
	<20210702120601.22k44u6cdlag57ku@gilmour>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 2 Jul 2021 14:06:01 +0200
Maxime Ripard <maxime@cerno.tech> wrote:

Hi,

> On Fri, Jul 02, 2021 at 10:46:20AM +0800, qianfan wrote:
> >=20
> > =E5=9C=A8 2021/7/1 22:47, Chen-Yu Tsai =E5=86=99=E9=81=93: =20
> > > On Thu, Jul 1, 2021 at 10:37 PM Andre Przywara <andre.przywara@arm.co=
m> wrote: =20
> > > > On Thu,  1 Jul 2021 09:50:09 +0800
> > > > qianfanguijin@163.com wrote:
> > > >=20
> > > > Hi,
> > > >  =20
> > > > > From: qianfan Zhao <qianfanguijin@163.com>
> > > > >=20
> > > > > Enable it.
> > > > >=20
> > > > > Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> > > > > ---
> > > > >   arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 14 ++++++++=
++++++
> > > > >   1 file changed, 14 insertions(+)
> > > > >=20
> > > > > diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/=
arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> > > > > index a6a1087a0c9b..072535b383b5 100644
> > > > > --- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> > > > > +++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
> > > > > @@ -43,6 +43,7 @@
> > > > >=20
> > > > >   /dts-v1/;
> > > > >   #include "sun8i-r40.dtsi"
> > > > > +#include "sunxi-common-regulators.dtsi"
> > > > >=20
> > > > >   #include <dt-bindings/gpio/gpio.h>
> > > > >=20
> > > > > @@ -299,6 +300,11 @@
> > > > >        regulator-name =3D "vdd1v2-sata";
> > > > >   };
> > > > >=20
> > > > > +&reg_usb0_vbus {
> > > > > +     gpio =3D <&pio 8 13 GPIO_ACTIVE_HIGH>; /* PI13 */
> > > > > +     status =3D "okay";
> > > > > +}; =20
> > > > So there is the same USB0-DRVVBUS signal connected to this GPIO, but
> > > > also to the AXP's N_VBUSEN line.
> > > >=20
> > > > Not sure if that means either of them can control the voltage? =20
> > > It's better to use N_VBUSEN if that is connected. Since the PMIC
> > > may have that pin already enabled, it can cause issues with VBUS
> > > input not being correctly used. =20
> >
> > I had checked some boards in linux such as sun7i-a20-olinuxino-lime2.dt=
s,
> > they has the same design
> >=20
> > that enable VBUS by using a gpio and then connect this gpio to PMIC.
> >=20
> > there is a example:
> >=20
> > ./sun7i-a20-olinuxino-lime2.dts:&reg_usb0_vbus {
> > ./sun7i-a20-olinuxino-lime2.dts-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 gpio =3D <&pio 2 17 GPIO_ACTIVE_HIGH>;
> > ./sun7i-a20-olinuxino-lime2.dts-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 status =3D "okay";
> > ./sun7i-a20-olinuxino-lime2.dts-}; =20
>=20
> IIRC, the AXP209 typically used with these boards doesn't have a
> N_VBUSEN line

According to the Lime2 schematic and the AXP209 data sheet from the Wiki
it does have N_VBUSEN, from a quick glance with the usual
functionality. And the connection on the Lime2 looks indeed the same,
USB0_DRVVBUS connected to both the PMIC and a GPIO.
(Also the BPi-M2 Ultra has an AXP221 anyway.)

I would lean towards Chen-Yu's suggestion (use the PMIC).
It seems like my BPi M2 Berry uses the same layout, so I can do some
experiments later.

Cheers,
Andre
