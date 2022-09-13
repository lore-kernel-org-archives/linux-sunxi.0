Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1196AAC
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Sep 2022 23:41:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B85A1A32;
	Tue, 13 Sep 2022 16:41:50 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C31BB3F73B;
	Tue, 13 Sep 2022 16:41:40 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/2] sunxi: dts: arm64: update devicetree files
Date: Wed, 14 Sep 2022 00:40:03 +0100
Message-Id: <20220913234004.24850-2-andre.przywara@arm.com>
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
This is covering the 64-bit SoCs, from arch/arm64/boot/dts/allwinner.

This avoids the not backwards-compatible r_intc binding change, to allow
older kernels to boot, but the other nodes are updated.

Not much change here, the vast majority is actually cosmetic: node names
and using symbolic names for the the RTC clocks.
Some A64 boards gain some audio nodes.
The H616 DTs are now switched to the version finally merged into the
kernel, which brings some changes, but none affecting U-Boot.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/dts/Makefile                       |   3 +-
 arch/arm/dts/sun50i-a64-amarula-relic.dts   |   2 +-
 arch/arm/dts/sun50i-a64-bananapi-m64.dts    |   4 +-
 arch/arm/dts/sun50i-a64-nanopi-a64.dts      |   2 +-
 arch/arm/dts/sun50i-a64-olinuxino.dts       |  30 ++
 arch/arm/dts/sun50i-a64-orangepi-win.dts    |   6 +-
 arch/arm/dts/sun50i-a64-pinebook.dts        |   4 +-
 arch/arm/dts/sun50i-a64-pinephone-1.0.dts   |   4 +
 arch/arm/dts/sun50i-a64-pinephone-1.1.dts   |   4 +
 arch/arm/dts/sun50i-a64-teres-i.dts         |   8 +
 arch/arm/dts/sun50i-a64.dtsi                |  10 +-
 arch/arm/dts/sun50i-h5-nanopi-r1s-h5.dts    |   4 +-
 arch/arm/dts/sun50i-h5-orangepi-pc2.dts     |   4 +-
 arch/arm/dts/sun50i-h5-orangepi-prime.dts   |   4 +-
 arch/arm/dts/sun50i-h6-orangepi-3.dts       |   4 +-
 arch/arm/dts/sun50i-h6-orangepi-lite2.dts   |   4 +-
 arch/arm/dts/sun50i-h6-tanix.dtsi           |   2 +-
 arch/arm/dts/sun50i-h6.dtsi                 |  12 +-
 arch/arm/dts/sun50i-h616-orangepi-zero2.dts |  55 +---
 arch/arm/dts/sun50i-h616-x96-mate.dts       | 177 ++++++++++++
 arch/arm/dts/sun50i-h616.dtsi               | 286 +++++---------------
 include/dt-bindings/clock/sun50i-h6-r-ccu.h |   1 +
 include/dt-bindings/clock/sun50i-h616-ccu.h |   1 +
 include/dt-bindings/clock/sun6i-rtc.h       |  10 +
 24 files changed, 353 insertions(+), 288 deletions(-)
 create mode 100644 arch/arm/dts/sun50i-h616-x96-mate.dts
 create mode 100644 include/dt-bindings/clock/sun6i-rtc.h

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 7330121dbab..a56bbd682a1 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -709,7 +709,8 @@ dtb-$(CONFIG_MACH_SUN50I_H6) += \
 	sun50i-h6-tanix-tx6.dtb \
 	sun50i-h6-tanix-tx6-mini.dtb
 dtb-$(CONFIG_MACH_SUN50I_H616) += \
-	sun50i-h616-orangepi-zero2.dtb
+	sun50i-h616-orangepi-zero2.dtb \
+	sun50i-h616-x96-mate.dtb
 dtb-$(CONFIG_MACH_SUN50I) += \
 	sun50i-a64-amarula-relic.dtb \
 	sun50i-a64-bananapi-m64.dtb \
diff --git a/arch/arm/dts/sun50i-a64-amarula-relic.dts b/arch/arm/dts/sun50i-a64-amarula-relic.dts
index c7bd73f35ed..ce8f6aa164e 100644
--- a/arch/arm/dts/sun50i-a64-amarula-relic.dts
+++ b/arch/arm/dts/sun50i-a64-amarula-relic.dts
@@ -58,7 +58,7 @@
 
 	wifi_pwrseq: wifi-pwrseq {
 		compatible = "mmc-pwrseq-simple";
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "ext_clock";
 		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* WL-PMU-EN: PL2 */
 	};
diff --git a/arch/arm/dts/sun50i-a64-bananapi-m64.dts b/arch/arm/dts/sun50i-a64-bananapi-m64.dts
index f7fe9fa50cb..bf66b640816 100644
--- a/arch/arm/dts/sun50i-a64-bananapi-m64.dts
+++ b/arch/arm/dts/sun50i-a64-bananapi-m64.dts
@@ -56,7 +56,7 @@
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "ext_clock";
 	};
 };
@@ -355,7 +355,7 @@
 
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "lpo";
 		vbat-supply = <&reg_dldo2>;
 		vddio-supply = <&reg_dldo4>;
diff --git a/arch/arm/dts/sun50i-a64-nanopi-a64.dts b/arch/arm/dts/sun50i-a64-nanopi-a64.dts
index 09b3c7fb82c..ffc3b4c7068 100644
--- a/arch/arm/dts/sun50i-a64-nanopi-a64.dts
+++ b/arch/arm/dts/sun50i-a64-nanopi-a64.dts
@@ -43,7 +43,7 @@
 
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "ext_clock";
 		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
 	};
