Received: from mxb.seznam.cz (mxb.seznam.cz [77.75.78.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2443C17BA1
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Mar 2024 06:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.78.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710915248; cv=none; b=aeo06thBxj31sSzTEOh9mWBrW6U0CyIqvRbpgha/PZ8hROZVTfuAlRq45YyQn/a2oSFWTVGKUIsoQwgiEPXl/AxHuglKrU4D1R0coro9pU6FG4PeRxINLBm/20EPC4jO6k0twkdagnH6otBCe5oN0fp97Zidx9RNcGjPqjOEzDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710915248; c=relaxed/simple;
	bh=i/TAywNP+zXYfVQLj4o7p1t523w0WhIkfaZFrtb2WdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r1ZOEwDilVeG9qJf2n9Avp0FdXTFbXUDuqtUOQxiBXPgkDRGpkQqofH5i6W7I6dNchsCLLha3w4oSQ/EBsA/TbrGra9w98hkmN6P4naUQkd0gShusY146Bf0wLFAJ1VhuErRA+5a/N64J/LTz+WB8rO62zTTo3gJJhgzwZD3CQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz; spf=none smtp.mailfrom=loebl.cz; dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b=jVbiodDn; arc=none smtp.client-ip=77.75.78.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=loebl.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b="jVbiodDn"
Received: from email.seznam.cz
	by smtpc-mxb-f995f5b8f-mlt68
	(smtpc-mxb-f995f5b8f-mlt68 [2a02:598:128:8a00::1000:3e0])
	id 0154e0371ac66de305b159b5;
	Wed, 20 Mar 2024 07:13:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emailprofi.seznam.cz; s=szn20221014; t=1710915234;
	bh=yVGGGggiTpMjKYKc4SDrtLxHV5/8ddg7i8DMMUtTNGA=;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=jVbiodDnZR2jR4ass4m/aGld71kdLltxJ4cECQAheXs/u/LyTm/hr84FNZQMLwzhM
	 /X6NSK+7peifaJHu7wjTDJcmgi5vhDcvsnqrRt4lNK96khePQkljd6ssV4AX6+qkxT
	 NhPof35AotYwinyNWKQ0hnD5n1ML4XhewlOLHbrhEwq53jId+tNHcNMZAw/+wkGp4P
	 zaUPX2ZXhfwbLheCIGZOK3uyjP8op0uMOQkDpNw2U2wgRNjVvHRu8Z1hwzlm0mFwcE
	 gAMxH0Cua7t7ov395fIhi+GIbTyUqDEdzQVGq6ufbHCnrHHDRz52wl/HNo4BTpXoM1
	 whhIotIkLepxw==
Received: from localhost ([2a03:a900:1020:47::f71])
	by smtpd-relay-594d8f6859-m6hpf (szn-email-smtpd/2.0.18) with ESMTPA
	id ac4ca5e8-6e0f-4e0c-893d-fd6a3a482a52;
	Wed, 20 Mar 2024 07:13:50 +0100
From: =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 3/3] ARM: dts: sun8i: h2+: add support for Banana Pi P2 Zero board
Date: Wed, 20 Mar 2024 07:13:32 +0100
Message-ID: <20240320061334.4078912-1-pavel@loebl.cz>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240320001152.4077150-1-pavel@loebl.cz>
References: <20240320001152.4077150-1-pavel@loebl.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Banana Pi P2 Zero is H2+-based board by Sinovoip internally similar
to Banana Pi M2 Zero.

It features:
- Allwinner H2+, Quad-core Cortex-A7
- 512MB DDR3 SDRAM
- 8G eMMC flash
- MicroSD card slot
- 100M LAN
- WiFi (AP6212) & Bluetooth onboard (SDIO + UART)
- Micro USB OTG port
- Micro USB connector (power only)
- Mini HDMI
- 40 PIN GPIO includes UART, SPI, I2C, IO etc.
- GPIO-connected key and LED
- CSI connector
- IEEE 802.3af PoE standard PoE module support (optional)

This adds support for v1.1 revision. There was also v1.0 available
which has different SDcard CD polarity and Ethernet port LEDs
disconnected in layout.

Signed-off-by: Pavel Löbl <pavel@loebl.cz>
---
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../sun8i-h2-plus-bananapi-p2-zero-v1.1.dts   | 287 ++++++++++++++++++
 2 files changed, 288 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-h2-plus-bananapi-p2-zero-v1.1.dts

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index 2a4162657a2c..567e81cc7b0f 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -219,6 +219,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-a83t-cubietruck-plus.dtb \
 	sun8i-a83t-tbs-a711.dtb \
 	sun8i-h2-plus-bananapi-m2-zero.dtb \
+	sun8i-h2-plus-bananapi-p2-zero-v1.1.dtb \
 	sun8i-h2-plus-libretech-all-h3-cc.dtb \
 	sun8i-h2-plus-orangepi-r1.dtb \
 	sun8i-h2-plus-orangepi-zero.dtb \
diff --git a/arch/arm/boot/dts/allwinner/sun8i-h2-plus-bananapi-p2-zero-v1.1.dts b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-bananapi-p2-zero-v1.1.dts
new file mode 100644
index 000000000000..bd38fe555442
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-h2-plus-bananapi-p2-zero-v1.1.dts
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2023 Pavel Löbl <pavel@loebl.cz>
+ *
+ * Based on sun8i-h2-plus-bananapi-m2-zero.dts, which is:
+ *   Copyright (C) 2017 Icenowy Zheng <icenowy@aosc.io>
+ */
+
+/dts-v1/;
+#include "sun8i-h3.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Banana Pi BPI-P2-Zero v1.1";
+	compatible = "sinovoip,bananapi-p2-zero-v1.1",
+		"sinovoip,bananapi-p2-zero",
+		"allwinner,sun8i-h2-plus";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	connector {
+		compatible = "hdmi-connector";
+		type = "c";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		pwr-led {
+			label = "bananapi-p2-zero:red:pwr";
+			color = <LED_COLOR_ID_RED>;
+			gpios = <&r_pio 0 10 GPIO_ACTIVE_LOW>; /* PL10 */
+			default-state = "on";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		switch-2 {
+			label = "power";
+			linux,code = <KEY_POWER>;
+			gpios = <&r_pio 0 3 GPIO_ACTIVE_LOW>; /* PL3 */
+			wakeup-source;
+		};
+	};
+
+	reg_vcc_5v: reg-vcc-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+	};
+
+	reg_vcc_1v2: reg-vcc-1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-1v2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-boot-on;
+		vin-supply = <&reg_vcc_5v>;
+	};
+
+	reg_vcc_3v3: reg-vcc-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		vin-supply = <&reg_vcc_5v>;
+	};
+
+	reg_vdd_cpux: vdd-cpux-regulator {
+		compatible = "regulator-gpio";
+		regulator-name = "vdd-cpux";
+		regulator-type = "voltage";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1300000>;
+		regulator-ramp-delay = <50>; /* 4ms */
+
+		gpios = <&r_pio 0 1 GPIO_ACTIVE_HIGH>; /* PL1 */
+		enable-active-high;
+		gpios-states = <0x1>;
+		states = <1100000 0>, <1300000 1>;
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>; /* PL7 */
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
+		clock-names = "ext_clock";
+	};
+};
+
+&de {
+	status = "okay";
+};
+
+&cpu0 {
+	cpu-supply = <&reg_vdd_cpux>;
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_vcc_3v3>;
+	bus-width = <4>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
+	cd-inverted;
+	status = "okay";
+};
+
+&mmc1 {
+	vmmc-supply = <&reg_vcc_3v3>;
+	vqmmc-supply = <&reg_vcc_3v3>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+		interrupt-parent = <&pio>;
+		interrupts = <6 10 IRQ_TYPE_LEVEL_LOW>; /* PG10 / EINT10 */
+		interrupt-names = "host-wake";
+	};
+};
+
+&mmc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc2_8bit_pins>;
+	vmmc-supply = <&reg_vcc_3v3>;
+	vqmmc-supply = <&reg_vcc_3v3>;
+	bus-width = <8>;
+	non-removable;
+	cap-mmc-hw-reset;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pa_pins>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		vbat-supply = <&reg_vcc_3v3>;
+		vddio-supply = <&reg_vcc_3v3>;
+		device-wakeup-gpios = <&pio 6 13 GPIO_ACTIVE_HIGH>; /* PG13 */
+		host-wakeup-gpios = <&pio 6 11 GPIO_ACTIVE_HIGH>; /* PG11 */
+		shutdown-gpios = <&pio 6 12 GPIO_ACTIVE_HIGH>; /* PG12 */
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
+		clock-names = "lpo";
+	};
+};
+
+&emac {
+	phy-handle = <&int_mii_phy>;
+	phy-mode = "mii";
+	phy-supply = <&reg_vcc_1v2>;
+	allwinner,leds-active-low;
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
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
+&usbphy {
+	usb0_id_det-gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
+
+	/*
+	 * There're two micro-USB connectors, one is power-only and another is
+	 * OTG. The Vbus of these two connectors are connected together, so
+	 * the external USB device will be powered just by the power input
+	 * from the power-only USB port or optional POE module.
+	 */
+	status = "okay";
+};
-- 
2.39.2

