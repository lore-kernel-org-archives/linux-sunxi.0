Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB393481
	for <linux-sunxi@lists.linux.dev>; Wed, 28 Jul 2021 14:16:48 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 211885C00E0;
	Wed, 28 Jul 2021 10:16:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 28 Jul 2021 10:16:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm3; bh=xes6xAP7SUf72s6rV9KWSJPs8+N
	ST4eJzKKloBO5an4=; b=UEuH2dAZ1w2Ujcf/IzH6xtOeCuHpmHJnJVBJGaWYUkp
	lJpVGdBkEv01tO6Hl7wkC8EotbUK8rmGneuKYxJLIXdlVwcNnW7OwN6Zj5wDvzm8
	axURgBjrdP2QsENi5FUaynJQvcEu/NsDFW7uLUuC4vi4+qmxuHlN0xRI+49ILWu3
	EfWHYh9T1PXhjuofsuqVgIuroc6Hsk+H6doi9Tzb2LYzRH2pdwzqJH/BhZAaGcVM
	gWCHnc8uxsJSyJxNZPBKnsXpAr2856mS2wsrE0NO9eJ7elv54tuFHVg1NgbNNnSR
	dRpHA7k8o2qpfuv8LBc7zztOM/xAAMl2mDrXraENwPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xes6xA
	P7SUf72s6rV9KWSJPs8+NST4eJzKKloBO5an4=; b=G5juZTu7Ht+LCEjKlZBXkI
	wc4XN3lMkjYwac9Pom2v2tcG7/dL/2QSGQf/dHEMMuf6T1uriJaZMQSfTXQncPnb
	8GhgBIDuokGrDKhTDks9PXuf4mHKMPOeESKNq1jFaYxDsucqO9qhrfhZdSnQbTjU
	ZEcYuKFzmGGmpMU0pe8JO3bYN0WIWt7vC9/zXtdxcuBm7qma4kulXtB9A2oijV3t
	A/CXURhtIv50mhn/EkrTIn3NT6dJ4XKrFFqPjbkDvWnGHfdPdGjodL+pXZD599Gk
	K1V3Z4EzWl7yRteAMlweJkWwGvuMCV8huqRhCobJU4Nm+1V2isADbd8Xhy+LLwig
	==
X-ME-Sender: <xms:z2YBYb4ptzTCOx-M2peWwE5kBzufuQg3QIQGhfie8V2nvnUL3FLkOg>
    <xme:z2YBYQ6Wm4jDGZ0atMtXnipELrfmQrQVsDht8elssOx6XxVDBuKrLBPcG5d5NfoKw
    Xeo0g8goGY86Ep3eRk>
X-ME-Received: <xmr:z2YBYSfQV2OomNViKsLmSs_-iYpyXxRd4kDz3Nbf6Db85bF6E0400SoAX7ZDaB-GlhfP-Nlq1IYG7aWf0hPAXnUooKLuB0p9Mkt->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeelgdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:z2YBYcIWPiwySWnku6bOuXuAZFZS8Mzh0bpbfdL1sqyr7P6pCiOYFA>
    <xmx:z2YBYfLA_RFYSOrcbEaLxEn0PbsJ_tJ6lZmPex3ghm2M0KNwuC89Sg>
    <xmx:z2YBYVwvY-BBSb_2kLLxw-ottSCfh6Nsg0UZ9gfhp1Ug1o5h1dA9dQ>
    <xmx:0GYBYX2kJ2klE_CxpHOy97HH7U1aYopMwT9w_fRZMTlf_Jy65lmudg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jul 2021 10:16:46 -0400 (EDT)
Date: Wed, 28 Jul 2021 16:16:44 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Petr Vorel <petr.vorel@gmail.com>,
	Christopher Obbard <chris@64studio.com>,
	linux-sunxi@lists.linux.dev,
	mailing list linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [linux-sunxi] Re: Mainlining Linux Sunxi SoC AW USB
Message-ID: <20210728141644.xgcldm2vyjbembyw@gilmour>
References: <YPvjYIsu0G0HSu5I@pevik>
 <YPvrpUZ/VRc0eHvA@kroah.com>
 <YPwYlvh4DqaUsPCF@pevik>
 <YPwhAsK/rDkVeK0y@kroah.com>
 <YPwiGB7VnzECN/jg@pevik>
 <CAP03Xer3QK7gFa5szL7gQLq-=-muyPDzH-D24mhafDpUjj5=bw@mail.gmail.com>
 <YPw/iTdsqggtvlKL@pevik>
 <20210724180432.4423b9e3@slackpad.fritz.box>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="liisrpsrdmdww4q2"
Content-Disposition: inline
In-Reply-To: <20210724180432.4423b9e3@slackpad.fritz.box>


