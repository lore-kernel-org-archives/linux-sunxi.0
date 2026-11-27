Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761868;
	b=mX0YtvkuYiB8fv/3xB04S/gJ789CpQ6iBv1jXLdP4QevyX25ioYzv9ifxQMGX5JsKbA0
	 oTH84sEzfciREifoxp6QMflV12JgNpB+Iv2xd5KtrLBzQSGwkZSzi1wUo1XizI68YUUOP
	 2LNMPqv3cxZjAuPxoNfnHSRcREoPwVbQOMbZBKAV9J4I9C+OdYRuOChyPpVKmPymufKlK
	 TdBmrRLcUca219ImMczfDQd2Df+qOMYSr5g7a+LAWO/ppQP0TQ/WoGl8bHem0Pc0FTROa
	 VUO0VT/9d30tjLwlFsQAvx1Z2bDrzFZkvUyM5KamBY97lAcCKt0EtTTD3dY6uOq1ypQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761868;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JbOTfb87rjaSkCEYx9PwUoo4G9JfsbJsW+QEZtvbUOI=;
	b=Blo4ZMWy+bggHlyflQkqvvmhBqqxUNvRgLEIBp0D2S9a4IsLZuYres6J1m2SQ+klH79h
	 sO5pCPPska4J3aPcOyI/83SGMO4TyFu8wMU0AENTiORglo0190wjZf4YEqM1tPYziEC9S
	 BttPuJRSA0dtlFuyhY44Mk5ODaGCyxblXqx+vBfM9bJcTLWQlRPZMqTiEJtm/0LOw5lhT
	 6F1G6kYckPQ7s+UfRmjq/82dWwumaLhzzLfqm/w8BwBhWLEqDKemAYZfBqvLad19f+RXr
	 bVmh0yqNTuDH9DtAuFYpBgt4WI7bPQ40yBkDe4Duvj6D/pbTRYo3nRYXYcNH94cd6fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=bsOBY8gu;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E478606A31E
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 06:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E478606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=bsOBY8gu
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id AAB7A402B4;
	Fri, 27 Nov 2026 17:44:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795761855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JbOTfb87rjaSkCEYx9PwUoo4G9JfsbJsW+QEZtvbUOI=;
	b=bsOBY8guAiWMupofge1nqfQpZ5UHlvIMK4ScAUxYtO/MYF/luOcqArHgxE6B3ylegbi2pT
	EyEiIPxrBxnEpzajIsXVS8tiRBV68wQ405gvF/uAsrrc/oJ/HCIVG6Nuhkv7PL1nq5zS37
	alhxz+jCAWcT1qIgWaAmauUpEe6R8GqhpIgL9e14DKNM5/S/FWsZmaKpGXk0HlGTAvGwju
	qG/H4wc/RfyF3Lg0oOhvPoqDE+hHk7eMZe/ZEC2rn5NwRcsyOnrjc38pfFLqMgQM44psw3
	pplBnFHVoArmWufLNHAJsLNKq8QleFcvwhM6ohNNqeQQZk3uakq+dxp6ZXRjBg==
X-GPT-Reason: legitimate; the email is a technical patch submission
	for a Linux kernel or firmware project, which perfectly aligns
	with the personal/professional context of the recipient alastair@d-silva.org;
	the From domain (d-silva.org) matches the sender's identity and
	the mailbox domain; there are no phishing indicators, urgency, or
	marketing content, and the subject line describes specific technical
	work (arm64: dts: allwinner).
From: Alastair D'Silva <alastair@d-silva.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH v2 1/2] arm64: dts: allwinner: sun60i-a733: Add SPI0 node
Date: Fri, 27 Nov 2026 17:44:07 +1100
Message-ID: <20261127064408.1344250-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127064408.1344250-1-alastair@d-silva.org>
References: <20261127064408.1344250-1-alastair@d-silva.org>
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

Add the SPI0 controller and PC pinmux nodes to sun60i-a733.dtsi.
Omit dmas and spi1..spi4 until the DMA controller is added and other
buses are tested.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
index f4fff495e234..d64b98995173 100644
--- a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
@@ -164,6 +164,20 @@ mmc2_pins: mmc2-pins {
 				drive-strength = <30>;
 				bias-pull-up;
 			};
+
+			/omit-if-no-ref/
+			spi0_pc_pins: spi0-pc-pins {
+				pins = "PC2", "PC4", "PC12";
+				function = "spi0";
+				allwinner,pinmux = <5>;
+			};
+
+			/omit-if-no-ref/
+			spi0_cs0_pc_pin: spi0-cs0-pc-pin {
+				pins = "PC3";
+				function = "spi0";
+				allwinner,pinmux = <5>;
+			};
 		};
 
 		ccu: clock-controller@2002000 {
@@ -194,6 +208,19 @@ uart0: serial@2500000 {
 			status = "disabled";
 		};
 
+		spi0: spi@2540000 {
+			compatible = "allwinner,sun60i-a733-spi",
+				     "allwinner,sun55i-a523-spi";
+			reg = <0x02540000 0x1000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_SPI0>, <&ccu CLK_SPI0>;
+			clock-names = "ahb", "mod";
+			resets = <&ccu RST_BUS_SPI0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@3400000 {
 			compatible = "arm,gic-v3";
 			reg = <0x03400000 0x10000>,
-- 
2.53.0

