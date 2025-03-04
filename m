Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F71824EAAA
	for <linux-sunxi@lists.linux.dev>; Tue,  4 Mar 2025 22:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741127144; cv=none; b=Txf/4puiEtBiHcxVN4/w10otg1AbdZTuM037HrTDE3BhpoL+jVL1JlZmpzoqwd6cVYbT0+Ih2dwimNGSDI4K9tQVlEa+OE55PrF9VVDSPztYjQXscI0KeDoLae/ZbvOWbOdg7uHb2ZXvd/3VYvz59e3xA/BPkV65z3UcV5oSXrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741127144; c=relaxed/simple;
	bh=ENbo0gM8IwufCgggenHF+D7xLihjMCy8hfoPc/5Tpz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dSAnwfnhwr8yaLQh87rLw0O5Pi4Vae3n+R5OXd6H3jc9Zjx11yFV38R1hhk0udGOBsqMAli3SpmlAebzxEhBnGk0SePZ2sx9/V1Wv+4bFP6+vO0+KmVWds4vI7rUh6UHCsY8i5jdf5wx+HfWI5novYaI9L4q5bZ9xm5pKD32W/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 678DD497;
	Tue,  4 Mar 2025 14:25:54 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CE763F77D;
	Tue,  4 Mar 2025 14:25:39 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 01/15] dt-bindings: mmc: sunxi: Simplify compatible string listing
Date: Tue,  4 Mar 2025 22:22:55 +0000
Message-ID: <20250304222309.29385-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250304222309.29385-1-andre.przywara@arm.com>
References: <20250304222309.29385-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New Allwinner SoCs only occasionally update their MMC IP, leading to many
pairs of compatible strings, though there are sometimes a number of them
being compatible with one particular SoC.

Collate the compatible string listing in the binding, to group those
being compatible together. This makes the list more readable, and allows
for easier addition of new SoC's MMC devices.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/mmc/allwinner,sun4i-a10-mmc.yaml | 36 ++++++++-----------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
index 0ccd632d56200..8e4c77b7e4ab9 100644
--- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
@@ -30,38 +30,30 @@ properties:
       - const: allwinner,sun50i-a100-emmc
       - const: allwinner,sun50i-a100-mmc
       - items:
-          - const: allwinner,sun8i-a83t-mmc
+          - enum:
+              - allwinner,sun8i-a83t-mmc
+              - allwinner,suniv-f1c100s-mmc
           - const: allwinner,sun7i-a20-mmc
       - items:
-          - const: allwinner,sun8i-r40-emmc
+          - enum:
+              - allwinner,sun8i-r40-emmc
+              - allwinner,sun50i-h5-emmc
+              - allwinner,sun50i-h6-emmc
           - const: allwinner,sun50i-a64-emmc
       - items:
-          - const: allwinner,sun8i-r40-mmc
+          - enum:
+              - allwinner,sun8i-r40-mmc
+              - allwinner,sun50i-h5-mmc
+              - allwinner,sun50i-h6-mmc
           - const: allwinner,sun50i-a64-mmc
       - items:
-          - const: allwinner,sun50i-h5-emmc
-          - const: allwinner,sun50i-a64-emmc
-      - items:
-          - const: allwinner,sun50i-h5-mmc
-          - const: allwinner,sun50i-a64-mmc
-      - items:
-          - const: allwinner,sun50i-h6-emmc
-          - const: allwinner,sun50i-a64-emmc
-      - items:
-          - const: allwinner,sun50i-h6-mmc
-          - const: allwinner,sun50i-a64-mmc
-      - items:
-          - const: allwinner,sun20i-d1-emmc
-          - const: allwinner,sun50i-a100-emmc
-      - items:
-          - const: allwinner,sun50i-h616-emmc
+          - enum:
+              - allwinner,sun20i-d1-emmc
+              - allwinner,sun50i-h616-emmc
           - const: allwinner,sun50i-a100-emmc
       - items:
           - const: allwinner,sun50i-h616-mmc
           - const: allwinner,sun50i-a100-mmc
-      - items:
-          - const: allwinner,suniv-f1c100s-mmc
-          - const: allwinner,sun7i-a20-mmc
 
   reg:
     maxItems: 1
-- 
2.46.3

