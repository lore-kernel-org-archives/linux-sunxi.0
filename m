Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD8814298
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Jun 2023 19:44:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29A5EC14;
	Thu, 29 Jun 2023 12:35:42 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0C2A3F73F;
	Thu, 29 Jun 2023 12:34:56 -0700 (PDT)
Date: Thu, 29 Jun 2023 20:34:10 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chris Morgan <macromorgan@hotmail.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, mripard@kernel.org, uwu@icenowy.me,
 samuel@sholland.org, jernej.skrabec@gmail.com, wens@csie.org,
 conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: sunxi: add support for Anbernic RG-Nano
Message-ID: <20230629203410.660eb9a4@slackpad.lan>
In-Reply-To: <SN6PR06MB53426B6D9456C68AAE8C51B0A527A@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20230620200022.295674-1-macroalpha82@gmail.com>
	<20230620200022.295674-4-macroalpha82@gmail.com>
	<20230621105228.41ca9fcf@donnerap.cambridge.arm.com>
	<SN6PR06MB53426B6D9456C68AAE8C51B0A527A@SN6PR06MB5342.namprd06.prod.outlook.com>
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

On Tue, 27 Jun 2023 12:49:05 -0500
Chris Morgan <macromorgan@hotmail.com> wrote:

Hi Chris,

> On Wed, Jun 21, 2023 at 10:52:28AM +0100, Andre Przywara wrote:
> > On Tue, 20 Jun 2023 15:00:22 -0500
> > Chris Morgan <macroalpha82@gmail.com> wrote:
> > 
> > Hi Chris,
> > 
> > thanks for sending this!
> > Is there some schematics for this somewhere? Or was this based on
> > information gathered from the stock firmware?
> >   
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > > 
> > > The Anbernic RG-Nano is a small portable game device based on the
> > > Allwinner V3s SoC. It has GPIO buttons on the face and side for
> > > input, a single mono speaker, a 240x240 SPI controlled display,
> > > and a USB-C OTG port for power. The SoC includes 64MB of RAM and
> > > an SD card slot for booting.
> > > 
> > > The SPI display is currently unsupported, as it will either require
> > > a new tinydrm driver or changes to the staging fbtft driver to support.
> > > I plan on working on a tinydrm driver to properly support it. There
> > > also may be a missing mux in the audio path that must be discovered and
> > > defined before audio will be fully working (internal speaker does not
> > > work yet, external headphones untested).
> > > 
> > > Working:
> > > - SDMMC
> > > - Buttons
> > > - Charging/battery/PMIC
> > > 
> > > Not working:
> > > - Display
> > > - Audio
> > > 
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > ---
> > >  arch/arm/boot/dts/Makefile                    |   1 +
> > >  .../boot/dts/sun8i-v3s-anbernic-rg-nano.dts   | 209 ++++++++++++++++++
> > >  2 files changed, 210 insertions(+)
> > >  create mode 100644 arch/arm/boot/dts/sun8i-v3s-anbernic-rg-nano.dts
> > > 
> > > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > > index 59829fc90315..31418b594222 100644
> > > --- a/arch/arm/boot/dts/Makefile
> > > +++ b/arch/arm/boot/dts/Makefile
> > > @@ -1414,6 +1414,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
> > >  	sun8i-t113s-mangopi-mq-r-t113.dtb \
> > >  	sun8i-t3-cqa3t-bv3.dtb \
> > >  	sun8i-v3-sl631-imx179.dtb \
> > > +	sun8i-v3s-anbernic-rg-nano.dtb \
> > >  	sun8i-v3s-licheepi-zero.dtb \
> > >  	sun8i-v3s-licheepi-zero-dock.dtb \
> > >  	sun8i-v40-bananapi-m2-berry.dtb
> > > diff --git a/arch/arm/boot/dts/sun8i-v3s-anbernic-rg-nano.dts b/arch/arm/boot/dts/sun8i-v3s-anbernic-rg-nano.dts
> > > new file mode 100644
> > > index 000000000000..ead315e8fc38
> > > --- /dev/null
> > > +++ b/arch/arm/boot/dts/sun8i-v3s-anbernic-rg-nano.dts
> > > @@ -0,0 +1,209 @@
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
> > 
> > Is that serial console actually usable, so are there pins or pads on the
> > PCB? Have you opened it up?
> >   
> 
> There are tx and rx pads exposed, and about a cm away a gnd pad also
> exposed. Sadly I ripped the solder pad off of mine, so remaining
> debugging is going on via ssh over USB gadget mode.

