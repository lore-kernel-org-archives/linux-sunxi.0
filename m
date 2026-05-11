Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7AA375ACF
	for <linux-sunxi@lists.linux.dev>; Mon, 11 May 2026 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499882; cv=none; b=T/GgA7MYNx6FU6SltTeiiIXq/qok1rJsk4MlDvdIl+a/fBSFKHFwnY+i4rbWFZxeCXzSM8f49OrXe749BPXSfxVc5YWdxlTUm/iC6ZWUIcRE+VkSds50mHk51bKnv+GY8DwRPlNw5wYXlA8weGLoI7SfehXTh2/tN1KgeNVxge8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499882; c=relaxed/simple;
	bh=FmI0vsrvNe/6DVotkiJFm/j8bwILNB7Il9+Ec5W7eAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MaYwJeRqE6n4n/W3klYMoYmYWLECYjqCGva2qluVrlV3pTmHJ+BAv6TMreb7j3CKNN3wB7OeVqYtPRNTBtT0faLaBNgn3rH+0g434JKEwYnBdo6x1Q5DpMvwgW4qYzL7ZI9nsO6Hh37+QRp9/KhTNjTm90/XO9p1r06tVlVcjhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KSajZbul; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KSajZbul"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53240168F;
	Mon, 11 May 2026 04:44:31 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F2173F85F;
	Mon, 11 May 2026 04:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778499876; bh=FmI0vsrvNe/6DVotkiJFm/j8bwILNB7Il9+Ec5W7eAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KSajZbulVQ5l95tK7sCbWPu2J0qEnsao6CijBuDa3hmhTkUWZ1/l88v87M0HikQlU
	 ojKdQHEJZktE1yYM1Y3bVNcyP+AzZIbSbD+E2UxPKAOoJ52qCG0fVx74zgWn/+drxI
	 ueE0B5FxnPjzIX1icX9YxxIRM8jLazkMalSh8gno=
Message-ID: <2306dd3c-6362-40ee-8d9f-77f89be3a502@arm.com>
Date: Mon, 11 May 2026 13:44:31 +0200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 linux-sunxi@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alexander,

thanks for upstreaming the DTs!

On 5/10/26 22:16, Alexander Sverdlin wrote:
> Baijie Helper A133 board is a development board around Baijie A133 Core
> SBC. Features:
> 
> - 1/2/4GiB LPDDR4 DRAM
> - 8/16/32GiB eMMC
> - AXP707 PMIC
> - 2 USB 2.0 ports
> - MicroSD slot and on-board eMMC module
> - Gigabit Ethernet
> - Bluetooth
> - WiFi
> 
> Add initial support for both the Helper and Core boards, including UART,
> PMU, eMMC, USB, Ethernet.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> 
> Changelog:
> v2:
> - introduced baijie,helper-a133-core compatible for the Core (SoM) board
> 
>   arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>   .../dts/allwinner/sun50i-a133-baije-core.dtsi | 162 ++++++++++++++++++
>   .../allwinner/sun50i-a133-baijie-helper.dts   |  94 ++++++++++
>   3 files changed, 257 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
>   create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index d116864b6c2b..926dfa851100 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h64-remix-mini-pc.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a133-baijie-helper.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a133-liontron-h-a133l.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus-v1.2.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> new file mode 100644
> index 000000000000..65b094f30bf5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Arm Ltd.

Please put your own copyright here, even if that has been largely copied 
from an existing file.

> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-a100.dtsi"
> +#include "sun50i-a100-cpu-opp.dtsi"
> +
> +/{
> +	compatible = "baijie,helper-a133-core",
> +		     "allwinner,sun50i-a100";
> +
> +	aliases {
> +		serial1 = &uart1;	/* BT module */

Do we really need an alias for the BT UART? And is the BT module 
supported already? Then please add a child node to the UART node.

> +	};
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
> +&pio {

The order of those referenced nodes is alphabetically by the label name. 
So this one goes further down.

> +	vcc-pb-supply = <&reg_dcdc1>;
> +	vcc-pc-supply = <&reg_eldo1>;
> +	vcc-pd-supply = <&reg_dcdc1>;
> +	vcc-pe-supply = <&reg_dldo2>;
> +	vcc-pf-supply = <&reg_dcdc1>;
> +	vcc-pg-supply = <&reg_dldo1>;
> +	vcc-ph-supply = <&reg_dcdc1>;
> +};
> +

Isn't the WiFi/BT module on the SoM? Then please mention and enable MMC1 
here. Provide the child node for the WiFi chip, even if there is no 
upstream support in the kernel for it yet.

> +&mmc2 {
> +	vmmc-supply = <&reg_dcdc1>;
> +	vqmmc-supply = <&reg_eldo1>;
> +	cap-mmc-hw-reset;
> +	non-removable;
> +	bus-width = <8>;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	status = "okay";
> +};
> +
> +&r_i2c0 {
> +	status = "okay";
> +
> +	axp803: pmic@34 {
> +		compatible = "x-powers,axp803";
> +		reg = <0x34>;
> +		interrupt-parent = <&r_intc>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +#include "axp803.dtsi"
> +
> +&ac_power_supply {
> +	status = "okay";
> +};
> +
> +&reg_aldo1 {

What is aldo1 used for, actually? I don't see this referenced anywhere. 
I guess the kernel turns that off after booting?
If you have access to the schematic, please check that. If that's for 
some peripheral not yet supported, please note the user anyway, ideally 
by an explaining regulator-name, or by a comment. Also if it's used for 
any of the required SoC VDD pins. See the Liontron .dts for comparison.

> +	regulator-always-on;
> +	regulator-min-microvolt = <700000>;
> +	regulator-max-microvolt = <3300000>;

Please don't provide ranges here (those are in the driver already), the 
point of this entry is to set the voltage required by the board.  (And 
yes, the vendor DTBs alway get this wrong). Typically there are fixed 
requirements, so use the same value for min and max.
Same for the others below.

> +};
> +
> +&reg_aldo2 {
> +	regulator-always-on;

For always-on regulators we definitely need an explanation. Does the 
board stop booting if you remove this line?
Maybe it's for DRAM? Can you say what voltage it is, either from the 
reset default, or set by the bootloader?

> +	regulator-min-microvolt = <700000>;
> +	regulator-max-microvolt = <3300000>;
> +};
> +
> +&reg_aldo3 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <700000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-enable-ramp-delay = <1000>;
> +};
> +
> +&reg_dcdc1 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1600000>;
> +	regulator-max-microvolt = <3400000>;
> +	regulator-name = "vcc-3v3";
> +};
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <500000>;
> +	regulator-max-microvolt = <1300000>;

This one is an exception, because the voltage is to be adjusted at 
runtime. But the voltage range needs to be tighter, the A133 datasheet 
puts the valid VDD_CPU range between 810mV and 1200mV.
Compare to the Liontron dts file here.

> +	regulator-name = "vdd-cpu";
> +};
> +
> +&reg_dcdc3 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <500000>;
> +	regulator-max-microvolt = <1300000>;
> +};
> +
> +&reg_dcdc4 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <500000>;
> +	regulator-max-microvolt = <1300000>;
> +	regulator-name = "vdd-sys";
> +};
> +
> +&reg_dcdc5 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <800000>;
> +	regulator-max-microvolt = <1840000>;
> +	regulator-name = "vcc-dram";
> +};
> +
> +/* DCDC6 unused */
> +
> +&reg_dldo1 {
> +	regulator-min-microvolt = <700000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-enable-ramp-delay = <1000>;
> +};
> +
> +&reg_dldo2 {
> +	regulator-min-microvolt = <700000>;
> +	regulator-max-microvolt = <3400000>;
> +	regulator-enable-ramp-delay = <1000>;
> +};
> +
> +&reg_dldo3 {
> +	regulator-min-microvolt = <700000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-enable-ramp-delay = <1000>;
> +	regulator-name = "avdd-csi";
> +};
> +
> +&reg_dldo4 {
> +	regulator-min-microvolt = <700000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-enable-ramp-delay = <1000>;
> +};
> +
> +&reg_eldo1 {
> +	regulator-min-microvolt = <700000>;
> +	regulator-max-microvolt = <1900000>;
> +	regulator-enable-ramp-delay = <1000>;
> +};
> +
> +&reg_eldo2 {
> +	regulator-min-microvolt = <700000>;
> +	regulator-max-microvolt = <1900000>;
> +	regulator-enable-ramp-delay = <1000>;
> +	regulator-name = "dvdd-csi";
> +};
> +
> +/* ELDO3 unused */
> +
> +&reg_fldo1 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <700000>;
> +	regulator-max-microvolt = <1450000>;
> +	regulator-name = "vdd-cpus-usb";
> +};
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> new file mode 100644
> index 000000000000..ccbca5d0a40c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> @@ -0,0 +1,94 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Arm Ltd.

Your own copyright, please.

> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-a133-baije-core.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/{
> +	model = "HelperBoard A133";
> +	compatible = "baijie,helper-a133",
> +		     "baijie,helper-a133-core",
> +		     "allwinner,sun50i-a100";
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
> +		led {
> +			function = LED_FUNCTION_INDICATOR;
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&pio 7 13 GPIO_ACTIVE_LOW>;	/* PH13 */
> +		};
> +	};

I see quite some buttons on the board. I guess they are connected to 
GPIOs? Can you please describe them then, using gpio-keys? Look at
sun50i-h5-orangepi-pc2.dts for an example.

And you should provide a top level 5V regulator here, to be the root of 
the regulator tree. Look at reg_vcc5v in the Liontron .dts.

> +};
> +
> +&mmc0 {
> +	vmmc-supply = <&reg_dcdc1>;
> +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pb_pins>;
> +	status = "okay";
> +};
> +
> +&rgmii0_pins {
> +	drive-strength = <30>;
> +};
> +
> +&emac0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&rgmii0_pins>;
> +	phy-handle = <&eth_phy>;
> +	phy-mode = "rgmii-id";
> +	allwinner,rx-delay-ps = <200>;
> +	allwinner,tx-delay-ps = <200>;
> +	status = "okay";
> +};
> +
> +&mdio0 {
> +	reset-gpios = <&pio 7 11 GPIO_ACTIVE_LOW>;	/* PH11 */
> +	reset-delay-us = <10000>;
> +	reset-post-delay-us = <150000>;
> +
> +	eth_phy: ethernet-phy@1 {

The typical label here would be rgmii_phy. The node name is correct, though.

> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <1>;
> +	};
> +};
> +

So from the pictures I found online it looks like there is an USB-C port 
labelled "OTG", so can you please add an &usbotg reference here and 
describe that port.

> +&usbphy {

Are the two USB ports always powered?

And anyway, I see a *dual* USB-A socket on the pictures online, in 
addition to the USB-OTG port. So where does the third USB come from? The 
A133 only supports one host USB port plus the one OTG port. So is there 
an USB hub chip on the board?

> +	status = "okay";
> +};
> +
> +&ehci0 {

(and again, please order those nodes alphabetically)

Cheers,
Andre.

> +	status = "okay";
> +};
> +
> +&ohci0 {
> +	status = "okay";
> +};
> +
> +&ehci1 {
> +	status = "okay";
> +};
> +
> +&ohci1 {
> +	status = "okay";
> +};

