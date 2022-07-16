Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17863638
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Jul 2022 10:50:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C9931063;
	Sat, 16 Jul 2022 03:50:11 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E723F3F73D;
	Sat, 16 Jul 2022 03:50:07 -0700 (PDT)
Date: Sat, 16 Jul 2022 11:49:04 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Cc: Michael Walle <michael@walle.cc>, linux-sunxi@lists.linux.dev, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: When a flash memory is missing do not
 report an error
Message-ID: <20220716114904.4d058637@slackpad.lan>
In-Reply-To: <20220716075421.GJ17705@kitsune.suse.cz>
References: <701967b0c418db333c66b48d225df60aa9d03ead.1657826188.git.msuchanek@suse.de>
	<d8de86aa0331be697fbef33d5ab2c57a@walle.cc>
	<20220714205529.GE17705@kitsune.suse.cz>
	<33abf7b84860049c4a22605578303ff2@walle.cc>
	<20220714220744.GF17705@kitsune.suse.cz>
	<20220715132006.077c90f8@donnerap.cambridge.arm.com>
	<20220716075421.GJ17705@kitsune.suse.cz>
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

On Sat, 16 Jul 2022 09:54:21 +0200
Michal Such=C3=A1nek <msuchanek@suse.de> wrote:

Hi,

> On Fri, Jul 15, 2022 at 01:20:06PM +0100, Andre Przywara wrote:
> > On Fri, 15 Jul 2022 00:07:44 +0200
> > Michal Such=C3=AF=C2=BF=C2=BDnek <msuchanek@suse.de> wrote:
> >=20
> > Hi,
> >  =20
> > > On Thu, Jul 14, 2022 at 11:51:56PM +0200, Michael Walle wrote: =20
> > > > Am 2022-07-14 22:55, schrieb Michal Such=C3=AF=C2=BF=C2=BDnek:   =20
> > > > > On Thu, Jul 14, 2022 at 09:41:48PM +0200, Michael Walle wrote:   =
=20
> > > > > > Hi,
> > > > > >=20
> > > > > > Am 2022-07-14 21:19, schrieb Michal Suchanek:   =20
> > > > > > > It is normal that devices are designed with multiple types of=
 storage,
> > > > > > > and only some types of storage are present.
> > > > > > >
> > > > > > > The kernel can handle this situation gracefully for many type=
s of
> > > > > > > storage devices such as mmc or ata but it reports and error w=
hen spi
> > > > > > > flash is not present.
> > > > > > >
> > > > > > > Only print a notice that the storage device is missing when n=
o response
> > > > > > > to the identify command is received.
> > > > > > >
> > > > > > > Consider reply buffers with all bits set to the same value no=
 response.   =20
> > > > > >=20
> > > > > > I'm not sure you can compare SPI with ATA and MMC. I'm just spe=
aking
> > > > > > of
> > > > > > DT now, but there, for ATA and MMC you just describe the contro=
ller
> > > > > > and
> > > > > > it will auto-detect the connected storage. Whereas with SPI you
> > > > > > describe   =20
> > > > >=20
> > > > > Why does mmc assume storage and SDIO must be descibed? Why the sp=
ecial
> > > > > casing?   =20
> > > >=20
> > > > I can't follow you here. My SDIO wireless card just works in an SD
> > > > slot and doesn't have to be described. =20
> >=20
> > I think the difference is that MMC (so also SDIO) is a discoverable bus,
> > whereas SPI is not.
> > It's conceptually dangerous to blindly probe for SPI chips, and the ker=
nel
> > tries to stay out of guessing games, in general, and leaves that up to
> > firmware. =20
>=20
> There is no guessing game involved. The SPI NOR is fully described in
> the device tree. The only missing bit of information is if it is mounted
> on this particular board. That can be brobed safely and reliably.

For this particular board: maybe. In general: no. I don't think the
kernel is the place to make those decisions. As Michael said: if the DT
explicitly says there is a SPI flash, and there isn't, it's an error.

