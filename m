Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA182F27
	for <linux-sunxi@lists.linux.dev>; Sat, 11 Feb 2023 15:15:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EA3D4B3;
	Sat, 11 Feb 2023 07:16:41 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C2873F71E;
	Sat, 11 Feb 2023 07:15:57 -0800 (PST)
Date: Sat, 11 Feb 2023 15:13:58 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: pelzi@flying-snail.de
Cc: Maxime Ripard <maxime@cerno.tech>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: allwinner: minimize irq debounce filter per
 default
Message-ID: <20230211151358.3467b4f9@slackpad.lan>
In-Reply-To: <ba463d40-3d39-a621-b198-191fdbe239a1@feldner-bv.de>
References: <Y+FaVorMl37F5Dve@debian-qemu.internal.flying-snail.de>
	<20230207011608.2ce24d17@slackpad.lan>
	<d0534762-3785-ec2d-8d1e-aba0e39f701b@feldner-bv.de>
	<20230209202952.673d5a60@slackpad.lan>
	<20230210082936.qefzz4fsp3jpalvp@houat>
	<20230210094425.474cfba5@donnerap.cambridge.arm.com>
	<20230210100620.z6j7rvkiwyu7paij@houat>
	<20230210101814.2d36ae57@donnerap.cambridge.arm.com>
	<ba463d40-3d39-a621-b198-191fdbe239a1@feldner-bv.de>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 11 Feb 2023 13:50:54 +0100
pelzi@flying-snail.de wrote:

Hi,

