Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C128FC17
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Jul 2023 15:34:17 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id AA167240028
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Jul 2023 17:34:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1689694449; bh=22TXG/jnIvv1JbcrpJISbxaqYLWTAbqRT+E6bqk1xN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=qCVPS5vt3DgC0GuLpbjmeXVfAJl9twQU5kH6HOAA3NcgxfJCsEDgBOfPLpicrx4wb
	 65bQnksFXWRqNJwW6I7Y+KnsoMhtjeLsuo69D+H8S2MrfWHjdWszrfJn+kMnxC4V/0
	 wMWrdsurD4zfzxV2RflQklRIOwvH2oU18WgbyMSEwpRrBKILTLW9Xk1MYs0b3mmHgx
	 PsHrQ4eM3SVJDB9O16sbfPn/NQxzSxDE8vdtYJzwcCc8pjkNMV6c2le32GSWRW6uW+
	 e19/XGCbaJ/vr4VPcDQhBQxJEAqUwEKK2Z2xqM8KycrDtHm9l8uPSTqx3saOkyIIsu
	 xYnrQzK8HDRjg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4R52zy3z8nz6txt;
	Tue, 18 Jul 2023 17:34:06 +0200 (CEST)
Date: Tue, 18 Jul 2023 15:34:03 +0000
From: Anne Macedo <retpolanne@posteo.net>
To: Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, u-boot@lists.denx.de, linux-sunxi@lists.linux.dev, 
	Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: [PATCH] sunxi: H6: Enable Ethernet on Orange Pi One Plus
Message-ID: <65dtzlvek5t7lwmuyjrf32e5phtyg6w3tnygdsqju6xb46w7ch@mypb7yop5uam>
References: <20230711003957.658805-2-retpolanne@posteo.net>
 <30debca8b31ed4d2cbd64850d48b81ac@posteo.net>
 <20230716013502.1d556edc@slackpad.lan>
 <ZLOK2hkOhpFmgtSf@Red>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZLOK2hkOhpFmgtSf@Red>

