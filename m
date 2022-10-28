Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2FD15C8A
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Oct 2022 23:59:47 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 759B7FF809;
	Fri, 28 Oct 2022 23:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667001586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uhHL581pVZ78rpGpusp3WI56Gx3E7sF7B6MwrnAS96k=;
	b=P7CshkRfu9JXj7DVXrRpLQuYtnEsg4jjuZROMuqpFGC8T620GDVxkIQQghTkMigtcrABEu
	lE8whqVO5WkhRnNR/qQVvqfL7x+syrN0Bo9lm7XyUS/NMLzI85sGsKo9I/mGQmJNpGnI3O
	clIBYSuizO/CmVTvhAK7XZ4UiCPFbnOf0DXHFLRsjh9/0gdHDBbBHFBE6lm/nR8vH6ntQz
	apeFDIBAjWpdblZMRi1io3Dd184xPKS75fDBGRUV8Z6TmdyzsVB5DfcVhh8GYueLmTAWYz
	bZ73FqDiqsc1eQJTdtoyA8gySQ/W5ufEUxfbz5WgafUboKrd5c0d1UI+K96w8A==
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
Subject: [PATCH 05/12] dt-bindings: mtd: onenand: Mention the expected node name
Date: Sat, 29 Oct 2022 01:59:26 +0200
Message-Id: <20221028235933.934850-6-miquel.raynal@bootlin.com>
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

The chip node name in this driver is expected to be different and should
be prefixed with onenand instead of the regular "flash" string, so
mention it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
index a953f7397c40..8a79ad300216 100644
--- a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
+++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
@@ -15,6 +15,9 @@ description:
   as child nodes of the GPMC controller.
 
 properties:
+  $nodename:
+    pattern: "^onenand@[0-9],[0,9]$"
+
   compatible:
     const: ti,omap2-onenand
 
-- 
2.34.1

