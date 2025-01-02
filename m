Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F99156231
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jan 2025 17:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735840477; cv=none; b=GkR6YxmczJTcprLOCxU0CUTJhDk/cuFptNUjPbo9+tG2psYzQ2HzOkI9caF+qv+QGdb41Lyt4pHTAit+wETU4UHOryhYxZiCDzkx5EAHfYti6ObSlQqqgSgntHUhOFuGV/x5wjyOw+3mUKqz3qt9M6xzaPtIvu/Tl5LizVOae+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735840477; c=relaxed/simple;
	bh=6c0hhHZDa5GbhtjIm06tzNnnK4Cv26KnhYEWjid6jDU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kvphG3XV27jV5zvqgl+cJfOua9CRN0p6WxM0eat98Ny1XH3NnNg5gPo9IMSs1/KEdydaOA/VRTyIwvK79JyZ7OiYJFuDYDq2UvQFzfXl5OcUMoFUPQ7X7BYNi4O+MVHfzStY8EdQgLrXsPe/Qdq991xic1VqkKkPxligFuyeRZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C70B011FB;
	Thu,  2 Jan 2025 09:55:01 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BA45C3F59E;
	Thu,  2 Jan 2025 09:54:31 -0800 (PST)
Date: Thu, 2 Jan 2025 17:54:28 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: sunxi: add support for NetCube Systems
 Kumquat
Message-ID: <20250102175428.27005c4a@donnerap.manchester.arm.com>
In-Reply-To: <20250102171424.3644-1-lukas.schmid@netcube.li>
References: <32b5c286-9457-4b93-a93f-c8aff356ec10@kernel.org>
	<20250102171424.3644-1-lukas.schmid@netcube.li>
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

On Thu,  2 Jan 2025 17:14:21 +0000
Lukas Schmid <lukas.schmid@netcube.li> wrote:

Hi,

> NetCube Systems Kumquat is a board based on the Allwinner V3s SoC,
> including:

Please do not just resend single patches out of a series, and always
update the patch version in the subject - your previous series should have
been v2 already, so that one here would would be:
[PATCH v3 3/3] ARM: dts: sunxi: ....
Also please summarise your changes at an appropriate location, for
individual patches after the "three dashes" (after your Signed-off-by:
below), or for all patches in a cover letter. Git can partly take care of
those things for you:

$ git format-patch -3 -v3 --cover-letter

You will need to "just" fill the generated cover letter file, and send all
of the files again.

In general it's customary to wait for at least a day (ideally more)
before sending a new revision, to allow people from other time zones to
comment.

So in this case here I think you should send a v3 of all patches tomorrow
or on the weekend, that would make it obvious that the other patches are now obsolete.
Also make sure to include Krzysztof's ACKs for patch 1 and 2.

Documentation/process/submitting-patches.rst has some more tips.

Cheers,
Andre


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
>  .../allwinner/sun8i-v3s-netcube-kumquat.dts   | 286 ++++++++++++++++++
>  arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    |   6 +
>  3 files changed, 294 insertions(+)
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
> index 000000000000..e3e34d904c23
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
> @@ -0,0 +1,286 @@
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
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
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
> +	/* K7805-1000R3 Switching Regulator supplied from main 12/24V terminal block */
> +	reg_vcc5v0: regulator-5v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
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
> +	/* XC6206-3.0 Linear Regualtor */
> +	reg_vcc3v0: regulator-3v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v0";
> +		regulator-min-microvolt = <3000000>;
> +		regulator-max-microvolt = <3000000>;
> +		vin-supply = <&reg_vcc3v3>;
> +	};
> +
> +	/* 40 MHz Crystal Oscillator on PCB */
> +	clk_can0: clock-can0 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency  = <40000000>;
> +	};
> +};
> +
> +&mmc0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_pins>;
> +	vmmc-supply = <&reg_vcc3v3>;
> +	bus-width = <4>;
> +	broken-cd;
> +	status = "okay";
> +};
> +
> +&mmc1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc1_pins>;
> +	vmmc-supply = <&reg_vcc3v3>;
> +	bus-width = <4>;
> +	broken-cd;
> +	status = "okay";
> +};
> +
> +&usb_otg {
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
> +&lradc {
> +	vref-supply = <&reg_vcc3v0>;
> +	status = "okay";
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
> +&uart0 {
> +	pinctrl-0 = <&uart0_pb_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	pinctrl-0 = <&uart1_pe_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	pinctrl-0 = <&i2c0_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	eeprom0: eeprom@50 {
> +		compatible = "atmel,24c02";		/* actually it's a 24AA02E48 */
> +		pagesize = <16>;
> +		read-only;
> +		reg = <0x50>;
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
> +
> +	ds3232: rtc@68 {
> +		compatible = "dallas,ds3232";
> +		reg = <0x68>;
> +	};
> +};
> +
> +&emac {
> +	allwinner,leds-active-low;
> +	nvmem-cells = <&eth0_macaddress>;		/* custom nvmem reference */
> +	nvmem-cell-names = "mac-address";		/* see ethernet-controller.yaml */
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi0_pins>;
> +	cs-gpios = <0>, <&pio 1 0 GPIO_ACTIVE_LOW>; /* PB0 */
> +	status = "okay";
> +
> +	flash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
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
> +
> +&pio {
> +	vcc-pb-supply = <&reg_vcc3v3>;
> +	vcc-pc-supply = <&reg_vcc3v3>;
> +	vcc-pe-supply = <&reg_vcc3v3>;
> +	vcc-pf-supply = <&reg_vcc3v3>;
> +	vcc-pg-supply = <&reg_vcc3v3>;
> +
> +	gpio-reserved-ranges = <0 32>, <42 22>, <68 28>, <96 32>, <153 7>, <167 25>, <198 26>;
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
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> index 9e13c2aa8911..f909b1d4dbca 100644
> --- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> +++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
> @@ -416,6 +416,12 @@ uart0_pb_pins: uart0-pb-pins {
>  				function = "uart0";
>  			};
>  
> +			/omit-if-no-ref/
> +			uart1_pe_pins: uart1-pe-pins {
> +				pins = "PE21", "PE22";
> +				function = "uart1";
> +			};
> +
>  			uart2_pins: uart2-pins {
>  				pins = "PB0", "PB1";
>  				function = "uart2";

