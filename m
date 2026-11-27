Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762447;
	b=5tSFAYy5gJKkI04Sq07WBvI33pJh7wvDE1fIb5W8whjd3p2EaHiKkUWgX1nPAc/A6PLn
	 u7hFORnG4FJNgyOXPrA0Pv1lloJnlkOcAzhzeKFMcmcCgmyvQNyGYtRX546rfKPYb/g2B
	 1NgBH5U9QQjvNjdPtgk6qMvoHcCKIks2SloE0RJp2AGqlgjWYAl+LvRgagpOnzRqZv6h0
	 V0cWazd7M9lFOlM7PA3U7IERSBNRu3AaC9Mz+JuSE7tL3XfPwWQ1GSSEVpUJbAiXtuoEL
	 /jYGBP8fhTBoNAiCbn/wg1vuASje5AlXFoW/WeIwLbrBsUVYbiFSDfSBLCWkjALrlNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762447;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+HFIONYMyMDDZopTqPOG1qW817WGxvF++upBMBAVHVk=;
	b=yUd4eJBK9oQBblfde9NriurO11h00euyhfNn4VVluwmm27nU+2YgEO772ZrXn8wpLbYm
	 i3QfA4FV/ay7UGMdeGnv4J03XwFdoeHt4wtVyWjrApb5aXbbaZDVznJF0lz+DCU1CSpE2
	 xFNWYMmyfEXQ3845KeXLc1+ZNc5obC2hR/S0GmS4IazyVfOcU9KF+46HYNwoYB5dO+v5Y
	 4xB/NWTNjexvnYhdbAu2ej2MvuSRoSFTpNaV69a3eM3KqiPJPS3tthIUMvdtpgb+h3cuk
	 lzorKeAzd/1cQC2GDPLd02eBt6LUXhkVIC/5wrk7RXDlbk8dQjVWQV39o39w+sC9fKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=uyVvfU2L;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B61606A31E
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 06:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9B61606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=uyVvfU2L
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 4DA8B4C958;
	Fri, 27 Nov 2026 17:53:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795762438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+HFIONYMyMDDZopTqPOG1qW817WGxvF++upBMBAVHVk=;
	b=uyVvfU2LFFgEShveIp6KudfaF9C0VMwOrGyn1cgY0PmfJeehYB77FRi7zVcgb1sXpa8A6J
	0ZA1Dehmwpg73Q22HmGzdmcnVsiWdpJuUhZP1aytn1yLNyt3d0K4q2n9kVpXUVq/q6wd5x
	GdfIWMLBGlbEXuyI4HDF142MwXRPf7iOviInUl9ARy8NTB60nHHAN8Pzw5Ii7RsF5JvaHC
	RJVzlkvfpSu8YdF3ppDfzyri/WkqY885h6unkLmnPCw41XCIWKfoYQ0F0Ha0xPlING3Din
	adXQ6xbtgWPIwyDJQqZeP37UdKOBNWAMCgW3WHL1OZfcpwvmqNIq4rcg2bDXPw==
X-GPT-Reason: legitimate; the message is a technical patch submission
	for a Linux kernel device tree, which is a standard developer activity;
	the sender (alastair@d-silva.org) perfectly matches the recipient
	mailbox (alastair@d-silva.org) and the content is non-promotional;
	there are no phishing signals, no URLs, and the content is highly
	specific to technical development.
From: Alastair D'Silva <alastair@d-silva.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH v2 2/2] arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro board
Date: Fri, 27 Nov 2026 17:53:43 +1100
Message-ID: <20261127065343.1449675-3-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127065343.1449675-1-alastair@d-silva.org>
References: <20261127065343.1449675-1-alastair@d-silva.org>
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

Add the initial devicetree for the Xunlong OrangePi 4 Pro board.

Enable UART0 console, SD card (MMC0), and the AXP318W PMIC on R-I2C0.
Omit audio, WiFi, USB, and Ethernet for follow-on series.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 arch/arm64/boot/dts/allwinner/Makefile        |  1 +
 .../allwinner/sun60i-a733-orangepi-4-pro.dts  | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index cdeb966031ee..199ce022d94d 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -72,3 +72,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7a.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7z.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-orangepi-4-pro.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
new file mode 100644
index 000000000000..374287d962a8
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (C) 2026 Alastair D'Silva <alastair@d-silva.org>
+ */
+
+/dts-v1/;
+
+#include "sun60i-a733.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	model = "Xunlong OrangePi 4 Pro";
+	compatible = "xunlong,orangepi-4-pro", "allwinner,sun60i-a733";
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
+&hosc {
+	clock-frequency = <26000000>;
+};
+
+&mmc0 {
+	bus-width = <4>;
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
+	disable-wp;
+	no-1-8-v;
+	vmmc-supply = <&reg_dldo1>;
+	status = "okay";
+};
+
+&r_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_i2c0_pl_pins>;
+	clock-frequency = <400000>;
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
+		regulators {
+			reg_dcdc2: dcdc2 {
+				regulator-name = "vdd-cpu";
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-always-on;
+			};
+
+			reg_dldo1: dldo1 {
+				regulator-name = "vcc-sd";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
-- 
2.53.0

