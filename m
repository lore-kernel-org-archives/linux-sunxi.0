Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385692C80
	for <linux-sunxi@lists.linux.dev>; Fri, 14 Jan 2022 10:38:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F6E76D;
	Fri, 14 Jan 2022 02:37:55 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 802F53F766;
	Fri, 14 Jan 2022 02:37:54 -0800 (PST)
Date: Fri, 14 Jan 2022 10:37:50 +0000
From: Andre Przywara <andre.przywara@foss.arm.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Evgeny Boger <boger@wirenboard.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 3/3] ARM: dts: sun8i: r40: add second ethernet
 support
Message-ID: <20220114103750.01f95d70@donnerap.cambridge.arm.com>
In-Reply-To: <20220114094255.br6qqqgoajvhpt2x@houat>
References: <20220113053734.105813-1-boger@wirenboard.com>
	<20220113053734.105813-4-boger@wirenboard.com>
	<20220114094255.br6qqqgoajvhpt2x@houat>
Organization: ARM
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Jan 2022 10:42:55 +0100
Maxime Ripard <maxime@cerno.tech> wrote:

Hi,

> On Thu, Jan 13, 2022 at 08:37:34AM +0300, Evgeny Boger wrote:
> > R40 (aka V40, A40i, T3) has two different Ethernet IPs
> > called EMAC and GMAC. EMAC only support 10/100 Mbit in MII mode,
> > while GMAC support both 10/100 (MII) and 10/100/1000 (RGMII).
> > 
> > In contrast to A10/A20 where GMAC and EMAC share the same pins
> > making EMAC somewhat pointless, on R40 EMAC can be routed to port H.
> > Both EMAC (on port H) and GMAC (on port A) can be then enabled at
> > the same time, allowing for two ethernet ports.
> > 
> > Signed-off-by: Evgeny Boger <boger@wirenboard.com>
> > ---
> >  arch/arm/boot/dts/sun8i-r40.dtsi | 49 ++++++++++++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
> > index 03d3e5f45a09..8770b105f86e 100644
> > --- a/arch/arm/boot/dts/sun8i-r40.dtsi
> > +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
> > @@ -217,6 +217,19 @@ syscon: system-control@1c00000 {
> >  			#size-cells = <1>;
> >  			ranges;
> >  
> > +			sram_a: sram@0 {
> > +				compatible = "mmio-sram";
> > +				reg = <0x00000000 0xc000>;
> > +				#address-cells = <1>;
> > +				#size-cells = <1>;
> > +				ranges = <0 0x00000000 0xc000>;
> > +
> > +				emac_sram: sram-section@8000 {
> > +					compatible = "allwinner,sun4i-a10-sram-a3-a4";
> > +					reg = <0x8000 0x4000>;
> > +				};
> > +			};
> > +
> >  			sram_c: sram@1d00000 {
> >  				compatible = "mmio-sram";
> >  				reg = <0x01d00000 0xd0000>;
> > @@ -553,6 +566,24 @@ gmac_rgmii_pins: gmac-rgmii-pins {
> >  				drive-strength = <40>;
> >  			};
> >  
> > +			emac_pa_pins: emac-pa-pins {
> > +				pins = "PA0", "PA1", "PA2",
> > +				       "PA3", "PA4", "PA5", "PA6",
> > +				       "PA7", "PA8", "PA9", "PA10",
> > +				       "PA11", "PA12", "PA13", "PA14",
> > +				       "PA15", "PA16";
> > +				function = "emac";
> > +			};
> > +
> > +			emac_ph_pins: emac-ph-pins {
> > +				pins = "PH8", "PH9", "PH10", "PH11",
> > +				       "PH14", "PH15", "PH16", "PH17",
> > +				       "PH18","PH19", "PH20", "PH21",
> > +				       "PH22", "PH23", "PH24", "PH25",
> > +				       "PH26", "PH27";
> > +				function = "emac";
> > +			};  
> 
> There's 17 pins on the first group, but 18 on the second, is it intentional?

Yeah, looks like PA17 is missing above. This pin is used for MII only, so
it is omitted from the existing gmac_rgmii_pins group.

Evgeny: Did you try a 100MBit PHY on PortA? That should work with both the
GMAC and EMAC, right? I wonder if we should add a group that connects all
pins needed for MII to the GMAC as well, so basically the above (with PA17
added), but using 'function = "gmac";'? Put an "/omit-if-no-ref/" before
that (also to those above?) to avoid blowing up the DTB needlessly.

Cheers,
Andre.
