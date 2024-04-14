Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDF42E644
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Apr 2024 17:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713116783; cv=none; b=URN/usJf0HwegOVw7wcdBif4awYy1UKPBpHVt+IPFltWMLIeJyG6FwMcKNwWOVrave0p9V6vo24P3r2FJv2C3luOTd8TatfqqdMljXuic0utB1OHgD+lpHSnW/3qrDSe9rlCZc6NEuwwZuKDGrXsJAkPAPVj0+1R/+4fTIwDfEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713116783; c=relaxed/simple;
	bh=rRTUU76SgBLjs70H6+xZMqnK+3mPk9AGWE+bNCAV4Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HpaV8ykCAG0ZudT7GTMvqRJiikZnFtuNKu14igjWg3PS2ZKzJqRccBUsHj+od8tx3+/14ChZysRdwEtBtU4N+Z0MGDe6HqakZTlYjivB+MYg7fgJYW2n9VmHisxtI8wZCtjz2SziUeFQAtw79ADa2VBmJY6WOzsSnoy1jTYMO58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D46C1339;
	Sun, 14 Apr 2024 10:46:42 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFDEA3F792;
	Sun, 14 Apr 2024 10:46:12 -0700 (PDT)
Date: Sun, 14 Apr 2024 18:46:01 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Chris Morgan <macromorgan@hotmail.com>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/4] arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
Message-ID: <20240414184601.0a4fe47c@minigeek.lan>
In-Reply-To: <20240414083347.131724-5-ryan@testtoast.com>
References: <20240414083347.131724-2-ryan@testtoast.com>
	<20240414083347.131724-5-ryan@testtoast.com>
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

On Sun, 14 Apr 2024 20:33:46 +1200
Ryan Walklin <ryan@testtoast.com> wrote:

Hi Ryan,

thanks for sending this!

