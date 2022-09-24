Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7749B17FA
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Sep 2022 15:43:28 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 9A4FACBC40
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Sep 2022 15:28:43 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 374E31C000A;
	Sat, 24 Sep 2022 15:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664033316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ju5do/c+OU4kfvBHwzg0j4ZuAfxqRDSsXxFditf0h1s=;
	b=BxT1eyMfFb+EgtJZj6haIWbHi73fzBVT5tD9KcsiM4zsTdSR7s324Ul1yehmMmDd1FIjpM
	0yEhRA/vlJELgdv9cKt5RSaV6ejBpGdh8VKSQ/6QDHVwzFTcbk1+NsKMUAgk7WhfBe1ez7
	2+UQ2m4UsblFunPxXINPAI0t/4vqcI+hlBKBxUXEcdaE+Mkf4mlmozeyNRbqiSJTLRc7nR
	JFOjZ7t/+jDkeMGlPVJvib6hbrXJn0iExmI9KskkASfdB7A14bGOXIVElvWk0CcjctuB1N
	f+tHz3ojTkAi19ADdTG6PFswHnDBCrVMc6OWH7IJRobYMpKSxyVZVnNCeSIqzA==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v6 5/7] ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node
Date: Sat, 24 Sep 2022 17:28:18 +0200
Message-Id: <20220924152820.77149-6-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220924152820.77149-1-paul.kocialkowski@bootlin.com>
References: <20220924152820.77149-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MIPI CSI-2 is supported on the A83T with a dedicated controller that
covers both the protocol and D-PHY. It is connected to the only CSI
receiver with a fwnode graph link. Note that the CSI receiver supports
both this MIPI CSI-2 source and a parallel source.

An empty port with a label for the MIPI CSI-2 sensor input is also
defined for convenience.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 43 +++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 82fdb04122ca..bbe01877a938 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -1062,6 +1062,49 @@ csi: camera@1cb0000 {
 			clock-names = "bus", "mod", "ram";
 			resets = <&ccu RST_BUS_CSI>;
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+
+					csi_in_mipi_csi2: endpoint {
+						remote-endpoint = <&mipi_csi2_out_csi>;
+					};
+				};
+			};
+		};
+
+		mipi_csi2: csi@1cb1000 {
+			compatible = "allwinner,sun8i-a83t-mipi-csi2";
+			reg = <0x01cb1000 0x1000>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CSI>,
+				 <&ccu CLK_CSI_SCLK>,
+				 <&ccu CLK_MIPI_CSI>,
+				 <&ccu CLK_CSI_MISC>;
+			clock-names = "bus", "mod", "mipi", "misc";
+			resets = <&ccu RST_BUS_CSI>;
+			status = "disabled";
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
+					mipi_csi2_out_csi: endpoint {
+						remote-endpoint = <&csi_in_mipi_csi2>;
+					};
+				};
+			};
 		};
 
 		hdmi: hdmi@1ee0000 {
-- 
2.37.3

