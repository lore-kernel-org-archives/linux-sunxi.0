Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032334657F4
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 15:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779118595; cv=none; b=PVVDzKdVmSu/icyyDxbeBr6YSlKQKz20ACmhzCAaEI4yww4rXdB3wSITHk7qKLNPSvldWbDr4LNTUHuCh0SSz7e6hzW8mUQ9WnnRM19lJgoKT1wOSjp8vkTdHadTOPHOzRdxopN2QfvICHp1AxL19OVPEwiAItOe60LUv41vcFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779118595; c=relaxed/simple;
	bh=wW6mi1lC/tTWTcY5/zt1YMBd7OCQ6zaDwKuLJKtd2Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y1OpABNy9USJhdDQZxk+0taSSKLkBKC4Go8w4cXm5vo4Os+A9a9f5DKRMPiOda/45lYpq5fQiGgltknEn0mSByGzAwDhOQcCq+SA/AVKSlkJcTDdw/Be7wqOjDuvSR/+rsiSNWESFPDgno6tDiqMf0Rh4sOdZGy+ENerFcY9Z1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 85DAA1F8005C
	for <linux-sunxi@lists.linux.dev>; Mon, 18 May 2026 15:36:32 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 1251AB40819; Mon, 18 May 2026 15:36:31 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 0C162B40800;
	Mon, 18 May 2026 15:33:43 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v9 5/9] ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2 support
Date: Mon, 18 May 2026 17:33:34 +0200
Message-ID: <20260518153339.619947-6-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518153339.619947-1-paulk@sys-base.io>
References: <20260518153339.619947-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

MIPI CSI-2 is supported on the V3s with an A31-based MIPI CSI-2 bridge
controller. The controller uses a separate D-PHY, which is the same
that is otherwise used for MIPI DSI, but used in Rx mode.

On the V3s, the CSI0 controller is dedicated to MIPI CSI-2 as it does
not have access to any parallel interface pins.

Add all the necessary nodes (CSI0, MIPI CSI-2 bridge and D-PHY) to
support the MIPI CSI-2 interface.

Note that a fwnode graph link is created between CSI0 and MIPI CSI-2
even when no sensor is connected. This will result in a probe failure
for the controller as long as no sensor is connected but this is fine
since no other interface is available.

The interconnects property is used to inherit the proper DMA offset.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index 02d6c62b3874..bfe02295f45d 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -671,6 +671,77 @@ gic: interrupt-controller@1c81000 {
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		csi0: camera@1cb0000 {
+			compatible = "allwinner,sun8i-v3s-csi";
+			reg = <0x01cb0000 0x1000>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CSI>,
+				 <&ccu CLK_CSI_SCLK>,
+				 <&ccu CLK_DRAM_CSI>;
+			clock-names = "bus", "mod", "ram";
+			resets = <&ccu RST_BUS_CSI>;
+			interconnects = <&mbus 5>;
+			interconnect-names = "dma-mem";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					csi0_in_mipi_csi2: endpoint {
+						remote-endpoint = <&mipi_csi2_out_csi0>;
+					};
+				};
+			};
+		};
+
+		mipi_csi2: csi@1cb1000 {
+			compatible = "allwinner,sun8i-v3s-mipi-csi2",
+				     "allwinner,sun6i-a31-mipi-csi2";
+			reg = <0x01cb1000 0x1000>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CSI>,
+				 <&ccu CLK_CSI_SCLK>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_CSI>;
+			status = "disabled";
+
+			phys = <&dphy>;
+			phy-names = "dphy";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				mipi_csi2_in: port@0 {
+					reg = <0>;
+				};
+
+				mipi_csi2_out: port@1 {
+					reg = <1>;
+
+					mipi_csi2_out_csi0: endpoint {
+						remote-endpoint = <&csi0_in_mipi_csi2>;
+					};
+				};
+			};
+		};
+
+		dphy: d-phy@1cb2000 {
+			compatible = "allwinner,sun6i-a31-mipi-dphy";
+			reg = <0x01cb2000 0x1000>;
+			clocks = <&ccu CLK_BUS_CSI>,
+				 <&ccu CLK_MIPI_CSI>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_CSI>;
+			allwinner,direction = "rx";
+			status = "disabled";
+			#phy-cells = <0>;
+		};
+
 		csi1: camera@1cb4000 {
 			compatible = "allwinner,sun8i-v3s-csi";
 			reg = <0x01cb4000 0x3000>;
-- 
2.54.0

