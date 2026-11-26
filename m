Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725369;
	b=JG6IJ7QkrOdB2lDoy/fxH5J5ZrQ5VsvbnlHPIAcUrwAd6ORynB737Wfp3dYcX3detFCs
	 h5PSo8+AM/axjjH6FIeyxCNdy90nIrtx6xozf0wMCevLp+oYaSc4cAC2BYRWblCcyTzph
	 o3D8hnyx7iKcJYK7I0nfW3asCr4pVFqtpOc9vtRdU7xv89jNQquF271VrZ4qLqrv2URj6
	 qYdJx3upcK7iZyD1eTg7p/xkOhuwoVaa83e0kXo5MP0mdjspddB6yctu2NqjiGIfj5w69
	 K1ka+ocMsZn9QHB3qVejPQqiegnxqDQu9yXA3nH7Ef9WVTZfyGPa4uSKqf3OQV2rayg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5HFgmolTYhuB893XN9CD3I2MuvNR8OrZNKJS6ArKOlc=;
	b=aRDRSVuCfQQ1rABtYgKBZrQWd9KPI+5CiwrYwqfwJRHJOgT/NqCR0iJCoozlA5bC1DHq
	 WzSY48qgW89ukqj3T25ZPrZVyDQpemULVDKhfsvwQclBO+0BmLX6fJeX6yIqOkOxj6NkZ
	 cJlVX70APAtWsMq4Ghcepow1WGTYeaqPGjP01G7uIJ2l56lh1xM7u+LwPBO5kYZbnI8ZV
	 KYh3/LMAJg9TogJ0O5pgef2Uq+3unBOyX0oPuvHLLtPr81I0iCRx5phfPTHFb6nhAE3TR
	 eiZWeRJtQxRwvESdwmBvs8ZNfaMh/09Z6jKaF06jy/2849a/5C1ar7jNMsrZ2g8JWzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="F/Fll+4U";
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68986606A321
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 20:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68986606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F/Fll+4U
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-71b945cc4a6so96974eaf.2
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 12:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725368; x=1796330168; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HFgmolTYhuB893XN9CD3I2MuvNR8OrZNKJS6ArKOlc=;
        b=F/Fll+4UQsju0CxpS6KYPcoRmCSWQNjR0nXfSbaVD0NDa024QAMDstcYf8wha1GxVF
         i+VUUJrtjtczSmWc5sVethmJPAqjXY8p1GFtz2TG8SNXLqzsgO2oNN9v9ZYkBZylqlmV
         uXFtoekMLiYeQs5hcB7EgC+1K/d7/hcSc7bU0xg9vuYtCP9AmRur2sIfibi8Cn5zF8vL
         2e3IP5hS5uxabWg81aG4KBRKm7B4OJfQ179wqbm/DPPTPLBy+i6ByynfQWCgw1hDFm/c
         +JBZMJ3IwUhqI/tr7e2iFX5yDhaaODOVfOlvoWNIlHXy/QEew6uH2F83/o0JYxzRABZW
         caOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725368; x=1796330168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5HFgmolTYhuB893XN9CD3I2MuvNR8OrZNKJS6ArKOlc=;
        b=YsWWXH7aPGXeAQOdiGoTpG63q8IOitk+ySBH+RY7QkOabSC1rOjWc8CntvZvt31a3P
         iK7hZN1D3oq5sZzt4zJX7uaDt9GV3suuN7Ry79QAZn4ck065FFRW+5OVjfxyYbGP7/+N
         OFj6WrE5if7W4UaiqtuP1t3+NOQ6UiwIbJGQ8Z8yCKEUiv0vzTIWgW2nkCNF1wJs1nDY
         1C9b3P2rtu23PGZ8OwOpmgGyuitSNbG/MMUnI8956yb28QEDw5pxddV2sFdXxgZp2MGI
         MTKra2JRAZK93YEQl5uu7BBTfdYne5I7EFgafpCJGr/1zO4MqPtk8YK8D4AkmkUWoIf9
         7EaQ==
