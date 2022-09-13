Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B276AAC
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Sep 2022 23:41:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CFF41AED;
	Tue, 13 Sep 2022 16:41:56 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF9E93F73B;
	Tue, 13 Sep 2022 16:41:44 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/2] sunxi: dts: arm: update devicetree files
Date: Wed, 14 Sep 2022 00:40:04 +0100
Message-Id: <20220913234004.24850-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220913234004.24850-1-andre.przywara@arm.com>
References: <20220913234004.24850-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the devicetree files from the Linux kernel, version v6.0-rc4.
This is covering the 32-bit SoCs, from arch/arm/boot/dts/.

This avoids the not backwards-compatible r_intc binding change, to allow
older kernels to boot, but the other nodes are updated.

Not much change here, the vast majority is actually cosmetic: node names
and using symbolic names for the the RTC clocks.
The R40 boards gain DVFS support.
Some A23/A33 tablet DTs are unified into a single file.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/dts/sun4i-a10-inet9f-rev03.dts       | 40 +++++-----
 arch/arm/dts/sun4i-a10-pcduino.dts            |  6 +-
 arch/arm/dts/sun5i-a13-licheepi-one.dts       |  6 +-
 arch/arm/dts/sun6i-a31.dtsi                   | 13 ++--
 arch/arm/dts/sun7i-a20-pcduino3.dts           |  6 +-
 arch/arm/dts/sun8i-a23-a33.dtsi               |  9 ++-
 arch/arm/dts/sun8i-a23-ippo-q8h-v1.2.dts      | 74 +------------------
 arch/arm/dts/sun8i-a23-ippo-q8h-v5.dts        | 74 +------------------
 arch/arm/dts/sun8i-a33-et-q8-v1.6.dts         | 58 +--------------
 arch/arm/dts/sun8i-a33-ippo-q8h-v1.2.dts      | 58 +--------------
 .../dts/sun8i-h2-plus-bananapi-m2-zero.dts    |  8 +-
 arch/arm/dts/sun8i-h2-plus-orangepi-zero.dts  |  2 +-
 arch/arm/dts/sun8i-h3-beelink-x2.dts          |  6 +-
 arch/arm/dts/sun8i-h3-mapleboard-mp130.dts    |  6 +-
 arch/arm/dts/sun8i-h3-nanopi-duo2.dts         |  8 +-
 arch/arm/dts/sun8i-h3-nanopi-neo-air.dts      |  2 +-
 arch/arm/dts/sun8i-h3-nanopi-r1.dts           |  4 +-
 arch/arm/dts/sun8i-h3-nanopi.dtsi             |  5 +-
 arch/arm/dts/sun8i-h3-orangepi-2.dts          |  6 +-
 arch/arm/dts/sun8i-h3-orangepi-lite.dts       |  4 +-
 arch/arm/dts/sun8i-h3-orangepi-one.dts        |  4 +-
 arch/arm/dts/sun8i-h3-orangepi-pc.dts         |  4 +-
 arch/arm/dts/sun8i-r16-bananapi-m2m.dts       |  4 +-
 arch/arm/dts/sun8i-r40-bananapi-m2-ultra.dts  |  5 ++
 arch/arm/dts/sun8i-r40-cpu-opp.dtsi           | 52 +++++++++++++
 arch/arm/dts/sun8i-r40-feta40i.dtsi           |  5 ++
 arch/arm/dts/sun8i-r40.dtsi                   | 44 ++++++++++-
 arch/arm/dts/sun8i-t3-cqa3t-bv3.dts           |  5 ++
 arch/arm/dts/sun8i-v3s.dtsi                   |  6 +-
 arch/arm/dts/sun8i-v40-bananapi-m2-berry.dts  |  5 ++
 arch/arm/dts/sun9i-a80.dtsi                   |  1 -
 arch/arm/dts/sunxi-bananapi-m2-plus.dtsi      |  8 +-
 arch/arm/dts/sunxi-h3-h5-emlid-neutis.dtsi    |  4 +-
 arch/arm/dts/sunxi-h3-h5.dtsi                 | 13 ++--
 arch/arm/dts/sunxi-libretech-all-h3-cc.dtsi   |  4 +-
 35 files changed, 209 insertions(+), 350 deletions(-)
 mode change 100644 => 120000 arch/arm/dts/sun8i-a23-ippo-q8h-v1.2.dts
 mode change 100644 => 120000 arch/arm/dts/sun8i-a23-ippo-q8h-v5.dts
 mode change 100644 => 120000 arch/arm/dts/sun8i-a33-et-q8-v1.6.dts
 mode change 100644 => 120000 arch/arm/dts/sun8i-a33-ippo-q8h-v1.2.dts
 create mode 100644 arch/arm/dts/sun8i-r40-cpu-opp.dtsi

diff --git a/arch/arm/dts/sun4i-a10-inet9f-rev03.dts b/arch/arm/dts/sun4i-a10-inet9f-rev03.dts
index 0a562b2cc5b..62e7aa587f8 100644
--- a/arch/arm/dts/sun4i-a10-inet9f-rev03.dts
+++ b/arch/arm/dts/sun4i-a10-inet9f-rev03.dts
@@ -63,7 +63,7 @@
 		compatible = "gpio-keys-polled";
 		poll-interval = <20>;
 
