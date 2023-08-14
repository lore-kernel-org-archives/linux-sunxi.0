Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0B353BF
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Aug 2023 06:38:26 +0000 (UTC)
Received: from [192.168.2.137] (bband-dyn221.178-41-211.t-com.sk [178.41.211.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 8E21D3EBDB;
	Mon, 14 Aug 2023 08:38:18 +0200 (CEST)
From: Martin Botka <martin.botka@somainline.org>
Date: Mon, 14 Aug 2023 08:38:10 +0200
Subject: [PATCH v2 1/2] dt-bindings: nvmem: SID: Add binding for H616 SID
 controller
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230814-sid-h616-v2-1-0267749b4471@somainline.org>
References: <20230814-sid-h616-v2-0-0267749b4471@somainline.org>
In-Reply-To: <20230814-sid-h616-v2-0-0267749b4471@somainline.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>, Alan Ma <tech@biqu3d.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Martin Botka <martin.botka@somainline.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691995097; l=826;
 i=martin.botka@somainline.org; s=20230811; h=from:subject:message-id;
 bh=UNrJIzFYMiFBJT0dhRHON+UeOYIjcjf6t1SJcZFXSVI=;
 b=ogt8neio2NlBqyquNtpDHcrO+trwsum4Q9IP4AuAAlqA8oMqRLfK0KP/3FqVZKbdcBBBokQJd
 queD82Bz0ESCUzapwCXZpU/ww7LuboDpQx6oYKXtR0vRiPleQ1GT+8a
X-Developer-Key: i=martin.botka@somainline.org; a=ed25519;
 pk=aTCd3jmwU8GrJidWg3DSKLpdVMcpFzXzCSLXLR6NtWU=

Add binding for the SID controller found in H616 SoC

Signed-off-by: Martin Botka <martin.botka@somainline.org>
---
 Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
index 296001e7f498..2ec0a1b8f803 100644
--- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
+++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
@@ -27,6 +27,7 @@ properties:
           - const: allwinner,sun50i-a64-sid
       - const: allwinner,sun50i-h5-sid
       - const: allwinner,sun50i-h6-sid
+      - const: allwinner,sun50i-h616-sid
 
   reg:
     maxItems: 1

-- 
2.41.0

