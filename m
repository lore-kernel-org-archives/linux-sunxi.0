Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0A425BF08
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 08:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925648; cv=none; b=rmW/Zbm2RfWqdwpRiI/joaVyBRd1tShsaMPVCXIYtt7CuzIFHzRYhPwCv48YQ6Nr1hpPiXSvzVD71p5azM79OXpYpPJhjEhiU5B9o4VuVapt+kggWUBU3UXfqnTt2UB8YtijE3MpFqXnuYRN0RZS3wN3nMb7ley+ueysb/uNEjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925648; c=relaxed/simple;
	bh=bKBKj/g6dLdmBtJ1nKja2cElFDqCQJuZbjQv2dPcf0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HUfy43LrMdgAPSo+IAqXyKdsKj007oYXWMog4EPwIXJkOryrl+DQf4+PsE6vQ+eP/8ZPsEVGBenFc9HegNruYMLaAMnREFonKzeNeoWy85e4ETpEPSmUmGXpAkHs/RlKSWHFKzyELnsOrWIAFprAcT/n8t0ByJb1f5PvNjLgWt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id D22D71F0004F
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 08:14:05 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 49EABAC7F87; Thu, 26 Jun 2025 08:14:05 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id B8B27AC7F74;
	Thu, 26 Jun 2025 08:09:41 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 4/5] arm64: dts: allwinner: a100: Add EMAC support
Date: Thu, 26 Jun 2025 10:09:22 +0200
Message-ID: <20250626080923.632789-5-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626080923.632789-1-paulk@sys-base.io>
References: <20250626080923.632789-1-paulk@sys-base.io>
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

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index 1c4e71b32911..205faa90d37b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -420,6 +420,26 @@ i2c3: i2c@5002c00 {
 			#size-cells = <0>;
 		};
 
+		emac: ethernet@5020000 {
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
+			mdio: mdio {
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

