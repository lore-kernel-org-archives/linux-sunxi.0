Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B180715C8A
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Oct 2022 23:59:49 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4E9E5FF80A;
	Fri, 28 Oct 2022 23:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667001588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5SJVLshBVlGykXsCSO2AKVjwL2+PMExjLt3OhdqhtdQ=;
	b=i8fDsaSdYRzc05KB/dgw6uIfPbZONDAVT+z0pOerZRxOWZYOnMs/Z73FAEJ193yoP56j8l
	jtOxOk1H6nfbPOvWRoU6seXVFKZ0ng7Yh4wC1kI4O9WszGc8xMHu1ZZ1D4z+lJqcBH1rb4
	LZf4A8TJKSu9KfLu5OpUlQmZWzLQz0bH+osL33jkeSqfUdxPyDpZclCn9hUHqnaI4j9Avr
	1SowBsybEEoyUluEY7MKw2sVZV9ezanDf9G5NcLcKLbZFPbLPjTTA+JrxZ5liyGN7vu7lb
	81st12DEPMeFOcKR+/0wgH4fvp3JYxUnWC8I+eGrazqJfTCUw9s3pk/qSsh5zA==
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
Subject: [PATCH 06/12] dt-bindings: mtd: nand-chip: Reference mtd.yaml
Date: Sat, 29 Oct 2022 01:59:27 +0200
Message-Id: <20221028235933.934850-7-miquel.raynal@bootlin.com>
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

A NAND chip is an MTD device. mtd.yaml already defines many useful and
relevant properties, let's reference this file here to get access to
these additional property definitions.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/nand-chip.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
index 97ac3a3fbb52..8d5d2d3ef56b 100644
--- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
@@ -9,6 +9,9 @@ title: NAND Chip and NAND Controller Generic Binding
 maintainers:
   - Miquel Raynal <miquel.raynal@bootlin.com>
 
+allOf:
+  - $ref: "mtd.yaml#"
+
 description: |
   This file covers the generic description of a NAND chip. It implies that the
   bus interface should not be taken into account: both raw NAND devices and
-- 
2.34.1

