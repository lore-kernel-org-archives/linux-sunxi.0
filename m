Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2516126286
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Apr 2024 12:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713789294; cv=none; b=oW5+4nAZ76Vrv05ME67VPL98ta/0w/4aW3URF5YpeUXArSMex2PUwn97RmfUAu+2jffi5eA79nqg9onEp6sQgWY1r9N8COeYc0osTAwTmfPDDd4HIgfQwtIk9/TRDlYCenOz4q/R4KMBias+C40fzv0thpglgeUZ8ATlc4odC8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713789294; c=relaxed/simple;
	bh=bgfHRCke/1fxZcEX2cCxyFprWIkbIc/pvZaX7/wWX2M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VjfC4S4AmpqsA5XF8LZb7s7Ka5tPtGCIkqUduZfWiukaz0v+re+5wh76khcMbrRUb/ZxtBaQqtLCCAfBVZeNDieJ7w6W96kJW7hYG6nCgJQXJfmoTtGZi2PQ1S9gWdd3EXGE6BMAy4XNGgzZE7YgDnTsKQ3udoDilbIpNrqUmoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD2F6339;
	Mon, 22 Apr 2024 05:35:20 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F14B3F7BD;
	Mon, 22 Apr 2024 05:34:51 -0700 (PDT)
Date: Mon, 22 Apr 2024 13:34:48 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: "Ryan Walklin" <ryan@testtoast.com>
Cc: "Chris Morgan" <macromorgan@hotmail.com>, "Chen-Yu Tsai"
 <wens@csie.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel Holland"
 <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/5] arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
Message-ID: <20240422133448.6866a3c5@donnerap.manchester.arm.com>
In-Reply-To: <2735abdc-764d-4073-a55b-a4f5572a74f8@app.fastmail.com>
References: <20240420104354.334947-5-ryan@testtoast.com>
	<20240420104354.334947-8-ryan@testtoast.com>
	<20240421014920.4946a5ce@minigeek.lan>
	<DM4PR05MB922920FBFF980694507FAE11A5132@DM4PR05MB9229.namprd05.prod.outlook.com>
	<2735abdc-764d-4073-a55b-a4f5572a74f8@app.fastmail.com>
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

On Sun, 21 Apr 2024 20:43:26 +1200
"Ryan Walklin" <ryan@testtoast.com> wrote:

Hi,

