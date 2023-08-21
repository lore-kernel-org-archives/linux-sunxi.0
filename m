Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0CC8BE5
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Aug 2023 17:06:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EBA32F4;
	Mon, 21 Aug 2023 10:06:52 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F61D3F762;
	Mon, 21 Aug 2023 10:06:09 -0700 (PDT)
Date: Mon, 21 Aug 2023 18:06:07 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, mripard@kernel.org, me@crly.cz, uwu@icenowy.me,
 samuel@sholland.org, jernej.skrabec@gmail.com, wens@csie.org,
 conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH V2 4/4] ARM: dts: sunxi: add support for Anbernic
 RG-Nano
Message-ID: <20230821180607.26cf73ca@donnerap.manchester.arm.com>
In-Reply-To: <SN6PR06MB53425735CA49EF8C30FDCF4DA51EA@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230819032105.67978-1-macroalpha82@gmail.com>
	<20230819032105.67978-5-macroalpha82@gmail.com>
	<20230819230335.45ad16de@slackpad.lan>
	<SN6PR06MB53425735CA49EF8C30FDCF4DA51EA@SN6PR06MB5342.namprd06.prod.outlook.com>
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

On Mon, 21 Aug 2023 10:38:38 -0500
Chris Morgan <macromorgan@hotmail.com> wrote:

Hi Chris,

