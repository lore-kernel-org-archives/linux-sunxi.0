Received: from mail.manjaro.org (mail.manjaro.org [176.9.38.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F8F2FB8
	for <linux-sunxi@lists.linux.dev>; Thu, 13 May 2021 23:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.manjaro.org (Postfix) with ESMTP id 0AB2A220A64;
	Fri, 14 May 2021 01:28:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
	by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a8lTksXsC7z5; Fri, 14 May 2021 01:28:56 +0200 (CEST)
From: Tobias Schramm <t.schramm@manjaro.org>
To: =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tobias Schramm <t.schramm@manjaro.org>
Subject: [PATCH v2 6/7] dt-bindings: sound: sun4i-i2s: add Allwinner V3 I2S compatible
Date: Fri, 14 May 2021 01:30:23 +0200
Message-Id: <20210513233024.2076725-7-t.schramm@manjaro.org>
In-Reply-To: <20210513233024.2076725-1-t.schramm@manjaro.org>
References: <20210513233024.2076725-1-t.schramm@manjaro.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2S peripheral of the Allwinner V3 SoC is compatible with the one
found in the Allwinner H3 SoC.
This patch adds a compatible string for it.

Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
---
 .../devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
index a16e37b01e1d..39b66e9ce3e3 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
@@ -20,6 +20,9 @@ properties:
       - const: allwinner,sun6i-a31-i2s
       - const: allwinner,sun8i-a83t-i2s
       - const: allwinner,sun8i-h3-i2s
+      - items:
+          - const: allwinner,sun8i-v3-i2s
+          - const: allwinner,sun8i-h3-i2s
       - const: allwinner,sun50i-a64-codec-i2s
       - items:
           - const: allwinner,sun50i-a64-i2s
-- 
2.31.1

