Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519EE1DFE0F
	for <linux-sunxi@lists.linux.dev>; Tue,  7 Jan 2025 12:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736251357; cv=none; b=jZExOwAEWzWqGC5sQ1vsW6rc0m968Qh6TTG9wvqJdiXVaAmaQYrlaLnM54KkZ9m6L+GcfgAQGvdIgimBk0SlFTsQKiTLTIzOXCorjsxZ5K6C+J9xMHkCO8lPcvD5P4cplSJsv7SCPTfR8TXs3Q905SIKKu97Of9zWc+XGj49nSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736251357; c=relaxed/simple;
	bh=dWtmv2k3lfF882wUS1JGTbSEt7rTz0aFneP2uBkCZq4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qKgk6OpRUEdgaGE82vIwMAye55CooOIf3A2DP+/MeOKRaKcgwiDMD3AANZ8FCgTF55pA2QYQzazSzrh/GDCPdyaMIf4U7YPSb4K/h8YCUXxZgB8Y4n7semLhhUBOLjxKZtW7ZLnnLatXYgUTjfMcO7Aoi6gCQvkTwNNna+N5us4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE211143D;
	Tue,  7 Jan 2025 04:03:01 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0C0C3F673;
	Tue,  7 Jan 2025 04:02:31 -0800 (PST)
Date: Tue, 7 Jan 2025 12:02:28 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] ARM: dts: sunxi: add support for NetCube Systems
 Kumquat
Message-ID: <20250107120228.503e0918@donnerap.manchester.arm.com>
In-Reply-To: <20250106190703.4015-5-lukas.schmid@netcube.li>
References: <20250106190703.4015-1-lukas.schmid@netcube.li>
	<20250106190703.4015-5-lukas.schmid@netcube.li>
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

On Mon,  6 Jan 2025 19:07:02 +0000
Lukas Schmid <lukas.schmid@netcube.li> wrote:

Hi,

> NetCube Systems Kumquat is a board based on the Allwinner V3s SoC,
> including:
> 
> - 64MB DDR2 included in SoC
> - 10/100 Mbps Ethernet
> - USB-C DRD
> - Audio Codec
> - Isolated CAN-FD
> - ESP32 over SDIO
> - 8MB SPI-NOR Flash for bootloader
> - I2C EEPROM for MAC addresses
> - SDIO Connector for eMMC or SD-Card
> - 8x 12/24V IOs, 4x normally open relays
> - DS3232 RTC
> - QWIIC connectors for external I2C devices
> 
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  arch/arm/boot/dts/allwinner/Makefile          |   2 +
>  .../allwinner/sun8i-v3s-netcube-kumquat.dts   | 274 ++++++++++++++++++
>  2 files changed, 276 insertions(+)
>  create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> 
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
> index 48666f73e638..d799ad153b37 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -199,6 +199,7 @@ DTC_FLAGS_sun8i-h3-nanopi-r1 := -@
>  DTC_FLAGS_sun8i-h3-orangepi-pc := -@
>  DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 := -@
>  DTC_FLAGS_sun8i-h3-orangepi-pc-plus := -@
> +DTC_FLAGS_sun8i-v3s-netcube-kumquat := -@
>  dtb-$(CONFIG_MACH_SUN8I) += \
>  	sun8i-a23-evb.dtb \
>  	sun8i-a23-gt90h-v4.dtb \
> @@ -261,6 +262,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>  	sun8i-v3s-anbernic-rg-nano.dtb \
>  	sun8i-v3s-licheepi-zero.dtb \
>  	sun8i-v3s-licheepi-zero-dock.dtb \
> +	sun8i-v3s-netcube-kumquat.dtb \
>  	sun8i-v40-bananapi-m2-berry.dtb
>  dtb-$(CONFIG_MACH_SUN9I) += \
>  	sun9i-a80-optimus.dtb \
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> new file mode 100644
> index 000000000000..b778bfa8e830
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> @@ -0,0 +1,274 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2025 Lukas Schmid <lukas.schmid@netcube.li>
> + */
> +
> +/dts-v1/;
> +#include "sun8i-v3s.dtsi"
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/{
> +	model = "NetCube Systems Kumquat";
> +	compatible = "netcube,kumquat", "allwinner,sun8i-v3s";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		ethernet0 = &emac;
> +		rtc0 = &ds3232;
> +		rtc1 = &rtc;

Please add a brief comment as to why you de-prioritise the internal RTC,
something like "not battery backed" or so.

> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	/* 40 MHz Crystal Oscillator on PCB */
> +	clk_can0: clock-can0 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency  = <40000000>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		autorepeat;
> +
> +		key-user {
> +			label = "GPIO Key User";
> +			linux,code = <KEY_PROG1>;
> +			gpios = <&pio 1 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PB2 */
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-heartbeat {
> +			gpios = <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
> +			linux,default-trigger = "heartbeat";
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_HEARTBEAT;
> +		};
> +
> +		led-mmc0-act {
> +			gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
> +			linux,default-trigger = "mmc0";
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_DISK;
> +		};
> +	};
> +
> +	/* EA3036C Switching 3 Channel Regulator - Channel 2 */
> +	reg_vcc3v3: regulator-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&reg_vcc5v0>;
> +	};
> +
> +	/* K7805-1000R3 Switching Regulator supplied from main 12/24V terminal block */
> +	reg_vcc5v0: regulator-5v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +};
> +
> +/* Exposed as the Flash/SD Header on the board */
> +&mmc0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_pins>;

The pinctrl properties are already in the .dtsi file, because there is only
one set of pins connected to this MMC controller. So please remove those
two lines here, as they are redundant.

