Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C902FB3
	for <linux-sunxi@lists.linux.dev>; Thu, 27 May 2021 11:33:42 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id r23so482686edw.1
        for <linux-sunxi@lists.linux.dev>; Thu, 27 May 2021 04:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sMjM+qe46y/Jo7k1r4LwIjPmwsoQjdL/c2HMoSCn0LA=;
        b=KZW0kFpenSrAEYomUidgw0/hQBAu9GCse+dyDgY2NS9B0WRivwOy2fQMEQRyZ+njCI
         zWX037aVcpDs1l1kvMesNf+IG6vvD4tY0dR9ND239KefFMM5koddBR4P7BGIwwWhXvZ7
         mXmWr3ySSjyR4dWvJddAqP0IpdxiAmOK69OGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sMjM+qe46y/Jo7k1r4LwIjPmwsoQjdL/c2HMoSCn0LA=;
        b=HNunBl8jgYSqAzNgLmP6+n+4We5gg+Z7qTj2yMisRSuD2Tc6KE5p7PujpLxcUnOSS+
         bgI2TJijBz9Mw5J0/UnxswvGJozpsPSNpuF4kjX5It5vembNgTGncnnVCwZFcvXc/gQ8
         SLYZM0mYosdMAO8w/Xzgpv7o9eZQudpZ/kk/jeParsukcuqUUhsfJHK2IJdMwjfZA0Me
         JuGqZsvvw4TyKEjlF7IZN514jzQq3f8o55oU6c9OKHnm+POOMa/DuSPrVR+rcRgV3tPR
         yc3Y7APBWcxW4RdWijPtgHShnC2InqVBCgvPxsIEsmL5kL4y3KcZ6Et/dgR92MrGON2k
         ssvQ==
X-Gm-Message-State: AOAM530znuU3aTbQVNupn2yaPRFLAeP3LKGU5dPLw4ggBMwD3549h3Iy
	v1y65EHiYBSvXMbUvS4rCFK3xLCOEUdWYkyyVZyTGQ==
X-Google-Smtp-Source: ABdhPJyg2OhBWCi2aPhJgZFd/9M4KRoCEgYhJ3hTHNwmTFT0rjRfXhmO4lfKuIy+sn9Z1Q9+wGKe3ngB5avErSZC3NA=
X-Received: by 2002:a05:6402:4402:: with SMTP id y2mr3658504eda.55.1622115221338;
 Thu, 27 May 2021 04:33:41 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210526005718.23767-1-andre.przywara@arm.com>
 <CAMty3ZC+8up9TPDVjPJPzico4gWQ7zJOG9t4Pcrrq1u7Pqpuow@mail.gmail.com>
 <20210526183155.26eb331a@slackpad.fritz.box> <CAMty3ZBntt2Sa9Ff30QXGOO6=S9pR782NjEMcA6eya1MEyJiQQ@mail.gmail.com>
 <20210526200827.493b17a3@slackpad.fritz.box>
In-Reply-To: <20210526200827.493b17a3@slackpad.fritz.box>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 27 May 2021 17:03:30 +0530
Message-ID: <CAMty3ZDd-M+DsmBR8b3AP0XB1PUX+10ui_4MP3LRZa31W3Zx3Q@mail.gmail.com>
Subject: Re: [PATCH] phy: sun4i-usb: Fix PHY0 routing and passby configuration
 for MUSB
