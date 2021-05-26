Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107FC2FAD
	for <linux-sunxi@lists.linux.dev>; Wed, 26 May 2021 18:21:53 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id s22so3909519ejv.12
        for <linux-sunxi@lists.linux.dev>; Wed, 26 May 2021 11:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nh0gVd6czuoNn3w/cmk7xcKnxGlIiyqUrYEgq19dN6Y=;
        b=JRxU9uU159VXu4OvBS4YcAgUgoArWTqpcCtECnYAd01P5W7J9aIIq/n+dNSvAJywDO
         jkvo95HLwGBZszPnDXojFX5GE8jMChaQyVrV91ZGTpChtrZuzQDogB66iX0qVgGFvZdS
         P9sdrbLpRXMkCj20KwpbPuDvOfErgWk9fOYbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nh0gVd6czuoNn3w/cmk7xcKnxGlIiyqUrYEgq19dN6Y=;
        b=pC/iLv+Hnpyh6sIcQMiFiuStEOeRyfzsZYGNFpl53X82d0NDWX4ccTlzMSQlzBXuH3
         nMeI+5iBpQ+IQqavH8N9FZ+kngX4c5i6VPyEXFr/+R29yA7+1pB/as/qd1mi8A5Ws9v3
         +yzz59jZCdHry1BwvIzmHanNhkEbsJA/xXbX8iSHTAkCOlJ3qk6RAg6SkKpxxJ0g7UWA
         vhCxCIQSYtS/eYQwwDRepJko/WjaGwLSfbD6W5ncZAPYtry0nKx5DJ3xIVv1qo3UVjG6
         K8scWkWrAbDaP4pJxINUnGrK/DHLYA618bD3A2Xta2mOP7bYKM2cv9ZcgP4aMPXhRDLb
         pkgg==
X-Gm-Message-State: AOAM531CoAHwR8OtcK0NYybT3CtZXBMJPaLldBobW3Q3yn/t/LFRf9sK
	Sld025r+cNsMgq9e73ghlLSNEIcSdxKwL2PozOuy7Q==
X-Google-Smtp-Source: ABdhPJzilNSzF0UiySpZTYN0OdzPBIp4cnvty2D0LPibTHBsd3/AK49bcc6M/kk0a75qlnTOGDePohRQGynlMp4fqNM=
X-Received: by 2002:a17:906:5914:: with SMTP id h20mr35704911ejq.252.1622053312231;
 Wed, 26 May 2021 11:21:52 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210526005718.23767-1-andre.przywara@arm.com>
 <CAMty3ZC+8up9TPDVjPJPzico4gWQ7zJOG9t4Pcrrq1u7Pqpuow@mail.gmail.com> <20210526183155.26eb331a@slackpad.fritz.box>
In-Reply-To: <20210526183155.26eb331a@slackpad.fritz.box>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 26 May 2021 23:51:41 +0530
Message-ID: <CAMty3ZBntt2Sa9Ff30QXGOO6=S9pR782NjEMcA6eya1MEyJiQQ@mail.gmail.com>
Subject: Re: [PATCH] phy: sun4i-usb: Fix PHY0 routing and passby configuration
 for MUSB
To: Andre Przywara <andre.przywara@arm.com>
Cc: U-Boot-Denx <u-boot@lists.denx.de>, Paul Kocialkowski <contact@paulk.fr>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Icenowy Zheng <icenowy@aosc.io>, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, May 26, 2021 at 11:02 PM Andre Przywara <andre.przywara@arm.com> wrote:
>
> On Wed, 26 May 2021 22:37:14 +0530
> Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Hi Jagan,
>
> thanks for having a look!
>
> > On Wed, May 26, 2021 at 6:27 AM Andre Przywara <andre.przywara@arm.com> wrote:
> > >
> > > From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > >
> > > Recent Allwinner platforms (starting with the H3) only use the MUSB
> > > controller for peripheral mode and use HCI for host mode. As a result,
> > > extra steps need to be taken to properly route USB signals to one or
> > > the other. More precisely, the following is required:
> > > * Routing the pins to either HCI/MUSB (controlled by PHY);
> > > * Enabling USB PHY passby in HCI mode (controlled by PMU).
> > >
> > > The current code will enable passby for each PHY and reroute PHY0 to
> > > MUSB, which is inconsistent and results in broken USB host support
> > > for port 0.
> > >
> > > Passby on PHY0 must only be enabled when we want to use HCI. Since
> > > host/device mode detection is not available from the PHY code and
> > > because U-Boot does not support changing the mode dynamically anyway,
> > > we can just mux the controller to MUSB if it is enabled and mux it to
> > > HCI otherwise.
> > >
> > > This fixes USB host support for port 0 on platforms with PHY0 dual-route,
> > > especially on boards like Pine64 (with only USB-A host ports) and
> > > TV boxes without OTG ports.
> > >
> > > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > [Andre: tweak commit message, use IS_ENABLED()]
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > > Hi,
> > >
> > > for H6 boards to work this requires a DT update (to get the <&usbphy 0>
> > > links between HCI and PHY), which I will send later.
> > > Tested on Pine H64, Pine64-LTS, OrangePi Zero, OrangePi PC 2, BananaPi M64,
> > > BananaPi M1.
> > >
> > > Cheers,
> > > Andre
> > >
> > >  drivers/phy/allwinner/phy-sun4i-usb.c | 16 ++++++++++++++--
> > >  1 file changed, 14 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
> > > index 5723c980323..e6ceafc7648 100644
> > > --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> > > +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> > > @@ -313,9 +313,21 @@ static int sun4i_usb_phy_init(struct phy *phy)
> > >                                     data->cfg->disc_thresh, PHY_DISCON_TH_LEN);
> > >         }
> > >
> > > -       sun4i_usb_phy_passby(phy, true);
> > > +       if (IS_ENABLED(CONFIG_USB_MUSB_SUNXI)) {
> >
> > I believe i did comment this before to use driver_data flag as this is
> > full dm driver instead of macro style.
>
> Which driver_data field would that be? This is not about a particular
> SoC's PHY, this is about whether we use peripheral or host mode for
> controller 0. As Paul mentioned in the commit message above:
>
> "... Since host/device mode detection is not available from the PHY
> code and because U-Boot does not support changing the mode dynamically
> anyway, ...."

Yeah., I missed it. Thanks for pointing it out.


>
> So a possible alternative would be to look up the dr_mode property in
> the DT node. BUT: this property lives in the musb DT node, not in this
> node the PHY driver knows about. Happy to take a patch that makes the
> connection and looks that up. But I am not sure that covers all cases.
>
> Meanwhile a equivalent and MUCH simpler solution is to use the Kconfig
> symbol for the MUSB driver: as Paul correctly mentioned, this is a
> static decision: only one of them can be effectively active in a build,
> and inclusion of the MUSB driver wins over the host controller. So
> using this symbol as a switch seems to be the best solution to me.

Handling dr_mode can be possible in U-Boot, I did tried but not
completed as patch.
drivers/usb/musb-new/ti-musb.c has base code for ti musb chips.

May be supporting that would handle this case.

Jagan.
