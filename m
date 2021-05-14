Received: from mail.manjaro.org (mail.manjaro.org [176.9.38.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B545429CA
	for <linux-sunxi@lists.linux.dev>; Fri, 14 May 2021 13:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.manjaro.org (Postfix) with ESMTP id 7C75E2225B9;
	Fri, 14 May 2021 15:42:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
	by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zQN-boO-rF43; Fri, 14 May 2021 15:42:36 +0200 (CEST)
From: Tobias Schramm <t.schramm@manjaro.org>
To: =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tobias Schramm <t.schramm@manjaro.org>
Subject: [PATCH v3 4/7] ASoC: dt-bindings: sun8i-a23-codec-analog: add compatible for Allwinner V3
Date: Fri, 14 May 2021 15:44:02 +0200
Message-Id: <20210514134405.2097464-5-t.schramm@manjaro.org>
In-Reply-To: <20210514134405.2097464-1-t.schramm@manjaro.org>
References: <20210514134405.2097464-1-t.schramm@manjaro.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The analog codec frontend of the Allwinner V3 is compatible with the
analog codec frontend used on the Allwinner H3.
This patch adds a compatible string for the analog codec frontend on the
Allwinner V3 SoC.

Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
---
 .../bindings/sound/allwinner,sun8i-a23-codec-analog.yaml | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml
index 9718358826ab..26eca21e1f0f 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a23-codec-analog.yaml
@@ -12,12 +12,15 @@ maintainers:
 
 properties:
   compatible:
-    enum:
+    oneOf:
       # FIXME: This is documented in the PRCM binding, but needs to be
       # migrated here at some point
       # - allwinner,sun8i-a23-codec-analog
-      - allwinner,sun8i-h3-codec-analog
-      - allwinner,sun8i-v3s-codec-analog
+      - const: allwinner,sun8i-h3-codec-analog
+      - items:
+          - const: allwinner,sun8i-v3-codec-analog
+          - const: allwinner,sun8i-h3-codec-analog
+      - const: allwinner,sun8i-v3s-codec-analog
 
   reg:
     maxItems: 1
-- 
2.31.1

