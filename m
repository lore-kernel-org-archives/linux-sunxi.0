Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B60B2FB7
	for <linux-sunxi@lists.linux.dev>; Thu, 27 May 2021 00:45:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B567D143B;
	Wed, 26 May 2021 17:45:00 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A3533F719;
	Wed, 26 May 2021 17:44:59 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/3] arm: dts: sunxi: h6: Update DT files
Date: Thu, 27 May 2021 01:44:36 +0100
Message-Id: <20210527004438.19783-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210527004438.19783-1-andre.przywara@arm.com>
References: <20210527004438.19783-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Update the H6 DT files from the Linux 5.12 release.

The changes are minimal (many LED node renames), but also help to enable
USB port 0 in U-Boot (later), enable the RSB device (not yet used in
U-Boot), and also introduce an MMC frequency limit.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/dts/sun50i-h6-beelink-gs1.dts |  6 +-----
 arch/arm/dts/sun50i-h6-cpu-opp.dtsi    | 20 ++++++++++----------
 arch/arm/dts/sun50i-h6-orangepi-3.dts  |  4 ++--
 arch/arm/dts/sun50i-h6-orangepi.dtsi   |  4 ++--
 arch/arm/dts/sun50i-h6-pine-h64.dts    |  7 ++++---
 arch/arm/dts/sun50i-h6.dtsi            | 26 ++++++++++++++++++++++++++
 6 files changed, 45 insertions(+), 22 deletions(-)

