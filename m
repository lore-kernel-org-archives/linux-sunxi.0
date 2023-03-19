Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4527C
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Mar 2023 21:29:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85F9E1516;
	Sun, 19 Mar 2023 14:30:39 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 262613F67D;
	Sun, 19 Mar 2023 14:29:54 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v6 4/6] dt-binding: arm: sunxi: add two board compatible strings
Date: Sun, 19 Mar 2023 21:29:34 +0000
Message-Id: <20230319212936.26649-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.7
In-Reply-To: <20230319212936.26649-1-andre.przywara@arm.com>
References: <20230319212936.26649-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Icenowy Zheng <uwu@icenowy.me>

The SourceParts PopStick is a F1C200s-based stick-shaped SBC. The
publicly released version is actually v1.1.
The Lctech Pi F1C200s is a small development board using the Allwinner
F1C200s SoC.

Add the compatible string lists to the bindings documentation.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 3ad1cd50e3fe0..cbdfc1c247a2b 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -366,6 +366,12 @@ properties:
           - const: lamobo,lamobo-r1
           - const: allwinner,sun7i-a20
 
+      - description: Lctech Pi F1C200s
+        items:
+          - const: lctech,pi-f1c200s
+          - const: allwinner,suniv-f1c200s
+          - const: allwinner,suniv-f1c100s
+
       - description: Libre Computer Board ALL-H3-CC H2+
         items:
           - const: libretech,all-h3-cc-h2-plus
@@ -807,6 +813,13 @@ properties:
           - const: sinlinx,sina33
           - const: allwinner,sun8i-a33
 
+      - description: SourceParts PopStick v1.1
+        items:
+          - const: sourceparts,popstick-v1.1
+          - const: sourceparts,popstick
+          - const: allwinner,suniv-f1c200s
+          - const: allwinner,suniv-f1c100s
+
       - description: SL631 Action Camera with IMX179
         items:
           - const: allwinner,sl631-imx179
-- 
2.35.7

