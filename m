Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CDD517F
	for <linux-sunxi@lists.linux.dev>; Sun, 23 May 2021 00:01:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8ECB21042;
	Sat, 22 May 2021 17:01:40 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CADBD3F73B;
	Sat, 22 May 2021 17:01:38 -0700 (PDT)
Date: Sun, 23 May 2021 01:01:24 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh@kernel.org>, Icenowy
 Zheng <icenowy@aosc.io>, Ondrej Jirman <megous@megous.com>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 01/17] dt-bindings: mfd: axp20x: Add AXP305
 compatible (plus optional IRQ)
Message-ID: <20210523010124.2fb56fa5@slackpad.fritz.box>
In-Reply-To: <7ebfaef7-5cf2-e60c-99ef-4275c873e72d@sholland.org>
References: <20210519104152.21119-1-andre.przywara@arm.com>
	<20210519104152.21119-2-andre.przywara@arm.com>
	<7ebfaef7-5cf2-e60c-99ef-4275c873e72d@sholland.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 22 May 2021 09:46:23 -0500
Samuel Holland <samuel@sholland.org> wrote:

> On 5/19/21 5:41 AM, Andre Przywara wrote:
> > The AXP305 PMIC used in AXP805 seems to be fully compatible to the  
>                   ^^^^^^^^^^^^^^
> Typo? Do you mean "used with the H616 SoC"?

Ouch, yes. And even more embarrassingly Chen-Yu pointed that out already
in the previous version. Same for the compatible string.

Thanks for having a look!

Cheers,
Andre

> 
> > AXP805 PMIC, so add the proper chain of compatible strings.
> > 
> > Also at least on one board (Orangepi Zero2) there is no interrupt line
> > connected to the CPU, so make the "interrupts" property optional.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/axp20x.txt | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
> > index 4991a6415796..4fd748101e3c 100644
> > --- a/Documentation/devicetree/bindings/mfd/axp20x.txt
> > +++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
> > @@ -26,10 +26,10 @@ Required properties:
> >      * "x-powers,axp803"
> >      * "x-powers,axp806"
> >      * "x-powers,axp805", "x-powers,axp806"
> > +    * "x-powers,axp803", "x-powers,axp805", "x-powers,axp806"  
>                    ^^^^^^
> This should be x-powers,axp305.
> 
> Regards,
> Samuel
> 
> >      * "x-powers,axp809"
> >      * "x-powers,axp813"
> >  - reg: The I2C slave address or RSB hardware address for the AXP chip
> > -- interrupts: SoC NMI / GPIO interrupt connected to the PMIC's IRQ pin
> >  - interrupt-controller: The PMIC has its own internal IRQs
> >  - #interrupt-cells: Should be set to 1
> >  
> > @@ -43,6 +43,7 @@ more information:
> >  			AXP20x/LDO3: software-based implementation
> >  
> >  Optional properties:
> > +- interrupts: SoC NMI / GPIO interrupt connected to the PMIC's IRQ pin
> >  - x-powers,dcdc-freq: defines the work frequency of DC-DC in KHz
> >  		      AXP152/20X: range:  750-1875, Default: 1.5 MHz
> >  		      AXP22X/8XX: range: 1800-4050, Default: 3   MHz
> >   
> 
> 

