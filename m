Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71BE17F5
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Sep 2022 15:43:24 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 8882CCBB6A
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Sep 2022 15:28:39 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 531151C0007;
	Sat, 24 Sep 2022 15:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664033312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8H7TxPSMHgc/OchAiVB655J+THkaG5W4vW2uZPkmijo=;
	b=p4PUmw2nCJs3KyRDm+QvOOkySCL+RoRN1/469EjW+XykguRnftdlTMzmiBAmFZZ8S6Is6c
	jQ3kn+yonelwEEHaqjlA2r2GSJ2OSD8EZHjWLgPg1Nwsrh6JHlFet5xQroW+qNiAOWiI5e
	oaIqxXvulaaYoY8UDLbQeOEEh0YDei31AOtEis0AlztKian5E5ZLAgmzfSa5DJs+hOnjA1
	PxxI07KFC3HY62J8uk1lDjTdsIfi7/qkuKpxfTZuv62sjFkyfYAcsHECwa7p/KThNIWml4
	JX64GZ3SJIRh0V4GMKdiqRSi1P7YsiZrXTSR23pUxQcobJWj25LihmxIfg1Hmg==
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
Subject: [PATCH v6 2/7] ARM: dts: sun8i: v3s: Add mbus node to represent the interconnect
Date: Sat, 24 Sep 2022 17:28:15 +0200
Message-Id: <20220924152820.77149-3-paul.kocialkowski@bootlin.com>
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
2.37.3

