Received: from mail-m17638.qiye.163.com (mail-m17638.qiye.163.com [59.111.176.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F68972
	for <linux-sunxi@lists.linux.dev>; Mon,  3 May 2021 14:32:19 +0000 (UTC)
Received: from amadeus-VLT-WX0.lan (unknown [120.37.186.143])
	by mail-m17638.qiye.163.com (Hmail) with ESMTPA id 7619C1C015B;
	Mon,  3 May 2021 22:32:16 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Rob Herring <robh+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 2/2] dt-bindings: arm: Add NanoPi R1S H5
Date: Mon,  3 May 2021 22:32:02 +0800
Message-Id: <20210503143202.21795-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
	oVCBIfWUFZQ0JDS1ZKGB0YS0NPSE5KTBlVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
	hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NTo6Iyo4GT8QME0SFBMNSAE8
	CkswCh5VSlVKTUlLS05JSEhNQkNOVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpJ
	S1VITFVKQ01VSk9IWVdZCAFZQUpDTEk3Bg++
X-HM-Tid: 0a7932a4e032d993kuws7619c1c015b
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Add the bindings for NanoPi R1S H5 board.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index ac750025a2eb..2f2ae5a8f3aa 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -269,6 +269,11 @@ properties:
           - const: friendlyarm,nanopi-r1
           - const: allwinner,sun8i-h3
 
+      - description: FriendlyARM NanoPi R1S H5
+        items:
+          - const: friendlyarm,nanopi-r1s-h5
+          - const: allwinner,sun50i-h5
+
       - description: FriendlyARM ZeroPi
         items:
           - const: friendlyarm,zeropi
-- 
2.17.1

