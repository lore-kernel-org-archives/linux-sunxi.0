Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FEC1B5A0
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Feb 2024 10:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707041475; cv=none; b=Hj9u2h3FNC5tUD/uH9O+hTP0zzGJcCdAuLHHeBe40xtky46z8G1N+UCDIf1AtGqs/ruGkxLVW3Zf0+RYGXLK10kFyFr04WnKWKi88hBnddNpYdhJT9333NAiQvQxigF8jiR8YhfFyeZg2x5I53BRF9l1iU/+osm7MLaX9PCmyRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707041475; c=relaxed/simple;
	bh=eftPLx5ojm++AeJKCxFRs8jrIZtJmoYFUE7Jk1L7Dag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pczs8kY8x7/Od9QxuPspnlL8s7S9cAOiTQdf+QCS4vzSsjA9YMEVA2Znn2oQJB/BK6CSBYlcWwr7E71VhlbRq4bdRuTRQqsxL5ChUNW1Vnc1DmLSQIFk9G4nhPRunQcPpgsaE5YbxbUHBHkm6J07lcfcryD4ftg+1T3k2sMvogU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DCD41FB;
	Sun,  4 Feb 2024 02:11:55 -0800 (PST)
Received: from e110479.fosdem.net (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A67C83F762;
	Sun,  4 Feb 2024 02:11:10 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 2/2] arm64: dts: allwinner: h618: add BananaPi M4 Berry board
Date: Sun,  4 Feb 2024 11:10:54 +0100
Message-Id: <20240204101054.152012-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240204101054.152012-1-andre.przywara@arm.com>
References: <20240204101054.152012-1-andre.przywara@arm.com>
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
 .../sun50i-h618-bananapi-m4-berry.dts         | 223 ++++++++++++++++++
 2 files changed, 224 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-bananapi-m4-berry.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 2db3b15ad09f..1c5c204a109b 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -43,5 +43,6 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-cb1-manta.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-pi.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-x96-mate.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-bananapi-m4-berry.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-orangepi-zero3.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h618-transpeed-8k618-t.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-bananapi-m4-berry.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-bananapi-m4-berry.dts
new file mode 100644
index 000000000000..a3f8ff75db42
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-bananapi-m4-berry.dts
@@ -0,0 +1,223 @@
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
+		key-sw3 {
+			label = "sw3";
+			linux,code = <BTN_0>;
+			gpios = <&pio 2 7 GPIO_ACTIVE_LOW>;	/* PC7 */
+		};
+	};
+
+	reg_vcc5v: regulator-5v {
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
+/* EHCI2 is on unpopulated pins */
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
+/* OHCI2 is on unpopulated pins */
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
2.25.1

