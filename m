Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8D91917F1
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Jan 2025 20:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738009323; cv=none; b=JIxwHyg8dv5Up+E45Qq2InpJ7unhu7E4pR1l0qf2qcKcwVee1PCJzNnnrr+WtM2fntFhD4CxKa5pvnQqo8mYB+MW9c4xYDpfNYQKAMKNxIcSNbREBTWq+uF4m5xYn16u5r2kfa1WpqOuuNINqVfhywf2YX4CrGJ58Cx3OiPTkMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738009323; c=relaxed/simple;
	bh=u3aZn0KHf2AF5UztR4SnXDCQgITElEbs9Imq2Y++paQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pkD7O+lo2MN6i53TLiSL7UAA/TLQjsut9686gQYtS1Io44HoV4pKXPR7mbusoefKaGW5gkZAYdsBta70w+74TojlK0PNB5fpZdiS9x+NKoEFwzUEhhsYaDqICVDuFgU+xr+46DeaJvMQog5/clSWjQq43T33G8o97GGSojxjy6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=D+z1M8Ia; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="D+z1M8Ia"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=aY5JeHYJ5UgvGFFLVKuLxjQPnG18D87SgziU66MY8TA=;
	b=D+z1M8Ian63MtZgmKtfkYiXcQvetpC/YxgTGrorIXgxjCGKcdgPSY8iLlA8qGTsJmjUmx6mabbczuWgqgjSoAwaQqItPZVyDY9GS9vVHoREqjqein3Ct9AhNmkSZ9Yazz6pGgNm46HShSbYzQGhur3G9kwj3xvZTR3OvltKGHiA=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Mon, 27 Jan 2025 21:21:41 +0100
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
Subject: [PATCH v7 4/4] ARM: dts: sunxi: add support for NetCube Systems Kumquat
Date: Mon, 27 Jan 2025 21:21:25 +0100
Message-Id: <20250127202127.971172-5-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250127202127.971172-1-lukas.schmid@netcube.li>
References: <20250127202127.971172-1-lukas.schmid@netcube.li>
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
 .../allwinner/sun8i-v3s-netcube-kumquat.dts   | 278 ++++++++++++++++++
 2 files changed, 280 insertions(+)
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
index 000000000000..e4e98ddfbd96
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
@@ -0,0 +1,278 @@
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
+		rtc1 = &rtc; /* not battery backed */
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	/* 40 MHz Crystal Oscillator on PCB */
+	clk_can0: clock-can0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency  = <40000000>;
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
+	leds {
+		compatible = "gpio-leds";
+
+		led-heartbeat {
+			gpios = <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
+			linux,default-trigger = "heartbeat";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_HEARTBEAT;
+		};
+
+		led-mmc0-act {
+			gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
+			linux,default-trigger = "mmc0";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DISK;
+		};
+	};
+
+	/* EA3036C Switching 3 Channel Regulator - Channel 2 */
+	reg_vcc3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_vcc5v0>;
+	};
+
+	/* K7805-1000R3 Switching Regulator supplied from main 12/24V terminal block */
+	reg_vcc5v0: regulator-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
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
+&ehci {
+	status = "okay";
+};
+
+&emac {
+	allwinner,leds-active-low;
+	nvmem-cells = <&eth0_macaddress>;
+	nvmem-cell-names = "mac-address";
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	ds3232: rtc@68 {
+		compatible = "dallas,ds3232";
+		reg = <0x68>;
+	};
+
+	eeprom0: eeprom@50 {
+		compatible = "atmel,24c02";		/* actually it's a 24AA02E48 */
+		reg = <0x50>;
+		pagesize = <16>;
+		read-only;
+		vcc-supply = <&reg_vcc3v3>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		eth0_macaddress: macaddress@fa {
+			reg = <0xfa 0x06>;
+		};
+	};
+
+	tusb320: typec@60 {
+		compatible = "ti,tusb320";
+		reg = <0x60>;
+		interrupt-parent = <&pio>;
+		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+/* Exposed as the Flash/SD Header on the board */
+&mmc0 {
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	broken-cd;
+	status = "okay";
+};
+
+/* Connected to the on-board ESP32 */
+&mmc1 {
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	broken-cd;
+	status = "okay";
+};
+
+&ohci {
+	status = "okay";
+};
+
+/* Disable external 32k osc as it is broken on current revision */
+&osc32k {
+	status = "disabled";
+};
+
+&pio {
+	vcc-pb-supply = <&reg_vcc3v3>;
+	vcc-pc-supply = <&reg_vcc3v3>;
+	vcc-pe-supply = <&reg_vcc3v3>;
+	vcc-pf-supply = <&reg_vcc3v3>;
+	vcc-pg-supply = <&reg_vcc3v3>;
+
+	gpio-line-names = "", "", "", "", // PA
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "CAN_nCS", "CAN_nINT", "USER_SW", "PB3", // PB
+			  "USB_ID", "USBC_nINT", "I2C0_SCL", "I2C0_SDA",
+			  "UART0_TX", "UART0_RX", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "SPI_MISO", "SPI_SCK", "FLASH_nCS", "SPI_MOSI", // PC
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "", // PD
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "Q12", "Q11", "Q10", "Q9", // PE
+			  "LED_SYS0", "I1", "Q1", "Q2",
+			  "I2", "I3", "Q3", "Q4",
+			  "I4", "I5", "Q5", "Q6",
+			  "I6", "I7", "Q7", "Q8",
+			  "I8", "UART1_TXD", "UART1_RXD", "ESP_nRST",
+			  "ESP_nBOOT", "", "", "",
+			  "", "", "", "",
+			  "SD_D1", "SD_D0", "SD_CLK", "SD_CMD", // PF
+			  "SD_D3", "SD_D2", "LED_SYS1", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "ESP_CLK", "ESP_CMD", "ESP_D0", "ESP_D1", // PG
+			  "ESP_D2", "ESP_D3", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+/* Disable external 32k osc as it is broken on current revision */
+&rtc {
+	/delete-property/ clocks;
+};
+
+/* Exposed as a USB-C connector with USB-Serial converter */
+&uart0 {
+	pinctrl-0 = <&uart0_pb_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/* Connected to the Bootloader/Console of the ESP32 */
+&uart1 {
+	pinctrl-0 = <&uart1_pe_pins>;
+	pinctrl-names = "default";
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
+&spi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cs-gpios = <0>, <&pio 1 0 GPIO_ACTIVE_LOW>; /* PB0 */
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		label = "firmware";
+		spi-max-frequency = <40000000>;
+	};
+
+	can@1 {
+		compatible = "microchip,mcp2518fd";
+		reg = <1>;
+		clocks = <&clk_can0>;
+		interrupt-parent = <&pio>;
+		interrupts = <1 1 IRQ_TYPE_LEVEL_LOW>;  /* PB1 */
+		spi-max-frequency = <20000000>;
+		vdd-supply = <&reg_vcc3v3>;
+		xceiver-supply = <&reg_vcc3v3>;
+	};
+};
-- 
2.39.5


