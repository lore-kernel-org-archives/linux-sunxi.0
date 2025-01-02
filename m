Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ADFBA20
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jan 2025 15:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735830577; cv=none; b=YPNWDPu0vC3Y1eOSA4ffprb8P9CV7Df7be/WNCcery/A4o+8rjWNVNfvIsPdq7JDPaJ5721PSwAkQaM3AFY1v1BtOVkKjem0q6MbMDmgR/ITj4JNSrwCCs4FuA/TKqfasOwueQqmbJiEls1wRbL5UJ4CUu1YHZwhHL/HHx+C0YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735830577; c=relaxed/simple;
	bh=aHlJuHU30xEo5JEp5n9yoarAg+04yRvX6nHOSZglJ5A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hvGLxxeghXzGs/7LuSXx0Jg67g3J4HF1A2S5/J+NGO6pBv2oPE3FXETbYR/oH9lapQfT/JZ0P6de8fxf1S9waMDYhIZT9q/qEkzHXi0DSOcj4TzLEuaK5mtVFVlcqhMX6SuUV++b6EX50+rzssTTwlaMEiRzeGFGVYrI1v04J6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=nWSrsXi6; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="nWSrsXi6"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=B4z0aNeL7B3IDW9F9DKA6MPIVVAB9dBwvCeoTc7OFV4=;
	b=nWSrsXi6NpZIrByL9HnKetxEb0S6DDXKV2ezesd/qM/l6zhj+WiJcoRHf4Dhb32ql71ff++Ilwy9lixailkWko3zTRxK6MloFydSEQzMnBjsElFZwVy21uqrGexoFY0lHqF4ZCcE1MKvH7fASMJ8PxU4P6nsXkiR4NPhwdr0jwM=
Received: from 854af3ed5e24.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Thu, 2 Jan 2025 16:09:31 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: sunxi: add support for NetCube Systems Kumquat
Date: Thu,  2 Jan 2025 15:05:06 +0000
Message-Id: <20250102150508.3581-3-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250102150508.3581-1-lukas.schmid@netcube.li>
References: <20250102150508.3581-1-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NetCube Systems Kumquat is a board based on the Allwinner V3s SoC,
including:

- 64MB DDR2 included in SoC
- 10/100 Mbps Ethernet
- USB-C DRD
- Audio Codec
- Isolated CAN-FD
- ESP32 over SDIO
- 8MB SPI-NOR Flash for bootloader
- I2C EEPROM for MAC addresses
- SDIO Connector for eMMC or SD-Card
- 8x 12/24V IOs, 4x normally open relays
- DS3232 RTC
- QWIIC connectors for external I2C devices

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 arch/arm/boot/dts/allwinner/Makefile          |   2 +
 .../allwinner/sun8i-v3s-netcube-kumquat.dts   | 237 ++++++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    |   6 +
 3 files changed, 245 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index 48666f73e638..d799ad153b37 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -199,6 +199,7 @@ DTC_FLAGS_sun8i-h3-nanopi-r1 := -@
 DTC_FLAGS_sun8i-h3-orangepi-pc := -@
 DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 := -@
 DTC_FLAGS_sun8i-h3-orangepi-pc-plus := -@
+DTC_FLAGS_sun8i-v3s-netcube-kumquat := -@
 dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-a23-evb.dtb \
 	sun8i-a23-gt90h-v4.dtb \
@@ -261,6 +262,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-v3s-anbernic-rg-nano.dtb \
 	sun8i-v3s-licheepi-zero.dtb \
 	sun8i-v3s-licheepi-zero-dock.dtb \
+	sun8i-v3s-netcube-kumquat.dtb \
 	sun8i-v40-bananapi-m2-berry.dtb
 dtb-$(CONFIG_MACH_SUN9I) += \
 	sun9i-a80-optimus.dtb \
diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
new file mode 100644
index 000000000000..7fe83d91adee
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2025 Lukas Schmid <lukas.schmid@netcube.li>
+ */
+
+/dts-v1/;
+#include "sun8i-v3s.dtsi"
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/gpio/gpio.h>
+
+/{
+	model = "NetCube Systems Kumquat";
+	compatible = "netcube,kumquat", "allwinner,sun8i-v3s";
+
+	aliases {
+		serial0 = &uart0;
+		ethernet0 = &emac;
+		rtc0 = &ds3232;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		heartbeat_led {
+			gpios = <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
+			linux,default-trigger = "heartbeat";
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		mmc0_act_led {
+			gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
+			linux,default-trigger = "mmc0";
+			function = LED_FUNCTION_DISK;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		key-user {
+			label = "GPIO Key User";
+			linux,code = <KEY_PROG1>;
+			gpios = <&pio 1 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PB2 */
+		};
+	};
+
+	/* K7805-1000R3 Switching Regulator supplied from main 12/24V terminal block */
+	reg_vcc5v0: vcc5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	/* EA3036C Switching 3 Channel Regulator - Channel 2 */
+	reg_vcc3v3: vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_vcc5v0>;
+	};
+
+	/* XC6206-3.0 Linear Regualtor */
+	reg_vcc3v0: vcc3v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v0";
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+		vin-supply = <&reg_vcc3v3>;
+	};
+
+	/* 40 MHz Crystal Oscillator on PCB */
+	can0_osc: can0_osc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency  = <40000000>;
+	};
+};
+
+&mmc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_pins>;
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	broken-cd;
+	status = "okay";
+};
+
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	broken-cd;
+	status = "okay";
+};
+
+&usb_otg {
+	extcon = <&tusb320 0>;
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbphy {
+	usb0_id_det-gpios = <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
+	status = "okay";
+};
+
+&ehci {
+	status = "okay";
+};
+
+&ohci {
+	status = "okay";
+};
+
+&lradc {
+	vref-supply = <&reg_vcc3v0>;
+	status = "okay";
+};
+
+&codec {
+	allwinner,audio-routing =
+		"Headphone", "HP",
+		"Headphone", "HPCOM",
+		"MIC1", "Mic",
+		"Mic", "HBIAS";
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_pb_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-0 = <&uart1_pe_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	eeprom0: eeprom@50 {
+		compatible = "atmel,24c02";		/* actually it's a 24AA02E48 */
+		pagesize = <16>;
+		read-only;
+		reg = <0x50>;
+		vcc-supply = <&reg_vcc3v3>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		eth0_macaddress: eth0_macaddress@FA {
+			reg = <0xFA 0x06>;
+		};
+	};
+
+	tusb320: tusb320@60 {
+		compatible = "ti,tusb320";
+		reg = <0x60>;
+		interrupt-parent = <&pio>;
+		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	ds3232: rtc@68 {
+		compatible = "dallas,ds3232";
+		reg = <0x68>;
+	};
+};
+
+&emac {
+	allwinner,leds-active-low;
+	nvmem-cells = <&eth0_macaddress>;		/* custom nvmem reference */
+	nvmem-cell-names = "mac-address";		/* see ethernet-controller.yaml */
+	status = "okay";
+};
+
+&spi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pins>;
+	cs-gpios = <0>, <&pio 1 0 GPIO_ACTIVE_LOW>; /* PB0 */
+	status = "okay";
+
+	flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0>;
+		compatible = "jedec,spi-nor";
+		label = "firmware";
+		spi-max-frequency = <40000000>;
+	};
+
+	can@1 {
+		compatible = "microchip,mcp2518fd";
+		reg = <1>;
+		clocks = <&can0_osc>;
+		spi-max-frequency = <20000000>;
+		interrupt-parent = <&pio>;
+		interrupts = <1 1 IRQ_TYPE_LEVEL_LOW>;  /* PB1 */
+		vdd-supply = <&reg_vcc3v3>;
+		xceiver-supply = <&reg_vcc3v3>;
+	};
+};
+
+&pio {
+	vcc-pb-supply = <&reg_vcc3v3>;
+	vcc-pc-supply = <&reg_vcc3v3>;
+	vcc-pe-supply = <&reg_vcc3v3>;
+	vcc-pf-supply = <&reg_vcc3v3>;
+	vcc-pg-supply = <&reg_vcc3v3>;
+
+	gpio-reserved-ranges = <0 32>, <42 22>, <68 28>, <96 32>, <153 7>, <167 25>, <198 26>;
+	gpio-line-names = "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", //PA
+						"CAN_nCS", "CAN_nINT", "USER_SW", "PB3", "USB_ID", "USBC_nINT", "I2C0_SCL", "I2C0_SDA", "UART0_TX", "UART0_RX", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", //PB
+						"SPI_MISO", "SPI_SCK", "FLASH_nCS", "SPI_MOSI", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", //PC
+						"", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", //PD
+						"Q12", "Q11", "Q10", "Q9", "LED_SYS0", "I1", "Q1", "Q2", "I2", "I3", "Q3", "Q4", "I4", "I5", "Q5", "Q6", "I6", "I7", "Q7", "Q8", "I8", "UART1_TXD", "UART1_RXD", "ESP_nRST", "ESP_nBOOT", "", "", "", "", "", "", "", //PE
+						"SD_D1", "SD_D0", "SD_CLK", "SD_CMD", "SD_D3", "SD_D2", "LED_SYS1", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", //PF
+						"ESP_CLK", "ESP_CMD", "ESP_D0", "ESP_D1", "ESP_D2", "ESP_D3", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""; //PG
+};
diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index 9e13c2aa8911..c9689c0f65d7 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -416,6 +416,12 @@ uart0_pb_pins: uart0-pb-pins {
 				function = "uart0";
 			};
 
+			/omit-if-no-ref/
+			uart1_pe_pins: uart1_pe_pins {
+				pins = "PE21", "PE22";
+				function = "uart1";
+			};
+
 			uart2_pins: uart2-pins {
 				pins = "PB0", "PB1";
 				function = "uart2";
-- 
2.47.1