On Sun, Jul 16, 2023 at 08:14:50AM +0200, Corentin Labbe wrote:
> Le Sun, Jul 16, 2023 at 01:35:02AM +0100, Andre Przywara a écrit :
> > On Tue, 11 Jul 2023 19:40:21 +0000
> > Anne Macedo <retpolanne@posteo.net> wrote:
> > 
> > Hi Anne,
> > 
> > thanks for reaching out to the list! But please try to avoid
> > pushing any patches downstream (Yocto) before they are accepted
> > or at least discussed upstream, see below.
> > 
> > > On 11.07.2023 02:39, Anne Macedo wrote:
> > > > Enable Ethernet on Orange Pi One Plus by using the correct phy for
> > > > Realtek RTL8211E instead of the Generic One. Also use CONFIG_MACPWR to
> > > > turn on ethernet on startup.
> > > > 
> > > > After this patch is applied, a few issues can be seen:
> > > > 
> > > > - there's still a PHY reset timed out error that doesn't seem to cause
> > > >   any impacts to the overall connection
> > > > 
> > > > - sometimes the emac driver times out after reset (yellow LED turns on
> > > >   and never blinks)
> > > > 
> > > > For future patches: for now, CONFIG_MACPWR is the only way to enable
> > > > Ethernet on boot. There's already code on the dts for using the 
> > > > 3v3-gmac
> > > > regulator. However, it is not probed on boot, so it only starts after a
> > > > "regulator status" command is issued.
> > 
> > MACPWR is going to go away (probably in the next two weeks), so please
> > have a look at this patch and see if that works for you:
> > https://github.com/apritzel/u-boot/commit/be1fdb42968
> > 
> > > > 
> > > > More details about the troubleshooting on [1].
> > > > 
> > > > [1]
> > > > https://lore.kernel.org/u-boot/4wsvwgy56e2xfgtvioru2tf2ofkqprlts36qggivxogww6pn5j@4jk63zxhzhag/
> > > > 
> > > > Signed-off-by: Anne Macedo <retpolanne@posteo.net>
> > > > ---
> > > >  arch/arm/dts/sun50i-h6-orangepi-one-plus.dts | 2 +-
> > > >  configs/orangepi_one_plus_defconfig          | 4 ++++
> > > >  2 files changed, 5 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/arm/dts/sun50i-h6-orangepi-one-plus.dts
> > > > b/arch/arm/dts/sun50i-h6-orangepi-one-plus.dts
> > > > index 29a081e72a..6427c58f8a 100644
> > > > --- a/arch/arm/dts/sun50i-h6-orangepi-one-plus.dts
> > > > +++ b/arch/arm/dts/sun50i-h6-orangepi-one-plus.dts
> > > > @@ -37,7 +37,7 @@
> > > > 
> > > >  &mdio {
> > > >  	ext_rgmii_phy: ethernet-phy@1 {
> > > > -		compatible = "ethernet-phy-ieee802.3-c22";
> > > > +		compatible = "ethernet-phy-id001c.c915", 
> > > > "ethernet-phy-ieee802.3-c22" ;
> > 
> > So this is really odd, why would you need that? 001c.c915 is the ID for
> > the normal standard Realtek 8211E PHY, which would be auto-detected via
> > MDIO. You just need to define CONFIG_PHY_REALTEK to include support.
> > Forcing this in the DT is not necessary and smells wrong.
> > 
> > But I suppose you needed that to get it to work, so could this be a
> > timing issue? Maybe the PHY doesn't come up quick enough after just
> > pulling PD6 high, so the auto-detection wouldn't work? The DT has a
> > "startup-delay-us = <100000>;" property, which MACPWR doesn't know
> > about and wouldn't observe.
> > So could you check whether just applying the "Remove MACPWR" patch, plus
> > adding "CONFIG_SUN8I_EMAC=y" and "CONFIG_PHY_REALTEK=y" to defconfig
> > fixes the issue? You may need to enable CONFIG_DM_REGULATOR_FIXED=y as
> > well, although this would become standard for all sunxi boards soon.
> > 
> > And you must NOT use SUNXI_SETUP_REGULATORS=0 in TF-A, as you need
> > ALDO2 to be set up by TF-A. We introduced this build option to
> > accommodate the OrangePi 3 board, which requires a specifically timed
> > regulator setup, which both TF-A and U-Boot would not observe. To not
> > crash the PHY with any incorrect regulator setup, we use this option to
> > make at least Linux work. The side effect is that some peripherals
> > (HDMI, Ethernet) will not work in U-Boot.
> > Also please note that a reset from Linux might not affect the PMIC, so
> > there might be different behaviour between and cold and warm boot.
> > 
> > Cheers,
> > Andre
> > 
> > > >  		reg = <1>;
> > > >  	};
> > > >  };
> > > > diff --git a/configs/orangepi_one_plus_defconfig
> > > > b/configs/orangepi_one_plus_defconfig
> > > > index aa5f540eb1..a1835492db 100644
> > > > --- a/configs/orangepi_one_plus_defconfig
> > > > +++ b/configs/orangepi_one_plus_defconfig
> > > > @@ -8,3 +8,7 @@ CONFIG_SUNXI_DRAM_H6_LPDDR3=y
> > > >  # CONFIG_SYS_MALLOC_CLEAR_ON_INIT is not set
> > > >  CONFIG_USB_EHCI_HCD=y
> > > >  CONFIG_USB_OHCI_HCD=y
> > > > +CONFIG_SUN8I_EMAC=y
> > > > +CONFIG_PHY_REALTEK=y
> > > > +CONFIG_PHY_ETHERNET_ID=y
> > > > +CONFIG_MACPWR="PD6"  
> > > 
> > > Adding linux-sunxi to the thread (I unfortunately forgot this list)
> > > 
> > 
> > 
> 
> Hello
> 
> Note that there is already a try to fix this in upstream linux:
> The v4 can be found at https://lore.kernel.org/linux-arm-kernel/Y3RDumClNkEW6L4F@lunn.ch/T/
> 
> And that I will send soon my last version https://github.com/montjoie/linux/tree/opi3-v5
Awesome! Once this gets merged, I can try to implement this on the
orange pi one plus (I believe your patch, although generic and supported
by a few boards, doesn't support the Orange Pi One Plus, right?).

Thanks for letting me know! 
> 
> Regards
