Received: from mail.manjaro.org (mail.manjaro.org [176.9.38.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870DE71
	for <linux-sunxi@lists.linux.dev>; Thu, 13 May 2021 19:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.manjaro.org (Postfix) with ESMTP id 28E36221113;
	Thu, 13 May 2021 21:09:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
	by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jzYOIA_fJ-7w; Thu, 13 May 2021 21:09:08 +0200 (CEST)
From: Tobias Schramm <t.schramm@manjaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tobias Schramm <t.schramm@manjaro.org>
Subject: [PATCH 3/4] ARM: dts: sun8i: v3s: add analog codec and frontend to v3s dts
Date: Thu, 13 May 2021 21:09:48 +0200
Message-Id: <20210513190949.2069235-4-t.schramm@manjaro.org>
In-Reply-To: <20210513190949.2069235-1-t.schramm@manjaro.org>
References: <20210513190949.2069235-1-t.schramm@manjaro.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner V3s and V3 SoCs feature an integrated analog audio codec.
Additionally both have an analog frontend with mixers and amplifiers for
the codec.
The analog frontend is identical to that on the Allwinner H3 SoC.
This commit adds both, the analog codec and its frontend to the V3s dtsi.

Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
---
 arch/arm/boot/dts/sun8i-v3s.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index 3eaa8703e2ac..7abc51c79f62 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -441,6 +441,25 @@ lradc: lradc@1c22800 {
 			status = "disabled";
 		};
 
+		codec: codec@1c22c00 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,sun8i-v3s-codec";
+			reg = <0x01c22c00 0x400>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CODEC>, <&ccu CLK_AC_DIG>;
+			clock-names = "apb", "codec";
+			resets = <&ccu RST_BUS_CODEC>;
+			dmas = <&dma 15>, <&dma 15>;
+			dma-names = "rx", "tx";
+			allwinner,codec-analog-controls = <&codec_analog>;
+			status = "disabled";
+		};
+
+		codec_analog: codec-analog@1c23000 {
+			compatible = "allwinner,sun8i-h3-codec-analog";
+			reg = <0x01c23000 0x4>;
+		};
+
 		uart0: serial@1c28000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28000 0x400>;
-- 
2.30.1

