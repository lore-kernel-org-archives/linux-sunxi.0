Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F54441B
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Aug 2022 18:28:34 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 59657100008;
	Fri, 26 Aug 2022 18:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661538512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VuPWwHujNKuYn/4OYpuFanoJ3XOxhmOa8Fvjb8ZqIHg=;
	b=VRR7SNxEYegTyvNsp3gp3YwlVU+kYkIirzzh38dAFqQdgDlP1bhNPCnE5zZWtsIVUsBq+c
	tZpsVhJ8KknUUFipF85zNBhvWRY17DtQYPdwqpM9oJRzGJMFsORaEt5pumV817CUx/IO1F
	khDcE3yky9fOfFSB5lgcisMXw4xBT1GQB6TZTRs6eYBBtPYHRkK0nN44vnk15YubzyPe05
	BAyoFBAAcmqbT45Z4dEYllHtZvN5wupbovj8xuIwLPsoxfXc2D51/wQ9Z1C4eKmUngNNAl
	5XpDieJcotWklykC+Omfi03+yC+9v9LaMi0pL+SAkDMjj5Yb+xBn8yfCZ1pdKg==
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
Subject: [PATCH v5 5/6] ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node
Date: Fri, 26 Aug 2022 20:28:02 +0200
Message-Id: <20220826182803.604563-6-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826182803.604563-1-paul.kocialkowski@bootlin.com>
References: <20220826182803.604563-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MIPI CSI-2 is supported on the A83T with a dedicated controller that
covers both the protocol and D-PHY. It can be connected to the CSI
interface as a V4L2 subdev through the fwnode graph.

This is not done by default since connecting the bridge without a
subdev attached to it will cause a failure on the CSI driver.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 82fdb04122ca..ecf9f3b2c0c0 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -1064,6 +1064,32 @@ csi: camera@1cb0000 {
 			status = "disabled";
 		};
 
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
+				};
+			};
+		};
+
 		hdmi: hdmi@1ee0000 {
 			compatible = "allwinner,sun8i-a83t-dw-hdmi";
 			reg = <0x01ee0000 0x10000>;
-- 
2.37.1