X-Forwarded-Encrypted: i=1; AL+hErHLA5LwF7Wp1TSrDmEyT4oSsMbyAeD9vBoGi4vFmGj7F8vXqn2qzavCBkY0kNLC6rBRPl77jzqCcXjtnA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/G2dzvUAuL7ardWvwtE1adJoCzmdAoGw9wQlfoFnY3kiXEzGHU
	HRs6efFLYYVxPdHxQTfx5V/X2d2LtYvnxSmfyUPpmc1sYt2qAvBCCaXB
X-Gm-Gg: AZFdTZdAG5JMi5dqtIvRNtAdcX5FOArYqInaMj9HcmXxAYV2eSM13kniYx8BlK/orGC
	FKQEj1KoY37IRsocuJt28g6s64zAUY4SnJ+hgJNU5A1nUEpFiPcRqOM2EMp+a2SVRXbNXRDYb6o
	p9707TTBaoknFqCeXtiQErmiFvUe9QHXN8Huydk8wvOEFx1t8YOvjiRpEp8w1/Y6JPIdcD+6XiW
	o0UPsopiWuk0KWl1l5iTZUhClBaKoBETzU8SvYgAnpHfm8zoAKveMmCcC/0CQ3qqKEw984oh9Zc
	aSonhmtWiJP6wCd/tS366Tc9Wbljm60UJaWTNeqpQnIuKRRmT6QIN7bx2/5Z9jmgQTrqG8eNibd
	TkGvgN+ullkeCfoaZUthJqpUAzLW7DRN+FDe0AWvgh36SyJIDrce35GF3aJMEwNdfk8jfMsyBXS
	kGN6xge3MsdEuOh/9GY/AD+MGTjZv6eMMQDtsaaDoMBhHimYCVHXTkz59pnp0y1KOVbWeUp1QYW
	1uv9G5up3APNaqYW0EkCHZRJ/G5Ph32bwEePKuCBQARE7aeQMJXHUIdMz38ytMadHFbhD1cykv4
	EH2K7tkb/Om9qCzDhuMTk4qoMy3/CRo39p8SWflUkuNpokImW3S0b6gJubXyuip4MG0J1xSDDWW
	AXp55
X-Received: by 2002:a05:6820:f025:b0:71a:f211:9547 with SMTP id 006d021491bc7-71b39260cf4mr18968038eaf.4.1795725368381;
        Thu, 26 Nov 2026 12:36:08 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b38015c51sm14573917eaf.3.2026.11.26.12.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:36:07 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: [PATCH v6 5/5] arm64: dts: allwinner: add Radxa Cubie A7A board
Date: Thu, 26 Nov 2026 15:36:05 -0500
Message-ID: <20261126-a733-cubie-a7s-dt-v6-5@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andre Przywara <andre.przywara@arm.com>

The Radxa Cubie A7A is a single board computer using the Allwinner A733
SoC. It features:
  - Allwinner A733 SoC (6*Arm Cortex-A55 + 2*Arm Cortex-A76)
  - Imagination BXM-4-64 MC1 GPU and 3 TOPS NPU
  - 2-16 GiB LPDDR5 DRAM
  - AXP318W PMIC
  - eMMC and UFS socket
  - single lane PCIe 3.0 via FPC connector
  - microSD card slot
  - bootable SPI NOR flash
  - HDMI 2.0 and MIPI-DSI connector
  - MIPI-CSI camera connector
  - GBit Ethernet socket, with optional POE support
  - unknown Bluetooth and WiFi
  - USB-C 2.0 OTG port (also primary power supply)
  - USB-A 3.1 host port
  - 3* USB-A 2.0 host ports (via hub)
  - 40 pin GPIO connector

Add initial support for the peripherals we have DT bindings for so far,
including UART, PMIC, SD card, some EEPROM and an external RTC chip.
The PMIC rails assignment has been determined by the schematic.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes since the DT series v5:
- Add Andre's posted Cubie A7A board patch. It now gets its R-I2C1
  pin group from the common DTSI. The board DTS is identical to the
  posted version. The Makefile context includes the A7Z entry.

