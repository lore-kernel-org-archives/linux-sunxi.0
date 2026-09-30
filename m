Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC763380FEB
	for <linux-sunxi@lists.linux.dev>; Wed, 30 Sep 2026 15:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783334; cv=none; b=ldW9KtGyGNVPYFMAGfzw2ryo7HcC2xNGGpfgnFfH3JtjNpWODvTpcocXmf0v5u3+2Rtj/T7CF+TUknNsRQBNvvyTxMtL+xLopKp4Jm2Z7yWx6/Lc1yT2ZHGJ23478DFbXwrBmjR8pKtX5gg4AiJoFdXA75f2PZHuNoSrFuRgb2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783334; c=relaxed/simple;
	bh=8hfxOJPdIcGIvY3nw8uhTRifk/anp+VB7FLMnAUGf+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KgzJ/YXepswlpANZizxhJDj0Rlu9eFo5ygm8r3NM74qGzwgh624i1dWleEB/Iwv2xgskyDwBjj7X788M9f8EfNTBTL5EGk5S1O5t2Cl9tzCAlyU6+2dZ6u5NY0lVRPbRqGOu1/5FMzIezG565Y4esut+XAlS0fq+wmH1yx2eUH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=LF/b6qFU; arc=none smtp.client-ip=74.125.227.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="LF/b6qFU"
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3a0aa5e2b20so1745111a91.1
        for <linux-sunxi@lists.linux.dev>; Wed, 30 Sep 2026 08:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790783327; x=1791388127; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RylIL5PtKoKSEB6fKFx6teI8foZIXlgeBAHnwrC12eE=;
        b=LF/b6qFUxRtT0voyae23IyAgbROgcqf2YKnHE4VU8g55+rtnwjGt1bTmx5EqerlfUa
         VVuLaTlTGQiWYL2TdiW7CGK+RzVTGhmUUdRBfnZQlxjF/1GXoKlMtg7NTbhL965DqXxN
         Vrf9oCUCQsz25uiXkYs3Wo4UvDzHDxJfxIG9IPDCS07mP7HXJHmnVrHfOM5oOvWXCkTM
         r5Bv9qd1Awn6dJHbumNCAhS6F8dpUrHsXKHPGymeea4sapKtrRk/fyd1AkPMSsFX7mJE
         g5CVga5Qtgwf2bHQ+w2spBHxPpZobLra9OWwIsqwwG/pvDI9zw8KgNYjJ7kNmFXkIkzg
         yF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783327; x=1791388127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RylIL5PtKoKSEB6fKFx6teI8foZIXlgeBAHnwrC12eE=;
        b=HCFEWAMx6/yvq1CEpBpCNvAMIVHH2TetuJ0zMdPK1zUJCYMEAiz5dTnwqL3qQRQs69
         ImSupbvy1X6Qlgay0OfFx/TFfktCuVCFTwVNErC2294uJfRD15biJO4Q89U+YqOvHtOE
         cRP6EUhwnLb24pdVNQ57emzXsF323tube0zCknrzQHEdpFVf7HpDPcVUHRIoM2jyHqLL
         EPxrEyjYU2gExi6YyHCTaQRe3XsCN9gD+0FmN5baYORe60cZXDi6E2+S13kZ9EolMt81
         1AKTMi8sTzD3SycTSFrznXyOLZrt093+E8CodsuFBLJZ9gECXdsCQiwpoCos2aUbwpAJ
         GwOg==
X-Forwarded-Encrypted: i=1; AKwUvBwoMRVeAS510mP2x2WkgkUtdPjeBM5kMF5JaCeN5/dF4mM9bfJC88oi8qXQMPdEvM9MorIebo744rBW1A==@lists.linux.dev
X-Gm-Message-State: AFq9FYIJJgYDYSnmUjp/8NtjW4OoCqIatwgcNzRSd74G1PpV+1wR+G+e
	sF24MRCAD95u8lpfPj0hH9Fp39Nam8CnTmrIp4cqv6OC1Ut7xSyV1Tw6535/8dtZDSu/
