Received: from thales.epochal.quest (thales.epochal.quest [51.222.15.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CED61F63EF
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Dec 2024 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.222.15.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734527408; cv=none; b=nK8dqBEidtgpYVpO2Ufdtr1u2ZvEpALFtMXpIvnKgXxCkbneFJl5dNT+wAk1Vd5/Iv6EcKXLqmjUzLwxLPS5013fvcHJrAHOVPH57sB+lDoi2u/SI80KMlSpe7fjk9JZGJsyyRbOwoaSUG44G8nPIwPeSWUqCPE7OIbV/OKnqTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734527408; c=relaxed/simple;
	bh=UtiFUB7JYOEIMLI78fhF4G8WqBGTAB6l9kQoj2W7g7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iu5nolgNCEFe09k1iJvSBZCNenuM1NwfINWTG5ADsvk0e8IQ6xqP13uZ/k3EBHFVxvSLiSL+qqMJiJsE2jrnoXh4ZxR9EY8+CE3QGzAcP5xo1Xdrd6JuCLPcjAxfclpiA3Ra2jN1zZNg48u4kyMecZM7TBoTvDxZnRUhuADUy98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epochal.quest; spf=pass smtp.mailfrom=epochal.quest; dkim=pass (2048-bit key) header.d=epochal.quest header.i=@epochal.quest header.b=jXmM0P56; arc=none smtp.client-ip=51.222.15.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=epochal.quest
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=epochal.quest
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=epochal.quest header.i=@epochal.quest header.b="jXmM0P56"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1734526898;
	bh=UtiFUB7JYOEIMLI78fhF4G8WqBGTAB6l9kQoj2W7g7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jXmM0P56xEPCszSNWAG2srnBbfoN63A04qcy47Fnb+SYM/xM1N3rXfL8eSptj4Itz
	 Ruff8oOAfZ/fiDHmUXwEwaydSR6HYm29SJe86oCxB/oumb10a/SB5anIhIMSGaVVOl
	 NUodk1QWl26XZnlsdBjwQUhwEdbQ9cvTaHl2x3eypRcerwqKHb1PsHNdTbLMvu+ptP
	 qhSAduiC7yhdc59AQsiSUM4Y6T7WcLEdzVbHRQ+7VopDqy48XCVuPQToowosTT1aV5
	 ttas0gRSzxcYAJ6FzsoqM7MRKWYyLMVzbhDMB/xtxMEHZKsekhK6Q6/pLz7MyM5VJE
	 Tafulc5+iwhig==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
Date: Wed, 18 Dec 2024 09:01:19 -0400
Subject: [PATCH v2 2/2] arm64: dts: allwinner: a100: Add syscon nodes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-a100-syscon-v2-2-dae60b9ce192@epochal.quest>
References: <20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest>
In-Reply-To: <20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Cody Eksal <masterr3c0rd@epochal.quest>
X-Mailer: b4 0.14.2

The Allwinner A100 has a system configuration block, denoted as SYS_CFG
in the user manual's memory map. It is undocumented in the manual, but
a glance at the vendor tree shows this block is similar to its
predecessors in the A64 and H6. The A100 also has 3 SRAM blocks: A1, A2,
and C. Add all of these to the SoC's device tree.

Reviewed-by: Parthiban Nallathambi <parthiban@linumiz.com>
Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index 29ac7716c7a5284ccf8af675db9c7d016785f0ff..a24adba201af29a3a117222c67da5d269629fa47 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -101,6 +101,39 @@ soc {
 		#size-cells = <1>;
 		ranges = <0 0 0 0x3fffffff>;
 
+		syscon: syscon@3000000 {
+			compatible = "allwinner,sun50i-a100-system-control",
+				     "allwinner,sun50i-a64-system-control";
+			reg = <0x03000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			sram_a1: sram@20000 {
+				compatible = "mmio-sram";
+				reg = <0x00020000 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x00020000 0x4000>;
+			};
+
+			sram_c: sram@24000 {
+				compatible = "mmio-sram";
+				reg = <0x024000 0x21000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x024000 0x21000>;
+			};
+
+			sram_a2: sram@100000 {
+				compatible = "mmio-sram";
+				reg = <0x0100000 0x14000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x0100000 0x14000>;
+			};
+		};
+
 		ccu: clock@3001000 {
 			compatible = "allwinner,sun50i-a100-ccu";
 			reg = <0x03001000 0x1000>;

-- 
2.47.1