> From: Ryan Walklin <ryan@testtoast.com>
> 
> The base model RG35XX (2024) is a handheld gaming device based on an Allwinner 
> H700 chip.
> 
> The H700 is a H616 variant (4x ARM Cortex-A53 cores @ 1.5Ghz with Mali G31 GPU) 
> which exposes RGB LCD and NMI pins.
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
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 405 ++++++++++++++++++
>  1 file changed, 405 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> new file mode 100644
> index 000000000000..b4140d450687
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> @@ -0,0 +1,405 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (C) 2024 Andre Przywara <andre.przywara@arm.com>.
> + * Copyright (C) 2024 Ryan Walklin <ryan@testtoast.com>.
> + * Copyright (C) 2024 Chris Morgan <macroalpha82@gmail.com>.
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-h616.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +    model = "Anbernic RG35XX 2024";
> +    compatible = "anbernic,rg35xx-2024", "allwinner,sun50i-h700";
> +
> +    aliases {
> +        mmc0 = &mmc0;
> +        mmc1 = &mmc2;
> +        mmc2 = &mmc1;

We don't put aliases for MMC devices in here. Conceptually they should
not be needed, but U-Boot will add them automatically anyway, so we
would not lose anything.

> +        serial0 = &uart0;
> +    };
> +
> +    chosen {
> +        stdout-path = "serial0:115200n8";
> +    };
> +
> +    leds {
> +        compatible = "gpio-leds";
> +
> +        led-0 {
> +            function = LED_FUNCTION_POWER;
> +            color = <LED_COLOR_ID_GREEN>;
> +            gpios = <&pio 8 12 GPIO_ACTIVE_HIGH>; /* PI12 */
> +            default-state = "on";
> +        };
> +    };
> +
> +    gpio-keys {
> +       compatible = "gpio-keys";
> +
> +       keyUp {
> +           label = "D-Pad Up";
> +           gpios = <&pio 0 6 GPIO_ACTIVE_LOW>; /* PA6 */
> +           linux,input-type = <EV_KEY>;
> +           linux,code = <BTN_DPAD_UP>;
> +        };
> +
> +        keyDown {
> +            label = "D-Pad Down";
> +            gpios = <&pio 4 0 GPIO_ACTIVE_LOW>; /* PE0 */
> +            linux,input-type = <EV_KEY>;
> +            linux,code = <BTN_DPAD_DOWN>;
> +        };
> +
> +        keyLeft {
> +            label = "D-Pad left";
> +            gpios = <&pio 0 8 GPIO_ACTIVE_LOW>; /* PA8 */
> +            linux,input-type = <EV_KEY>;
> +            linux,code = <BTN_DPAD_LEFT>;
> +        };
> +
> +        keyRight {
> +            label = "D-Pad Right";
> +            gpios = <&pio 0 9 GPIO_ACTIVE_LOW>; /* PA9 */
> +            linux,input-type = <EV_KEY>;
> +            linux,code = <BTN_DPAD_RIGHT>;
> +        };
> +
> +        keyA {
> +            label = "Action-Pad A";
> +            gpios = <&pio 0 0 GPIO_ACTIVE_LOW>; /* PA0 */
> +            linux,input-type = <EV_KEY>;
> +            linux,code = <BTN_EAST>;
> +        };
> +
> +        keyB {
> +            label = "Action-Pad B";
> +            gpios = <&pio 0 1 GPIO_ACTIVE_LOW>; /* PA1 */
> +            linux,input-type = <EV_KEY>;
> +            linux,code = <BTN_SOUTH>;
> +        };
> +
> +        keyX {
> +            label = "Action-Pad X";
> +            gpios = <&pio 0 3 GPIO_ACTIVE_LOW>; /* PA3 */
> +            linux,input-type = <EV_KEY>;
> +            linux,code = <BTN_NORTH>;
> +        };
> +
> +        keyY {
> +            label = "Action Pad Y";
> +            gpios = <&pio 0 2 GPIO_ACTIVE_LOW>; /* PA2 */
> +            linux,input-type = <EV_KEY>;
> +            linux,code = <BTN_WEST>;
> +        };
> +
> +        keyStart {
> +            label = "Key Start";
> +            gpios = <&pio 0 4 GPIO_ACTIVE_LOW>; /* PA4 */
> +            linux,input-type = <EV_KEY>;
> +            linux,code = <BTN_START>;
> +        };
> +
> +        keySel {
> +            label = "Key Select";
> +            gpios = <&pio 0 5 GPIO_ACTIVE_LOW>; /* PA5 */
> +            linux,input-type = <EV_KEY>;
> +            linux,code = <BTN_SELECT>;
> +        };
> +
> +        keyL1 {
> +            label = "Key L1";
> +            gpios = <&pio 0 10 GPIO_ACTIVE_LOW>; /* PA10 */
> +            linux,input-type = <EV_KEY>;
> +            linux,code = <BTN_TL>;
> +        };
> +
> +        keyL2 {
> +            label = "Key L2";
> +            gpios = <&pio 0 11 GPIO_ACTIVE_LOW>; /* PA11 */
> +            linux,input-type = <EV_KEY>;
> +            linux,code = <BTN_TL2>;
> +        };
> +
> +        keyR1 {
> +            label = "Key R1";
> +            gpios = <&pio 0 12 GPIO_ACTIVE_LOW>; /* PA12 */
> +            linux,input-type = <EV_KEY>;
> +            linux,code = <BTN_TR>;
> +        };
> +
> +        keyR2 {
> +            label = "Key R2";
> +            gpios = <&pio 0 7 GPIO_ACTIVE_LOW>; /* PA7 */
> +            linux,input-type = <EV_KEY>;
> +            linux,code = <BTN_TR2>;
> +        };
> +
> +        keyMenu {
> +            label = "Key Menu";
> +            gpios = <&pio 4 3 GPIO_ACTIVE_LOW>; /* PE3 */
> +            linux,input-type = <EV_KEY>;
> +            linux,code = <BTN_MODE>;
> +        };
> +
> +        keyVol+ {
> +            label = "Key Volume Up";
> +            gpios = <&pio 4 1 GPIO_ACTIVE_LOW>; /* PE1 */
> +            linux,input-type = <EV_KEY>;
> +            linux,code = <KEY_VOLUMEUP>;
> +        };
> +
> +        keyVol- {
> +            label = "Key Volume Down";
> +            gpios = <&pio 4 2 GPIO_ACTIVE_LOW>; /* PE2 */
> +            linux,input-type = <EV_KEY>;
> +            linux,code = <KEY_VOLUMEDOWN>;
> +        };
> +    };
> +
> +    reg_vcc5v: vcc5v {
> +        compatible = "regulator-fixed";
> +        regulator-name = "vcc-5v";
> +        regulator-always-on;
> +        regulator-boot-on;

This last line is not be needed, since that regulator is not switchable
anyways.
Also can you please add a comment that this is the USB-C power input?

> +        regulator-min-microvolt = <5000000>;
> +        regulator-max-microvolt = <5000000>;
> +    };
> +
> +    vcc_5v0_usb: vcc-5v0-usb { /* needs gpios */

So what is this gpio? Please specify it in this node.

> +            compatible = "regulator-fixed";
> +            regulator-name = "vcc_5v0_usb";
> +            regulator-min-microvolt = <5000000>;
> +            regulator-max-microvolt = <5000000>;
> +            regulator-always-on;
> +            regulator-boot-on;

Assuming this is the regulator that provides the USB-VBUS power on
the USB-C connector, then we should not force it on. I think the boot
state is actually off, to allow power input from that socket, and to
enable USB-OTG functionality, for instance for FEL mode.
We should reference this regulator in the USB-PHY mode instead, then
it would be automatically enabled if needed, see below.

> +        };
> +
> +    reg_vcc3v3: vcc3v3 {

Is that just for the second SD card? You should name it then
accordingly.

> +        gpio = <&pio 4 4 GPIO_ACTIVE_HIGH>;

Please add the usual comment stating the GPIO name here.

> +        compatible = "regulator-fixed";
> +        regulator-name = "vcc-3v3";
> +        regulator-always-on;
> +        regulator-boot-on;

Again those two properties should not be here, unless this really
powers something essential, that we cannot control otherwise. But since
it's GPIO controlled, I doubt that.

> +        regulator-min-microvolt = <3300000>;
> +        regulator-max-microvolt = <3300000>;
> +
> +    };
> +
> +    reg_vcc1v8: vcc1v8 {

What is this regulator for? Is it really a separate fixed regulator, or
actually one rail from the AXP?

> +        compatible = "regulator-fixed";
> +        regulator-name = "vcc-1v8";
> +        regulator-always-on;

Regardless of the above, it looks like only being referenced by the
WiFi chip, and then it should not be always on, I guess?

> +        regulator-min-microvolt = <1800000>;
> +        regulator-max-microvolt = <1800000>;
> +    };
> +};
> +
> +&cpu0 {
> +    cpu-supply = <&reg_dcdc1>;
> +};
> +
> +&mmc0 {
> +    vmmc-supply = <&reg_vcc3v3>;
> +    disable-wp;
> +    cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;  /* PF6 */
> +    bus-width = <4>;
> +    status = "okay";
> +};
> +
> +&mmc2 {
> +    vmmc-supply = <&reg_vcc3v3>;
> +    vqmmc-supply = <&reg_aldo1>;
> +    cd-gpios = <&pio 4 22 GPIO_ACTIVE_LOW>; /* PE 22 */
> +    //cd-gpios = <&pio 4 16 GPIO_ACTIVE_LOW>;  /* PE16 */

So which one is it? If the former, please just remove that commented
line.

> +    bus-width = <4>;
> +    status = "okay";
> +};
> +
> +&ohci0 {
> +    status = "okay";
> +};
> +
> +&ehci1 {
> +    status = "okay";
> +};
> +
> +&i2c3 {
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&i2c3_ph_pins>;
> +    status = "okay";

What is this node for? Is there a device connected to this bus?

> +};
> +
> +&r_rsb {
> +   status = "okay";
> +
> +   axp717: pmic@3a3 {
> +       compatible = "x-powers,axp717";
> +       //interrupt-controller;
> +       //#interrupt-cells = <1>;

Regardless of whether the interrupts really work, you would need both
of those properties.

> +       reg = <0x3a3>;
> +       //interrupt-parent = <&r_intc>; /* test */
> +       //interrupts = <0 IRQ_TYPE_LEVEL_LOW>; /* test */

So this should be the NMI controller that Chris is looking at, right?
Anyway, please no commented lines without a good reason. And it looks
like it wouldn't be "r_intc" in any case.
If you want to drop support for now, but give a hint, please do this in
a normal free form comment.

> +
> +       vin1-supply = <&reg_vcc5v>;
> +       vin2-supply = <&reg_vcc5v>;
> +       vin3-supply = <&reg_vcc5v>;
> +       vin4-supply = <&reg_vcc5v>;
> +
> +       regulators {
> +            reg_dcdc1: dcdc1 {
> +                regulator-always-on;
> +                regulator-boot-on;

I don't think boot-on helps here, please just drop it. The same applies
to the other cases in this file. Unless you have a good reason ...

> +                regulator-min-microvolt = <810000>;
> +                regulator-max-microvolt = <1100000>;

I guess this needs to be increased slightly, to cover the BSP OPP
table entry for 1.5 GHz?

> +                regulator-name = "vdd-cpu";
> +            };
> +
> +            reg_dcdc2: dcdc2 {
> +                regulator-always-on;
> +                regulator-boot-on;
> +                regulator-min-microvolt = <940000>;
> +                regulator-max-microvolt = <940000>;
> +                regulator-name = "vdd-sys";
> +            };
> +
> +            reg_dcdc3: dcdc3 {
> +                regulator-always-on;
> +                regulator-boot-on;/* test */
> +                regulator-min-microvolt = <1100000>;
> +                regulator-max-microvolt = <1100000>;
> +                regulator-name = "vdd-dram";
> +            };
> +
> +            reg_aldo1: aldo1 {
> +                regulator-always-on;
> +                regulator-boot-on;/* test */

So is that the regulator exclusively used for the second SD card?
Then you wouldn't need the always-on and boot-on properties.
And then it should be referenced in the PIO's vcc-pc-supply.

> +                regulator-min-microvolt = <1800000>;
> +                regulator-max-microvolt = <3300000>;
> +                regulator-name = "vcc-sd2";
> +            };
> +
> +            reg_aldo2: aldo2 {

So I don't see any of those following regulators (minus cldo4)
referenced in the DTs, and with that given broad voltage range I don't
think those entries are useful anyway.
So can you remove/disable/comment all of them, and see if the device
still works, or what functionality goes missing?
If we don't need them, just remove the respective nodes altogether.

> +                regulator-always-on;/* test */
> +                regulator-boot-on;/* test */
> +                regulator-min-microvolt = <500000>;
> +                regulator-max-microvolt = <3500000>;
> +                regulator-name = "axp717-aldo2";
> +            };
> +
> +            reg_aldo3: aldo3 {
> +                regulator-always-on;
> +                regulator-boot-on;
> +                regulator-min-microvolt = <500000>;
> +                regulator-max-microvolt = <3500000>;
> +                regulator-name = "axp717-aldo3";
> +            };
> +
> +            reg_aldo4: aldo4 {
> +                regulator-always-on;
> +                regulator-boot-on;
> +                regulator-min-microvolt = <500000>;
> +                regulator-max-microvolt = <3500000>;
> +                regulator-name = "axp717-aldo4";
> +            };
> +
> +            reg_bldo1: bldo1 {
> +                regulator-always-on;/* test */
> +                regulator-boot-on;/* test */
> +                regulator-min-microvolt = <500000>;
> +                regulator-max-microvolt = <3500000>;
> +                regulator-name = "axp717-bldo1";
> +            };
> +
> +            reg_bldo2: bldo2 {
> +                regulator-always-on;
> +                regulator-boot-on;

I dimly remember that this rail was used by some critical device? Or
for one of the mandatory 1.8V supply pins on the SoC?
So this might be only one that needs to stay, I guess.

> +                regulator-min-microvolt = <1800000>;
> +                regulator-max-microvolt = <1800000>;
> +                regulator-name = "vcc-1v8";
> +            };
> +
> +            reg_bldo3: bldo3 {
> +                regulator-always-on;/* test */
> +                regulator-boot-on;/* test */
> +                regulator-min-microvolt = <500000>;
> +                regulator-max-microvolt = <3500000>;
> +                regulator-name = "axp717-bldo3";
> +            };
> +
> +            reg_bldo4: bldo4 {
> +                regulator-always-on;/* test */
> +                regulator-boot-on;/* test */
> +                regulator-min-microvolt = <500000>;
> +                regulator-max-microvolt = <3500000>;
> +                regulator-name = "axp717-bldo4";
> +            };
> +
> +            reg_cldo1: cldo1 {
> +                regulator-always-on;/* test */
> +                regulator-boot-on;/* test */
> +                regulator-min-microvolt = <500000>;
> +                regulator-max-microvolt = <3500000>;
> +                regulator-name = "axp717-cldo1";
> +            };
> +
> +            reg_cldo2: cldo2 {
> +                regulator-always-on;/* test */
> +                regulator-min-microvolt = <500000>;
> +                regulator-max-microvolt = <3500000>;
> +                regulator-name = "axp717-cldo2";
> +            };
> +
> +            reg_cldo3: cldo3 {
> +                regulator-always-on;
> +                regulator-min-microvolt = <500000>;
> +                regulator-max-microvolt = <3500000>;
> +                regulator-name = "axp717-cldo3";
> +            };
> +
> +            reg_cldo4: cldo4 {
> +                regulator-always-on;/* test */

If this is for the WiFi chip, it should not be always-on.

> +                regulator-min-microvolt = <3300000>;
> +                regulator-max-microvolt = <3300000>;
> +                regulator-name = "vcc-wifi";
> +            };
> +
> +            reg_boost: reg-boost {
> +                regulator-always-on;/* test */

So is that connected directly to the USB power pins? Or is there a
GPIO controlled switch in between?
If it's the latter, this rail should be referenced above in the
vcc_5v0_usb regulator, via the "vin-supply" property.

> +                regulator-min-microvolt = <5000000>;
> +                regulator-max-microvolt = <5000000>;
> +                regulator-name = "boost";
> +            };
> +
> +            reg_cpusldo: cpusldo {
> +                regulator-always-on;
> +                regulator-boot-on;

Same here, do we need this regulator at all, and does it really need to
be always-on?

> +                regulator-min-microvolt = <500000>;
> +                regulator-max-microvolt = <1400000>;
> +                regulator-name = "cpusldo";
> +            };
> +       };
> +   };
> +};
> +
> +&uart0 {
> +    pinctrl-names = "default";
> +    pinctrl-0 = <&uart0_ph_pins>;
> +    status = "okay";
> +};
> +
> +/* the AXP717 has USB type-C role switch functionality, to be implemented */
> +&usbotg {
> +    dr_mode = "host";   /* USB type-C receptable */
> +    status = "okay";
> +};
> +
> +&usbphy {
> +    status = "okay";

If there is a regulator controlling the USB VBUS pins, you would
reference it here:
	usb0_vbus-supply = <&vcc_5v0_usb>;

For the -H model with its second USB port it's usb1_vbus-supply,
respectively.


Cheers,
Andre	

> +};

