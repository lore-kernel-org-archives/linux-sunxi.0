Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B825236A
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Feb 2023 20:31:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A72134B3;
	Thu,  9 Feb 2023 12:32:28 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AC993F703;
	Thu,  9 Feb 2023 12:31:44 -0800 (PST)
Date: Thu, 9 Feb 2023 20:29:52 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Andreas Feldner <andreas@feldner-bv.de>
Cc: Andreas Feldner <pelzi@flying-snail.de>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Maxime Ripard
 <mripard@kernel.org>
Subject: Re: [PATCH] ARM: dts: allwinner: minimize irq debounce filter per
 default
Message-ID: <20230209202952.673d5a60@slackpad.lan>
In-Reply-To: <d0534762-3785-ec2d-8d1e-aba0e39f701b@feldner-bv.de>
References: <Y+FaVorMl37F5Dve@debian-qemu.internal.flying-snail.de>
 <20230207011608.2ce24d17@slackpad.lan>
 <d0534762-3785-ec2d-8d1e-aba0e39f701b@feldner-bv.de>
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

On Wed, 8 Feb 2023 13:50:04 +0100
Andreas Feldner <andreas@feldner-bv.de> wrote:

Hi Andreas,

CC:ing Maxime, who wrote the debouncing code back then.

> Am 07.02.23 um 02:16 schrieb Andre Przywara:
> > On Mon, 6 Feb 2023 20:51:50 +0100
> > Andreas Feldner <pelzi@flying-snail.de> wrote:
> >
> > Hi Andreas,
> >
> > thanks for taking care about this board and sending patches! =20
> Thank YOU for maintaining it!
> >> The SoC features debounce logic for external interrupts. Per default,
> >> this is based on a 32kHz oscillator, in effect filtering away multiple
> >> interrupts separated by less than roughly 100=C3=AF=C2=BF=C2=BDs.
> >>
> >> This patch sets different defaults for this filter for this board:
> >> PG is connected to non-mechanical components, without any risk for
> >> showing bounces. PA is mostly exposed to GPIO pins, however the
> >> existence of a debounce filter is undesirable as well if electronic
> >> components are connected. =20
> > So how do you know if that's the case? It seems to be quite normal to
> > just connect mechanical switches to GPIO pins.
> >
> > If you are trying to fix a particular issue you encountered, please
> > describe that here, and say how (or at least that) the patch fixes it.
> >
> > And I would suggest to treat port G and port A differently. If you
> > need a lower debounce threshold for port A, you can apply a DT overlay
> > in U-Boot, just for your board. =20
>=20
> Fair enough. You run into problems when you connect (electronic)
> devices to bank A (typically by the 40pin CON2 connector), where
> the driver requires fast IRQs to work. In my case this has been a
> DHT22 sensor, and the default debounce breaking the dht11.ko
> driver.

Sure, what I meant is that this is a property of your particular
setup (because you attach something to the *headers*) , so it shouldn't
be in the generic DT, but just in your copy. Which ideally means using
a DT overlay.

> Now, what kind of problem is this - I'm no way sure:
>=20
> a) is it an unlucky default, because whoever connects a mechanical
> switch will know about the problem of bouncing and be taking
> care to deal with it (whereas at least I was complete unsuspecting
> when connecting an electronic device that a debounce function
> might be in place), or

The Linux default is basically the reset default: just leave the
register at 0x0. It seems like you cannot really turn that off at all
in hardware, and the reset setting is indeed 32KHz/1. So far there
haven't been any complaints, though I don't know if people just
don't use it in anger, or cannot be bothered to send a report to the
list.

> b) is it a bug in the devicetree for (at least) the BananaPi M2 Zero,
> because the IRQ bank G is hard wired to electronic devices that
> should not be fenced by a debouncing function, or

Well, we could try to turn that "off" as much as possible, but on the
other hand the debounce only affects *GPIO* *interrupts*, so not sure
that gives us anything. The PortG pins are used for the SDIO Wifi, BT
UART, and the wakeup pins for the Wifi chip. Only the wakeup pins would
be affected, and I doubt that we wake up that often that it matters. If
you've made other observations, please let me know.

Certainly no board with an in-tree DT sets the debounce property, which
means everyone uses 32KHz/1, and also did so before the functionality
was introduced.

I'd say we should try to only fix things that are actually broken: hence
I was asking whether you have seen actual problems. Which apparently you
have, with your sensor, but not on PortG?

> c) is it missing dt binding documentation of the input-debounce
> attribute?

Documentation for what, exactly? The default behaviour? Yes, we should
add that, though not sure that really belongs into the binding.

