Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C170B15AC
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 00:56:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80E86139F;
	Sun,  6 Nov 2022 16:56:32 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5D2B3F703;
	Sun,  6 Nov 2022 16:56:24 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 10/10] ARM: dts: suniv: Add Lctech Pi F1C200s devicetree
Date: Mon,  7 Nov 2022 00:54:33 +0000
Message-Id: <20221107005433.11079-11-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20221107005433.11079-1-andre.przywara@arm.com>
References: <20221107005433.11079-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lctech Pi F1C200s (also previously known under the Cherry Pi brand)
is a small development board with the Allwinner F1C200s SoC. This is the
same as the F1C100s, but with 64MB instead of 32MB co-packaged DRAM.

Alongside the obligatory micro-SD card slot, the board features a
SPI-NAND flash chip, LCD and touch connectors, and unpopulated
expansion header pins.
There are two USB Type-C ports on the board: One supplies the power, also
connects to the USB MUSB OTG controller port. The other one is connected
to an CH340 USB serial chip, which in turn is connected to UART1.

Add a devicetree file, so that the board can be used easily.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 arch/arm/boot/dts/suniv-f1c100s.dtsi          |  6 ++
 arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts | 78 +++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 0249c07bd8a6..52f8ab0eacb2 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1392,6 +1392,7 @@ dtb-$(CONFIG_MACH_SUN9I) += \
 	sun9i-a80-cubieboard4.dtb
 dtb-$(CONFIG_MACH_SUNIV) += \
 	suniv-f1c100s-licheepi-nano.dtb \
+	suniv-f1c200s-lctech-pi.dtb \
 	suniv-f1c200s-popstick-v1.1.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += \
 	tegra20-acer-a500-picasso.dtb \
diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
index 111f8bbc2a80..3c61d59ab5f8 100644
--- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
+++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
@@ -207,6 +207,12 @@ uart0_pe_pins: uart0-pe-pins {
 				pins = "PE0", "PE1";
 				function = "uart0";
 			};
+
+			/omit-if-no-ref/
+			uart1_pa_pins: uart1-pa-pins {
+				pins = "PA2", "PA3";
+				function = "uart1";
+			};
 		};
 
 		i2c0: i2c@1c27000 {
diff --git a/arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts b/arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts
new file mode 100644
index 000000000000..14c26f2c19f6
--- /dev/null
+++ b/arch/arm/boot/dts/suniv-f1c200s-lctech-pi.dts
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022 Arm Ltd,
+ * based on work:
+ *   Copyright 2022 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+/dts-v1/;
+#include "suniv-f1c100s.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Lctech Pi F1C200s";
+	compatible = "lctech,pi-f1c200s", "allwinner,suniv-f1c200s",
+		     "allwinner,suniv-f1c100s";
+
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_vcc3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&mmc0 {
+	broken-cd;
+	bus-width = <4>;
+	disable-wp;
+	vmmc-supply = <&reg_vcc3v3>;
+	status = "okay";
+};
+
+&otg_sram {
+	status = "okay";
+};
+
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pc_pins>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		spi-max-frequency = <40000000>;
+	};
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pa_pins>;
+	status = "okay";
+};
+
+/*
+ * This is a Type-C socket, but CC1/2 are not connected, and VBUS is connected
+ * to Vin, which supplies the board. Host mode works (if the board is powered
+ * otherwise), but peripheral is probably the intention.
+ */
+&usb_otg {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usbphy {
+	status = "okay";
+};
-- 
2.35.5

