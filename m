Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81BA415B71
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 21:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789419968; cv=none; b=tOy0utWFuXP1T7LG3ONbrf6YRljm/e3o/2XDUbJsd300VLPNm+EniT5nih2OYsAPGbvA7x096ajV6rQj5kH/EMXzoF2OGXoZm8bO6YfTLDNS/N98EPr/b3L0AB3rleifE8pgjCywUgbzMcB4kXZCiyKdzKSmHU+4tvTTEaYmt8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789419968; c=relaxed/simple;
	bh=Hzy5rOEU5SW9UaBzfF+yBdx5Py99f3rOUQJzaY2KHWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QWGdBWeTmo8+PTzGZAkccoNDtYPul1iwpr87iyz1vyYpWcYMwJTHKhq4j2K/wIS27VbN9sBUDyIF0DPOnT68X8toIiupUXuyd6iAez5/cKoX/ZijrrnMlZiMNOUn7OvlCaQ72udSJr8lS1X/MTEIHtqoNnIggAYcSNcHjPcFGSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TE1Ui0h6; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TE1Ui0h6"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D9481CE0;
	Mon, 14 Sep 2026 14:06:01 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33C263F882;
	Mon, 14 Sep 2026 14:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789419965; bh=Hzy5rOEU5SW9UaBzfF+yBdx5Py99f3rOUQJzaY2KHWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TE1Ui0h67Mro1Km5TPXj8AR26JvrPWARerU1mK+6DxYGNGmxUjxo3yPOCg8g/ziwu
	 EZ4K8qKMBwfFc2Zsa/aA29R/mXMeE3i3SdGmjTwyOQd0Nfue5QctxfZtVAjQc05VTv
	 5dpwFyivAFJg57af8QBFLvsh/7ociZVez1OjY8XE=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 2/3] dt-bindings: arm: sunxi: Add two Teclast tablets
Date: Mon, 14 Sep 2026 23:01:14 +0200
Message-ID: <20260914210115.28151-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20260914210115.28151-1-andre.przywara@arm.com>
References: <20260914210115.28151-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Teclast produces some entry-level tablets with Allwinner SoCs, typically
featuring a new SoC early in the market.

Add the names for the Teclast P80 tablet, with an Allwinner A133 SoC,
but also the Teclast P85T, using an Allwinner A523 chip.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c630ac..28437c47ac01b 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -933,6 +933,16 @@ properties:
           - const: tbs-biometrics,a711
           - const: allwinner,sun8i-a83t
 
+      - description: Teclast P80 Tablet
+        items:
+          - const: teclast,p80
+          - const: allwinner,sun50i-a133
+
+      - description: Teclast P85T Tablet
+        items:
+          - const: teclast,p85t
+          - const: allwinner,sun55i-a523
+
       - description: Topwise A721 Tablet
         items:
           - const: topwise,a721
-- 
2.46.4