> On Sun, 21 Apr 2024, at 4:00 PM, Chris Morgan wrote:
> 
> > FYI - PI12 can run as a PWM so when we get PWM output I intend to
> > request this be run as a PWM led (so we can adjust the brightness).
> > I'll handle that when it's ready though so don't worry for now.  
> 
> Sounds good.
> 
> > Your preference, but in the past I've had the volume up/down done as a
> > seperate node so we can enable key repeat.   
> 
> Done as mentioned.
> 
> > separation.  Also I usually alphabetize node names, I don't remember
> > if I'm just that anal or if I was told to at one point though.  
> 
> I'm easy, the order there seemed logical based on the physical layout on the -Plus but I don't have a real preference.
> 
> >
> > It's described wrong, but based on the behaviour I've seen. The specific
> > seems to be 2 GPIO controlled regulators; one of them enables the logic
> > voltage for the USB (the 3.3v regulator) and the other enables the VBUS
> > for the USB (the 5v regulator). If you only enable the 5v regulator the
> > bus otherwise lays dormant. If you only enable the 3v3 regulator the
> > USB bus powers on and intermittently enumerates devices at 3.3v.
> > Further enabling the 5v regulator drives the USB at 4.6v (I'm guessing
> > something is still wrong, we have more to poke at).
> >
> > To my knowledge this only applies for the USB host port which this
> > device lacks.
> >  
> Will await your work on this, I'm not at all familiar with USB to this depth, conceptually makes sense though. This will also rely on the boost working well, which is at least now being enabled with the WIP AXP717 driver.
> 
> 
> >
> > After much digging I'm certain the rails powering the wifi are
> > reg_cldo4 for the 3.3v and reg_aldo4 for the IO bits at 1.8v.
> > The curious thing about reg_cldo4 is it appears to feed into
> > another regulator that regulates at precisely 3.3v. If I under or
> > overvolt cldo4 I still read exactly 3.3v at the wifi module, but as
> > soon as I turn off reg_cldo4 the wifi reads 0v. So while I can't
> > directly control the power of the wifi's 3.3v rail, as long as I
> > get cldo4 close to 3.3v it powers correctly.  
> 
> Nice, have reworked the SD and Wifi regulators as described, and power management for the Wifi in particular seems to be working much better after moving it off BLDO2 (which seems to be VCC-PLL) to CLDO4. 
> 
> >> > +&mmc0 {
> >> > +	vmmc-supply = <&reg_vcc_sd2>;  
> >> 
> >> I don't think this GPIO controlled regulator provides the supply voltage
> >> for the first SD card, since it would be disabled on reset, and the
> >> BROM couldn't boot from the SD card. So it must be some other 3.3V
> >> source, either a discrete regulator (fixed regulator), or some
> >> default-on 3.3V AXP rail.  
> >
> > Both the vcc and the logic for the mmc0 appear to be handled by the
> > cldo3 regulator at 3.3v.
> >  
> Thanks, makes sense. I've tentatively renamed CLDO3 to VCC-IO, looking at the H616 datasheet.
> >>   
> >> > +	disable-wp;
> >> > +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
> >> > +	bus-width = <4>;
> >> > +	status = "okay";
> >> > +};
> >> > +
> >> > +&mmc2 {
> >> > +	vmmc-supply = <&reg_vcc_sd2>;
> >> > +	vqmmc-supply = <&reg_aldo1>;
> >> > +	cd-gpios = <&pio 4 22 GPIO_ACTIVE_LOW>; /* PE22 */
> >> > +	bus-width = <4>;
> >> > +	status = "okay";
> >> > +};  
> >> 
> >> This one seems more plausible. To confirm this, you could not use
> >> reg_vcc_sd2 anywhere, and use some other 3.3V supply for vmmc, which
> >> should break operation on the second SD card. Then just swap
> >> reg_vcc_sd2 back in, and if it starts working again, we have confirmation.
> >>   
> Swapped in CLDO4 for MMC2 and the card read fine, will swap it back and see what happens.
> >
> > cldo3 and the gpio controlled regulator are the 2 regulators used for
> > mmc2 on my board. My notes have the vmmc supply as cldo3 and the
> > vqmmc supply as the GPIO controlled one, but that feels wrong. That
> > said the IO pins measured 1.1v when the GPIO regulator was off and
> > 3.3v when the GPIO regulator was on. The 1.1v didn't seem to come
> > from the PMIC, as the only rail I had running 1.1v at the time was
> > the RAM and I tested and confirmed that wasn't it.
> >  
> >> > +
> >> > +&ohci0 {
> >> > +	status = "okay";
> >> > +};
> >> > +
> >> > +&ehci0 {
> >> > +	status = "okay";
> >> > +};
> >> > +  
> >
> > I haven't confirmed on my board we need ohci0 and ehci0 for the OTG
> > port.
> >  
> OK, shall I remove them or will it do no harm?

For pure peripheral mode we don't need them, but it wouldn't harm to have
them anyway, and later on we will want to have them.

