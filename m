Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068B6613C
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Mar 2022 21:11:38 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 19460C2FA2
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Mar 2022 21:11:17 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DF4011C0003;
	Wed,  2 Mar 2022 21:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646255469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CaPBI6oj+tku7/ik5exvwUDsmJ89xJ3PdADdJfgOg+8=;
	b=RzXDTg8BcTdeN/Ag0cUV5eOOl1m4/x+63yV0mA/8ueeHIx2QMjxNlzN3mZg7874FkbJk+p
	iSQhTXheSYWNXien/GnawFdZ3VkpJvMozARWH9wNh4gk7PkYyWP1OoaTS0b7XMyvBqAvmG
	JCR5qFQESzyzdVxTZaNeNJFP4gsXJe35f1TiqaO7OKAEH7VY67g7PC8c+cNPnr4QBFjnXn
	8bYSpHQw4qLd02K87bmhVUywKzmdQG6Faku6x+MtbQP+zSnyBSk1bBLaBdp3wTea3ZLvyd
	EbyZf7IrqlyBwDeBM0Rbhm2bTXv1FN+zVFYgOAvAk49kf30QVI+U9NHFgDJKlg==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v3 2/8] dt-bindings: interconnect: sunxi: Add V3s mbus compatible
Date: Wed,  2 Mar 2022 22:10:54 +0100
Message-Id: <20220302211100.65264-3-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220302211100.65264-1-paul.kocialkowski@bootlin.com>
References: <20220302211100.65264-1-paul.kocialkowski@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the V3s uses the internal mbus for DMA with multimedia devices,
document its compatible in accordance with the extended mbus binding.

This will enable adding support for the V3s in the full-fledged
devfreq driver eventually.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml b/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml
index 8eee312c2e6f..e7f3f798491a 100644
--- a/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml
@@ -31,6 +31,7 @@ properties:
       - allwinner,sun5i-a13-mbus
       - allwinner,sun8i-h3-mbus
       - allwinner,sun8i-r40-mbus
+      - allwinner,sun8i-v3s-mbus
       - allwinner,sun50i-a64-mbus
       - allwinner,sun50i-h5-mbus
 
@@ -88,6 +89,7 @@ if:
           - allwinner,sun8i-h3-mbus
           - allwinner,sun50i-a64-mbus
           - allwinner,sun50i-h5-mbus
+          - allwinner,sun8i-v3s-mbus
 
 then:
   properties:
-- 
2.35.1

