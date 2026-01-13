Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67BC34F484
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Jan 2026 18:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768329039; cv=none; b=caYhSBnfpTdfl2O7l4FHmD5VAENoRHzQlCC97993dh8wxLUImHZsXvOqr3knYrj/hPVtriLaeBrN9ThOt3HkVFnMR72roOXpu1yvQnKDTTQgGS0zrq5mTk8vrLPSTOTGzleCtZLcxZjhjwLYI9zj0QsybTx3AwmsSXyZEcE4jiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768329039; c=relaxed/simple;
	bh=LZyrisVvaaeBusTcFeG6C4rFjFkJ0jSLOQj7AU0iUyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qj8STcHikGWw6MOqIZSp+25XlIEaYdht5T2FZcL0pa55zgZqB+V7/huVHUlZtoiJujfXuAJJDiZ+EaosNVJ0jxBTehGR3j8FCGgMpeIQ+Jk0KqqWpR5oB0FZ3lBdt5lOoli6EebEMsVx0nXWO7LkZnJXTaZNUadx6Vra3TXqBCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=B51SYI0m; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="B51SYI0m"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding;
	bh=P6I7h+bj3CMTWnDZKlX7MR4NLD2YmzpWA7tYI5nxT+A=;
	b=B51SYI0mLx9lICXLoVzDjZq4lT/LvshEHrhHwH0YivHdD0YzFW5BTTyZVVHpF/sk8X5XoT/VEmTK8A/2SX1bn0EOcoFzT+0Es5hz4+Uq8tzPzo8sbExFnd4UFCzAgzoXyfDC3Qkiom0nKFiyhe1HqkTrQu35wFQHuFvW0wZyKqc=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Tue, 13 Jan 2026 19:30:24 +0100
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
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sunxi@lists.linux.dev,
	Alex Studer <alex@studer.dev>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2] riscv: dts: allwinner: d1: Add CPU thermal sensor and zone
Date: Tue, 13 Jan 2026 19:29:48 +0100
Message-ID: <20260113182951.1059690-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alex Studer <alex@studer.dev>

The sun20i THS (built in CPU thermal sensor) is supported in code, but
was never added to the device tree. So, add it to the device tree,
along with a thermal zone for the CPU.

Signed-off-by: Alex Studer <alex@studer.dev>

Link: https://lore.kernel.org/r/20250218020629.1476126-1-alex@studer.dev
Changes since v1:
 - Move include before defines in sun20i-d1s.dtsi
 - Fix register size for thermal-sensor@2009400
 - Move thermal-sensor@2009400 in SoC to match register address sorting
 - Add thermal-zone for sun8i-t113s.dtsi and fix missing cooling-cells
Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi  | 33 +++++++++++++++++++
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 31 +++++++++++++++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 16 +++++++++
 3 files changed, 80 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
index c7181308ae6f..424f4a2487e2 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
@@ -4,6 +4,7 @@
 #define SOC_PERIPHERAL_IRQ(nr) GIC_SPI nr
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/thermal/thermal.h>
 #include <riscv/allwinner/sunxi-d1s-t113.dtsi>
 #include <riscv/allwinner/sunxi-d1-t113.dtsi>
 
@@ -20,6 +21,7 @@ cpu0: cpu@0 {
 			reg = <0>;
 			clocks = <&ccu CLK_CPUX>;
 			clock-names = "cpu";
+			#cooling-cells = <2>;
 		};
 
 		cpu1: cpu@1 {
@@ -28,6 +30,7 @@ cpu1: cpu@1 {
 			reg = <1>;
 			clocks = <&ccu CLK_CPUX>;
 			clock-names = "cpu";
+			#cooling-cells = <2>;
 		};
 	};
 
@@ -56,4 +59,34 @@ pmu {
 			     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&cpu0>, <&cpu1>;
 	};
+
+	thermal-zones {
+		cpu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&ths>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				cpu_alert: cpu-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index a7442a508433..3f4ee820ef56 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 // Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
 
+#include <dt-bindings/thermal/thermal.h>
+
 #define SOC_PERIPHERAL_IRQ(nr)	(nr + 16)
 
 #include "sunxi-d1s-t113.dtsi"
@@ -115,4 +117,33 @@ pmu {
 			<0x00000000 0x0000000e 0xffffffff 0xffffffff 0x00010000>,
 			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x00020000>;
 	};
+
+	thermal-zones {
+		cpu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&ths>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
+			trips {
+				cpu_alert: cpu-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu-crit {
+					temperature = <100000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 63e252b44973..ef7ebeab21ea 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -214,6 +214,18 @@ gpadc: adc@2009000 {
 			#io-channel-cells = <1>;
 		};
 
+		ths: thermal-sensor@2009400 {
+			compatible = "allwinner,sun20i-d1-ths";
+			reg = <0x2009400 0x400>;
+			interrupts = <SOC_PERIPHERAL_IRQ(58) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_THS>;
+			clock-names = "bus";
+			resets = <&ccu RST_BUS_THS>;
+			nvmem-cells = <&ths_calibration>;
+			nvmem-cell-names = "calibration";
+			#thermal-sensor-cells = <0>;
+		};
+
 		dmic: dmic@2031000 {
 			compatible = "allwinner,sun20i-d1-dmic",
 				     "allwinner,sun50i-h6-dmic";
@@ -474,6 +486,10 @@ sid: efuse@3006000 {
 			reg = <0x3006000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			ths_calibration: thermal-sensor-calibration@14 {
+				reg = <0x14 0x8>;
+			};
 		};
 
 		crypto: crypto@3040000 {
-- 
2.47.3


