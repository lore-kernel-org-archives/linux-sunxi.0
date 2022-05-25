Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7A71388
	for <linux-sunxi@lists.linux.dev>; Wed, 25 May 2022 19:10:02 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id B0C82C9808
	for <linux-sunxi@lists.linux.dev>; Wed, 25 May 2022 18:59:17 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1A5D7FF802;
	Wed, 25 May 2022 18:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653505150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0e36VTBrl4h01+yvpFDAiMt4gILBhIMX51AW/jYf/nw=;
	b=CpnH5UNKCQWR+UjMr3xo5f3EdyDfyliqArTluXMHjt78+DsdMwZZJthgi0CeXG16a4NARO
	ad0O9YgNh4ztfaAlp2HqiNGIdZKsvSwGXjEOfyg2Ie8LvPk+f69kN7Vw4IzofpsKiH2Xvu
	YO9bZ+DEfC6ZzqzcZ2lRPGd1TwybMewVZdhmTNtHxMa0u1EVl/1ufpLE2s3F+ywNbGqi7I
	aOcdaprz6/nsCyj1Ia6xiSobnw/ONgQYoxRhfMbk1Pv9yS1PwxdnUFQ/O//RKE+aL4ctiG
	fWl/o8fu9MYBFoEGcryYL2LY7nK/L8NHvKhecwzas2Fbh1LHYAXyCXBP6YwJIQ==
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
Subject: [PATCH v4 1/7] dt-bindings: interconnect: sunxi: Add V3s mbus compatible
Date: Wed, 25 May 2022 20:58:47 +0200
Message-Id: <20220525185853.695931-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525185853.695931-1-paul.kocialkowski@bootlin.com>
References: <20220525185853.695931-1-paul.kocialkowski@bootlin.com>
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
Reviewed-by: Samuel Holland <samuel@sholland.org>
---
 .../devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml b/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml
index 8eee312c2e6f..c079d01e41d7 100644
--- a/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi/allwinner,sun4i-a10-mbus.yaml
@@ -31,6 +31,7 @@ properties:
       - allwinner,sun5i-a13-mbus
       - allwinner,sun8i-h3-mbus
       - allwinner,sun8i-r40-mbus
+      - allwinner,sun8i-v3s-mbus
       - allwinner,sun50i-a64-mbus
       - allwinner,sun50i-h5-mbus
 
@@ -86,6 +87,7 @@ if:
       contains:
         enum:
           - allwinner,sun8i-h3-mbus
+          - allwinner,sun8i-v3s-mbus
           - allwinner,sun50i-a64-mbus
           - allwinner,sun50i-h5-mbus
 
-- 
2.36.1