X-Gm-Gg: AYBFou0kIiPWih+WUpqL8bu1rSLDoEvfSP+ojpHw0XICfCltEOsalaqeXP1lRxVoMb1
	lI4IbXq8/H8c5M+NzJF7YfhNDhVplq+lrhHxwjfIqf7yLnl2XPnCsV1mxIAWg6N05JiCH3FQ+gl
	xaNV+z+cbJhJJUqYvzuxbTg7r/vSrw0pSnUFilzmHqt7qiLi2wWRbmKFJ8GReIw9/crq9OfjdjP
	4DosMgZOfWISJ8ChMvI5wdeqac9gdjxBoLWke9C48RQEk4w0Kq3CJ6SUzaOQA81FcFLSds0Qkjo
	5K5ByG5Z5Ka8uce2w9I0nPKnobj16Hjy5rMLKXUNvAaF0tcckS6Z6fwDAIm8NCXJoqakjCLlKrN
	XSX/7TOMok2vF4fMaoa/anuJQrwMYMor8LsawuUkpepvxLEhXAQbHLvzzdH1rBSJsKJVs/zwBJd
	V46aIX2icxlcYTWmc6uDkojfYiml1ytK5OuzfYYxi13iBMVndTL564mGoOf7zGAdHcBPfBxVJvL
	JvztTPl
X-Received: by 2002:a17:90b:2888:b0:3a2:b465:fb8a with SMTP id 98e67ed59e1d1-3a4d1ddc911mr1860992a91.67.1790783327152;
        Wed, 30 Sep 2026 08:48:47 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ee4d0af2sm308136a91.2.2026.09.30.08.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:48:46 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: media: Add Allwinner D1 CSIC
Date: Wed, 30 Sep 2026 22:48:33 +0700
Message-Id: <20260930154835.402684-2-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for the camera interface (CSIC) of the Allwinner D1, D1s
and T113. It is not the A31 CSI: its parser and DMA engines are separate
blocks. Only the 8-bit parallel input is pinned out on these SoCs.

Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 .../media/allwinner,sun20i-d1-csi.yaml        | 111 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml
new file mode 100644
index 0000000000..2bfe2cc9af
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/allwinner,sun20i-d1-csi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1 CMOS Sensor Interface Controller (CSIC)
+
+maintainers:
+  - Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
+
+description:
+  The CSIC found in the Allwinner D1, D1s and T113 receives video from a
+  parallel camera interface and writes it to memory. It contains a parser for
+  the camera bus and two DMA engines.
+
+properties:
+  compatible:
+    const: allwinner,sun20i-d1-csi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: DMA engine 0
+      - description: DMA engine 1
+      - description: Parser 0
+      - description: Top-level block (CSI_TOP_PKT)
+
+  clocks:
+    items:
+      - description: Bus clock
+      - description: Module clock
+      - description: DRAM clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: mod
+      - const: ram
+
+  resets:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    description: Parallel input port, connect to a parallel sensor
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          bus-width:
+            const: 8
+
+          pclk-sample: true
+          hsync-active: true
+          vsync-active: true
+
+        required:
+          - bus-width
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun20i-d1-ccu.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/sun20i-d1-ccu.h>
+
+    csi@5800000 {
+        compatible = "allwinner,sun20i-d1-csi";
+        reg = <0x05800000 0x400000>;
+        interrupts = <111 IRQ_TYPE_LEVEL_HIGH>,
+                     <112 IRQ_TYPE_LEVEL_HIGH>,
+                     <116 IRQ_TYPE_LEVEL_HIGH>,
+                     <122 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&ccu CLK_BUS_CSI>,
+                 <&ccu CLK_CSI_TOP>,
+                 <&ccu CLK_MBUS_CSI>;
+        clock-names = "bus", "mod", "ram";
+        resets = <&ccu RST_BUS_CSI>;
+
+        port {
+            endpoint {
+                remote-endpoint = <&ov5640_ep>;
+                bus-width = <8>;
+                hsync-active = <1>; /* Active high */
+                vsync-active = <0>; /* Active low */
+                pclk-sample = <1>;  /* Rising */
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index f5eff489a8..f4c45c4678 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -905,6 +905,13 @@ L:	linux-crypto@vger.kernel.org
 S:	Maintained
 F:	drivers/crypto/allwinner/
 
+ALLWINNER D1 CSIC DRIVER
+M:	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	Documentation/devicetree/bindings/media/allwinner,sun20i-d1-csi.yaml
+
 ALLWINNER DMIC DRIVERS
 M:	Ban Tao <fengzheng923@gmail.com>
 L:	linux-sound@vger.kernel.org
-- 
2.34.1

