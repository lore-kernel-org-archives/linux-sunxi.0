Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22AD4A3E
	for <linux-sunxi@lists.linux.dev>; Wed,  6 Jul 2022 13:17:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2118C106F;
	Wed,  6 Jul 2022 06:17:01 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6860C3F792;
	Wed,  6 Jul 2022 06:16:59 -0700 (PDT)
Date: Wed, 6 Jul 2022 14:16:55 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Icenowy Zheng <icenowy@aosc.io>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 3/6] arm64: dts: allwinner: Add Allwinner H616 .dtsi
 file
Message-ID: <20220706141655.15d2dd0e@donnerap.cambridge.arm.com>
In-Reply-To: <5278570.Sb9uPGUboI@kista>
References: <20220428230933.15262-1-andre.przywara@arm.com>
	<22699277.6Emhk5qWAg@kista>
	<20220704225534.3e1a901a@slackpad.lan>
	<5278570.Sb9uPGUboI@kista>
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

On Tue, 05 Jul 2022 19:32:26 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

so after seemingly having finished writing this email, I realised that
this won't really help, as I think this diverts the discussion. And the
problem has been around for a while, and won't probably be solved easily
or quickly. I think we agree to disagree here, or we should admit that
there are different approaches ("bundled firmware" vs. "UEFI"), so in the
interest of not blocking the H616 series:

Shall I just keep the firmware node? This would work both ways, whereas
dropping the node would impede the "bundled firmware" approach?

Answers and replies, as mentioned going potentially a bit off-topic, below.