Good, thanks, then it should be indeed in the DT.

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
> > > +	allwinner,audio-routing = "Headphone", "HP",
> > > +				  "Headphone", "HPCOM",
> > > +				  "MIC1", "Mic",
> > > +				  "Mic", "HBIAS";
> > > +	status = "okay";
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
> > > +&ac_power_supply {
> > > +	status = "okay";
> > > +};
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
> > > +&pwm {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&reg_dcdc2 {
> > > +	regulator-always-on;
> > > +	regulator-max-microvolt = <1400000>;
> > > +	regulator-min-microvolt = <1000000>;  
> > 
> > I think since it's not referenced anywhere, and it's always-on, it should
> > be just a single voltage, so the same value for both min and max. I guess
> > at least this voltage here needs to be fixed anyway, and it wouldn't
> > really work with a different value? Does the bootloader set something up
> > there, or is it the default value that's just kept?  
> 
> It's always on at 1.25v according to the schematic. I also plan to move
> this devicetree to mainline U-Boot,

This will happen anyway: we only *copy* DTs from the kernel tree into
the U-Boot tree, minus some minor changes (for include paths, for
instance).

> so best to get it right here and
> there. Do you think just setting 1250000 for min and max works then?

Definitely, especially if the schematic says so, the DT should follow
this. Ranges are really only useful when the device attached requires
or supports this, for instance an SD card with voltage switching, or
the CPU supply. Since there is no reference to that regulator, there is
no device that could request a change, and the kernel has no clue what
to actually set it to, it just makes sure that it is in range. Where
does the range come from in the first place? Schematics or vendor
code/DT?

> > > +	regulator-name = "vdd-cpu-sys-ephy";
> > > +};
> > > +
> > > +&reg_dcdc3 {
> > > +	regulator-always-on;
> > > +	regulator-max-microvolt = <3450000>;
> > > +	regulator-min-microvolt = <3000000>;  
> > 
> > Same here, I guess: a single voltage.
> > If in doubt, you could pick the current voltage from
> > /sys/kernel/debug/regulator/regulator_summary and use that.  
> 
> This is a fixed 3.3v. Honestly I think this is output for the entire
> "3.3v rail" if I'm reading the schematics right.

Quite likely. The AXP209 datasheet mentions DRAM as the typical
application, but I think it's used here for the main 3.3V I/O rail.
Many devices work with 3.0V as well, but if the schematic says 3.3V,
we should go with this. Can you check the values when running the BSP
kernel?
 
> >   
> > > +	regulator-name = "vcc-io-ephy-mcsi-usb";
> > > +};
> > > +
> > > +&reg_ldo1 {
> > > +	regulator-name = "vcc-rtc";  
> 
> Here's one I could use some advice on actually. The existing driver
> has a constraint holding this at 1.3v, however I need to run it at
> 3.3v since it's hooked up to an external RTC that needs 3.3v. Any
> thoughts on how to tell the regulator "always be 1.3v, unless a
> voltage is explicitly specified")?

Well, that's one case that the driver doesn't really cover: this
regulator is always-on (by hardware) and has a fixed voltage. Which
one that is is set by the LDO1SET pin, so software has absolutely no
control over it. So any value you put in here is actually irrelevant.
However this is used to report the voltage, so we should relax the
driver code to also accept 3.3V.
What happens exactly when you put 3.3V in there? Does the whole driver
refuse to load, with an error message? Then I am tempted to put 1.3V in,
plus a comment about the problem.
If this is just a warning or non-fatal massage, we should use 3.3V.

And push for a driver fix in both cases.

> > > +};
> > > +
> > > +&reg_ldo2 {
> > > +	regulator-always-on;
> > > +	regulator-max-microvolt = <3300000>;
> > > +	regulator-min-microvolt = <2800000>;  
> > 
> > same here.  
> 
> Fixed 3.0v, again if I'm reading correctly.

3.0V sounds about right for a PLL supply, so yes: please use
min = max = 3.0V.

> >   
> > > +	regulator-name = "avcc-pll";
> > > +};
> > > +
> > > +&spi0 {
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
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usb_power_supply {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usbphy {
> > > +	usb0_id_det-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;

Where is this pin connected to, in the USB-C connector? One of the CC
pins?

> > > +	status = "okay";  
> > 
> > So in the commit message you say "USB-C for power", but this here
> > describes a full featured USB port. So does that work? Can you use it as a
> > gadget, but also as a host?  
> 
> Yes, it's an OTG port with the ID pin pulled to ground.

Do you mean both CC pins? IIRC this means it's hardwired as a
peripheral (UFP).

If I ignore the ID pin above, this looks like on the OrangePi Zero2 or
the MangoPi MQ-R. In those cases we put peripheral in the DT, as this
is what this connection seems to indicate. That *can* be used a host as
well, with the "right" cable, but it's not really a well supported
configuration, so we leave this up to people to change this locally,
should they really desire so.

Cheers,
Andre

> I have it set
> as a peripherial on mine so I can ssh via ethernet gadget (since I
> broke my solder pads for serial), but it also acts as a host for the
> included "USB audio dongle" which is just a simple USB DAC (and not
> using any analog pins).
> 
> Also, I noticed that usb0_id_det-gpios is wrong, so I changed it.
> 
> > 
> > Otherwise this looks alright to me.
> > 
> > Cheers,
> > Andre
> > 
> >   
> > > +};  
> >   
> 

