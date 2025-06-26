Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A6825DAE2
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 08:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925541; cv=none; b=cnOwoNV7WLWcznp0zkdwd+c+Pq3D4wt+D9feSfxEQHclgtuX+IPQOKVDVoH7mWGa5rCF3d35WjckTi27aoKXPOhg1lbNSYiijBTIKaeai65v09NwsCMK224Aqewqn5D6NXbwV0Y5HVUEScTiNiEjHf4LeO/rGnVgKbrf++TTt60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925541; c=relaxed/simple;
	bh=VFiodgVBU+frCM31/xTGFTIbf1DYWZz32/4rKCb6CNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=enC10aof7PdF5CnRVnZDJSSTrXXmmgwZhcRFI2W38BloyT1iXW1aUB3rVNNFLyES0xuZq9WXzrR8vaS5I/tCM/aTCl7oXJ2DBuPtlNH2a1SZSZM8PUGfYNZDRxtJo/1N/Eo7Vpndv09Rzn8tzC3kE7xkuGpBRavb0PmrMD/74O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id BF2351F0004B
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Jun 2025 08:12:15 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 405EFAC7F86; Thu, 26 Jun 2025 08:12:15 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 89D1EAC7F7A;
	Thu, 26 Jun 2025 08:09:40 +0000 (UTC)
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
Subject: [PATCH 2/5] arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
Date: Thu, 26 Jun 2025 10:09:20 +0200
Message-ID: <20250626080923.632789-3-paulk@sys-base.io>
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

The Allwinner A100/A133 supports both RGMII and RMII for its Ethernet
MAC (EMAC) controller. Add corresponding pin definitions.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index bd366389b238..1c4e71b32911 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -236,6 +236,21 @@ mmc2_pins: mmc2-pins {
 				bias-pull-up;
 			};
 
+			rgmii_pins: rgmii-pins {
+				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
+				       "PH5", "PH6", "PH7", "PH9", "PH10",
+				       "PH14", "PH15", "PH16", "PH17", "PH18";
+				function = "emac";
+				drive-strength = <40>;
+			};
+
+			rmii_pins: rmii-pins {
+				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
+				       "PH5", "PH6", "PH7", "PH9", "PH10";
+				function = "emac";
+				drive-strength = <40>;
+			};
+
 			uart0_pb_pins: uart0-pb-pins {
 				pins = "PB9", "PB10";
 				function = "uart0";
-- 
2.49.0