> Am 10.02.23 um 11:18 schrieb Andre Przywara:
> > On Fri, 10 Feb 2023 11:06:20 +0100
> > Maxime Ripard <maxime@cerno.tech> wrote:
> > =20
> >> On Fri, Feb 10, 2023 at 09:44:25AM +0000, Andre Przywara wrote: =20
> >>> On Fri, 10 Feb 2023 09:29:36 +0100
> >>> Maxime Ripard <maxime@cerno.tech> wrote:
> >>>
> >>> Hi Maxime,
> >>>
> >>> thanks for the reply!
> >>>     =20
> >>>> On Thu, Feb 09, 2023 at 08:29:52PM +0000, Andre Przywara wrote: =20
> >>>>>>>>    &pio {
> >>>>>>>> +	/* 1=C3=AF=C2=BF=C2=BDs debounce filter on both IRQ banks */ =
=20
> >>>>>>> Is that supposed to be <micro> in UTF-8? It seems to have got los=
t in
> >>>>>>> translation, or is that just me? =20
> >>>>>> O yes, the Greek character slipped into the comment. =20
> >>>>>>>> +	input-debounce =3D <1 1>; =20
> >>>>>>> As mentioned above, I am not so sure this is generic enough to pu=
t it
> >>>>>>> here for PA. And what is the significance of "1 us", in particula=
r? Is
> >>>>>>> that just the smallest value? =20
> >>>>>> Yes indeed it's a bit more complicated than I feel it needs to be.=
 The
> >>>>>> configuration is taken as microseconds and translated into the best
> >>>>>> matching clock and divider by the driver. However, 0 is not transl=
ated
> >>>>>> to the lowest divider of the high speed clock as would be logical =
if
> >>>>>> you ask for zero microseconds, but to "leave at default". The defa=
ult
> >>>>>> of the board is 0 in the register, translating to lowest divider o=
n the
> >>>>>> _low_ speed clock. =20
> >>>>> I'd say the "if (!debounce) continue;" code is just to defend again=
st
> >>>>> the division by zero, which would be the next statement to execute.
> >>>>>
> >>>>> We might want to change that to interpret 0 as "lowest possible", w=
hich
> >>>>> would be 24MHz/1. Please feel free to send a patch in this regard, =
and
> >>>>> CC: Maxime, to get some input on that idea. =20
> >>>> I never had any complaint on that part either, so the default looks =
sane
> >>>> to me.
> >>>>
> >>>> If some board needs a higher debouncing rate, then we should obvious=
ly
> >>>> set it up in the device tree of that board, but changing it for every
> >>>> user also introduces the risk of breaking other boards that actually
> >>>> require a lower debouncing frequency. =20
> >>> Yeah, we definitely should keep the default at 32KHz/1, as this is al=
so
> >>> the hardware reset value.
> >>>
> >>> Not sure if you were actually arguing this, but the change I sketched
> >>> above (interpreting 0 as 24MHz/1) is separate though, as the current
> >>> default is "no DT property", and not 0. There is no input-debounce
> >>> property user in the kernel tree at the moment, so we wouldn't break
> >>> anyone. The only thing that would change is if a downstream user was
> >>> relying on "0" being interpreted as "skip the setup", which isn't
> >>> really documented and could be argued to be an implementation detail.
> >>>
> >>> So I'd suggest to implement 0 as "lowest possible", and documenting t=
hat
> >>> and the 32KHz/1 default if no property is given. =20
> >> Ah, my bad.
> >>
> >> There's another thing to consider: there's already a generic per-pin
> >> input-debounce property in pinctrl.
> >>
> >> Since we can't control it per pin but per bank, we moved it to the
> >> controller back then, but there's always been this (implicit)
> >> expectation that it was behaving the same way.
> >>
> >> And the generic, per-pin, input-debounce documentation says:
> >> =20
> >>> Takes the debounce time in usec as argument or 0 to disable debouncin=
g =20
> >> I agree that silently ignoring it is not great, but interpreting 0 as
> >> the lowest possible is breaking that behaviour which, I believe, is a
> >> worse outcome. =20
> > Is it really? If I understand the hardware manuals correctly, we cannot
> > really turn that feature off, so isn't the lowest possible time period =
(24
> > MHz/1 at the moment) the closest we can get to "turn it off"? So
> > implementing this would bring us actually closer to the documented
> > behaviour? Or did I get the meaning of this time period wrong?
> > At least that's my understanding of how it fixed Andreas' problem: 1=C2=
=B5s
> > is still not "off", but much better than the 31=C2=B5s of the default. =
The new
> > 0 would then be 0.041=C2=B5s. =20
> I would fully agree. There seems to be no way to turn off the debouncing
> filter, and in terms of that filter, the lowest possible time is closest=
=20
> to "off".
> The SoC default is equivalent to 31 us, far, far away from "off", the=20
> currently
> configurable minimum is 1us.
>=20
> I did a patch that enables to set "0" in the device tree configuration=20
> and it
> takes care not to do a #div0, but to determine the lowest possible time. =
As
> the patch is done in the driver for a device that cannot switch off=20
> debouncing,
> I'd say, the driver patched in that way does its best to come as close=20
> to the
> intended outcome as is possible.
>=20
> I tested this setting on the Banana M2 Zero board, and it is working (does
> the right thing setting the relevant registers to value 0x0001, and the=20
> board
> works in general, w/o producing smoke. (I have no idea how to test if
> the debouncing filter is actually faster with setting "0" than with=20
> setting "1",
> I can only confirm it is not significantly slower).
>=20
> If we can agree on a concrete way to go I'm happy to try to produce a new
> patch version. My suggestion from the discussion:
>=20
> - Change drivers/pinctrl/sunxi/pinctrl-sunxi.c to set the minimum
>  =C2=A0=C2=A0 possible filter time when input-debounce is configured to "=
0"
>  =C2=A0=C2=A0 (corresponding to 1 on the affected hardware register).
>  =C2=A0=C2=A0 What I don't like is the huge gap between configuration 1 a=
nd 0, but
>  =C2=A0=C2=A0 I have no idea what to do about it without breaking all com=
patibility.

I wouldn't be concerned about this gap, as 0 is supposed to mean off,
so there is already an expectation of a fundamentally different
behaviour. Plus the interface chose microseconds for a reason, I guess
for mechanical debouncing a resolution of 1 microsecond is more than
enough.
Can you please send this patch, so that we can have any potential
discussion there, on the code? And please add a Fixes: tag, so it can
be backported to stable kernels.

> - in arch/arm/boot/dts/sunxi-h3-h5.dtsi, set input-debounce <31 31>
>  =C2=A0=C2=A0 corresponding to the default "0" in both affected hardware =
registers.
>  =C2=A0=C2=A0 Note that the clocks hosc and losc that make this 31 map to=
 0 are
>  =C2=A0=C2=A0 configured exactly here.

I am not fully decided on that, but there are some good points to it.

> - in arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts, set
>  =C2=A0=C2=A0 input-debounce <31 0> as this board has electronic devices
>  =C2=A0=C2=A0 attached to bank G and only exposes bank A to its users.
>  =C2=A0=C2=A0 I'd like to advertise on that one: this board does not requ=
ire
>  =C2=A0=C2=A0 debouncing on bank G. Plus it feels the board got more stab=
le
>  =C2=A0=C2=A0 by this setting: my BananaPi is connected via WiFi (only) a=
nd in the
>  =C2=A0=C2=A0 past it went apparently dead every other day or so. Nothing=
 like
>  =C2=A0=C2=A0 this happened after switching off input debounce. Anectdotal
>  =C2=A0=C2=A0 evidence, I know...

I am not convinced of that, for the generic DT in the kernel tree. For
a start, I wouldn't use 0, as this does not do the right thing on older
kernels. But again, I haven't heard of error reports, so I am a bit
reluctant to change that setting.
There are reports of unstable WiFi, but IIUC mostly due to the poor
WiFi chip design and quality or driver problems.

If you can prove this more conclusively, that would be worth
considering, though.

> - (in my devicetree overlay, I set input-debounce <0 0> to make IRQ
>  =C2=A0=C2=A0 based drivers like drivers/iio/humidity/dht11.c work on ban=
k A) -
>  =C2=A0=C2=A0 not part of the patch.

Yes, but again I'd recommend to use <1 1>, as this is more compatible,
in case you happen to load a stable kernel.

> Would that appear right?
>=20
> Best regards,
>=20
> Andreas.
>=20
> PS: Perhaps someone can point me to further reading regarding
> drivers for electronic devices attached to GPIO. Assuming I want
> to attach a device to a GPIO that is not accidentally covered by
> hardware support of the pinctrl subsystem, what options do I
> have _apart_ from registering edge IRQs to react on a digital
> signal from that device? Isn't it called bit-banging and the
> usual technique?

I am not sure what you mean with "not accidentally covered ...", do you
mean using a hardware peripheral interface like an I2C or SPI
controller?
Yes, there are some examples of bit-banging devices in the kernel,
though it's not considered very efficient, but one might not have a
choice, mostly.

Cheers,
Andre