diff --git a/arch/arm/dts/sun50i-a64-olinuxino.dts b/arch/arm/dts/sun50i-a64-olinuxino.dts
index f3f8e177ab6..22d350249c1 100644
--- a/arch/arm/dts/sun50i-a64-olinuxino.dts
+++ b/arch/arm/dts/sun50i-a64-olinuxino.dts
@@ -58,6 +58,15 @@
 	};
 };
 
+&codec {
+	status = "okay";
+};
+
+&codec_analog {
+	cpvdd-supply = <&reg_eldo1>;
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
@@ -74,6 +83,10 @@
 	cpu-supply = <&reg_dcdc2>;
 };
 
+&dai {
+	status = "okay";
+};
+
 &de {
 	status = "okay";
 };
@@ -328,6 +341,23 @@
 	vcc-hdmi-supply = <&reg_dldo1>;
 };
 
+&sound {
+	simple-audio-card,aux-devs = <&codec_analog>;
+	simple-audio-card,widgets = "Microphone", "Microphone Jack Left",
+		    "Microphone", "Microphone Jack Right",
+		    "Headphone", "Headphone Jack";
+	simple-audio-card,routing = "Left DAC", "DACL",
+		    "Right DAC", "DACR",
+		    "Headphone Jack", "HP",
+		    "ADCL", "Left ADC",
+		    "ADCR", "Right ADC",
+		    "Microphone Jack Left", "MBIAS",
+		    "MIC1", "Microphone Jack Left",
+		    "Microphone Jack Right", "MBIAS",
+		    "MIC2", "Microphone Jack Right";
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
diff --git a/arch/arm/dts/sun50i-a64-orangepi-win.dts b/arch/arm/dts/sun50i-a64-orangepi-win.dts
index 8eee8051ac5..714a270a558 100644
--- a/arch/arm/dts/sun50i-a64-orangepi-win.dts
+++ b/arch/arm/dts/sun50i-a64-orangepi-win.dts
@@ -40,7 +40,7 @@
 	leds {
 		compatible = "gpio-leds";
 
-		status {
+		led-0 {
 			label = "orangepi:green:status";
 			gpios = <&pio 7 11 GPIO_ACTIVE_HIGH>; /* PH11 */
 		};
@@ -71,7 +71,7 @@
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&r_pio 0 8 GPIO_ACTIVE_LOW>; /* PL8 */
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "ext_clock";
 	};
 };
@@ -369,7 +369,7 @@
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
 		max-speed = <1500000>;
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "lpo";
 		vbat-supply = <&reg_dldo2>;
 		vddio-supply = <&reg_dldo4>;
diff --git a/arch/arm/dts/sun50i-a64-pinebook.dts b/arch/arm/dts/sun50i-a64-pinebook.dts
index 68b6ab4707c..c00c4c1e9e7 100644
--- a/arch/arm/dts/sun50i-a64-pinebook.dts
+++ b/arch/arm/dts/sun50i-a64-pinebook.dts
@@ -35,10 +35,10 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		lid_switch {
+		lid-switch {
 			label = "Lid Switch";
 			gpios = <&r_pio 0 12 GPIO_ACTIVE_LOW>; /* PL12 */
 			linux,input-type = <EV_SW>;
diff --git a/arch/arm/dts/sun50i-a64-pinephone-1.0.dts b/arch/arm/dts/sun50i-a64-pinephone-1.0.dts
index fb65319a3bd..219f720b8b7 100644
--- a/arch/arm/dts/sun50i-a64-pinephone-1.0.dts
+++ b/arch/arm/dts/sun50i-a64-pinephone-1.0.dts
@@ -10,6 +10,10 @@
 	compatible = "pine64,pinephone-1.0", "pine64,pinephone", "allwinner,sun50i-a64";
 };
 
+&codec_analog {
+	allwinner,internal-bias-resistor;
+};
+
 &sgm3140 {
 	enable-gpios = <&pio 2 3 GPIO_ACTIVE_HIGH>; /* PC3 */
 	flash-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* PD24 */
diff --git a/arch/arm/dts/sun50i-a64-pinephone-1.1.dts b/arch/arm/dts/sun50i-a64-pinephone-1.1.dts
index 5e59d375217..723af64a9ce 100644
--- a/arch/arm/dts/sun50i-a64-pinephone-1.1.dts
+++ b/arch/arm/dts/sun50i-a64-pinephone-1.1.dts
@@ -29,6 +29,10 @@
 	default-brightness-level = <400>;
 };
 
+&codec_analog {
+	allwinner,internal-bias-resistor;
+};
+
 &sgm3140 {
 	enable-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* PD24 */
 	flash-gpios = <&pio 2 3 GPIO_ACTIVE_HIGH>; /* PC3 */
diff --git a/arch/arm/dts/sun50i-a64-teres-i.dts b/arch/arm/dts/sun50i-a64-teres-i.dts
index 6668431dcb4..945afdb508d 100644
--- a/arch/arm/dts/sun50i-a64-teres-i.dts
+++ b/arch/arm/dts/sun50i-a64-teres-i.dts
@@ -197,6 +197,14 @@
 	status = "okay";
 };
 
+&pio {
+	vcc-pc-supply = <&reg_dcdc1>;
+	vcc-pd-supply = <&reg_dldo2>;
+	vcc-pe-supply = <&reg_aldo1>;
+	vcc-pf-supply = <&reg_dcdc1>;  /* No dedicated supply-pin for this */
+	vcc-pg-supply = <&reg_aldo2>;
+};
+
 &pwm {
 	status = "okay";
 };
diff --git a/arch/arm/dts/sun50i-a64.dtsi b/arch/arm/dts/sun50i-a64.dtsi
index 555bc92a6f8..b04f492c0f2 100644
--- a/arch/arm/dts/sun50i-a64.dtsi
+++ b/arch/arm/dts/sun50i-a64.dtsi
@@ -4,6 +4,7 @@
 //    Copyright (C) 2015 Jens Kuske <jenskuske@gmail.com>
 
 #include <dt-bindings/clock/sun50i-a64-ccu.h>
+#include <dt-bindings/clock/sun6i-rtc.h>
 #include <dt-bindings/clock/sun8i-de2.h>
 #include <dt-bindings/clock/sun8i-r-ccu.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -660,7 +661,7 @@
 		ccu: clock@1c20000 {
 			compatible = "allwinner,sun50i-a64-ccu";
 			reg = <0x01c20000 0x400>;
-			clocks = <&osc24M>, <&rtc 0>;
+			clocks = <&osc24M>, <&rtc CLK_OSC32K>;
 			clock-names = "hosc", "losc";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -672,7 +673,8 @@
 			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&rtc 0>;
+			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>,
+				 <&rtc CLK_OSC32K>;
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			#gpio-cells = <3>;
@@ -1224,7 +1226,7 @@
 			reg-io-width = <1>;
 			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_DDC>,
-				 <&ccu CLK_HDMI>, <&rtc 0>;
+				 <&ccu CLK_HDMI>, <&rtc CLK_OSC32K>;
 			clock-names = "iahb", "isfr", "tmds", "cec";
 			resets = <&ccu RST_BUS_HDMI1>;
 			reset-names = "ctrl";
@@ -1284,7 +1286,7 @@
 		r_ccu: clock@1f01400 {
 			compatible = "allwinner,sun50i-a64-r-ccu";
 			reg = <0x01f01400 0x100>;
-			clocks = <&osc24M>, <&rtc 0>, <&rtc 2>,
+			clocks = <&osc24M>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>,
 				 <&ccu CLK_PLL_PERIPH0>;
 			clock-names = "hosc", "losc", "iosc", "pll-periph";
 			#clock-cells = <1>;
diff --git a/arch/arm/dts/sun50i-h5-nanopi-r1s-h5.dts b/arch/arm/dts/sun50i-h5-nanopi-r1s-h5.dts
index 55b369534a0..a3e040da38a 100644
--- a/arch/arm/dts/sun50i-h5-nanopi-r1s-h5.dts
+++ b/arch/arm/dts/sun50i-h5-nanopi-r1s-h5.dts
@@ -52,10 +52,10 @@
 		};
 	};
 
-	r-gpio-keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		reset {
+		key-reset {
 			label = "reset";
 			linux,code = <KEY_RESTART>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/dts/sun50i-h5-orangepi-pc2.dts b/arch/arm/dts/sun50i-h5-orangepi-pc2.dts
index 1010c1b22d2..b5c1ff19b4c 100644
--- a/arch/arm/dts/sun50i-h5-orangepi-pc2.dts
+++ b/arch/arm/dts/sun50i-h5-orangepi-pc2.dts
@@ -54,10 +54,10 @@
 		};
 	};
 
-	r-gpio-keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		sw4 {
+		key-sw4 {
 			label = "sw4";
 			linux,code = <BTN_0>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/dts/sun50i-h5-orangepi-prime.dts b/arch/arm/dts/sun50i-h5-orangepi-prime.dts
index 74e0444af19..d7f8bad6bb9 100644
--- a/arch/arm/dts/sun50i-h5-orangepi-prime.dts
+++ b/arch/arm/dts/sun50i-h5-orangepi-prime.dts
@@ -48,10 +48,10 @@
 		};
 	};
 
-	r-gpio-keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
-		sw4 {
+		key-sw4 {
 			label = "sw4";
 			linux,code = <BTN_0>;
 			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/dts/sun50i-h6-orangepi-3.dts b/arch/arm/dts/sun50i-h6-orangepi-3.dts
index 9f12c05e21f..f1957bb1edb 100644
--- a/arch/arm/dts/sun50i-h6-orangepi-3.dts
+++ b/arch/arm/dts/sun50i-h6-orangepi-3.dts
@@ -86,7 +86,7 @@
 
 	wifi_pwrseq: wifi-pwrseq {
 		compatible = "mmc-pwrseq-simple";
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "ext_clock";
 		reset-gpios = <&r_pio 1 3 GPIO_ACTIVE_LOW>; /* PM3 */
 		post-power-on-delay-ms = <200>;
@@ -314,7 +314,7 @@
 
 	bluetooth {
 		compatible = "brcm,bcm4345c5";
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "lpo";
 		device-wakeup-gpios = <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 */
 		host-wakeup-gpios = <&r_pio 1 1 GPIO_ACTIVE_HIGH>; /* PM1 */
diff --git a/arch/arm/dts/sun50i-h6-orangepi-lite2.dts b/arch/arm/dts/sun50i-h6-orangepi-lite2.dts
index e8770858b5d..fb31dcb1cb6 100644
--- a/arch/arm/dts/sun50i-h6-orangepi-lite2.dts
+++ b/arch/arm/dts/sun50i-h6-orangepi-lite2.dts
@@ -13,7 +13,7 @@
 
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "ext_clock";
 		reset-gpios = <&r_pio 1 3 GPIO_ACTIVE_LOW>; /* PM3 */
 		post-power-on-delay-ms = <200>;
@@ -64,7 +64,7 @@
 
 	bluetooth {
 		compatible = "brcm,bcm4345c5";
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "lpo";
 		device-wakeup-gpios = <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 */
 		host-wakeup-gpios = <&r_pio 1 1 GPIO_ACTIVE_HIGH>; /* PM1 */
diff --git a/arch/arm/dts/sun50i-h6-tanix.dtsi b/arch/arm/dts/sun50i-h6-tanix.dtsi
index edb71e4a030..4903d635811 100644
--- a/arch/arm/dts/sun50i-h6-tanix.dtsi
+++ b/arch/arm/dts/sun50i-h6-tanix.dtsi
@@ -78,7 +78,7 @@
 
 	wifi_pwrseq: wifi-pwrseq {
 		compatible = "mmc-pwrseq-simple";
-		clocks = <&rtc 1>;
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
 		clock-names = "ext_clock";
 		reset-gpios = <&r_pio 1 3 GPIO_ACTIVE_LOW>; /* PM3 */
 	};
diff --git a/arch/arm/dts/sun50i-h6.dtsi b/arch/arm/dts/sun50i-h6.dtsi
index 71a45a624da..afbbfc25269 100644
--- a/arch/arm/dts/sun50i-h6.dtsi
+++ b/arch/arm/dts/sun50i-h6.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/sun50i-h6-ccu.h>
 #include <dt-bindings/clock/sun50i-h6-r-ccu.h>
+#include <dt-bindings/clock/sun6i-rtc.h>
 #include <dt-bindings/clock/sun8i-de2.h>
 #include <dt-bindings/clock/sun8i-tcon-top.h>
 #include <dt-bindings/reset/sun50i-h6-ccu.h>
@@ -237,7 +238,7 @@
 		ccu: clock@3001000 {
 			compatible = "allwinner,sun50i-h6-ccu";
 			reg = <0x03001000 0x1000>;
-			clocks = <&osc24M>, <&rtc 0>, <&rtc 2>;
+			clocks = <&osc24M>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>;
 			clock-names = "hosc", "losc", "iosc";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -316,7 +317,7 @@
 				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_APB1>, <&osc24M>, <&rtc 0>;
+			clocks = <&ccu CLK_APB1>, <&osc24M>, <&rtc CLK_OSC32K>;
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			#gpio-cells = <3>;
@@ -724,7 +725,7 @@
 			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_XHCI>,
 				 <&ccu CLK_BUS_XHCI>,
-				 <&rtc 0>;
+				 <&rtc CLK_OSC32K>;
 			clock-names = "ref", "bus_early", "suspend";
 			resets = <&ccu RST_BUS_XHCI>;
 			/*
@@ -929,7 +930,7 @@
 		r_ccu: clock@7010000 {
 			compatible = "allwinner,sun50i-h6-r-ccu";
 			reg = <0x07010000 0x400>;
-			clocks = <&osc24M>, <&rtc 0>, <&rtc 2>,
+			clocks = <&osc24M>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>,
 				 <&ccu CLK_PLL_PERIPH0>;
 			clock-names = "hosc", "losc", "iosc", "pll-periph";
 			#clock-cells = <1>;
@@ -958,7 +959,8 @@
 			reg = <0x07022000 0x400>;
 			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&r_ccu CLK_R_APB1>, <&osc24M>, <&rtc 0>;
+			clocks = <&r_ccu CLK_R_APB1>, <&osc24M>,
+				 <&rtc CLK_OSC32K>;
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			#gpio-cells = <3>;
diff --git a/arch/arm/dts/sun50i-h616-orangepi-zero2.dts b/arch/arm/dts/sun50i-h616-orangepi-zero2.dts
index e6de49f89e3..02893f3ac99 100644
--- a/arch/arm/dts/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm/dts/sun50i-h616-orangepi-zero2.dts
@@ -49,29 +49,8 @@
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 	};
-
-	reg_usb1_vbus: usb1-vbus {
-		compatible = "regulator-fixed";
-		regulator-name = "usb1-vbus";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&reg_vcc5v>;
-		enable-active-high;
-		gpio = <&pio 2 16 GPIO_ACTIVE_HIGH>; /* PC16 */
-		status = "okay";
-	};
-};
-
-&ehci0 {
-	status = "okay";
-};
-
-&ehci1 {
-	status = "okay";
 };
 
-/* USB 2 & 3 are on headers only. */
-
 &emac0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&ext_rgmii_pins>;
@@ -97,14 +76,6 @@
 	status = "okay";
 };
 
-&ohci0 {
-	status = "okay";
-};
-
-&ohci1 {
-	status = "okay";
-};
-
 &r_rsb {
 	status = "okay";
 
@@ -181,14 +152,14 @@
 			reg_dcdca: dcdca {
 				regulator-always-on;
 				regulator-min-microvolt = <810000>;
-				regulator-max-microvolt = <1080000>;
+				regulator-max-microvolt = <1100000>;
 				regulator-name = "vdd-cpu";
 			};
 
 			reg_dcdcc: dcdcc {
 				regulator-always-on;
 				regulator-min-microvolt = <810000>;
-				regulator-max-microvolt = <1080000>;
+				regulator-max-microvolt = <990000>;
 				regulator-name = "vdd-gpu-sys";
 			};
 
@@ -200,7 +171,7 @@
 			};
 
 			reg_dcdce: dcdce {
-				regulator-boot-on;
+				regulator-always-on;
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-name = "vcc-eth-mmc";
@@ -213,8 +184,18 @@
 	};
 };
 
+&pio {
+	vcc-pc-supply = <&reg_aldo1>;
+	vcc-pf-supply = <&reg_aldo1>;
+	vcc-pg-supply = <&reg_bldo1>;
+	vcc-ph-supply = <&reg_aldo1>;
+	vcc-pi-supply = <&reg_aldo1>;
+};
+
 &spi0  {
 	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pins>, <&spi0_cs0_pin>;
 
 	flash@0 {
 		#address-cells = <1>;
@@ -230,13 +211,3 @@
 	pinctrl-0 = <&uart0_ph_pins>;
 	status = "okay";
 };
-
-&usbotg {
-	dr_mode = "peripheral";
-	status = "okay";
-};
-
-&usbphy {
-	usb1_vbus-supply = <&reg_usb1_vbus>;
-	status = "okay";
-};
diff --git a/arch/arm/dts/sun50i-h616-x96-mate.dts b/arch/arm/dts/sun50i-h616-x96-mate.dts
new file mode 100644
index 00000000000..6619db34714
--- /dev/null
+++ b/arch/arm/dts/sun50i-h616-x96-mate.dts
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: (GPL-2.0+ or MIT)
+/*
+ * Copyright (C) 2021 Arm Ltd.
+ */
+
+/dts-v1/;
+
+#include "sun50i-h616.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	model = "X96 Mate";
+	compatible = "hechuang,x96-mate", "allwinner,sun50i-h616";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_vcc5v: vcc5v {
+		/* board wide 5V supply directly from the DC input */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+};
+
+&ir {
+	status = "okay";
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_dcdce>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
+	bus-width = <4>;
+	status = "okay";
+};
+
+&mmc2 {
+	vmmc-supply = <&reg_dcdce>;
+	vqmmc-supply = <&reg_bldo1>;
+	bus-width = <8>;
+	non-removable;
+	cap-mmc-hw-reset;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	status = "okay";
+};
+
+&r_rsb {
+	status = "okay";
+
+	axp305: pmic@745 {
+		compatible = "x-powers,axp305", "x-powers,axp805",
+			     "x-powers,axp806";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		reg = <0x745>;
+
+		x-powers,self-working-mode;
+		vina-supply = <&reg_vcc5v>;
+		vinb-supply = <&reg_vcc5v>;
+		vinc-supply = <&reg_vcc5v>;
+		vind-supply = <&reg_vcc5v>;
+		vine-supply = <&reg_vcc5v>;
+		aldoin-supply = <&reg_vcc5v>;
+		bldoin-supply = <&reg_vcc5v>;
+		cldoin-supply = <&reg_vcc5v>;
+
+		regulators {
+			reg_aldo1: aldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-sys";
+			};
+
+			/* Enabled by the Android BSP */
+			reg_aldo2: aldo2 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc3v3-ext";
+				status = "disabled";
+			};
+
+			/* Enabled by the Android BSP */
+			reg_aldo3: aldo3 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc3v3-ext2";
+				status = "disabled";
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc1v8";
+			};
+
+			/* Enabled by the Android BSP */
+			reg_bldo2: bldo2 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc1v8-2";
+				status = "disabled";
+			};
+
+			bldo3 {
+				/* unused */
+			};
+
+			bldo4 {
+				/* unused */
+			};
+
+			cldo1 {
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
+				regulator-name = "vcc2v5";
+			};
+
+			cldo2 {
+				/* unused */
+			};
+
+			cldo3 {
+				/* unused */
+			};
+
+			reg_dcdca: dcdca {
+				regulator-always-on;
+				regulator-min-microvolt = <810000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-name = "vdd-cpu";
+			};
+
+			reg_dcdcc: dcdcc {
+				regulator-always-on;
+				regulator-min-microvolt = <810000>;
+				regulator-max-microvolt = <990000>;
+				regulator-name = "vdd-gpu-sys";
+			};
+
+			reg_dcdcd: dcdcd {
+				regulator-always-on;
+				regulator-min-microvolt = <1360000>;
+				regulator-max-microvolt = <1360000>;
+				regulator-name = "vdd-dram";
+			};
+
+			reg_dcdce: dcdce {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-eth-mmc";
+			};
+
+			sw {
+				/* unused */
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
diff --git a/arch/arm/dts/sun50i-h616.dtsi b/arch/arm/dts/sun50i-h616.dtsi
index 2f71e853e96..622a1f7d164 100644
--- a/arch/arm/dts/sun50i-h616.dtsi
+++ b/arch/arm/dts/sun50i-h616.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/sun50i-h616-ccu.h>
 #include <dt-bindings/clock/sun50i-h6-r-ccu.h>
+#include <dt-bindings/clock/sun6i-rtc.h>
 #include <dt-bindings/reset/sun50i-h616-ccu.h>
 #include <dt-bindings/reset/sun50i-h6-r-ccu.h>
 
@@ -51,7 +52,23 @@
 		};
 	};
 
-	osc24M: osc24M_clk {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * 256 KiB reserved for Trusted Firmware-A (BL31).
+		 * This is added by BL31 itself, but some bootloaders fail
+		 * to propagate this into the DTB handed to kernels.
+		 */
+		secmon@40000000 {
+			reg = <0x0 0x40000000 0x0 0x40000>;
+			no-map;
+		};
+	};
+
+	osc24M: osc24M-clk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <24000000>;
@@ -110,7 +127,7 @@
 		ccu: clock@3001000 {
 			compatible = "allwinner,sun50i-h616-ccu";
 			reg = <0x03001000 0x1000>;
-			clocks = <&osc24M>, <&rtc 0>, <&rtc 2>;
+			clocks = <&osc24M>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>;
 			clock-names = "hosc", "losc", "iosc";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -135,7 +152,7 @@
 				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_APB1>, <&osc24M>, <&rtc 0>;
+			clocks = <&ccu CLK_APB1>, <&osc24M>, <&rtc CLK_OSC32K>;
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			#gpio-cells = <3>;
@@ -161,7 +178,7 @@
 				function = "i2c3";
 			};
 
-			ir_rx_pin: ir_rx_pin {
+			ir_rx_pin: ir-rx-pin {
 				pins = "PH10";
 				function = "ir_rx";
 			};
@@ -174,6 +191,7 @@
 				bias-pull-up;
 			};
 
+			/omit-if-no-ref/
 			mmc1_pins: mmc1-pins {
 				pins = "PG0", "PG1", "PG2", "PG3",
 				       "PG4", "PG5";
@@ -191,17 +209,26 @@
 				bias-pull-up;
 			};
 
+			/omit-if-no-ref/
 			spi0_pins: spi0-pins {
-				pins = "PC0", "PC2", "PC3", "PC4";
+				pins = "PC0", "PC2", "PC4";
 				function = "spi0";
 			};
 
+			/omit-if-no-ref/
+			spi0_cs0_pin: spi0-cs0-pin {
+				pins = "PC3";
+				function = "spi0";
+			};
+
+			/omit-if-no-ref/
 			spi1_pins: spi1-pins {
 				pins = "PH6", "PH7", "PH8";
 				function = "spi1";
 			};
 
-			spi1_cs_pin: spi1-cs-pin {
+			/omit-if-no-ref/
+			spi1_cs0_pin: spi1-cs0-pin {
 				pins = "PH5";
 				function = "spi1";
 			};
@@ -211,11 +238,13 @@
 				function = "uart0";
 			};
 
+			/omit-if-no-ref/
 			uart1_pins: uart1-pins {
 				pins = "PG6", "PG7";
 				function = "uart1";
 			};
 
+			/omit-if-no-ref/
 			uart1_rts_cts_pins: uart1-rts-cts-pins {
 				pins = "PG8", "PG9";
 				function = "uart1";
@@ -245,10 +274,10 @@
 			pinctrl-names = "default";
 			pinctrl-0 = <&mmc0_pins>;
 			status = "disabled";
+			max-frequency = <150000000>;
 			cap-sd-highspeed;
 			cap-mmc-highspeed;
 			mmc-ddr-3_3v;
-			mmc-ddr-1_8v;
 			cap-sdio-irq;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -266,10 +295,10 @@
 			pinctrl-names = "default";
 			pinctrl-0 = <&mmc1_pins>;
 			status = "disabled";
+			max-frequency = <150000000>;
 			cap-sd-highspeed;
 			cap-mmc-highspeed;
 			mmc-ddr-3_3v;
-			mmc-ddr-1_8v;
 			cap-sdio-irq;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -287,10 +316,10 @@
 			pinctrl-names = "default";
 			pinctrl-0 = <&mmc2_pins>;
 			status = "disabled";
+			max-frequency = <150000000>;
 			cap-sd-highspeed;
 			cap-mmc-highspeed;
 			mmc-ddr-3_3v;
-			mmc-ddr-1_8v;
 			cap-sdio-irq;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -364,6 +393,7 @@
 
 		i2c0: i2c@5002000 {
 			compatible = "allwinner,sun50i-h616-i2c",
+				     "allwinner,sun8i-v536-i2c",
 				     "allwinner,sun6i-a31-i2c";
 			reg = <0x05002000 0x400>;
 			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
@@ -378,6 +408,7 @@
 
 		i2c1: i2c@5002400 {
 			compatible = "allwinner,sun50i-h616-i2c",
+				     "allwinner,sun8i-v536-i2c",
 				     "allwinner,sun6i-a31-i2c";
 			reg = <0x05002400 0x400>;
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
@@ -390,6 +421,7 @@
 
 		i2c2: i2c@5002800 {
 			compatible = "allwinner,sun50i-h616-i2c",
+				     "allwinner,sun8i-v536-i2c",
 				     "allwinner,sun6i-a31-i2c";
 			reg = <0x05002800 0x400>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
@@ -402,6 +434,7 @@
 
 		i2c3: i2c@5002c00 {
 			compatible = "allwinner,sun50i-h616-i2c",
+				     "allwinner,sun8i-v536-i2c",
 				     "allwinner,sun6i-a31-i2c";
 			reg = <0x05002c00 0x400>;
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
@@ -414,6 +447,7 @@
 
 		i2c4: i2c@5003000 {
 			compatible = "allwinner,sun50i-h616-i2c",
+				     "allwinner,sun8i-v536-i2c",
 				     "allwinner,sun6i-a31-i2c";
 			reg = <0x05003000 0x400>;
 			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
@@ -432,8 +466,6 @@
 			clocks = <&ccu CLK_BUS_SPI0>, <&ccu CLK_SPI0>;
 			clock-names = "ahb", "mod";
 			resets = <&ccu RST_BUS_SPI0>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&spi0_pins>;
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -447,224 +479,46 @@
 			clocks = <&ccu CLK_BUS_SPI1>, <&ccu CLK_SPI1>;
 			clock-names = "ahb", "mod";
 			resets = <&ccu RST_BUS_SPI1>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&spi1_pins>;
 			status = "disabled";
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
 
 		emac0: ethernet@5020000 {
-			compatible = "allwinner,sun50i-h616-emac",
+			compatible = "allwinner,sun50i-h616-emac0",
 				     "allwinner,sun50i-a64-emac";
-			syscon = <&syscon>;
 			reg = <0x05020000 0x10000>;
 			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
-			resets = <&ccu RST_BUS_EMAC0>;
-			reset-names = "stmmaceth";
 			clocks = <&ccu CLK_BUS_EMAC0>;
 			clock-names = "stmmaceth";
-			status = "disabled";
-
-			mdio0: mdio {
-				compatible = "snps,dwmac-mdio";
-				#address-cells = <1>;
-				#size-cells = <0>;
-			};
-		};
-
-		emac1: ethernet@5030000 {
-			compatible = "allwinner,sun50i-h616-emac";
-			syscon = <&syscon 1>;
-			reg = <0x05030000 0x10000>;
-			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "macirq";
-			resets = <&ccu RST_BUS_EMAC1>;
+			resets = <&ccu RST_BUS_EMAC0>;
 			reset-names = "stmmaceth";
-			clocks = <&ccu CLK_BUS_EMAC1>;
-			clock-names = "stmmaceth";
+			syscon = <&syscon>;
 			status = "disabled";
 
-			mdio1: mdio {
+			mdio0: mdio {
 				compatible = "snps,dwmac-mdio";
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
 		};
 
-		usbotg: usb@5100000 {
-			compatible = "allwinner,sun50i-h616-musb",
-				     "allwinner,sun8i-h3-musb";
-			reg = <0x05100000 0x0400>;
-			clocks = <&ccu CLK_BUS_OTG>;
-			resets = <&ccu RST_BUS_OTG>;
-			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "mc";
-			phys = <&usbphy 0>;
-			phy-names = "usb";
-			extcon = <&usbphy 0>;
-			status = "disabled";
-		};
-
-		usbphy: phy@5100400 {
-			compatible = "allwinner,sun50i-h616-usb-phy";
-			reg = <0x05100400 0x24>,
-			      <0x05101800 0x14>,
-			      <0x05200800 0x14>,
-			      <0x05310800 0x14>,
-			      <0x05311800 0x14>;
-			reg-names = "phy_ctrl",
-				    "pmu0",
-				    "pmu1",
-				    "pmu2",
-				    "pmu3";
-			clocks = <&ccu CLK_USB_PHY0>,
-				 <&ccu CLK_USB_PHY1>,
-				 <&ccu CLK_USB_PHY2>,
-				 <&ccu CLK_USB_PHY3>;
-			clock-names = "usb0_phy",
-				      "usb1_phy",
-				      "usb2_phy",
-				      "usb3_phy";
-			resets = <&ccu RST_USB_PHY0>,
-				 <&ccu RST_USB_PHY1>,
-				 <&ccu RST_USB_PHY2>,
-				 <&ccu RST_USB_PHY3>;
-			reset-names = "usb0_reset",
-				      "usb1_reset",
-				      "usb2_reset",
-				      "usb3_reset";
-			status = "disabled";
-			#phy-cells = <1>;
-		};
-
-		ehci0: usb@5101000 {
-			compatible = "allwinner,sun50i-h616-ehci",
-				     "generic-ehci";
-			reg = <0x05101000 0x100>;
-			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_BUS_OHCI0>,
-				 <&ccu CLK_BUS_EHCI0>,
-				 <&ccu CLK_USB_OHCI0>;
-			resets = <&ccu RST_BUS_OHCI0>,
-				 <&ccu RST_BUS_EHCI0>;
-			phys = <&usbphy 0>;
-			phy-names = "usb";
-			status = "disabled";
-		};
-
-		ohci0: usb@5101400 {
-			compatible = "allwinner,sun50i-h616-ohci",
-				     "generic-ohci";
-			reg = <0x05101400 0x100>;
-			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_BUS_OHCI0>,
-				 <&ccu CLK_USB_OHCI0>;
-			resets = <&ccu RST_BUS_OHCI0>;
-			phys = <&usbphy 0>;
-			phy-names = "usb";
-			status = "disabled";
-		};
-
-		ehci1: usb@5200000 {
-			compatible = "allwinner,sun50i-h616-ehci",
-				     "generic-ehci";
-			reg = <0x05200000 0x100>;
-			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_BUS_OHCI1>,
-				 <&ccu CLK_BUS_EHCI1>,
-				 <&ccu CLK_USB_OHCI1>;
-			resets = <&ccu RST_BUS_OHCI1>,
-				 <&ccu RST_BUS_EHCI1>;
-			phys = <&usbphy 1>;
-			phy-names = "usb";
-			status = "disabled";
-		};
-
-		ohci1: usb@5200400 {
-			compatible = "allwinner,sun50i-h616-ohci",
-				     "generic-ohci";
-			reg = <0x05200400 0x100>;
-			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_BUS_OHCI1>,
-				 <&ccu CLK_USB_OHCI1>;
-			resets = <&ccu RST_BUS_OHCI1>;
-			phys = <&usbphy 1>;
-			phy-names = "usb";
-			status = "disabled";
-		};
-
-		ehci2: usb@5310000 {
-			compatible = "allwinner,sun50i-h616-ehci",
-				     "generic-ehci";
-			reg = <0x05310000 0x100>;
-			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_BUS_OHCI2>,
-				 <&ccu CLK_BUS_EHCI2>,
-				 <&ccu CLK_USB_OHCI2>;
-			resets = <&ccu RST_BUS_OHCI2>,
-				 <&ccu RST_BUS_EHCI2>;
-			phys = <&usbphy 2>;
-			phy-names = "usb";
-			status = "disabled";
-		};
-
-		ohci2: usb@5310400 {
-			compatible = "allwinner,sun50i-h616-ohci",
-				     "generic-ohci";
-			reg = <0x05310400 0x100>;
-			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_BUS_OHCI2>,
-				 <&ccu CLK_USB_OHCI2>;
-			resets = <&ccu RST_BUS_OHCI2>;
-			phys = <&usbphy 2>;
-			phy-names = "usb";
-			status = "disabled";
-		};
-
-		ehci3: usb@5311000 {
-			compatible = "allwinner,sun50i-h616-ehci",
-				     "generic-ehci";
-			reg = <0x05311000 0x100>;
-			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_BUS_OHCI3>,
-				 <&ccu CLK_BUS_EHCI3>,
-				 <&ccu CLK_USB_OHCI3>;
-			resets = <&ccu RST_BUS_OHCI3>,
-				 <&ccu RST_BUS_EHCI3>;
-			phys = <&usbphy 3>;
-			phy-names = "usb";
-			status = "disabled";
-		};
-
-		ohci3: usb@5311400 {
-			compatible = "allwinner,sun50i-h616-ohci",
-				     "generic-ohci";
-			reg = <0x05311400 0x100>;
-			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&ccu CLK_BUS_OHCI3>,
-				 <&ccu CLK_USB_OHCI3>;
-			resets = <&ccu RST_BUS_OHCI3>;
-			phys = <&usbphy 3>;
-			phy-names = "usb";
-			status = "disabled";
-		};
-
 		rtc: rtc@7000000 {
-			compatible = "allwinner,sun50i-h616-rtc",
-				     "allwinner,sun50i-h6-rtc";
+			compatible = "allwinner,sun50i-h616-rtc";
 			reg = <0x07000000 0x400>;
-			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
-			clock-output-names = "osc32k", "osc32k-out", "iosc";
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_R_APB1_RTC>, <&osc24M>,
+				 <&ccu CLK_PLL_SYSTEM_32K>;
+			clock-names = "bus", "hosc",
+				      "pll-32k";
 			#clock-cells = <1>;
 		};
 
 		r_ccu: clock@7010000 {
 			compatible = "allwinner,sun50i-h616-r-ccu";
-			reg = <0x07010000 0x400>;
-			clocks = <&osc24M>, <&rtc 0>, <&rtc 2>,
+			reg = <0x07010000 0x210>;
+			clocks = <&osc24M>, <&rtc CLK_OSC32K>, <&rtc CLK_IOSC>,
 				 <&ccu CLK_PLL_PERIPH0>;
 			clock-names = "hosc", "losc", "iosc", "pll-periph";
 			#clock-cells = <1>;
@@ -674,14 +528,13 @@
 		r_pio: pinctrl@7022000 {
 			compatible = "allwinner,sun50i-h616-r-pinctrl";
 			reg = <0x07022000 0x400>;
-			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&r_ccu CLK_R_APB1>, <&osc24M>, <&rtc 0>;
+			clocks = <&r_ccu CLK_R_APB1>, <&osc24M>,
+				 <&rtc CLK_OSC32K>;
 			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			#gpio-cells = <3>;
-			interrupt-controller;
-			#interrupt-cells = <3>;
 
+			/omit-if-no-ref/
 			r_i2c_pins: r-i2c-pins {
 				pins = "PL0", "PL1";
 				function = "s_i2c";
@@ -694,21 +547,22 @@
 		};
 
 		ir: ir@7040000 {
-				compatible = "allwinner,sun50i-h616-ir",
-					     "allwinner,sun6i-a31-ir";
-				reg = <0x07040000 0x400>;
-				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&r_ccu CLK_R_APB1_IR>,
-					 <&r_ccu CLK_IR>;
-				clock-names = "apb", "ir";
-				resets = <&r_ccu RST_R_APB1_IR>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&ir_rx_pin>;
-				status = "disabled";
+			compatible = "allwinner,sun50i-h616-ir",
+				     "allwinner,sun6i-a31-ir";
+			reg = <0x07040000 0x400>;
+			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_R_APB1_IR>,
+				 <&r_ccu CLK_IR>;
+			clock-names = "apb", "ir";
+			resets = <&r_ccu RST_R_APB1_IR>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&ir_rx_pin>;
+			status = "disabled";
 		};
 
 		r_i2c: i2c@7081400 {
 			compatible = "allwinner,sun50i-h616-i2c",
+				     "allwinner,sun8i-v536-i2c",
 				     "allwinner,sun6i-a31-i2c";
 			reg = <0x07081400 0x400>;
 			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/include/dt-bindings/clock/sun50i-h6-r-ccu.h b/include/dt-bindings/clock/sun50i-h6-r-ccu.h
index 890368d252c..a96087abc86 100644
--- a/include/dt-bindings/clock/sun50i-h6-r-ccu.h
+++ b/include/dt-bindings/clock/sun50i-h6-r-ccu.h
@@ -22,5 +22,6 @@
 #define CLK_W1			12
 
 #define CLK_R_APB2_RSB		13
+#define CLK_R_APB1_RTC		14
 
 #endif /* _DT_BINDINGS_CLK_SUN50I_H6_R_CCU_H_ */
diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-bindings/clock/sun50i-h616-ccu.h
index 4fc08b0df2f..1191aca53ac 100644
--- a/include/dt-bindings/clock/sun50i-h616-ccu.h
+++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
@@ -111,5 +111,6 @@
 #define CLK_BUS_TVE0		125
 #define CLK_HDCP		126
 #define CLK_BUS_HDCP		127
+#define CLK_PLL_SYSTEM_32K	128
 
 #endif /* _DT_BINDINGS_CLK_SUN50I_H616_H_ */
diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bindings/clock/sun6i-rtc.h
new file mode 100644
index 00000000000..c845493e4d3
--- /dev/null
+++ b/include/dt-bindings/clock/sun6i-rtc.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
+
+#ifndef _DT_BINDINGS_CLK_SUN6I_RTC_H_
+#define _DT_BINDINGS_CLK_SUN6I_RTC_H_
+
+#define CLK_OSC32K		0
+#define CLK_OSC32K_FANOUT	1
+#define CLK_IOSC		2
+
+#endif /* _DT_BINDINGS_CLK_SUN6I_RTC_H_ */
-- 
2.35.3