> Dne ponedeljek, 04. julij 2022 ob 23:58:02 CEST je Andre Przywara napisal=
(a):
> > On Mon, 04 Jul 2022 20:42:47 +0200
> > Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
> >=20
> > Hi Jernej,
> >  =20
> > > Dne ponedeljek, 04. julij 2022 ob 15:30:57 CEST je Andre Przywara  =20
> napisal(a):
> > > > On Sat, 02 Jul 2022 23:16:53 +0200
> > > > Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
> > > >=20
> > > > Hi Jernej,
> > > >  =20
> > > > > Dne =C4=8Detrtek, 30. junij 2022 ob 02:04:10 CEST je Andre Przywa=
ra  =20
> napisal(a):
> > > > > > On Tue, 03 May 2022 21:05:11 +0200
> > > > > > Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:
> > > > > >=20
> > > > > > Hi Jernej,
> > > > > >=20
> > > > > > many thanks for taking the time to wade through this file!
> > > > > >  =20
> > > > > > > Dne petek, 29. april 2022 ob 01:09:30 CEST je Andre Przywara =
=20
> > >=20
> > > napisal(a): =20
> > > > > > > > This (relatively) new SoC is similar to the H6, but drops t=
he =20
> > >=20
> > > (broken)
> > >  =20
> > > > > > > > PCIe support and the USB 3.0 controller. It also gets the
> > > > > > > > management
> > > > > > > > controller removed, which in turn removes *some*, but not a=
ll of
> > > > > > > > the
> > > > > > > > devices formerly dedicated to the ARISC (CPUS).
> > > > > > > > And while there is still the extra sunxi interrupt controll=
er,
> > > > > > > > the
> > > > > > > > package lacks the corresponding NMI pin, so no interrupts f=
or
> > > > > > > > the =20
> > >=20
> > > PMIC.
> > >  =20
> > > > > > > > The reserved memory node is actually handled by Trusted Fir=
mware =20
> > >=20
> > > now,
> > >  =20
> > > > > > > > but U-Boot fails to propagate this to a separately loaded D=
TB,
> > > > > > > > so we
> > > > > > > > keep it in here for now, until U-Boot learns to do this
> > > > > > > > properly.
> > > > > > > >=20
> > > > > > > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > > > > > > ---
> > > > > > > >=20
> > > > > > > >  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 574
> > > > > > > >  +++++++++++++++ =20
> > >=20
> > > +++
> > >  =20
> > > > > > > >  1 file changed, 574 insertions(+)
> > > > > > > >  create mode 100644
> > > > > > > >  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > > > > > > >=20
> > > > > > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > > > > > > > b/arch/arm64/ =20
> > > > > > >=20
> > > > > > > boot/dts/allwinner/sun50i-h616.dtsi
> > > > > > >  =20
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..cc06cdd15ba5
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
> > > > > > > > @@ -0,0 +1,574 @@
> > > > > > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > > > > > +// Copyright (C) 2020 Arm Ltd.
> > > > > > > > +// based on the H6 dtsi, which is:
> > > > > > > > +//   Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.io>
> > > > > > > > +
> > > > > > > > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > > > > > +#include <dt-bindings/clock/sun50i-h616-ccu.h>
> > > > > > > > +#include <dt-bindings/clock/sun50i-h6-r-ccu.h>
> > > > > > > > +#include <dt-bindings/reset/sun50i-h616-ccu.h>
> > > > > > > > +#include <dt-bindings/reset/sun50i-h6-r-ccu.h>
> > > > > > > > +
> > > > > > > > +/ {
> > > > > > > > +	interrupt-parent =3D <&gic>;
> > > > > > > > +	#address-cells =3D <2>;
> > > > > > > > +	#size-cells =3D <2>;
> > > > > > > > +
> > > > > > > > +	cpus {
> > > > > > > > +		#address-cells =3D <1>;
> > > > > > > > +		#size-cells =3D <0>;
> > > > > > > > +
> > > > > > > > +		cpu0: cpu@0 {
> > > > > > > > +			compatible =3D "arm,cortex-a53";
> > > > > > > > +			device_type =3D "cpu";
> > > > > > > > +			reg =3D <0>;
> > > > > > > > +			enable-method =3D "psci";
> > > > > > > > +			clocks =3D <&ccu CLK_CPUX>;
> > > > > > > > +		};
> > > > > > > > +
> > > > > > > > +		cpu1: cpu@1 {
> > > > > > > > +			compatible =3D "arm,cortex-a53";
> > > > > > > > +			device_type =3D "cpu";
> > > > > > > > +			reg =3D <1>;
> > > > > > > > +			enable-method =3D "psci";
> > > > > > > > +			clocks =3D <&ccu CLK_CPUX>;
> > > > > > > > +		};
> > > > > > > > +
> > > > > > > > +		cpu2: cpu@2 {
> > > > > > > > +			compatible =3D "arm,cortex-a53";
> > > > > > > > +			device_type =3D "cpu";
> > > > > > > > +			reg =3D <2>;
> > > > > > > > +			enable-method =3D "psci";
> > > > > > > > +			clocks =3D <&ccu CLK_CPUX>;
> > > > > > > > +		};
> > > > > > > > +
> > > > > > > > +		cpu3: cpu@3 {
> > > > > > > > +			compatible =3D "arm,cortex-a53";
> > > > > > > > +			device_type =3D "cpu";
> > > > > > > > +			reg =3D <3>;
> > > > > > > > +			enable-method =3D "psci";
> > > > > > > > +			clocks =3D <&ccu CLK_CPUX>;
> > > > > > > > +		};
> > > > > > > > +	};
> > > > > > > > +
> > > > > > > > +	reserved-memory {
> > > > > > > > +		#address-cells =3D <2>;
> > > > > > > > +		#size-cells =3D <2>;
> > > > > > > > +		ranges;
> > > > > > > > +
> > > > > > > > +		/* 512KiB reserved for ARM Trusted Firmware (BL31)  =20
> */
> > > > > > > > +		secmon_reserved: secmon@40000000 {
> > > > > > > > +			reg =3D <0x0 0x40000000 0x0 0x80000>;
> > > > > > > > +			no-map;
> > > > > > > > +		};
> > > > > > > > +	}; =20
> > > > > > >=20
> > > > > > > I'm not a fan of above. If anything changes in future in BL31,
> > > > > > > U-Boot
> > > > > > > would
> > > > > > > need to reconfigure it anyway. Can we just skip it? =20
> > > > > >=20
> > > > > > I am not a fan neither, but last time I checked this is needed =
to
> > > > > > boot.
> > > > > > Indeed TF-A inserts this node, with the right values, into U-Bo=
ot's
> > > > > > DT.
> > > > > > And that's nicely preserved if you use that DT ($fdtcontroladdr=
) for
> > > > > > the kernel as well.
> > > > > > But if someone *loads* a DTB into U-Boot (to $fdt_addr_r), then
> > > > > > U-Boot fails to propagate the /reserved-memory node into that c=
opy.
> > > > > > There does not seem to be a global notion of reserved memory in
> > > > > > U-Boot.
> > > > > > Some commands (like tftp) explicitly parse the control DT to fi=
nd
> > > > > > and
> > > > > > respect reserved memory regions. bootm does that also, but only=
 to
