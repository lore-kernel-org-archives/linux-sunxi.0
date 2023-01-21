Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AEB1361
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Jan 2023 01:28:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5792D1042;
	Fri, 20 Jan 2023 17:29:02 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF4753F67D;
	Fri, 20 Jan 2023 17:28:18 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] sunxi: dts: arm: update devicetree files
Date: Sat, 21 Jan 2023 01:26:13 +0000
Message-Id: <20230121012613.9989-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sync the devicetree files from the Linux kernel repo, v6.2-rc2.
This enables some new devices for the F1C100s family, though this is of
little relevance to U-Boot itself.
The H3 gains the "phys" property for the first USB controller, which
prevents an error message when U-Boot's USB stack comes up.

As before, this omits the non-backwards compatible changes to the R_INTC
controller, to remain compatible with older kernels.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/dts/suniv-f1c100s.dtsi               | 70 +++++++++++++++++++
 arch/arm/dts/sunxi-bananapi-m2-plus.dtsi      | 14 ++--
 arch/arm/dts/sunxi-h3-h5.dtsi                 |  4 ++
 include/dt-bindings/clock/suniv-ccu-f1c100s.h |  2 +
 4 files changed, 83 insertions(+), 7 deletions(-)

diff --git a/arch/arm/dts/suniv-f1c100s.dtsi b/arch/arm/dts/suniv-f1c100s.dtsi
index 0edc1724407..9455d27e516 100644
--- a/arch/arm/dts/suniv-f1c100s.dtsi
+++ b/arch/arm/dts/suniv-f1c100s.dtsi
@@ -166,6 +166,12 @@
 				drive-strength = <30>;
 			};
 
+			/omit-if-no-ref/
+			i2c0_pd_pins: i2c0-pd-pins {
+				pins = "PD0", "PD12";
+				function = "i2c0";
+			};
+
 			spi0_pc_pins: spi0-pc-pins {
 				pins = "PC0", "PC1", "PC2", "PC3";
 				function = "spi0";
@@ -177,6 +183,42 @@
 			};
 		};
 
+		i2c0: i2c@1c27000 {
+			compatible = "allwinner,suniv-f1c100s-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x01c27000 0x400>;
+			interrupts = <7>;
+			clocks = <&ccu CLK_BUS_I2C0>;
+			resets = <&ccu RST_BUS_I2C0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@1c27400 {
+			compatible = "allwinner,suniv-f1c100s-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x01c27400 0x400>;
+			interrupts = <8>;
+			clocks = <&ccu CLK_BUS_I2C1>;
+			resets = <&ccu RST_BUS_I2C1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@1c27800 {
+			compatible = "allwinner,suniv-f1c100s-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x01c27800 0x400>;
+			interrupts = <9>;
+			clocks = <&ccu CLK_BUS_I2C2>;
+			resets = <&ccu RST_BUS_I2C2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		timer@1c20c00 {
 			compatible = "allwinner,suniv-f1c100s-timer";
 			reg = <0x01c20c00 0x90>;
@@ -192,6 +234,34 @@
 			clocks = <&osc32k>;
 		};
 
+		pwm: pwm@1c21000 {
+			compatible = "allwinner,suniv-f1c100s-pwm",
+				     "allwinner,sun7i-a20-pwm";
+			reg = <0x01c21000 0x400>;
+			clocks = <&osc24M>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		ir: ir@1c22c00 {
+			compatible = "allwinner,suniv-f1c100s-ir",
+				     "allwinner,sun6i-a31-ir";
+			reg = <0x01c22c00 0x400>;
+			clocks = <&ccu CLK_BUS_IR>, <&ccu CLK_IR>;
+			clock-names = "apb", "ir";
+			resets = <&ccu RST_BUS_IR>;
+			interrupts = <6>;
+			status = "disabled";
+		};
+
+		lradc: lradc@1c23400 {
+			compatible = "allwinner,suniv-f1c100s-lradc",
+				     "allwinner,sun8i-a83t-r-lradc";
+			reg = <0x01c23400 0x400>;
+			interrupts = <22>;
+			status = "disabled";
+		};
+
 		uart0: serial@1c25000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c25000 0x400>;
diff --git a/arch/arm/dts/sunxi-bananapi-m2-plus.dtsi b/arch/arm/dts/sunxi-bananapi-m2-plus.dtsi
index e899d14f38c..1d1d127cf38 100644
--- a/arch/arm/dts/sunxi-bananapi-m2-plus.dtsi
+++ b/arch/arm/dts/sunxi-bananapi-m2-plus.dtsi
@@ -89,13 +89,13 @@
 	};
 
 	reg_gmac_3v3: gmac-3v3 {
-		      compatible = "regulator-fixed";
-		      regulator-name = "gmac-3v3";
-		      regulator-min-microvolt = <3300000>;
-		      regulator-max-microvolt = <3300000>;
-		      startup-delay-us = <100000>;
-		      enable-active-high;
-		      gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>;
+		compatible = "regulator-fixed";
+		regulator-name = "gmac-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <100000>;
+		enable-active-high;
+		gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>;
 	};
 
 	wifi_pwrseq: wifi_pwrseq {
diff --git a/arch/arm/dts/sunxi-h3-h5.dtsi b/arch/arm/dts/sunxi-h3-h5.dtsi
index 64391418609..fc1af9b608b 100644
--- a/arch/arm/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/dts/sunxi-h3-h5.dtsi
@@ -302,6 +302,8 @@
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>;
 			resets = <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
+			phys = <&usbphy 0>;
+			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -312,6 +314,8 @@
 			clocks = <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>,
 				 <&ccu CLK_USB_OHCI0>;
 			resets = <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
+			phys = <&usbphy 0>;
+			phy-names = "usb";
 			status = "disabled";
 		};
 
diff --git a/include/dt-bindings/clock/suniv-ccu-f1c100s.h b/include/dt-bindings/clock/suniv-ccu-f1c100s.h
index f5ac155c9c7..d7570765f42 100644
--- a/include/dt-bindings/clock/suniv-ccu-f1c100s.h
+++ b/include/dt-bindings/clock/suniv-ccu-f1c100s.h
@@ -67,4 +67,6 @@
 #define CLK_CODEC		65
 #define CLK_AVS			66
 
+#define CLK_IR			67
+
 #endif
-- 
2.35.5

