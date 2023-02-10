Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463F3A29
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Feb 2023 09:44:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD8552F4;
	Fri, 10 Feb 2023 01:45:12 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B483E3F71E;
	Fri, 10 Feb 2023 01:44:28 -0800 (PST)
Date: Fri, 10 Feb 2023 09:44:25 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Andreas Feldner <andreas@feldner-bv.de>, Andreas Feldner
 <pelzi@flying-snail.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: allwinner: minimize irq debounce filter per
 default
Message-ID: <20230210094425.474cfba5@donnerap.cambridge.arm.com>
In-Reply-To: <20230210082936.qefzz4fsp3jpalvp@houat>
References: <Y+FaVorMl37F5Dve@debian-qemu.internal.flying-snail.de>
	<20230207011608.2ce24d17@slackpad.lan>
	<d0534762-3785-ec2d-8d1e-aba0e39f701b@feldner-bv.de>
	<20230209202952.673d5a60@slackpad.lan>
	<20230210082936.qefzz4fsp3jpalvp@houat>
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

On Fri, 10 Feb 2023 09:29:36 +0100
Maxime Ripard <maxime@cerno.tech> wrote:

Hi Maxime,

thanks for the reply!

> On Thu, Feb 09, 2023 at 08:29:52PM +0000, Andre Przywara wrote:
> > > >>   &pio {
> > > >> +	/* 1=C3=AF=C2=BF=C2=BDs debounce filter on both IRQ banks */ =20
> > > > Is that supposed to be <micro> in UTF-8? It seems to have got lost =
in
> > > > translation, or is that just me? =20
> > > O yes, the Greek character slipped into the comment. =20
> > > >> +	input-debounce =3D <1 1>; =20
> > > > As mentioned above, I am not so sure this is generic enough to put =
it
> > > > here for PA. And what is the significance of "1 us", in particular?=
 Is
> > > > that just the smallest value?   =20
> > >=20
> > > Yes indeed it's a bit more complicated than I feel it needs to be. The
> > > configuration is taken as microseconds and translated into the best
> > > matching clock and divider by the driver. However, 0 is not translated
> > > to the lowest divider of the high speed clock as would be logical if
> > > you ask for zero microseconds, but to "leave at default". The default
> > > of the board is 0 in the register, translating to lowest divider on t=
he
> > > _low_ speed clock. =20
> >=20
> > I'd say the "if (!debounce) continue;" code is just to defend against
> > the division by zero, which would be the next statement to execute.
> >=20
> > We might want to change that to interpret 0 as "lowest possible", which
> > would be 24MHz/1. Please feel free to send a patch in this regard, and
> > CC: Maxime, to get some input on that idea. =20
>=20
> I never had any complaint on that part either, so the default looks sane
> to me.
>=20
> If some board needs a higher debouncing rate, then we should obviously
> set it up in the device tree of that board, but changing it for every
> user also introduces the risk of breaking other boards that actually
> require a lower debouncing frequency.

Yeah, we definitely should keep the default at 32KHz/1, as this is also
the hardware reset value.

Not sure if you were actually arguing this, but the change I sketched
above (interpreting 0 as 24MHz/1) is separate though, as the current
default is "no DT property", and not 0. There is no input-debounce
property user in the kernel tree at the moment, so we wouldn't break
anyone. The only thing that would change is if a downstream user was
relying on "0" being interpreted as "skip the setup", which isn't
really documented and could be argued to be an implementation detail.

So I'd suggest to implement 0 as "lowest possible", and documenting that
and the 32KHz/1 default if no property is given.

> And any default is always going to be debated, there's one, it seems to
> create little controversy, it seems to work in most case, I'd just stick
> with it.

Agreed.

Cheers,
Andre.

>=20
> > > To me this is mindboggling.
> > >=20
> > > If you want to keep IRQ bank A as it is today and switch off the
> > > definitely unnecessary (and _potentially_ IRQ eating) debounce off
> > > for bank G only, I'd suggest the following setting:
> > >=20
> > >  =C2=A0=C2=A0=C2=A0 input-debounce =3D <31 1>; =20
> >=20
> > It should be documented that the effective default is 31, I guess the
> > binding is the right place. =20
>=20
> Yeah, if the documentation is lacking, we should definitely improve it.
>=20
> Maxime

