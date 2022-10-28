Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B587115C8F
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Oct 2022 23:59:49 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D53CEFF808;
	Fri, 28 Oct 2022 23:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667001582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IAWWxBs//Vo6EQ31GIr59Xp+/osOxAxt+YgW4D8O4Rc=;
	b=aBtHHnEHCLYhI3pW0oBmNFQpqd6mU0z0PHYQjazGC0+Omq0+hM5pUl4nmBdHR3AzZd1tgj
	CHJeDuJXExGkDrAlZsl0njf7NXHPCeWFX+qXKPSLI4acB6zM0jHDN8yiNfHqW4vyWkyzsq
	+aLkN9m9YWoKJpa5jVNcCxedk8U8yBAapIOyONX2RnTU83qNuWqzz5FkaHcKDj2Tzk0bMm
	pWn1IdJXWJ9AtXafn2B5ynbwv/LdwmVA0KUFoq/5v+ZgQFIZ80InIXiJ7fo8xZvDD3CpI5
	rHTFIL6wci8AJy1tyvRatG8ezVKhnNY/DUfiZHWJkDHbVttHpNnikN9TiAyJiw==
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
Subject: [PATCH 03/12] dt-bindings: mtd: Remove useless file about partitions
Date: Sat, 29 Oct 2022 01:59:24 +0200
Message-Id: <20221028235933.934850-4-miquel.raynal@bootlin.com>
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

There is already a real partitions.yaml file, nothing in this text file
is actually needed so drop it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/mtd/partition.txt     | 33 -------------------
 1 file changed, 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/partition.txt

diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
deleted file mode 100644
index ead90e8274d6..000000000000
--- a/Documentation/devicetree/bindings/mtd/partition.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Flash partitions in device tree
-===============================
-
-Flash devices can be partitioned into one or more functional ranges (e.g. "boot
-code", "nvram", "kernel").
-
-Different devices may be partitioned in a different ways. Some may use a fixed
-flash layout set at production time. Some may use on-flash table that describes
-the geometry and naming/purpose of each functional region. It is also possible
-to see these methods mixed.
-
-To assist system software in locating partitions, we allow describing which
-method is used for a given flash device. To describe the method there should be
-a subnode of the flash device that is named 'partitions'. It must have a
-'compatible' property, which is used to identify the method to use.
-
-When a single partition is represented with a DT node (it depends on a used
-format) it may also be described using above rules ('compatible' and optionally
-some extra properties / subnodes). It allows describing more complex,
-hierarchical (multi-level) layouts and should be used if there is some
-significant relation between partitions or some partition internally uses
-another partitioning method.
-
-Available bindings are listed in the "partitions" subdirectory.
-
-
-Deprecated: partitions defined in flash node
-============================================
-
-For backwards compatibility partitions as direct subnodes of the flash device are
-supported. This use is discouraged.
-NOTE: also for backwards compatibility, direct subnodes that have a compatible
-string are not considered partitions, as they may be used for other bindings.
-- 
2.34.1

