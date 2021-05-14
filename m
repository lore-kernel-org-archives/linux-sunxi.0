Received: from mail.manjaro.org (mail.manjaro.org [176.9.38.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3EC2FB3
	for <linux-sunxi@lists.linux.dev>; Fri, 14 May 2021 13:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.manjaro.org (Postfix) with ESMTP id 912242225B7;
	Fri, 14 May 2021 15:42:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
	by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6amSyvd3IY3w; Fri, 14 May 2021 15:42:40 +0200 (CEST)
From: Tobias Schramm <t.schramm@manjaro.org>
To: =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tobias Schramm <t.schramm@manjaro.org>
Subject: [PATCH v3 7/7] ARM: dts: sun8i: V3: add I2S interface to V3 dts
Date: Fri, 14 May 2021 15:44:05 +0200
Message-Id: <20210514134405.2097464-8-t.schramm@manjaro.org>
In-Reply-To: <20210514134405.2097464-1-t.schramm@manjaro.org>
References: <20210514134405.2097464-1-t.schramm@manjaro.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner V3 SoC features an I2S interface. The I2S peripheral is
identical to that in the Allwinner H3 SoC.
This commit adds it to the Allwinner V3 dts.

Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
---
 arch/arm/boot/dts/sun8i-v3.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3.dtsi b/arch/arm/boot/dts/sun8i-v3.dtsi
index 8af790d286b9..3698e024d604 100644
--- a/arch/arm/boot/dts/sun8i-v3.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3.dtsi
@@ -1,10 +1,31 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
  * Copyright (C) 2019 Icenowy Zheng <icenowy@aosc.io>
+ * Copyright (C) 2021 Tobias Schramm <t.schramm@manjaro.org>
  */
 
 #include "sun8i-v3s.dtsi"
 
+/ {
+	soc {
+			i2s0: i2s@1c22000 {
+				#sound-dai-cells = <0>;
+				compatible = "allwinner,sun8i-v3-i2s",
+					     "allwinner,sun8i-h3-i2s";
+				reg = <0x01c22000 0x400>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&ccu CLK_BUS_I2S0>, <&ccu CLK_I2S0>;
+				clock-names = "apb", "mod";
+				dmas = <&dma 3>, <&dma 3>;
+				dma-names = "rx", "tx";
+				pinctrl-names = "default";
+				pinctrl-0 = <&i2s0_pins>;
+				resets = <&ccu RST_BUS_I2S0>;
+				status = "disabled";
+			};
+	};
+};
+
 &ccu {
 	compatible = "allwinner,sun8i-v3-ccu";
 };
@@ -30,6 +51,11 @@ external_mdio: mdio@2 {
 &pio {
 	compatible = "allwinner,sun8i-v3-pinctrl";
 
+	i2s0_pins: i2s0-pins {
+		pins = "PG10", "PG11", "PG12", "PG13";
+		function = "i2s";
+	};
+
 	uart1_pg_pins: uart1-pg-pins {
 		pins = "PG6", "PG7";
 		function = "uart1";
-- 
2.31.1

