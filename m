Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D758B9479
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Aug 2023 09:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biqu3d.com;
	s=tfld2305; t=1691139763;
	bh=G96HVMbLI1rU6p4k3yG0aS8re6ZL3+6cwgPKnuBJvBs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=d2a8Mij6o+w//GVdCOO2xmlVgiODZsipnzTmi4dJOBlnGPWpmruZqE/89lHs6jCNS
	 Zyt9LeTzwl25NcfGhLrQq4sGWg0vKNuTFcOi09W94DOWetCvQn2ulDOLHR5FYQ3jA9
	 3o2lDOF2y8BsbROPJmpIWgPhPPkw/e296A9xMvts=
X-QQ-mid: bizesmtp65t1691139711trsfg9py
Received: from localhost.localdomain ( [178.41.211.221])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 04 Aug 2023 17:01:36 +0800 (CST)
X-QQ-SSF: 01400000000000404000000A0000000
X-QQ-FEAT: 3M0okmaRx3iNoq7ZaVT6vK4nsgC5VWMtIff9yGzFL4IQNx1BhKVoI9bhHacUg
	3ZoLXNYsxaUbFMvFwLKXiIzyJB1VeQhw8oU81RgwJFhT7p8swrE+wuUDXW/cmQipS5EEyN/
	MnWKlx7j9bzWitRjfDUEUXj2Ukr9uUc8/KVAeg+VHlrwNZ+Ruog6e+E3dk0mf8rgaXvC5Ls
	qPdSLq3JpxDYxIDB4hOCNS5eHSMDg7gYX76KCtyuCfh8G60GcbKuwG125+Il2Ndr0QK6GMk
	PET7JhqT+SWSpQLMTtYyQPfDyIgtk7TCJ8o3c8qLyiP1Q/hVWjvT4s9ROiHuxmRGAps9PTv
	yPJGQhDO6nRxcn9/OCXN1uNet6XTBR1ZZomQZoy9EO4O9aIt2CrKvd+DKupezhuxbltMgnw
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 17424578226797176994
From: Martin Botka <martin@biqu3d.com>
To: martin.botka1@gmail.com
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jami Kettunen <jamipkettunen@somainline.org>,
	Paul Bouchara <paul.bouchara@somainline.org>,
	Martin Botka <martin.botka@somainline.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Andrew Lunn <andrew@lunn.ch>,
	Ludwig Kormann <ludwig.kormann@ict42.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Jagan Teki <jagan@edgeble.ai>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add BigTreeTech
Date: Fri,  4 Aug 2023 11:00:29 +0200
Message-ID: <C2CB4DF32C2C55DC+20230804090102.273029-2-martin@biqu3d.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804090102.273029-1-martin@biqu3d.com>
References: <20230804090102.273029-1-martin@biqu3d.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:biqu3d.com:qybglogicsvrgz:qybglogicsvrgz5a-1

From: Martin Botka <martin.botka@somainline.org>

BigTreeTech is a company based in Shenzhen that makes
3D printers and accessories.

Add prefix for it.

Signed-off-by: Martin Botka <martin.botka@somainline.org>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
Changes in V2:
    - Fix alphabetical order

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