> >> > +&r_rsb {
> >> > +   status = "okay";
> >> > +  
> >
> > Any advantage to doing this on the rsb over i2c? That's how I have mine
> > wired. Both are fine with me, I just didn't know what was better.
> >  
> I don't think so, this was Andre's first suggestion when he sent the AXP717's kernel driver so have stuck with it, but either should be fine.

As mentioned in the other mail, please stick to RSB.

> >> > +
> >> > +		vin1-supply = <&reg_vcc5v>;
> >> > +		vin2-supply = <&reg_vcc5v>;
> >> > +		vin3-supply = <&reg_vcc5v>;
> >> > +		vin4-supply = <&reg_vcc5v>;  
> >
> > FYI - I never actually confirmed the vin supply of the PMIC, I just put
> > these in here to shut up some errors or warnings. If these are based
> > on something I did it couldn't hurt to recheck.  
> 
> Ta, will see if I can find anything out.
> 
> >  
> >> > +
> >> > +		regulators {
> >> > +			reg_dcdc1: dcdc1 {
> >> > +				regulator-always-on;
> >> > +				regulator-boot-on;
> >> > +				regulator-min-microvolt = <810000>;
> >> > +				regulator-max-microvolt = <1100000>;  
> >
> > The CPU opp table in the BSP device tree had this between 900000 and
> > 1120000. Though like most things, take anything in the BSP device
> > tree with a grain of salt (lime and tequila help too).
> >  
> 
> Quite! That's the spec from the H616 datasheet, I may need to push it up to 1.16v max to hit 1.5Ghz, but will relook at it once the cpufreq patches land.
> 
> > I'm just speculating, but I strongly *guess* that this dcdc2 is used
> > for the GPU. SoC datasheet says max should be 900000 for the GPU, but
> > I don't have an opp table to go off of sadly.
> >  
> >> > +			reg_dcdc2: dcdc2 {
> >> > +				regulator-always-on;
> >> > +				regulator-min-microvolt = <940000>;
> >> > +				regulator-max-microvolt = <940000>;
> >> > +				regulator-name = "vdd-sys";
> >> > +			};  
> 
> Thanks, I think I did know that from somewhere. My reading of the datasheet is 0.81-0.99v though, so will put those in.

Please try to be as precise as possible. The BSP used 0.94V, if I remember
the dumps correctly, so it's better to stick with that single value.
*Changing* such a critical voltage during runtime sounds like asking for
trouble, and given the recent experience with GPU DVFS on the A64, I'd say
we stick with a single voltage.
Also a range only makes sense if the consumer knows about that and
supports a change, examples are the SD card I/O voltage, or the CPU
supply, for DVFS. But most devices just *enable* their regulator. So this
would leave the voltage at whatever was set before, which does not sound
helpful if this was wrong or slightly off for whatever reason.

> > aldo4 is a critical regulator that should run at 1.8v based on my
> > testing.
> >  
> Yup, noted.
> 
> >
> > cldo3 is a critical regulator run at 3.3v based on my testing. It
> > supplies power to the majority of the system's pins.
> >  
> Have called this VCC-IO for now.

Yeah, that's a good name.

Cheers,
Andre

> > On my 35XXH I can confirm PG is supplied by reg_aldo4 at 1.8v and the
> > rest are supplied by reg_cldo3 at 3.3v.
> >
> >         vcc-pa-supply = <&reg_cldo3>;
> >         vcc-pc-supply = <&reg_cldo3>;
> >         vcc-pe-supply = <&reg_cldo3>;
> >         vcc-pf-supply = <&reg_cldo3>;
> >         vcc-pg-supply = <&reg_aldo4>;
> >         vcc-ph-supply = <&reg_cldo3>;
> >         vcc-pi-supply = <&reg_cldo3>;
> >
> > This is what my 35XXH looks like after manually raising or lowering the
> > PMIC voltage values a tad, observing the GPIO out voltages, adjusting
> > again, measuring the voltages again, etc etc. By checking at least 1
> > pin from each bank and confirming voltage changes via PMIC changes
> > I get this mapping.
> >  
> 
> Great, have added these in. From the vendor DT looks like the audio codec is powered from the G pin bank.
> 
> > Thank you for all your hard work on this series. I'm going to continue
> > to try and identify the remaining regulators on my board and what they
> > do/how they're used. I expect at least one or two of the ones we've
> > flagged for removal will need to be added back once we get the panel
> > code working.
> >
> > Chris  
> 
> No worries, thanks for the feedback! Much improved now, I think the last big issue here is the USB ports. Have been testing on my -H for now, but will have to look at the -Plus too given the single port.
> 
> Ryan

