Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261121C5D77
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jul 2025 16:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751907275; cv=none; b=Wj99DztiS2r2XE3Ang1UjwbOkuCcCG+hPWUwkQNTdAzW94mxf9IwhtRr4KkVchZfErkM6ifl4p8BahbF0Ek/gTKrUT+n6fZMR9PAbYyIORFohxhlBSKhntDJnjKkin9pUmgJxnCIHaClTa9IsJxPYwmbn7LBuahPFjmaXivCuyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751907275; c=relaxed/simple;
	bh=0seKsdu78KnTo7icy4rcHTT6ILJuEucr44ksvECQsas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s+vzCIrUfTX8sgRG2xjjRLuLUwFOyvQ0CdMlR3kuQxHeD2CzyemIZHxKjUaTCsTx17yFGhP07k9RA+o3tz8BK6CGYiJvKwlVwWJV4WcvxGXWZtwBDEjMMC6afLx5DoP39ZntsmvZgynSq3CBPkSDMrwHDRuzVPyZMgA7KCf81kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 4FEDC1F00047
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jul 2025 16:54:32 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id C9216ACAEF8; Mon,  7 Jul 2025 16:54:31 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 6C9C4ACAEE4;
	Mon,  7 Jul 2025 16:52:09 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v2 3/4] arm64: dts: allwinner: a100: Add EMAC support
Date: Mon,  7 Jul 2025 18:51:54 +0200
Message-ID: <20250707165155.581579-4-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707165155.581579-1-paulk@sys-base.io>
References: <20250707165155.581579-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A100/A133 Ethernet MAC (EMAC) is compatible with the A64
one and needs access to the syscon register for control of the
top-level integration of the unit.

Note that there are two such controllers on the sun50iw10 die, which are
the same unit with a different top-level syscon register offset.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index 7d5be0975371..bb5f9e4f3d42 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -420,6 +420,26 @@ i2c3: i2c@5002c00 {
 			#size-cells = <0>;
 		};
 
+		emac0: ethernet@5020000 {
+			compatible = "allwinner,sun50i-a100-emac",
+				     "allwinner,sun50i-a64-emac";
+			reg = <0x5020000 0x10000>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&ccu CLK_BUS_EMAC>;
+			clock-names = "stmmaceth";
+			resets = <&ccu RST_BUS_EMAC>;
+			reset-names = "stmmaceth";
+			syscon = <&syscon>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		ths: thermal-sensor@5070400 {
 			compatible = "allwinner,sun50i-a100-ths";
 			reg = <0x05070400 0x100>;
-- 
2.49.0

