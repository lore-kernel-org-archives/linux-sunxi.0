Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612009;
	b=dxdb0Jeydb1Mulj4MNUQst4AdZOtn5mMoB3pR0MXVC1MlPqyO/Zsf6oBqDslNT75ubSX
	 yIDeWGwTWJGgsBDgxJepgzAe+XLknjITXJXd4TnAn09iDVAb4QhSW60G0SICfowQ5lgTn
	 f99uoOSbLVfMNvzMqaInFhq19PPQQtG4cSS+zA/R8QY1+29vBBIbwl0td5OaCNGIgayU/
	 MjPgLzy0RP0RIp+QsjMH4gPzOQT0vWK+KqUd0GMUopK7gZfwNjYoUk/3vALiw1ugr34oF
	 f9OKYjNe85Z3H2uRA8+HaDs6X3ZEWdH+EVOL5NGtz8KlVE4SP8oh17X0eH31FHngqnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612009;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NKX7/fKmU8dpjj9k8IEI15jTSM9bbjiryIUUaXSWULI=;
	b=Pe4jPo4ffiDLRjgjY7x5M8pN+MvOggOGt/fa56YT8wILJcvOmU1ugc3kLeOogZ+ndah2
	 SBMPoz6aIx/SlnTuIpb2r5mHivamW2ZAl4kUQmHnZnmK1QmHZC/pLqtK62lFn4CQri5vN
	 X34rkh/+KGl8tLClAZTZ62dgazutUSqfdHABdSIYpguNU+fHaF6o7Dwnm4/BizE/T3Xkl
	 bgMWjk8rjatvx2hobWcKs0kS0lG6hNJyBqZSdL9yugL/poGgc/eHfbbCIdmAq/wZpFZEY
	 /inLR9VVTFwh836RENsZd+FIEfny/ghCNe1rR2qq8PjTSm0neuu3RLgv+qPg2K6mZ/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=atAPngo6;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8782D606A31E
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 13:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8782D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=atAPngo6
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 417AF4C955;
	Thu, 26 Nov 2026 00:06:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795612000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NKX7/fKmU8dpjj9k8IEI15jTSM9bbjiryIUUaXSWULI=;
	b=atAPngo6pRanrgAWa28bs8FQZ1Yln5P5IaYNs5dd2KnFfLcKKiJRR3TxKZmTJzjh4Cdpxp
	vLdesLjtPmAjx7aPMycBdZ6VmmQ9DlJwk3ObhmB8pE6S/OmBe7i929J5EjpgcVOYb+sHHJ
	Hz6NnMGTLW/aagMJxbKpkHim5x5fBU+22L6lVs3rs3Dj/qkvRIUDyRrwzTC2NkKnVN+G5s
	NX7bw6OOgV858dphoMDUPAqjEP54uPj4o5ObQG7fCe9vP86vNQ9cktPY+JVSMcSnxcw3G8
	AmCXZsLqARvnHVBqFLNM6KApSOUeZG2HFbhH5lJ057cYKYeFIjMKTxYF8UIDNg==
X-GPT-Reason: legitimate; This is a technical, development-related
	email regarding a kernel patch for a hardware SoC (Allwinner A733).
	The mailbox (alastair@d-silva.org) aligns perfectly with the sender
	(alastair@d-silva.org), and the content consists of specific engineering
	instructions (DTS node additions and pinmux configurations) with
	no marketing, urgency, or phishing indicators. No URLs were found,
	and the message follows a standard open-source contribution format.
From: Alastair D'Silva <alastair@d-silva.org>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 4/5] arm64: dts: allwinner: sun60i-a733: Add GMAC0 node
Date: Thu, 26 Nov 2026 00:06:12 +1100
Message-ID: <20261125130613.4191841-5-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125130613.4191841-1-alastair@d-silva.org>
References: <20261125130613.4191841-1-alastair@d-silva.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Boards using the Allwinner A733 SoC need the SoC-level GMAC0 controller,
MDIO bus, and PH0-PH15 RGMII pinmux nodes to enable wired Ethernet.
Disable internal bias pulls and use drive-strength = <20> on
gmac0_rgmii_pins to avoid distorting 125 MHz RGMII signaling.

Add gmac0, mdio0, and gmac0_rgmii_pins (disabled by default) to
sun60i-a733.dtsi.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
index f4fff495e234..d9f90d8de0de 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
@@ -164,6 +164,18 @@ mmc2_pins: mmc2-pins {
 				drive-strength = <30>;
 				bias-pull-up;
 			};
+
+			/omit-if-no-ref/
+			gmac0_rgmii_pins: gmac0-rgmii-pins {
+				pins = "PH0", "PH1", "PH2", "PH3",
+				       "PH4", "PH5", "PH6", "PH7",
+				       "PH8", "PH9", "PH10", "PH11",
+				       "PH12", "PH13", "PH14", "PH15";
+				function = "gmac0";
+				allwinner,pinmux = <5>;
+				drive-strength = <20>;
+				bias-disable;
+			};
 		};
 
 		ccu: clock-controller@2002000 {
@@ -241,6 +253,35 @@ mmc2: mmc@4022000 {
 			status = "disabled";
 		};
 
+		gmac0: ethernet@4500000 {
+			compatible = "allwinner,sun60i-a733-gmac210",
+				     "snps,dwmac-5.20";
+			reg = <0x04500000 0x8000>,
+			      <0x04508000 0x100>;
+			interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_lpi",
+					  "tx-queue-0", "rx-queue-0";
+			clocks = <&ccu CLK_BUS_GMAC0>,
+				 <&ccu CLK_MBUS_GMAC0>,
+				 <&ccu CLK_GMAC_PTP>;
+			clock-names = "stmmaceth", "mbus", "ptp_ref";
+			resets = <&ccu RST_BUS_GMAC0_AXI>,
+				 <&ccu RST_BUS_GMAC0>;
+			reset-names = "stmmaceth", "ahb";
+			pinctrl-names = "default";
+			pinctrl-0 = <&gmac0_rgmii_pins>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		r_ccu: clock-controller@7010000 {
 			compatible = "allwinner,sun60i-a733-r-ccu";
 			reg = <0x07010000 0x1000>;
-- 
2.53.0

