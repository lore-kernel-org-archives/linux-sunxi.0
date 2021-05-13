Received: from mail.manjaro.org (mail.manjaro.org [176.9.38.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A7971
	for <linux-sunxi@lists.linux.dev>; Thu, 13 May 2021 20:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.manjaro.org (Postfix) with ESMTP id 9A01A2209A3;
	Thu, 13 May 2021 22:33:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
	by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RCMHEsfGkWCX; Thu, 13 May 2021 22:33:57 +0200 (CEST)
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
Subject: [PATCH v2 1/2] dt-bindings: pwm: allwinner: add v3s pwm compatible
Date: Thu, 13 May 2021 22:35:26 +0200
Message-Id: <20210513203527.2072090-2-t.schramm@manjaro.org>
In-Reply-To: <20210513203527.2072090-1-t.schramm@manjaro.org>
References: <20210513203527.2072090-1-t.schramm@manjaro.org>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner V3s pwm peripheral is compatible with the pwm peripheral
inside the Allwinner A20.
This patch adds a compatible string for it.

Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
---
 .../devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
index 7dcab2bf8128..04ff708fdc86 100644
--- a/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml
@@ -24,6 +24,9 @@ properties:
       - items:
           - const: allwinner,sun8i-a83t-pwm
           - const: allwinner,sun8i-h3-pwm
+      - items:
+          - const: allwinner,sun8i-v3s-pwm
+          - const: allwinner,sun7i-a20-pwm
       - items:
           - const: allwinner,sun50i-a64-pwm
           - const: allwinner,sun5i-a13-pwm
-- 
2.31.1

