Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637381;
	b=2TL8btwgWfzPcU/EuYOs4RkJSLqIsxSI3RkZiq2O3gWfJQMptksMuUKUE0lmana7b9dv
	 HjuLP1IDoaOgR9bgybhPwUJrY/91f0aZ3amzs3MOBrlLqiG/DZNuz+gEEzF/9DoQ2tWxK
	 Pry4U2bqg0uqaqpI+rXd5kV52CMh48kD+YUz7ctmIlPW4WEWKMOe/QYgPnUhvBH+7Ju2Z
	 i8Y9U6z/60DDD8zvcWJoWGkVDHYjthY/ZTqgCNdOqWLHjo6FwMDWaHTLGen4HEVGsIofs
	 eLAnAs59Yg0dk9V2sBOFwnGSBSaS0GuR5Tw47hhE7bqniFPJBL7ombQipxDJcrX7djA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637381;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9anpMZ2Ucx/sgVuz8+mMJ83HICMy2B3fJ91xVGgA93Q=;
	b=KFkINFFnag9Mqh0IMIrE5/0pgnehboB3w+m40JBmSRfGVK2/Y+82hXdo5I8w3DicnJuw
	 DLhxShzrk2z/RJFfFz6D0LFQS487c2lySGDVMecNLIjMEBy2VKcA6+yIx1vsPw1EO3HEo
	 xsscRPfhMi2TnAUdBRVmTxMexnfGGVzynG7hIx+5/ZwgDER+Y4n8TQIQz78gAwTDtHoQx
	 LdofPtGfWpovFB6QbKl/x7vcYE0ht31F6SXoZ2GQat7SwvHZMWp7nkJ/Ch6vbqUAJAfcG
	 9TY93AmEoepFJzeRFhJBl8k8Zes79s1CeW43xpD5qiSA9i0+ownM1UbftO/Zx3JGVlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=c1eTpMFk;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3790606A321
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 20:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3790606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=c1eTpMFk
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id C1EBA404C4;
	Thu, 26 Nov 2026 07:09:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795637373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9anpMZ2Ucx/sgVuz8+mMJ83HICMy2B3fJ91xVGgA93Q=;
	b=c1eTpMFkuJVMAEZx944vIeMY+ciT8f0A8RvjWiMGocTlgKo6X31wSMXStbsgSUhKG23jyT
	Yvr8Aufrz2QcRcYPnL2RWdZLyAk0vqPR+l4Abr+MbdXFHSi4Bq70HHxSvgFNR/ZSPvrIkb
	hQqliWs6mnk7g7etEpHfyKrPOhI//UBnRbA9i5KxAUAfMZKuokfrOOiv7VH6kbqQtPz8NN
	XWSWV9xjUPWsE9Lu2MWcr1SC7idir0gcrA8EjFvFascY1OP2J4Gck+6VXg4wSPHNvFnVPD
	V5V65mJ/yvkQwvLn6Ulh51UqBgdNZS6n4OVNQGzJnWbBS0HNtudhJBLP1Mhoog==
X-GPT-Reason: This is a legitimate technical contribution or personal
	communication. The mailbox (alastair@d-silva.org) directly matches
	the sender's identity (alastair@d-silva.org), the content is a
	specific technical software patch (Linux kernel style) regarding
	"allwinner" hardware, and there are no phishing indicators such
	as urgency, malicious links, or requests for sensitive information.
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
Subject: [PATCH 1/2] arm64: dts: allwinner: sun60i-a733: Add SPI0 node
Date: Thu, 26 Nov 2026 07:09:26 +1100
Message-ID: <20261125200927.515136-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125200927.515136-1-alastair@d-silva.org>
References: <20261125200927.515136-1-alastair@d-silva.org>
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

Assisted-by: LLM
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

