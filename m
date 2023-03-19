Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD4C2FB2
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Mar 2023 21:29:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A2DE1063;
	Sun, 19 Mar 2023 14:30:34 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 787B63F67D;
	Sun, 19 Mar 2023 14:29:48 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v6 1/6] ARM: dts: suniv: add USB-related device nodes
Date: Sun, 19 Mar 2023 21:29:31 +0000
Message-Id: <20230319212936.26649-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.7
In-Reply-To: <20230319212936.26649-1-andre.przywara@arm.com>
References: <20230319212936.26649-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Icenowy Zheng <uwu@icenowy.me>

The suniv SoC has a USB OTG controller and a USB PHY like other
Allwinner SoCs.

Add their device tree node.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/boot/dts/suniv-f1c100s.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/suniv-f1c100s.dtsi b/arch/arm/boot/dts/suniv-f1c100s.dtsi
index 9455d27e516ee..111f8bbc2a805 100644
--- a/arch/arm/boot/dts/suniv-f1c100s.dtsi
+++ b/arch/arm/boot/dts/suniv-f1c100s.dtsi
@@ -133,6 +133,32 @@ mmc1: mmc@1c10000 {
 			#size-cells = <0>;
 		};
 
+		usb_otg: usb@1c13000 {
+			compatible = "allwinner,suniv-f1c100s-musb";
+			reg = <0x01c13000 0x0400>;
+			clocks = <&ccu CLK_BUS_OTG>;
+			resets = <&ccu RST_BUS_OTG>;
+			interrupts = <26>;
+			interrupt-names = "mc";
+			phys = <&usbphy 0>;
+			phy-names = "usb";
+			extcon = <&usbphy 0>;
+			allwinner,sram = <&otg_sram 1>;
+			status = "disabled";
+		};
+
+		usbphy: phy@1c13400 {
+			compatible = "allwinner,suniv-f1c100s-usb-phy";
+			reg = <0x01c13400 0x10>;
+			reg-names = "phy_ctrl";
+			clocks = <&ccu CLK_USB_PHY0>;
+			clock-names = "usb0_phy";
+			resets = <&ccu RST_USB_PHY0>;
+			reset-names = "usb0_reset";
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
 		ccu: clock@1c20000 {
 			compatible = "allwinner,suniv-f1c100s-ccu";
 			reg = <0x01c20000 0x400>;
-- 
2.35.7

