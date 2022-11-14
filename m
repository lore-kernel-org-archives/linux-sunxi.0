Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6260B79C9
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Nov 2022 17:20:33 +0000 (UTC)
Received: from TimeMachine.lan (bband-dyn193.178-41-216.t-com.sk [178.41.216.193])
	by m-r1.th.seeweb.it (Postfix) with ESMTPA id DB0B420082;
	Mon, 14 Nov 2022 18:20:30 +0100 (CET)
From: Martin Botka <martin.botka@somainline.org>
To: martin.botka1@gmail.com
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jami Kettunen <jamipkettunen@somainline.org>,
	Paul Bouchara <paul.bouchara@somainline.org>,
	Yenda <jtrmal@gmail.com>,
	Martin Botka <martin.botka@somainline.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Maxime Ripard <maxime@cerno.tech>,
	Conley Lee <conleylee@foxmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/2] dt-bindings: arm: sunxi: Add BIQU CB1
Date: Mon, 14 Nov 2022 18:20:15 +0100
Message-Id: <20221114172018.1876608-1-martin.botka@somainline.org>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a name & compatible for BIQU CB1

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
Changes in V2:
Add compatible and name to dt-bindings
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 3ad1cd50e3fe..d886924023f5 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -151,6 +151,11 @@ properties:
           - const: roofull,beelink-x2
           - const: allwinner,sun8i-h3
 
+      - description: Biqu CB1
+        items:
+          - const: biqu,cb1
+          - const: allwinner,sun50i-h616
+
       - description: Chuwi V7 CW0825
         items:
           - const: chuwi,v7-cw0825
-- 
2.38.1