> Anyway, the combination of these is quite irritating. To me it
> seems a sufficiently elegant solution to explicitly include the
> setting in the devicetree and leave it to whoever is unhappy
> with it, to create a better suited device tree overlay.
>=20
> >> Additionally, the clock-frequency attribute is added for each of
> >> the 4 cores to eliminate the kernel error message on boot, that
> >> the attribute is missing.
> >>
> >> Signed-off-by: Andreas Feldner <pelzi@flying-snail.de>
> >> ---
> >>   .../dts/sun8i-h2-plus-bananapi-m2-zero.dts     | 18 ++++++++++++++++=
++
> >>   1 file changed, 18 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts b/ar=
ch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> >> index d729b7c705db..1fc0d5d1e51a 100644
> >> --- a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> >> +++ b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
> >> @@ -113,6 +113,22 @@ wifi_pwrseq: wifi_pwrseq {
> >>  =20
> >>   &cpu0 {
> >>   	cpu-supply =3D <&reg_vdd_cpux>;
> >> +	clock-frequency =3D <1296000000>; =20
> > I see where you are coming from, this is really an unnecessary warning
> > message. However this message should be really removed from the kernel
> > instead of adding some rather meaningless value here.
> > The current DT spec marks this property as required, though, so I added
> > a PR there to get this fixed:
> > https://github.com/devicetree-org/devicetree-specification/pull/61
> > Once this is through, we can try to remove the kernel message. =20
>=20
> OK, so I'll take care to have this change removed from my patch.
> I thought so, but then it was the configuration I'd been testing with...
>=20
> >> +};
> >> +
> >> +&cpu1 {
> >> +	cpu-supply =3D <&reg_vdd_cpux>; =20
> > I don't think we need this for every core? =20
>=20
> I came across a discussion that this was marked required on the
> cpu@... level whereas it would make sense on the cpus level. I did
> not check if this suggestion was implemented in the meantime,
> sorry!
>=20
> >> +	clock-frequency =3D <1296000000>;
> >> +};
> >> +
> >> +&cpu2 {
> >> +	cpu-supply =3D <&reg_vdd_cpux>;
> >> +	clock-frequency =3D <1296000000>;
> >> +};
> >> +
> >> +&cpu3 {
> >> +	cpu-supply =3D <&reg_vdd_cpux>;
> >> +	clock-frequency =3D <1296000000>;
> >>   };
> >>  =20
> >>   &de {
> >> @@ -193,6 +209,8 @@ bluetooth {
> >>   };
> >>  =20
> >>   &pio {
> >> +	/* 1=C3=AF=C2=BF=C2=BDs debounce filter on both IRQ banks */ =20
> > Is that supposed to be <micro> in UTF-8? It seems to have got lost in
> > translation, or is that just me? =20
> O yes, the Greek character slipped into the comment.
> >> +	input-debounce =3D <1 1>; =20
> > As mentioned above, I am not so sure this is generic enough to put it
> > here for PA. And what is the significance of "1 us", in particular? Is
> > that just the smallest value? =20
>=20
> Yes indeed it's a bit more complicated than I feel it needs to be. The
> configuration is taken as microseconds and translated into the best
> matching clock and divider by the driver. However, 0 is not translated
> to the lowest divider of the high speed clock as would be logical if
> you ask for zero microseconds, but to "leave at default". The default
> of the board is 0 in the register, translating to lowest divider on the
> _low_ speed clock.

I'd say the "if (!debounce) continue;" code is just to defend against
the division by zero, which would be the next statement to execute.

We might want to change that to interpret 0 as "lowest possible", which
would be 24MHz/1. Please feel free to send a patch in this regard, and
CC: Maxime, to get some input on that idea.

> To me this is mindboggling.
>=20
> If you want to keep IRQ bank A as it is today and switch off the
> definitely unnecessary (and _potentially_ IRQ eating) debounce off
> for bank G only, I'd suggest the following setting:
>=20
>  =C2=A0=C2=A0=C2=A0 input-debounce =3D <31 1>;

It should be documented that the effective default is 31, I guess the
binding is the right place.

> This is because 31 Microseconds is exactly the time that is best
> matched by the low speed clock with low divider and translated
> to a 0 in the config register by the driver.
>=20
> The absolutely equivalent setting, with the only drawback that it
> would have confused me to death is:
>=20
>  =C2=A0=C2=A0=C2=A0 input-debounce =3D <0 1>;
>=20
> (because it skips setting IRQ bank A debouncing, leaving it at 31.25 us)
>=20
> Or, and that was my suggestion, you set both correctly for
> electronic devices and leave the task of switching on debouncing
> to the implementors of applications with mechanical switches:
>=20
>  =C2=A0=C2=A0=C2=A0 input-debounce =3D <1 1>;
>=20
> To me, any of these being present in the devicetree would have been
> of great help, because I would have seen that there is something
> to set.
>=20
>=20
> One final question: how would you like this change:
>=20
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> @@ -1467,6 +1467,10 @@ static int sunxi_pinctrl_setup_debounce(struct=20
> sunxi_pinctrl *pctl,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 writel(src | div << 4,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pctl->membase +
> sunxi_irq_debounce_reg_from_bank(pctl->desc, i));
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 pr_info("Debounce filter for IRQ bank %d configured to "
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%d us (reg %x=
)\n",
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i, debounce, s=
rc | div << 4);

That looks certainly useful, please send a proper patch.

Cheers,
Andre

>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>=20
> It helped me to cross-check what the driver is really doing, and it
> again would have helped me with me DHT problem to learn about
> the existence of a debouncing filter.
>=20
> Yours,
>=20
> Andreas.
>=20
>=20

