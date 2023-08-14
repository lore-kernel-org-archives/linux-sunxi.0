Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D931842
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Aug 2023 08:07:15 +0000 (UTC)
Received: from [192.168.2.137] (bband-dyn221.178-41-211.t-com.sk [178.41.211.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A97F91F53B;
	Mon, 14 Aug 2023 10:07:07 +0200 (CEST)
From: Martin Botka <martin.botka@somainline.org>
Date: Mon, 14 Aug 2023 10:07:03 +0200
Subject: [PATCH v5 1/4] dt-bindings: vendor-prefixes: Add BigTreeTech
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230814-b4-cb1-v5-1-92135086dee4@somainline.org>
References: <20230814-b4-cb1-v5-0-92135086dee4@somainline.org>
In-Reply-To: <20230814-b4-cb1-v5-0-92135086dee4@somainline.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>, 
 Alan Ma <tech@biqu3d.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Martin Botka <martin@biqu3d.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Martin Botka <martin.botka@somainline.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692000426; l=1057;
 i=martin.botka@somainline.org; s=20230811; h=from:subject:message-id;
 bh=RUWZj81bsc4vcSBum5JUlIQ+fy7HYU2LxqxOUFlV7M4=;
 b=d6lH22g63bns6ANBbiNipfO7tSWVHhCXDDpTwu5qZh9Z4ID6PP5Zefqs1mvTDvBcBo9wrZJ4p
 GvCevtFZY/3C/51eVC0jjMcPw670sxYt48XB2od8tWJ6ESftElf0NQ9
X-Developer-Key: i=martin.botka@somainline.org; a=ed25519;
 pk=aTCd3jmwU8GrJidWg3DSKLpdVMcpFzXzCSLXLR6NtWU=

BigTreeTech is a company based in Shenzhen that makes
3D printers and accessories.

Add prefix for it.

Signed-off-by: Martin Botka <martin.botka@somainline.org>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index af60bf1a6664..a1f3bb7be860 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -192,6 +192,8 @@ patternProperties:
     description: BeagleBoard.org Foundation
   "^bhf,.*":
     description: Beckhoff Automation GmbH & Co. KG
+  "^bigtreetech,.*":
+    description: Shenzhen BigTree Tech Co., LTD
   "^bitmain,.*":
     description: Bitmain Technologies
   "^blutek,.*":

-- 
2.41.0

