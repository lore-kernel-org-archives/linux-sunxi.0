Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726922567
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Mar 2023 11:14:26 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 46A04C6B61
	for <linux-sunxi@lists.linux.dev>; Fri, 31 Mar 2023 11:03:06 +0000 (UTC)
Received: (Authenticated sender: me@crly.cz)
	by mail.gandi.net (Postfix) with ESMTPSA id CF9F4C0008;
	Fri, 31 Mar 2023 11:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crly.cz; s=gm1;
	t=1680260578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fgmk/mwe5whG0BvKW+Z4uq6pXrcxqgZ9/TVRoi9sWUA=;
	b=ZY2HadDt2JF8K1PV9nVTSFDSJAjXCqYQsRmHyPNh/OHG7bIQO4PNhjxdtXN9wA0+PL38tW
	WbDh1gA0BXiZWen9rXj6rZbrGNqFMNmSgKJ6eSU5X2OV7eGMQPNSAOanjnIuLLq/bScptt
	PEsgeVvppmCBnBdUKEBCISCKYiduBfoN/CIAxFkRbAQxljb5V3/9rLAazwDnH6WZoS/nYG
	51FmXo1jSLdNPp4WKyrLzhjU7DdOeoY+qWLaedGlvq7WgvFdsCBY1Wm39UpPKnuWHIBYh+
	jhGmYiNq58lGUkrOLUigAPQdpr0h9KcczO8/cpix3TcrYpo/2ofL+Jkhf1U/kA==
From: Roman Beranek <me@crly.cz>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ARM: dts: sunxi: rename tcon's clock output
Date: Fri, 31 Mar 2023 13:02:44 +0200
Message-Id: <20230331110245.43527-3-me@crly.cz>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20230331110245.43527-1-me@crly.cz>
References: <20230331110245.43527-1-me@crly.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While the rate of TCON0's DCLK matches dotclock for parallel and LVDS
outputs, this doesn't hold for DSI. According manuals from Allwinner,
DCLK is an abbrebiation of Data Clock, not dotclock, so go with that
instead.

Signed-off-by: Roman Beranek <me@crly.cz>
---
 arch/arm/boot/dts/sun5i.dtsi                  | 2 +-
 arch/arm/boot/dts/sun8i-a23-a33.dtsi          | 2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi             | 2 +-
 arch/arm/boot/dts/sun8i-v3s.dtsi              | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index 250d6b87ab4d..2f901a013676 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -286,7 +286,7 @@ tcon0: lcd-controller@1c0c000 {
 			clock-names = "ahb",
 				      "tcon-ch0",
 				      "tcon-ch1";
-			clock-output-names = "tcon-pixel-clock";
+			clock-output-names = "tcon-data-clock";
 			#clock-cells = <0>;
 			status = "disabled";
 
diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
index f630ab55bb6a..ddc87cc15e51 100644
--- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
@@ -190,7 +190,7 @@ tcon0: lcd-controller@1c0c000 {
 			clock-names = "ahb",
 				      "tcon-ch0",
 				      "lvds-alt";
-			clock-output-names = "tcon-pixel-clock";
+			clock-output-names = "tcon-data-clock";
 			#clock-cells = <0>;
 			resets = <&ccu RST_BUS_LCD>,
 				 <&ccu RST_BUS_LVDS>;
diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 82fdb04122ca..94eb3bfc989e 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -456,7 +456,7 @@ tcon0: lcd-controller@1c0c000 {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_TCON0>, <&ccu CLK_TCON0>;
 			clock-names = "ahb", "tcon-ch0";
-			clock-output-names = "tcon-pixel-clock";
+			clock-output-names = "tcon-data-clock";
 			#clock-cells = <0>;
 			resets = <&ccu RST_BUS_TCON0>, <&ccu RST_BUS_LVDS>;
 			reset-names = "lcd", "lvds";
diff --git a/arch/arm/boot/dts/sun8i-v3s.dtsi b/arch/arm/boot/dts/sun8i-v3s.dtsi
index db194c606fdc..ab2a0e1235e4 100644
--- a/arch/arm/boot/dts/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/sun8i-v3s.dtsi
@@ -191,7 +191,7 @@ tcon0: lcd-controller@1c0c000 {
 				 <&ccu CLK_TCON0>;
 			clock-names = "ahb",
 				      "tcon-ch0";
-			clock-output-names = "tcon-pixel-clock";
+			clock-output-names = "tcon-data-clock";
 			#clock-cells = <0>;
 			resets = <&ccu RST_BUS_TCON0>;
 			reset-names = "lcd";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 62f45f71ec65..e3b17575699c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -407,7 +407,7 @@ tcon0: lcd-controller@1c0c000 {
 			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_TCON0>, <&ccu CLK_TCON0>;
 			clock-names = "ahb", "tcon-ch0";
-			clock-output-names = "tcon-pixel-clock";
+			clock-output-names = "tcon-data-clock";
 			#clock-cells = <0>;
 			resets = <&ccu RST_BUS_TCON0>, <&ccu RST_BUS_LVDS>;
 			reset-names = "lcd", "lvds";
-- 
2.32.0 (Apple Git-132)

