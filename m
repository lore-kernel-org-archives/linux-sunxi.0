Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A5817D2
	for <linux-sunxi@lists.linux.dev>; Sat, 30 Mar 2024 01:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711762383; cv=none; b=p6HQoqW6oodM+cqMEulCJijDpsj1/dV1rUT7PO4eOzsRRLEMPzFuy5z3B+ng1J/5uzVi/i0jFyGLNRJLWQ3QHT8deccHbkgyLgQixd7vfwo+ZkgKSd+ITfyr+4CC/BfJaofjyW02al97ctcFRYX07vbE+Hk5durYci4F6WOLxLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711762383; c=relaxed/simple;
	bh=1ojR1tTFz2u9nHuAuXRMt2ZljLtkMCOlzjOtHqzNH0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EuTGGWPEVpXOU+MFmpek+MrewKpFrXwQfrZ8FagQbMe7si9/04eK2APaQRcVw4BePJmxX4FbXmhsMV6+j1jC5kFCR4Ehptq8cbber1l6WvfJtXdMNKE5Ebcfdgr4NRk6Zir2nE3iNBSIKB5KC/M4/Jc0j8+ftf+m9esNa9eB81M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9A831480;
	Fri, 29 Mar 2024 18:33:33 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BD843F64C;
	Fri, 29 Mar 2024 18:32:59 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/2] arm64: dts: allwinner: Add Tanix TX1 support
Date: Sat, 30 Mar 2024 01:32:43 +0000
Message-Id: <20240330013243.17943-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.8
In-Reply-To: <20240330013243.17943-1-andre.przywara@arm.com>
References: <20240330013243.17943-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tanix TX1 is a tiny TV box with the Allwinner H313 SoC. The box
features no Ethernet or an SD card slot, which makes booting from it
somewhat interesting: Pressing the hidden FEL button and using a USB-A
to USB-A cable to upload code from a host PC is one way to run mainline.
The box features:
	- Allwinner H313 SoC (4 * Arm Cortex-A53 cores)
	- 1 or 2 GB DRAM
	- 8 or 16 GB eMMC flash
	- SCI S9082H WiFi chip
	- HDMI port
	- one USB 2.0 port
	- 3.5mm AV port
	- barrel plug 5V DC input via barrel plug

The devicetree covers most peripherals.
The eMMC did not work properly in HS200 speed mode, so this mode property
is omitted. HS-DDR seems to work fine.
The blue LED is connected to the same GPIO pin as the red LED, just
using the opposite polarity. Apparently there is no way of describing
this in DT, so the red LED is omitted.
Next to the FEL button is a hidden button, that can be pushed by using
something like a paperclip, through the ventilation vents of the case.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-h313-tanix-tx1.dts   | 184 ++++++++++++++++++
 2 files changed, 185 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 294921f12b738..c8ac2823677f2 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -39,6 +39,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64-model-b.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6-mini.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h313-tanix-tx1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-cb1-manta.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-bigtreetech-pi.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h616-orangepi-zero2.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
new file mode 100644
index 0000000000000..622f4290057a8
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2024 Arm Ltd.
+ */
+
+/dts-v1/;
+
+#include "sun50i-h616.dtsi"
+#include "sun50i-h616-cpu-opp.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Tanix TX1";
+	compatible = "oranth,tanix-tx1", "allwinner,sun50i-h616";
+
+	aliases {
+		serial0 = &uart0;
+		ethernet0 = &sdio_wifi;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		key {
+			label = "hidden";
+			linux,code = <BTN_0>;
+			gpios = <&pio 7 9 GPIO_ACTIVE_LOW>; /* PH9 */
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&pio 7 6 GPIO_ACTIVE_HIGH>; /* PH6 */
+			default-state = "on";
+		};
+	};
+
+	wifi_pwrseq: pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
+		clock-names = "ext_clock";
+		pinctrl-0 = <&x32clk_fanout_pin>;
+		pinctrl-names = "default";
+		reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
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
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ir {
+	status = "okay";
+};
+
+&mmc1 {
+	vmmc-supply = <&reg_dldo1>;
+	vqmmc-supply = <&reg_aldo1>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	sdio_wifi: wifi@1 {
+		reg = <1>;
+	};
+};
+
+&mmc2 {
+	vmmc-supply = <&reg_dldo1>;
+	vqmmc-supply = <&reg_aldo1>;
+	bus-width = <8>;
+	non-removable;
+	max-frequency = <100000000>;
+	cap-mmc-hw-reset;
+	mmc-ddr-1_8v;
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&pio {
+	vcc-pc-supply = <&reg_aldo1>;
+	vcc-pf-supply = <&reg_dldo1>;
+	vcc-pg-supply = <&reg_aldo1>;
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
+
+		vin1-supply = <&reg_vcc5v>;
+		vin2-supply = <&reg_vcc5v>;
+		vin3-supply = <&reg_vcc5v>;
+
+		regulators {
+			/* Supplies VCC-PLL, so needs to be always on. */
+			reg_aldo1: aldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc1v8";
+			};
+
+			/* Supplies VCC-IO, so needs to be always on. */
+			reg_dldo1: dldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc3v3";
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
+				regulator-max-microvolt = <1120000>;
+				regulator-name = "vdd-cpu";
+			};
+
+			reg_dcdc3: dcdc3 {
+				regulator-always-on;
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
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
+	dr_mode = "host";       /* USB A type receptable */
+	status = "okay";
+};
+
+&usbphy {
+	status = "okay";
+};
-- 
2.35.8

