Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCE146BD
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Jun 2023 08:50:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 356D42F4;
	Mon, 26 Jun 2023 01:50:55 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 948F73F73F;
	Mon, 26 Jun 2023 01:50:09 -0700 (PDT)
Date: Mon, 26 Jun 2023 09:50:05 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Chris Morgan  <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, Chris Morgan
 <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/3] arm: dts: sun8i: V3s: Add pinctrl for pwm
Message-ID: <20230626095005.4a95c151@donnerap.cambridge.arm.com>
In-Reply-To: <45cfb4dc93de59a539d48a37b9becffa4d2d6278.camel@icenowy.me>
References: <20230620200022.295674-1-macroalpha82@gmail.com>
	<20230620200022.295674-2-macroalpha82@gmail.com>
	<20230621005000.558b660c@slackpad.lan>
	<45cfb4dc93de59a539d48a37b9becffa4d2d6278.camel@icenowy.me>
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

On Sat, 24 Jun 2023 12:57:49 +0800
Icenowy Zheng <uwu@icenowy.me> wrote:

> =E5=9C=A8 2023-06-21=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 00:50 +0100=EF=
=BC=8CAndre Przywara=E5=86=99=E9=81=93=EF=BC=9A
> > On Tue, 20 Jun 2023 15:00:20 -0500
> > Chris Morgan <macroalpha82@gmail.com> wrote:
> >=20
> > Hi Chris,
> >=20
> > thanks for taking care of upstreaming, cute little device.
> >  =20
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > >=20
> > > Add a default pinctrl for the pwm function.
> > >=20
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com> =20
> >=20
> >  =20
> > > ---
> > > =C2=A0arch/arm/boot/dts/sun8i-v3s.dtsi | 7 +++++++
> > > =C2=A01 file changed, 7 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi
> > > b/arch/arm/boot/dts/sun8i-v3s.dtsi
> > > index b001251644f7..e5977524abe2 100644
> > > --- a/arch/arm/boot/dts/sun8i-v3s.dtsi
> > > +++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
> > > @@ -414,6 +414,11 @@ mmc1_pins: mmc1-pins {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bias-pull-up;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
};
> > > =C2=A0
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pwm=
_pins: pwm-pins {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pins =3D "PB4";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0function =3D "pwm0";
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0};
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
spi0_pins: spi0-pins {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pins =3D "PC0", "PC1", "PC2=
", "PC3";
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0function =3D "spi0";
> > > @@ -441,6 +446,8 @@ pwm: pwm@1c21400 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "a=
llwinner,sun7i-a20-pwm";
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
reg =3D <0x01c21400 0xc>;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
clocks =3D <&osc24M>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pin=
ctrl-0 =3D <&pwm_pins>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pin=
ctrl-names =3D "default"; =20
> >=20
> > How is this supposed to work with multiple channels? There is PWM1 on
> > PB5. If one wants to potentially use that, we would need to add a
> > reference to those pins here as well, and they would all be muxed to
> > PWM upon the PWM controller probing?
> >=20
> > So while I see that it's the only output pin for PWM0, this might
> > still
> > need to go into the board .dts, alongside the status =3D "okay"; line.
> > So
> > each board would specify exactly the pins it needs (PWM0 only, PWM1
> > only, both or none). =20
>=20
> Maybe we should have two PWM pinctrl nodes, pwm0_pins and pwm1_pins,
> and then enable the controller (with the pinctrl property) in
> individual board DTs.

Yes, that's what I meant: keep the pinctrl node in the .dtsi here, but move
the pinctrl *properties* to each board's .dts.

Cheers,
Andre

> > Otherwise I compared this against the manual and Linux pinctrl
> > driver,
> > it all matches up.
> >=20
> > Cheers,
> > Andre
> >  =20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
#pwm-cells =3D <3>;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
status =3D "disabled";
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0}; =20
> >  =20
>=20

