Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D5114D2A6
	for <linux-sunxi@lists.linux.dev>; Thu, 25 Apr 2024 16:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714064056; cv=none; b=VR+Nel2g/Td7L4CQjcrAk57eVb5rPQiXpVphZVvJ6/Tv1IA8beKnZdH8bkd4Ckag8ynq8nPfHfoOsajnGXvwMGl2UlouiWMVQ1HPdgR4cPB/zsu5iaO3mCfNCMQoiqX5ipOnxL1aL3j2OABn7344XqVG7XLlmPpOGjgTrMzMz0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714064056; c=relaxed/simple;
	bh=VnieP3VoUl+idIKFDryRF9BH4bC7RDVm53EVEVPTspY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DGAACuMHO8uww5fGMxU0oNqCeYOY0zyE5/zsJNqyn79cd4KNWUzhpwrlYtIJqGmAgLkHkY1IGJ6xIme7Pe15vdLDY2yARDu/tz4CFA3kbYiPpWTFFXJ1qyGNxf3LNkn84biENbL9NCqQFCuJTvGSoJUgu8SizVYW3OXnQLlpBSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B6811007;
	Thu, 25 Apr 2024 09:54:40 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6FB53F793;
	Thu, 25 Apr 2024 09:54:10 -0700 (PDT)
Date: Thu, 25 Apr 2024 17:54:07 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: Ryan Walklin <ryan@testtoast.com>, Chen-Yu Tsai <wens@csie.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 2/4] arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
Message-ID: <20240425175407.6e8dfec7@donnerap.manchester.arm.com>
In-Reply-To: <DM4PR05MB922945061E63C5B1390AB3D2A5172@DM4PR05MB9229.namprd05.prod.outlook.com>
References: <20240424110947.9057-1-ryan@testtoast.com>
	<20240424110947.9057-3-ryan@testtoast.com>
	<20240425012559.44528ee9@minigeek.lan>
	<DM4PR05MB9229EE6BE60831DFD6C37A62A5172@DM4PR05MB9229.namprd05.prod.outlook.com>
	<20240425110846.00a183a1@donnerap.manchester.arm.com>
	<DM4PR05MB922945061E63C5B1390AB3D2A5172@DM4PR05MB9229.namprd05.prod.outlook.com>
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

On Thu, 25 Apr 2024 10:35:49 -0500
Chris Morgan <macromorgan@hotmail.com> wrote:

> On Thu, Apr 25, 2024 at 11:08:46AM +0100, Andre Przywara wrote:
> > On Wed, 24 Apr 2024 20:58:33 -0500
> > Chris Morgan <macromorgan@hotmail.com> wrote:
> > 
> > Hi,
> >   
> > > On Thu, Apr 25, 2024 at 01:25:59AM +0100, Andre Przywara wrote:  
> > > > On Wed, 24 Apr 2024 23:09:45 +1200
> > > > Ryan Walklin <ryan@testtoast.com> wrote:
> > > > 
> > > > Hi Ryan (and Chris),
> > > > 
> > > > many thanks for the changes, that looks really close now. Only a few
> > > > smaller comments this time.
> > > >     
> > > > > The base model RG35XX (2024) is a handheld gaming device based on an Allwinner H700 chip.
> > > > > 
> > > > > The H700 is a H616 variant (4x ARM Cortex-A53 cores @ 1.5Ghz with Mali G31 GPU) which exposes RGB LCD and NMI pins.
> > > > > 
> > > > > Device features:
> > > > > - Allwinner H700 @ 1.5GHz
> > > > > - 1GB LPDDR4 DRAM
> > > > > - X-Powers AXP717 PMIC
> > > > > - 3.5" 640x480 RGB LCD
> > > > > - Two microSD slots
> > > > > - Mini-HDMI out
> > > > > - GPIO keypad
> > > > > - 3.5mm headphone jack
> > > > > - USB-C charging port
> > > > > 
> > > > > Enabled in this DTS:
> > > > > - AXP717 PMIC with regulators (interrupt controller TBC/TBD)
> > > > > - Power LED (charge LED on device controlled directly by PMIC)
> > > > > - Serial UART (accessible from PIN headers on the board)
> > > > > - MMC slots
> > > > > 
> > > > > Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> > > > > ---
> > > > > Changelog v1..v2:
> > > > > - Update copyright
> > > > > - Spaces -> Tabs
> > > > > - Add cpufreq support
> > > > > - Remove MMC aliases
> > > > > - Fix GPIO button and regulator node names
> > > > > - Note unused AXP717 regulators
> > > > > - Update regulators for SD slots
> > > > > - Remove unused I2C3 device
> > > > > - Update NMI interrupt controller for AXP717, requires H616 support patch in dt-next [1]
> > > > > - Add chassis-type
> > > > > - Address USB EHCI/OHCI0 correctly and add usb vbus supply
> > > > > - Add PIO vcc-pg-supply
> > > > > - Correct boost regulator voltage and name
> > > > > 
> > > > > Changelog v2..v3:
> > > > > - Remove cpufreq support (patch still pending for 6.10, will followup once opp table merged)
> > > > > - Add dtb to Makefile
> > > > > - Remove unnecessary duplicated PLL regulator
> > > > > - Remove unimplemented/not-present drive-vbus feature from AXP717
> > > > > - Rename CLDO3 to "vcc-io", inferring function from board testing by Chris Morgan
> > > > > - Correct MMC1 vmmc-supply to CLDO3 and MMC2 to CLDO4
> > > > > - Reduce DCDC1 "vdd-cpu" supply voltage range to 0.9v-1.1v to match lowest OPP voltage
> > > > > - Identify DCDC2 as GPU supply - rename to "vdd-gpu-sys", remove always-on and used fixed 0.94v voltage
> > > > > - Fix indentation
> > > > > - Correct boot/always-on states and voltages for various regulators from vendor BSP
> > > > > - Change USB-OTG mode to "peripheral" and correct comment
> > > > > - Correct and add remaining PIO supplies
> > > > > - Move volume key GPIOs to separate block to allow key repeat
> > > > > - Alphabetically orrder gamepad GPIOs
> > > > > - Move changelog and links below fold-line
> > > > > - Remove USB 3.3v VCC-USB and VCC-SD2 regulators pending further hardware investigation (to be submitted as subsequent patch)
> > > > > - Constrain boost regulator voltage to 5.0v to 5.2v to capture default voltage of 5.126v
> > > > > 
> > > > > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=dt/next&id=d47bca77bf3ab475c33b3929c33c80aeb49df35c
> > > > > 
> > > > > ---
> > > > >  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
> > > > >  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 347 ++++++++++++++++++
> > > > >  2 files changed, 348 insertions(+)
> > > > >  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> > > > > index 21149b346a60..6f997157968e 100644
> > > > > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > > > > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > > > > @@ -47,3 +47,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-longanpi-3h.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero2w.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
> > > > >  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
> > > > > +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-2024.dtb
> > > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> > > > > new file mode 100644
> > > > > index 000000000000..3b53485019f1
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> > > > > @@ -0,0 +1,347 @@
> > > > > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +/*
> > > > > + * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
> > > > > + */
> > > > > +
> > > > > +/dts-v1/;
> > > > > +
> > > > > +#include "sun50i-h616.dtsi"
> > > > > +
> > > > > +#include <dt-bindings/gpio/gpio.h>
> > > > > +#include <dt-bindings/input/linux-event-codes.h>
> > > > > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > > +#include <dt-bindings/leds/common.h>
> > > > > +
> > > > > +/ {
> > > > > +	model = "Anbernic RG35XX 2024";
> > > > > +	chassis-type = "handset";
> > > > > +	compatible = "anbernic,rg35xx-2024", "allwinner,sun50i-h700";
> > > > > +
> > > > > +	aliases {
> > > > > +		serial0 = &uart0;
> > > > > +	};
> > > > > +
> > > > > +	chosen {
> > > > > +		stdout-path = "serial0:115200n8";
> > > > > +	};
> > > > > +
> > > > > +	leds {
> > > > > +		compatible = "gpio-leds";
> > > > > +
> > > > > +		led-0 {
> > > > > +			function = LED_FUNCTION_POWER;
> > > > > +			color = <LED_COLOR_ID_GREEN>;
> > > > > +			gpios = <&pio 8 12 GPIO_ACTIVE_HIGH>; /* PI12 */
> > > > > +			default-state = "on";
> > > > > +		};
> > > > > +	};
> > > > > +
> > > > > +	gpio_keys_gamepad: gpio-keys-gamepad {
> > > > > +		compatible = "gpio-keys";
> > > > > +
> > > > > +		button-a {
> > > > > +			label = "Action-Pad A";
> > > > > +			gpios = <&pio 0 0 GPIO_ACTIVE_LOW>; /* PA0 */
> > > > > +			linux,input-type = <EV_KEY>;
> > > > > +			linux,code = <BTN_EAST>;
> > > > > +		};
> > > > > +
> > > > > +		button-b {
> > > > > +			label = "Action-Pad B";
> > > > > +			gpios = <&pio 0 1 GPIO_ACTIVE_LOW>; /* PA1 */
> > > > > +			linux,input-type = <EV_KEY>;
> > > > > +			linux,code = <BTN_SOUTH>;
> > > > > +		};
> > > > > +
> > > > > +		button-down {
> > > > > +			label = "D-Pad Down";
> > > > > +			gpios = <&pio 4 0 GPIO_ACTIVE_LOW>; /* PE0 */
> > > > > +			linux,input-type = <EV_KEY>;
> > > > > +			linux,code = <BTN_DPAD_DOWN>;
> > > > > +		};
> > > > > +
> > > > > +		button-l1 {
> > > > > +			label = "Key L1";
> > > > > +			gpios = <&pio 0 10 GPIO_ACTIVE_LOW>; /* PA10 */
> > > > > +			linux,input-type = <EV_KEY>;
> > > > > +			linux,code = <BTN_TL>;
> > > > > +		};
> > > > > +
> > > > > +		button-l2 {
> > > > > +			label = "Key L2";
> > > > > +			gpios = <&pio 0 11 GPIO_ACTIVE_LOW>; /* PA11 */
> > > > > +			linux,input-type = <EV_KEY>;
> > > > > +			linux,code = <BTN_TL2>;
> > > > > +		};
> > > > > +
> > > > > +		button-left {
> > > > > +			label = "D-Pad left";
> > > > > +			gpios = <&pio 0 8 GPIO_ACTIVE_LOW>; /* PA8 */
> > > > > +			linux,input-type = <EV_KEY>;
> > > > > +			linux,code = <BTN_DPAD_LEFT>;
> > > > > +		};
> > > > > +
> > > > > +		button-menu {
> > > > > +			label = "Key Menu";
> > > > > +			gpios = <&pio 4 3 GPIO_ACTIVE_LOW>; /* PE3 */
> > > > > +			linux,input-type = <EV_KEY>;
> > > > > +			linux,code = <BTN_MODE>;
> > > > > +		};
> > > > > +
> > > > > +		button-r1 {
> > > > > +			label = "Key R1";
> > > > > +			gpios = <&pio 0 12 GPIO_ACTIVE_LOW>; /* PA12 */
> > > > > +			linux,input-type = <EV_KEY>;
> > > > > +			linux,code = <BTN_TR>;
> > > > > +		};
> > > > > +
> > > > > +		button-r2 {
> > > > > +			label = "Key R2";
> > > > > +			gpios = <&pio 0 7 GPIO_ACTIVE_LOW>; /* PA7 */
> > > > > +			linux,input-type = <EV_KEY>;
> > > > > +			linux,code = <BTN_TR2>;
> > > > > +		};
> > > > > +
> > > > > +		button-right {
> > > > > +			label = "D-Pad Right";
> > > > > +			gpios = <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
> > > > > +			linux,input-type = <EV_KEY>;
> > > > > +			linux,code = <BTN_DPAD_RIGHT>;
> > > > > +		};
> > > > > +
> > > > > +		button-select {
> > > > > +			label = "Key Select";
> > > > > +			gpios = <&pio 0 5 GPIO_ACTIVE_LOW>; /* PA5 */
> > > > > +			linux,input-type = <EV_KEY>;
> > > > > +			linux,code = <BTN_SELECT>;
> > > > > +		};
> > > > > +		button-start {
> > > > > +			label = "Key Start";
> > > > > +			gpios = <&pio 0 4 GPIO_ACTIVE_LOW>; /* PA4 */
> > > > > +			linux,input-type = <EV_KEY>;
> > > > > +			linux,code = <BTN_START>;
> > > > > +		};
> > > > > +
> > > > > +		button-up {
> > > > > +			label = "D-Pad Up";
> > > > > +			gpios = <&pio 0 6 GPIO_ACTIVE_LOW>; /* PA6 */
> > > > > +			linux,input-type = <EV_KEY>;
> > > > > +			linux,code = <BTN_DPAD_UP>;
> > > > > +		};
> > > > > +
> > > > > +		button-x {
> > > > > +			label = "Action-Pad X";
> > > > > +			gpios = <&pio 0 3 GPIO_ACTIVE_LOW>; /* PA3 */
> > > > > +			linux,input-type = <EV_KEY>;
> > > > > +			linux,code = <BTN_NORTH>;
> > > > > +		};
> > > > > +
> > > > > +		button-y {
> > > > > +			label = "Action Pad Y";
> > > > > +			gpios = <&pio 0 2 GPIO_ACTIVE_LOW>; /* PA2 */
> > > > > +			linux,input-type = <EV_KEY>;
> > > > > +			linux,code = <BTN_WEST>;
> > > > > +		};
> > > > > +	};
> > > > > +
> > > > > +	gpio-keys-volume {
> > > > > +		compatible = "gpio-keys";
> > > > > +		autorepeat;
> > > > > +
> > > > > +		button-vol-up {
> > > > > +			label = "Key Volume Up";
> > > > > +			gpios = <&pio 4 1 GPIO_ACTIVE_LOW>; /* PE1 */
> > > > > +			linux,input-type = <EV_KEY>;
> > > > > +			linux,code = <KEY_VOLUMEUP>;
> > > > > +		};
> > > > > +
> > > > > +		button-vol-down {
> > > > > +			label = "Key Volume Down";
> > > > > +			gpios = <&pio 4 2 GPIO_ACTIVE_LOW>; /* PE2 */
> > > > > +			linux,input-type = <EV_KEY>;
> > > > > +			linux,code = <KEY_VOLUMEDOWN>;
> > > > > +		};
> > > > > +	};
> > > > > +
> > > > > +	reg_vcc5v: regulator-vcc5v { /* USB-C power input */
> > > > > +		compatible = "regulator-fixed";
> > > > > +		regulator-name = "vcc-5v";
> > > > > +		regulator-min-microvolt = <5000000>;
> > > > > +		regulator-max-microvolt = <5000000>;
> > > > > +	};
> > > > > +};
> > > > > +
> > > > > +&cpu0 {
> > > > > +	cpu-supply = <&reg_dcdc1>;
> > > > > +};
> > > > > +
> > > > > +&mmc0 {
> > > > > +	vmmc-supply = <&reg_cldo3>;
> > > > > +	disable-wp;
> > > > > +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
> > > > > +	bus-width = <4>;
> > > > > +	status = "okay";
> > > > > +};
> > > > > +
> > > > > +&mmc2 {
> > > > > +	vmmc-supply = <&reg_cldo4>;
> > > > > +	vqmmc-supply = <&reg_aldo1>;    
> > > > 
> > > > This is now fixed to 1.8V, which doesn't look right. Either it's not
> > > > the right regulator, or you should extend its range to cover 3.3V as
> > > > well.    
> > > 
> > > The IO is fixed at 1.8v (both the SDIO pins and the UART1 pins for
> > > bluetooth). If you raise this regulator too high the system becomes
> > > unstable.  
> > 
> > Are you sure? This is mmc2, so PortC, not the WiFi/BT on PortG.
> > And I was under the impression that the SD specification *requires*
> > starting negotiation at 3.3V I/O, and then only later on switching to 1.8V,
> > if both sides agree (UHS-1 capable controller and card).
> > I wonder if some non-UHS cards might not even work at 1.8V? I can imagine
> > that some cards don't really care, but it sounds being against the spec.
> > 
> > Also what's weird is that vqmmc is this aldo1 1.8V regulator, but the PortC
> > supply is cldo3, so 3.3V. So is there by any chance some kind of
> > (GPIO controlled?) switch, that level shifts the SDC pins between the two
> > regulators? If that's the case, I think we can describe that later, for
> > now we should just stick to one regulator.  
> 
> I got this mixed up, sorry. On my H700 the IO is 3.3v when GPIO PE4 is
> pulled high, but 1.1v when GPIO PE4 is left floating or pulled low.

Ah, that makes more sense. Did you measure that on some PortC pin, or on
the contacts in the SD card slot?
So it looks like PE4 could control this power switcher. Maybe it's 1.1V
because the other regulator is not set up properly? Is there some AXP rail
that is at 1.1V?

> Note this is for mmc2 like you say (which is the 2nd SD card slot).
> It's the mmc1 (the wifi) where the IO runs at a constant 1.8v.

Ok, thanks for confirming this!

Cheers,
Andre.

> > > > > +	cd-gpios = <&pio 4 22 GPIO_ACTIVE_LOW>; /* PE22 */
> > > > > +	bus-width = <4>;
> > > > > +	status = "okay";
> > > > > +};
> > > > > +
> > > > > +&ohci0 {
> > > > > +	status = "okay";
> > > > > +};
> > > > > +
> > > > > +&ehci0 {
> > > > > +	status = "okay";
> > > > > +};
> > > > > +
> > > > > +&r_rsb {
> > > > > +   status = "okay";    
> > > > 
> > > > This is indented with spaces, not a tab.
> > > >     
> > > > > +
> > > > > +   axp717: pmic@3a3 {
> > > > > +		compatible = "x-powers,axp717";
> > > > > +		reg = <0x3a3>;
> > > > > +		interrupt-controller;
> > > > > +		#interrupt-cells = <1>;
> > > > > +		interrupt-parent = <&nmi_intc>;
> > > > > +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> > > > > +
> > > > > +		vin1-supply = <&reg_vcc5v>;
> > > > > +		vin2-supply = <&reg_vcc5v>;
> > > > > +		vin3-supply = <&reg_vcc5v>;
> > > > > +		vin4-supply = <&reg_vcc5v>;
> > > > > +
> > > > > +		regulators {
> > > > > +			reg_dcdc1: dcdc1 {
> > > > > +				regulator-always-on;
> > > > > +				regulator-boot-on;    
> > > > 
> > > > boot-on doesn't make much sense here: that allows it to be turned off,
> > > > which we don't want. Also the binding documentation in regulator.yaml
> > > > says that it's only intended "where software cannot read the state of
> > > > the regulator", which is not true here.
> > > > regulator-always-on is all we need - technically speaking not even
> > > > that, since cpu0 is a consumer, but we need to play safe here.
> > > >     
> > > > > +				regulator-min-microvolt = <900000>;
> > > > > +				regulator-max-microvolt = <1100000>;
> > > > > +				regulator-name = "vdd-cpu";
> > > > > +			};
> > > > > +
> > > > > +			reg_dcdc2: dcdc2 {
> > > > > +				regulator-always-on;
> > > > > +				regulator-min-microvolt = <940000>;
> > > > > +				regulator-max-microvolt = <940000>;
> > > > > +				regulator-name = "vdd-gpu-sys";
> > > > > +			};
> > > > > +
> > > > > +			reg_dcdc3: dcdc3 {
> > > > > +				regulator-always-on;
> > > > > +				regulator-boot-on;    
> > > > 
> > > > Same here, please remove that last line. We must not turn that off, and
> > > > the state is readable, so it's not needed. We need always-on here,
> > > > since it has no consumer.
> > > >     
> > > > > +				regulator-min-microvolt = <1100000>;
> > > > > +				regulator-max-microvolt = <1100000>;
> > > > > +				regulator-name = "vdd-dram";
> > > > > +			};
> > > > > +
> > > > > +			reg_aldo1: aldo1 { /* SDC2 */
> > > > > +				regulator-min-microvolt = <1800000>;
> > > > > +				regulator-max-microvolt = <1800000>;
> > > > > +				regulator-name = "vcc-sd2";
> > > > > +			};
> > > > > +
> > > > > +			reg_aldo2: aldo2 {
> > > > > +				/* unused */
> > > > > +			};
> > > > > +
> > > > > +			reg_aldo3: aldo3 {
> > > > > +				regulator-always-on;
> > > > > +				regulator-min-microvolt = <1800000>;
> > > > > +				regulator-max-microvolt = <1800000>;
> > > > > +				regulator-name = "axp717-aldo3";    
> > > > 
> > > > So do we know for sure that's critical? And do we have any clue what
> > > > this supplies?
> > > > There is AVCC, VCC_HDMI, VCC_TV, VCC_RTC, all at 1.8V. The middle two
> > > > are not critical.
> > > >     
> > > > > +			};
> > > > > +
> > > > > +			reg_aldo4: aldo4 { /* 5096000.codec */
> > > > > +				regulator-always-on;    
> > > > 
> > > > Is that necessary? What happens if that is turned off? Looks like only
> > > > the WiFi and potentially audio is affected? I think it can go then,
> > > > also pg-supply would reference it, so it would effectively be enabled
> > > > anyways.    
> > > 
> > > I think this does something critical, as in my testing tinkering with
> > > this regulator or turning it off locks up the system.  
> > 
> > In this case we typically add a comment stating that, so that people know.
> > We can amend this should we figure out that it supplies.
> > 
> > Cheers,
> > Andre
> >   
> > >   
> > > >     
> > > > > +				regulator-min-microvolt = <1800000>;
> > > > > +				regulator-max-microvolt = <1800000>;
> > > > > +				regulator-name = "vcc-pg";
> > > > > +			};
> > > > > +
> > > > > +			reg_bldo1: bldo1 {
> > > > > +				/* unused */
> > > > > +			};
> > > > > +
> > > > > +			reg_bldo2: bldo2 {
> > > > > +				regulator-always-on;
> > > > > +				regulator-min-microvolt = <1800000>;
> > > > > +				regulator-max-microvolt = <1800000>;
> > > > > +				regulator-name = "vcc-pll";
> > > > > +			};
> > > > > +
> > > > > +			reg_bldo3: bldo3 {
> > > > > +				/* unused */
> > > > > +			};
> > > > > +
> > > > > +			reg_bldo4: bldo4 {
> > > > > +				/* unused */
> > > > > +			};
> > > > > +
> > > > > +			reg_cldo1: cldo1 { /* 5096000.codec */
> > > > > +				/* unused */
> > > > > +				regulator-min-microvolt = <3300000>;
> > > > > +				regulator-max-microvolt = <3300000>;    
> > > > 
> > > > Looks a bit odd to have an "unused" comment, but also a voltage range
> > > > specified. Judging from the comment this might be supplying some audio
> > > > circuitry, which we don't need at the moment?
> > > > 
> > > > The rest looks fine to me.
> > > > 
> > > > Cheers,
> > > > Andre
> > > >     
> > > > > +				regulator-name = "axp717-cldo1";
> > > > > +			};
> > > > > +
> > > > > +			reg_cldo2: cldo2 {
> > > > > +				/* unused */
> > > > > +
> > > > > +			};
> > > > > +
> > > > > +			reg_cldo3: cldo3 {
> > > > > +				regulator-always-on;
> > > > > +				regulator-min-microvolt = <3300000>;
> > > > > +				regulator-max-microvolt = <3300000>;
> > > > > +				regulator-name = "vcc-io";
> > > > > +			};
> > > > > +
> > > > > +			reg_cldo4: cldo4 {
> > > > > +				regulator-min-microvolt = <3300000>;
> > > > > +				regulator-max-microvolt = <3300000>;
> > > > > +				regulator-name = "vcc-wifi";
> > > > > +			};
> > > > > +
> > > > > +			reg_boost: boost {
> > > > > +				regulator-min-microvolt = <5000000>;
> > > > > +				regulator-max-microvolt = <5200000>;
> > > > > +				regulator-name = "boost";
> > > > > +			};
> > > > > +
> > > > > +			reg_cpusldo: cpusldo {
> > > > > +				/* unused */
> > > > > +			};
> > > > > +		};
> > > > > +	};
> > > > > +};
> > > > > +
> > > > > +&uart0 {
> > > > > +	pinctrl-names = "default";
> > > > > +	pinctrl-0 = <&uart0_ph_pins>;
> > > > > +	status = "okay";
> > > > > +};
> > > > > +
> > > > > +&pio {
> > > > > +	vcc-pa-supply = <&reg_cldo3>;
> > > > > +	vcc-pc-supply = <&reg_cldo3>;
> > > > > +	vcc-pe-supply = <&reg_cldo3>;
> > > > > +	vcc-pf-supply = <&reg_cldo3>;
> > > > > +	vcc-pg-supply = <&reg_aldo4>;
> > > > > +	vcc-ph-supply = <&reg_cldo3>;
> > > > > +	vcc-pi-supply = <&reg_cldo3>;
> > > > > +};
> > > > > +
> > > > > +/* the AXP717 has USB type-C role switch functionality, not yet described by the binding */
> > > > > +&usbotg {
> > > > > +	dr_mode = "peripheral";   /* USB type-C receptable */
> > > > > +	status = "okay";
> > > > > +};
> > > > > +
> > > > > +&usbphy {
> > > > > +	status = "okay";
> > > > > +};    
> > > >     
> > > 
> > > Thank you,
> > > Chris
> > >   
> >   
> 
> Thank you,
> Chris
> 

