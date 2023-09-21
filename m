Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6872B641
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Sep 2023 13:51:45 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1dc89741cedso206472fac.0
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Sep 2023 06:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695304304; x=1695909104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWPDtqrSNlFWJNGtTdELDc+gCPScA6mkjwfRNyPaAXw=;
        b=bc7T0LT6lTZnSTP/edepS7Srqz7kKUA9twttkUv+PBJ2gndLqwbIu/Ib3qgmOnPAAt
         L9+PvSV3pTDnG5hGVhdq48YUMR2FXI+7yVeGxWd64RQJTEeCPlJWC7syUhVPDqYa8WG1
         Ip4y7eLYfwX1B1flOrBnIL/JjI7lq8d+MdmaF7++L0JdonG6ttNgF47KeVlupZBcp25n
         U2LFisLT/BPJUldus5AVpOKgqNKwUp82/48GGNbdm7Aj55WxWC7PZUjzoAdg6uqyVHof
         9Ks1BHK6Dwvdz2QIZPnX6HSvSulKSxDxDH1Rn2JeiTcQLxv/yykNZFIaSmgS5ee8Tu47
         81wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695304304; x=1695909104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWPDtqrSNlFWJNGtTdELDc+gCPScA6mkjwfRNyPaAXw=;
        b=rJVGG+gXhim+8XZwzshY8tIz+bBMKgw38x4jyQ+bBQvjVVgu9pm8DmXCjPCEMJnEPN
         E+VlSb+0QO5ATCwnO/rnB00xLip4Nx7N0j8fZDWYKK8rHkTOEFhnoX1VkiYDhoTw7H7z
         XPduyjArRNKEAO1DzjJor3qamni9gMIENLKCgim0lRYaAmx9aXKjaCFKDFztfz8O2/Y3
         fDAtFSbzWV3y3E+FJ9F3TgmzGSSqKLh0Q6tqVnS5LVlUW8pVfiYgl/mRlV/F4xQCpMZ5
         4Wz5Qz3lZAQyY469zLTrSBbLFWQ7RjXiuT89+q/Q9l+RmpwK4nyElfys+vyyzBCBPOfb
         uRHA==
X-Gm-Message-State: AOJu0Yzr1l2auxtC0cbe1pZVjhATjIPR20KQlPQXRzEyVARSQZ0EfzMl
	UjQraCBF1o5Cs7wMtmefH2AOObjTbdM=
X-Google-Smtp-Source: AGHT+IFIQ0cd+5ISzxChSAfPX7Xz+I3Et8iJ6Jt8P7r8laYWNgd04ihFnTZgHCWed29ar0gd5C/wkg==
X-Received: by 2002:a05:6870:b490:b0:1d7:876:c825 with SMTP id y16-20020a056870b49000b001d70876c825mr5730136oap.48.1695304304581;
        Thu, 21 Sep 2023 06:51:44 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id z19-20020a056870e15300b001d7034bc222sm547064oaa.15.2023.09.21.06.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 06:51:44 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	uwu@icenowy.me,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	andre.przywara@arm.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V5 4/4] ARM: dts: sunxi: add support for Anbernic RG-Nano
Date: Thu, 21 Sep 2023 08:51:36 -0500
Message-Id: <20230921135136.97491-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230921135136.97491-1-macroalpha82@gmail.com>
References: <20230921135136.97491-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The Anbernic RG-Nano is a small portable game device based on the
Allwinner V3s SoC. It has GPIO buttons on the face and side for
input, a single mono speaker, a 240x240 SPI controlled display, a USB-C
OTG port, an SD card slot for booting, and 64MB of RAM included in the
SoC. There does not appear to be a crystal feeding the internal RTC so
it does not keep proper time (for me it ran 8 hours slow in a 24 hour
period). External RTC works just fine.