> > > > > > avoid placing the ramdisk or DTB into reserved memory. The
> > > > > > information
> > > > > > ends up in images->lmb, but is not used to generate or amend no=
des
> > > > > > in
> > > > > > the target DT.
> > > > > > So the bits and pieces are there, but it will require some code=
 to
> > > > > > be
> > > > > > added to the generic U-Boot code.
> > > > > >=20
> > > > > > So what do you think? Leaving this out will prevent loading DTBs
> > > > > > into
> > > > > > U-Boot, at the moment, which sounds bad. I suggest we keep it i=
n,
> > > > > > for
> > > > > > now, it should not really hurt. U-Boot will hopefully start to =
do
> > > > > > the
> > > > > > right thing soon, then we can either phase it out here (maybe w=
hen
> > > > > > we
> > > > > > actually change something in TF-A), or let U-Boot fix it. =20
> > > > >=20
> > > > > TBH, if "soon" is really soon, I would rather wait with H616 DT u=
ntil
> > > > > U- =20
> > >=20
> > > Boot
> > >  =20
> > > > > supports carrying over reserved memory nodes. =20
> > > >=20
> > > > But this also carries compatibility issues. U-Boot support the H616=
 for
> > > > more than a year now, and the earliest possible U-Boot release havi=
ng
> > > > that
> > > > propagation code would be the one released in October. =20
> > >=20
> > > I was hoping you would say July (next U-Boot release) :). =20
> >=20
> > Well, 2022.07 was supposed to be released today, and even if that is
> > delayed by a bit, that's obviously far too late ;-)
> >  =20
> > > > And then people
> > > > would still need to update first, so that's quite some months out.
> > > > And I was actually hoping to get at least the H616 DT patches off my
> > > > plate, and get them into the tree to have a stable and agreed upon =
base
> > > > (before this series turns into a teenager ;-) =20
> > >=20
> > > Yeah, I would like that too.
> > >  =20
> > > > Then we could for instance update the U-Boot H616 support.
> > > >  =20
> > > > > Whatever we do now, it will have
> > > > > compatibility issues. If we introduce reserved memory node now, we
> > > > > can't
> > > > > easily drop it later. Bootloaders are not very often updated, but
> > > > > kernels =20
> > >=20
> > > and
> > >  =20
> > > > > DTB files are, at least in my experience. So when we decide to dr=
op
> > > > > the =20
> > >=20
> > > node?
> > >  =20
> > > > I think of the three possibilities:
> > > > - Drop the node now, and ask people to not load DTBs explicitly
> > > > - Drop the node when U-Boot learned to propagate the reservation
> > > > - Keep the node
> > > > the last one is the least painful: having this node in does not rea=
lly
> > > > hurt, so we can be very relaxed with this removal decision:
> > > > - If U-Boot does not add the reserved node, we are covered.
> > > > - If U-Boot adds the node, it will do so in a way where it deals wi=
th
> > > > existing reservations. So either it doesn't actually change anythin=
g, or
> > > > it extends the reservation.
> > > > - Should the TF-A location actually move (and we have no plans or n=
eeds
> > > > to
> > > > do that), people would only get this by updating the firmware, at w=
hich
> > > > point the U-Boot part would surely be in place already. We don't re=
ally
> > > > support updating just BL31 in an existing binary firmware image, so=
 you
