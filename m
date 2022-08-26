Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4A5441E
	for <linux-sunxi@lists.linux.dev>; Fri, 26 Aug 2022 18:28:29 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5C629100004;
	Fri, 26 Aug 2022 18:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661538508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pAPHE+J9xJ05r7v5jr0vynhIIDANmU4VwLvBnnKIW90=;
	b=nCoNP1a9cmIqdvObGTA98qQ2004c345ptpqG5k6MKF0Kh3tCtUTrhOlPWfIEPpmI86A4ZA
	sOpglAc4FoeTWK8ic25R6kixynqQkPV1nRcN2C1YRqoYS36tzJWz/YjOg4oLIPtAXEOnkw
	DPbg++koEc1UzTojqx/XVzKvqLB3qhIiY5Zy1pAI5tnfh8QzaBH+gwYNlsUYkABZYJPBRP
	lagSR5XfBxlyWHtunmoan5qlwlY931xhAcq+49GawmxP1PYdIH9aaAkrLCgpyhBkAO7pzQ
	n8h2kzqrx8dOuQchovLnSjdjzuZLNl13dslA2r4BL9xj0fV4RFoA1fajn0kAhg==
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
Subject: [PATCH v5 2/6] ARM: dts: sun8i: v3s: Add mbus node to represent the interconnect
Date: Fri, 26 Aug 2022 20:27:59 +0200
Message-Id: <20220826182803.604563-3-paul.kocialkowski@bootlin.com>
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

The V3s uses the mbus interconnect to provide DRAM access for a
number of blocks. The SoC can only map 2 GiB of DRAM, which is
reflected in the dma-ranges property.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Samuel Holland <samuel@sholland.org>
---
 arch/arm/boot/dts/sun8i-v3s.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index db194c606fdc..34f7df6b3960 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -579,6 +579,21 @@ int_mii_phy: ethernet-phy@1 {
 			};
 		};
 
+		mbus: dram-controller@1c62000 {
+			compatible = "allwinner,sun8i-v3s-mbus";
+			reg = <0x01c62000 0x1000>,
+			      <0x01c63000 0x1000>;
+			reg-names = "mbus", "dram";
+			clocks = <&ccu CLK_MBUS>,
+				 <&ccu CLK_DRAM>,
+				 <&ccu CLK_BUS_DRAM>;
+			clock-names = "mbus", "dram", "bus";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x00000000 0x40000000 0x80000000>;
+			#interconnect-cells = <1>;
+		};
+
 		spi0: spi@1c68000 {
 			compatible = "allwinner,sun8i-h3-spi";
 			reg = <0x01c68000 0x1000>;
-- 
2.37.1

