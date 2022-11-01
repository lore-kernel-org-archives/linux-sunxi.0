Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1914020F7
	for <linux-sunxi@lists.linux.dev>; Tue,  1 Nov 2022 14:17:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00E9F12FC;
	Tue,  1 Nov 2022 07:17:20 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CDF53F703;
	Tue,  1 Nov 2022 07:17:12 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 4/9] ARM: dts: suniv: f1c100s: add I2C DT nodes
Date: Tue,  1 Nov 2022 14:16:53 +0000
Message-Id: <20221101141658.3631342-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221101141658.3631342-1-andre.przywara@arm.com>
References: <20221101141658.3631342-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner F1C100s series of SoCs contain three I2C controllers
compatible to the ones used in other Allwinner SoCs.

Add the DT nodes describing the resources of the controllers.
I2C1 has only one possible pinmux, so add the pinctrl properties for
that already.
At least one board connects an on-board I2C chip to PD0/PD12 (I2C0), so
include those pins already, to simplify referencing them later.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/boot/dts/suniv-f1c100s.dtsi | 50 ++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
index d5a6324e76465..2901c586971b4 100644
--- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
+++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
@@ -166,6 +166,18 @@ mmc0_pins: mmc0-pins {
 				drive-strength = <30>;
 			};
 
+			/omit-if-no-ref/
+			i2c0_pd_pins: i2c0-pd-pins {
+				pins = "PD0", "PD12";
+				function = "i2c0";
+			};
+
+			/omit-if-no-ref/
+			i2c1_pins: i2c1-pins {
+				pins = "PD5", "PD6";
+				function = "i2c1";
+			};
+
 			spi0_pc_pins: spi0-pc-pins {
 				pins = "PC0", "PC1", "PC2", "PC3";
 				function = "spi0";
@@ -177,6 +189,44 @@ uart0_pe_pins: uart0-pe-pins {
 			};
 		};
 
+		i2c0: i2c@1c27000 {
+			compatible = "allwinner,suniv-f1c100s-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x01c27000 0x400>;
+			interrupts = <7>;
+			clocks = <&ccu CLK_BUS_I2C0>;
+			resets = <&ccu RST_BUS_I2C0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@1c27400 {
+			compatible = "allwinner,suniv-f1c100s-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x01c27400 0x400>;
+			interrupts = <8>;
+			clocks = <&ccu CLK_BUS_I2C1>;
+			resets = <&ccu RST_BUS_I2C1>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&i2c1_pins>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@1c27800 {
+			compatible = "allwinner,suniv-f1c100s-i2c",
+				     "allwinner,sun6i-a31-i2c";
+			reg = <0x01c27800 0x400>;
+			interrupts = <9>;
+			clocks = <&ccu CLK_BUS_I2C2>;
+			resets = <&ccu RST_BUS_I2C2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		timer@1c20c00 {
 			compatible = "allwinner,suniv-f1c100s-timer";
 			reg = <0x01c20c00 0x90>;
-- 
2.25.1

