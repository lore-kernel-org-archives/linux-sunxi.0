Received: from smtpbg.qq.com (smtpbg127.qq.com [109.244.180.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E99173
	for <linux-sunxi@lists.linux.dev>; Thu, 22 Jul 2021 06:32:13 +0000 (UTC)
X-QQ-mid: bizesmtp46t1626935461t3awkhv2
Received: from localhost.localdomain (unknown [14.154.30.9])
	by esmtp6.qq.com (ESMTP) with 
	id ; Thu, 22 Jul 2021 14:30:58 +0800 (CST)
X-QQ-SSF: 01100000002000104000B00A0000000
X-QQ-FEAT: VqXHZHhIyRxwOAhnyufhzlhrSgnuPw7/YY40TBQRZtjXsn2HQwy9MDdofszDh
	20XzyZ7HTMF+3+q+wn3ifVocKpzhwRcRVjua4BTl0KxyNCIoLvQSN0d2DHVsWNLj3d0Lg0/
	zw4OqcEhS+B4BlN2Aqjvmzqv1CDnssVK7s8bEc8DfeZKpKZFU3IyHjEw5aZgWFOrGlYCgo2
	CoAm012pf3xgG7cBbZpW/fIOo9OmIEb6PQxOcTxpA7O8FzWIGIU6AURs0gc4qq/1WL8uZxF
	d/xTdOv5Vuy1RsIcj1EiBn7oBCUX5zH1cIOYj8UePsrjEmJ1OYWUxLyrEcs6kH1AaytDcjF
	70Dqca0pDOIWcLTgt0qai1vrXU2d+bB0i0WuSOx
X-QQ-GoodBg: 0
From: Icenowy Zheng <icenowy@sipeed.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@sipeed.com>
Subject: [RFC PATCH 12/13] sunxi: sync R329 DTs from internal WIP kernel tree
Date: Thu, 22 Jul 2021 14:30:14 +0800
Message-Id: <20210722063015.421923-13-icenowy@sipeed.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210722063015.421923-1-icenowy@sipeed.com>
References: <20210722063015.421923-1-icenowy@sipeed.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:sipeed.com:qybgspam:qybgspam1

Signed-off-by: Icenowy Zheng <icenowy@sipeed.com>
---
 arch/arm/dts/Makefile                      |   2 +
 arch/arm/dts/sun50i-r329-maix-iia-dock.dts |  36 ++++
 arch/arm/dts/sun50i-r329-maix-iia.dtsi     |  45 +++++
 arch/arm/dts/sun50i-r329.dtsi              | 225 +++++++++++++++++++++
 4 files changed, 308 insertions(+)
 create mode 100644 arch/arm/dts/sun50i-r329-maix-iia-dock.dts
 create mode 100644 arch/arm/dts/sun50i-r329-maix-iia.dtsi
 create mode 100644 arch/arm/dts/sun50i-r329.dtsi

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 3941a08cf4..cfafb80a5f 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -643,6 +643,8 @@ dtb-$(CONFIG_MACH_SUN50I_H6) += \
 	sun50i-h6-tanix-tx6.dtb
 dtb-$(CONFIG_MACH_SUN50I_H616) += \
 	sun50i-h616-orangepi-zero2.dtb
+dtb-$(CONFIG_MACH_SUN50I_R329) += \
+	sun50i-r329-maix-iia-dock.dtb
 dtb-$(CONFIG_MACH_SUN50I) += \
 	sun50i-a64-amarula-relic.dtb \
 	sun50i-a64-bananapi-m64.dtb \
diff --git a/arch/arm/dts/sun50i-r329-maix-iia-dock.dts b/arch/arm/dts/sun50i-r329-maix-iia-dock.dts
new file mode 100644
index 0000000000..2588eb6adb
--- /dev/null
+++ b/arch/arm/dts/sun50i-r329-maix-iia-dock.dts
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2021 Sipeed
+
+/dts-v1/;
+
+#include "sun50i-r329-maix-iia.dtsi"
+
+/ {
+	model = "Sipeed MAIX-II A Dock";
+	compatible = "sipeed,maix-iia-dock", "sipeed,maix-iia",
+		     "allwinner,sun50i-r329";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&mmc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_pf_pins>;
+
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
+	status = "okay";
+};
diff --git a/arch/arm/dts/sun50i-r329-maix-iia.dtsi b/arch/arm/dts/sun50i-r329-maix-iia.dtsi
new file mode 100644
index 0000000000..ac5c5a88d3
--- /dev/null
+++ b/arch/arm/dts/sun50i-r329-maix-iia.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2021 Sipeed
+
+#include "sun50i-r329.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	ext_osc32k: ext_osc32k_clk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "ext_osc32k";
+	};
+
+	reg_vcc3v3: vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	wifi_pwrseq: wifi_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&r_pio 1 0 GPIO_ACTIVE_LOW>; /* PM0 */
+		post-power-on-delay-ms = <200>;
+	};
+};
+
+&rtc {
+	clocks = <&ext_osc32k>;
+};
+
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_clk_pg0>, <&mmc1_cmd_pg1>, <&mmc1_d0_pg2>,
+		    <&mmc1_d1_pg3>, <&mmc1_d2_pg4>, <&mmc1_d3_pg5>;
+
+	vmmc-supply = <&reg_vcc3v3>;
+	vqmmc-supply = <&reg_vcc3v3>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+};
diff --git a/arch/arm/dts/sun50i-r329.dtsi b/arch/arm/dts/sun50i-r329.dtsi
new file mode 100644
index 0000000000..b4752020df
--- /dev/null
+++ b/arch/arm/dts/sun50i-r329.dtsi
@@ -0,0 +1,225 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2021 Sipeed
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/sun50i-r329-ccu.h>
+#include <dt-bindings/reset/sun50i-r329-ccu.h>
+#include <dt-bindings/clock/sun50i-r329-r-ccu.h>
+#include <dt-bindings/reset/sun50i-r329-r-ccu.h>
+
+/ {
+	interrupt-parent = <&gic>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			reg = <0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a53";
+			device_type = "cpu";
+			reg = <1>;
+			enable-method = "psci";
+		};
+	};
+
+	osc24M: osc24M_clk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "osc24M";
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		arm,no-tick-in-suspend;
+		interrupts = <GIC_PPI 13
+			(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 14
+			(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 11
+			(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 10
+			(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		pio: pinctrl@2000400 {
+			compatible = "allwinner,sun50i-r329-pinctrl";
+			reg = <0x02000400 0x400>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_APB1>, <&osc24M>, <&rtc 0>;
+			clock-names = "apb", "hosc", "losc";
+			gpio-controller;
+			#gpio-cells = <3>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+
+			uart0_pb_pins: uart0-pb-pins {
+				pins = "PB4", "PB5";
+				function = "uart0";
+			};
+
+			mmc0_pf_pins: mmc0-pf-pins {
+				pins = "PF0", "PF1", "PF2",
+				       "PF3", "PF4", "PF5";
+				function = "mmc0";
+			};
+
+			mmc1_clk_pg0: mmc1-clk-pg0 {
+				pins = "PG0";
+				function = "mmc1_clk";
+			};
+
+			mmc1_cmd_pg1: mmc1-clk-pg1 {
+				pins = "PG1";
+				function = "mmc1_cmd";
+			};
+
+			mmc1_d0_pg2: mmc1-clk-pg2 {
+				pins = "PG2";
+				function = "mmc1_d0";
+			};
+
+			mmc1_d1_pg3: mmc1-clk-pg3 {
+				pins = "PG3";
+				function = "mmc1_d1";
+			};
+
+			mmc1_d2_pg4: mmc1-clk-pg4 {
+				pins = "PG4";
+				function = "mmc1_d2";
+			};
+
+			mmc1_d3_pg5: mmc1-clk-pg5 {
+				pins = "PG5";
+				function = "mmc1_d3";
+			};
+
+			spi1_cs_ph0: spi1-cs-ph0 {
+				pins = "PH0";
+				function = "spi1";
+			};
+
+			spi1_clk_ph1: spi1-clk-ph1 {
+				pins = "PH1";
+				function = "spi1";
+			};
+
+			spi1_mosi_ph2: spi1-mosi-ph2 {
+				pins = "PH2";
+				function = "spi1";
+			};
+		};
+
+		ccu: clock@2001000 {
+			compatible = "allwinner,sun50i-r329-ccu";
+			reg = <0x02001000 0x1000>;
+			clocks = <&osc24M>, <&rtc 0>, <&rtc 2>;
+			clock-names = "hosc", "losc", "iosc";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		uart0: serial@2500000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x02500000 0x400>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			reg-shift = <2>;
+			reg-io-width = <4>;
+			clocks = <&ccu CLK_BUS_UART0>;
+			resets = <&ccu RST_BUS_UART0>;
+		};
+
+		gic: interrupt-controller@3021000 {
+			compatible = "arm,gic-400";
+			reg = <0x03021000 0x1000>,
+			      <0x03022000 0x2000>,
+			      <0x03024000 0x2000>,
+			      <0x03026000 0x2000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+
+		mmc0: mmc@4020000 {
+			compatible = "allwinner,sun50i-r329-mmc";
+			reg = <0x04020000 0x1000>;
+			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
+			clock-names = "ahb", "mmc";
+			resets = <&ccu RST_BUS_MMC0>;
+			reset-names = "ahb";
+			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+			max-frequency = <150000000>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		mmc1: mmc@4021000 {
+			compatible = "allwinner,sun50i-r329-mmc";
+			reg = <0x04021000 0x1000>;
+			clocks = <&ccu CLK_BUS_MMC1>, <&ccu CLK_MMC1>;
+			clock-names = "ahb", "mmc";
+			resets = <&ccu RST_BUS_MMC1>;
+			reset-names = "ahb";
+			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+			max-frequency = <150000000>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		r_ccu: clock@7010000 {
+			compatible = "allwinner,sun50i-r329-r-ccu";
+			reg = <0x07010000 0x10000>;
+			clocks = <&osc24M>, <&rtc 0>, <&rtc 2>;
+			clock-names = "hosc", "losc", "iosc";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		r_pio: pinctrl@7022000 {
+			compatible = "allwinner,sun50i-r329-r-pinctrl";
+			reg = <0x07022000 0x400>;
+			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_R_APB1>, <&osc24M>, <&rtc 0>;
+			clock-names = "apb", "hosc", "losc";
+			gpio-controller;
+			#gpio-cells = <3>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+
+		rtc: rtc@7090000 {
+			compatible = "allwinner,sun50i-r329-rtc";
+			reg = <0x07090000 0x400>;
+			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
+			clock-output-names = "osc32k", "osc32k-out", "iosc";
+			#clock-cells = <1>;
+		};
+	};
+};
-- 
2.30.2

