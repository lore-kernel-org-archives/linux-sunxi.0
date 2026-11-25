Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610677;
	b=mpt4r9NSI5SHVbWF2ZZ19tFh0BT5upiwsx8q0YRCRFM6hSBAtmVRyDmPmaITD9VZ6bG+
	 l03PWLpJ8g07TW96QPgQZIf/1oodBJFGxKSlXY/TqCtdL0gdkaScQuf8N8ceNI3OrXo2e
	 DFEFKeVBrATyNyp1Y1k3L9is7UOvTxMnMLkljwPSh3iO0BTGksqG7iKGEQ8+avJWx89aa
	 mQIO/u6jqEEnSwiRudte53qm2jz6ZA4GouabufK9rCFBwQEdKkX2gDVQ41mmaH8y0GQjy
	 3cXOW6HGg4AyBVytsL+LblZbHLXfYnQLc87NVcYBoG6SE0EKVF2H9AdrBNPhXhIbLQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610677;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gBqX6yAsAhkiQmaGSMtP1wrzGS5nrxUEsmCkAPx5BqQ=;
	b=mMlyefVhUMzBzzSlEIn6LiszLyEj9byNNdxtaVyZQroVOSKe+Z+l3s/CIVEj2DPjN80V
	 3pjbMnekqbj/VwCqiAMD69gQNKZl/yYvkG9/cRnUkM3UjnK9u1oNhLy9B+KGwdnkWnrYY
	 rf7yK89HarxQfEpavAqtd+QimJNoWCqM62ItplFVxhfOxwpfN5QBkSYdHjA7i+z/zMu7e
	 Chm3PEaEU0l6hstG8Bboe6Pk1Ghl5pV3sHkjg/kfRlrdNYq9Zdzd/29d3KZvnt1q+zPyV
	 GLHjlWTcd33SvqSWyyBrhQV4Sqzp4wNFpZJTO/bPyhjltYMWW5YJNJxMq5+8cjHq61Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b="gce3z7o/";
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AC7606A326
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 12:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85AC7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=gce3z7o/
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id EB2CE4C951;
	Wed, 25 Nov 2026 23:44:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795610669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gBqX6yAsAhkiQmaGSMtP1wrzGS5nrxUEsmCkAPx5BqQ=;
	b=gce3z7o/vzOrqWUarJO2N9XYR2CfugtaYk28Foo1LHEWpKFUPKcUmYVQHjxnVpukeGMHtj
	gPrSkEcgN39OZxEuIN3EokaMWDR4lRXucBqG1sdFlck2/hAJaxssdfA6y9o83kEC9HWuai
	2VxlKoHSu2OvAXaVeHjnCg57Rm5gO5Hp6kLx3yuJ4nABID9Jx1wchxsUIs2d4WgkgH3RTa
	83rtHJAI21yG0fjTSkvptD6CIE4vTTvq7XY4jmMjbKOQxBwbLnajSg1INjPCmqDPKXC8wc
	r6XSYbb4rvIseHvQ85BB3uKeclE7Ykgg24AoY9/cLuSYZhPm+MjeguPB73uM/Q==
X-GPT-Reason: This is a legitimate technical communication related
	to software development and kernel patches. The message is classified
	as personal/professional correspondence because the sender
	(alastair@d-silva.org) matches the intended recipient (alastair@d-silva.org),
	the subject line follows standard Linux kernel mailing list formatting
	for a device tree patch, and there are no phishing indicators, malicious
	links, or unsolicited marketing elements present.
From: Alastair D'Silva <alastair@d-silva.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 3/3] arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro board
Date: Wed, 25 Nov 2026 23:44:07 +1100
Message-ID: <20261125124407.4098345-4-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125124407.4098345-1-alastair@d-silva.org>
References: <20261125124407.4098345-1-alastair@d-silva.org>
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

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 arch/arm64/boot/dts/allwinner/Makefile        |  1 +
 .../allwinner/sun60i-a733-orangepi-4-pro.dts  | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 38a2c539e794..db6ffa5f8b4f 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -68,3 +68,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-cubie-a7s.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun60i-a733-orangepi-4-pro.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts b/arch/arm64/boot/dts/allwinner/sun60i-a733-orangepi-4-pro.dts
new file mode 100644
index 000000000000..b681e4458153
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
+	clock-frequency = <24000000>;
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

