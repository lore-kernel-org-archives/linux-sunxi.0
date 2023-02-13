Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30D97E
	for <linux-sunxi@lists.linux.dev>; Mon, 13 Feb 2023 01:53:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B97EB4B3;
	Sun, 12 Feb 2023 17:54:25 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65B3D3F881;
	Sun, 12 Feb 2023 17:53:40 -0800 (PST)
Date: Mon, 13 Feb 2023 01:51:31 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Andreas Feldner <pelzi@flying-snail.de>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Andreas
 Feldner <andreas@feldner-bv.de>
Subject: Re: [PATCH] ARM: dts: allwinner: minimize irq debounce filter per
 default
Message-ID: <20230213015131.6da11658@slackpad.lan>
In-Reply-To: <76a1cabd-f173-f86a-423a-ba5be7c1efd0@sholland.org>
References: <Y+FaVorMl37F5Dve@debian-qemu.internal.flying-snail.de>
	<20230207011608.2ce24d17@slackpad.lan>
	<d0534762-3785-ec2d-8d1e-aba0e39f701b@feldner-bv.de>
	<20230209202952.673d5a60@slackpad.lan>
	<76a1cabd-f173-f86a-423a-ba5be7c1efd0@sholland.org>
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

On Sat, 11 Feb 2023 13:45:37 -0600
Samuel Holland <samuel@sholland.org> wrote:

Hi Samuel,

> On 2/9/23 14:29, Andre Przywara wrote:
> > On Wed, 8 Feb 2023 13:50:04 +0100
> > Andreas Feldner <andreas@feldner-bv.de> wrote:
> >=20
> > Hi Andreas,
> >=20
> > CC:ing Maxime, who wrote the debouncing code back then.
> >  =20
> >> Am 07.02.23 um 02:16 schrieb Andre Przywara: =20
> >>> On Mon, 6 Feb 2023 20:51:50 +0100
> >>> Andreas Feldner <pelzi@flying-snail.de> wrote:
> >>>
> >>> Hi Andreas,
> >>>
> >>> thanks for taking care about this board and sending patches!   =20
> >> Thank YOU for maintaining it! =20
> >>>> The SoC features debounce logic for external interrupts. Per default,
> >>>> this is based on a 32kHz oscillator, in effect filtering away multip=
le
> >>>> interrupts separated by less than roughly 100=C3=AF=C2=BF=C2=BDs.
> >>>>
> >>>> This patch sets different defaults for this filter for this board:
> >>>> PG is connected to non-mechanical components, without any risk for
> >>>> showing bounces. PA is mostly exposed to GPIO pins, however the
> >>>> existence of a debounce filter is undesirable as well if electronic
> >>>> components are connected.   =20
> >>> So how do you know if that's the case? It seems to be quite normal to
> >>> just connect mechanical switches to GPIO pins.
> >>>
> >>> If you are trying to fix a particular issue you encountered, please
> >>> describe that here, and say how (or at least that) the patch fixes it.
> >>>
> >>> And I would suggest to treat port G and port A differently. If you
> >>> need a lower debounce threshold for port A, you can apply a DT overlay
> >>> in U-Boot, just for your board.   =20
> >>
> >> Fair enough. You run into problems when you connect (electronic)
> >> devices to bank A (typically by the 40pin CON2 connector), where
> >> the driver requires fast IRQs to work. In my case this has been a
> >> DHT22 sensor, and the default debounce breaking the dht11.ko
> >> driver. =20
> >=20
> > Sure, what I meant is that this is a property of your particular
> > setup (because you attach something to the *headers*) , so it shouldn't
> > be in the generic DT, but just in your copy. Which ideally means using
> > a DT overlay.
> >  =20
> >> Now, what kind of problem is this - I'm no way sure:
> >>
> >> a) is it an unlucky default, because whoever connects a mechanical
> >> switch will know about the problem of bouncing and be taking
> >> care to deal with it (whereas at least I was complete unsuspecting
> >> when connecting an electronic device that a debounce function
> >> might be in place), or =20
> >=20
> > The Linux default is basically the reset default: just leave the
> > register at 0x0. It seems like you cannot really turn that off at all
> > in hardware, and the reset setting is indeed 32KHz/1. So far there
> > haven't been any complaints, though I don't know if people just
> > don't use it in anger, or cannot be bothered to send a report to the
> > list.
> >  =20
> >> b) is it a bug in the devicetree for (at least) the BananaPi M2 Zero,
> >> because the IRQ bank G is hard wired to electronic devices that
> >> should not be fenced by a debouncing function, or =20
> >=20
> > Well, we could try to turn that "off" as much as possible, but on the
> > other hand the debounce only affects *GPIO* *interrupts*, so not sure
> > that gives us anything. The PortG pins are used for the SDIO Wifi, BT
> > UART, and the wakeup pins for the Wifi chip. Only the wakeup pins would
> > be affected, and I doubt that we wake up that often that it matters. If
> > you've made other observations, please let me know.
> >=20
> > Certainly no board with an in-tree DT sets the debounce property, which
> > means everyone uses 32KHz/1, and also did so before the functionality
> > was introduced. =20
>=20
> One side note relevant to wakeup pins: if the debounce clock source is
> set to HOSC, and the 24 MHz oscillator is disabled, then IRQs for those
> pins will never fire.

That's a good point.

> Currently, Crust does not check the debounce configuration when deciding
> if it can turn off the 24 MHz crystal during system suspend (or fake-off
> on boards without PMICs), so any wakeup-capable GPIOs need to use LOSC
> as their debounce clock.
>=20
> Do you have any thoughts about if/how we should handle this
> automatically? Should Linux (or Crust) override the debounce
> configuration when entering suspend?

My feeling is since it's Crust's decision to disable the 24MHz
oscillator, it should make sure that's a workable configuration. So it
would be Crust's responsibility to avoid using 24 MHz as the debounce
clock, I'd say. There could be an argument about Linux re-initialising
the GPIO during resume, but that wouldn't help you anyway.

> I imagine no wakeup source will
> require a particularly short debounce time.

Since it all seems to work fine with the current 32KHz/1 setup, I
wouldn't expect any issues due to too short pulses being eaten by the
debouncing logic. And a too short debounce period shouldn't matter for
wakeup either, since it's the first edge that counts.

Cheers,
Andre
