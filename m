Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258C315C8A
	for <linux-sunxi@lists.linux.dev>; Fri, 28 Oct 2022 23:59:52 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EA1C4FF80C;
	Fri, 28 Oct 2022 23:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667001591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XIQEUD2soDpdYE3i5szSeR6zjgGuNoOBnccsPznlAu4=;
	b=aB35tFMnARLX9XKAk6Zt+TsFhDywFO/wiAnB63Ggvnddd3asXPQ5YvrRbE057f/EAZQmi9
	e/7rOTiX5/QN10z5UqHVob/kP4eBe13SnH//AOm3GT7sHooOzFuZ8KBYJd7VsYzegKxloi
	DTLZtJTPuM/5Ejw9Yrf+AA6OLhyOnrViABj+CgVXMGDma1nCQQTuAsPWuLrWbHjd1WJIGn
	nkhAznMWYMLpKWZK73GW8KpQbADLv/GKBz/8w1GvI6sibAPd7LFZKdPY/8VsLXRsUcjlcw
	fQ1pGocBO62dDrmy6r+VcCVAVe9TROc1Oqx3QPlxKHP3vbaOiQmKXiN/hzd4TA==
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
Subject: [PATCH 08/12] dt-bindings: mtd: spi-nor: Drop common properties
Date: Sat, 29 Oct 2022 01:59:29 +0200
Message-Id: <20221028235933.934850-9-miquel.raynal@bootlin.com>
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

When redefining common properties does not bring any additional
information, just drop them from the SPI-NOR bindings because these
properties already are definied in mtd.yaml.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/mtd/jedec,spi-nor.yaml     | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 7149784a36ac..6cc491083650 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -70,20 +70,6 @@ properties:
       be used on such systems, to denote the absence of a reliable reset
       mechanism.
 
-  partitions:
-    type: object
-
-  '#address-cells': true
-  '#size-cells': true
-
-patternProperties:
-  # Note: use 'partitions' node for new users
-  '^partition@':
-    type: object
-
-  "^otp(-[0-9]+)?$":
-    type: object
-
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

