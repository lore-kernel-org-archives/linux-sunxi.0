Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4939571
	for <linux-sunxi@lists.linux.dev>; Wed, 19 May 2021 00:56:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C4A4ED1;
	Tue, 18 May 2021 17:56:00 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1263C3F73D;
	Tue, 18 May 2021 17:55:58 -0700 (PDT)
Date: Wed, 19 May 2021 01:55:50 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Icenowy Zheng <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, linux-sunxi@lists.linux.dev
Subject: Re: Allwinner H616 USB support woes
Message-ID: <20210519015550.5e619ba8@slackpad.fritz.box>
In-Reply-To: <1657728.PX7fZn3zjf@kista>
References: <20210518111008.20f0ea1c@slackpad.fritz.box>
	<1657728.PX7fZn3zjf@kista>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 18 May 2021 19:32:00 +0200
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi Jernej,

many thanks for the reply!

> Dne torek, 18. maj 2021 ob 12:11:18 CEST je Andre Przywara napisal(a):
> > Hi,
> >=20
> > I wanted to ask for some advice on the proper upstream H616 USB
> > support. This is the only problem left before I can post v6 of the
> > H616 support series.
> > The main problem is that only controller 2 (EHCI2+PHY2) works on its
> > own, all other ports need some help from controller 2.
> > Just enabling the EHCI2 DT node does the trick, but with some help from
> > Samuel and Jernej (who were looking into the BROM) I wiggled it down to
> > the following things actually needed:
> > - CLK_BUS_PHY2 and RST_BUS_PHY2 need to be enabled.
> > - PMU2.SIDDQ (0x05310810[3]) needs to be clear.
> > We can add the clock and reset to the list of clocks and resets in the
> > other OHCI/EHCI DT nodes, so that's not a real problem.
> >=20
> > But this SIDDQ bit is a bit nasty in the details:
> > It would only need to be flipped once, and wouldn't be changed
> > back by any reset bits. So what would work is to do this
> > once in U-Boot. However to actually be able to access this register, we
> > need CLK_BUS_EHCI2 to be ungated. What works in U-Boot is: =20
> > =3D> mw.l 0x3001a8c 0x40	/* pass USBEHCI2_GATING */
> > =3D> mw.l 0x5310810 0	/* clear SIDDQ in PMU2 */
> > =3D> mw.l 0x3001a8c 0	/* mask USBEHCI2_GATING again */ =20
> >=20
> > Now I would rather see this done in Linux, in the kernel's
> > phy-sun4i-usb.c, to be self contained and independent.
> > The easiest way looks like to call sun4i_usb_phy_init() again for PHY2,
> > after this function is called for another PHY. So at the end of
> > sun4i_usb_phy_init() (simplified code just for demonstration):
> >=20
> > 	if (need_phy2 && phy->index !=3D 2)
> > 		sun4i_usb_phy_init(data->phys[2].phy);
> > (that does a bit more than is really needed, but OK)
> >=20
> > However this doesn't work, because CLK_BUS_EHCI2 is still gated, it is
> > only unmasked in ehci-platform.c, when EHCI2 in initialised.
> > And annoyingly ehci-platform.c only parses 4 clocks, so adding
> > CLK_BUS_EHCI2 to the DT would be the fifth in the ehci<x> nodes (three
> > at the moment plus the still needed CLK_BUS_PHY2 plus CLK_BUS_EHCI2).
> >=20
> > Extending this limit is trivial, but sounds a bit like a stretch, since
> > it's outside of sunxi code and technically the clock is just needed for
> > initialisation, not during runtime.
> >=20
> > Do you guys have any idea how to best solve this?
> > I would prefer some change confined to phy-sun4i-usb.c, without
> > bending the DT parts too much. The other alternatives are a U-Boot
> > solution or extending the limit in ehci-platform.c.
> >=20
> > Would be grateful for any input! =20
>=20
> First, thanks for working on this!
>=20
> Maybe I'm missing something, but wouldn't be adding CLK_BUS_EHCI2 to usbp=
hy=20
> node and clearing PHY2 SIDDQ at the end of sun4i_usb_phy_probe() be enoug=
h? At=20
> least judging by your U-Boot commands. PHY driver must be initialized bef=
ore=20
> ohci/ehci anyway.

Yes, and I guess I was too busy with finding a nice and generic
solution for this, where this is really a nasty hardware issue and
probably justifies some rather ugly quirk.

So I more or less literally implemented your solution: this doesn't
look super nice, but at least is confined to phy-sun4i-usb.c and has one
little DT addition - the CLK_BUS_EHCI2 clock in the PHY DT node.
And, added bonus: it works ;-)

So many thanks for your help, and watch your inbox for my patches!

Cheers,
Andre