--liisrpsrdmdww4q2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jul 24, 2021 at 06:04:32PM +0100, Andre Przywara wrote:
> On Sat, 24 Jul 2021 18:27:53 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:
>=20
> Hi Petr,
>=20
> > [ Dropping Greg and linux-usb@vger.kernel.org ]
> > > Peter, =20
> >=20
> > > On Sat, 24 Jul 2021 at 15:22, Petr Vorel <petr.vorel@gmail.com> wrote=
: =20
> >=20
> > > > Hi Greg, =20
> >=20
> > > > > On Sat, Jul 24, 2021 at 03:41:42PM +0200, Petr Vorel wrote: =20
> > > > > > > Why is this even a driver at all, it looks like you can write=
 a small
> > > > > > > userspace program using libusb to do everything it does, righ=
t?  What
> > > > > > > exactly is this driver needed for? =20
> >=20
> > > > > > I'm sorry for not providing more info at the beginning. This is=
 a driver for
> > > > > > host computer (i.e. developers laptop) used by LiveSuit tool [2=
] to flash Images
> > > > > > to the NAND of Allwinner devices. LiveSuit itself [3] is unfort=
unately provided
> > > > > > only in binary form. The only open source code with GPL v2 lice=
nse is awusb
> > > > > > driver. Thus I thought I could ease my life with upstreaming at=
 least the
> > > > > > kernel driver. But maybe it's not a good idea. I'm using LiveSu=
it for flashing
> > > > > > Allwinner A31, but it requires quite old distro due libqtgui4. =
Maybe sunxi folks
> > > > > > use something newer nowadays, but I haven't found anything in t=
heir wiki. =20
> >=20
> > > > > Ah, that's not going to be good then.  Really, this doesn't seem =
to need
> > > > > to be a driver at all, and the ioctls are really strange so we wo=
uld
> > > > > need to change them anyway before it could be merged.  But with no
> > > > > access to userspace code, that will be quite difficult, so I woul=
d push
> > > > > back on allwinner and have them work on resolving this. =20
> > > > Understand, it makes sense. Thanks for your time! =20
> >=20
> > > > @Sunxi community: am I missing something? Using LiveSuit with old d=
istro chroot
> > > > and Xephyr with out-of-tree module isn't fun :(. =20
> >=20
> > > Suggest you take a look at sunxi-tools - specifically the sunxi-fel
> > > tool. This is a libusb-based userland tool to talk to these devices.
> > > I'm not sure if it supports flashing to nand on A31 - never tried it -
> > > but have used it to flash to eMMC and SPI flash on their other chips.=
 =20
> > Thanks for a tip. Looking into sources it does not look like sunxi-fel =
supports
> > NAND.
> >=20
> > Also from Debian wiki [1] (which describes bootable SD Card) it looks l=
ike only
> > old Allwinner u-boot supported access to NAND, thus I'd be surprised if
> > sunxi-tools supported it. sunxi-bootinfo does not implement NAND,
> > sunxi-nand-image-builder (which is not built by default) creates raw NA=
ND
> > images, but now word about flashing.
> >=20
> > I wonder why NAND is (probably) not supported by sunxi? Lack of documen=
tation?
>=20
> Pure NAND is getting rarer these days, on modern boards we see mostly
> eMMC now (maybe SPI NAND). So NAND is only a concern for older SoCs.
>=20
> There is (limited) NAND support for mainline U-Boot on the C.H.I.P.
> boards[1], which use an A13 (derivative). But reliable operation is
> only possible with SLC NAND, which means only on the Chip Pro board,
> IIUC. Most boards will probably utilise MLC (or worse) NAND these days,
> where effects like write and read disturb make operation more
> complicated. Maxime has some stories to tell about this.
> So it would be first good to know if you have SLC NAND or not.
>=20
> Because of this direct support for NAND in the tools is understandably
> "limited" (as in: non-existent). Except for SPI NOR flash there is no
> "direct" flashing support (for eMMC) in the tools anyway, it just relies
> on U-Boot support.
> How this works is that you use sunxi-fel to upload a (mainline) U-Boot
> binary directly into DRAM, and launch that. Then you can use the full
> functionality of U-Boot to load your image. Most popular for NAND
> support seems to be U-Boot's Android Fastboot implementation over a USB
> gadget device, so you can use the off-the-shelf fastboot tool on your
> host computer to flash the NAND. Other possibilities would be to use
> USB host support or TFTP to first load an image into DRAM, then use
> U-Boot commands to write that into the NAND flash.
>
> To my knowledge NAND flash in U-Boot *only* works on the A13/R8/GR8
> chips with SLC NAND, and is only enabled and tested on the Chip boards.
> Every other combination would require some work; much more work the
> farther you move from there (other SoC, MLC, ...).

It works on the A33 as well (the Nintendo board has support for it). And
I guess it works with virtually any SoC, the culprit really is MLC vs
SLC, the NAND controller hasn't really changed.

Maxime

--liisrpsrdmdww4q2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYQFmzAAKCRDj7w1vZxhR
xXMLAQDQiNHWSUM8IsEV3bwNAYB7Wc+D2C7OQFp97wMdaz4t7wD+I02bQ9FzI+ZC
6qPVKieTYctT23shrFWl7eYoR0++BQ4=
=7cQp
-----END PGP SIGNATURE-----

--liisrpsrdmdww4q2--
