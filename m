Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B4F188591
	for <linux-sunxi@lists.linux.dev>; Sun, 16 Feb 2025 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739698150; cv=none; b=XPKJlIta8Xp/mpeaCnGMFsqjDyAWiX9GBR/mCvc7NdQHHfeCYdVCR2/GXHwqvg3S6hEoJi3xHSudV26zPTiQRwdomQkYtuVKIUn31a+wNdZzFVzgycG3J4AvSCj/iAKEo9oWAKnQiKWUUqFU1gawQWyD+8Jn3kWPWrEKrIUrUyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739698150; c=relaxed/simple;
	bh=HXF81p9CMb3nFIp+uEoN10boyvs2kTOB2SqJYZl2f8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YRRLEd1ORAXcDV36SW7po9r9AYfUxFhx0cQnnchxwrSjaJDZonAv5UFN/XUd62QD1xQr2EkhPb30cIgi3Knxz2iadRpxIBP0TDrml84Bdjc49vFD/GtNzuV+w/Yo0owBZJBvXjUwg7h23EUwdJsjGvQ5IhwceDwkrdkZkw+kwJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=kBEe2HOD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WFaNL9Vf; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="kBEe2HOD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WFaNL9Vf"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 211FC254011F;
	Sun, 16 Feb 2025 04:29:08 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 16 Feb 2025 04:29:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739698147; x=
	1739784547; bh=wGi+Z2F5P8dLioomOoP3bKLav3gIQOwLl39ppbCD/4w=; b=k
	BEe2HODIOmbxz+FeL1qA6kfUuj8kt32W2US81TfUod7cqlgp/qauAm6WCp0fj1X4
	XNiVhoS72RK08cPAoc0xdIb0H5YUs0PJf3MaVyDO0R4fu7Dx3scmyrlsAcDLUCL9
	gFSAqiYmBJyxX0IQOQS/c27NsIge97voq14jFJxuElVxpKp9ifDvyV71d26pP+e0
	QBZ63+VgZpJnHhOvMzciPi+1NoKxY4gLPryfm54bfL/b4/ZP5D9p0nQd5SruFF7d
	1cXfhydq0UVMqcxnphlekNt1RCV8nbXFwGMrIdrDT5n+cWJJsFqENaHDLgK0a03s
	eKGYERdAO2/CO7rL1tUCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739698147; x=1739784547; bh=w
	Gi+Z2F5P8dLioomOoP3bKLav3gIQOwLl39ppbCD/4w=; b=WFaNL9Vfx/rJ0yFK0
	h8pe2RtJX+XSMtyxzndypKQMtwFwuhVZ8H2geRPLDn5GrbvmN6ha/03RmKruxJA1
	aheGVoviLYvQeAgU6x9xJavcYCxAAGeby7qwy66DoKvh0G8YsJBfJMQxIafK5jp9
	MwIOpBmeTwGbwSXTOKeXkv65vYzD6yBzCNls4y2d90nLLHRSupIN3Pgej1Gig/8m
	/rFNr5CmgXMqjt5BSy1FSw/DZwYJ4JKdk6Wi44BvsOReDtwjbWNs+zWTmwbcjeON
	sEltg9cwUFnEna7rXgTyJvTuV+ZzhYZ7zam7VuylKO8lGg39E0JcIYodYFdgVkQP
	D/a7w==
X-ME-Sender: <xms:46-xZwR1tE4hlsx5v10VX_GrE6uECZM57W-zeoc-0WZwioW1HvZPrQ>
    <xme:46-xZ9yGnUM-tSDhm_OONNw8B2oBfADBFz7ftr8je-rWbmCil9ps29H7TL3mLvGK4
    xYUctVaLwaR1a_y1A>
X-ME-Received: <xmr:46-xZ91rbGNz6c3EoMS0oWGoPAANP_h-VTccr67F8LhaDb8LlGKTQPPxQLFk2Wi9BRj_FO1wrRQJlkUY8EHHHr9U-CWJqaPI3F2NsOUnW0vF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfi
    gvnhhssegtshhivgdrohhrghdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtges
    ghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorh
    hgpdhrtghpthhtoheprghnughrvgdrphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghp
    thhtohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkh
    hikhhutghhrghnleeksehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:46-xZ0DnsRiv5UXRzUIjKrI2bRskAbQBcoxzOcX6wMmOCr72VWKbsw>
    <xmx:46-xZ5i6xkS3pFDvTsm8XHdisfo_lYSfCBa7wqJtkOeljDlVpQZGXQ>
    <xmx:46-xZwqfSCnNJG43S4EBiZq7SSGVZlMM2ZcFejRxooBAbGMu4dr6-Q>
    <xmx:46-xZ8hEpI5K3NrlKjO7svUrAIDzDU3Y2uZBSZellWBbUDyl_eK21g>
    <xmx:46-xZ55O8TN_fjsyEYn5yq2VJwFjfQXFun4TBUo7WMykjLe07YOPw6oM>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 04:29:03 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 5/8] arm64: dts: allwinner: h616: Add TCON nodes to H616 DTSI