To: Andre Przywara <andre.przywara@arm.com>
Cc: U-Boot-Denx <u-boot@lists.denx.de>, Paul Kocialkowski <contact@paulk.fr>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Icenowy Zheng <icenowy@aosc.io>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, May 27, 2021 at 12:38 AM Andre Przywara <andre.przywara@arm.com> wrote:
>
> On Wed, 26 May 2021 23:51:41 +0530
> Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi,
>
> > On Wed, May 26, 2021 at 11:02 PM Andre Przywara <andre.przywara@arm.com> wrote:
> > >
> > > On Wed, 26 May 2021 22:37:14 +0530
> > > Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > Hi Jagan,
> > >
> > > thanks for having a look!
> > >
> > > > On Wed, May 26, 2021 at 6:27 AM Andre Przywara <andre.przywara@arm.com> wrote:
> > > > >
> > > > > From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > >
> > > > > Recent Allwinner platforms (starting with the H3) only use the MUSB
> > > > > controller for peripheral mode and use HCI for host mode. As a result,
> > > > > extra steps need to be taken to properly route USB signals to one or
> > > > > the other. More precisely, the following is required:
> > > > > * Routing the pins to either HCI/MUSB (controlled by PHY);
> > > > > * Enabling USB PHY passby in HCI mode (controlled by PMU).
> > > > >
> > > > > The current code will enable passby for each PHY and reroute PHY0 to
> > > > > MUSB, which is inconsistent and results in broken USB host support
> > > > > for port 0.
> > > > >
> > > > > Passby on PHY0 must only be enabled when we want to use HCI. Since
> > > > > host/device mode detection is not available from the PHY code and
> > > > > because U-Boot does not support changing the mode dynamically anyway,
> > > > > we can just mux the controller to MUSB if it is enabled and mux it to
> > > > > HCI otherwise.
> > > > >
> > > > > This fixes USB host support for port 0 on platforms with PHY0 dual-route,
> > > > > especially on boards like Pine64 (with only USB-A host ports) and
> > > > > TV boxes without OTG ports.
> > > > >
> > > > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > > [Andre: tweak commit message, use IS_ENABLED()]
> > > > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > > > ---
> > > > > Hi,
> > > > >
> > > > > for H6 boards to work this requires a DT update (to get the <&usbphy 0>
> > > > > links between HCI and PHY), which I will send later.
> > > > > Tested on Pine H64, Pine64-LTS, OrangePi Zero, OrangePi PC 2, BananaPi M64,
> > > > > BananaPi M1.
> > > > >
> > > > > Cheers,
> > > > > Andre
> > > > >
> > > > >  drivers/phy/allwinner/phy-sun4i-usb.c | 16 ++++++++++++++--
> > > > >  1 file changed, 14 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
> > > > > index 5723c980323..e6ceafc7648 100644
> > > > > --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> > > > > +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> > > > > @@ -313,9 +313,21 @@ static int sun4i_usb_phy_init(struct phy *phy)
> > > > >                                     data->cfg->disc_thresh, PHY_DISCON_TH_LEN);
> > > > >         }
> > > > >
> > > > > -       sun4i_usb_phy_passby(phy, true);
> > > > > +       if (IS_ENABLED(CONFIG_USB_MUSB_SUNXI)) {
> > > >
> > > > I believe i did comment this before to use driver_data flag as this is
> > > > full dm driver instead of macro style.
> > >
> > > Which driver_data field would that be? This is not about a particular
> > > SoC's PHY, this is about whether we use peripheral or host mode for
> > > controller 0. As Paul mentioned in the commit message above:
> > >
> > > "... Since host/device mode detection is not available from the PHY
> > > code and because U-Boot does not support changing the mode dynamically
> > > anyway, ...."
> >
> > Yeah., I missed it. Thanks for pointing it out.
> >
> >
> > >
> > > So a possible alternative would be to look up the dr_mode property in
> > > the DT node. BUT: this property lives in the musb DT node, not in this
> > > node the PHY driver knows about. Happy to take a patch that makes the
> > > connection and looks that up. But I am not sure that covers all cases.
> > >
> > > Meanwhile a equivalent and MUCH simpler solution is to use the Kconfig
> > > symbol for the MUSB driver: as Paul correctly mentioned, this is a
> > > static decision: only one of them can be effectively active in a build,
> > > and inclusion of the MUSB driver wins over the host controller. So
> > > using this symbol as a switch seems to be the best solution to me.
> >
> > Handling dr_mode can be possible in U-Boot, I did tried but not
> > completed as patch.
> > drivers/usb/musb-new/ti-musb.c has base code for ti musb chips.
>
> Sure, there are certainly ways to do that. As I said: patches welcome!
>
> But given that this patch here is around for 2 years now and fixes a
> real problem - without any downsides, as far as I can tell - I would
> rather take this first.
> And while it sounds indeed cleaner to look at dr_mode, there is more to
> it for it to be really useful: we probably need some form of dynamic
> switching between peripheral and host mode, either by code (user calls
> fastboot vs. user calls "usb reset"), or by sampling the ID pin.
> And even if not, how would we deal with the case when dr_mode says
> peripheral, but the MUSB driver is not compiled in?
> That's why looking at CONFIG_USB_MUSB_SUNXI is actually a quite clever
> and easy solution, at least for now.

Agreed!
