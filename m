Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF5513E037
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Apr 2024 10:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713781055; cv=none; b=TYPV9gaOkiTpNx480n521K1p+Z5e/D3qa6Apu0vGRwm3hGGy6oP6tNLOzmrYAG40LtqwIKt/WjngnuQkdEBfG3noFP+gEqw7Hz75hV/qDQCq7pA3lBPAIIstTTREwZq2ojhg6KLVE+Ir2mFj4o3BKJSalkfLT5Nr4RuFEJsrte4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713781055; c=relaxed/simple;
	bh=hXL8fR9Gy+OGSaVOuyHBqMGNskD6GOPnyWzd73+YmsI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=taYpfvDfO96o1ql8qTc65uzWcuXJetTeii+eDgVzRJH4wZuUVmAb1ggyjb6bGO5ii/Hm+2o0FFfSQ3xl9/JnFWZI4XOvNWjgmLJ8vMdv6P8QeVLCc3vGbESK7buvzkpCyzxcwSpCMFQxEOn11bJ3cl8UykpQb+GG/OS1yMDNlzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DC11339;
	Mon, 22 Apr 2024 03:18:01 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD0FA3F64C;
	Mon, 22 Apr 2024 03:17:31 -0700 (PDT)
Date: Mon, 22 Apr 2024 11:17:27 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: "Ryan Walklin" <ryan@testtoast.com>
Cc: "Chen-Yu Tsai" <wens@csie.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, "Chris Morgan" <macromorgan@hotmail.com>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/5] arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
Message-ID: <20240422111727.11854df3@donnerap.manchester.arm.com>
In-Reply-To: <275d01fe-1360-4e9b-80c1-2029fce4b2a5@app.fastmail.com>
References: <20240420104354.334947-5-ryan@testtoast.com>
	<20240420104354.334947-8-ryan@testtoast.com>
	<20240421014920.4946a5ce@minigeek.lan>
	<275d01fe-1360-4e9b-80c1-2029fce4b2a5@app.fastmail.com>
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

On Sun, 21 Apr 2024 14:28:22 +1200
"Ryan Walklin" <ryan@testtoast.com> wrote:

Hi Ryan,

