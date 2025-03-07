Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCF118BC3F
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Mar 2025 00:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741309057; cv=none; b=ZyN149gD38qw137f7cQZcnGYwRXleWjbFlOcpaXZ+venHlWxHxUpPSAawgpGPB9XG+PhpFzE2pdVudcgnHwb//0mBstahLGrE0iehbLhp87i7uZAy3chQdSF+gB2P+cgY+vPZFwGOp2Z+mKKkHRie7vQpd/H369DcyLcMoIQfkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741309057; c=relaxed/simple;
	bh=mI/KQp1Pka0NtO36Oq1/oFIBxkswFQ7b2yyuh4Hs5v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lu8BAMEPqP0guaST13T1eV4WKi3X2gWG3bt2k6SAIx0iNIbDr6vDRyUSryCCtXG5MRG9uV7tdAeICH1E3P/NYZuAAgLOwzy/hOpJ7jqnaRiPZy3MuBFKqVxm78gbksz0XWkzJEq23KTicJPkVpzzxHq+WhyfDdQM/eH9OuYolOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 101EA169E;
	Thu,  6 Mar 2025 16:57:49 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67B093F5A1;
	Thu,  6 Mar 2025 16:57:34 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 07/15] dt-bindings: phy: document Allwinner A523 USB-2.0 PHY
Date: Fri,  7 Mar 2025 00:57:04 +0000
Message-ID: <20250307005712.16828-8-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250307005712.16828-1-andre.przywara@arm.com>
References: <20250307005712.16828-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A523 SoC contains a USB-2.0 PHY fully compatible to the
one used in the D1/T113s SoCs. This PHY controls the two USB-2.0 ports,
there is a separate and quite different PHY for the USB-3.0 port.

Add the new compatible string, with a fallback to the D1 version.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
index 21209126ed008..580c3296a18d7 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
@@ -20,7 +20,9 @@ properties:
           - allwinner,sun20i-d1-usb-phy
           - allwinner,sun50i-a64-usb-phy
       - items:
-          - const: allwinner,sun50i-a100-usb-phy
+          - enum:
+              - allwinner,sun50i-a100-usb-phy
+              - allwinner,sun55i-a523-usb-phy
           - const: allwinner,sun20i-d1-usb-phy
 
   reg:
-- 
2.46.3

