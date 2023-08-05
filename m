Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575701FA0
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Aug 2023 08:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=biqu3d.com;
	s=tfld2305; t=1691224704;
	bh=YO7xaf8Rw9sIuANokm3AXhy2ulC5+4s81L69XDEqscg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=HX2TfOxAulK2GOa5U3zV6zZIoOTgHo3eFJbfavLzL3LG0Q+C4fETcto49Zjnt3y77
	 HdqIEH5DQ7KQ2k7qVeCUYp1YYZuYYmSyrjAScGbHS792pV/M9dAE95rbhY5SixQCqi
	 Bmwb9kgrkbVbyrMvKNE5SlbTs4OAtKdMFiytgqpU=
X-QQ-mid: bizesmtp83t1691224649tmlj0e6s
Received: from localhost.localdomain ( [178.41.211.221])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 05 Aug 2023 16:37:15 +0800 (CST)
X-QQ-SSF: 01400000000000505000000A0000000
X-QQ-FEAT: QityeSR92A0eFaU+9AmEeJIKBufKLOpgIZ2BiszHxyMcN02vfQ7BG1GRDRb/5
	+7mFtP+YVz8iU6bQVF29KqlAyXgAn6PUNuMBivkEl4SKyobtNPFn9Bpk7QAm5N+ND6ENbN4
	wz5igm00ibYJFofyqvunnmLmRZ72Hnq+HCrH4hqPUp1n2xBIz1OZNpZNO+AwoO+eWLBA0Zl
	3dXMmtzER6rlbellNh1h2U+Hp3j5LldQ921UeYOuf8XpwnnJoYyqW56c5MqLMNACcFn8eeq
	sNxeJl14JWjQLkcmGrBFJsDmhnUju7AFKbxFxnhaYeq7PE/21nJXvKGNRYJvn5BH9K2uoau
	s4x3Lp15u4xZGduGClflaZy8i9L7BFTH23A+FKxqT9wiAmbAECcGxT6NDiSVrKsSWhBtnea
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 17380161915380750607
From: Martin Botka <martin@biqu3d.com>
To: martin.botka1@gmail.com
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jami Kettunen <jamipkettunen@somainline.org>,
	Paul Bouchara <paul.bouchara@somainline.org>,
	Martin Botka <martin.botka@somainline.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Ludwig Kormann <ludwig.kormann@ict42.de>,
	Andrew Lunn <andrew@lunn.ch>,
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
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add BigTreeTech
Date: Sat,  5 Aug 2023 10:36:04 +0200
Message-ID: <3E7672223AA6FBAF+20230805083636.788048-2-martin@biqu3d.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230805083636.788048-1-martin@biqu3d.com>
References: <20230805083636.788048-1-martin@biqu3d.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in V2:
    - Fix alphabetical order
Changes in V3: none

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