Working/Tested:
- SDMMC
- UART (for debugging)
- Buttons
- Charging/battery/PMIC
- Speaker
- RTC (external RTC)
- USB
- Display

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 284 ++++++++++++++++++
 2 files changed, 285 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index eebb5a0c873a..2d26c3397f14 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -256,6 +256,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-t113s-mangopi-mq-r-t113.dtb \
 	sun8i-t3-cqa3t-bv3.dtb \
 	sun8i-v3-sl631-imx179.dtb \
+	sun8i-v3s-anbernic-rg-nano.dtb \
 	sun8i-v3s-licheepi-zero.dtb \
 	sun8i-v3s-licheepi-zero-dock.dtb \
 	sun8i-v40-bananapi-m2-berry.dtb
diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
new file mode 100644
index 000000000000..1a4429dc57b1
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
@@ -0,0 +1,284 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+#include <dt-bindings/input/linux-event-codes.h>
+#include "sun8i-v3s.dtsi"
+#include "sunxi-common-regulators.dtsi"
+
+/ {
+	model = "Anbernic RG Nano";
+	compatible = "anbernic,rg-nano", "allwinner,sun8i-v3s";
+
+	aliases {
+		rtc0 = &pcf8563;
+		rtc1 = &rtc;
+		serial0 = &uart0;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 1 2 3 8 14 21 32 46 60 80 100>;
+		default-brightness-level = <11>;
+		power-supply = <&reg_vcc5v0>;
+		pwms = <&pwm 0 40000 1>;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio_keys: gpio-keys {
+		compatible = "gpio-keys";
+
+		button-a {
+			gpios = <&gpio_expander 12 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+			label = "BTN-A";
+			linux,code = <BTN_EAST>;
+		};
+
+		button-b {
+			gpios = <&gpio_expander 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+			label = "BTN-B";
+			linux,code = <BTN_SOUTH>;
+		};
+
+		button-down {
+			gpios = <&gpio_expander 1 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+			label = "DPAD-DOWN";
+			linux,code = <BTN_DPAD_DOWN>;
+		};
+
+		button-left {
+			gpios = <&gpio_expander 4 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+			label = "DPAD-LEFT";
+			linux,code = <BTN_DPAD_LEFT>;
+		};
+
+		button-right {
+			gpios = <&gpio_expander 0 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+			label = "DPAD-RIGHT";
+			linux,code = <BTN_DPAD_RIGHT>;
+		};
+
+		button-se {
+			gpios = <&gpio_expander 7 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+			label = "BTN-SELECT";
+			linux,code = <BTN_SELECT>;
+		};
+
+		button-st {
+			gpios = <&gpio_expander 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+			label = "BTN-START";
+			linux,code = <BTN_START>;
+		};
+
+		button-tl {
+			gpios = <&gpio_expander 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+			label = "BTN-L";
+			linux,code = <BTN_TL>;
+		};
+
+		button-tr {
+			gpios = <&gpio_expander 15 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+			label = "BTN-R";
+			linux,code = <BTN_TR>;
+		};
+
+		button-up {
+			gpios = <&gpio_expander 3 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+			label = "DPAD-UP";
+			linux,code = <BTN_DPAD_UP>;
+		};
+
+		button-x {
+			gpios = <&gpio_expander 11 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+			label = "BTN-X";
+			linux,code = <BTN_NORTH>;
+		};
+
+		button-y {
+			gpios = <&gpio_expander 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+			label = "BTN-Y";
+			linux,code = <BTN_WEST>;
+		};
+	};
+};
+
+&codec {
+	allwinner,audio-routing = "Speaker", "HP",
+				  "MIC1", "Mic",
+				  "Mic", "HBIAS";
+	allwinner,pa-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>; /* PF6 */
+	status = "okay";
+};
+
+&ehci {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+
+	gpio_expander: gpio@20 {
+		compatible = "nxp,pcal6416";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&pio>;
+		interrupts = <1 3 IRQ_TYPE_EDGE_BOTH>; /* PB3/EINT3 */
+		vcc-supply = <&reg_vcc3v3>;
+	};
+
+	axp209: pmic@34 {
+		reg = <0x34>;
+		interrupt-parent = <&pio>;
+		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>; /* PB5/EINT5 */
+	};
+
+	pcf8563: rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+	};
+};
+
+#include "axp209.dtsi"
+
+&battery_power_supply {
+	status = "okay";
+};
+
+&mmc0 {
+	broken-cd;
+	bus-width = <4>;
+	disable-wp;
+	vmmc-supply = <&reg_vcc3v3>;
+	vqmmc-supply = <&reg_vcc3v3>;
+	status = "okay";
+};
+
+&ohci {
+	status = "okay";
+};
+
+&pio {
+	vcc-pb-supply = <&reg_vcc3v3>;
+	vcc-pc-supply = <&reg_vcc3v3>;
+	vcc-pf-supply = <&reg_vcc3v3>;
+	vcc-pg-supply = <&reg_vcc3v3>;
+
+	spi0_no_miso_pins: spi0-no-miso-pins {
+		pins = "PC1", "PC2", "PC3";
+		function = "spi0";
+	};
+};
+
+&pwm {
+	pinctrl-0 = <&pwm0_pin>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/* DCDC2 wired into vdd-cpu, vdd-sys, and vdd-ephy. */
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-max-microvolt = <1250000>;
+	regulator-min-microvolt = <1250000>;
+	regulator-name = "vdd-cpu";
+};
+
+/* DCDC3 wired into every 3.3v input that isn't the RTC. */
+&reg_dcdc3 {
+	regulator-always-on;
+	regulator-max-microvolt = <3300000>;
+	regulator-min-microvolt = <3300000>;
+	regulator-name = "vcc-io";
+};
+
+/*
+ * LDO1 wired into RTC, voltage is hard-wired at 3.3v and cannot be
+ * software modified. Note that setting voltage here to 3.3v for accuracy
+ * sake causes an issue with the driver that causes it to fail to probe
+ * because of a voltage constraint in the driver.
+ */
+&reg_ldo1 {
+	regulator-always-on;
+	regulator-name = "vcc-rtc";
+};
+
+/* LDO2 wired into VCC-PLL and audio codec. */
+&reg_ldo2 {
+	regulator-always-on;
+	regulator-max-microvolt = <3000000>;
+	regulator-min-microvolt = <3000000>;
+	regulator-name = "vcc-pll";
+};
+
+/* LDO3, LDO4, and LDO5 unused. */
+&reg_ldo3 {
+	status = "disabled";
+};
+
+&reg_ldo4 {
+	status = "disabled";
+};
+
+/*
+ * Force the driver to use internal oscillator by removing clocks
+ * property.
+ */
+&rtc {
+	/delete-property/ clocks;
+};
+
+&spi0 {
+	pinctrl-0 = <&spi0_no_miso_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	display@0 {
+		compatible = "saef,sftc154b", "panel-mipi-dbi-spi";
+		reg = <0>;
+		backlight = <&backlight>;
+		dc-gpios = <&pio 2 0 GPIO_ACTIVE_HIGH>; /* PC0 */
+		reset-gpios = <&pio 1 2 GPIO_ACTIVE_HIGH>; /* PB2 */
+		spi-max-frequency = <100000000>;
+
+		height-mm = <39>;
+		width-mm = <39>;
+
+		/* Set hb-porch to compensate for non-visible area */
+		panel-timing {
+			hactive = <240>;
+			vactive = <240>;
+			hback-porch = <80>;
+			vback-porch = <0>;
+			clock-frequency = <0>;
+			hfront-porch = <0>;
+			hsync-len = <0>;
+			vfront-porch = <0>;
+			vsync-len = <0>;
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_pb_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usb_power_supply {
+	status = "okay";
+};
+
+&usbphy {
+	usb0_id_det-gpios = <&pio 6 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PG5 */
+	status = "okay";
+};
-- 
2.34.1

