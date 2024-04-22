Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E564482C1
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Apr 2024 11:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713783970; cv=none; b=id5o3FQmO9nli+d0Dj13iFhAtIzI4OS2yPw5uIJAOtQ8B4VQ9g0W+SwFlWkY/TkWuDa3oRNcQvruoAbInIt0CbVjC8OzzShvzPA7+T+Pn1HDEij2CqW2o6KWFrkAWHcqMB/edbDp91basbHYMjoGVOhZrBpTcZnPNpwaHzL+6U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713783970; c=relaxed/simple;
	bh=57cW7ascPUsihHn0GWoDpdTZIH+r7GKx/93O6GgwIwo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YZa66h/1uejbTXgh2BLzze3wjHINEhJJQqbvZB3dr+NX3nijyRD0OA7dXQqKKLcVij0tkBqBRkYM8+yXtnpgLWlUZ+fsT+2CIkw84iXw15L+yhes5i8IaXW8rALxspzsCrwxxU8V/MXo+G+ov6g04CDE3uC6ZxnlIDcdiQMnW8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BE0F339;
	Mon, 22 Apr 2024 04:06:34 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9229F3F7BD;
	Mon, 22 Apr 2024 04:06:04 -0700 (PDT)
Date: Mon, 22 Apr 2024 12:06:01 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: Ryan Walklin <ryan@testtoast.com>, Chen-Yu Tsai <wens@csie.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/5] arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
Message-ID: <20240422120601.5350d465@donnerap.manchester.arm.com>
In-Reply-To: <DM4PR05MB922920FBFF980694507FAE11A5132@DM4PR05MB9229.namprd05.prod.outlook.com>
References: <20240420104354.334947-5-ryan@testtoast.com>
	<20240420104354.334947-8-ryan@testtoast.com>
	<20240421014920.4946a5ce@minigeek.lan>
	<DM4PR05MB922920FBFF980694507FAE11A5132@DM4PR05MB9229.namprd05.prod.outlook.com>
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

On Sat, 20 Apr 2024 23:00:15 -0500
Chris Morgan <macromorgan@hotmail.com> wrote:

Hi,

