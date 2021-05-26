Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238862FAD
	for <linux-sunxi@lists.linux.dev>; Wed, 26 May 2021 17:32:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4041F13A1;
	Wed, 26 May 2021 10:32:14 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12DAA3F73B;
	Wed, 26 May 2021 10:32:12 -0700 (PDT)
Date: Wed, 26 May 2021 18:31:55 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: U-Boot-Denx <u-boot@lists.denx.de>, Paul Kocialkowski
 <contact@paulk.fr>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Icenowy Zheng <icenowy@aosc.io>,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] phy: sun4i-usb: Fix PHY0 routing and passby
 configuration for MUSB
Message-ID: <20210526183155.26eb331a@slackpad.fritz.box>
In-Reply-To: <CAMty3ZC+8up9TPDVjPJPzico4gWQ7zJOG9t4Pcrrq1u7Pqpuow@mail.gmail.com>
References: <20210526005718.23767-1-andre.przywara@arm.com>
	<CAMty3ZC+8up9TPDVjPJPzico4gWQ7zJOG9t4Pcrrq1u7Pqpuow@mail.gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 May 2021 22:37:14 +0530
Jagan Teki <jagan@amarulasolutions.com> wrote:

Hi Jagan,

thanks for having a look!

> On Wed, May 26, 2021 at 6:27 AM Andre Przywara <andre.przywara@arm.com> wrote:
> >
> > From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> >
> > Recent Allwinner platforms (starting with the H3) only use the MUSB
> > controller for peripheral mode and use HCI for host mode. As a result,
> > extra steps need to be taken to properly route USB signals to one or
> > the other. More precisely, the following is required:
> > * Routing the pins to either HCI/MUSB (controlled by PHY);
> > * Enabling USB PHY passby in HCI mode (controlled by PMU).
> >
> > The current code will enable passby for each PHY and reroute PHY0 to
> > MUSB, which is inconsistent and results in broken USB host support
> > for port 0.
> >
> > Passby on PHY0 must only be enabled when we want to use HCI. Since
> > host/device mode detection is not available from the PHY code and
> > because U-Boot does not support changing the mode dynamically anyway,
> > we can just mux the controller to MUSB if it is enabled and mux it to
> > HCI otherwise.
> >
> > This fixes USB host support for port 0 on platforms with PHY0 dual-route,
> > especially on boards like Pine64 (with only USB-A host ports) and
> > TV boxes without OTG ports.
> >
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > [Andre: tweak commit message, use IS_ENABLED()]
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> > Hi,
> >
> > for H6 boards to work this requires a DT update (to get the <&usbphy 0>
> > links between HCI and PHY), which I will send later.
> > Tested on Pine H64, Pine64-LTS, OrangePi Zero, OrangePi PC 2, BananaPi M64,
> > BananaPi M1.
> >
> > Cheers,
> > Andre
> >
> >  drivers/phy/allwinner/phy-sun4i-usb.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
> > index 5723c980323..e6ceafc7648 100644
> > --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> > +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> > @@ -313,9 +313,21 @@ static int sun4i_usb_phy_init(struct phy *phy)
> >                                     data->cfg->disc_thresh, PHY_DISCON_TH_LEN);
> >         }
> >
> > -       sun4i_usb_phy_passby(phy, true);
> > +       if (IS_ENABLED(CONFIG_USB_MUSB_SUNXI)) {  
> 
> I believe i did comment this before to use driver_data flag as this is
> full dm driver instead of macro style.

Which driver_data field would that be? This is not about a particular
SoC's PHY, this is about whether we use peripheral or host mode for
controller 0. As Paul mentioned in the commit message above:

"... Since host/device mode detection is not available from the PHY
code and because U-Boot does not support changing the mode dynamically
anyway, ...."

So a possible alternative would be to look up the dr_mode property in
the DT node. BUT: this property lives in the musb DT node, not in this
node the PHY driver knows about. Happy to take a patch that makes the
connection and looks that up. But I am not sure that covers all cases.

Meanwhile a equivalent and MUCH simpler solution is to use the Kconfig
symbol for the MUSB driver: as Paul correctly mentioned, this is a
static decision: only one of them can be effectively active in a build,
and inclusion of the MUSB driver wins over the host controller. So
using this symbol as a switch seems to be the best solution to me.

Cheers,
Andre
