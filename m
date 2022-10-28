Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1730615C81
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Oct 2022 23:59:54 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AC694FF804;
	Fri, 28 Oct 2022 23:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667001593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M4+F1CALrv7FU7A/UkWEk+dZkJCvCU4ikok+xGxfGXU=;
	b=mWYd06eS6hYYWR3q5km2PeTVDl2xi2bP8l1qJ6e69wzV8A+iPO+qetaT+AkoUTqEPbDit9
	FiHskBhNYknwLIloB81iV0yq/I9UhljIB3mS6/LrOXjz4O5dQ8jxUzvNuoAfH+fX5efvWg
	szbRj+EnbWfiqHIDxP5mzEJnNIbzuZTOlg+w9ih39jTNlpMjlhFfwkiRFVgFL5NYe1Pb32
	jzkKVVUYzQnGoUspuCIJJxCqlllu2oQQP12o9ersovf/3FBrxC/45EUb2bWBnu/lyPD72W
	Eo5ZlswcfIk9mTA9x0plbdmGHdKx8Mfc/pXmkScXUKtvFCS1DcVN0L8QPolcJA==
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
Subject: [PATCH 09/12] dt-bindings: mtd: phymap: Reuse the generic definitions
Date: Sat, 29 Oct 2022 01:59:30 +0200
Message-Id: <20221028235933.934850-10-miquel.raynal@bootlin.com>
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

The memory mapped MTD devices also share a lot with all the other MTD
devices, so let's share the properties by referencing mtd.yaml. We can
then drop mentioning the properties, to the cost of mentioning the
possible "sram" node name prefix.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/mtd-physmap.yaml | 7 +++----
 Documentation/devicetree/bindings/mtd/mtd.yaml         | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
index 82eb4e0f453b..5df94953c34e 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
@@ -13,6 +13,9 @@ description: |
   Flash chips (Memory Technology Devices) are often used for solid state
   file systems on embedded devices.
 
+allOf:
+  - $ref: "mtd.yaml#"
+
 properties:
   compatible:
     oneOf:
@@ -121,10 +124,6 @@ properties:
   big-endian: true
   little-endian: true
 
-patternProperties:
-  '@[0-9a-f]+$':
-    $ref: partitions/partition.yaml
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index 10684b233ae3..4fdce7211b55 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -12,7 +12,7 @@ maintainers:
 
 properties:
   $nodename:
-    pattern: "^flash(@.*)?$"
+    pattern: "^(flash|sram)(@.*)?$"
 
   label:
     description:
-- 
2.34.1