> On Sun, Apr 21, 2024 at 01:49:20AM +0100, Andre Przywara wrote:
> > On Sat, 20 Apr 2024 22:43:56 +1200
> > Ryan Walklin <ryan@testtoast.com> wrote:
> > 
> > Hi Ryan,
> > 
> > many thanks for the respin and the changes! We are getting there ...
> >   
> > > The base model RG35XX (2024) is a handheld gaming device based on an Allwinner H700 chip.
> > > 
> > > The H700 is a H616 variant (4x ARM Cortex-A53 cores @ 1.5Ghz with Mali G31 GPU) which exposes RGB LCD and NMI pins.
> > > 
> > > Device features:
> > > - Allwinner H700 @ 1.5GHz
> > > - 1GB LPDDR4 DRAM
> > > - X-Powers AXP717 PMIC
> > > - 3.5" 640x480 RGB LCD
> > > - Two microSD slots
> > > - Mini-HDMI out
> > > - GPIO keypad
> > > - 3.5mm headphone jack
> > > 
> > > Enabled in this DTS:
> > > - AXP717 PMIC with regulators (interrupt controller TBC/TBD)
> > > - Power LED (charge LED on device controlled directly by PMIC)
> > > - Serial UART (accessible from PIN headers on the board)
> > > - MMC slots
> > > 
> > > Changelog v1..v2:
> > > - Update copyright
> > > - Spaces -> Tabs
> > > - Add cpufreq support [1]
> > > - Remove MMC aliases
> > > - Fix GPIO button and regulator node names
> > > - Note unused AXP717 regulators
> > > - Update regulator for SD slots
> > > - Remove unused I2C3 device
> > > - Update NMI interrupt controller for AXP717 [2]
> > > - Add chassis-type
> > > - Address USB EHCI/OHCI0 correctly and add usb vbus supply
> > > - Add PIO vcc-pg-supply
> > > - Correct boost regulator voltage and name
> > > 
> > > Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> > > 
> > > [1]: https://lore.kernel.org/linux-sunxi/20240419071450.7aiheeoyq35yjoo7@vireshk-i7/T/#t
> > > [2]: https://lore.kernel.org/linux-sunxi/20240418181615.1370179-1-macroalpha82@gmail.com/T/#t  
> > 
> > As those are dependencies, but WIP, this gets a bit tricky:
> > - cpufreq is pretty far, but comes through a different tree. I suggest
> >   you drop the cpu-opp.dtsi include, to not complicate things. We can
> >   add this later as a fix, once this OPP file has reached the master
> >   tree.
> > - The NMI binding and DT node seem important, but have not been merged
> >   yet. I suggest to mention them as a requirement. The patches (binding
> >   plus H616 .dtsi change) should go through the sunxi tree as well, so
> >   the maintainers can order this appropriately when merging.
> > - The GPADC (in the later patch) is similar, but it is not as critical
> >   as the NMI. Not sure how the maintainers want to handle this, but we
> >   might add those bits as an (optional) patch on top, so this can be
> >   handled more independently from the GPADC series.
> >   
> > > 
> > > Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> > > ---
> > >  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 375 ++++++++++++++++++
> > >  1 file changed, 375 insertions(+)
> > >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> > > 
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> > > new file mode 100644
> > > index 000000000000..d8081273677d
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> > > @@ -0,0 +1,375 @@
> > > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +/*
> > > + * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "sun50i-h616.dtsi"
> > > +#include "sun50i-h616-cpu-opp.dtsi"  
> > 
> > As mentioned, please drop this line for now.
> >   
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/input/linux-event-codes.h>
> > > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +#include <dt-bindings/leds/common.h>
> > > +
> > > +/ {
> > > +	model = "Anbernic RG35XX 2024";
> > > +	chassis-type = "handset";  
> 
> I've done my extensive testing on the 35XXH only so far, but based
> on past experience I strongly doubt Anbernic did much different
> between boards. Superficially the main differences besides form
> factor are gpadc joysticks and an extra USB host port on the 35XXH,
> so anything I have to say about USB look at with skepticsm.
> 
> > > +	compatible = "anbernic,rg35xx-2024", "allwinner,sun50i-h700";
> > > +
> > > +	aliases {
> > > +		serial0 = &uart0;
> > > +	};
> > > +
> > > +	chosen {
> > > +		stdout-path = "serial0:115200n8";
> > > +	};
> > > +
> > > +	leds {
> > > +		compatible = "gpio-leds";
> > > +
> > > +		led-0 {
> > > +			function = LED_FUNCTION_POWER;
> > > +			color = <LED_COLOR_ID_GREEN>;
> > > +			gpios = <&pio 8 12 GPIO_ACTIVE_HIGH>; /* PI12 */
> > > +			default-state = "on";
> > > +		};  
> 
> FYI - PI12 can run as a PWM so when we get PWM output I intend to
> request this be run as a PWM led (so we can adjust the brightness).
> I'll handle that when it's ready though so don't worry for now.

Well, this has the bitter taste of requiring the PWM driver, so it wouldn't
work with current kernels. As the DTs are independent from the kernel,
this is some kind of regression: with the current DT it works on every
kernel, but using an updated DT (using PWM) the LED would stay off.
So it needs to be seen whether it's worth it. Maybe it works when U-Boot
powers this on, and Linux wouldn't touch it, when there is no PWM support.
Anyway that's indeed something to consider later, just wanted to mention
it.

