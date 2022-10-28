Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED4EBA41
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Oct 2022 23:59:46 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AB506FF806;
	Fri, 28 Oct 2022 23:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667001584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JnETgG5ahkxv0BMu7R1ArSayvHSpy+z/aCTR3oTK0R0=;
	b=B5FNgu6wuxBypJWg2jf/DyROdDwZBgPbVO4319iHfWvFM31N2kwtD+k7V4UQzy4Ggkthgd
	v5XjVodOJnQ8JpkGt3ufe7FlTdcB3EFjsxjV/u+wJ404DnOuLAy0LkXcQ5KXhvjJHUFypn
	mPkQaetIW7lzxaF8rg0RMZ8OhTxdUTEB+3G7eQ4HObfqSkc6Kx1dVus84AiGL+vU3Irbnj
	yGH1vBqh/35RdWRRbjNm32Fg27wOBWROvHjIjO2YXzdyuwXqAt0W+BUW+ZOykeMvV3Oxw0
	HfjMBmkeQElQmrGJYBhqIo128SZTJhawkFTMPcov4phO3vDeK3U8AjaKniRpfA==
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
Subject: [PATCH 04/12] dt-bindings: mtd: ingenic: Mark partitions in the controller node as deprecated
Date: Sat, 29 Oct 2022 01:59:25 +0200
Message-Id: <20221028235933.934850-5-miquel.raynal@bootlin.com>
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

Defining partitions as subnodes of the controller has been deprecated
long time ago, but unlike having partitions within the controller node,
having an enveloppe named "partitions" (which is not itself within a
chip subnode) is not that common, so keep this deprecated definition in
this file.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/ingenic,nand.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
index 8c272c842bfd..484280dd35ab 100644
--- a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
@@ -32,6 +32,7 @@ properties:
 
   partitions:
     type: object
+    deprecated: true
     description:
       Node containing description of fixed partitions.
       See Documentation/devicetree/bindings/mtd/partition.txt
-- 
2.34.1

