Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2595538E126
	for <linux-sunxi@lists.linux.dev>; Fri,  5 Jun 2026 19:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780686871; cv=none; b=aqSFBkmCv5k6Oxa8AslWQQTcI/k72libbQsxlCsEDDa+0rGh6FVhe1lc7WKvzPkwEYdYd5iC8PC74Zzy/GZg6Sb9gIvBSSpCkagZyhvjlp6soLNMg5ex71iItsO3rua4RsxSnh+cK6ChZpAZxBz3TgKxoZoOYNBTHxq/5UJ7kEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780686871; c=relaxed/simple;
	bh=3kxLjxHrpsxtBRx7GY/HQPyaHGv49pC17f+9Hjl/710=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rTGJG+6zzKW9v7om3KmbPJLroxNrPqv2XhSInVTYZNfC7WAV/tij6Lxz5x23KMHqVzLLM02M0S0kAMFA54/cjxCx/Di9LOTbJtUyrnvvCvWjqm0s79scOl8FoOmqW36hHL9+3hEPPf4uQVShK51G/bqB2/ZxgTdsvcX5m7BnybQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=g1Y36T3p; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="g1Y36T3p"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=KE3Yd9aBqiM7+6VuFaFQ2f9ptin36tpfS9P+PDSGCTQ=;
	b=g1Y36T3pY5Jk1Rdx82z6b8iQ0fn9NoJRI1L3eo/v0e8UVPZD6k0lLeZeV5bteDQQWU6iGVKrSzRxR2G5+eRNynyp74sntChz5BRRsnPFfXYv/qdFH+vz2qZulfdzGGBVCuiEz1KXRUJY1zzA08x7zSphURnV3bGOqIjHno6ehMM=
Received: from lukas-hpz440workstation.lan.sk100508.local (194-166-56-114.hdsl.highway.telekom.at [194.166.56.114])
	by mail.netcube.li with ESMTPA
	; Fri, 5 Jun 2026 21:14:06 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/3] ARM: dts: sunxi: add support for NetCube Systems OpenNMC (dobermann)
Date: Fri,  5 Jun 2026 21:13:15 +0200
Message-ID: <20260605191322.1920944-4-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260605191322.1920944-1-lukas.schmid@netcube.li>
References: <20260605191322.1920944-1-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NetCube Systems OpenNMC is an open replacement for APC SmartSlot Management
Cards. It is based on the Nagami System-on-Module. It breaks out the
following interfaces:

- 10/100 Mbps Ethernet
- USB Type-C OTG using a TUSB320 (usb0)
- USB Type-C Console Port using a CH340 (uart3)
- USB Type-A Host with internal CH334 USB-Hub (usb1)
- MicroSD Slot with Card-Detect (mmc0)
- WiFi/Bluetooth using the modules built-in ESP32
- SmartSlot serial interface (uart4)
- DS3232 RTC with CR1220 Battery Backup
- Extension connector providing SPI,I2C,USB,CAN,UART for future use.

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 .../sun8i-t113s-netcube-dobermann.dts         | 149 ++++++++++++++++++
 1 file changed, 149 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dts

diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dts b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dts
new file mode 100644
index 000000000000..d7765caffe2a
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-dobermann.dts
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Lukas Schmid <lukas.schmid@netcube.li>
+ */
+
+/dts-v1/;
+#include "sun8i-t113s-netcube-nagami.dtsi"
+
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "NetCube Systems OpenNMC (dobermann)";
+	compatible = "netcube,dobermann", "netcube,nagami",
+		     "allwinner,sun8i-t113s";
+
+	aliases {
+		serial2 = &uart4; // UART on SmartSlot
+		rtc0 = &ds3232;
+		rtc1 = &rtc; // not battery backed
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led_heartbeat_green: led-heartbeat-green {
+			gpios = <&pio 6 14 GPIO_ACTIVE_HIGH>; /* PG14 */
+			linux,default-trigger = "heartbeat";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_HEARTBEAT;
+		};
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+
+	tusb320: typec@60 {
+		compatible = "ti,tusb320";
+		reg = <0x60>;
+		interrupts-extended = <&pio 3 22 IRQ_TYPE_LEVEL_LOW>;  /* PD22 */
+	};
+
+	ds3232: rtc@68 {
+		compatible = "dallas,ds3232";
+		reg = <0x68>;
+	};
+};
+
+/* microSD Card Slot on the board */
+&mmc0 {
+	vmmc-supply = <&reg_vcc3v3>;
+	disable-wp;
+	bus-width = <4>;
+	cd-gpios = <&pio 6 15 GPIO_ACTIVE_LOW>; /* PG15 */
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&pio {
+	gpio-line-names = "", "", "", "", // PA
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "SMART_TX", "SMART_RX", // PB
+			  "EXT_IO3", "EXT_IO2", "CONSOLE_TX", "CONSOLE_RX",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "eMMC_CLK", "eMMC_CMD", // PC
+			  "eMMC_D2", "eMMC_D1", "eMMC_D0", "eMMC_D3",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "", // PD
+			  "", "", "", "",
+			  "", "USB_SEC_EN", "EXT_SPI_nCS", "EXT_SPI_SCK",
+			  "EXT_SPI_MOSI", "EXT_SPI_MISO", "EXT_IO5", "EXT_IO4",
+			  "SMART_SEL", "", "", "",
+			  "I2C2_SCL", "I2C2_SDA", "TUSB320_nINT", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "ETH_CRSDV", "ETH_RXD0", "ETH_RXD1", "ETH_TXCK", // PE
+			  "ETH_TXD0", "ETH_TXD1", "ETH_TXEN", "",
+			  "ETH_MDC", "ETH_MDIO", "I2C3_nINT", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "uSD_D1", "uSD_D0", "uSD_CLK", "uSD_CMD", // PF
+			  "uSD_D3", "uSD_D2", "TUSB320_ID", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "ESP_CLK", "ESP_CMD", "ESP_D0", "ESP_D1", // PG
+			  "ESP_D2", "ESP_D3", "ESP_TXD", "ESP_RXD",
+			  "ESP_nBOOT", "ESP_nRST", "I2C3_SCL", "I2C3_SDA",
+			  "EXT_IO1", "EXT_IO0", "LED_HEARTBEAT", "SD_DETECT",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+/* SmartSlot serial */
+&uart4 {
+	pinctrl-0 = <&uart4_pb_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usb_otg {
+	extcon = <&tusb320 0>;
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbphy {
+	usb0_id_det-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
+	status = "okay";
+};
-- 
2.47.3