> > > +	};
> > > +
> > > +	gpio-keys {
> > > +	   compatible = "gpio-keys";
> > > +
> > > +	   button-up {  
> > 
> > indentation
> >   
> > > +		   label = "D-Pad Up";
> > > +		   gpios = <&pio 0 6 GPIO_ACTIVE_LOW>; /* PA6 */
> > > +		   linux,input-type = <EV_KEY>;
> > > +		   linux,code = <BTN_DPAD_UP>;
> > > +		};
> > > +
> > > +		button-down {
> > > +			label = "D-Pad Down";
> > > +			gpios = <&pio 4 0 GPIO_ACTIVE_LOW>; /* PE0 */
> > > +			linux,input-type = <EV_KEY>;
> > > +			linux,code = <BTN_DPAD_DOWN>;
> > > +		};
> > > +
> > > +		button-left {
> > > +			label = "D-Pad left";
> > > +			gpios = <&pio 0 8 GPIO_ACTIVE_LOW>; /* PA8 */
> > > +			linux,input-type = <EV_KEY>;
> > > +			linux,code = <BTN_DPAD_LEFT>;
> > > +		};
> > > +
> > > +		button-right {
> > > +			label = "D-Pad Right";
> > > +			gpios = <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
> > > +			linux,input-type = <EV_KEY>;
> > > +			linux,code = <BTN_DPAD_RIGHT>;
> > > +		};
> > > +
> > > +		button-a {
> > > +			label = "Action-Pad A";
> > > +			gpios = <&pio 0 0 GPIO_ACTIVE_LOW>; /* PA0 */
> > > +			linux,input-type = <EV_KEY>;
> > > +			linux,code = <BTN_EAST>;
> > > +		};
> > > +
> > > +		button-b {
> > > +			label = "Action-Pad B";
> > > +			gpios = <&pio 0 1 GPIO_ACTIVE_LOW>; /* PA1 */
> > > +			linux,input-type = <EV_KEY>;
> > > +			linux,code = <BTN_SOUTH>;
> > > +		};
> > > +
> > > +		button-x {
> > > +			label = "Action-Pad X";
> > > +			gpios = <&pio 0 3 GPIO_ACTIVE_LOW>; /* PA3 */
> > > +			linux,input-type = <EV_KEY>;
> > > +			linux,code = <BTN_NORTH>;
> > > +		};
> > > +
> > > +		button-y {
> > > +			label = "Action Pad Y";
> > > +			gpios = <&pio 0 2 GPIO_ACTIVE_LOW>; /* PA2 */
> > > +			linux,input-type = <EV_KEY>;
> > > +			linux,code = <BTN_WEST>;
> > > +		};
> > > +
> > > +		button-start {
> > > +			label = "Key Start";
> > > +			gpios = <&pio 0 4 GPIO_ACTIVE_LOW>; /* PA4 */
> > > +			linux,input-type = <EV_KEY>;
> > > +			linux,code = <BTN_START>;
> > > +		};
> > > +
> > > +		button-select {
> > > +			label = "Key Select";
> > > +			gpios = <&pio 0 5 GPIO_ACTIVE_LOW>; /* PA5 */
> > > +			linux,input-type = <EV_KEY>;
> > > +			linux,code = <BTN_SELECT>;
> > > +		};
> > > +
> > > +		button-l1 {
> > > +			label = "Key L1";
> > > +			gpios = <&pio 0 10 GPIO_ACTIVE_LOW>; /* PA10 */
> > > +			linux,input-type = <EV_KEY>;
> > > +			linux,code = <BTN_TL>;
> > > +		};
> > > +
> > > +		button-l2 {
> > > +			label = "Key L2";
> > > +			gpios = <&pio 0 11 GPIO_ACTIVE_LOW>; /* PA11 */
> > > +			linux,input-type = <EV_KEY>;
> > > +			linux,code = <BTN_TL2>;
> > > +		};
> > > +
> > > +		button-r1 {
> > > +			label = "Key R1";
> > > +			gpios = <&pio 0 12 GPIO_ACTIVE_LOW>; /* PA12 */
> > > +			linux,input-type = <EV_KEY>;
> > > +			linux,code = <BTN_TR>;
> > > +		};
> > > +
> > > +		button-r2 {
> > > +			label = "Key R2";
> > > +			gpios = <&pio 0 7 GPIO_ACTIVE_LOW>; /* PA7 */
> > > +			linux,input-type = <EV_KEY>;
> > > +			linux,code = <BTN_TR2>;
> > > +		};
> > > +
> > > +		button-menu {
> > > +			label = "Key Menu";
> > > +			gpios = <&pio 4 3 GPIO_ACTIVE_LOW>; /* PE3 */
> > > +			linux,input-type = <EV_KEY>;
> > > +			linux,code = <BTN_MODE>;
> > > +		};
> > > +  
> 
> Your preference, but in the past I've had the volume up/down done as a
> seperate node so we can enable key repeat. That way holding volume up
> or down has the effect of continuously raising or lowering the volume.
> It's desirable for volume buttons, but not for gamepads, hence the
> separation.  Also I usually alphabetize node names, I don't remember
> if I'm just that anal or if I was told to at one point though.

Typically some kind of ordering is preferred, to avoid confusion as to
where put new nodes. And if in doubt, this is indeed alphabetical.

> 
> > > +		button-vol-up {
> > > +			label = "Key Volume Up";
> > > +			gpios = <&pio 4 1 GPIO_ACTIVE_LOW>; /* PE1 */
> > > +			linux,input-type = <EV_KEY>;
> > > +			linux,code = <KEY_VOLUMEUP>;
> > > +		};
> > > +
> > > +		button-vol-down {
> > > +			label = "Key Volume Down";
> > > +			gpios = <&pio 4 2 GPIO_ACTIVE_LOW>; /* PE2 */
> > > +			linux,input-type = <EV_KEY>;
> > > +			linux,code = <KEY_VOLUMEDOWN>;
> > > +		};
> > > +	};
> > > +
> > > +	reg_vcc_sd2: regulator-vcc3v3 {
> > > +		compatible = "regulator-fixed";
> > > +		gpio = <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
> > > +		regulator-name = "vcc_3v3_sd2";
> > > +		regulator-min-microvolt = <3300000>;
> > > +		regulator-max-microvolt = <3300000>;
> > > +	};
> > > +
> > > +	reg_vcc_usb: regulator-vcc-5v0-usb {
> > > +		compatible = "regulator-fixed";
> > > +		enable-active-high;
> > > +		gpio = <&pio 8 7 GPIO_ACTIVE_HIGH>; /* PI7 */
> > > +		regulator-name = "vcc_5v0_usb";
> > > +		regulator-min-microvolt = <5000000>;
> > > +		regulator-max-microvolt = <5000000>;
> > > +		vin-supply = <&vcc_3v3_usb>;  
> > 
> > This looks wrong, see below.
> >   
> > > +	};
> > > +
> > > +	vcc_3v3_usb: vcc-3v3-usb {
> > > +		compatible = "regulator-fixed";
> > > +		enable-active-high;
> > > +		gpio = <&pio 4 5 GPIO_ACTIVE_HIGH>; /* PE5 */
> > > +		regulator-always-on;
> > > +		regulator-boot-on;  
> > 
> > There seems to be something off with this one. First, it seems odd that
> > an always-on regulator is GPIO controlled, as this surely means it's
> > not enabled at reset time (because the GPIO is initially HighZ and thus
> > not enabled). So who turns this on? Most likely it's the kernel? What
> > happens if we turn this off (or leave it off)?
> > 
> > Secondly, why is this 3.3V (both by name and voltage), but then
> > supplies the 5.0V USB VBUS?
> > And given that this is chained with reg_vcc_usb above, are those really
> > two regulators, controlled by two GPIOs?
> >   
> 
> It's described wrong, but based on the behaviour I've seen. The specific
> seems to be 2 GPIO controlled regulators; one of them enables the logic
> voltage for the USB (the 3.3v regulator)

As mentioned in the other mail, there are VCC-USB and VCC-USB2 pins on the
SoC, requiring 3.3V for the internal USB logic/PHY.
But it would be odd to see that on a GPIO controlled regulator, since IIUC
this is essential for USB operation, so would affect the FEL mode as well,
which is driven early by the BROM, knowing nothing about the board
specifics.
So I would expect any AXP rails (except those being on at reset) or GPIO
regulators only being responsible for *host mode* related power - FEL mode
does not need that, it's just peripheral mode. But since the AXP has reset
defaults, it might be an AXP rails that drives VCC-USB.

> and the other enables the VBUS
> for the USB (the 5v regulator). If you only enable the 5v regulator the
> bus otherwise lays dormant. If you only enable the 3v3 regulator the
> USB bus powers on and intermittently enumerates devices at 3.3v.
> Further enabling the 5v regulator drives the USB at 4.6v (I'm guessing
> something is still wrong, we have more to poke at).

As mentioned, 4.6V would make sense if that's the pass-through from the
input power. It's probably already not 5.0V anymore when it comes in, and
might drop further under load.

> To my knowledge this only applies for the USB host port which this
> device lacks.
> 
> 
> > > +		regulator-name = "vcc_3v3_usb";
> > > +		regulator-max-microvolt = <3300000>;
> > > +		regulator-min-microvolt = <3300000>;
> > > +	};
> > > +
> > > +	reg_vcc5v: regulator-vcc5v { /* USB-C power input */
> > > +		compatible = "regulator-fixed";
> > > +		regulator-name = "vcc-5v";
> > > +		regulator-min-microvolt = <5000000>;
> > > +		regulator-max-microvolt = <5000000>;
> > > +	};
> > > +
> > > +	reg_pll_dcx0: regulator-pll-dcx0 {  
> > 
> > It's DCXO (letter "oh", not zero): digitally controlled/compensated
> > crystal *o*scillator.
> >   
> > > +		compatible = "regulator-fixed";
> > > +		regulator-always-on;
> > > +		regulator-name = "vcc-pll";
> > > +		regulator-min-microvolt = <1800000>;
> > > +		regulator-max-microvolt = <1800000>;
> > > +	};  
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
> > 
> > See below for more on this.  
> 
> After much digging I'm certain the rails powering the wifi are
> reg_cldo4 for the 3.3v and reg_aldo4 for the IO bits at 1.8v.
> The curious thing about reg_cldo4 is it appears to feed into
> another regulator that regulates at precisely 3.3v. If I under or
> overvolt cldo4 I still read exactly 3.3v at the wifi module, but as
> soon as I turn off reg_cldo4 the wifi reads 0v. So while I can't
> directly control the power of the wifi's 3.3v rail, as long as I
> get cldo4 close to 3.3v it powers correctly.