diff --git a/arch/arm/dts/sun50i-h6-beelink-gs1.dts b/arch/arm/dts/sun50i-h6-beelink-gs1.dts
index 7c9dbde645b..b5808047d6e 100644
--- a/arch/arm/dts/sun50i-h6-beelink-gs1.dts
+++ b/arch/arm/dts/sun50i-h6-beelink-gs1.dts
@@ -43,7 +43,7 @@
 	leds {
 		compatible = "gpio-leds";
 
-		power {
+		led {
 			label = "beelink:white:power";
 			gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
 			default-state = "on";
@@ -289,10 +289,6 @@
 	vcc-pm-supply = <&reg_aldo1>;
 };
 
-&rtc {
-	clocks = <&ext_osc32k>;
-};
-
 &spdif {
 	status = "okay";
 };
diff --git a/arch/arm/dts/sun50i-h6-cpu-opp.dtsi b/arch/arm/dts/sun50i-h6-cpu-opp.dtsi
index 1a5eddc5a40..8c6e8536b69 100644
--- a/arch/arm/dts/sun50i-h6-cpu-opp.dtsi
+++ b/arch/arm/dts/sun50i-h6-cpu-opp.dtsi
@@ -8,7 +8,7 @@
 		nvmem-cells = <&cpu_speed_grade>;
 		opp-shared;
 
-		opp@480000000 {
+		opp-480000000 {
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-hz = /bits/ 64 <480000000>;
 
@@ -17,7 +17,7 @@
 			opp-microvolt-speed2 = <820000 820000 1200000>;
 		};
 
-		opp@720000000 {
+		opp-720000000 {
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-hz = /bits/ 64 <720000000>;
 
@@ -26,7 +26,7 @@
 			opp-microvolt-speed2 = <820000 820000 1200000>;
 		};
 
-		opp@816000000 {
+		opp-816000000 {
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-hz = /bits/ 64 <816000000>;
 
@@ -35,7 +35,7 @@
 			opp-microvolt-speed2 = <820000 820000 1200000>;
 		};
 
-		opp@888000000 {
+		opp-888000000 {
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-hz = /bits/ 64 <888000000>;
 
@@ -44,7 +44,7 @@
 			opp-microvolt-speed2 = <820000 820000 1200000>;
 		};
 
-		opp@1080000000 {
+		opp-1080000000 {
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-hz = /bits/ 64 <1080000000>;
 
@@ -53,7 +53,7 @@
 			opp-microvolt-speed2 = <880000 880000 1200000>;
 		};
 
-		opp@1320000000 {
+		opp-1320000000 {
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-hz = /bits/ 64 <1320000000>;
 
@@ -62,7 +62,7 @@
 			opp-microvolt-speed2 = <940000 940000 1200000>;
 		};
 
-		opp@1488000000 {
+		opp-1488000000 {
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-hz = /bits/ 64 <1488000000>;
 
@@ -71,7 +71,7 @@
 			opp-microvolt-speed2 = <1000000 1000000 1200000>;
 		};
 
-		opp@1608000000 {
+		opp-1608000000 {
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-hz = /bits/ 64 <1608000000>;
 
@@ -80,7 +80,7 @@
 			opp-microvolt-speed2 = <1030000 1030000 1200000>;
 		};
 
-		opp@1704000000 {
+		opp-1704000000 {
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-hz = /bits/ 64 <1704000000>;
 
@@ -89,7 +89,7 @@
 			opp-microvolt-speed2 = <1060000 1060000 1200000>;
 		};
 
-		opp@1800000000 {
+		opp-1800000000 {
 			clock-latency-ns = <244144>; /* 8 32k periods */
 			opp-hz = /bits/ 64 <1800000000>;
 
diff --git a/arch/arm/dts/sun50i-h6-orangepi-3.dts b/arch/arm/dts/sun50i-h6-orangepi-3.dts
index 15c9dd8c447..7e83f6146f8 100644
--- a/arch/arm/dts/sun50i-h6-orangepi-3.dts
+++ b/arch/arm/dts/sun50i-h6-orangepi-3.dts
@@ -43,13 +43,13 @@
 	leds {
 		compatible = "gpio-leds";
 
-		power {
+		led-0 {
 			label = "orangepi:red:power";
 			gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
 			default-state = "on";
 		};
 
-		status {
+		led-1 {
 			label = "orangepi:green:status";
 			gpios = <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
 		};
diff --git a/arch/arm/dts/sun50i-h6-orangepi.dtsi b/arch/arm/dts/sun50i-h6-orangepi.dtsi
index ebc120a9232..da0875bd38d 100644
--- a/arch/arm/dts/sun50i-h6-orangepi.dtsi
+++ b/arch/arm/dts/sun50i-h6-orangepi.dtsi
@@ -42,13 +42,13 @@
 	leds {
 		compatible = "gpio-leds";
 
-		power {
+		led-0 {
 			label = "orangepi:red:power";
 			gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
 			default-state = "on";
 		};
 
-		status {
+		led-1 {
 			label = "orangepi:green:status";
 			gpios = <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
 		};
diff --git a/arch/arm/dts/sun50i-h6-pine-h64.dts b/arch/arm/dts/sun50i-h6-pine-h64.dts
index 961732c52aa..b868ad17af8 100644
--- a/arch/arm/dts/sun50i-h6-pine-h64.dts
+++ b/arch/arm/dts/sun50i-h6-pine-h64.dts
@@ -44,17 +44,17 @@
 	leds {
 		compatible = "gpio-leds";
 
-		heartbeat {
+		led-0 {
 			label = "pine-h64:green:heartbeat";
 			gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
 		};
 
-		link {
+		led-1 {
 			label = "pine-h64:white:link";
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_HIGH>; /* PL3 */
 		};
 
-		status {
+		led-2 {
 			label = "pine-h64:blue:status";
 			gpios = <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
 		};
@@ -142,6 +142,7 @@
 	vqmmc-supply = <&reg_bldo2>;
 	non-removable;
 	cap-mmc-hw-reset;
+	mmc-hs200-1_8v;
 	bus-width = <8>;
 	status = "okay";
 };
diff --git a/arch/arm/dts/sun50i-h6.dtsi b/arch/arm/dts/sun50i-h6.dtsi
index 8a62a9fbe34..af8b7d0ef75 100644
--- a/arch/arm/dts/sun50i-h6.dtsi
+++ b/arch/arm/dts/sun50i-h6.dtsi
@@ -436,6 +436,7 @@
 			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&mmc0_pins>;
+			max-frequency = <150000000>;
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -452,6 +453,7 @@
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&mmc1_pins>;
+			max-frequency = <150000000>;
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -468,6 +470,7 @@
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&mmc2_pins>;
+			max-frequency = <150000000>;
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -680,6 +683,8 @@
 				 <&ccu CLK_USB_OHCI0>;
 			resets = <&ccu RST_BUS_OHCI0>,
 				 <&ccu RST_BUS_EHCI0>;
+			phys = <&usb2phy 0>;
+			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -690,6 +695,8 @@
 			clocks = <&ccu CLK_BUS_OHCI0>,
 				 <&ccu CLK_USB_OHCI0>;
 			resets = <&ccu RST_BUS_OHCI0>;
+			phys = <&usb2phy 0>;
+			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -949,6 +956,11 @@
 				pins = "PL9";
 				function = "s_cir_rx";
 			};
+
+			r_rsb_pins: r-rsb-pins {
+				pins = "PL0", "PL1";
+				function = "s_rsb";
+			};
 		};
 
 		r_ir: ir@7040000 {
@@ -979,6 +991,20 @@
 			#size-cells = <0>;
 		};
 
+		r_rsb: rsb@7083000 {
+			compatible = "allwinner,sun8i-a23-rsb";
+			reg = <0x07083000 0x400>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_R_APB2_RSB>;
+			clock-frequency = <3000000>;
+			resets = <&r_ccu RST_R_APB2_RSB>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&r_rsb_pins>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		ths: thermal-sensor@5070400 {
 			compatible = "allwinner,sun50i-h6-ths";
 			reg = <0x05070400 0x100>;
-- 
2.17.5

