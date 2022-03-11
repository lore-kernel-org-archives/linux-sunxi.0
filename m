Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E437E33D5
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Mar 2022 13:33:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A647D14BF;
	Fri, 11 Mar 2022 05:33:18 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB26B3FA27;
	Fri, 11 Mar 2022 05:33:16 -0800 (PST)
Date: Fri, 11 Mar 2022 13:33:14 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mesih
 Kilinc <mesihkilinc@gmail.com>, Icenowy Zheng <icenowy@aosc.io>, Jesse
 Taube <mr.bossman075@gmail.com>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, George Hilliard
 <thirtythreeforty@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Mark
 Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Subject: Re: [PATCH 11/14] ARM: dts: suniv: F1C100: add SPI support
Message-ID: <20220311133314.739ebab4@donnerap.cambridge.arm.com>
In-Reply-To: <15ed4319-9645-089c-9977-94dfd2fd79c5@sholland.org>
References: <20220307143421.1106209-1-andre.przywara@arm.com>
	<20220307143421.1106209-12-andre.przywara@arm.com>
	<15ed4319-9645-089c-9977-94dfd2fd79c5@sholland.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Mar 2022 20:19:57 -0600
Samuel Holland <samuel@sholland.org> wrote:

Hi Samuel,

many thanks for having a look!

> On 3/7/22 8:34 AM, Andre Przywara wrote:
> > The F1C100 series contains two SPI controllers, and many boards use SPI0
> > for a SPI flash, as the BROM is able to boot from that.
> > 
> > Describe the two controllers in the SoC .dtsi, and also add the PortC
> > pins for SPI0, since this is where BROM looks at when trying to boot
> > from the commonly used SPI flash.
> > 
> > The SPI controller seems to be the same as in the H3 chips, but it lacks
> > a separate mod clock. The manual says it's connected to AHB directly.
> > We don't export that AHB clock directly, but can use the AHB *gate* clock
> > as a clock source, since the MMC driver is not supposed to change the AHB  
> 
> Do you mean the SPI driver here?

Yes, indeed.

> 
> > frequency anyway.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  arch/arm/boot/dts/suniv-f1c100s.dtsi | 33 ++++++++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> > index 6f2f97458fe0..f8ec1c7a2ca9 100644
> > --- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
> > +++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
> > @@ -105,6 +105,34 @@ mmc1: mmc@1c10000 {
> >  			#size-cells = <0>;
> >  		};
> >  
> > +		spi0: spi@1c05000 {
> > +			compatible = "allwinner,suniv-f1c100s-spi",
> > +				     "allwinner,sun8i-h3-spi";
> > +			reg = <0x01c05000 0x1000>;
> > +			interrupts = <10>;
> > +			clocks = <&ccu CLK_BUS_SPI0>, <&ccu CLK_BUS_SPI0>;
> > +			clock-names = "ahb", "mod";
> > +			resets = <&ccu RST_BUS_SPI0>;
> > +			status = "disabled";
> > +			num-cs = <1>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +
> > +		spi1: spi@1c06000 {
> > +			compatible = "allwinner,suniv-f1c100s-spi",
> > +				     "allwinner,sun8i-h3-spi";
> > +			reg = <0x01c06000 0x1000>;
> > +			interrupts = <11>;
> > +			clocks = <&ccu CLK_BUS_SPI1>, <&ccu CLK_BUS_SPI1>;
> > +			clock-names = "ahb", "mod";
> > +			resets = <&ccu RST_BUS_SPI1>;
> > +			status = "disabled";
> > +			num-cs = <1>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +		};
> > +  
> 
> Please keep the nodes sorted by address. These should come before the MMC
> controllers.

Argh, sorry, I thought I fixed that up, but it must have messed that
up after a rebase.

Will send a fixed version.

Cheers,
Andre

> 
> >  		ccu: clock@1c20000 {
> >  			compatible = "allwinner,suniv-f1c100s-ccu";
> >  			reg = <0x01c20000 0x400>;
> > @@ -138,6 +166,11 @@ mmc0_pins: mmc0-pins {
> >  				drive-strength = <30>;
> >  			};
> >  
> > +			spi0_pc_pins: spi0-pc-pins {
> > +				pins = "PC0", "PC1", "PC2", "PC3";
> > +				function = "spi0";
> > +			};
> > +
> >  			uart0_pe_pins: uart0-pe-pins {
> >  				pins = "PE0", "PE1";
> >  				function = "uart0";
> >   
> 

