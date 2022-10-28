Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D3715C89
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Oct 2022 23:59:46 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1C450FF804;
	Fri, 28 Oct 2022 23:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667001578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H//pRxqN88FjYvGU8isbz1zT4GUsHwbTjTfD5EOaMH4=;
	b=VX1TySE01in907utyqOzBC86k4ZO6ApOS6Gu/L084hXya7TWjTUon1LM1tG0eZnysI+kaC
	l6jxJoUuFfnYdI3/rT+VrYtIqYKyrIMfxXtujkkYjL5giOVEfV3L++PPOQsZ68i2gRffUR
	FiyBXgeCCbejGd1h2V4y8ADKkur03y1XO2tnW3wOv8nEz6TB8mKT+zWmAfUv9VePm1WqFg
	lzfIjvjcnK3CoLJfH21Ir0hleDrXJTkFNLPJ0+3VR1O7WQv9w2omLejxwacKOFrOwBt21j
	oePi8i0RT9aYhzzBWTRQrsahxAtMqsy5DB3nlND+FI8scV4cXoH0Rq8vvj2EWQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Naga Sureshkumar Relli <nagasure@xilinx.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 01/12] dt-bindings: mtd: Clarify all partition subnodes
Date: Sat, 29 Oct 2022 01:59:22 +0200
Message-Id: <20221028235933.934850-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028235933.934850-1-miquel.raynal@bootlin.com>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Over time the various ways to define MTD partitions has evolved. Most of
the controllers support several different bindings. Let's define all
possible choices in one file and mark the legacy ones deprecated. This
way, we can just reference this file and avoid dupplicating these
definitions.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/mtd.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index 25b91f25fcf4..9fcaa61b046c 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -21,7 +21,25 @@ properties:
       based name) in order to ease flash device identification and/or
       describe what they are used for.
 
+  partitions:
+    type: object
+    properties:
+      '#address-cells': true
+      '#size-cells': true
+
+    patternProperties:
+      "partition@[0-9a-f]+":
+        $ref: partitions/partition.yaml
+
 patternProperties:
+  "@[0-9a-f]+$":
+    $ref: partitions/partition.yaml
+    deprecated: true
+
+  "^partition@[0-9a-f]+":
+    $ref: partitions/partition.yaml
+    deprecated: true
+
   "^otp(-[0-9]+)?$":
     type: object
     $ref: ../nvmem/nvmem.yaml#
-- 
2.34.1