Link: https://lore.kernel.org/r/20261126172253.1097838-3-andre.przywara@arm.com

 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7a.dts   | 385 ++++++++++++++++++
 2 files changed, 386 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 62fab1d727d0..cdeb966031ee 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -69,5 +69,6 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7a.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7z.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts
new file mode 100644
index 000000000000..9017cadf6c6a
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7a.dts
@@ -0,0 +1,385 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (c) 2026 Arm Ltd.
+ */
+
+/dts-v1/;
+
+#include "sun60i-a733.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Radxa Cubie A7A";
+	compatible = "radxa,cubie-a7a", "allwinner,sun60i-a733";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		power-led {
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_GREEN>;
+			/*
+			 * The LED is connected between VCC and GND, so it
+			 * turns on as soon as the board gets power. But a
+			 * transistor allows to pull down the anode to GND,
+			 * so the LED can be turned off.
+			 */
+			gpios = <&pio 9 26 GPIO_ACTIVE_LOW>; /* PJ26 */
+			default-state = "on";
+		};
+
+		status-led {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&pio 9 27 GPIO_ACTIVE_HIGH>; /* PJ27 */
+		};
+	};
+
+	osc32k: osc32k-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	/* discrete SY8089A DC/DC step-down regulator */
+	reg_vcc2v4: regulator-2v4 {
+		compatible = "regulator-fixed";
+		regulator-name = "ldo-input";
+		regulator-min-microvolt = <2400000>;
+		regulator-max-microvolt = <2400000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc5v>;
+	};
+
+	/* board wide 5V supply from the USB-C connector */
+	reg_vcc5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu1 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu2 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu3 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu4 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu5 {
+	cpu-supply = <&reg_dcdc5>;
+};
+
+&cpu6 {
+	cpu-supply = <&reg_dcdc3>;
+};
+
+&cpu7 {
+	cpu-supply = <&reg_dcdc3>;
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pg_pins>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "belling,bl24c16f", "atmel,24c16";
+		reg = <0x50>;
+		pagesize = <16>;
+		vcc-supply = <&reg_aldo1>;
+		wp-gpios = <&pio 2 7 GPIO_ACTIVE_LOW>; /* PC7 */
+	};
+};
+
+&mmc0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-mmc-highspeed;
+	cap-sdio-irq;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;   /* PF6 */
+	disable-wp;
+	vmmc-supply = <&reg_swout2>;
+	status = "okay";
+};
+
+&hosc {
+	clock-frequency = <26000000>;
+};
+
+&pio {
+	vcc-pb-supply = <&reg_swout2>;	// via VCC-IO
+	vcc-pc-supply = <&reg_cldo5>;
+	vcc-pd-supply = <&reg_swout1>;
+	vcc-pe-supply = <&reg_bldo1>;
+	vcc-pf-supply = <&reg_swout2>;	// via VCC-IO
+	vcc-pg-supply = <&reg_aldo1>;
+	vcc-ph-supply = <&reg_swout2>;	// via VCC-IO
+	vcc-pj-supply = <&reg_swout1>;
+	vcc-pk-supply = <&reg_aldo1>;
+};
+
+&r_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_i2c0_pl_pins>;
+	status = "okay";
+
+	axp318w: pmic@36 {
+		compatible = "x-powers,axp318w";
+		reg = <0x36>;
+		interrupt-parent = <&nmi_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		aldo156in-supply = <&reg_vcc5v>;
+		aldo234in-supply = <&reg_aldo1>;
+		bldoin-supply = <&reg_vcc2v4>;
+		cldoin-supply = <&reg_vcc2v4>;
+		dldoin-supply = <&reg_vcc5v>;
+		eldoin-supply = <&reg_dcdc9>;
+		ips-supply = <&reg_vcc5v>;
+		vin19-supply = <&reg_vcc5v>;
+		vin23-supply = <&reg_vcc5v>;
+		vin45-supply = <&reg_vcc5v>;
+		vin678-supply = <&reg_vcc5v>;
+
+		regulators {
+			reg_dcdc1: dcdc1 {
+				/* VCC3V3 on GPIO connector and power LED */
+				regulator-name = "vcc-wifi-hub-pci-gpio-led";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc2: dcdc2 {
+				regulator-name = "vdd-sys-dram-ve-combo";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc3: dcdc3 {
+				regulator-name = "vdd-cpub";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc4: dcdc4 {
+				regulator-name = "vdd-gpu";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <960000>;
+			};
+
+			reg_dcdc5: dcdc5 {
+				regulator-name = "vdd-cpul";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc6: dcdc6 {
+				/* Voltage set by DRAM init routine */
+				regulator-name = "vcc-draml-vddq";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <600000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc7: dcdc7 {
+				/* Voltage set by DRAM init routine */
+				regulator-name = "vcc-dram";
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-always-on;
+			};
+
+			reg_dcdc8: dcdc8 {
+				regulator-name = "vcc-ufs-io";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			reg_dcdc9: dcdc9 {
+				regulator-name = "eldo-input";
+				/*
+				 * The schematic says 1.25V, but the
+				 * granularity of DCDC9 is 20mV in this range.
+				 */
+				regulator-min-microvolt = <1240000>;
+				regulator-max-microvolt = <1260000>;
+			};
+
+			reg_swout1: swout1 {
+				regulator-name = "vcc-pd-pj-lcd-ephy";
+			};
+
+			reg_swout2: swout2 {
+				/* SoC VCC-IO and USB 3.3V supply #2 */
+				regulator-name = "vcc-io-sd-emmc-ph-usb";
+				regulator-always-on;
+			};
+
+			reg_aldo1: aldo1 {
+				/* PortL (this PMIC) and USB 3.3V supply #1 */
+				regulator-name = "vcc-pl-usb";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			reg_aldo5: aldo5 {
+				regulator-name = "vcc-ac101-codec";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-name = "vcc-pe-pk-mcsi";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-name = "vcc-lvds-lcd";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_bldo4: bldo4 {
+				regulator-name = "vcc18-codec";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo1: cldo1 {
+				regulator-name = "vcc18-lpddr";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_cldo2: cldo2 {
+				regulator-name = "vcc18-hdmi";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_cldo3: cldo3 {
+				regulator-name = "vcc-pll-dram-avcc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_cldo5: cldo5 {
+				regulator-name = "vcc-pc-combo";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			reg_dldo1: dldo1 {
+				regulator-name = "vcc-efuse";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			reg_dldo6: dldo6 {
+				regulator-name = "vcc-ufs";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
+			};
+
+			reg_eldo1: eldo1 {
+				regulator-name = "vcc09-lpddr5";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-always-on;
+			};
+
+			reg_eldo6: eldo6 {
+				regulator-name = "vdd-cpus-usb";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <800000>;
+				regulator-always-on;
+			};
+
+			reg_rtc_ldo: rtc-ldo {
+				regulator-name = "vcc-rtc";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&r_i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_i2c1_pl_pins>;
+	status = "okay";
+
+	rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		interrupt-parent = <&r_pio>;
+		interrupts = <0 3 IRQ_TYPE_EDGE_FALLING>;	/* PL3 */
+	};
+};
+
+&r_i2c1_pl_pins {
+	/*
+	 * The schematic shows external pull-up resistors, but still the
+	 * internal pull-ups are required somehow.
+	 */
+	bias-pull-up;
+};
+
+&r_pio {
+	/*
+	 * Specifying the supply would create a circular dependency.
+	 *      vcc-pl-supply = <&reg_aldo1>;
+	 */
+	vcc-pm-supply = <&reg_aldo1>;
+};
+
+&rtc {
+	clocks = <&r_ccu CLK_BUS_R_RTC>, <&hosc>, <&r_ccu CLK_R_AHB>,
+		 <&osc32k>;
+	clock-names = "bus", "hosc", "ahb", "ext-osc32k";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};

