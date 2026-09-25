Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ECA04FECC5
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Sep 2026 22:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790376979; cv=none; b=kiYuxZU8vnDrtz4+ypR8pg0fssIJmiyPiivhx9PC9uRKYzUBKFLw0Ep9AtOFCLqF7GLbGL5SZUc30jSzOXbq7V2yoR3UnvCXRyrZEoHUjbDLl9OFjPEBQiH63xu/hGbnPv5HU1kSo4syaBOCuNBujbdC5g5xeWxiF5RhfTenZPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790376979; c=relaxed/simple;
	bh=sg8jvCBQyHW5vy7uXNNvXeP1MR1xgM2tRjcrl/rYpoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NfVGJZr36syQCGKKIJJCdxX83zkfeTlgzII8QXHJuneSofNnelvGYHHLDiooLuNXaHM4RXCfLgBeaS/boOkb1C4DfVuPhXDJuBQFnhRI3h55EpCUlTyxlLrUgcNGMWjIQ4rISmJv+d3Lw1YwAd8WFKzZhuK1DDFQ8nfnZYJBCqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=C0/z1680; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="C0/z1680"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32E57169C;
	Fri, 25 Sep 2026 15:56:13 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2B6A3F632;
	Fri, 25 Sep 2026 15:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790376976; bh=sg8jvCBQyHW5vy7uXNNvXeP1MR1xgM2tRjcrl/rYpoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C0/z1680uzcUHf+WVyfZ1DXvoFESy73F+hQHAeXDeDoQuFwWBRhL3mTO0OijoLw94
	 r6RDOhkdkQg39alkChkbqiQDxpJh/rsOM3MmCUTJXCrGEChJVJiKrlYzmCLXaIADQY
	 dEhB7h175rw3UbF2pbPM5Tm3ORXQYdeRv0nhihi0=
From: Andre Przywara <andre.przywara@arm.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 4/4] arm64: dts: allwinner: a523: add CPU clocks
Date: Sat, 26 Sep 2026 00:51:12 +0200
Message-ID: <20260925225112.14081-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20260925225112.14081-1-andre.przywara@arm.com>
References: <20260925225112.14081-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A523 family of SoCs feature a separate clock unit for the
CPU PLLs and muxes, including one for the DSU interconnect.

Add a DT node for the CPU clock controller, and list all the clocks from
the other CCUs that this controller needs.
Also list the clock source for each CPU: there is one clock for each
cluster of four cores, suffixed L and B, for little and big (although
all cores are of the same Cortex-A55 type).

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae7..d8aa13af3935e 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/sun55i-a523-ccu.h>
 #include <dt-bindings/clock/sun55i-a523-mcu-ccu.h>
 #include <dt-bindings/clock/sun55i-a523-r-ccu.h>
+#include <dt-bindings/clock/sun55i-a523-cpu-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-mcu-ccu.h>
 #include <dt-bindings/reset/sun55i-a523-r-ccu.h>
@@ -25,6 +26,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			device_type = "cpu";
 			reg = <0x000>;
+			clocks = <&cpu_ccu CLK_CPU_L>;
 			enable-method = "psci";
 		};
 
@@ -32,6 +34,7 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a55";
 			device_type = "cpu";
 			reg = <0x100>;
+			clocks = <&cpu_ccu CLK_CPU_L>;
 			enable-method = "psci";
 		};
 
@@ -39,6 +42,7 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			device_type = "cpu";
 			reg = <0x200>;
+			clocks = <&cpu_ccu CLK_CPU_L>;
 			enable-method = "psci";
 		};
 
@@ -46,6 +50,7 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a55";
 			device_type = "cpu";
 			reg = <0x300>;
+			clocks = <&cpu_ccu CLK_CPU_L>;
 			enable-method = "psci";
 		};
 
@@ -53,6 +58,7 @@ cpu4: cpu@400 {
 			compatible = "arm,cortex-a55";
 			device_type = "cpu";
 			reg = <0x400>;
+			clocks = <&cpu_ccu CLK_CPU_B>;
 			enable-method = "psci";
 		};
 
@@ -60,6 +66,7 @@ cpu5: cpu@500 {
 			compatible = "arm,cortex-a55";
 			device_type = "cpu";
 			reg = <0x500>;
+			clocks = <&cpu_ccu CLK_CPU_B>;
 			enable-method = "psci";
 		};
 
@@ -67,6 +74,7 @@ cpu6: cpu@600 {
 			compatible = "arm,cortex-a55";
 			device_type = "cpu";
 			reg = <0x600>;
+			clocks = <&cpu_ccu CLK_CPU_B>;
 			enable-method = "psci";
 		};
 
@@ -74,6 +82,7 @@ cpu7: cpu@700 {
 			compatible = "arm,cortex-a55";
 			device_type = "cpu";
 			reg = <0x700>;
+			clocks = <&cpu_ccu CLK_CPU_B>;
 			enable-method = "psci";
 		};
 	};
@@ -1144,5 +1153,17 @@ npu: npu@7122000 {
 			resets = <&mcu_ccu RST_BUS_MCU_NPU>;
 			power-domains = <&ppu PD_NPU>;
 		};
+
+		cpu_ccu: clock-controller@8817000 {
+			compatible = "allwinner,sun55i-a523-cpu-ccu";
+			reg = <0x08817000 0x80>;
+			clocks = <&osc24M>, <&rtc CLK_OSC32K>,
+				 <&rtc CLK_IOSC>, <&ccu CLK_PLL_PERIPH0_2X>,
+				 <&ccu CLK_PLL_PERIPH0_600M>;
+			clock-names = "hosc", "losc",
+				      "iosc", "pll-periph0-2x",
+				      "pll-periph0-600m";
+			#clock-cells = <1>;
+		};
 	};
 };
-- 
2.46.4

