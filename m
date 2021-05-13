Received: from mail.manjaro.org (mail.manjaro.org [176.9.38.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D36529CA
	for <linux-sunxi@lists.linux.dev>; Thu, 13 May 2021 20:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.manjaro.org (Postfix) with ESMTP id 304C322111A;
	Thu, 13 May 2021 22:34:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
	by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8j8NsS7U-BOf; Thu, 13 May 2021 22:33:57 +0200 (CEST)
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
Subject: [PATCH v2 2/2] ARM: dts: sun8i: v3s: add pwm controller to v3s dts
Date: Thu, 13 May 2021 22:35:27 +0200
Message-Id: <20210513203527.2072090-3-t.schramm@manjaro.org>
In-Reply-To: <20210513203527.2072090-1-t.schramm@manjaro.org>
References: <20210513203527.2072090-1-t.schramm@manjaro.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner V3s and V3 SoCs feature a pwm controller identical to the
one used in the Allwinner A20.
This commit adds it to the V3s dtsi.

Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
---
 arch/arm/boot/dts/sun8i-v3s.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index eb4cb63fef13..456dee9de87f 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -422,6 +422,15 @@ wdt0: watchdog@1c20ca0 {
 			clocks = <&osc24M>;
 		};
 
+		pwm: pwm@1c21400 {
+			compatible = "allwinner,sun8i-v3s-pwm",
+				     "allwinner,sun7i-a20-pwm";
+			reg = <0x01c21400 0xc>;
+			clocks = <&osc24M>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		lradc: lradc@1c22800 {
 			compatible = "allwinner,sun4i-a10-lradc-keys";
 			reg = <0x01c22800 0x400>;
-- 
2.31.1

