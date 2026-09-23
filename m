Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8107B403EB9
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 20:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194991; cv=none; b=r4vVLEfBm3Agoq+9OnqZ+gGqwX3INEDvLTNdOKiOVDGkPbI/lajGF12Nmbe5WCGYSGY4Zt+kTOTsVBhY+wlp5pWLsttSvxvKQgHE1oufENxvjdzMfReh5NyGZ6h+bYwEuP28Ois0yRVBmVNPjmrlgfYviygHqARVu5Et1gizIjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194991; c=relaxed/simple;
	bh=hYDoDnMsKfc2K4l73QX3mfc01djD0ZHm4lyFuIhD2tw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blQEMdsvp+c20PbRnTUUKJPQsyU5XsPR/o3TNz6/fAaipA6CvQzGEIirb52gl1qYRjOrHtYxxaWs9zJd5jWVct3xDQeCs9Blj0iIlB60MJNvCa0EbpfUljL+NlnDNDny5lVK1pdV1now9feLZbKyuUCjFmV8lmbvtNKpODWVx/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOr/p2x2; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOr/p2x2"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so225517566b.0
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 13:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194978; x=1790799778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XihgTCn3FgUBl9p3rY1vgcPErnbpNQs2ORgadSRzkUA=;
        b=pOr/p2x2LMS/WCSeXRJA5szcGcQeKnclxsBeMobX6YOkHN5khf8HuGuZwx5dUoqYft
         d9tljI5M3YWy4MJLDnebIQpJBdPcQb1wg9ZV1Tm2vXRKekzdsb6duU8iu2IN89JyjnHR
         v3J5GOdsb/3CaShZi7tzj/sCL5YuCYk9iprzQVwwOpADF5lViJCh1Vpx55r6JrQzAbNG
         sr8s5BlGg/XNCA2nEMJkunyPHO52Z3sAx0m5nXd82A68jQHHXBvfpfcW/Gmpf53m0fpn
         CoxU6Xf8tZJqtgOp6CLUyalBOPTugjOI0dc1QGHbROsq4zWnezd7GWc6FmOpVOu9DyEq
         paiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194978; x=1790799778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XihgTCn3FgUBl9p3rY1vgcPErnbpNQs2ORgadSRzkUA=;
        b=agc7yc9YgoSXPxqyKPrAvymHJ5zmECkf25osfFk4n6+RKMnuQbDE+721Sr93HdE4HT
         jxsa+8JhOEZvM1OWyTpygLm1XNatbsGBQvWP3IImjY94uTHuJAt3mT0ibU068JVMR8Dc
         JXcGtsL/aevaVDavdRCu8GwaD30up1b49Yd8GUx2OQVVYaNTATgH6x/aPZwoOMgpMLGt
         5vGKnEZ9ce1sA21ij7wku2BoYM3gJ/pbbGSemQzudkBK8zIDEHSefzopENkAsWqYaOV0
         h2G24t5D6MYg+RlVvWV/ixGaixiDTA3Cm+/WnuHwjdqKBXBsMXZpEM6lWliutW5wUtL0
         omuw==
X-Forwarded-Encrypted: i=1; AKwUvByHRBsxariA6pLiqyzlsaG53eBfvWpKGFmFoDPG+qIFTLLa31YfHpxuByh4GOeIjwwlGVq+p08uJRrSBA==@lists.linux.dev
X-Gm-Message-State: AFuF++kWjtbhvdNyIh40PJL5V1Bvb/amdIxepuWsRp10l+BQqOeZVLte
	oZWqYC7i4MDDHCoZq/X4REouQbM6ml1mR75zUaEisQ9D+IG0z55y//T0L6miWIRDn2A=
X-Gm-Gg: AYBFou2qYhee8ugCJ0fe5INAkiTH0BB8G9UrLJO5yVAKEHeq9BIS4+Ywi68B4jZfDJN
	rIdqBu5TJ1CIZak7cDgLUejvSKbuxa4LGAQSuh+d01gx4nadHpzPkH1ktgybAvQbvGWOK93mw+Y
	5To+F2ZirlYZkCWhe0G+VxwzUkk4ariHT7HIlP6fgitbB99s53O4Oauq01ynUXlcoD6U5K4xFx7
	9uf9qqTlKcZOyWhNXTjGIL7kHUHK5qFhAdJ0wwCSEjv0h/aIRF3BpeknaZ7ZhwlhePzF3zUFnmp
	/NHeRfcK9nF2oOhF/obmeThlkgAbWIeaZJ2aUfJ6AHnnKXxO3uR39PZL/R11uYTwfdaRnZAxOB6
	BQW2fLDZnFJL7MMVL6YoPbTytsd0c+86da7qnikFcLOB2E4jVmAy45N1WsPd00KvyHzeWLll62r
	8l/f3QgSxJD73SOVylwL8LVCs9h7X3tpxujJjCBasEIZ+wFiPI+ioqBta01rHD3Ow+J3+9OQVTt
	uP+RWu+OmXJERhoPi4o+dU6FufB8UQYXnlgd2Ggqekn
X-Received: by 2002:a17:907:d24:b0:c24:b11a:470f with SMTP id a640c23a62f3a-c2ac2106076mr27276466b.0.1790194977830;
        Wed, 23 Sep 2026 13:22:57 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:22:57 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 03/11] dt-bindings: pinctrl: add Allwinner B288 pin controller
Date: Wed, 23 Sep 2026 21:16:53 +0100
Message-ID: <20260923201701.43391-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One controller at 0x01c20800 with four external interrupt banks.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../pinctrl/allwinner,sun8i-b288-pinctrl.yaml | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml
new file mode 100644
index 000000000000..806da97ab708
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun8i-b288-pinctrl.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/allwinner,sun8i-b288-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner B288 Pin Controller
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+properties:
+  compatible:
+    const: allwinner,sun8i-b288-pinctrl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      One interrupt per bank of external interrupt capable pins.
+    maxItems: 4
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: High Frequency Oscillator
+      - description: Low Frequency Oscillator
+
+  clock-names:
+    items:
+      - const: apb
+      - const: hosc
+      - const: losc
+
+  gpio-controller: true
+  interrupt-controller: true
+  gpio-line-names: true
+
+  "#gpio-cells":
+    const: 3
+
+  "#interrupt-cells":
+    const: 3
+
+patternProperties:
+  "-pins$":
+    type: object
+    $ref: /schemas/pinctrl/pincfg-node.yaml#
+    additionalProperties: false
+
+    properties:
+      pins: true
+      function: true
+      bias-pull-up: true
+      bias-pull-down: true
+      bias-disable: true
+      drive-strength:
+        enum: [10, 20, 30, 40]
+
+    required:
+      - pins
+      - function
+
+  "^vcc-p[bcdfg]-supply$":
+    description:
+      Power supplies for pin banks.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sun8i-b288-ccu.h>
+
+    pio: pinctrl@1c20800 {
+        compatible = "allwinner,sun8i-b288-pinctrl";
+        reg = <0x01c20800 0x400>;
+        interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
+        clock-names = "apb", "hosc", "losc";
+        gpio-controller;
+        #gpio-cells = <3>;
+        interrupt-controller;
+        #interrupt-cells = <3>;
+
+        mmc0_pins: mmc0-pins {
+            pins = "PF0", "PF1", "PF2", "PF3", "PF4", "PF5";
+            function = "sdc0";
+            drive-strength = <30>;
+            bias-pull-up;
+        };
+    };
-- 
2.53.0