> > > > would get an updated U-Boot as well.
> > > >=20
> > > > I think the worst case scenario is that users end up with an unneed=
ed
> > > > 512K
> > > > reservation. If they care, a firmware update should solve this prob=
lem.
> > > >=20
> > > > As for the time to remove that node: we could do that at the time w=
hen
> > > > (or rather: if) we actually change the TF-A reservation. At the mom=
ent
> > > > there are no plans to do this, and the size reservation is more than
> > > > generous (the current debug build is actually 77 KB or so only). If
> > > > there
> > > > is no change, and the node stays in the .dtsi, it doesn't really hu=
rt,
> > > > see
> > > > above. =20
> > >=20
> > > I see your point, but I would like to get some input from Samuel firs=
t.
> > >=20
> > > Samuel, what do you think?
> > >  =20
> > > > > After 10 years? Alternatively, reserved memory node can be just
> > > > > dropped =20
> > >=20
> > > and
> > >  =20
> > > > > anyone loading DTB file from outside would need to make sure it's
> > > > > patched. =20
> > >=20
> > > But
> > >  =20
> > > > > that's unexpected from user perspective, although patching DT fil=
es is
> > > > > done =20
> > >=20
> > > by
> > >  =20
> > > > > some distros. =20
> > > >=20
> > > > Yeah, let's not go there. As you know, I already dislike the idea of
> > > > explicitly loading DTBs at all, but I understand this is what peopl=
e,
> > > > and
> > > > distributions, do, so I'd rather have them covered. Hence the node =
to
> > > > work with existing firmware. =20
> > >=20
> > > Reusing DTB from U-Boot is only useful when you're happy with complet=
eness
> > > of DT and with the lack of bugs in it. Then you can save troubles with
> > > skipping external DTB load step and life is easier. But as you know,
> > > features and thus nodes are added in steps and sometimes some bugs are
> > > fixed, which means it's extremely handy to have easily updatable DTB
> > > file. =20
> >=20
> > Yes, definitely, see my reply to Samuel. I just held back with the DT
> > update in U-Boot because of the conflict between "we only take pure
> > kernel tree DTs" and "there is a breaking change" (r_intc binding).
> >=20
> > If we find a way forward with the DT stability problem, I am happy to
> > push for a much more frequent DT update, or even update just the DT in
> > an existing firmware installation. This can be automated, since the DTB
> > is just a member in the FIT image, which can be re-assembled with an
> > updated DTB by some tool or script. Or we use capsule updates, of just
> > the DTB, separately (if this is possible)? =20
>=20
> I would like to have forward compatibility too, but IMO it's not very=20
> realistic. Sooner or later we'll find something, like r_intc, again that =
won't=20
> be possible to integrate in forward compatible manner.=20

That's a shame, I think we should at least try. And with my x86 background
let me tell you: there are solutions to those compatibility problems ;-)
The more nasty ones might be borderline hackish, but it's a question of
priorities, I guess.

> > > Yes, U-Boot can be
> > > automated, but it's tedious for distro to maintain one bootloader pac=
kage
> > > per board. Ideally, distro shouldn't care at all about that, =20
> >=20
> > Yes, I totally agree, distros should not ship firmware. Since leaving
> > this to the board vendors is not realistic, I wonder if we (as "the
> > sunxi community") should step up here, and provide binary builds (purely
> > for convenience reasons) of board firmware? That could be updated from
> > a running Linux, or put on an SD card, or fetched by distros to
> > generate an installer? Wasn't there even some central storage offered
> > lately by Linux, to hold (UEFI) firmware update files? =20
>=20
> As someone who's working on distro which supports many SoCs from variety =
of=20
> vendors,

But that is relative, isn't it? I count 23 supported Allwinner devices in
LibreELEC, out of the 160 defconfigs in U-Boot or >180 sunxi .dts files in
the kernel.
So as most distributions, even with your ARM device focus, you chose to
limit the number of supported devices, as that approach inherently
doesn't scale.

I see the reasons behind this, because of the special focus of LibreELEC,
and probably the idea of giving a smooth user experience, but you could
potentially cover much more devices by offering a generic UEFI image, as
most *generic* distributions do, and as LE does for x86. But this relies
on having a stable DT for the platform.

I think conceptually this problem has been solved a long time ago: there
is some interface between firmware and the kernel, which allows a generic
kernel to configure itself accordingly. I refuse the idea that Arm based
device should be any different in this respect. Historically, because many
Arm based machines have a strong embedded background, that was not the
case, but I think we should move on from those dark ages (in terms of
support and maintainability).

> I can tell you that we'll ship bootloader integrated into our image=20
> for years to come. Anyway, I also like to build U-Boot using my own optio=
ns.=20
> For example, I disable HDMI driver for A64, H3 and H5, because it turns o=
ut=20
> that at least on H5, it can clash with Linux driver.

That is good to hear, please tell the sunxi U-Boot maintainer, so that we
can fix it ;-)

> Other distros prefer to=20
> show some splash screen, etc. One size fits all solution doesn't seems=20
> realistic to me. Maybe only if *everything* would be configurable and the=
re=20
> would be a way for distro to preconfigure it.
>=20
> TBH, building U-Boot, Crust and TF-A is easy and ability to customize the=
m is=20
> very handy.
> > > but many boards don't
> > > have designated bootloader storage (SPI NOR flash in AW case), so they
> > > have to be combined on same storage, partition even, as distro. =20
> >=20
> > Have you tried eMMC boot partitions? I found them equally convenient as
> > SPI flash, and while not too many boards actually have SPI flash,
> > quite some have eMMC (thinking about TV boxes). I recently even
> > used "dual boot" with a BSP installation.
> > And even the smallest eMMCs seem to have 4 MB per boot partition, so
> > plenty of space for U-Boot (plus TF-A plus crust). =20
>=20
> No, I didn't. I don't see any benefit of using eMMC boot partition over=20
> treating eMMC as usual SD card and installing bootloader to sector 16.

