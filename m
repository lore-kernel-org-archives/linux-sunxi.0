Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFDB2FAE
	for <linux-sunxi@lists.linux.dev>; Wed, 26 May 2021 11:30:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2100F1516;
	Wed, 26 May 2021 04:30:00 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC24D3F73B;
	Wed, 26 May 2021 04:29:58 -0700 (PDT)
Date: Wed, 26 May 2021 12:29:41 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <contact@paulk.fr>
Cc: Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Icenowy Zheng <icenowy@aosc.io>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] phy: sun4i-usb: Fix PHY0 routing and passby
 configuration for MUSB
Message-ID: <20210526122941.4e8ae3eb@slackpad.fritz.box>
In-Reply-To: <YK4ne9OtEON85akS@collins>
References: <20210526005718.23767-1-andre.przywara@arm.com>
	<YK4ne9OtEON85akS@collins>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 26 May 2021 12:48:27 +0200
Paul Kocialkowski <contact@paulk.fr> wrote:

Hi Paul,

> Le Wed 26 May 21, 01:57, Andre Przywara a =C3=A9crit :
> > From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> >=20
> > Recent Allwinner platforms (starting with the H3) only use the MUSB
> > controller for peripheral mode and use HCI for host mode. As a result,
> > extra steps need to be taken to properly route USB signals to one or
> > the other. More precisely, the following is required:
> > * Routing the pins to either HCI/MUSB (controlled by PHY);
> > * Enabling USB PHY passby in HCI mode (controlled by PMU).
> >=20
> > The current code will enable passby for each PHY and reroute PHY0 to
> > MUSB, which is inconsistent and results in broken USB host support
> > for port 0.
> >=20
> > Passby on PHY0 must only be enabled when we want to use HCI. Since
> > host/device mode detection is not available from the PHY code and
> > because U-Boot does not support changing the mode dynamically anyway,
> > we can just mux the controller to MUSB if it is enabled and mux it to
> > HCI otherwise.
> >=20
> > This fixes USB host support for port 0 on platforms with PHY0 dual-rout=
e,
> > especially on boards like Pine64 (with only USB-A host ports) and
> > TV boxes without OTG ports.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > [Andre: tweak commit message, use IS_ENABLED()]
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> > Hi,
> >=20
> > for H6 boards to work this requires a DT update (to get the <&usbphy 0>
> > links between HCI and PHY), which I will send later.
> > Tested on Pine H64, Pine64-LTS, OrangePi Zero, OrangePi PC 2, BananaPi =
M64,
> > BananaPi M1. =20
>=20
> Thanks for resending this, I've also had to revive this patch lately to g=
et
> USB working on the V3 so I definitely second that it's still relevant!

Great! I had this under observation for quite a while, but was somewhat
puzzled because your original commit message mentioned that OTG was
broken, which worked fine for me. Maybe this was fixed meanwhile?

But what was still broken for me is host port 0, which disables one of
the two USB-A ports on the Pine64 boards (Pine64+, Pine64-LTS,
Pine-H64), also on those TV boxes. This makes connecting a keyboard and
an USB stick at the same time complicated.
But even with this patch alone it doesn't work, because the DTs are
(were) missing the phys property for ehci0/ohci0 (which I meanwhile
fixed in Linux, for exactly that reason). We synced the A64 DTs already
back into U-Boot, and I will send the H3/H5/H6 parts today.

So can you confirm that this now works for you, ideally with both OTG
and host ports on the same device? I tried this with enforcing OTG
on the Pine64, but would love to see reports from others.
Please respond with a Tested-by: tag then!

Thanks!
Andre

P.S. I kept your bootlin address as the author (that's what we do at
work in those cases: keep attribution to the employer sponsoring the
work at the time), please let me know if I should change this. I can add
your current address in some other tag, to have a working contact.

>=20
> Paul
>=20
> > Cheers,
> > Andre
> >=20
> >  drivers/phy/allwinner/phy-sun4i-usb.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwin=
ner/phy-sun4i-usb.c
> > index 5723c980323..e6ceafc7648 100644
> > --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> > +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> > @@ -313,9 +313,21 @@ static int sun4i_usb_phy_init(struct phy *phy)
> >  				    data->cfg->disc_thresh, PHY_DISCON_TH_LEN);
> >  	}
> > =20
> > -	sun4i_usb_phy_passby(phy, true);
> > +	if (IS_ENABLED(CONFIG_USB_MUSB_SUNXI)) {
> > +		/* Needed for HCI and conflicts with MUSB, keep PHY0 on MUSB */
> > +		if (usb_phy->id !=3D 0)
> > +			sun4i_usb_phy_passby(phy, true);
> > +
> > +		/* Route PHY0 to MUSB to allow USB gadget */
> > +		if (data->cfg->phy0_dual_route)
> > +			sun4i_usb_phy0_reroute(data, true);
> > +	} else {
> > +		sun4i_usb_phy_passby(phy, true);
> > =20
> > -	sun4i_usb_phy0_reroute(data, true);
> > +		/* Route PHY0 to HCI to allow USB host */
> > +		if (data->cfg->phy0_dual_route)
> > +			sun4i_usb_phy0_reroute(data, false);
> > +	}
> > =20
> >  	return 0;
> >  }
> > --=20
> > 2.17.5
> >  =20
>=20

