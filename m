Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75182FB6
	for <linux-sunxi@lists.linux.dev>; Thu, 27 May 2021 00:45:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7107111D4;
	Wed, 26 May 2021 17:45:02 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECD113F719;
	Wed, 26 May 2021 17:45:00 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/3] arm: dts: sunxi: h5: Update DT files
Date: Thu, 27 May 2021 01:44:37 +0100
Message-Id: <20210527004438.19783-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210527004438.19783-1-andre.przywara@arm.com>
References: <20210527004438.19783-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Update the H5 DT files from the Linux 5.12 release.

The changes don't affect U-Boot at all, but fix Gigabit Ethernet when
this DT is passed on to the Linux kernel. It also introduces DVFS.

This also updates the shared sunxi-h3-h5.dtsi, but that only adds nodes
that are of no concern to U-Boot.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../dts/sun50i-h5-bananapi-m2-plus-v1.2.dts   |  1 +
 arch/arm/dts/sun50i-h5-cpu-opp.dtsi           | 79 +++++++++++++++++++
 .../arm/dts/sun50i-h5-libretech-all-h3-cc.dts |  1 +
 .../arm/dts/sun50i-h5-libretech-all-h5-cc.dts |  2 +-
 arch/arm/dts/sun50i-h5-nanopi-neo-plus2.dts   |  6 +-
 arch/arm/dts/sun50i-h5-nanopi-neo2.dts        |  4 +-
 arch/arm/dts/sun50i-h5-orangepi-pc2.dts       | 27 ++++++-
 arch/arm/dts/sun50i-h5-orangepi-prime.dts     |  6 +-
 arch/arm/dts/sun50i-h5-orangepi-zero-plus.dts |  4 +-
 .../arm/dts/sun50i-h5-orangepi-zero-plus2.dts | 38 +++++++++
 arch/arm/dts/sun50i-h5.dtsi                   | 61 ++++++++++++--
 arch/arm/dts/sun8i-h3.dtsi                    | 49 +++++++++++-
 arch/arm/dts/sunxi-h3-h5.dtsi                 | 42 +++++++++-
 13 files changed, 296 insertions(+), 24 deletions(-)
 create mode 100644 arch/arm/dts/sun50i-h5-cpu-opp.dtsi

diff --git a/arch/arm/dts/sun50i-h5-bananapi-m2-plus-v1.2.dts b/arch/arm/dts/sun50i-h5-bananapi-m2-plus-v1.2.dts
index 2e2b14c0ae7..8857a379159 100644
--- a/arch/arm/dts/sun50i-h5-bananapi-m2-plus-v1.2.dts
+++ b/arch/arm/dts/sun50i-h5-bananapi-m2-plus-v1.2.dts
@@ -3,6 +3,7 @@
 
 /dts-v1/;
 #include "sun50i-h5.dtsi"
