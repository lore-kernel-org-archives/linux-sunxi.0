Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2ADECF
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Apr 2024 00:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713660583; cv=none; b=no6y0AFvwznosHq40d79QBdLk0kQ3QIl6d1E9txsJxvRaWpTDi8HH5DXcZQr6huwYeSCHdVjRkH76UXsjAmN8Wi3qJg+Un/Q8CRQHCWO8V/FGmxPC9ljc6zT3NWAztFg6MCcC4ABwczx8JJPZw0D121aeniVlxP/pzTXzKy0B6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713660583; c=relaxed/simple;
	bh=xWU8n6YF+v3NpkCiIeP+i9EFlZxptzhzT5H1R/4/xZE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tVDWoWSw4lcS5CzS50cbZpqEqACSfrSKjz2WZWpIOVlKM6DyzilCXEcufXVenFUPPuVfHQr8OxDH7w2CfQuR1sFhhSpfZtpRLbOgvfIlag2Xi9Vi6ndAeQpnqL9Z769Sd7+V4wafEDfMH+XulTZMxrqL2W3m6rMWoA5asEk0Ivo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 574CD339;
	Sat, 20 Apr 2024 17:50:03 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C4313F792;
	Sat, 20 Apr 2024 17:49:32 -0700 (PDT)
Date: Sun, 21 Apr 2024 01:49:20 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Chris Morgan <macromorgan@hotmail.com>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/5] arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
Message-ID: <20240421014920.4946a5ce@minigeek.lan>
In-Reply-To: <20240420104354.334947-8-ryan@testtoast.com>
References: <20240420104354.334947-5-ryan@testtoast.com>
	<20240420104354.334947-8-ryan@testtoast.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 20 Apr 2024 22:43:56 +1200
Ryan Walklin <ryan@testtoast.com> wrote:

Hi Ryan,

many thanks for the respin and the changes! We are getting there ...

> The base model RG35XX (2024) is a handheld gaming device based on an Allwinner H700 chip.
> 
> The H700 is a H616 variant (4x ARM Cortex-A53 cores @ 1.5Ghz with Mali G31 GPU) which exposes RGB LCD and NMI pins.
> 
> Device features:
> - Allwinner H700 @ 1.5GHz
> - 1GB LPDDR4 DRAM
> - X-Powers AXP717 PMIC
> - 3.5" 640x480 RGB LCD
> - Two microSD slots
> - Mini-HDMI out
> - GPIO keypad
> - 3.5mm headphone jack
> 
> Enabled in this DTS:
> - AXP717 PMIC with regulators (interrupt controller TBC/TBD)
> - Power LED (charge LED on device controlled directly by PMIC)
> - Serial UART (accessible from PIN headers on the board)
> - MMC slots
> 
> Changelog v1..v2:
> - Update copyright
> - Spaces -> Tabs
> - Add cpufreq support [1]
> - Remove MMC aliases
> - Fix GPIO button and regulator node names
> - Note unused AXP717 regulators
> - Update regulator for SD slots
> - Remove unused I2C3 device
> - Update NMI interrupt controller for AXP717 [2]
> - Add chassis-type
> - Address USB EHCI/OHCI0 correctly and add usb vbus supply
> - Add PIO vcc-pg-supply
> - Correct boost regulator voltage and name
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> 
> [1]: https://lore.kernel.org/linux-sunxi/20240419071450.7aiheeoyq35yjoo7@vireshk-i7/T/#t
> [2]: https://lore.kernel.org/linux-sunxi/20240418181615.1370179-1-macroalpha82@gmail.com/T/#t

As those are dependencies, but WIP, this gets a bit tricky:
- cpufreq is pretty far, but comes through a different tree. I suggest
  you drop the cpu-opp.dtsi include, to not complicate things. We can
  add this later as a fix, once this OPP file has reached the master
  tree.
- The NMI binding and DT node seem important, but have not been merged
  yet. I suggest to mention them as a requirement. The patches (binding
  plus H616 .dtsi change) should go through the sunxi tree as well, so
  the maintainers can order this appropriately when merging.
- The GPADC (in the later patch) is similar, but it is not as critical
  as the NMI. Not sure how the maintainers want to handle this, but we
  might add those bits as an (optional) patch on top, so this can be
  handled more independently from the GPADC series.

> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 375 ++++++++++++++++++
>  1 file changed, 375 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> new file mode 100644
> index 000000000000..d8081273677d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> @@ -0,0 +1,375 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-h616.dtsi"
> +#include "sun50i-h616-cpu-opp.dtsi"