-		left-joystick-left {
+		event-left-joystick-left {
 			label = "Left Joystick Left";
 			linux,code = <ABS_X>;
 			linux,input-type = <EV_ABS>;
@@ -71,7 +71,7 @@
 			gpios = <&pio 0 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA6 */
 		};
 
-		left-joystick-right {
+		event-left-joystick-right {
 			label = "Left Joystick Right";
 			linux,code = <ABS_X>;
 			linux,input-type = <EV_ABS>;
@@ -79,7 +79,7 @@
 			gpios = <&pio 0 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA5 */
 		};
 
-		left-joystick-up {
+		event-left-joystick-up {
 			label = "Left Joystick Up";
 			linux,code = <ABS_Y>;
 			linux,input-type = <EV_ABS>;
@@ -87,7 +87,7 @@
 			gpios = <&pio 0 8 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA8 */
 		};
 
-		left-joystick-down {
+		event-left-joystick-down {
 			label = "Left Joystick Down";
 			linux,code = <ABS_Y>;
 			linux,input-type = <EV_ABS>;
@@ -95,7 +95,7 @@
 			gpios = <&pio 0 9 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA9 */
 		};
 
-		right-joystick-left {
+		event-right-joystick-left {
 			label = "Right Joystick Left";
 			linux,code = <ABS_Z>;
 			linux,input-type = <EV_ABS>;
@@ -103,7 +103,7 @@
 			gpios = <&pio 0 1 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA1 */
 		};
 
-		right-joystick-right {
+		event-right-joystick-right {
 			label = "Right Joystick Right";
 			linux,code = <ABS_Z>;
 			linux,input-type = <EV_ABS>;
@@ -111,7 +111,7 @@
 			gpios = <&pio 0 0 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA0 */
 		};
 
-		right-joystick-up {
+		event-right-joystick-up {
 			label = "Right Joystick Up";
 			linux,code = <ABS_RZ>;
 			linux,input-type = <EV_ABS>;
@@ -119,7 +119,7 @@
 			gpios = <&pio 0 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA3 */
 		};
 
-		right-joystick-down {
+		event-right-joystick-down {
 			label = "Right Joystick Down";
 			linux,code = <ABS_RZ>;
 			linux,input-type = <EV_ABS>;
@@ -127,7 +127,7 @@
 			gpios = <&pio 0 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA4 */
 		};
 
-		dpad-left {
+		event-dpad-left {
 			label = "DPad Left";
 			linux,code = <ABS_HAT0X>;
 			linux,input-type = <EV_ABS>;
@@ -135,7 +135,7 @@
 			gpios = <&pio 7 23 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PH23 */
 		};
 
-		dpad-right {
+		event-dpad-right {
 			label = "DPad Right";
 			linux,code = <ABS_HAT0X>;
 			linux,input-type = <EV_ABS>;
@@ -143,7 +143,7 @@
 			gpios = <&pio 7 24 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PH24 */
 		};
 
-		dpad-up {
+		event-dpad-up {
 			label = "DPad Up";
 			linux,code = <ABS_HAT0Y>;
 			linux,input-type = <EV_ABS>;
@@ -151,7 +151,7 @@
 			gpios = <&pio 7 25 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PH25 */
 		};
 
-		dpad-down {
+		event-dpad-down {
 			label = "DPad Down";
 			linux,code = <ABS_HAT0Y>;
 			linux,input-type = <EV_ABS>;
@@ -159,49 +159,49 @@
 			gpios = <&pio 7 26 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PH26 */
 		};
 
-		x {
+		event-x {
 			label = "Button X";
 			linux,code = <BTN_X>;
 			gpios = <&pio 0 16 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA16 */
 		};
 
-		y {
+		event-y {
 			label = "Button Y";
 			linux,code = <BTN_Y>;
 			gpios = <&pio 0 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA14 */
 		};
 
-		a {
+		event-a {
 			label = "Button A";
 			linux,code = <BTN_A>;
 			gpios = <&pio 0 17 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA17 */
 		};
 
-		b {
+		event-b {
 			label = "Button B";
 			linux,code = <BTN_B>;
 			gpios = <&pio 0 15 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA15 */
 		};
 
-		select {
+		event-select {
 			label = "Select Button";
 			linux,code = <BTN_SELECT>;
 			gpios = <&pio 0 11 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA11 */
 		};
 
-		start {
+		event-start {
 			label = "Start Button";
 			linux,code = <BTN_START>;
 			gpios = <&pio 0 12 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA12 */
 		};
 
-		top-left {
+		event-top-left {
 			label = "Top Left Button";
 			linux,code = <BTN_TL>;
 			gpios = <&pio 7 22 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PH22 */
 		};
 
-		top-right {
+		event-top-right {
 			label = "Top Right Button";
 			linux,code = <BTN_TR>;
 			gpios = <&pio 0 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PA13 */
diff --git a/arch/arm/dts/sun4i-a10-pcduino.dts b/arch/arm/dts/sun4i-a10-pcduino.dts
index 1ac82376bae..a332d61fd56 100644
--- a/arch/arm/dts/sun4i-a10-pcduino.dts
+++ b/arch/arm/dts/sun4i-a10-pcduino.dts
@@ -77,19 +77,19 @@
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		back {
+		key-back {
 			label = "Key Back";
 			linux,code = <KEY_BACK>;
 			gpios = <&pio 7 17 GPIO_ACTIVE_LOW>;
 		};
 
-		home {
+		key-home {
 			label = "Key Home";
 			linux,code = <KEY_HOME>;
 			gpios = <&pio 7 18 GPIO_ACTIVE_LOW>;
 		};
 
-		menu {
+		key-menu {
 			label = "Key Menu";
 			linux,code = <KEY_MENU>;
 			gpios = <&pio 7 19 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/dts/sun5i-a13-licheepi-one.dts b/arch/arm/dts/sun5i-a13-licheepi-one.dts
index 2ce361f8fed..3a6c4bd0a44 100644
--- a/arch/arm/dts/sun5i-a13-licheepi-one.dts
+++ b/arch/arm/dts/sun5i-a13-licheepi-one.dts
@@ -67,18 +67,18 @@
 		compatible = "gpio-leds";
 
 		led-0 {
-			label ="licheepi:red:usr";
+			label = "licheepi:red:usr";
 			gpios = <&pio 2 5 GPIO_ACTIVE_LOW>;
 		};
 
 		led-1 {
-			label ="licheepi:green:usr";
+			label = "licheepi:green:usr";
 			gpios = <&pio 2 19 GPIO_ACTIVE_LOW>;
 			default-state = "on";
 		};
 
 		led-2 {
-			label ="licheepi:blue:usr";
+			label = "licheepi:blue:usr";
 			gpios = <&pio 2 4 GPIO_ACTIVE_LOW>;
 		};
 
diff --git a/arch/arm/dts/sun6i-a31.dtsi b/arch/arm/dts/sun6i-a31.dtsi
index d7d920e9e48..f6701ece7b7 100644
--- a/arch/arm/dts/sun6i-a31.dtsi
+++ b/arch/arm/dts/sun6i-a31.dtsi
@@ -46,6 +46,7 @@
 #include <dt-bindings/thermal/thermal.h>
 
 #include <dt-bindings/clock/sun6i-a31-ccu.h>
+#include <dt-bindings/clock/sun6i-rtc.h>
 #include <dt-bindings/reset/sun6i-a31-ccu.h>
 
 / {
@@ -598,7 +599,7 @@
 		ccu: clock@1c20000 {
 			compatible = "allwinner,sun6i-a31-ccu";
 			reg = <0x01c20000 0x400>;
-			clocks = <&osc24M>, <&rtc 0>;
+			clocks = <&osc24M>, <&rtc CLK_OSC32K>;
 			clock-names = "hosc", "losc";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -611,7 +612,8 @@
 				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_APB1_PIO>, <&osc24M>, <&rtc 0>;
+			clocks = <&ccu CLK_APB1_PIO>, <&osc24M>,
+				 <&rtc CLK_OSC32K>;
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			interrupt-controller;
@@ -1316,7 +1318,7 @@
 			ar100: ar100_clk {
 				compatible = "allwinner,sun6i-a31-ar100-clk";
 				#clock-cells = <0>;
-				clocks = <&rtc 0>, <&osc24M>,
+				clocks = <&rtc CLK_OSC32K>, <&osc24M>,
 					 <&ccu CLK_PLL_PERIPH>,
 					 <&ccu CLK_PLL_PERIPH>;
 				clock-output-names = "ar100";
@@ -1351,7 +1353,7 @@
 			ir_clk: ir_clk {
 				#clock-cells = <0>;
 				compatible = "allwinner,sun4i-a10-mod0-clk";
-				clocks = <&rtc 0>, <&osc24M>;
+				clocks = <&rtc CLK_OSC32K>, <&osc24M>;
 				clock-output-names = "ir";
 			};
 
@@ -1381,9 +1383,8 @@
 			reg = <0x01f02c00 0x400>;
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&apb0_gates 0>, <&osc24M>, <&rtc 0>;
+			clocks = <&apb0_gates 0>, <&osc24M>, <&rtc CLK_OSC32K>;
 			clock-names = "apb", "hosc", "losc";
-			resets = <&apb0_rst 0>;
 			gpio-controller;
 			interrupt-controller;
 			#interrupt-cells = <3>;
diff --git a/arch/arm/dts/sun7i-a20-pcduino3.dts b/arch/arm/dts/sun7i-a20-pcduino3.dts
index 4f8d55d3ba7..928b86a95f3 100644
--- a/arch/arm/dts/sun7i-a20-pcduino3.dts
+++ b/arch/arm/dts/sun7i-a20-pcduino3.dts
@@ -78,19 +78,19 @@
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		back {
+		key-back {
 			label = "Key Back";
 			linux,code = <KEY_BACK>;
 			gpios = <&pio 7 17 GPIO_ACTIVE_LOW>;
 		};
 
-		home {
+		key-home {
 			label = "Key Home";
 			linux,code = <KEY_HOME>;
 			gpios = <&pio 7 18 GPIO_ACTIVE_LOW>;
 		};
 
-		menu {
+		key-menu {
 			label = "Key Menu";
 			linux,code = <KEY_MENU>;
 			gpios = <&pio 7 19 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/dts/sun8i-a23-a33.dtsi b/arch/arm/dts/sun8i-a23-a33.dtsi
index a42fac676b3..06809c3a1f2 100644
--- a/arch/arm/dts/sun8i-a23-a33.dtsi
+++ b/arch/arm/dts/sun8i-a23-a33.dtsi
@@ -44,6 +44,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
+#include <dt-bindings/clock/sun6i-rtc.h>
 #include <dt-bindings/clock/sun8i-a23-a33-ccu.h>
 #include <dt-bindings/reset/sun8i-a23-a33-ccu.h>
 
@@ -329,7 +330,7 @@
 
 		ccu: clock@1c20000 {
 			reg = <0x01c20000 0x400>;
-			clocks = <&osc24M>, <&rtc 0>;
+			clocks = <&osc24M>, <&rtc CLK_OSC32K>;
 			clock-names = "hosc", "losc";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -339,7 +340,8 @@
 			/* compatible gets set in SoC specific dtsi file */
 			reg = <0x01c20800 0x400>;
 			/* interrupts get set in SoC specific dtsi file */
-			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&rtc 0>;
+			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>,
+				 <&rtc CLK_OSC32K>;
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			interrupt-controller;
@@ -806,9 +808,8 @@
 			compatible = "allwinner,sun8i-a23-r-pinctrl";
 			reg = <0x01f02c00 0x400>;
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&apb0_gates 0>, <&osc24M>, <&rtc 0>;
+			clocks = <&apb0_gates 0>, <&osc24M>, <&rtc CLK_OSC32K>;
 			clock-names = "apb", "hosc", "losc";
-			resets = <&apb0_rst 0>;
 			gpio-controller;
 			interrupt-controller;
 			#interrupt-cells = <3>;
diff --git a/arch/arm/dts/sun8i-a23-ippo-q8h-v1.2.dts b/arch/arm/dts/sun8i-a23-ippo-q8h-v1.2.dts
deleted file mode 100644
index 51097c77a15..00000000000
--- a/arch/arm/dts/sun8i-a23-ippo-q8h-v1.2.dts
+++ /dev/null
@@ -1,73 +0,0 @@
-/*
- * Copyright 2015 Hans de Goede <hdegoede@redhat.com>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-/dts-v1/;
-#include "sun8i-a23.dtsi"
-#include "sun8i-q8-common.dtsi"
-
-/ {
-	model = "Q8 A23 Tablet";
-	compatible = "allwinner,q8-a23", "allwinner,sun8i-a23";
-};
-
-&codec {
-	allwinner,pa-gpios = <&pio 7 9 GPIO_ACTIVE_HIGH>; /* PH9 */
-	allwinner,audio-routing =
-		"Headphone", "HP",
-		"Headphone", "HPCOM",
-		"Speaker", "HP",
-		"MIC1", "Mic",
-		"MIC2", "Headset Mic",
-		"Mic",  "MBIAS",
-		"Headset Mic", "HBIAS";
-	status = "okay";
-};
-
-&panel {
-	compatible = "bananapi,s070wv20-ct16";
-};
-
-&tcon0_out {
-	tcon0_out_lcd: endpoint {
-		remote-endpoint = <&panel_input>;
-	};
-};
diff --git a/arch/arm/dts/sun8i-a23-ippo-q8h-v1.2.dts b/arch/arm/dts/sun8i-a23-ippo-q8h-v1.2.dts
new file mode 120000
index 00000000000..c2f22fc3381
--- /dev/null
+++ b/arch/arm/dts/sun8i-a23-ippo-q8h-v1.2.dts
@@ -0,0 +1 @@
+sun8i-a23-q8-tablet.dts
\ No newline at end of file
diff --git a/arch/arm/dts/sun8i-a23-ippo-q8h-v5.dts b/arch/arm/dts/sun8i-a23-ippo-q8h-v5.dts
deleted file mode 100644
index 51097c77a15..00000000000
--- a/arch/arm/dts/sun8i-a23-ippo-q8h-v5.dts
+++ /dev/null
@@ -1,73 +0,0 @@
-/*
- * Copyright 2015 Hans de Goede <hdegoede@redhat.com>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-/dts-v1/;
-#include "sun8i-a23.dtsi"
-#include "sun8i-q8-common.dtsi"
-
-/ {
-	model = "Q8 A23 Tablet";
-	compatible = "allwinner,q8-a23", "allwinner,sun8i-a23";
-};
-
-&codec {
-	allwinner,pa-gpios = <&pio 7 9 GPIO_ACTIVE_HIGH>; /* PH9 */
-	allwinner,audio-routing =
-		"Headphone", "HP",
-		"Headphone", "HPCOM",
-		"Speaker", "HP",
-		"MIC1", "Mic",
-		"MIC2", "Headset Mic",
-		"Mic",  "MBIAS",
-		"Headset Mic", "HBIAS";
-	status = "okay";
-};
-
-&panel {
-	compatible = "bananapi,s070wv20-ct16";
-};
-
-&tcon0_out {
-	tcon0_out_lcd: endpoint {
-		remote-endpoint = <&panel_input>;
-	};
-};
diff --git a/arch/arm/dts/sun8i-a23-ippo-q8h-v5.dts b/arch/arm/dts/sun8i-a23-ippo-q8h-v5.dts
new file mode 120000
index 00000000000..c2f22fc3381
--- /dev/null
+++ b/arch/arm/dts/sun8i-a23-ippo-q8h-v5.dts
@@ -0,0 +1 @@
+sun8i-a23-q8-tablet.dts
\ No newline at end of file
diff --git a/arch/arm/dts/sun8i-a33-et-q8-v1.6.dts b/arch/arm/dts/sun8i-a33-et-q8-v1.6.dts
deleted file mode 100644
index 9c5750c2561..00000000000
--- a/arch/arm/dts/sun8i-a33-et-q8-v1.6.dts
+++ /dev/null
@@ -1,57 +0,0 @@
-/*
- * Copyright 2015 Hans de Goede <hdegoede@redhat.com>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-/dts-v1/;
-#include "sun8i-a33.dtsi"
-#include "sun8i-q8-common.dtsi"
-
-/ {
-	model = "Q8 A33 Tablet";
-	compatible = "allwinner,q8-a33", "allwinner,sun8i-a33";
-};
-
-&tcon0_out {
-	tcon0_out_lcd: endpoint@0 {
-		reg = <0>;
-		remote-endpoint = <&panel_input>;
-	};
-};
diff --git a/arch/arm/dts/sun8i-a33-et-q8-v1.6.dts b/arch/arm/dts/sun8i-a33-et-q8-v1.6.dts
new file mode 120000
index 00000000000..4519fd791a8
--- /dev/null
+++ b/arch/arm/dts/sun8i-a33-et-q8-v1.6.dts
@@ -0,0 +1 @@
+sun8i-a33-q8-tablet.dts
\ No newline at end of file
diff --git a/arch/arm/dts/sun8i-a33-ippo-q8h-v1.2.dts b/arch/arm/dts/sun8i-a33-ippo-q8h-v1.2.dts
deleted file mode 100644
index 9c5750c2561..00000000000
--- a/arch/arm/dts/sun8i-a33-ippo-q8h-v1.2.dts
+++ /dev/null
@@ -1,57 +0,0 @@
-/*
- * Copyright 2015 Hans de Goede <hdegoede@redhat.com>
- *
- * This file is dual-licensed: you can use it either under the terms
- * of the GPL or the X11 license, at your option. Note that this dual
- * licensing only applies to this file, and not this project as a
- * whole.
- *
- *  a) This file is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This file is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- * Or, alternatively,
- *
- *  b) Permission is hereby granted, free of charge, to any person
- *     obtaining a copy of this software and associated documentation
- *     files (the "Software"), to deal in the Software without
- *     restriction, including without limitation the rights to use,
- *     copy, modify, merge, publish, distribute, sublicense, and/or
- *     sell copies of the Software, and to permit persons to whom the
- *     Software is furnished to do so, subject to the following
- *     conditions:
- *
- *     The above copyright notice and this permission notice shall be
- *     included in all copies or substantial portions of the Software.
- *
- *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
- *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
- *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
- *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- *     OTHER DEALINGS IN THE SOFTWARE.
- */
-
-/dts-v1/;
-#include "sun8i-a33.dtsi"
-#include "sun8i-q8-common.dtsi"
-
-/ {
-	model = "Q8 A33 Tablet";
-	compatible = "allwinner,q8-a33", "allwinner,sun8i-a33";
-};
-
-&tcon0_out {
-	tcon0_out_lcd: endpoint@0 {
-		reg = <0>;
-		remote-endpoint = <&panel_input>;
-	};
-};
diff --git a/arch/arm/dts/sun8i-a33-ippo-q8h-v1.2.dts b/arch/arm/dts/sun8i-a33-ippo-q8h-v1.2.dts
new file mode 120000
index 00000000000..4519fd791a8
--- /dev/null
+++ b/arch/arm/dts/sun8i-a33-ippo-q8h-v1.2.dts
@@ -0,0 +1 @@
+sun8i-a33-q8-tablet.dts
\ No newline at end of file
diff --git a/arch/arm/dts/sun8i-h2-plus-bananapi-m2-zero.dts b/arch/arm/dts/sun8i-h2-plus-bananapi-m2-zero.dts
index d5c7b7984d8..d729b7c705d 100644
--- a/arch/arm/dts/sun8i-h2-plus-bananapi-m2-zero.dts
+++ b/arch/arm/dts/sun8i-h2-plus-bananapi-m2-zero.dts
@@ -47,10 +47,10 @@
 		};
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		sw4 {
+		switch-4 {
 			label = "power";
 			linux,code = <KEY_POWER>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
@@ -106,7 +106,7 @@
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "ext_clock";
 	};
 };
@@ -181,7 +181,7 @@
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
 		max-speed = <1500000>;
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "lpo";
 		vbat-supply = <&reg_vcc3v3>;
 		vddio-supply = <&reg_vcc3v3>;
diff --git a/arch/arm/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/dts/sun8i-h2-plus-orangepi-zero.dts
index f19ed981da9..3706216ffb4 100644
--- a/arch/arm/dts/sun8i-h2-plus-orangepi-zero.dts
+++ b/arch/arm/dts/sun8i-h2-plus-orangepi-zero.dts
@@ -169,7 +169,7 @@
 	flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
-		compatible = "mxicy,mx25l1606e", "winbond,w25q128";
+		compatible = "mxicy,mx25l1606e", "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <40000000>;
 	};
diff --git a/arch/arm/dts/sun8i-h3-beelink-x2.dts b/arch/arm/dts/sun8i-h3-beelink-x2.dts
index cd9f655e4f9..27a0d51289d 100644
--- a/arch/arm/dts/sun8i-h3-beelink-x2.dts
+++ b/arch/arm/dts/sun8i-h3-beelink-x2.dts
@@ -93,10 +93,10 @@
 		};
 	};
 
-	r-gpio-keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		power {
+		key-power {
 			label = "power";
 			linux,code = <KEY_POWER>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
@@ -125,7 +125,7 @@
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "ext_clock";
 	};
 };
diff --git a/arch/arm/dts/sun8i-h3-mapleboard-mp130.dts b/arch/arm/dts/sun8i-h3-mapleboard-mp130.dts
index ff0a7a952e0..f5c8ccc5b87 100644
--- a/arch/arm/dts/sun8i-h3-mapleboard-mp130.dts
+++ b/arch/arm/dts/sun8i-h3-mapleboard-mp130.dts
@@ -39,16 +39,16 @@
 		};
 	};
 
-	r_gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		power {
+		key-power {
 			label = "power";
 			linux,code = <KEY_POWER>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>; /* PL3 */
 		};
 
-		user {
+		key-user {
 			label = "user";
 			linux,code = <BTN_0>;
 			gpios = <&r_pio 0 4 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/dts/sun8i-h3-nanopi-duo2.dts b/arch/arm/dts/sun8i-h3-nanopi-duo2.dts
index 8e7dfcffe1f..43641cb8239 100644
--- a/arch/arm/dts/sun8i-h3-nanopi-duo2.dts
+++ b/arch/arm/dts/sun8i-h3-nanopi-duo2.dts
@@ -37,10 +37,10 @@
 		};
 	};
 
-	r_gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		k1 {
+		key-0 {
 			label = "k1";
 			linux,code = <BTN_0>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>; /* PL3 */
@@ -90,7 +90,7 @@
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "ext_clock";
 	};
 
@@ -151,7 +151,7 @@
 
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "lpo";
 		vbat-supply = <&reg_vcc3v3>;
 		vddio-supply = <&reg_vcc3v3>;
diff --git a/arch/arm/dts/sun8i-h3-nanopi-neo-air.dts b/arch/arm/dts/sun8i-h3-nanopi-neo-air.dts
index cd3df12b657..9e1a33f94ca 100644
--- a/arch/arm/dts/sun8i-h3-nanopi-neo-air.dts
+++ b/arch/arm/dts/sun8i-h3-nanopi-neo-air.dts
@@ -127,7 +127,7 @@
 
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "lpo";
 		vbat-supply = <&reg_vcc3v3>;
 		vddio-supply = <&reg_vcc3v3>;
diff --git a/arch/arm/dts/sun8i-h3-nanopi-r1.dts b/arch/arm/dts/sun8i-h3-nanopi-r1.dts
index 26e2e6172e0..42cd1131adf 100644
--- a/arch/arm/dts/sun8i-h3-nanopi-r1.dts
+++ b/arch/arm/dts/sun8i-h3-nanopi-r1.dts
@@ -46,7 +46,7 @@
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "ext_clock";
 	};
 
@@ -147,7 +147,7 @@
 
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "lpo";
 		vbat-supply = <&reg_vcc3v3>;
 		vddio-supply = <&reg_vcc3v3>;
diff --git a/arch/arm/dts/sun8i-h3-nanopi.dtsi b/arch/arm/dts/sun8i-h3-nanopi.dtsi
index fc45d5aaa67..cf8413fba6c 100644
--- a/arch/arm/dts/sun8i-h3-nanopi.dtsi
+++ b/arch/arm/dts/sun8i-h3-nanopi.dtsi
@@ -73,11 +73,10 @@
 		};
 	};
 
-	r_gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
-		input-name = "k1";
 
-		k1 {
+		key-0 {
 			label = "k1";
 			linux,code = <KEY_POWER>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/dts/sun8i-h3-orangepi-2.dts b/arch/arm/dts/sun8i-h3-orangepi-2.dts
index 9daffd90c12..f1f9dbead32 100644
--- a/arch/arm/dts/sun8i-h3-orangepi-2.dts
+++ b/arch/arm/dts/sun8i-h3-orangepi-2.dts
@@ -88,16 +88,16 @@
 		};
 	};
 
-	r_gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		sw2 {
+		switch-2 {
 			label = "sw2";
 			linux,code = <BTN_1>;
 			gpios = <&r_pio 0 4 GPIO_ACTIVE_LOW>;
 		};
 
-		sw4 {
+		switch-4 {
 			label = "sw4";
 			linux,code = <KEY_POWER>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/dts/sun8i-h3-orangepi-lite.dts b/arch/arm/dts/sun8i-h3-orangepi-lite.dts
index 6f9c97add54..305b34a321f 100644
--- a/arch/arm/dts/sun8i-h3-orangepi-lite.dts
+++ b/arch/arm/dts/sun8i-h3-orangepi-lite.dts
@@ -87,10 +87,10 @@
 		};
 	};
 
-	r_gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		sw4 {
+		switch-4 {
 			label = "sw4";
 			linux,code = <BTN_0>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/dts/sun8i-h3-orangepi-one.dts b/arch/arm/dts/sun8i-h3-orangepi-one.dts
index 4759ba3f298..59f6f6d5e7c 100644
--- a/arch/arm/dts/sun8i-h3-orangepi-one.dts
+++ b/arch/arm/dts/sun8i-h3-orangepi-one.dts
@@ -86,10 +86,10 @@
 		};
 	};
 
-	r_gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		sw4 {
+		switch-4 {
 			label = "sw4";
 			linux,code = <BTN_0>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/dts/sun8i-h3-orangepi-pc.dts b/arch/arm/dts/sun8i-h3-orangepi-pc.dts
index 90f75fa85e6..b96e015f54e 100644
--- a/arch/arm/dts/sun8i-h3-orangepi-pc.dts
+++ b/arch/arm/dts/sun8i-h3-orangepi-pc.dts
@@ -86,10 +86,10 @@
 		};
 	};
 
-	r_gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		sw4 {
+		switch-4 {
 			label = "sw4";
 			linux,code = <KEY_POWER>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/dts/sun8i-r16-bananapi-m2m.dts b/arch/arm/dts/sun8i-r16-bananapi-m2m.dts
index 293016d081c..f97218e70c1 100644
--- a/arch/arm/dts/sun8i-r16-bananapi-m2m.dts
+++ b/arch/arm/dts/sun8i-r16-bananapi-m2m.dts
@@ -91,7 +91,7 @@
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&r_pio 0 6 GPIO_ACTIVE_LOW>; /* PL06 */
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "ext_clock";
 	};
 };
@@ -283,7 +283,7 @@
 
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "lpo";
 		vbat-supply = <&reg_dldo1>;
 		vddio-supply = <&reg_aldo3>;
diff --git a/arch/arm/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/dts/sun8i-r40-bananapi-m2-ultra.dts
index a6a1087a0c9..28197bbcb1d 100644
--- a/arch/arm/dts/sun8i-r40-bananapi-m2-ultra.dts
+++ b/arch/arm/dts/sun8i-r40-bananapi-m2-ultra.dts
@@ -43,6 +43,7 @@
 
 /dts-v1/;
 #include "sun8i-r40.dtsi"
+#include "sun8i-r40-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
@@ -113,6 +114,10 @@
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &de {
 	status = "okay";
 };
diff --git a/arch/arm/dts/sun8i-r40-cpu-opp.dtsi b/arch/arm/dts/sun8i-r40-cpu-opp.dtsi
new file mode 100644
index 00000000000..649928b361a
--- /dev/null
+++ b/arch/arm/dts/sun8i-r40-cpu-opp.dtsi
@@ -0,0 +1,52 @@
+/{
+	cpu0_opp_table: opp-table-cpu {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-720000000 {
+			opp-hz = /bits/ 64 <720000000>;
+			opp-microvolt = <1000000 1000000 1300000>;
+			clock-latency-ns = <2000000>;
+		};
+
+		opp-912000000 {
+			opp-hz = /bits/ 64 <912000000>;
+			opp-microvolt = <1100000 1100000 1300000>;
+			clock-latency-ns = <2000000>;
+		};
+
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <1160000 1160000 1300000>;
+			clock-latency-ns = <2000000>;
+		};
+
+		opp-1104000000 {
+			opp-hz = /bits/ 64 <1104000000>;
+			opp-microvolt = <1240000 1240000 1300000>;
+			clock-latency-ns = <2000000>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <1300000 1300000 1300000>;
+			clock-latency-ns = <2000000>;
+		};
+	};
+};
+
+&cpu0 {
+	operating-points-v2 = <&cpu0_opp_table>;
+};
+
+&cpu1 {
+	operating-points-v2 = <&cpu0_opp_table>;
+};
+
+&cpu2 {
+	operating-points-v2 = <&cpu0_opp_table>;
+};
+
+&cpu3 {
+	operating-points-v2 = <&cpu0_opp_table>;
+};
diff --git a/arch/arm/dts/sun8i-r40-feta40i.dtsi b/arch/arm/dts/sun8i-r40-feta40i.dtsi
index 265e0fa57a3..9f39b5a2bb3 100644
--- a/arch/arm/dts/sun8i-r40-feta40i.dtsi
+++ b/arch/arm/dts/sun8i-r40-feta40i.dtsi
@@ -5,6 +5,11 @@
 //  Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.io>
 
 #include "sun8i-r40.dtsi"
+#include "sun8i-r40-cpu-opp.dtsi"
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
 
 &i2c0 {
 	status = "okay";
diff --git a/arch/arm/dts/sun8i-r40.dtsi b/arch/arm/dts/sun8i-r40.dtsi
index 03d3e5f45a0..4ef26d8f534 100644
--- a/arch/arm/dts/sun8i-r40.dtsi
+++ b/arch/arm/dts/sun8i-r40.dtsi
@@ -42,6 +42,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/sun6i-rtc.h>
 #include <dt-bindings/clock/sun8i-de2.h>
 #include <dt-bindings/clock/sun8i-r40-ccu.h>
 #include <dt-bindings/clock/sun8i-tcon-top.h>
@@ -84,24 +85,36 @@
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <0>;
+			clocks = <&ccu CLK_CPU>;
+			clock-names = "cpu";
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <1>;
+			clocks = <&ccu CLK_CPU>;
+			clock-names = "cpu";
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@2 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <2>;
+			clocks = <&ccu CLK_CPU>;
+			clock-names = "cpu";
+			#cooling-cells = <2>;
 		};
 
 		cpu3: cpu@3 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <3>;
+			clocks = <&ccu CLK_CPU>;
+			clock-names = "cpu";
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -117,6 +130,30 @@
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
+					temperature = <115000>;
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
 
 		gpu_thermal: gpu-thermal {
@@ -485,7 +522,7 @@
 		ccu: clock@1c20000 {
 			compatible = "allwinner,sun8i-r40-ccu";
 			reg = <0x01c20000 0x400>;
-			clocks = <&osc24M>, <&rtc 0>;
+			clocks = <&osc24M>, <&rtc CLK_OSC32K>;
 			clock-names = "hosc", "losc";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -504,7 +541,8 @@
 			compatible = "allwinner,sun8i-r40-pinctrl";
 			reg = <0x01c20800 0x400>;
 			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&rtc 0>;
+			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>,
+				 <&rtc CLK_OSC32K>;
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			interrupt-controller;
@@ -1231,7 +1269,7 @@
 			reg-io-width = <1>;
 			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_HDMI0>, <&ccu CLK_HDMI_SLOW>,
-				 <&ccu CLK_HDMI>, <&rtc 0>;
+				 <&ccu CLK_HDMI>, <&rtc CLK_OSC32K>;
 			clock-names = "iahb", "isfr", "tmds", "cec";
 			resets = <&ccu RST_BUS_HDMI1>;
 			reset-names = "ctrl";
diff --git a/arch/arm/dts/sun8i-t3-cqa3t-bv3.dts b/arch/arm/dts/sun8i-t3-cqa3t-bv3.dts
index 6931aaab238..9f472521f4a 100644
--- a/arch/arm/dts/sun8i-t3-cqa3t-bv3.dts
+++ b/arch/arm/dts/sun8i-t3-cqa3t-bv3.dts
@@ -45,6 +45,7 @@
 
 /dts-v1/;
 #include "sun8i-r40.dtsi"
+#include "sun8i-r40-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
@@ -88,6 +89,10 @@
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &de {
 	status = "okay";
 };
diff --git a/arch/arm/dts/sun8i-v3s.dtsi b/arch/arm/dts/sun8i-v3s.dtsi
index 084323d5c61..db194c606fd 100644
--- a/arch/arm/dts/sun8i-v3s.dtsi
+++ b/arch/arm/dts/sun8i-v3s.dtsi
@@ -42,6 +42,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/sun6i-rtc.h>
 #include <dt-bindings/clock/sun8i-v3s-ccu.h>
 #include <dt-bindings/reset/sun8i-v3s-ccu.h>
 #include <dt-bindings/clock/sun8i-de2.h>
@@ -321,7 +322,7 @@
 		ccu: clock@1c20000 {
 			compatible = "allwinner,sun8i-v3s-ccu";
 			reg = <0x01c20000 0x400>;
-			clocks = <&osc24M>, <&rtc 0>;
+			clocks = <&osc24M>, <&rtc CLK_OSC32K>;
 			clock-names = "hosc", "losc";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -342,7 +343,8 @@
 			reg = <0x01c20800 0x400>;
 			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&rtc 0>;
+			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>,
+				 <&rtc CLK_OSC32K>;
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			#gpio-cells = <3>;
diff --git a/arch/arm/dts/sun8i-v40-bananapi-m2-berry.dts b/arch/arm/dts/sun8i-v40-bananapi-m2-berry.dts
index 47954551f57..434871040ac 100644
--- a/arch/arm/dts/sun8i-v40-bananapi-m2-berry.dts
+++ b/arch/arm/dts/sun8i-v40-bananapi-m2-berry.dts
@@ -42,6 +42,7 @@
 
 /dts-v1/;
 #include "sun8i-r40.dtsi"
+#include "sun8i-r40-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
 
@@ -107,6 +108,10 @@
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
 &de {
 	status = "okay";
 };
diff --git a/arch/arm/dts/sun9i-a80.dtsi b/arch/arm/dts/sun9i-a80.dtsi
index ce4fa6706d0..7d3f3300f43 100644
--- a/arch/arm/dts/sun9i-a80.dtsi
+++ b/arch/arm/dts/sun9i-a80.dtsi
@@ -1218,7 +1218,6 @@
 				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&apbs_gates 0>, <&osc24M>, <&osc32k>;
 			clock-names = "apb", "hosc", "losc";
-			resets = <&apbs_rst 0>;
 			gpio-controller;
 			interrupt-controller;
 			#interrupt-cells = <3>;
diff --git a/arch/arm/dts/sunxi-bananapi-m2-plus.dtsi b/arch/arm/dts/sunxi-bananapi-m2-plus.dtsi
index d03f5853ef7..e899d14f38c 100644
--- a/arch/arm/dts/sunxi-bananapi-m2-plus.dtsi
+++ b/arch/arm/dts/sunxi-bananapi-m2-plus.dtsi
@@ -77,10 +77,10 @@
 		};
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		sw4 {
+		switch-4 {
 			label = "power";
 			linux,code = <KEY_POWER>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
@@ -101,7 +101,7 @@
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "ext_clock";
 	};
 };
@@ -221,7 +221,7 @@
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
 		max-speed = <1500000>;
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "lpo";
 		vbat-supply = <&reg_vcc3v3>;
 		vddio-supply = <&reg_vcc3v3>;
diff --git a/arch/arm/dts/sunxi-h3-h5-emlid-neutis.dtsi b/arch/arm/dts/sunxi-h3-h5-emlid-neutis.dtsi
index fc67e30fe21..60804b0e6c5 100644
--- a/arch/arm/dts/sunxi-h3-h5-emlid-neutis.dtsi
+++ b/arch/arm/dts/sunxi-h3-h5-emlid-neutis.dtsi
@@ -22,7 +22,7 @@
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&pio 2 7 GPIO_ACTIVE_LOW>; /* PC7 */
 		post-power-on-delay-ms = <200>;
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "ext_clock";
 	};
 };
@@ -124,7 +124,7 @@
 
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "lpo";
 		vbat-supply = <&reg_vcc3v3>;
 		vddio-supply = <&reg_vcc3v3>;
diff --git a/arch/arm/dts/sunxi-h3-h5.dtsi b/arch/arm/dts/sunxi-h3-h5.dtsi
index 6cea57e07f8..64391418609 100644
--- a/arch/arm/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/dts/sunxi-h3-h5.dtsi
@@ -40,6 +40,7 @@
  *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <dt-bindings/clock/sun6i-rtc.h>
 #include <dt-bindings/clock/sun8i-de2.h>
 #include <dt-bindings/clock/sun8i-h3-ccu.h>
 #include <dt-bindings/clock/sun8i-r-ccu.h>
@@ -386,7 +387,7 @@
 		ccu: clock@1c20000 {
 			/* compatible is in per SoC .dtsi file */
 			reg = <0x01c20000 0x400>;
-			clocks = <&osc24M>, <&rtc 0>;
+			clocks = <&osc24M>, <&rtc CLK_OSC32K>;
 			clock-names = "hosc", "losc";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -397,7 +398,8 @@
 			reg = <0x01c20800 0x400>;
 			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&rtc 0>;
+			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>,
+				 <&rtc CLK_OSC32K>;
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			#gpio-cells = <3>;
@@ -817,7 +819,7 @@
 			reg-io-width = <1>;
 			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_DDC>,
-				 <&ccu CLK_HDMI>, <&rtc 0>;
+				 <&ccu CLK_HDMI>, <&rtc CLK_OSC32K>;
 			clock-names = "iahb", "isfr", "tmds", "cec";
 			resets = <&ccu RST_BUS_HDMI1>;
 			reset-names = "ctrl";
@@ -876,7 +878,7 @@
 		r_ccu: clock@1f01400 {
 			compatible = "allwinner,sun8i-h3-r-ccu";
 			reg = <0x01f01400 0x100>;
-			clocks = <&osc24M>, <&rtc 0>, <&rtc 2>,
+			clocks = <&osc24M>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>,
 				 <&ccu CLK_PLL_PERIPH0>;
 			clock-names = "hosc", "losc", "iosc", "pll-periph";
 			#clock-cells = <1>;
@@ -928,7 +930,8 @@
 			compatible = "allwinner,sun8i-h3-r-pinctrl";
 			reg = <0x01f02c00 0x400>;
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&r_ccu CLK_APB0_PIO>, <&osc24M>, <&rtc 0>;
+			clocks = <&r_ccu CLK_APB0_PIO>, <&osc24M>,
+				 <&rtc CLK_OSC32K>;
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			#gpio-cells = <3>;
diff --git a/arch/arm/dts/sunxi-libretech-all-h3-cc.dtsi b/arch/arm/dts/sunxi-libretech-all-h3-cc.dtsi
index 9e14fe5fdcd..89731bb34c6 100644
--- a/arch/arm/dts/sunxi-libretech-all-h3-cc.dtsi
+++ b/arch/arm/dts/sunxi-libretech-all-h3-cc.dtsi
@@ -42,10 +42,10 @@
 		};
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		power {
+		key-power {
 			label = "power";
 			linux,code = <KEY_POWER>;
 			gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
-- 
2.35.3

