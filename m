Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C596200A4
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 21:26:08 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3a7f4f7a8easo2827354b6e.2
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Aug 2023 14:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692825968; x=1693430768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usvnbi6NQO/6rm4Jp2iIrzuLqTcjxnR9/PyvgS0s/ms=;
        b=qacVWkMreZL8E6e6lkEEVXKw8qL/BwlatcsreDtZXrC1ug6OBJdgm50u8VBXroIwob
         fJVg6NRUpyUi4UNbDU0211sR3ivY7T6FrHN9aTK9Ymf6VHqW4KCBRszV1shD2ilzT8vY
         ryPF+hvmrAJjcdsfH8zQ6xSbKIprdr8jXCLffV/hxlX8zvg5m7WunNX/t0P/lIT24arI
         EYsqUdRv+NyTn0u+cDnK+JfqoGe+u6wKASB9aq9cbXUjBqUBAldcJ6qp/AxEu3GTJHNC
         RFRhr8kSpnNFtZmIQ83mmIivVMB9f5yVz9uqTN6OdS9EG6LYf4lwSa6T6pl0/B0Y35SG
         jwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692825968; x=1693430768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usvnbi6NQO/6rm4Jp2iIrzuLqTcjxnR9/PyvgS0s/ms=;
        b=EhXpzRT4QpwgI1BwjnKG8wGAft66qlBZLxK7grA3Ey8lsU9ox4hsJTfFqg0/0Hm93n
         f8xSCgUp+mXGyHxjAwohM4oWX14kooiIP0J2fSsAGBgNUuFDyAi4QPYqITtFugkyIRBh
         IhU5zWhMQS7jdofr/EYMESlhW00srUts6PoQ44VkIiaf3tyoGbwoa7Zl+v8inw91KdTy
         uWKM2ij7H3Kb/BH6I8oDao6hv4fxfCUk7EgmJm5zL96+1MaQgQjc+4OjyX5ZKx5NaOF6
         wypixjZ9pgnEiPy1oOUUtV2BuGKlWkXe7lIFHeWHcw8/zi8cnALNwujqVJxO/sQIkF+0
         FbUA==
X-Gm-Message-State: AOJu0YyUt9FbfilCP/igKA/AEIe0VCKkqrm6Ao1h/J4oN8UQcg5hMcds
	g8JceId6qGJKngnrg6ZDtbYvLEkP0+47uA==
X-Google-Smtp-Source: AGHT+IEECMzvg/2z14ZAi2FGgcStrBTk7Z+7iSRMmygNO3Xtvq8Rd30nv9BMX+yi/uaTBzuBmOA0rw==
X-Received: by 2002:a05:6808:285:b0:3a8:698b:663 with SMTP id z5-20020a056808028500b003a8698b0663mr6577680oic.14.1692825967811;
        Wed, 23 Aug 2023 14:26:07 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id d26-20020a05680808fa00b003a1d29f0549sm771127oic.15.2023.08.23.14.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 14:26:07 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	jagan@edgeble.ai,
	heiko@sntech.de,
	uwu@icenowy.me,
	andre.przywara@arm.com,
	daniel@ffwll.ch,
	airlied@gmail.com,
	sam@ravnborg.org,
	neil.armstrong@linaro.org,
	noralf@tronnes.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 8/8] ARM: dts: sunxi: add support for Anbernic RG-Nano
Date: Wed, 23 Aug 2023 16:25:54 -0500
Message-Id: <20230823212554.378403-9-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230823212554.378403-1-macroalpha82@gmail.com>
References: <20230823212554.378403-1-macroalpha82@gmail.com>
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
SoC.

Working/Tested:
- SDMMC
- UART (for debugging)
- Buttons
- Charging/battery/PMIC
- Speaker
- USB Host and Gadget
- Display (at 60hz)

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 275 ++++++++++++++++++
 2 files changed, 276 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index 589a1ce1120a..2be83a1edcbb 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -237,6 +237,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-t113s-mangopi-mq-r-t113.dtb \
 	sun8i-t3-cqa3t-bv3.dtb \
 	sun8i-v3-sl631-imx179.dtb \
+	sun8i-v3s-anbernic-rg-nano.dtb \
 	sun8i-v3s-licheepi-zero.dtb \
 	sun8i-v3s-licheepi-zero-dock.dtb \
 	sun8i-v40-bananapi-m2-berry.dtb
diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
new file mode 100644
index 000000000000..c2866a884f0e
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-anbernic-rg-nano.dts
@@ -0,0 +1,275 @@
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
+	allwinner,pa-gpios = <&pio 5 6 (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
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
+		interrupts = <1 3 IRQ_TYPE_EDGE_BOTH>;
+		vcc-supply = <&reg_vcc3v3>;
+	};
+
+	axp209: pmic@34 {
+		reg = <0x34>;
+		interrupt-parent = <&pio>;
+		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>;
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
+/* Out of alphabetical order for dependencies sake. */
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
+	spi0_3wire_pins: spi0-3wire-pins {
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
+&spi0 {
+	pinctrl-0 = <&spi0_3wire_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	display@0 {
+		compatible = "saef,sftc154b", "panel-mipi-dbi-spi";
+		reg = <0>;
+		backlight = <&backlight>;
+		dc-gpios = <&pio 2 0 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 1 2 GPIO_ACTIVE_HIGH>;
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
+	usb0_id_det-gpios = <&pio 6 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	status = "okay";
+};
-- 
2.34.1

