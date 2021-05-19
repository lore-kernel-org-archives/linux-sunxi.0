Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE86B70
	for <linux-sunxi@lists.linux.dev>; Wed, 19 May 2021 10:42:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A09451480;
	Wed, 19 May 2021 03:42:29 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8837B3F719;
	Wed, 19 May 2021 03:42:27 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Icenowy Zheng <icenowy@aosc.io>,
	Samuel Holland <samuel@sholland.org>,
	Ondrej Jirman <megous@megous.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH v6 09/17] dt-bindings: usb: sunxi-musb: Add H616 compatible string
Date: Wed, 19 May 2021 11:41:44 +0100
Message-Id: <20210519104152.21119-10-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210519104152.21119-1-andre.przywara@arm.com>
References: <20210519104152.21119-1-andre.przywara@arm.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

The H616 MUSB peripheral is compatible to the H3 one (8 endpoints).

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
 .../devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
index 0f520f17735e..933fa356d2ce 100644
--- a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
+++ b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
@@ -22,6 +22,9 @@ properties:
               - allwinner,sun8i-a83t-musb
               - allwinner,sun50i-h6-musb
           - const: allwinner,sun8i-a33-musb
+      - items:
+          - const: allwinner,sun50i-h616-musb
+          - const: allwinner,sun8i-h3-musb
 
   reg:
     maxItems: 1
-- 
2.17.5