> > > > > > both the controller and the flash. So I'd argue that your hardw=
are
> > > > > > description is wrong if it describes a flash which is not prese=
nt.   =20
> > > > >=20
> > > > > At any rate the situation is the same - the storage may be present
> > > > > sometimes. I don't think assuming some kind of device by defualt =
is a
> > > > > sound practice.   =20
> > > >=20
> > > > Where is the assumption when the DT tells you there is a flash
> > > > on a specific chip select but actually there it isn't. Shouldn't
> > > > the DT then be fixed?   =20
> > >=20
> > > The DT says there isn't a flash on a specific chip select when there =
is.
> > > Shouldn't that be fixed?
> > >  =20
> > > > Maybe I don't understand your problem. What are you trying to
> > > > solve? I mean this just demotes an error to an info message. =20
> >=20
> > The particular problem at hand is that on those cheap development boards
> > SPI flash is somewhat optional. The PCB often has the footprint for it,=
 but
> > sometimes it is not populated, because the vendor wants to save pennies.
> >=20
> > In this case (OrangePi Zero) there was no SPI chip soldered on the first
> > batches, but later boards are shipped with a flash chip. The footprint =
is
> > on every version, and I for instance soldered a chip on an early board.
> >  =20
> > > Many boards provide multiple storage options - you get a PCB designed=
 to
> > > carry different kinds of storage, some may be socketed, some can be
> > > soldered on in some production batches and not others.
> > >=20
> > > The kernel can handle this for many kinds of storage but not SPI flas=
h.
> > >=20
> > > I don't see any reason why SPI flash should be a second class storage=
. =20
> >=20
> > See above, SPI is not discoverable, you need to know about the slave
> > devices. =20
>=20
> Which we do, from the device tree. Except the device is disabled in the
> device tree so the kernel does not probe it.

That doesn't count, status =3D "disable" has the same effect as the node
removed, the kernel doesn't use it. It's disabled because it's broken,
or the board catches fires when it's accessed, or the SPI flash is
secure only, and the kernel receives an SError when accessing it and
panics. We don't care exactly why, the kernel just skips it.

In this case having the node in DT and marking it as disabled was a
concession to users, to allow simple enablement, like this:
=3D> fdt addr $fdtcontroladdr
=3D> fdt set /soc/spi status "okay"
(on the U-Boot prompt)

And it's actually a hint that U-Boot can do this automatically, only we
need it the other way around then ("okay" from the beginning, switching
to "disabled" if needed).

> > > > > However, when the board is designed for a specific kind of device=
 which
> > > > > is not always present, and the kernel can detect the device, it is
> > > > > perfectly fine to describe it.
> > > > >=20
> > > > > The alternative is to not use the device at all, even when presen=
t,
> > > > > which is kind of useless.   =20
> > > >=20
> > > > Or let the bootloader update your device tree and disable the device
> > > > if it's not there?   =20
> >=20
> > Yes, this is what I was suggesting already: U-Boot can do the job, beca=
use
> > a U-Boot build is device specific, and we can take certain risks that t=
he
> > generic and single-image kernel wants to avoid. =20
>=20
> For some cases this may be warranted.
>=20
> However, in this case no additional device-specific knowledge beyond
> what is alrready specified in the device tree is needed.
>=20
> A generic kernel can probe the device just fine.

The fact that sometimes there is a SPI flash and sometimes not, is a
pity device specific problem. The kernel does not have and does not
want to have any knowledge of this particular problem: we have the DT
to tell us exactly what devices are there. Firmware is encouraged to
tweak the DT, if needed.

> > In this case we know that there is a SPI flash footprint, and it does no
> > harm in trying to check on CS0. So I was thinking about introducing a
> > U-Boot Kconfig variable to probe for and potentially disable the SPI fl=
ash
> > DT node. We would set this variable in defconfigs of boards with option=
al
> > SPI flash.
> >  =20
> > > But then it must be in the device tree? =20
> >=20
> > However this indeed means that the SPI flash DT node must be in and ena=
bled
> > in the DT, because we (try hard to) only use original Linux DT files, a=
nd
> > DTs must have been reviewed through the kernel ML first. The U-Boot dri=
ver
> > relies on the DT as well, so the official kernel DT copy would need to =
come
> > with that node enabled. Ideally U-Boot would disable it, if needed, and
> > the kernel error message would never appear. =20
>=20
> Yes, that's a good point - even if it's decided that the kernel will not
> handle this, the device tree still needs to contain the node enabled for
> the bootloader to handle the device, anyway.

Yes, and I am happy to support that case when we send a patch to change
the DT in the kernel repo.
But I don't think we need an actual kernel patch to address this
problem.

Cheers,
Andre

P.S. I just see that status =3D "disabled" is in the wrong node, it
should be in the SPI slave node, as the controller and the SPI bus
itself are fine.