That's interesting, but I highly doubt that Anbernic would slap an
expensive buck/boost converter to something uncritical as the WiFi supply.
So there might be something different at play here? Are you able to get
any hints from looking at the PCB and the traces? Those regulators are
typically easy to spot.

> > > +};
> > > +
> > > +&cpu0 {
> > > +	cpu-supply = <&reg_dcdc1>;
> > > +};
> > > +
> > > +&mmc0 {
> > > +	vmmc-supply = <&reg_vcc_sd2>;  
> > 
> > I don't think this GPIO controlled regulator provides the supply voltage
> > for the first SD card, since it would be disabled on reset, and the
> > BROM couldn't boot from the SD card. So it must be some other 3.3V
> > source, either a discrete regulator (fixed regulator), or some
> > default-on 3.3V AXP rail.  
> 
> Both the vcc and the logic for the mmc0 appear to be handled by the
> cldo3 regulator at 3.3v.

That makes sense, and would mean that CLDO3 is enabled on AXP reset and
set to 3.3V. The AXP datasheet is not helpful, and typically just refers
to "EFUSE" when it comes to the reset values.

Would you be able to poke the AXP early? Maybe drop the AXP driver from
U-Boot proper, and read the registers from U-Boot via the i2c command? To
see what the default values and enabled state is for all rails?

> > > +	disable-wp;
> > > +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
> > > +	bus-width = <4>;
> > > +	status = "okay";
> > > +};
> > > +
> > > +&mmc2 {
> > > +	vmmc-supply = <&reg_vcc_sd2>;
> > > +	vqmmc-supply = <&reg_aldo1>;
> > > +	cd-gpios = <&pio 4 22 GPIO_ACTIVE_LOW>; /* PE22 */
> > > +	bus-width = <4>;
> > > +	status = "okay";
> > > +};  
> > 
> > This one seems more plausible. To confirm this, you could not use
> > reg_vcc_sd2 anywhere, and use some other 3.3V supply for vmmc, which
> > should break operation on the second SD card. Then just swap
> > reg_vcc_sd2 back in, and if it starts working again, we have confirmation.
> >   
> 
> cldo3 and the gpio controlled regulator are the 2 regulators used for
> mmc2 on my board. My notes have the vmmc supply as cldo3 and the
> vqmmc supply as the GPIO controlled one, but that feels wrong. That
> said the IO pins measured 1.1v when the GPIO regulator was off and
> 3.3v when the GPIO regulator was on. The 1.1v didn't seem to come
> from the PMIC, as the only rail I had running 1.1v at the time was
> the RAM and I tested and confirmed that wasn't it.

