Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9C415AC
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 00:56:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A5D423A;
	Sun,  6 Nov 2022 16:56:30 -0800 (PST)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F2FC3F703;
	Sun,  6 Nov 2022 16:56:22 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 09/10] dt-bindings: arm: sunxi: add compatible strings for Lctech Pi
Date: Mon,  7 Nov 2022 00:54:32 +0000
Message-Id: <20221107005433.11079-10-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.5
In-Reply-To: <20221107005433.11079-1-andre.przywara@arm.com>
References: <20221107005433.11079-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lctech Pi F1C200s is a small development board using the Allwinner
F1C200s SoC.

Add the compatible string list to the bindings documentation.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index c6e0ad7f461d..cbdfc1c247a2 100644
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
-- 
2.35.5

