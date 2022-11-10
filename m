Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBBB364
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Nov 2022 00:56:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BE901FB;
	Wed,  9 Nov 2022 16:56:40 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85C833F703;
	Wed,  9 Nov 2022 16:56:32 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] ARM: dts: sunxi: H3/H5: Add phys property to USB HCI0
Date: Thu, 10 Nov 2022 00:55:07 +0000
Message-Id: <20221110005507.19464-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As many other Allwinner SoCs from the last years, the first USB host
controller pair in the Allwinner H3 and H5 chips share a USB PHY with
the MUSB OTG controller. This is probably the reason why we didn't have
a "phys" property in those host controller nodes.
This works fine as long as the MUSB controller driver is loaded, as this
takes care of the proper PHY setup, including the muxing between MUSB
and the HCI.

However this requires the MUSB driver to be enabled and loaded, and also
upsets U-Boot, which cannot use a HCI port without a "phys" property.

Similar to what we did in commit cc72570747e4 ("arm64: dts: allwinner:
A64: properly connect USB PHY to port 0"), add the "phys" property to
the OHCI0 and EHCI0 DT nodes in the shared H3/H5 .dtsi file.

This is not only the proper description of the hardware, but also avoids
a nasty error message in U-Boot triggered by a recent patch. (The port
never worked in host mode, but the error was suppressed due to a bug.)

When using the MUSB port in OTG mode, this also fixes host mode
switching, so people can use OTG adapters to connect a USB device to
port 0.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 09aefb4e90f8..686193bd6bd9 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -302,6 +302,8 @@ ehci0: usb@1c1a000 {
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>;
 			resets = <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
+			phys = <&usbphy 0>;
+			phy-names = "usb";
 			status = "disabled";
 		};
 
@@ -312,6 +314,8 @@ ohci0: usb@1c1a400 {
 			clocks = <&ccu CLK_BUS_EHCI0>, <&ccu CLK_BUS_OHCI0>,
 				 <&ccu CLK_USB_OHCI0>;
 			resets = <&ccu RST_BUS_EHCI0>, <&ccu RST_BUS_OHCI0>;
+			phys = <&usbphy 0>;
+			phy-names = "usb";
 			status = "disabled";
 		};
 
-- 
2.35.5

