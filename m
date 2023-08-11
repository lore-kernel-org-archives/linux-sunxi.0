Received: from out-121.mta1.migadu.com (out-121.mta1.migadu.com [95.215.58.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C388468
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Aug 2023 20:15:16 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691784914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iYu4Dz4hSNyn9kJzzK4p3lb9piHB7a9wwJ9aGUktfD0=;
	b=B7i/2R3iHC2ro6I9YUbHM1FvoB39fIf9DPTD/SmZey33EEFmx1QnK5KHPYfPpGFyrVjy6b
	j1F4S4QKVceyrPo4Rt7R42KM8h/+TKatWo9+iY0nazcL7pPZEniFrdFx+6CNXbZ/AdhHf1
	aRDDIdWVuexKugvOjAH2RfxfuJ2ScwKgnOPsxfNcWV01LvTPJzC6zhsT8ahXRey2kbzFog
	XARZ1uI/K6YTATMTxZ4Pu/UsKVkoiC0oWJXwIcyBPoIMAmJvHj5xCx5Ep6EoNezVeeUs/h
	FlmeZ8gYKpenjqwDlrWOZV7PwrOv/uXUQBHKCbg5jRabvsDkoOvwzk+kscj/Vw==
From: John Watts <contact@jookia.org>
To: alsa-devel@alsa-project.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	John Watts <contact@jookia.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 7/7] dt-bindings: sound: sun4i-i2s: Add channel-slots property
Date: Sat, 12 Aug 2023 06:14:06 +1000
Message-ID: <20230811201406.4096210-8-contact@jookia.org>
In-Reply-To: <20230811201406.4096210-1-contact@jookia.org>
References: <20230811201406.4096210-1-contact@jookia.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The sun4i I2S controller supports mapping arbitrary TDM slots to
each channel. Allow this to be expressed in the device tree.

This is currently only implemented in the R329 I2S variant.

Allow this to be configured using a new channel-dins property.

Signed-off-by: John Watts <contact@jookia.org>
---
 .../bindings/sound/allwinner,sun4i-a10-i2s.yaml           | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
index 402549f9941c..a74b02387d8a 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
@@ -59,6 +59,13 @@ properties:
       channel. Pins are mapped to channels based on array index.
       Channel 0 is the first number, then channel 1, and so on.
 
+  channel-slots:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      This is a list of channel I2S TDM slot numbers. Slots are mapped
+      to channels based on array index.
+      Channel 0 is the first number, then channel 1, and so on.
+
   # Even though it only applies to subschemas under the conditionals,
   # not listing them here will trigger a warning because of the
   # additionalsProperties set to false.
@@ -164,6 +171,7 @@ examples:
             dmas = <&dma 3>, <&dma 3>;
             dma-names = "rx", "tx";
             channel-dins = /bits/ 8 <0 0 1 1 2 2>;
+            channel-slots = /bits/ 8 <0 1 0 1 0 1>;
     };
 
 ...
-- 
2.41.0