As mentioned, please drop this line for now.

> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	model = "Anbernic RG35XX 2024";
> +	chassis-type = "handset";
> +	compatible = "anbernic,rg35xx-2024", "allwinner,sun50i-h700";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			function = LED_FUNCTION_POWER;
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&pio 8 12 GPIO_ACTIVE_HIGH>; /* PI12 */
> +			default-state = "on";
> +		};
> +	};
> +
> +	gpio-keys {
> +	   compatible = "gpio-keys";
> +
> +	   button-up {

indentation

> +		   label = "D-Pad Up";
> +		   gpios = <&pio 0 6 GPIO_ACTIVE_LOW>; /* PA6 */
> +		   linux,input-type = <EV_KEY>;
> +		   linux,code = <BTN_DPAD_UP>;
> +		};
> +
> +		button-down {
> +			label = "D-Pad Down";
> +			gpios = <&pio 4 0 GPIO_ACTIVE_LOW>; /* PE0 */
> +			linux,input-type = <EV_KEY>;
> +			linux,code = <BTN_DPAD_DOWN>;
> +		};
> +
> +		button-left {
> +			label = "D-Pad left";
> +			gpios = <&pio 0 8 GPIO_ACTIVE_LOW>; /* PA8 */
> +			linux,input-type = <EV_KEY>;
> +			linux,code = <BTN_DPAD_LEFT>;
> +		};
> +
> +		button-right {
> +			label = "D-Pad Right";
> +			gpios = <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
> +			linux,input-type = <EV_KEY>;
> +			linux,code = <BTN_DPAD_RIGHT>;
> +		};
> +
> +		button-a {
> +			label = "Action-Pad A";
> +			gpios = <&pio 0 0 GPIO_ACTIVE_LOW>; /* PA0 */
> +			linux,input-type = <EV_KEY>;
> +			linux,code = <BTN_EAST>;
> +		};
> +
> +		button-b {
> +			label = "Action-Pad B";
> +			gpios = <&pio 0 1 GPIO_ACTIVE_LOW>; /* PA1 */
> +			linux,input-type = <EV_KEY>;
> +			linux,code = <BTN_SOUTH>;
> +		};
> +
> +		button-x {
> +			label = "Action-Pad X";
> +			gpios = <&pio 0 3 GPIO_ACTIVE_LOW>; /* PA3 */
> +			linux,input-type = <EV_KEY>;
> +			linux,code = <BTN_NORTH>;
> +		};
> +
> +		button-y {
> +			label = "Action Pad Y";
> +			gpios = <&pio 0 2 GPIO_ACTIVE_LOW>; /* PA2 */
> +			linux,input-type = <EV_KEY>;
> +			linux,code = <BTN_WEST>;
> +		};
> +
> +		button-start {
> +			label = "Key Start";
> +			gpios = <&pio 0 4 GPIO_ACTIVE_LOW>; /* PA4 */
> +			linux,input-type = <EV_KEY>;
> +			linux,code = <BTN_START>;
> +		};
> +
> +		button-select {
> +			label = "Key Select";
> +			gpios = <&pio 0 5 GPIO_ACTIVE_LOW>; /* PA5 */
> +			linux,input-type = <EV_KEY>;
> +			linux,code = <BTN_SELECT>;
> +		};
> +
> +		button-l1 {
> +			label = "Key L1";
> +			gpios = <&pio 0 10 GPIO_ACTIVE_LOW>; /* PA10 */
> +			linux,input-type = <EV_KEY>;
> +			linux,code = <BTN_TL>;
> +		};
> +
> +		button-l2 {
> +			label = "Key L2";
> +			gpios = <&pio 0 11 GPIO_ACTIVE_LOW>; /* PA11 */
> +			linux,input-type = <EV_KEY>;
> +			linux,code = <BTN_TL2>;
> +		};
> +
> +		button-r1 {
> +			label = "Key R1";
> +			gpios = <&pio 0 12 GPIO_ACTIVE_LOW>; /* PA12 */
> +			linux,input-type = <EV_KEY>;
> +			linux,code = <BTN_TR>;
> +		};
> +
> +		button-r2 {
> +			label = "Key R2";
> +			gpios = <&pio 0 7 GPIO_ACTIVE_LOW>; /* PA7 */
> +			linux,input-type = <EV_KEY>;
> +			linux,code = <BTN_TR2>;
> +		};
> +
> +		button-menu {
> +			label = "Key Menu";
> +			gpios = <&pio 4 3 GPIO_ACTIVE_LOW>; /* PE3 */
> +			linux,input-type = <EV_KEY>;
> +			linux,code = <BTN_MODE>;
> +		};
> +
> +		button-vol-up {
> +			label = "Key Volume Up";
> +			gpios = <&pio 4 1 GPIO_ACTIVE_LOW>; /* PE1 */
> +			linux,input-type = <EV_KEY>;
> +			linux,code = <KEY_VOLUMEUP>;
> +		};
> +
> +		button-vol-down {
> +			label = "Key Volume Down";
> +			gpios = <&pio 4 2 GPIO_ACTIVE_LOW>; /* PE2 */
> +			linux,input-type = <EV_KEY>;
> +			linux,code = <KEY_VOLUMEDOWN>;
> +		};
> +	};
> +
> +	reg_vcc_sd2: regulator-vcc3v3 {
> +		compatible = "regulator-fixed";
> +		gpio = <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
> +		regulator-name = "vcc_3v3_sd2";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	reg_vcc_usb: regulator-vcc-5v0-usb {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&pio 8 7 GPIO_ACTIVE_HIGH>; /* PI7 */
> +		regulator-name = "vcc_5v0_usb";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc_3v3_usb>;

This looks wrong, see below.

> +	};
> +
> +	vcc_3v3_usb: vcc-3v3-usb {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&pio 4 5 GPIO_ACTIVE_HIGH>; /* PE5 */
> +		regulator-always-on;
> +		regulator-boot-on;

There seems to be something off with this one. First, it seems odd that
an always-on regulator is GPIO controlled, as this surely means it's
not enabled at reset time (because the GPIO is initially HighZ and thus
not enabled). So who turns this on? Most likely it's the kernel? What
happens if we turn this off (or leave it off)?

Secondly, why is this 3.3V (both by name and voltage), but then
supplies the 5.0V USB VBUS?
And given that this is chained with reg_vcc_usb above, are those really
two regulators, controlled by two GPIOs?

> +		regulator-name = "vcc_3v3_usb";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +	};
> +
> +	reg_vcc5v: regulator-vcc5v { /* USB-C power input */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc-5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +	reg_pll_dcx0: regulator-pll-dcx0 {

It's DCXO (letter "oh", not zero): digitally controlled/compensated
crystal *o*scillator.

> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-name = "vcc-pll";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};

That one looks odd as well. While there might be a discrete regulator
(what this node is describing), I doubt it, since the AXP717 has plenty
of rails. In particular I am not sure if that fixed one would supply
PortG (mainly WiFi), which seems unneeded for the boot process, and
surely we want that switchable to save power if the WiFi is not needed.

You also have a VCC-PLL regulator below (BLDO2).
So please try to drop this regulator, I am pretty sure there is an AXP
rail that powers the WiFi.

See below for more on this.

> +};
> +
> +&cpu0 {
> +	cpu-supply = <&reg_dcdc1>;
> +};
> +
> +&mmc0 {
> +	vmmc-supply = <&reg_vcc_sd2>;

I don't think this GPIO controlled regulator provides the supply voltage
for the first SD card, since it would be disabled on reset, and the
BROM couldn't boot from the SD card. So it must be some other 3.3V
source, either a discrete regulator (fixed regulator), or some
default-on 3.3V AXP rail.

> +	disable-wp;
> +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
> +&mmc2 {
> +	vmmc-supply = <&reg_vcc_sd2>;
> +	vqmmc-supply = <&reg_aldo1>;
> +	cd-gpios = <&pio 4 22 GPIO_ACTIVE_LOW>; /* PE22 */
> +	bus-width = <4>;
> +	status = "okay";
> +};

This one seems more plausible. To confirm this, you could not use
reg_vcc_sd2 anywhere, and use some other 3.3V supply for vmmc, which
should break operation on the second SD card. Then just swap
reg_vcc_sd2 back in, and if it starts working again, we have confirmation.

> +
> +&ohci0 {
> +	status = "okay";
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&r_rsb {
> +   status = "okay";
> +
> +   axp717: pmic@3a3 {
> +		compatible = "x-powers,axp717";
> +		reg = <0x3a3>;
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +		interrupt-parent = <&nmi_intc>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		x-powers,drive-vbus-en;

Remove this last line, the AXP717 binding does not support this, and the
Linux driver doesn't implement this, as the AXP717 does not seem to
have this functionality.

> +
> +		vin1-supply = <&reg_vcc5v>;
> +		vin2-supply = <&reg_vcc5v>;
> +		vin3-supply = <&reg_vcc5v>;
> +		vin4-supply = <&reg_vcc5v>;
> +
> +		regulators {
> +			reg_dcdc1: dcdc1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <810000>;
> +				regulator-max-microvolt = <1100000>;
> +				regulator-name = "vdd-cpu";
> +			};
> +
> +			reg_dcdc2: dcdc2 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <940000>;
> +				regulator-max-microvolt = <940000>;
> +				regulator-name = "vdd-sys";
> +			};
> +
> +			reg_dcdc3: dcdc3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1100000>;
> +				regulator-max-microvolt = <1100000>;
> +				regulator-name = "vdd-dram";
> +			};
> +
> +			reg_aldo1: aldo1 {
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vcc-sd2";
> +			};
> +
> +			reg_aldo2: aldo2 {
> +				/* unused */
> +			};
> +
> +			reg_aldo3: aldo3 {
> +				regulator-always-on;
> +				regulator-boot-on;

Please remove this last line, it doesn't make sense in this context. Cf.
Documentation//devicetree/bindings/regulator/regulator.yaml.
I think the same applies to the other uses throughout this file.

> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3500000>;

This is not right. What is the voltage of this rail? The kernel should
tell you what was set in the register, through regulator_summary, or you
check what's the voltage on a BSP system.

> +				regulator-name = "axp717-aldo3";

If the system dies when you remove always-on, you might have found some
essential supply. Candidates for consumers are listed in the
H616 or T5 series datasheet. Matching the voltage might give you an
idea. Then use this consumer as the name.

> +			};
> +
> +			reg_aldo4: aldo4 {

Same for this one: Please remove regulator-boot-on, fix the voltage,
and provide some rationale why this needs to be on.

> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3500000>;
> +				regulator-name = "axp717-aldo4";
> +			};
> +
> +			reg_bldo1: bldo1 {
> +				/* unused */
> +			};
> +
> +			reg_bldo2: bldo2 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vcc-pll";
> +			};

This one is a good example: fixed voltage, no boot-on, and regulator
name provides rationale why it must be always-on. The others should
look similar.

> +
> +			reg_bldo3: bldo3 {
> +				/* unused */
> +			};
> +
> +			reg_bldo4: bldo4 {
> +				/* unused */
> +			};
> +
> +			reg_cldo1: cldo1 {
> +				/* unused */
> +			};
> +
> +			reg_cldo2: cldo2 {
> +				/* unused */
> +			};
> +
> +			reg_cldo3: cldo3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3500000>;
> +				regulator-name = "axp717-cldo3";

Same here as ALDO3/4: what voltage is it, and what does it probably
supply?

> +			};
> +
> +			reg_cldo4: cldo4 {
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vcc-wifi";
> +			};
> +
> +			reg_boost: boost {
> +				regulator-min-microvolt = <5126000>;
> +				regulator-max-microvolt = <5126000>;

It might be better to use a range, say 5.0V till 5.2V. The
kernel will then just continue using the default, which seems to be this
5.126V (5440mV + 9 * 64mV).

> +				regulator-name = "boost";
> +			};
> +
> +			reg_cpusldo: cpusldo {
> +				/* unused */

Is that so? I thought you mentioned on IRC this is required as well?

> +			};
> +		};
> +	};
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_ph_pins>;
> +	status = "okay";
> +};
> +
> +&pio {
> +	vcc-pg-supply = <&reg_pll_dcx0>;

As mentioned above, it seems unlikely to be a fixed regulator. If in
doubt, leave them out, they are not essential for the operation.

> +};
> +
> +/* the AXP717 has USB type-C role switch functionality, to be implemented */

Replace "to be implemented" with "not yet described by the binding".
This is DT land, so we don't care about implementations or the Linux
kernel, it's all about DTs and DT bindings.

> +&usbotg {
> +	dr_mode = "host";   /* USB type-C receptable */

So does this really work? It seems wrong to make this unconditional,
given this is the only way to charge the device. When power is supplied
through the USB-C port, surely driving VBUS from the board sounds
wrong. Unless you have a killer feature for a host port, I think
without working role switching, "peripheral" would be the safer
choice.

> +	status = "okay";
> +};
> +
> +&usbphy {
> +	usb0_vbus-supply = <&reg_vcc_usb>;

When you stick to "peripheral" above, you should drop this line for
now, especially since this regulator chain looks quite suspicious still.

Cheers,
Andre

> +	status = "okay";
> +};

