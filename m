Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2761E33DEC8
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781364476; cv=none; b=seD3jI90rQqaeBpG2CrpBt3Yi7eL4FHA+ZhLEUNU0ndv8GcrqxwTjWLAQksE6RXM0+0WtqSSqCrAjTNk2G6GzmTqd6/bx14pRg/3yyd8kR7OKH+gWqDXwkIUgosj8JRuJabxiEAKCH/6JphkaY4fGFU370zNymMri5VMHYJ7NTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781364476; c=relaxed/simple;
	bh=zfr84u0MZSa2RLf2Ehf1cE/V1OTPYcZ45F3vYPvHTUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W8CEcameM734HRrrkOYQL7rPqWD9x3xMeN6/Lsakcd7jtGgIdYjNM1lijsVB2Qe5utgeboECW3AmAcPhebNcxPDvmDtJo3AEURhbDttJ9kuKqdAIuPi8+2dzGWdDmQ8WyGbzIPZ9rQjbbUVv9uStcwrlnCTDplpwERSmBGXPhrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 3F58F370030C
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jun 2026 15:27:34 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id B1552B45526; Sat, 13 Jun 2026 15:27:33 +0000 (UTC)
X-Spam-Level: **
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id E0CFEB45527;
	Sat, 13 Jun 2026 15:27:03 +0000 (UTC)
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
Subject: [PATCH v10 6/6] ARM: dts: sun8i: v3s: Add support for the ISP
Date: Sat, 13 Jun 2026 17:26:55 +0200
Message-ID: <20260613152655.212490-7-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260613152655.212490-1-paulk@sys-base.io>
References: <20260613152655.212490-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

The V3s (and related platforms) come with an instance of the A31 ISP.
Even though it is very close to the A31 ISP, it is not exactly
register-compatible and a dedicated compatible only is used as a
result.

Just like most other blocks of the camera pipeline, the ISP uses
the common CSI bus, module and ram clock as well as reset.

A port connection to the ISP is added to CSI0 for convenience since
CSI0 serves for MIPI CSI-2 interface support, which is likely to
receive raw data that will need to be processed by the ISP to produce
a final image.

The interconnects property is used to inherit the proper DMA offset.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index 03a1739683b1..628d5504c3ae 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -695,6 +695,14 @@ csi0_in_mipi_csi2: endpoint {
 						remote-endpoint = <&mipi_csi2_out_csi0>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					csi0_out_isp: endpoint {
+						remote-endpoint = <&isp_in_csi0>;
+					};
+				};
 			};
 		};
 
@@ -755,5 +763,32 @@ csi1: camera@1cb4000 {
 			resets = <&ccu RST_BUS_CSI>;
 			status = "disabled";
 		};
+
+		isp: isp@1cb8000 {
+			compatible = "allwinner,sun8i-v3s-isp";
+			reg = <0x01cb8000 0x1000>;
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
+				port@0 {
+					reg = <0>;
+
+					isp_in_csi0: endpoint {
+						remote-endpoint = <&csi0_out_isp>;
+					};
+				};
+			};
+		};
 	};
 };
-- 
2.54.0