> +	vmmc-supply = <&reg_vcc3v3>;
> +	bus-width = <4>;
> +	broken-cd;
> +	status = "okay";
> +};
> +
> +/* Connected to the on-board ESP32 */
> +&mmc1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc1_pins>;

Same here, only one set of pins, so they are in the .dtsi already.

> +	vmmc-supply = <&reg_vcc3v3>;
> +	bus-width = <4>;
> +	broken-cd;
> +	status = "okay";
> +};
> +
> +&usb_otg {

Please keep the nodes ordered by their node name alias, as this is what
the other .dts files do (ignoring some single node outliers).
The DTS coding style indeed says:
=================
3. When extending nodes in the board DTS via &label, the entries shall be
   ordered either alpha-numerically or by keeping the order from DTSI, ...
=================
but it continues:
=================
   ... where the choice depends on the subarchitecture.
=================

So in this case sunxi decided to order .dts label references by the label
name, because that's the only thing visible in this file.

> +	extcon = <&tusb320 0>;
> +	dr_mode = "otg";
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	usb0_id_det-gpios = <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
> +	status = "okay";
> +};
> +
> +&ehci {
> +	status = "okay";
> +};
> +
> +&ohci {
> +	status = "okay";
> +};
> +
> +&pio {
> +	vcc-pb-supply = <&reg_vcc3v3>;
> +	vcc-pc-supply = <&reg_vcc3v3>;
> +	vcc-pe-supply = <&reg_vcc3v3>;
> +	vcc-pf-supply = <&reg_vcc3v3>;
> +	vcc-pg-supply = <&reg_vcc3v3>;
> +
> +	gpio-line-names = "", "", "", "", // PA
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "CAN_nCS", "CAN_nINT", "USER_SW", "PB3", // PB
> +			  "USB_ID", "USBC_nINT", "I2C0_SCL", "I2C0_SDA",
> +			  "UART0_TX", "UART0_RX", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "SPI_MISO", "SPI_SCK", "FLASH_nCS", "SPI_MOSI", // PC
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "", // PD
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "Q12", "Q11", "Q10", "Q9", // PE
> +			  "LED_SYS0", "I1", "Q1", "Q2",
> +			  "I2", "I3", "Q3", "Q4",
> +			  "I4", "I5", "Q5", "Q6",
> +			  "I6", "I7", "Q7", "Q8",
> +			  "I8", "UART1_TXD", "UART1_RXD", "ESP_nRST",
> +			  "ESP_nBOOT", "", "", "",
> +			  "", "", "", "",
> +			  "SD_D1", "SD_D0", "SD_CLK", "SD_CMD", // PF
> +			  "SD_D3", "SD_D2", "LED_SYS1", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "ESP_CLK", "ESP_CMD", "ESP_D0", "ESP_D1", // PG
> +			  "ESP_D2", "ESP_D3", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "",
> +			  "", "", "", "";
> +};
> +
> +&codec {
> +	allwinner,audio-routing =
> +		"Headphone", "HP",
> +		"Headphone", "HPCOM",
> +		"MIC1", "Mic",
> +		"Mic", "HBIAS";
> +	status = "okay";
> +};
> +
> +/* Exposed as a USB-C connector with USB-Serial converter */
> +&uart0 {
> +	pinctrl-0 = <&uart0_pb_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +/* Connected to the Bootloader/Console of the ESP32 */
> +&uart1 {
> +	pinctrl-0 = <&uart1_pe_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	pinctrl-0 = <&i2c0_pins>;
> +	pinctrl-names = "default";

Those two properties are redundant, since the .dtsi already defines them.

> +	status = "okay";
> +
> +	ds3232: rtc@68 {
> +		compatible = "dallas,ds3232";
> +		reg = <0x68>;
> +	};
> +
> +	eeprom0: eeprom@50 {
> +		compatible = "atmel,24c02";		/* actually it's a 24AA02E48 */
> +		pagesize = <16>;
> +		read-only;
> +		reg = <0x50>;

Please move "reg" up, to appear after "compatible", to comply with the DTS
coding style. It makes it easier to read the DT and see the most important
infos first.

> +		vcc-supply = <&reg_vcc3v3>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		eth0_macaddress: macaddress@fa {
> +			reg = <0xfa 0x06>;
> +		};
> +	};
> +
> +	tusb320: typec@60 {
> +		compatible = "ti,tusb320";
> +		reg = <0x60>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +};
> +
> +&emac {
> +	allwinner,leds-active-low;
> +	nvmem-cells = <&eth0_macaddress>;		/* custom nvmem reference */
> +	nvmem-cell-names = "mac-address";		/* see ethernet-controller.yaml */

I don't think you need those comments.

> +	status = "okay";
> +};
> +
> +&spi0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	cs-gpios = <0>, <&pio 1 0 GPIO_ACTIVE_LOW>; /* PB0 */
> +	status = "okay";
> +
> +	flash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;

The DTS coding style says that compatible and reg should come first, then
common properties. So please move #address-cells and #size-cells down here.

Cheers,
Andre

> +		label = "firmware";
> +		spi-max-frequency = <40000000>;
> +	};
> +
> +	can@1 {
> +		compatible = "microchip,mcp2518fd";
> +		reg = <1>;
> +		clocks = <&clk_can0>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <1 1 IRQ_TYPE_LEVEL_LOW>;  /* PB1 */
> +		spi-max-frequency = <20000000>;
> +		vdd-supply = <&reg_vcc3v3>;
> +		xceiver-supply = <&reg_vcc3v3>;
> +	};
> +};

