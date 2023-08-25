Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D051988A
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Aug 2023 21:54:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46A24D75;
	Fri, 25 Aug 2023 14:55:06 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 971453F762;
	Fri, 25 Aug 2023 14:54:23 -0700 (PDT)
Date: Fri, 25 Aug 2023 22:53:26 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, mripard@kernel.org, jagan@edgeble.ai,
 heiko@sntech.de, uwu@icenowy.me, daniel@ffwll.ch, airlied@gmail.com,
 sam@ravnborg.org, neil.armstrong@linaro.org, noralf@tronnes.org,
 samuel@sholland.org, jernej.skrabec@gmail.com, wens@csie.org,
 conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH V3 6/8] ARM: dts: sun8i: v3s: add EHCI and OHCI to v3s
 dts
Message-ID: <20230825225326.613d0052@slackpad.lan>
In-Reply-To: <SN6PR06MB53420D67BB7E11486388637EA5E3A@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230823212554.378403-1-macroalpha82@gmail.com>
	<20230823212554.378403-7-macroalpha82@gmail.com>
	<20230824222150.5a0d16e3@slackpad.lan>
	<SN6PR06MB53420D67BB7E11486388637EA5E3A@SN6PR06MB5342.namprd06.prod.outlook.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Aug 2023 10:58:00 -0500
Chris Morgan <macromorgan@hotmail.com> wrote:

Hi Chris,

> On Thu, Aug 24, 2023 at 10:21:50PM +0100, Andre Przywara wrote:
> > On Wed, 23 Aug 2023 16:25:52 -0500
> > Chris Morgan <macroalpha82@gmail.com> wrote:
> > 
> > Hi Chris,
> >   
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > > 
> > > Add the EHCI and OHCI controller to the Allwinner v3s to support using
> > > USB in host mode.  
> > 
> > Alright, so was it really that easy? I was afraid we left out host mode
> > for a reason back then ....  
> 
> Can't speak to that, but it is working for me as both a host and a
> gadget.
> 
> >   
> > > 
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > ---
> > >  arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> > > index c87476ea31e2..eb63dd274305 100644
> > > --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> > > +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> > > @@ -319,6 +319,25 @@ usbphy: phy@1c19400 {
> > >  			#phy-cells = <1>;
> > >  		};
> > >  
> > > +		ehci: usb@1c1a000 {
> > > +			compatible = "allwinner,sun8i-v3s-ehci", "generic-ehci";
> > > +			reg = <0x01c1a000 0x100>;
> > > +			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks = <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>;
> > > +			resets = <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;  
> > 
> > Please add the link the PHY here:
> > 			phys = <&usbphy 0>;
> > 			phy-names = "usb";  
> 
> usbphy 0 doesn't work, but if I do phys = <&usbphy 1>; for here and the
> OHCI node it does work. Is that expected/acceptable?

Well, that means it doesn't work, because the V3s has only one PHY, so
"1" is invalid, and will either be ignored or rejected (any hints in
dmesg?)

> By "doesn't work"
> I mean the device is always in HOST mode if I use 0 and switches
> correctly (the extcon shows HOST=0 when unplugged or plugged into my
> computer, and shows HOST=1 if I plug in a device which I assume is
> the desired behavior).

You mean the latter part was with <usbphy 1>, and that's the same
behaviour as without the property?
That would mean that this part is still broken - I think somewhere in
the PHY driver. But this is a generic issue, and not specific to the
V3s, and your patch is just revealing it.

I will try to have a look in the next few days, to find the real
culprit.

Cheers,
Andre

> > > +			status = "disabled";
> > > +		};
> > > +
> > > +		ohci: usb@1c1a400 {
> > > +			compatible = "allwinner,sun8i-v3s-ohci", "generic-ohci";
> > > +			reg = <0x01c1a400 0x100>;
> > > +			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks = <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>,
> > > +				 <&ccu CLK_USB_OHCI0>;
> > > +			resets = <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;  
> > 
> > ... and here.
> > 
> > That would be definitely the right thing to do, but please check
> > whether it still works, especially OTG operation.
> > 
> > The addresses, clocks, resets and interrupts match the manual.
> > 
> > Cheers,
> > Andre.
> > 
> >   
> > > +			status = "disabled";
> > > +		};
> > > +
> > >  		ccu: clock@1c20000 {
> > >  			compatible = "allwinner,sun8i-v3s-ccu";
> > >  			reg = <0x01c20000 0x400>;  
> >   
> 
> Thank you,
> Chris
> 