+#include "sun50i-h5-cpu-opp.dtsi"
 #include <arm/sunxi-bananapi-m2-plus-v1.2.dtsi>
 
 / {
diff --git a/arch/arm/dts/sun50i-h5-cpu-opp.dtsi b/arch/arm/dts/sun50i-h5-cpu-opp.dtsi
new file mode 100644
index 00000000000..b2657201957
--- /dev/null
+++ b/arch/arm/dts/sun50i-h5-cpu-opp.dtsi
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (C) 2020 Chen-Yu Tsai <wens@csie.org>
+
+/ {
+	cpu_opp_table: cpu-opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <1000000 1000000 1310000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-648000000 {
+			opp-hz = /bits/ 64 <648000000>;
+			opp-microvolt = <1040000 1040000 1310000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <1080000 1080000 1310000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-912000000 {
+			opp-hz = /bits/ 64 <912000000>;
+			opp-microvolt = <1120000 1120000 1310000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-960000000 {
+			opp-hz = /bits/ 64 <960000000>;
+			opp-microvolt = <1160000 1160000 1310000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <1200000 1200000 1310000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-1056000000 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-microvolt = <1240000 1240000 1310000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-1104000000 {
+			opp-hz = /bits/ 64 <1104000000>;
+			opp-microvolt = <1260000 1260000 1310000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-1152000000 {
+			opp-hz = /bits/ 64 <1152000000>;
+			opp-microvolt = <1300000 1300000 1310000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+	};
+};
+
+&cpu0 {
+	operating-points-v2 = <&cpu_opp_table>;
+};
+
+&cpu1 {
+	operating-points-v2 = <&cpu_opp_table>;
+};
+
+&cpu2 {
+	operating-points-v2 = <&cpu_opp_table>;
+};
+
+&cpu3 {
+	operating-points-v2 = <&cpu_opp_table>;
+};
diff --git a/arch/arm/dts/sun50i-h5-libretech-all-h3-cc.dts b/arch/arm/dts/sun50i-h5-libretech-all-h3-cc.dts
index a91806618e6..016da3ec321 100644
--- a/arch/arm/dts/sun50i-h5-libretech-all-h3-cc.dts
+++ b/arch/arm/dts/sun50i-h5-libretech-all-h3-cc.dts
@@ -4,6 +4,7 @@
 
 /dts-v1/;
 #include "sun50i-h5.dtsi"
+#include "sun50i-h5-cpu-opp.dtsi"
 #include <sunxi-libretech-all-h3-cc.dtsi>
 
 / {
diff --git a/arch/arm/dts/sun50i-h5-libretech-all-h5-cc.dts b/arch/arm/dts/sun50i-h5-libretech-all-h5-cc.dts
index df1b9263ad0..6e30a564c87 100644
--- a/arch/arm/dts/sun50i-h5-libretech-all-h5-cc.dts
+++ b/arch/arm/dts/sun50i-h5-libretech-all-h5-cc.dts
@@ -36,7 +36,7 @@
 	pinctrl-0 = <&emac_rgmii_pins>;
 	phy-supply = <&reg_gmac_3v3>;
 	phy-handle = <&ext_rgmii_phy>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	/delete-property/ allwinner,leds-active-low;
 	status = "okay";
 };
diff --git a/arch/arm/dts/sun50i-h5-nanopi-neo-plus2.dts b/arch/arm/dts/sun50i-h5-nanopi-neo-plus2.dts
index 4f9ba53ffaa..4c3921ac236 100644
--- a/arch/arm/dts/sun50i-h5-nanopi-neo-plus2.dts
+++ b/arch/arm/dts/sun50i-h5-nanopi-neo-plus2.dts
@@ -25,13 +25,13 @@
 	leds {
 		compatible = "gpio-leds";
 
-		pwr {
+		led-0 {
 			label = "nanopi:green:pwr";
 			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
 		};
 
-		status {
+		led-1 {
 			label = "nanopi:red:status";
 			gpios = <&pio 0 20 GPIO_ACTIVE_HIGH>;
 		};
@@ -96,7 +96,7 @@
 	pinctrl-0 = <&emac_rgmii_pins>;
 	phy-supply = <&reg_gmac_3v3>;
 	phy-handle = <&ext_rgmii_phy>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	status = "okay";
 };
 
diff --git a/arch/arm/dts/sun50i-h5-nanopi-neo2.dts b/arch/arm/dts/sun50i-h5-nanopi-neo2.dts
index b059e20813b..02f8e72f0ca 100644
--- a/arch/arm/dts/sun50i-h5-nanopi-neo2.dts
+++ b/arch/arm/dts/sun50i-h5-nanopi-neo2.dts
@@ -22,13 +22,13 @@
 	leds {
 		compatible = "gpio-leds";
 
-		pwr {
+		led-0 {
 			label = "nanopi:green:pwr";
 			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
 		};
 
-		status {
+		led-1 {
 			label = "nanopi:blue:status";
 			gpios = <&pio 0 10 GPIO_ACTIVE_HIGH>;
 		};
diff --git a/arch/arm/dts/sun50i-h5-orangepi-pc2.dts b/arch/arm/dts/sun50i-h5-orangepi-pc2.dts
index 70b5f099842..1010c1b22d2 100644
--- a/arch/arm/dts/sun50i-h5-orangepi-pc2.dts
+++ b/arch/arm/dts/sun50i-h5-orangepi-pc2.dts
@@ -42,13 +42,13 @@
 	leds {
 		compatible = "gpio-leds";
 
-		pwr {
+		led-0 {
 			label = "orangepi:green:pwr";
 			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
 		};
 
-		status {
+		led-1 {
 			label = "orangepi:red:status";
 			gpios = <&pio 0 20 GPIO_ACTIVE_HIGH>;
 		};
@@ -61,6 +61,7 @@
 			label = "sw4";
 			linux,code = <BTN_0>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
+			wakeup-source;
 		};
 	};
 
@@ -93,6 +94,10 @@
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&reg_vdd_cpux>;
+};
+
 &de {
 	status = "okay";
 };
@@ -118,7 +123,7 @@
 	pinctrl-0 = <&emac_rgmii_pins>;
 	phy-supply = <&reg_gmac_3v3>;
 	phy-handle = <&ext_rgmii_phy>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	status = "okay";
 };
 
@@ -168,6 +173,22 @@
 	status = "okay";
 };
 
+&r_i2c {
+	status = "okay";
+
+	reg_vdd_cpux: regulator@65 {
+		compatible = "silergy,sy8106a";
+		reg = <0x65>;
+		regulator-name = "vdd-cpux";
+		silergy,fixed-microvolt = <1100000>;
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1400000>;
+		regulator-ramp-delay = <200>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
 &spi0  {
 	status = "okay";
 
diff --git a/arch/arm/dts/sun50i-h5-orangepi-prime.dts b/arch/arm/dts/sun50i-h5-orangepi-prime.dts
index cb44bfa5981..74e0444af19 100644
--- a/arch/arm/dts/sun50i-h5-orangepi-prime.dts
+++ b/arch/arm/dts/sun50i-h5-orangepi-prime.dts
@@ -36,13 +36,13 @@
 	leds {
 		compatible = "gpio-leds";
 
-		pwr {
+		led-0 {
 			label = "orangepi:green:pwr";
 			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
 		};
 
-		status {
+		led-1 {
 			label = "orangepi:red:status";
 			gpios = <&pio 0 20 GPIO_ACTIVE_HIGH>;
 		};
@@ -124,7 +124,7 @@
 	pinctrl-0 = <&emac_rgmii_pins>;
 	phy-supply = <&reg_gmac_3v3>;
 	phy-handle = <&ext_rgmii_phy>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	status = "okay";
 };
 
diff --git a/arch/arm/dts/sun50i-h5-orangepi-zero-plus.dts b/arch/arm/dts/sun50i-h5-orangepi-zero-plus.dts
index ef5ca644422..d13980ed7a7 100644
--- a/arch/arm/dts/sun50i-h5-orangepi-zero-plus.dts
+++ b/arch/arm/dts/sun50i-h5-orangepi-zero-plus.dts
@@ -33,13 +33,13 @@
 	leds {
 		compatible = "gpio-leds";
 
-		pwr {
+		led-0 {
 			label = "orangepi:green:pwr";
 			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>; /* PA10 */
 			default-state = "on";
 		};
 
-		status {
+		led-1 {
 			label = "orangepi:red:status";
 			gpios = <&pio 0 17 GPIO_ACTIVE_HIGH>; /* PA17 */
 		};
diff --git a/arch/arm/dts/sun50i-h5-orangepi-zero-plus2.dts b/arch/arm/dts/sun50i-h5-orangepi-zero-plus2.dts
index c95a6854130..22530ace12d 100644
--- a/arch/arm/dts/sun50i-h5-orangepi-zero-plus2.dts
+++ b/arch/arm/dts/sun50i-h5-orangepi-zero-plus2.dts
@@ -30,6 +30,21 @@
 		};
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			label = "orangepi:green:pwr";
+			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+
+		led-1 {
+			label = "orangepi:red:status";
+			gpios = <&pio 0 17 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	reg_vcc3v3: vcc3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v3";
@@ -48,6 +63,10 @@
 	status = "okay";
 };
 
+&ehci0 {
+	status = "okay";
+};
+
 &hdmi {
 	status = "okay";
 };
@@ -92,6 +111,10 @@
 	status = "okay";
 };
 
+&ohci0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pa_pins>;
@@ -103,3 +126,18 @@
 	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
 	status = "okay";
 };
+
+&usb_otg {
+	/*
+	 * According to schematics CN1 MicroUSB port can be used to take
+	 * external 5V to power up the board VBUS. On the contrary CN1 MicroUSB
+	 * port cannot provide power externally even if the board is powered
+	 * via GPIO pins. It thus makes sense to force peripheral mode.
+	 */
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usbphy {
+	status = "okay";
+};
diff --git a/arch/arm/dts/sun50i-h5.dtsi b/arch/arm/dts/sun50i-h5.dtsi
index 3a1c8b2efd6..ab860e20d08 100644
--- a/arch/arm/dts/sun50i-h5.dtsi
+++ b/arch/arm/dts/sun50i-h5.dtsi
@@ -3,6 +3,8 @@
 
 #include <sunxi-h3-h5.dtsi>
 
+#include <dt-bindings/thermal/thermal.h>
+
 / {
 	cpus {
 		#address-cells = <1>;
@@ -13,6 +15,9 @@
 			device_type = "cpu";
 			reg = <0>;
 			enable-method = "psci";
+			clocks = <&ccu CLK_CPUX>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -20,6 +25,9 @@
 			device_type = "cpu";
 			reg = <1>;
 			enable-method = "psci";
+			clocks = <&ccu CLK_CPUX>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
@@ -27,6 +35,9 @@
 			device_type = "cpu";
 			reg = <2>;
 			enable-method = "psci";
+			clocks = <&ccu CLK_CPUX>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
@@ -34,12 +45,14 @@
 			device_type = "cpu";
 			reg = <3>;
 			enable-method = "psci";
+			clocks = <&ccu CLK_CPUX>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+			#cooling-cells = <2>;
 		};
 	};
 
 	pmu {
-		compatible = "arm,cortex-a53-pmu",
-			     "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
@@ -54,6 +67,7 @@
 
 	timer {
 		compatible = "arm,armv8-timer";
+		arm,no-tick-in-suspend;
 		interrupts = <GIC_PPI 13
 				(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 14
@@ -107,6 +121,19 @@
 			resets = <&ccu RST_BUS_CE>;
 		};
 
+		deinterlace: deinterlace@1e00000 {
+			compatible = "allwinner,sun8i-h3-deinterlace";
+			reg = <0x01e00000 0x20000>;
+			clocks = <&ccu CLK_BUS_DEINTERLACE>,
+				 <&ccu CLK_DEINTERLACE>,
+				 <&ccu CLK_DRAM_DEINTERLACE>;
+			clock-names = "bus", "mod", "ram";
+			resets = <&ccu RST_BUS_DEINTERLACE>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects = <&mbus 9>;
+			interconnect-names = "dma-mem";
+		};
+
 		mali: gpu@1e80000 {
 			compatible = "allwinner,sun50i-h5-mali", "arm,mali-450";
 			reg = <0x01e80000 0x30000>;
@@ -126,8 +153,7 @@
 				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "gp",
 					  "gpmmu",
 					  "pp",
@@ -138,8 +164,7 @@
 					  "pp2",
 					  "ppmmu2",
 					  "pp3",
-					  "ppmmu3",
-					  "pmu";
+					  "ppmmu3";
 			clocks = <&ccu CLK_BUS_GPU>, <&ccu CLK_GPU>;
 			clock-names = "bus", "core";
 			resets = <&ccu RST_BUS_GPU>;
@@ -166,6 +191,30 @@
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&ths 0>;
+
+			trips {
+				cpu_hot_trip: cpu-hot {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_very_hot_trip: cpu-very-hot {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				cpu-hot-limit {
+					trip = <&cpu_hot_trip>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpu_thermal {
diff --git a/arch/arm/dts/sun8i-h3.dtsi b/arch/arm/dts/sun8i-h3.dtsi
index 20217e2ca4d..4e89701df91 100644
--- a/arch/arm/dts/sun8i-h3.dtsi
+++ b/arch/arm/dts/sun8i-h3.dtsi
@@ -41,6 +41,7 @@
  */
 
 #include "sunxi-h3-h5.dtsi"
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	cpu0_opp_table: opp_table0 {
@@ -111,6 +112,26 @@
 		};
 	};
 
+	gpu_opp_table: gpu-opp-table {
+		compatible = "operating-points-v2";
+
+		opp-120000000 {
+			opp-hz = /bits/ 64 <120000000>;
+		};
+
+		opp-312000000 {
+			opp-hz = /bits/ 64 <312000000>;
+		};
+
+		opp-432000000 {
+			opp-hz = /bits/ 64 <432000000>;
+		};
+
+		opp-576000000 {
+			opp-hz = /bits/ 64 <576000000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a7-pmu";
 		interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
@@ -204,9 +225,7 @@
 			clocks = <&ccu CLK_BUS_GPU>, <&ccu CLK_GPU>;
 			clock-names = "bus", "core";
 			resets = <&ccu RST_BUS_GPU>;
-
-			assigned-clocks = <&ccu CLK_GPU>;
-			assigned-clock-rates = <384000000>;
+			operating-points-v2 = <&gpu_opp_table>;
 		};
 
 		ths: thermal-sensor@1c25000 {
@@ -227,6 +246,30 @@
 			polling-delay-passive = <0>;
 			polling-delay = <0>;
 			thermal-sensors = <&ths 0>;
+
+			trips {
+				cpu_hot_trip: cpu-hot {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_very_hot_trip: cpu-very-hot {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				cpu-hot-limit {
+					trip = <&cpu_hot_trip>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 	};
 };
diff --git a/arch/arm/dts/sunxi-h3-h5.dtsi b/arch/arm/dts/sunxi-h3-h5.dtsi
index 5e9c3060aa0..9be13378d4d 100644
--- a/arch/arm/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/dts/sunxi-h3-h5.dtsi
@@ -114,7 +114,7 @@
 
 		display_clocks: clock@1000000 {
 			/* compatible is in per SoC .dtsi file */
-			reg = <0x01000000 0x100000>;
+			reg = <0x01000000 0x10000>;
 			clocks = <&ccu CLK_BUS_DE>,
 				 <&ccu CLK_DE>;
 			clock-names = "bus",
@@ -239,6 +239,16 @@
 			};
 		};
 
+		msgbox: mailbox@1c17000 {
+			compatible = "allwinner,sun8i-h3-msgbox",
+				     "allwinner,sun6i-a31-msgbox";
+			reg = <0x01c17000 0x1000>;
+			clocks = <&ccu CLK_BUS_MSGBOX>;
+			resets = <&ccu RST_BUS_MSGBOX>;
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
 		usb_otg: usb@1c19000 {
 			compatible = "allwinner,sun8i-h3-musb";
 			reg = <0x01c19000 0x400>;
@@ -560,6 +570,8 @@
 			compatible = "allwinner,sun8i-h3-mbus";
 			reg = <0x01c62000 0x1000>;
 			clocks = <&ccu CLK_MBUS>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 			dma-ranges = <0x00000000 0x40000000 0xc0000000>;
 			#interconnect-cells = <1>;
 		};
@@ -650,6 +662,19 @@
 			status = "disabled";
 		};
 
+		i2s2: i2s@1c22800 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun8i-h3-i2s";
+			reg = <0x01c22800 0x400>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_I2S2>, <&ccu CLK_I2S2>;
+			clock-names = "apb", "mod";
+			dmas = <&dma 27>;
+			resets = <&ccu RST_BUS_I2S2>;
+			dma-names = "tx";
+			status = "disabled";
+		};
+
 		codec: codec@1c22c00 {
 			#sound-dai-cells = <0>;
 			compatible = "allwinner,sun8i-h3-codec";
@@ -892,6 +917,21 @@
 				pins = "PL0", "PL1";
 				function = "s_i2c";
 			};
+
+			r_pwm_pin: r-pwm-pin {
+				pins = "PL10";
+				function = "s_pwm";
+			};
+		};
+
+		r_pwm: pwm@1f03800 {
+			compatible = "allwinner,sun8i-h3-pwm";
+			reg = <0x01f03800 0x8>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&r_pwm_pin>;
+			clocks = <&osc24M>;
+			#pwm-cells = <3>;
+			status = "disabled";
 		};
 	};
 };
-- 
2.17.5