The firmware is out of the way of normal (accidental) accesses, as it
lives in a separate block device, which is read-only, initially.
And it doesn't clash with partition tables. This gives the kind of
separation that people are used to on other computers: the firmware
belongs to the device, the OS is provided by the user.
We documented how to install firmware there in U-Boot's sunxi.rst.=20

> Anyway, that won't change situation at all. SD card image with integrated=
=20
> bootloader is still king.

Sure, if you don't have any other storage, then SD card it is. But this
still does not require marrying firmware and OS: you could start with a
"just firmware SD card", then install the OS from a USB device, or from a
generic image file copied to some SD partition. And then suddenly the
pure firmware image becomes OS/distro agnostic.
And conceptually this approach doesn't *prevent* separating firmware and
kernel/distro, it just allows you to get away with it.

> There are several reasons for that:
> - cheapest boards are most popular and usually have only SD card for stor=
age=20
> (think OrangePi PC). There is nothing that you can do about it, except=20
> including bootloader on SD card image.
> - if you want to switch from Android to our distro, you need bootable SD =
card=20
> due to higher boot priority (speaking for AW SoCs)
> - not everyone wants to overwrite eMMC. Some prefer keeping Android, so i=
t can=20
> be used later for whatever purpose.
> - some users have several distros for same board, each on it's own SD car=
d.=20
> Needless to say, each distro adjusted bootloader to its needs.

All fine, but I don't see how this affects this discussion here. Yes, you
can treat those machines like embedded devices, and bundle firmware and
OS, but this is surely not the only way of deployment we should support.
Being able to just offer one generic UEFI based image seems much more
scalable to me.

> I like to offer flexibility in boot options, especially because it's curr=
ently=20
> easy, thanks to integrated customized bootloader and external loading of =
dtb=20
> files :)

Though I don't understand why you require external DTB loading: if you
marry distro and firmware anyway, you could as well put your DTB of choice
into U-Boot (in the U-Boot source tree, or replace it in the generated FIT
image). That looks like a one-time effort in your build system?

> > > On the other hand,
> > > when building kernel, you automatically build all relevant DTB files,
> > > which you can then just copy to common place. No device specific hand=
ling
> > > needed. Also, U-Boot doesn't sync DT files every release, so latest
> > > U-Boot doesn't necessarly mean latest DT. =20
> >=20
> > Yes, for the compatibility reasons mentioned. I am more than happy to
> > make this a regular exercise (say at each kernel's -rc3 or so). =20
>=20
> What about breaking changes? They can be important for new, useful=20
> functionality but older kernels won't know what to do.

Yes, that is the core of this discussion. Doing this relies on not having
them in the first place. There is no problem when this affects new
features, or functionality that the old kernel didn't support anyway.
But we must avoid change affecting older kernels.
At least I would like to ask for us to try: in my experience with some
thinking and clever code we can pull this off. Other platforms seem to be
able to commit to this.

As a compromise, I was wondering if we should define some time of grace
period, initially, were we don't guarantee non-breaking changes only.
So the first, say three, kernels could include breaking changes, but
afterwards we stick to support at least this kernel, with every new DT to
come.

> > Sadly, I don't think we're even close to avoiding shipping bootloader i=
n  =20
> distro images or even external DTB loading.
> > > Above is a bit off topic, but I hope you understand why distros opt t=
o use
> > > external DTB files (speaking from my own experiences). =20
> >=20
> > Yes, I understand where they (including LE) are coming from, to provide
> > a pragmatic solution to the users' problems. And that's why I wanted to
> > still give the possibility to load a DTB, even though I think this
> > should not be the standard way. =20
>=20
> I think loading external DTB support is important and shouldn't be ditche=
d=20
> anytime soon. If I understand correctly, that's an issue only on SoCs wit=
h TF-
> A, which means only 64-bit AW SoCs. Yes, 32-bit AW SoCs are still a thing=
 and=20
> still used and no, I don't want TF-A there :).

I think it's a conceptual issue, not TF-A related: A DT was always meant
to be amended by firmware (think of the memory node, or the MAC address).
U-Boot just decided to make those changes very late, just before launching
the kernel, so that this newly loaded DTB is already available. But if the
SPL decides to make changes, or picks a certain DT, you have this problem
as well.

Cheers,
Andre