The easiest solution would just wire the PortC pins directly to the SD
card socket, and whatever VCC-PC is, would be used.
There is the possibility to have switchable level shifters between the SoC
and the SD card slot, to be able to switch between 1.8V and 3.3V, for
UHS-1 operation. But I doubt that Anbernic would go this way, since this
sounds more expensive, for little benefit.

> > > +
> > > +&ohci0 {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&ehci0 {
> > > +	status = "okay";
> > > +};
> > > +  
> 
> I haven't confirmed on my board we need ohci0 and ehci0 for the OTG
> port.

So we don't need them for pure peripheral mode, but for host mode they are
needed. Technically the MUSB controller also supports host mode, but IIUC
Allwinner doesn't use this setup, and recommends the proper HCIs for host
mode.

> > > +&r_rsb {
> > > +   status = "okay";
> > > +  
> 
> Any advantage to doing this on the rsb over i2c? That's how I have mine
> wired. Both are fine with me, I just didn't know what was better.

In general we prefer RSB. If nothing else: it's faster (3MHz instead of
100/400 KHz), which gives a slight advantage for fast DVFS switching. Also
it's easier to program - each register write is a single fire-and-forget
setup in the RSB registers, as opposed to much more driver hand-holding
for I2C. That doesn't really matter for Linux (which supports both), but
helps TF-A, for instance.

> > > +   axp717: pmic@3a3 {
> > > +		compatible = "x-powers,axp717";
> > > +		reg = <0x3a3>;
> > > +		interrupt-controller;
> > > +		#interrupt-cells = <1>;
> > > +		interrupt-parent = <&nmi_intc>;
> > > +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> > > +		x-powers,drive-vbus-en;  
> > 
> > Remove this last line, the AXP717 binding does not support this, and the
> > Linux driver doesn't implement this, as the AXP717 does not seem to
> > have this functionality.
> >   
> > > +
> > > +		vin1-supply = <&reg_vcc5v>;
> > > +		vin2-supply = <&reg_vcc5v>;
> > > +		vin3-supply = <&reg_vcc5v>;
> > > +		vin4-supply = <&reg_vcc5v>;  
> 
> FYI - I never actually confirmed the vin supply of the PMIC, I just put
> these in here to shut up some errors or warnings. If these are based
> on something I did it couldn't hurt to recheck.

I would assume the buck converters use the input power, since this is the
least current limited of all available, and the outputs promise quite some
current capability.
For the LDOs it might make sense to use a lower, closer matching input
voltage, so it only has to drop from say 3.3V to 1.8V, but for the DCDCs
using reg_vcc5v would make sense.

Though on second thought I wonder how this works when the device runs on
battery. Need to check the manual on how it handles the battery switch,
but I think for now it's safe to go with that above.
 
> > > +
> > > +		regulators {
> > > +			reg_dcdc1: dcdc1 {
> > > +				regulator-always-on;
> > > +				regulator-boot-on;
> > > +				regulator-min-microvolt = <810000>;
> > > +				regulator-max-microvolt = <1100000>;  
> 
> The CPU opp table in the BSP device tree had this between 900000 and
> 1120000. Though like most things, take anything in the BSP device
> tree with a grain of salt (lime and tequila help too).

You need lots of booze for anything BSP related ;-)

But indeed the lowest OPP voltage is 900mV, so it would make sense to go
with that.

> > > +				regulator-name = "vdd-cpu";
> > > +			};
> > > +  
> 
> I'm just speculating, but I strongly *guess* that this dcdc2 is used
> for the GPU. SoC datasheet says max should be 900000 for the GPU, but
> I don't have an opp table to go off of sadly.

It's probably used for both: on other H616 boards we call this regulator
"vdd-gpu-sys". The datasheet describes both voltages with the same
constraints, and since you need quite some oomph for both, and it's an odd
voltage, it makes sense to use one DCDC for this.

> > > +			reg_dcdc2: dcdc2 {
> > > +				regulator-always-on;
> > > +				regulator-min-microvolt = <940000>;
> > > +				regulator-max-microvolt = <940000>;
> > > +				regulator-name = "vdd-sys";
> > > +			};
> > > +
> > > +			reg_dcdc3: dcdc3 {
> > > +				regulator-always-on;
> > > +				regulator-boot-on;
> > > +				regulator-min-microvolt = <1100000>;
> > > +				regulator-max-microvolt = <1100000>;
> > > +				regulator-name = "vdd-dram";
> > > +			};
> > > +
> > > +			reg_aldo1: aldo1 {
> > > +				regulator-min-microvolt = <1800000>;
> > > +				regulator-max-microvolt = <3300000>;
> > > +				regulator-name = "vcc-sd2";
> > > +			};
> > > +
> > > +			reg_aldo2: aldo2 {
> > > +				/* unused */
> > > +			};
> > > +
> > > +			reg_aldo3: aldo3 {
> > > +				regulator-always-on;
> > > +				regulator-boot-on;  
> > 
> > Please remove this last line, it doesn't make sense in this context. Cf.
> > Documentation//devicetree/bindings/regulator/regulator.yaml.
> > I think the same applies to the other uses throughout this file.
> >   
> > > +				regulator-min-microvolt = <500000>;
> > > +				regulator-max-microvolt = <3500000>;  
> > 
> > This is not right. What is the voltage of this rail? The kernel should
> > tell you what was set in the register, through regulator_summary, or you
> > check what's the voltage on a BSP system.
> >   
> > > +				regulator-name = "axp717-aldo3";  
> > 
> > If the system dies when you remove always-on, you might have found some
> > essential supply. Candidates for consumers are listed in the
> > H616 or T5 series datasheet. Matching the voltage might give you an
> > idea. Then use this consumer as the name.
> >   
> > > +			};
> > > +
> > > +			reg_aldo4: aldo4 {  
> > 
> > Same for this one: Please remove regulator-boot-on, fix the voltage,
> > and provide some rationale why this needs to be on.  
> 
> aldo4 is a critical regulator that should run at 1.8v based on my
> testing.

Thanks, that makes sense, since 1.8V is needed quite a lot.

> > > +				regulator-always-on;
> > > +				regulator-boot-on;
> > > +				regulator-min-microvolt = <500000>;
> > > +				regulator-max-microvolt = <3500000>;
> > > +				regulator-name = "axp717-aldo4";
> > > +			};
> > > +
> > > +			reg_bldo1: bldo1 {
> > > +				/* unused */
> > > +			};
> > > +
> > > +			reg_bldo2: bldo2 {
> > > +				regulator-always-on;
> > > +				regulator-min-microvolt = <1800000>;
> > > +				regulator-max-microvolt = <1800000>;
> > > +				regulator-name = "vcc-pll";
> > > +			};  
> > 
> > This one is a good example: fixed voltage, no boot-on, and regulator
> > name provides rationale why it must be always-on. The others should
> > look similar.
> >   
> > > +
> > > +			reg_bldo3: bldo3 {
> > > +				/* unused */
> > > +			};
> > > +
> > > +			reg_bldo4: bldo4 {
> > > +				/* unused */
> > > +			};
> > > +
> > > +			reg_cldo1: cldo1 {
> > > +				/* unused */
> > > +			};
> > > +
> > > +			reg_cldo2: cldo2 {
> > > +				/* unused */
> > > +			};
> > > +
> > > +			reg_cldo3: cldo3 {
> > > +				regulator-always-on;
> > > +				regulator-boot-on;
> > > +				regulator-min-microvolt = <500000>;
> > > +				regulator-max-microvolt = <3500000>;
> > > +				regulator-name = "axp717-cldo3";  
> > 
> > Same here as ALDO3/4: what voltage is it, and what does it probably
> > supply?  
> 
> cldo3 is a critical regulator run at 3.3v based on my testing. It
> supplies power to the majority of the system's pins.
> 
> >   
> > > +			};
> > > +  
> 
> cldo4 feeds the wifi, but through another fixed voltage regulator that
> seems to pull up or down to 3.3v if we happen to raise or lower cldo4
> a bit above or below 3.3v.
> 
> > > +			reg_cldo4: cldo4 {
> > > +				regulator-min-microvolt = <3300000>;
> > > +				regulator-max-microvolt = <3300000>;
> > > +				regulator-name = "vcc-wifi";
> > > +			};
> > > +
> > > +			reg_boost: boost {
> > > +				regulator-min-microvolt = <5126000>;
> > > +				regulator-max-microvolt = <5126000>;  
> > 
> > It might be better to use a range, say 5.0V till 5.2V. The
> > kernel will then just continue using the default, which seems to be this
> > 5.126V (5440mV + 9 * 64mV).
> >   
> > > +				regulator-name = "boost";
> > > +			};
> > > +
> > > +			reg_cpusldo: cpusldo {
> > > +				/* unused */  
> > 
> > Is that so? I thought you mentioned on IRC this is required as well?
> >   
> 
> I still haven't completely finished the regulator analysis, but I
> actually think it is the case that this one isn't used.

Right, fair enough: the H616/H700 does not have a management processor, so
the SoC probably does not need some kind of standby voltage.

> 
> > > +			};
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +&uart0 {
> > > +	pinctrl-names = "default";
> > > +	pinctrl-0 = <&uart0_ph_pins>;
> > > +	status = "okay";
> > > +};
> > > +
> > > +&pio {
> > > +	vcc-pg-supply = <&reg_pll_dcx0>;  
> > 
> > As mentioned above, it seems unlikely to be a fixed regulator. If in
> > doubt, leave them out, they are not essential for the operation.
> >   
> 
> On my 35XXH I can confirm PG is supplied by reg_aldo4 at 1.8v and the
> rest are supplied by reg_cldo3 at 3.3v.
> 
>         vcc-pa-supply = <&reg_cldo3>;
>         vcc-pc-supply = <&reg_cldo3>;
>         vcc-pe-supply = <&reg_cldo3>;
>         vcc-pf-supply = <&reg_cldo3>;
>         vcc-pg-supply = <&reg_aldo4>;
>         vcc-ph-supply = <&reg_cldo3>;
>         vcc-pi-supply = <&reg_cldo3>;
> 
> This is what my 35XXH looks like after manually raising or lowering the
> PMIC voltage values a tad, observing the GPIO out voltages, adjusting
> again, measuring the voltages again, etc etc. By checking at least 1
> pin from each bank and confirming voltage changes via PMIC changes
> I get this mapping.

Ah, many thanks for doing this - and sounds also fun, actually ;-)

> > > +};
> > > +
> > > +/* the AXP717 has USB type-C role switch functionality, to be implemented */  
> > 
> > Replace "to be implemented" with "not yet described by the binding".
> > This is DT land, so we don't care about implementations or the Linux
> > kernel, it's all about DTs and DT bindings.
> >   
> > > +&usbotg {
> > > +	dr_mode = "host";   /* USB type-C receptable */  
> > 
> > So does this really work? It seems wrong to make this unconditional,
> > given this is the only way to charge the device. When power is supplied
> > through the USB-C port, surely driving VBUS from the board sounds
> > wrong. Unless you have a killer feature for a host port, I think
> > without working role switching, "peripheral" would be the safer
> > choice.  
> 
> Again making me wish I'd have used a different device for my mainline
> efforts, but on the 35XXH the OTG port I know does work for me as a
> peripherial port. As for the Type-C stuff, I don't expect any future
> AXP717 modifications to matter for this device, as manually fiddling
> the USB-C bits in the PMIC didn't register my otg port as anything
> other than a standard USB port (none of the USB-C specific
> registers seemed to register anything).

Mmmh, interesting, though this might mean we don't understand this very
well yet. Because it looks like easy on the board side: just connect the
CC pins on the AXP to the CC pins on the connector, and the rest falls in
place?

Cheers,
Andre


> > > +	status = "okay";
> > > +};
> > > +
> > > +&usbphy {
> > > +	usb0_vbus-supply = <&reg_vcc_usb>;  
> > 
> > When you stick to "peripheral" above, you should drop this line for
> > now, especially since this regulator chain looks quite suspicious still.
> >   
> 
> Concur, especially since now when I look at my 35XX+ 2024 model I only
> see an OTG port and not a host port.
> 
> > Cheers,
> > Andre
> >   
> > > +	status = "okay";
> > > +};  
> >   
> 
> Thank you for all your hard work on this series. I'm going to continue
> to try and identify the remaining regulators on my board and what they
> do/how they're used. I expect at least one or two of the ones we've
> flagged for removal will need to be added back once we get the panel
> code working.
> 
> Chris

