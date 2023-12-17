Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7243D4AF6F
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Dec 2023 23:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AE6313D5;
	Sun, 17 Dec 2023 15:25:12 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDC6D3F64C;
	Sun, 17 Dec 2023 15:24:25 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/2] arm64: dts: allwinner: h618: add BananaPi M4 Berry board
Date: Sun, 17 Dec 2023 23:24:05 +0000
Message-Id: <20231217232405.302-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20231217232405.302-1-andre.przywara@arm.com>
References: <20231217232405.302-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BananaPi M4 Berry is a development board using the Allwinner H618
SoC. It comes with the following specs:
	- Allwinner H618 SoC (4 * Arm Cortex-A53 cores, 1MB L2 cache)
	- 2 GiB LPDDR4 DRAM
	- 8 GiB eMMC flash
	- AXP313a PMIC
	- Gigabit Ethernet, using RTL8211 PHY
	- RTL8821CU USB WiFi chip
	- HDMI port
	- 4 * USB 2.0 ports, via an on-board hub chip
	- microSD card slot
	- 3.5mm A/V port
	- power supply and USB-OTG via USB-C connector

Add a devicetree file describing the components that we already have
bindings for, that excludes audio and video at the moment.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../sun50i-h618-bananapi-m4-berry.dts         | 229 ++++++++++++++++++
 2 files changed, 230 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-bananapi-m4-berry.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 91d505b385de5..ed016688bb56f 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -42,5 +42,6 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-cb1-manta.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-pi.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-bananapi-m4-berry.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-bananapi-m4-berry.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-bananapi-m4-berry.dts
new file mode 100644
index 0000000000000..11d893a767d4e
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-bananapi-m4-berry.dts
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2023 Arm Ltd.
+ */
+
+/dts-v1/;
+
+#include "sun50i-h616.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "BananaPi M4 Berry";
+	compatible = "sinovoip,bananapi-m4-berry", "allwinner,sun50i-h618";
+
+	aliases {
+		ethernet0 = &emac0;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&pio 2 12 GPIO_ACTIVE_LOW>; /* PC12 */
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key-sw4 {
+			label = "sw3";
+			linux,code = <BTN_0>;
+			gpios = <&pio 2 7 GPIO_ACTIVE_LOW>;	/* PC7 */
+		};
+	};
+
+	reg_vcc5v: vcc5v {
+		/* board wide 5V supply directly from the USB-C socket */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	reg_usb_vbus: regulator-usb-vbus {
+		/* separate discrete regulator for the USB ports */
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_vcc5v>;
+	};
+
+	reg_3v3: regulator-3v3 {
+		/* separate discrete regulator for WiFi and Ethernet PHY */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_vcc5v>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+/* Connected to an on-board RTL8821CU USB WiFi chip. */
+&ehci1 {
+	status = "okay";
+};
+
+/* on unpopulated pins */
+&ehci2 {
+	status = "disabled";
+};
+
+/* Connected to an on-board FE1.1s USB hub chip, supplying 4 USB-A ports. */
+&ehci3 {
+	status = "okay";
+};
+
+&emac0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ext_rgmii_pins>;
+	phy-mode = "rgmii";
+	phy-handle = <&ext_rgmii_phy>;
+	phy-supply = <&reg_3v3>;
+	allwinner,rx-delay-ps = <3100>;
+	allwinner,tx-delay-ps = <700>;
+	status = "okay";
+};
+
+&ir {
+	status = "okay";
+};
+
+&mdio0 {
+	ext_rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+		reset-gpios = <&pio 8 16 GPIO_ACTIVE_LOW>;	/* PI16 */
+	};
+};
+
+&mmc0 {
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
+	vmmc-supply = <&reg_dldo1>;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&mmc2 {
+	vmmc-supply = <&reg_dldo1>;
+	vqmmc-supply = <&reg_aldo1>;
+	bus-width = <8>;
+	non-removable;
+	cap-mmc-hw-reset;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	status = "okay";
+};
+
+/* USB ports 1 and 3 connect to onboard devices that are high-speed only. */
+
+/* on unpopulated pins */
+&ohci2 {
+	status = "disabled";
+};
+
+&pio {
+	vcc-pc-supply = <&reg_aldo1>;
+	vcc-pf-supply = <&reg_dldo1>;
+	vcc-pg-supply = <&reg_dldo1>;
+	vcc-ph-supply = <&reg_dldo1>;
+	vcc-pi-supply = <&reg_dldo1>;
+};
+
+&r_i2c {
+	status = "okay";
+
+	axp313: pmic@36 {
+		compatible = "x-powers,axp313a";
+		reg = <0x36>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupt-parent = <&pio>;
+
+		vin1-supply = <&reg_vcc5v>;
+		vin2-supply = <&reg_vcc5v>;
+		vin3-supply = <&reg_vcc5v>;
+
+		regulators {
+			reg_aldo1: aldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-1v8-pll";
+			};
+
+			reg_dldo1: dldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-3v3-io";
+			};
+
+			reg_dcdc1: dcdc1 {
+				regulator-always-on;
+				regulator-min-microvolt = <810000>;
+				regulator-max-microvolt = <990000>;
+				regulator-name = "vdd-gpu-sys";
+			};
+
+			reg_dcdc2: dcdc2 {
+				regulator-always-on;
+				regulator-min-microvolt = <810000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-name = "vdd-cpu";
+			};
+
+			reg_dcdc3: dcdc3 {
+				regulator-always-on;
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-name = "vdd-dram";
+			};
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_ph_pins>;
+	status = "okay";
+};
+
+&usbotg {
+	/*
+	 * PHY0 pins are connected to a USB-C socket, but a role switch is not
+	 * implemented: both CC pins are pulled to GND via a 5.1K resistor.
+	 * The VBUS pins power the device, so a fixed peripheral mode
+	 * is the best choice.
+	 * The board can be powered via GPIOs, in this case port0 *can*
+	 * act as a host (with a cable/adapter ignoring CC), as VBUS is
+	 * then provided by the GPIOs. Any user of this setup would
+	 * need to adjust the DT accordingly: dr_mode set to "host",
+	 * enabling OHCI0 and EHCI0.
+	 */
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usbphy {
+	usb3_vbus-supply = <&reg_usb_vbus>;
+	status = "okay";
+};
-- 
2.35.8

