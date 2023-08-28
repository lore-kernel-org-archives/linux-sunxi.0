Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893C413FEE
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 18:19:58 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6b9e478e122so2584828a34.1
        for <linux-sunxi@lists.linux.dev>; Mon, 28 Aug 2023 11:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693246797; x=1693851597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmXUFl8ZOMJbj0/4B/tnOjOR+1Ud+EaYY+y8tg1tAG8=;
        b=qwM52Br3GyIkTuYGVKx9bljNM9F/Sm8m2Zv+AHiafG38c7eJeiI5jOxe43valJZ8bC
         LW3d6KXZjxGjtTxNWGQrwkjfj9WZgg9ywrMzykrFt2DXpHKHXAOyeElbAYLx7zR1Bg0l
         NR3sgN4J1PAm/VnIu27poGnQhTyBejkUgSERr59IOSmM510yqQxF5iELC575PNMTAyKK
         5TKUJkpkmUwyWiRswbe9gF9UssIzUOiRJ+NMdowkQJD/GRLJL7BWO5dCukJaO1j1lzSL
         abdE5NtkuIoBCkK7ra9zLGugpf4J+D4AdOMxtt7m5B4FiWoTbcC0M+hD4Rgmr/gw4ump
         h32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693246797; x=1693851597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmXUFl8ZOMJbj0/4B/tnOjOR+1Ud+EaYY+y8tg1tAG8=;
        b=BJruOHU4xNS+QeGbykjvx19e9G/0pDlfuQd/frSOr+iO2xtFKcxO836gnH//uaFt/Y
         BvCjAcF1ICWTXcFBsxWxK4mTVOD3FkIO17RyL9VOkgCALrQWn8/poNObceDFTIxWz8LO
         Y744Nsip+Sl4Eb/pnDio9K0LSst9k1FCsRErTph+UcNSD8EL2rAIQEXqZw9EWaT6iJjQ
         06sTgqwr4zBWSp6JvWs76VfAu5KiMYnlPJEVobOX+C6j/mCh0+HRVFvLd0eRcIm1uaPq
         PwNwXDrCqMecAApQCMCGfJZUttl42e4GfkN9w3+NjOARSDmD+8hugg8nyZF9yytip9Xn
         tG6g==
X-Gm-Message-State: AOJu0YwgPo7Nrtz2ojLcR7gYs7ArpdtWjfgHGqIT4cnAzjt0yxDdEzbq
	JJ9NN6buxg1G7in/x8Qw6Hb8mj2Mlp8S2Q==
X-Google-Smtp-Source: AGHT+IEDOKjNy4reLVvpN6HvgkLGoN+/ZQDEoY860maNl5VSXMaBAzrmSvfkIXPP8/gBTuHAm1a4cQ==
X-Received: by 2002:a9d:77c3:0:b0:6b9:bd9d:e333 with SMTP id w3-20020a9d77c3000000b006b9bd9de333mr15619658otl.3.1693246797254;
        Mon, 28 Aug 2023 11:19:57 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id g10-20020a9d620a000000b006b99f66444bsm3695927otj.71.2023.08.28.11.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 11:19:57 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	airlied@gmail.com,
	andre.przywara@arm.com,
	conor+dt@kernel.org,
	daniel@ffwll.ch,
	heiko@sntech.de,
	jagan@edgeble.ai,
	jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	noralf@tronnes.org,
	robh+dt@kernel.org,
	sam@ravnborg.org,
	samuel@sholland.org,
	uwu@icenowy.me,
	wens@csie.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V4 8/8] ARM: dts: sunxi: add support for Anbernic RG-Nano
Date: Mon, 28 Aug 2023 13:19:41 -0500
Message-Id: <20230828181941.1609894-9-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230828181941.1609894-1-macroalpha82@gmail.com>
References: <20230828181941.1609894-1-macroalpha82@gmail.com>
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
- RTC
- USB Host and Gadget*
- Display (at 60hz)

*There is an issue with the usb_phy where it forces the device to host
mode. Until the phy driver is fixed this can be bypassed by either
removing the phy references from the ohci and ehci nodes or by setting
the usbphy on the ohci and ehci nodes to 1 (which is incorrect).

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm/boot/dts/allwinner/Makefile          |   1 +
 .../allwinner/sun8i-v3s-anbernic-rg-nano.dts  | 284 ++++++++++++++++++
 2 files changed, 285 insertions(+)
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
index 000000000000..bcccb0d3f9ce
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
+&ccu {
+	clocks = <&osc24M>, <&osc32k>;
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
+	clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
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
+/* External RTC used instead, internal RTC runs fast. */
+&rtc {
+	status = "disabled";
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

