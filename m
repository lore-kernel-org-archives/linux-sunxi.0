Received: from mail.manjaro.org (mail.manjaro.org [176.9.38.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315E22FB9
	for <linux-sunxi@lists.linux.dev>; Thu, 13 May 2021 23:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.manjaro.org (Postfix) with ESMTP id C474C220A28;
	Fri, 14 May 2021 01:28:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
	by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Al4WVnEev9wG; Fri, 14 May 2021 01:28:53 +0200 (CEST)
From: Tobias Schramm <t.schramm@manjaro.org>
To: =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tobias Schramm <t.schramm@manjaro.org>
Subject: [PATCH v2 2/7] ARM: dts: sun8i: v3s: add DMA properties to peripherals supporting DMA
Date: Fri, 14 May 2021 01:30:19 +0200
Message-Id: <20210513233024.2076725-3-t.schramm@manjaro.org>
In-Reply-To: <20210513233024.2076725-1-t.schramm@manjaro.org>
References: <20210513233024.2076725-1-t.schramm@manjaro.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds DMA properties to all peripherals supporting DMA on the
Allwinner V3s, enabling accelerated data transfer to them.

Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
---
 arch/arm/boot/dts/sun8i-v3s.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index f0296ab46137..3eaa8703e2ac 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -285,6 +285,8 @@ crypto@1c15000 {
 			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_CE>, <&ccu CLK_CE>;
 			clock-names = "ahb", "mod";
+			dmas = <&dma 16>, <&dma 16>;
+			dma-names = "rx", "tx";
 			resets = <&ccu RST_BUS_CE>;
 			reset-names = "ahb";
 		};
@@ -446,6 +448,8 @@ uart0: serial@1c28000 {
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART0>;
+			dmas = <&dma 6>, <&dma 6>;
+			dma-names = "rx", "tx";
 			resets = <&ccu RST_BUS_UART0>;
 			status = "disabled";
 		};
@@ -457,6 +461,8 @@ uart1: serial@1c28400 {
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART1>;
+			dmas = <&dma 7>, <&dma 7>;
+			dma-names = "rx", "tx";
 			resets = <&ccu RST_BUS_UART1>;
 			status = "disabled";
 		};
@@ -468,6 +474,8 @@ uart2: serial@1c28800 {
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			clocks = <&ccu CLK_BUS_UART2>;
+			dmas = <&dma 8>, <&dma 8>;
+			dma-names = "rx", "tx";
 			resets = <&ccu RST_BUS_UART2>;
 			pinctrl-0 = <&uart2_pins>;
 			pinctrl-names = "default";
@@ -547,6 +555,8 @@ spi0: spi@1c68000 {
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_SPI0>, <&ccu CLK_SPI0>;
 			clock-names = "ahb", "mod";
+			dmas = <&dma 23>, <&dma 23>;
+			dma-names = "rx", "tx";
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi0_pins>;
 			resets = <&ccu RST_BUS_SPI0>;
-- 
2.31.1

