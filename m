Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A482FB7
	for <linux-sunxi@lists.linux.dev>; Thu, 27 May 2021 00:45:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13FD9143B;
	Wed, 26 May 2021 17:45:04 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A88333F719;
	Wed, 26 May 2021 17:45:02 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/3] arm: dts: sunxi: h3: Update DT files
Date: Thu, 27 May 2021 01:44:38 +0100
Message-Id: <20210527004438.19783-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210527004438.19783-1-andre.przywara@arm.com>
References: <20210527004438.19783-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Update the H3 DT files from the Linux 5.12 release.

The changes update some boards, and don't affect U-Boot, but fix Gigabit
Ethernet when this DT is passed on to the Linux kernel.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../dts/sun8i-h2-plus-bananapi-m2-zero.dts    | 96 ++++++++++++++++++-
 arch/arm/dts/sun8i-h3-beelink-x2.dts          |  4 +-
 arch/arm/dts/sun8i-h3-nanopi-duo2.dts         |  4 +-
 arch/arm/dts/sun8i-h3-nanopi-neo-air.dts      |  4 +-
 arch/arm/dts/sun8i-h3-nanopi.dtsi             |  4 +-
 arch/arm/dts/sun8i-h3-orangepi-pc-plus.dts    |  5 -
 arch/arm/dts/sun8i-h3-orangepi-plus2e.dts     |  2 +-
 arch/arm/dts/sun8i-h3-orangepi-zero-plus2.dts | 38 ++++++++
 8 files changed, 142 insertions(+), 15 deletions(-)

diff --git a/arch/arm/dts/sun8i-h2-plus-bananapi-m2-zero.dts b/arch/arm/dts/sun8i-h2-plus-bananapi-m2-zero.dts
index d277d043031..f3f7a2c912a 100644
--- a/arch/arm/dts/sun8i-h2-plus-bananapi-m2-zero.dts
+++ b/arch/arm/dts/sun8i-h2-plus-bananapi-m2-zero.dts
@@ -31,7 +31,7 @@
 
 		pwr_led {
 			label = "bananapi-m2-zero:red:pwr";
-			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>; /* PL10 */
+			gpios = <&r_pio 0 10 GPIO_ACTIVE_LOW>; /* PL10 */
 			default-state = "on";
 		};
 	};
@@ -62,6 +62,35 @@
 		states = <1100000 0>, <1300000 1>;
 	};
 
+	reg_vcc_dram: vcc-dram {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-dram";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&r_pio 0 9 GPIO_ACTIVE_HIGH>; /* PL9 */
+		vin-supply = <&reg_vcc5v0>;
+	};
+
+	reg_vcc1v2: vcc1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc1v2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		regulator-boot-on;
+		enable-active-high;
+		gpio = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
+		vin-supply = <&reg_vcc5v0>;
+	};
+
+	poweroff {
+		compatible = "regulator-poweroff";
+		cpu-supply = <&reg_vcc1v2>;
+	};
+
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
@@ -125,6 +154,7 @@
 
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
+		max-speed = <1500000>;
 		clocks = <&rtc 1>;
 		clock-names = "lpo";
 		vbat-supply = <&reg_vcc3v3>;
@@ -136,6 +166,70 @@
 
 };
 