Date: Sun, 16 Feb 2025 22:27:12 +1300
Message-ID: <20250216092827.15444-6-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216092827.15444-1-ryan@testtoast.com>
References: <20250216092827.15444-1-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The Allwinner H616 has a display pipeline similar to other Allwinner
devices, specifically the A10, but using a newer display engine
revision (DE33).

Not all output pins are exposed on all package variants, for example
only the H700 and T507 have LCD pins exposed, but all variants support
HDMI output. However on the die these are connected to a display engine
via a TCON TOP and one or more timing controllers (TCONs).

HDMI output support is not provided in this series (but will be in a
subsequent patch) so for now note this within the relevant node to
prevent a DT compiler error.

Add TCON nodes for the TOP, and the LCD and TV timing controllers. The
timing controllers are compatible with the existing R40 driver.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index ab8b70ce7df89..242bac95840f8 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -7,9 +7,12 @@
 #include <dt-bindings/clock/sun50i-h616-ccu.h>
 #include <dt-bindings/clock/sun50i-h6-r-ccu.h>
 #include <dt-bindings/clock/sun6i-rtc.h>
+#include <dt-bindings/clock/sun8i-de2.h>
+#include <dt-bindings/clock/sun8i-tcon-top.h>
 #include <dt-bindings/reset/sun50i-h616-ccu.h>
 #include <dt-bindings/reset/sun50i-h6-r-ccu.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/reset/sun8i-de2.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -909,6 +912,136 @@ ohci3: usb@5311400 {
 			status = "disabled";
 		};
 
+		tcon_top: tcon-top@6510000 {
+			compatible = "allwinner,sun50i-h6-tcon-top";
+			reg = <0x06510000 0x1000>;
+			clocks = <&ccu CLK_BUS_TCON_TOP>,
+				 <&ccu CLK_TCON_TV0>;
+			clock-names = "bus", "tcon-tv0";
+			clock-output-names = "tcon-top-tv0";
+			#clock-cells = <0>;
+			resets = <&ccu RST_BUS_TCON_TOP>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_top_mixer0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_top_mixer0_in_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mixer0_out_tcon_top_mixer0>;
+					};
+				};
+
+				tcon_top_mixer0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon_top_mixer0_out_tcon_lcd0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_lcd0_in_tcon_top_mixer0>;
+					};
+
+					tcon_top_mixer0_out_tcon_tv0: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&tcon_tv0_in_tcon_top_mixer0>;
+					};
+				};
+
+				tcon_top_hdmi_in: port@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+
+					tcon_top_hdmi_in_tcon_tv0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_tv0_out_tcon_top>;
+					};
+				};
+
+				tcon_top_hdmi_out: port@5 {
+					reg = <5>;
+
+					tcon_top_hdmi_out_hdmi: endpoint {
+						/* placeholder for HDMI  - remote-endpoint = <&hdmi_in_tcon_top>;*/
+					};
+				};
+			};
+		};
+		
+		tcon_lcd0: lcd-controller@6511000 {
+			compatible = "allwinner,sun8i-r40-tcon-lcd";
+			reg = <0x06511000 0x1000>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_LCD0>, <&ccu CLK_TCON_LCD0>;
+			clock-names = "ahb", "tcon-ch0";
+			clock-output-names = "tcon-data-clock";
+			#clock-cells = <0>;
+			resets = <&ccu RST_BUS_TCON_LCD0>, <&ccu RST_BUS_TCON_LCD1>;
+			reset-names = "lcd", "lvds";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_lcd0_in: port@0 {
+					reg = <0>;
+
+					tcon_lcd0_in_tcon_top_mixer0: endpoint {
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_lcd0>;
+					};
+				};
+
+				tcon_lcd0_out: port@1 {
+					reg = <1>;
+				};
+			};
+		};
+		
+		tcon_tv0: lcd-controller@6515000 {
+			compatible = "allwinner,sun50i-h6-tcon-tv",
+				     "allwinner,sun8i-r40-tcon-tv";
+			reg = <0x06515000 0x1000>;
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_TV0>,
+				 <&tcon_top CLK_TCON_TOP_TV0>;
+			clock-names = "ahb", "tcon-ch1";
+			#clock-cells = <0>;
+			resets = <&ccu RST_BUS_TCON_TV0>;
+			reset-names = "lcd";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_tv0_in: port@0 {
+					reg = <0>;
+
+					tcon_tv0_in_tcon_top_mixer0: endpoint {
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_tv0>;
+					};
+				};
+
+				tcon_tv0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon_tv0_out_tcon_top: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_hdmi_in_tcon_tv0>;
+					};
+				};
+			};
+		};
+
 		rtc: rtc@7000000 {
 			compatible = "allwinner,sun50i-h616-rtc";
 			reg = <0x07000000 0x400>;
-- 
2.48.1