(please also see my reply to Chris' email, it was easier to reply there.)

> On Sun, 21 Apr 2024, at 12:49 PM, Andre Przywara wrote:
> > On Sat, 20 Apr 2024 22:43:56 +1200
> > Ryan Walklin <ryan@testtoast.com> wrote:
> >
> > Hi Ryan,
> >
> > many thanks for the respin and the changes! We are getting there ...  
> 
> Thanks for the review!
> 
> >> 
> >> [1]: https://lore.kernel.org/linux-sunxi/20240419071450.7aiheeoyq35yjoo7@vireshk-i7/T/#t
> >> [2]: https://lore.kernel.org/linux-sunxi/20240418181615.1370179-1-macroalpha82@gmail.com/T/#t  
> >
> > As those are dependencies, but WIP, this gets a bit tricky:
> > - cpufreq is pretty far, but comes through a different tree. I suggest
> >   you drop the cpu-opp.dtsi include, to not complicate things. We can
> >   add this later as a fix, once this OPP file has reached the master
> >   tree.  
> 
> Done, thanks. Have also not increased the DCDC1 voltage to 1.16v for 1.5GHz as it's not yet working (and technically out of spec for the SoC) but will relook at the vendor BSP once this set is merged.

Yes, that sounds good to me, thanks!

> > - The NMI binding and DT node seem important, but have not been merged
> >   yet. I suggest to mention them as a requirement.   
> 
> Done, thanks.
> 
> > - The GPADC (in the later patch) is similar, but it is not as critical
> >   as the NMI.   
> 
> Will pull this out separately, as you say its only required for the joysticks on the -H.
> 
> >> +	reg_vcc_usb: regulator-vcc-5v0-usb {
> >> +		compatible = "regulator-fixed";
> >> +		enable-active-high;
> >> +		gpio = <&pio 8 7 GPIO_ACTIVE_HIGH>; /* PI7 */
> >> +		regulator-name = "vcc_5v0_usb";
> >> +		regulator-min-microvolt = <5000000>;
> >> +		regulator-max-microvolt = <5000000>;
> >> +		vin-supply = <&vcc_3v3_usb>;  
> >
> > This looks wrong, see below.
> >  
> >> +	};
> >> +
> >> +	vcc_3v3_usb: vcc-3v3-usb {
> >> +		compatible = "regulator-fixed";
> >> +		enable-active-high;
> >> +		gpio = <&pio 4 5 GPIO_ACTIVE_HIGH>; /* PE5 */
> >> +		regulator-always-on;
> >> +		regulator-boot-on;  
> >
> > There seems to be something off with this one. First, it seems odd that
> > an always-on regulator is GPIO controlled, as this surely means it's
> > not enabled at reset time (because the GPIO is initially HighZ and thus
> > not enabled). So who turns this on? Most likely it's the kernel? What
> > happens if we turn this off (or leave it off)?  
> 
> This makes more sense with that explanation, thanks. Taking a while to get my head round how the power distribution is done in the embedded space.
> 
> >
> > Secondly, why is this 3.3V (both by name and voltage), but then
> > supplies the 5.0V USB VBUS?
> > And given that this is chained with reg_vcc_usb above, are those really
> > two regulators, controlled by two GPIOs?
> >  
> >> +		regulator-name = "vcc_3v3_usb";
> >> +		regulator-max-microvolt = <3300000>;
> >> +		regulator-min-microvolt = <3300000>;
> >> +	};
> >> +
> >> +	reg_vcc5v: regulator-vcc5v { /* USB-C power input */
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "vcc-5v";
> >> +		regulator-min-microvolt = <5000000>;
> >> +		regulator-max-microvolt = <5000000>;
> >> +	};  
> 
> Will do some more work on this and try and figure it out. The USB and second SD are not working well currently, probably this is why.
> >> +
> >> +	reg_pll_dcx0: regulator-pll-dcx0 {  
> >
> > It's DCXO (letter "oh", not zero): digitally controlled/compensated
> > crystal *o*scillator.  
> 
> D'oh! Had to google PLL, should have googled this too.
> 
> >  
> >> +		compatible = "regulator-fixed";
> >> +		regulator-always-on;
> >> +		regulator-name = "vcc-pll";
> >> +		regulator-min-microvolt = <1800000>;
> >> +		regulator-max-microvolt = <1800000>;
> >> +	};  
> >
> > That one looks odd as well. While there might be a discrete regulator
> > (what this node is describing), I doubt it, since the AXP717 has plenty
> > of rails. In particular I am not sure if that fixed one would supply
> > PortG (mainly WiFi), which seems unneeded for the boot process, and
> > surely we want that switchable to save power if the WiFi is not needed.
> >
> > You also have a VCC-PLL regulator below (BLDO2).
> > So please try to drop this regulator, I am pretty sure there is an AXP
> > rail that powers the WiFi.  
> 
> Makes sense, will dig into the vendor BSP.
> >
> > See below for more on this.
> >  
> 
> >> +
> >> +&mmc2 {
> >> +	vmmc-supply = <&reg_vcc_sd2>;
> >> +	vqmmc-supply = <&reg_aldo1>;
> >> +	cd-gpios = <&pio 4 22 GPIO_ACTIVE_LOW>; /* PE22 */
> >> +	bus-width = <4>;
> >> +	status = "okay";
> >> +};  
> >
> > This one seems more plausible. To confirm this, you could not use
> > reg_vcc_sd2 anywhere, and use some other 3.3V supply for vmmc, which
> > should break operation on the second SD card. Then just swap
> > reg_vcc_sd2 back in, and if it starts working again, we have confirmation.
> >  
> In hindsight this is taken from the vendor BSP, so I think is correct but will do some testing.

Don't sweat it, if that's working, it's fine. If it's not entirely
accurate, we can fix that later.

> 
> >> +		x-powers,drive-vbus-en;  
> >
> > Remove this last line, the AXP717 binding does not support this, and the
> > Linux driver doesn't implement this, as the AXP717 does not seem to
> > have this functionality.  
> 
> Thanks, fixed.
> 
> >> +
> >> +			reg_aldo3: aldo3 {
> >> +				regulator-always-on;
> >> +				regulator-boot-on;  
> >
> > Please remove this last line, it doesn't make sense in this context. Cf.
> > Documentation//devicetree/bindings/regulator/regulator.yaml.
> > I think the same applies to the other uses throughout this file.
> >  
> >> +				regulator-min-microvolt = <500000>;
> >> +				regulator-max-microvolt = <3500000>;  
> >
> > This is not right. What is the voltage of this rail? The kernel should
> > tell you what was set in the register, through regulator_summary, or you
> > check what's the voltage on a BSP system.
> >  
> >> +				regulator-name = "axp717-aldo3";  
> >
> > If the system dies when you remove always-on, you might have found some
> > essential supply. Candidates for consumers are listed in the
> > H616 or T5 series datasheet. Matching the voltage might give you an
> > idea. Then use this consumer as the name.
> >  
> >> +			};
> >> +
> >> +			reg_aldo4: aldo4 {  
> >
> > Same for this one: Please remove regulator-boot-on, fix the voltage,
> > and provide some rationale why this needs to be on.  
> 
> Thanks, will get the correct voltages. It turns out ALDO3/4 are both needed, but CPUSLDO is not. Will try and figure out what they are supplying.
> 
> >> +
> >> +			reg_boost: boost {
> >> +				regulator-min-microvolt = <5126000>;
> >> +				regulator-max-microvolt = <5126000>;  
> >
> > It might be better to use a range, say 5.0V till 5.2V. The
> > kernel will then just continue using the default, which seems to be this
> > 5.126V (5440mV + 9 * 64mV).  
> 
> Thanks, fixed.

I saw in your git tree you kept the max at 5.126V. I think it would make
more sense to put 5.2V there, since this is the typical accepted high
voltage for VBUS, as issued by many power supplies, for instance. Also it
somewhat detaches that entry from the limitations of the AXP, and more
states what we *want*.
It wouldn't immediately make a difference anyways, since the kernel will
see that the voltage already programmed (5.126V) is within range, and will
just keep it.

Cheers,
Andre

> >> +
> >> +&pio {
> >> +	vcc-pg-supply = <&reg_pll_dcx0>;  
> >
> > As mentioned above, it seems unlikely to be a fixed regulator. If in
> > doubt, leave them out, they are not essential for the operation.
> >  
> Will do for now, thanks.
> >> +};
> >> +
> >> +/* the AXP717 has USB type-C role switch functionality, to be implemented */  
> >
> > Replace "to be implemented" with "not yet described by the binding".
> > This is DT land, so we don't care about implementations or the Linux
> > kernel, it's all about DTs and DT bindings.
> >  
> >> +&usbotg {
> >> +	dr_mode = "host";   /* USB type-C receptable */  
> >
> > So does this really work? It seems wrong to make this unconditional,
> > given this is the only way to charge the device. When power is supplied
> > through the USB-C port, surely driving VBUS from the board sounds
> > wrong. Unless you have a killer feature for a host port, I think
> > without working role switching, "peripheral" would be the safer
> > choice.
> >  
> >> +	status = "okay";
> >> +};
> >> +
> >> +&usbphy {
> >> +	usb0_vbus-supply = <&reg_vcc_usb>;  
> >
> > When you stick to "peripheral" above, you should drop this line for
> > now, especially since this regulator chain looks quite suspicious still.
> >  
> Thanks, fixed.
> > Cheers,
> > Andre  
> 
> Thanks again for the review! Will post up a v3 after some more thought about the regulators.
> 
> Ryan