+&pio {
+	gpio-line-names =
+		/* PA */
+		"CON2-P13", "CON2-P11", "CON2-P22", "CON2-P15",
+			"CON3-P03", "CON3-P02", "CON2-P07", "CON2-P29",
+		"CON2-P31", "CON2-P33", "CON2-P35", "CON2-P05",
+			"CON2-P03", "CON2-P08", "CON2-P10", "CON2-P16",
+		"CON2-P12", "CON2-P37", "CON2-P28", "CON2-P27",
+			"CON2-P40", "CON2-P38", "", "",
+		"", "", "", "", "", "", "", "",
+
+		/* PB */
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+
+		/* PC */
+		"CON2-P19", "CON2-P21", "CON2-P23", "CON2-P24",
+			"CON2-P18", "", "", "CON2-P26",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+
+		/* PD */
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "CSI-PWR-EN", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+
+		/* PE */
+		"CN3-P17", "CN3-P13", "CN3-P09", "CN3-P07",
+			"CN3-P19", "CN3-P21", "CN3-P22", "CN3-P20",
+		"CN3-P18", "CN3-P16", "CN3-P14", "CN3-P12",
+			"CN3-P05", "CN3-P03", "CN3-P06", "CN3-P08",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+
+		/* PF */
+		"SDC0-D1", "SDC0-D0", "SDC0-CLK", "SDC0-CMD", "SDC0-D3",
+			"SDC0-D2", "SDC0-DET", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+
+		/* PG */
+		"WL-SDIO-CLK", "WL-SDIO-CMD", "WL-SDIO-D0", "WL-SDIO-D1",
+			"WL-SDIO-D2", "WL-SDIO-D3", "BT-UART-TX", "BT-UART-RX",
+		"BT-UART-RTS", "BT-UART-CTS", "WL-WAKE-AP", "BT-WAKE-AP",
+			"BT-RST-N", "AP-WAKE-BT", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
+&r_pio {
+	gpio-line-names =
+		/* PL */
+		"", "CPUX-SET", "CON2-P32", "POWER-KEY", "CON2-P36",
+			"VCC-IO-EN", "USB0-ID", "WL-PWR-EN",
+		"PWR-STB", "PWR-DRAM", "PWR-LED", "IR-RX", "", "", "", "",
+		"", "", "", "", "", "", "", "",
+		"", "", "", "", "", "", "", "";
+};
+
 &usb_otg {
 	dr_mode = "otg";
 	status = "okay";
diff --git a/arch/arm/dts/sun8i-h3-beelink-x2.dts b/arch/arm/dts/sun8i-h3-beelink-x2.dts
index 45a24441ff1..62b5280ec09 100644
--- a/arch/arm/dts/sun8i-h3-beelink-x2.dts
+++ b/arch/arm/dts/sun8i-h3-beelink-x2.dts
@@ -75,13 +75,13 @@
 	leds {
 		compatible = "gpio-leds";
 
-		blue {
+		led-0 {
 			label = "beelink-x2:blue:pwr";
 			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>; /* PL10 */
 			default-state = "on";
 		};
 
-		red {
+		led-1 {
 			label = "beelink-x2:red:standby";
 			gpios = <&pio 0 15 GPIO_ACTIVE_HIGH>; /* PA15 */
 		};
diff --git a/arch/arm/dts/sun8i-h3-nanopi-duo2.dts b/arch/arm/dts/sun8i-h3-nanopi-duo2.dts
index 6b149271ef1..8e7dfcffe1f 100644
--- a/arch/arm/dts/sun8i-h3-nanopi-duo2.dts
+++ b/arch/arm/dts/sun8i-h3-nanopi-duo2.dts
@@ -25,13 +25,13 @@
 	leds {
 		compatible = "gpio-leds";
 
-		pwr {
+		led-0 {
 			label = "nanopi:red:pwr";
 			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>; /* PL10 */
 			default-state = "on";
 		};
 
-		status {
+		led-1 {
 			label = "nanopi:green:status";
 			gpios = <&pio 0 10 GPIO_ACTIVE_HIGH>; /* PA10 */
 		};
diff --git a/arch/arm/dts/sun8i-h3-nanopi-neo-air.dts b/arch/arm/dts/sun8i-h3-nanopi-neo-air.dts
index 07867a0d569..be49eabbff9 100644
--- a/arch/arm/dts/sun8i-h3-nanopi-neo-air.dts
+++ b/arch/arm/dts/sun8i-h3-nanopi-neo-air.dts
@@ -61,13 +61,13 @@
 	leds {
 		compatible = "gpio-leds";
 
-		pwr {
+		led-0 {
 			label = "nanopi:green:pwr";
 			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>; /* PL10 */
 			default-state = "on";
 		};
 
-		status {
+		led-1 {
 			label = "nanopi:blue:status";
 			gpios = <&pio 0 10 GPIO_ACTIVE_HIGH>; /* PA10 */
 		};
diff --git a/arch/arm/dts/sun8i-h3-nanopi.dtsi b/arch/arm/dts/sun8i-h3-nanopi.dtsi
index 4df29a65316..c7c3e7d8b3c 100644
--- a/arch/arm/dts/sun8i-h3-nanopi.dtsi
+++ b/arch/arm/dts/sun8i-h3-nanopi.dtsi
@@ -60,13 +60,13 @@
 	leds {
 		compatible = "gpio-leds";
 
-		status {
+		led-0 {
 			label = "nanopi:blue:status";
 			gpios = <&pio 0 10 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "heartbeat";
 		};
 
-		pwr {
+		led-1 {
 			label = "nanopi:green:pwr";
 			gpios = <&r_pio 0 10 GPIO_ACTIVE_HIGH>;
 			default-state = "on";
diff --git a/arch/arm/dts/sun8i-h3-orangepi-pc-plus.dts b/arch/arm/dts/sun8i-h3-orangepi-pc-plus.dts
index 71fb7320893..babf4cf1b2f 100644
--- a/arch/arm/dts/sun8i-h3-orangepi-pc-plus.dts
+++ b/arch/arm/dts/sun8i-h3-orangepi-pc-plus.dts
@@ -53,11 +53,6 @@
 	};
 };
 
-&emac {
-	/* LEDs changed to active high on the plus */
-	/delete-property/ allwinner,leds-active-low;
-};
-
 &mmc1 {
 	vmmc-supply = <&reg_vcc3v3>;
 	bus-width = <4>;
diff --git a/arch/arm/dts/sun8i-h3-orangepi-plus2e.dts b/arch/arm/dts/sun8i-h3-orangepi-plus2e.dts
index 6dbf7b2e0c1..b6ca45d18e5 100644
--- a/arch/arm/dts/sun8i-h3-orangepi-plus2e.dts
+++ b/arch/arm/dts/sun8i-h3-orangepi-plus2e.dts
@@ -67,7 +67,7 @@
 	pinctrl-0 = <&emac_rgmii_pins>;
 	phy-supply = <&reg_gmac_3v3>;
 	phy-handle = <&ext_rgmii_phy>;
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	status = "okay";
 };
 
diff --git a/arch/arm/dts/sun8i-h3-orangepi-zero-plus2.dts b/arch/arm/dts/sun8i-h3-orangepi-zero-plus2.dts
index b8f46e2802f..561ea1d2f86 100644
--- a/arch/arm/dts/sun8i-h3-orangepi-zero-plus2.dts
+++ b/arch/arm/dts/sun8i-h3-orangepi-zero-plus2.dts
@@ -70,6 +70,21 @@
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
@@ -88,6 +103,10 @@
 	status = "okay";
 };
 
+&ehci0 {
+	status = "okay";
+};
+
 &hdmi {
 	status = "okay";
 };
@@ -132,8 +151,27 @@
 	status = "okay";
 };
 
+&ohci0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pa_pins>;
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
-- 
2.17.5

