Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5C3437111
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 20:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784751456; cv=none; b=khD58bV+0T67b3qQMGRFlPH6xWmCJDfELosqKFG+wq0P/BktUgLSB0XRO/7CdD5cuY0u0uIZO/OI+DhE7+tMke7UyE7c48a/ooFc5GJ97vaQ3POxQgylI19QTbTrqSOBPcuE4ybPh0T7vSghg5Y4uJNXaUudkiF7qpF7Kkm6koM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784751456; c=relaxed/simple;
	bh=Cp9Lf1Yb+LwwMCxqi836F8JB2LfT3ogBlX8ZlkfBiaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p8YK53Shum/oXRQDepqeVO7I+KZQ12TSfdGywAikklGujLH40Cx6qPqJWpBcF4Er9JhKC3B2/0pYyXQLt3LTGqsCEZW1RmmHLits1Sl9uqG3lg7feWLix/7kExb032Rc6j15ya110xZxv2StYr7+43GbnMAwV4NZ3vmfTk95Ib0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=orVoKCtE; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="orVoKCtE"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-664a09bc459so16708614d50.1
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 13:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784751454; x=1785356254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7OAXwu1ImBz6RiI92a0ZzOn6X9oEwvXp6jE08Kyy8I=;
        b=orVoKCtEPxfpLyK9SXPXLAHUh2FOhmJPx+8A8E8c5liKziuolYtm8y41UF+I9JVVk8
         IuvLO8k2RsdH0AOGNM4nWBN0hoHQvFXbDp/JjiqxO/qbRv5qSW/lS6XzW6kPRxgIvmkb
         cCyxFb3OAH87yWZOQcBFe7wk0LeLcnV72s8uv0cEyh93ShjIVEyfjhRKJFd1ykBNg9pY
         ylMudTfXtrAP7R2TJ+2I1O9/S1xTSoy9/cI/cSk5WiSRb4S84QkV9/Dz/BlE7IcAfSVq
         aOi3qDQk2yyQTdm65l0y5Gg6mFFMF1WpYLNPY06WWLCGKixY1YKDFgwSo/8VpP7/eAlD
         e9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751454; x=1785356254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7OAXwu1ImBz6RiI92a0ZzOn6X9oEwvXp6jE08Kyy8I=;
        b=msQe7ywT5nQuAjUpYuOSUq1kjDBduFXH3S9XitUMQ6+sOcEGVClCoiC6JllCQQ2QjP
         UVFFndx/WrAUAfQaotHUS6YtmK/rklONxeic7MU5XtbaHaIdMJo1s0+QojTWGtrJ7dqY
         OFW/PXAuQhIbIg1IJQgD+0T452hn6ll1K7H6hSDG2wLhcb35Y8qJL0401qlOKefoS7Fh
         XEHvjtzBYrWzPmBNpR6oPXHFlf4LmuGGu1r7z8wDJTzHqAPJAxdq8FLCVGUVehT/8WHM
         y5mGwOyr1Ld8nFDziAhn24UR7qo0IVQlp8SkHGPOLw30Rw3M1fhv5k7A7zyCtIP4v/nn
         TdVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0Ao1oubG8ClJNF1ncLVCUEU3+aXt5Ozr75yIE9H2XpRnmm0KpGEPr8Dzw2J79G7n757mnDsMzNs9Bzw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/BdeYTdqpJ3F/yf5OrSHz/pzdeGbTwfXtGXyO4e9TooUZMWuQ
	MGgJEq8Hs7zw93rbLynwXTCCqGR6qSPsFY+n8eO/ISLpzSojizyyIC6K
X-Gm-Gg: AR+sD11JN3LcKDp7/W/hirMCaf1I23oNCRsUxBVs6MfdI6GnGuKAtWpn/FgZFDaPgI7
	QeqY6oZeJCXZt4UGDeEv+0nX0OVxhPzuByTSfAW8Ks3c2pkkITmlLQxJoCTu7d2tSq3/nVVEnIZ
	5IQbi9w2OxWHN2ROsHspn2SrRM2A7KpB8+S1xb8QYffEfWllurBH7RX9ctIWsED4QdaIYY2B44e
	GKxXLrrnPyFBMfmeE/EOKvSlp6BFfOOHWuDA6FRKh3QeEp0mLhsvhdEE1H0O37x2w0zl6KP2gk7
	MtEehQ951RM5bsOELmSq1nbxLqzHk+lzAnF0rIURqMyg5iWsmAJRUF0NelEjwlwuTmf8N16od6/
	hz6e6CH4iXQYRajfKgMher3X7Vlx+XYgRoNoqhljjdiQxfK22GSYQ3p3r0ToJxL6QVZC2fCx4t9
	YQ/+xJST5tVRE47Xwd3+tNuJlDRUNZ6//h8UkWLaHsM/CWmdg=
X-Received: by 2002:a53:cf51:0:b0:667:cf87:5869 with SMTP id 956f58d0204a3-668a4c197f9mr32658d50.29.1784751453933;
        Wed, 22 Jul 2026 13:17:33 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm1958866d50.9.2026.07.22.13.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:17:33 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 2/3] arm64: dts: allwinner: a523: add IR receiver nodes
Date: Wed, 22 Jul 2026 16:17:16 -0400
Message-ID: <20260722201717.2205609-3-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722201717.2205609-1-utilityemal77@gmail.com>
References: <20260722201717.2205609-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 has two CIR receivers, both compatible with the A31 CIR: one
in the CPUX domain, clocked from the main CCU, and one in the RTC
power domain, clocked from the R-CCU.

Add nodes for both instances, disabled by default. Since the RX signal
of each instance can be routed to more than one pin, boards with an IR
receiver are expected to add the pinctrl properties next to where they
enable the node. Keep the PL11 pin description in the dtsi, as boards
commonly use that pin for the RTC domain instance.

Cc: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ca6a16807049..19771aac68e5 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -327,6 +327,17 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		ir: ir@2005000 {
+			compatible = "allwinner,sun55i-a523-ir",
+				     "allwinner,sun6i-a31-ir";
+			reg = <0x02005000 0x400>;
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_IR_RX>, <&ccu CLK_IR_RX>;
+			clock-names = "apb", "ir";
+			resets = <&ccu RST_BUS_IR_RX>;
+			status = "disabled";
+		};
+
 		ledc: led-controller@2008000 {
 			compatible = "allwinner,sun55i-a523-ledc",
 				     "allwinner,sun50i-a100-ledc";
@@ -927,6 +938,23 @@ r_i2c_pins: r-i2c-pins {
 				allwinner,pinmux = <2>;
 				function = "r_i2c0";
 			};
+
+			r_ir_rx_pin: r-ir-rx-pin {
+				pins = "PL11";
+				allwinner,pinmux = <2>;
+				function = "s_cir";
+			};
+		};
+
+		r_ir: ir@7040000 {
+			compatible = "allwinner,sun55i-a523-ir",
+				     "allwinner,sun6i-a31-ir";
+			reg = <0x07040000 0x400>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&r_ccu CLK_BUS_R_IR_RX>, <&r_ccu CLK_R_IR_RX>;
+			clock-names = "apb", "ir";
+			resets = <&r_ccu RST_BUS_R_IR_RX>;
+			status = "disabled";
 		};
 
 		pck600: power-controller@7060000 {
-- 
2.54.0

