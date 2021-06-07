Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D487C29CA
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 14:26:16 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id f30so26627254lfj.1
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Jun 2021 07:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=mJLzHt2uyypGgw28MtCkK4vZD5HTfCu45L8FZnJ+cNQ=;
        b=HX3iT8wGPyLWdDH1/egy56DW6Kk0CXFiQsHHogQ/a69NOqdcx9iEefvLAJHc4AHAgL
         GBAeoV8Swpik461gyUGmtNHULIrTtz8VHD3IxkvRb4FQvsNblSnFFahKAy4V27Be+idT
         SD8kbYTApE2dHvRhjf2/Km5wk0V9fRu3F9LID+4JGndJXwntVXX0q/bW0fvytHOpAxZt
         QRHRV9cuWuia03oUYV/sGaKbaGxalTOAME1KkZAW9Wusu3W+5yMhltyJKw123fNm3iq8
         s/TlXaC9oUMull2HJPyUqcDwn1eJ9Qt4DEsDazC0hN+G0XfCSSVjgrkXRw4eHTTJSB4q
         f2Bg==
X-Gm-Message-State: AOAM532DeLH0ua8LpJvoLwvjw0kHo6CG6jULKKVM2VTbWie6BHPLqgD4
	BWr44AedtOASNsadrugTHKRHBz3dJVYamw==
X-Google-Smtp-Source: ABdhPJxlDTbl2a+l94grm7ulG1fa23flOoPaTfzFYolmeP9zo7NBIsQCLDbsWTXF4kz7jicu3bS9aQ==
X-Received: by 2002:a05:6512:20d9:: with SMTP id u25mr11598311lfr.452.1623075974814;
        Mon, 07 Jun 2021 07:26:14 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id j16sm1356246lfu.168.2021.06.07.07.26.14
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 07:26:14 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id f11so26484435lfq.4
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Jun 2021 07:26:14 -0700 (PDT)
X-Received: by 2002:a05:6512:20f:: with SMTP id a15mr12194697lfo.618.1623075973924;
 Mon, 07 Jun 2021 07:26:13 -0700 (PDT)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210519104152.21119-1-andre.przywara@arm.com>
 <20210519104152.21119-13-andre.przywara@arm.com> <20210524115946.jwsasjbr3biyixhz@gilmour>
 <20210525122901.778bfccd@slackpad.fritz.box> <20210607132255.7fa75a7k7ud2g7ux@gilmour>
 <20210607151742.2f05ff95@slackpad.fritz.box>
In-Reply-To: <20210607151742.2f05ff95@slackpad.fritz.box>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 7 Jun 2021 22:26:02 +0800
X-Gmail-Original-Message-ID: <CAGb2v66mFAWzM_mqT8GiP5NmPNXjEsKq8C6cn8EHSjK82etjyg@mail.gmail.com>
Message-ID: <CAGb2v66mFAWzM_mqT8GiP5NmPNXjEsKq8C6cn8EHSjK82etjyg@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH v6 12/17] phy: sun4i-usb: Introduce
 port2 SIDDQ quirk
To: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Cc: Maxime Ripard <maxime@cerno.tech>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>, 
	Ondrej Jirman <megous@megous.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-sunxi <linux-sunxi@googlegroups.com>, linux-sunxi@lists.linux.dev, 
	linux-kernel <linux-kernel@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, 
	Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org, 
	linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Jun 7, 2021 at 10:17 PM Andre Przywara <andre.przywara@arm.com> wrote:
>
> On Mon, 7 Jun 2021 15:22:55 +0200
> Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Maxime,
>
> > On Tue, May 25, 2021 at 12:29:01PM +0100, Andre Przywara wrote:
> > > On Mon, 24 May 2021 13:59:46 +0200
> > > Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Hi Maxime,
> > >
> > > > On Wed, May 19, 2021 at 11:41:47AM +0100, Andre Przywara wrote:
> > > > > At least the Allwinner H616 SoC requires a weird quirk to make most
> > > > > USB PHYs work: Only port2 works out of the box, but all other ports
> > > > > need some help from this port2 to work correctly: The CLK_BUS_PHY2 and
> > > > > RST_USB_PHY2 clock and reset need to be enabled, and the SIDDQ bit in
> > > > > the PMU PHY control register needs to be cleared. For this register to
> > > > > be accessible, CLK_BUS_ECHI2 needs to be ungated. Don't ask ....
> > > > >
> > > > > Instead of disguising this as some generic feature, do exactly that
> > > > > in our PHY init:
> > > > > If the quirk bit is set, and we initialise a PHY other than PHY2, ungate
> > > > > this one special clock, and clear the SIDDQ bit. We can pull in the
> > > > > other required clocks via the DT.
> > > > >
> > > > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > >
> > > > What is this SIDDQ bit doing exactly?
> > >
> > > I probably know as much as you do, but as Jernej pointed out, in some
> > > Rockchip code it's indeed documented as some analogue PHY supply switch:
> > > ($ git grep -i siddq drivers/phy/rockchip)
> > >
> > > In fact we had this pin/bit for ages, it was just hidden as BIT(1) in
> > > our infamous PMU_UNK1 register. Patch 10/17 drags that into the light.
> >
> > Ok
> >
> > > > I guess we could also expose this using a power-domain if it's relevant?
> > >
> > > Mmmh, interesting idea. So are you thinking about registering a genpd
> > > provider in sun4i_usb_phy_probe(), then having a power-domains property
> > > in the ehci/ohci nodes, pointing to the PHY node? And if yes, should
> > > the provider be a subnode of the USB PHY node, with a separate
> > > compatible? That sounds a bit more involved, but would have the
> > > advantage of allowing us to specify the resets and clocks from PHY2
> > > there, and would look a bit cleaner than hacking them into the
> > > other EHCI/OHCI nodes.
> >
> > I'm not sure we need a separate device node, we could just register the
> > phy driver as a genpd provider, and then with an arg (so with
> > of_genpd_add_provider_onecell?) the index of the USB controller we want
> > to power up.
>
> Yeah, I figured that myself meanwhile ;-) I now have a fairly nice
> implementation, which does away with the extra clocks and resets from
> the EHCI/OHCI nodes, and just adds one extra clock to the PHY node. The
> rest is power domains properties.

I'm wondering, since SIDDQ refers to the analog power for USB, it shouldn't
really affect the HCIs, only the PHYs. Is there any way to model it like
this and test it?

ChenYu

> > > I would not touch the existing SoCs (even though it seems to apply to
> > > them as well, just not in the exact same way), but I can give it a
> > > try for the H616. It seems like the other SIDDQ bits (in the other
> > > PHYs) are still needed for operation, but the PD provide could actually
> > > take care of this as well.
> > >
> > > Does that make sense or is this a bit over the top for just clearing an
> > > extra bit?
> >
> > Using what I described above should be fairly simple, so if we can fit
> > in an available and relevant abstraction, yeah, I guess :)
>
> Thanks!
> I will post what I have, just need to find some solution for the RTC
> clock bits.
>
> Cheers,
> Andre
>
> --
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe@googlegroups.com.
> To view this discussion on the web, visit https://groups.google.com/d/msgid/linux-sunxi/20210607151742.2f05ff95%40slackpad.fritz.box.
