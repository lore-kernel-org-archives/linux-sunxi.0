Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F80E7482
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Aug 2023 14:03:57 +0000 (UTC)
Received: from [192.168.2.137] (bband-dyn221.178-41-211.t-com.sk [178.41.211.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id BECC93F311;
	Mon, 21 Aug 2023 16:03:49 +0200 (CEST)
From: Martin Botka <martin.botka@somainline.org>
Date: Mon, 21 Aug 2023 16:03:46 +0200
Subject: [PATCH v2 1/3] dt-bindings: thermal: sun8i: Add binding for H616
 THS controller
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230821-ths-h616-v2-1-cda60d556798@somainline.org>
References: <20230821-ths-h616-v2-0-cda60d556798@somainline.org>
In-Reply-To: <20230821-ths-h616-v2-0-cda60d556798@somainline.org>
To: Vasily Khoruzhick <anarsoul@gmail.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
 Alan Ma <tech@biqu3d.com>, Luke Harrison <bttuniversity@biqu3d.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Martin Botka <martin@biqu3d.com>, 
 Martin Botka <martin.botka@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692626628; l=1803;
 i=martin.botka@somainline.org; s=20230811; h=from:subject:message-id;
 bh=l21PID8iaAkiKdEpLZurpAUU9ndeGPQaeIKZKXJ1CS0=;
 b=IqUdgDy8DQg9wxm1KzNxjVO2EDEd4LSYb4HWhQAdC/acgWC505Er5C+fvxzOAfnsUN0zq7Xih
 INteHDhM02sC/7q+X1iW9a/AsCGEFnK4MWoGiARUh0HQwk0wP4kiYCO
X-Developer-Key: i=martin.botka@somainline.org; a=ed25519;
 pk=aTCd3jmwU8GrJidWg3DSKLpdVMcpFzXzCSLXLR6NtWU=

This controller is similar to the H6, but covers four sensors and uses
slightly different calibration methods.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
 .../bindings/thermal/allwinner,sun8i-a83t-ths.yaml     | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index fbd4212285e2..7e96104d8ae0 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -20,6 +20,7 @@ properties:
       - allwinner,sun50i-a100-ths
       - allwinner,sun50i-h5-ths
       - allwinner,sun50i-h6-ths
+      - allwinner,sun50i-h616-ths
 
   clocks:
     minItems: 1
@@ -63,6 +64,7 @@ allOf:
             enum:
               - allwinner,sun50i-a100-ths
               - allwinner,sun50i-h6-ths
+              - allwinner,sun50i-h616-ths
 
     then:
       properties:
@@ -97,16 +99,12 @@ allOf:
           const: 1
 
   - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - allwinner,sun8i-h3-ths
-              - allwinner,sun8i-r40-ths
-              - allwinner,sun50i-a64-ths
-              - allwinner,sun50i-a100-ths
-              - allwinner,sun50i-h5-ths
-              - allwinner,sun50i-h6-ths
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - allwinner,sun8i-a83t-ths
 
     then:
       required:

-- 
2.41.0

