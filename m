Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D10B80C
	for <linux-sunxi@lists.linux.dev>; Sat,  1 Jul 2023 00:37:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6F60C14;
	Fri, 30 Jun 2023 17:38:36 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8266D3F663;
	Fri, 30 Jun 2023 17:37:50 -0700 (PDT)
Date: Sat, 1 Jul 2023 01:37:07 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Chris Morgan <macromorgan@hotmail.com>, Chris Morgan
 <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, uwu@icenowy.me, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: sunxi: add support for Anbernic RG-Nano
Message-ID: <20230701013707.54c6d37a@slackpad.lan>
In-Reply-To: <ytgchgmhgegjdqe44yamcgh6ovk6yxbpj2oxgrtslqle5tskvl@np2oxx4l6a5w>
References: <20230620200022.295674-1-macroalpha82@gmail.com>
	<20230620200022.295674-4-macroalpha82@gmail.com>
	<20230621105228.41ca9fcf@donnerap.cambridge.arm.com>
	<SN6PR06MB53426B6D9456C68AAE8C51B0A527A@SN6PR06MB5342.namprd06.prod.outlook.com>
	<20230629203410.660eb9a4@slackpad.lan>
	<ytgchgmhgegjdqe44yamcgh6ovk6yxbpj2oxgrtslqle5tskvl@np2oxx4l6a5w>
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

On Fri, 30 Jun 2023 10:16:35 +0200
Maxime Ripard <mripard@kernel.org> wrote:

Hi,

> On Thu, Jun 29, 2023 at 08:34:10PM +0100, Andre Przywara wrote:
> > > > > +&usbphy {
> > > > > +	usb0_id_det-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;  
> > 
> > Where is this pin connected to, in the USB-C connector? One of the CC
> > pins?
> >   
> > > > > +	status = "okay";    
> > > > 
> > > > So in the commit message you say "USB-C for power", but this here
> > > > describes a full featured USB port. So does that work? Can you use it as a
> > > > gadget, but also as a host?    
> > > 
> > > Yes, it's an OTG port with the ID pin pulled to ground.  
> > 
> > Do you mean both CC pins? IIRC this means it's hardwired as a
> > peripheral (UFP).
> > 
> > If I ignore the ID pin above, this looks like on the OrangePi Zero2 or
> > the MangoPi MQ-R. In those cases we put peripheral in the DT, as this
> > is what this connection seems to indicate. That *can* be used a host as
> > well, with the "right" cable, but it's not really a well supported
> > configuration, so we leave this up to people to change this locally,
> > should they really desire so.  
> 
> The ID pin above is exactly what makes "the right cable" works:
> depending on the state of the ID pin the controller will act either as a
> peripheral or a host. Dual-mode works just fine, so if the hardware
> supports it there's no reason not to enable it.

Mmmh, I think that's correct for an USB micro-B socket, but this is a
USB type C one. I don't think USB type C role switching can be easily
implemented with just a single GPIO, probably not even with two purely
digital GPIOs, as you would need some more clever voltage detection
circuitry.
For a simple connection via a USB-2.0 A<->C cable this probably doesn't
matter (as nothing happens to the CC pins?), and a USB-C thumb drive
probably would work as well, but I doubt those boards can properly
detect that automatically.

Chris, can you check how many pins from the type C connector are
actually used on the board? Can you follow the traces? Does it just
pull CC1 and CC2 to GND, via a resistor? Or are those pins somehow
connected to the SoC, or even a separate USB-C controller chip? Maybe
also worth checking if the stock OS can detect hosts or devices attached
automatically.

I am not really familiar with the USB type C situation in those
simplified USB-2.0-only setups, so if anyone can shed some light on
this, I'd be grateful.

Cheers,
Andre