> On Sat, Aug 19, 2023 at 11:03:52PM +0100, Andre Przywara wrote:
> > On Fri, 18 Aug 2023 22:21:05 -0500
> > Chris Morgan <macroalpha82@gmail.com> wrote:
> > 
> > Hi Chris,
> > 
> > thanks for the update!
> >   
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > > 
> > > The Anbernic RG-Nano is a small portable game device based on the
> > > Allwinner V3s SoC. It has GPIO buttons on the face and side for
> > > input, a single mono speaker, a 240x240 SPI controlled display, a USB-C
> > > OTG port, an SD card slot for booting, and 64MB of RAM included in the
> > > SoC.
> > > 
> > > The SPI display is currently unsupported, as it will either require
> > > a new tinydrm driver or changes to the staging fbtft driver to support.
> > > I plan on working on a tinydrm driver to properly support it. The USB-C
> > > port currently only works as a peripheral port, however in the BSP
> > > kernel it also works in host mode allowing included USB-C headphones
> > > with a built-in DAC to work.
> > > 
> > > Working:
> > > - SDMMC
> > > - UART (for debugging)
> > > - Buttons
> > > - Charging/battery/PMIC
> > > - Speaker
> > > - USB Gadget
> > > 
> > > Not working:
> > > - Display
> > > - USB Host
> > > 
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > ---
> > >  arch/arm/boot/dts/allwinner/Makefile          |   1 +
> > >  .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 219 ++++++++++++++++++
> > >  2 files changed, 220 insertions(+)
> > >  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > > 
> > > diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
> > > index 589a1ce1120a..2be83a1edcbb 100644
> > > --- a/arch/arm/boot/dts/allwinner/Makefile
> > > +++ b/arch/arm/boot/dts/allwinner/Makefile
> > > @@ -237,6 +237,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
> > >  	sun8i-t113s-mangopi-mq-r-t113.dtb \
> > >  	sun8i-t3-cqa3t-bv3.dtb \
> > >  	sun8i-v3-sl631-imx179.dtb \
> > > +	sun8i-v3s-anbernic-rg-nano.dtb \
> > >  	sun8i-v3s-licheepi-zero.dtb \
> > >  	sun8i-v3s-licheepi-zero-dock.dtb \
> > >  	sun8i-v40-bananapi-m2-berry.dtb
> > > diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > > new file mode 100644
> > > index 000000000000..c49b5431d04e
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
> > > @@ -0,0 +1,219 @@
> > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > +
> > > +/dts-v1/;
> > > +#include <dt-bindings/input/linux-event-codes.h>
> > > +#include "sun8i-v3s.dtsi"
> > > +#include "sunxi-common-regulators.dtsi"
> > > +
> > > +/ {
> > > +	model = "Anbernic RG Nano";
> > > +	compatible = "anbernic,rg-nano", "allwinner,sun8i-v3s";
> > > +
> > > +	aliases {
> > > +		serial0 = &uart0;
> > > +	};
> > > +
> > > +	backlight: backlight {
> > > +		compatible = "pwm-backlight";
> > > +		pwms = <&pwm 0 40000 1>;
> > > +		brightness-levels = <0 1 2 3 8 14 21 32 46 60 80 100>;
> > > +		default-brightness-level = <11>;
> > > +		power-supply = <&reg_vcc5v0>;
> > > +	};
> > > +
> > > +	chosen {
> > > +		stdout-path = "serial0:115200n8";
> > > +	};
> > > +
> > > +	gpio_keys: gpio-keys {
> > > +		compatible = "gpio-keys";
> > > +
> > > +		button-a {
> > > +			gpios = <&gpio_expander 12 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label = "BTN-A";
> > > +			linux,code = <BTN_EAST>;
> > > +		};
> > > +
> > > +		button-b {
> > > +			gpios = <&gpio_expander 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label = "BTN-B";
> > > +			linux,code = <BTN_SOUTH>;
> > > +		};
> > > +
> > > +		button-down {
> > > +			gpios = <&gpio_expander 1 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label = "DPAD-DOWN";
> > > +			linux,code = <BTN_DPAD_DOWN>;
> > > +		};
> > > +
> > > +		button-left {
> > > +			gpios = <&gpio_expander 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label = "DPAD-LEFT";
> > > +			linux,code = <BTN_DPAD_LEFT>;
> > > +		};
> > > +
> > > +		button-right {
> > > +			gpios = <&gpio_expander 0 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label = "DPAD-RIGHT";
> > > +			linux,code = <BTN_DPAD_RIGHT>;
> > > +		};
> > > +
> > > +		button-se {
> > > +			gpios = <&gpio_expander 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label = "BTN-SELECT";
> > > +			linux,code = <BTN_SELECT>;
> > > +		};
> > > +
> > > +		button-st {
> > > +			gpios = <&gpio_expander 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label = "BTN-START";
> > > +			linux,code = <BTN_START>;
> > > +		};
> > > +
> > > +		button-tl {
> > > +			gpios = <&gpio_expander 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label = "BTN-L";
> > > +			linux,code = <BTN_TL>;
> > > +		};
> > > +
> > > +		button-tr {
> > > +			gpios = <&gpio_expander 15 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label = "BTN-R";
> > > +			linux,code = <BTN_TR>;
> > > +		};
> > > +
> > > +		button-up {
> > > +			gpios = <&gpio_expander 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label = "DPAD-UP";
> > > +			linux,code = <BTN_DPAD_UP>;
> > > +		};
> > > +
> > > +		button-x {
> > > +			gpios = <&gpio_expander 11 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label = "BTN-X";
> > > +			linux,code = <BTN_NORTH>;
> > > +		};
> > > +
> > > +		button-y {
> > > +			gpios = <&gpio_expander 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> > > +			label = "BTN-Y";
> > > +			linux,code = <BTN_WEST>;
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +&codec {
> > > +	allwinner,audio-routing = "Speaker", "HP",
> > > +				  "MIC1", "Mic",
> > > +				  "Mic", "HBIAS";
> > > +	allwinner,pa-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
> > > +	status = "okay";
> > > +};
> > > +
> > > +&cpu0 {
> > > +	clock-frequency = <1296000>;  
> > 
> > I understand that the kernel complains when this is missing, but I
> > think this property is some ancient legacy, as there is no such thing
> > as a fixed CPU frequency anymore. That becomes evident with the OPPs
> > below. So please remove it.  
> 
> Okay, I'll remove it. I always try to make sure dmesg log is as error
> free as possible, and yes, that's the only reason I put this here.

Yeah, I hear you. I actually pushed
https://github.com/devicetree-org/devicetree-specification/commit/c2cdd4a0db1d79f
into the DT spec, so we have some leg to stand on when trying to remove
the kernel message. Just need to find the time to make this patch ...

> >   
> > > +	clock-latency = <244144>;
> > > +	operating-points = <
> > > +			/* kHz    uV */
> > > +			1296000 1200000
> > > +			1008000 1200000
> > > +			864000  1200000
> > > +			720000  1100000
> > > +			480000  1000000>;  
> > 
> > Don't you need a cpu-supply property to point to the regulator in
> > charge of providing the core voltage? Otherwise I don't see how the
> > kernel would be able to adjust the voltage, to program the OPPs.
> >   
> 
> I'll add cpu-supply. Based on the schematic it looks like the
> cpu_supply is the DCDC2. DCDC2 is also hooked up to some other inactive
> pins according to the schematic but I can't see those pins on the
> SoC datasheet (so maybe it's just a schematic quirk?).

Mmmh, what are the names of those pins?

In general I wonder if you should enable DVFS if the vendor firmware
doesn't do that. Especially for a retro gaming device, I wonder if some
code relies on the CPU running at the same frequency all the time, so that
timing loops stay stable, and other real-time properties are still met.

On the other hand, without DVFS the chip will run at at constant 1.08GHz
(as set up by mainline U-Boot), which might leave some performance on the
table. And it might affect the runtime, since this is battery powered. What
frequency does the BSP firmware run with?

> > > +};
> > > +
> > > +&i2c0 {
> > > +	status = "okay";
> > > +
> > > +	gpio_expander: gpio@20 {
> > > +		compatible = "nxp,pcal6416";
> > > +		reg = <0x20>;
> > > +		gpio-controller;
> > > +		#gpio-cells = <2>;
> > > +		#interrupt-cells = <2>;
> > > +		interrupt-controller;
> > > +		interrupt-parent = <&pio>;
> > > +		interrupts = <1 3 IRQ_TYPE_EDGE_BOTH>;
> > > +		vcc-supply = <&reg_vcc3v3>;
> > > +	};
> > > +
> > > +	axp209: pmic@34 {
> > > +		reg = <0x34>;
> > > +		interrupt-parent = <&pio>;
> > > +		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>;
> > > +	};
> > > +
> > > +	pcf8563: rtc@51 {
> > > +		compatible = "nxp,pcf8563";
> > > +		reg = <0x51>;
> > > +	};
> > > +};
> > > +
> > > +#include "axp209.dtsi"
> > > +
> > > +&battery_power_supply {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&mmc0 {
> > > +	broken-cd;
> > > +	bus-width = <4>;
> > > +	disable-wp;
> > > +	vmmc-supply = <&reg_vcc3v3>;
> > > +	vqmmc-supply = <&reg_vcc3v3>;
> > > +	status = "okay";
> > > +};
> > > +
> > > +&pio {
> > > +	vcc-pb-supply = <&reg_vcc3v3>;
> > > +	vcc-pc-supply = <&reg_vcc3v3>;
> > > +	vcc-pf-supply = <&reg_vcc3v3>;
> > > +	vcc-pg-supply = <&reg_vcc3v3>;
> > > +};
> > > +
> > > +&pwm {
> > > +	pinctrl-0 = <&pwm0_pins>;
> > > +	pinctrl-names = "default";
> > > +	status = "okay";
> > > +};
> > > +
> > > +&reg_dcdc2 {  
> > 
> > Any reason your dropped the regulator-name property? This would help to
> > identify what this regulator is used for and would explain why it needs
> > to be always on.
> > In v1 this was "vdd-cpu-sys-ephy", are you sure about this name? I
> > guess it supplies the CPU, but I wonder if there are other users of
> > this rail, which would possibly throw a spanner into DVFS. So what's the
> > "ephy" doing here? And can you adjust the voltage, if this also driving
> > VDD-SYS? What does the BSP kernel do?
> >   
> 
> This rail appears to supply the CPU (vdd-cpu) SYS (vdd-sys) and
> vdd-ephy. The ratings for each of these according to the datasheet are
> between -0.3v and 1.3v (CPU/SYS) or 1.4v (for the EPHY). The BSP kernel
> has this as variable between 1v and 1.25v, but it doesn't appear to
> have DVFS enabled. I can change the range back to 1/1.25v since it
> supplies the CPU so we can enable DVFS; the datasheet isn't clear
> what vdd-sys or vdd-ephy do, but in the case of EPHY we aren't using
> that feature at least (and these voltages are within range).

Right, if the board doesn't use the EPHY, then the voltage changing
shouldn't matter, as long as it's within range.
As for VDD-SYS: I am not so sure about this, I only seem to see GPU
and SYS coupled together (in the mainline DTs), but not CPU and SYS.
And VDD_SYS having the same range is one thing, but its voltage changing
at runtime is another topic: I don't really know if the chips can cope
with that, or if the system become unstable.

> Do you think I should keep the cpu-supply and frequency stuff in place,
> or should I drop it all instead?

If the BSP doesn't use that, I'd rather drop the DVFS nodes, or maybe
deactivate them, so users can bring them back at their own discretion?

> > > +	regulator-always-on;
> > > +	regulator-max-microvolt = <1250000>;
> > > +	regulator-min-microvolt = <1250000>;
> > > +};
> > > +
> > > +&reg_dcdc3 {  
> > 
> > Same here, please provide a speaking name, or a comment explaining
> > why this must be always on. There is no need to enumerate every user,
> > just "vdd-3v3" seems to be a common name for that regulator.
> >   
> 
> I'll go with vcc-io like the BSP, unless you feel strongly otherwise.
> The regulator appears to power all the different IO pins on the SoC
> and basically everything else that uses 3.3v that isn't the RTC.
> 
> > > +	regulator-always-on;
> > > +	regulator-max-microvolt = <3300000>;
> > > +	regulator-min-microvolt = <3300000>;
> > > +};
> > > +
> > > +&reg_ldo2 {  
> > 
> > Same here, name or comment, please.
> >   
> 
> You got it.
> 
> > > +	regulator-always-on;
> > > +	regulator-max-microvolt = <3000000>;
> > > +	regulator-min-microvolt = <3000000>;
> > > +};
> > > +
> > > +&spi0 {  
> > 
> > Can you add a comment here mentioning the not-yet-supported display?
> > And you should specify the pins used here.
> >   
> 
> The SPI pins are defined in the main v3s file.

Ah, right, sorry, I missed that.

> Additionally I have a
> TE pin (GPIO PB1) and a RESET pin for the panel (GPIO PB2). The RESET
> pin looks like it has an external pull-up to 3.3v. The RS pin on the
> panel is wired to MISO, otherwise CS on the panel goes to CS on the
> SoC, CLK to CLK, and MOSI to MOSI. Everything but the RESET panel
> is pulled to ground (I think, still not perfect at schematics).

Those other pins would be described in the (upcoming) panel DT node. The
SPI pins should indeed be already activated, courtesy of pinctrl-0 in the
.dtsi.

> > Cheers,
> > Andre
> > 
> >   
> > > +	status = "okay";
> > > +};
> > > +
> > > +&uart0 {
> > > +	pinctrl-0 = <&uart0_pb_pins>;
> > > +	pinctrl-names = "default";
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usb_otg {
> > > +	dr_mode = "otg";

Just seeing this: if you have "otg" here, wouldn't you need to specify the
ID pin (usb0_id_det-gpios) in the usbphy DT node? Because otherwise the
kernel won't know when to switch between host and peripheral mode.

> > > +	status = "okay";
> > > +};
> > > +
> > > +&usb_power_supply {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usbphy {
> > > +	status = "okay";
> > > +};  
> >   
> 
> Also, I did another comparison with the BSP kernel and realized I was
> missing the OHCI/EHCI and now OTG is working (at least the extcon
> shows host when it has a device attached and not host when it's hooked
> to my computer).

Wait, that's odd. What OHCI/EHCI? DT nodes? I don't find any in the V3s
.dtsi, and normally you don't need them for OTG anyway.
There is some oddity with the PHY switching code, but I think what
should work is the OTG operation, with an ID pin.

Cheers,
Andre
