Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CA115C8D
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Oct 2022 23:59:48 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 14946FF805;
	Fri, 28 Oct 2022 23:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667001580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Butx8i3x6waX06tzNbc8/G+V5LmsGgkNbbLeRWrHG9o=;
	b=JxxlOPJyZc3Om+Fqj3548BrMCrYLgXNN+D35HC4VbVUm93L7D99yTEe6Aby6MHnU3XLoYx
	1KXubrZcGe6uTecE/BzxZNTUioN3LGAMOmPZkmFZ/blqVNtso/Z9PJPdVWll4LnzNFGduq
	A6aBJmNkCe6lP+/LY5Sot6ubuJRAdRQ00HfoNRnrVC8Gt63C5gKo/HeSHrDgiAKErL1Jim
	WnSUqjxdQOa7hPpnIlHXkrIQfWIS6KesfRrwtgy7PELGC4ZHZnMR+gVfRO29cP6QK/RGsk
	eZlnbtLuzIBW+rHSDxytqYX8cqaCdUFK5ssQlXsI5dEOyagZuARlMD3gwREvpg==
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
Subject: [PATCH 02/12] dt-bindings: mtd: Mention basic properties
Date: Sat, 29 Oct 2022 01:59:23 +0200
Message-Id: <20221028235933.934850-3-miquel.raynal@bootlin.com>
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

there to avoid the need to do it in each and every file.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/mtd.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index 9fcaa61b046c..10684b233ae3 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -21,6 +21,9 @@ properties:
       based name) in order to ease flash device identification and/or
       describe what they are used for.
 
+  '#address-cells': true
+  '#size-cells': true
+
   partitions:
     type: object
     properties:
-- 
2.34.1

