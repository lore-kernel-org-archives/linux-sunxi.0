Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22AF70
	for <linux-sunxi@lists.linux.dev>; Sun,  4 Jul 2021 09:24:20 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id v7so15098277pgl.2
        for <linux-sunxi@lists.linux.dev>; Sun, 04 Jul 2021 02:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ctPbpBSME4Wk2MPaV81CnmhuA+m0hProI1IntXJRC/o=;
        b=rFQn17qifWzHT2JAc5EbNAAM5gUKEO3zkypk6Ikt1di5LdTGaBOaYPKPvPYQKHCKvh
         y56kp4phrKzHPrRjNOFchg6oDbSLuucuLGnThcnPOBwnQLfmv5SxBbIdW+AOKPGHUKuS
         S4onIsh8ADY8K++Nutiq9F0MKhrqgtlkemT/9ZUBFprckKPxcrA4bHt6ooZ8qEgaDlf5
         2UcjMPB01bS74VVM4h/96TJLCBc9QyKAoAXziLm5PzWAX0AUtSx4GaKCboXToMcUu5Wh
         r8eKWkoUJt5NrPF+ndwy6gIOdtd/bF0gfwWCmSRfSus8Z4AcFv5KJlXF0mOcjQvdqavb
         19xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ctPbpBSME4Wk2MPaV81CnmhuA+m0hProI1IntXJRC/o=;
        b=Zlu11uCGtNDxFORCanPQQL3zGEkOdNE4Z8XTLUhP/xh2cCR3Pf4aKgRxNPyR1yUG56
         Dztxs1kvFMPfPqwTnjcOGAUi1Ss9lUYyVbbEMm5soCQxNRY1fcqtFuq32GGdlS+ow7o/
         YwT1maH3wX/744+gFOWCHN/M4Gu99A4FNVai9np611ZHJ/9tyqF/ynozBWDE2fm2Wv1z
         z2fyjk8t5eQTfNwakMkRMleKE6OK/b0YynChEyu+GHeET9OhQ5o+k7Fwnthud7go8N3t
         xc1N/topzVLudqq8JZb4hzhogt01p2WGe3F1U2COTNy9gAzKTu/4wNtrLptHt2CLu3Hd
         qOng==
X-Gm-Message-State: AOAM533xl3kYnWLzExYvJIijPiz/vD4iZlSjXhlQ8XaJLPbGfryVkIqd
	3fNrux0yAow5Hw3185BDeR17rPFnO9c7
X-Google-Smtp-Source: ABdhPJw95OVUnYnd1Oz/CSbTSFEictKjldcOyF0a5XSptSRDTQuHsji/68y46TdnR9WhtN5yeiDMMA==
X-Received: by 2002:a65:6a01:: with SMTP id m1mr9640133pgu.201.1625390660296;
        Sun, 04 Jul 2021 02:24:20 -0700 (PDT)
Received: from localhost.localdomain ([121.35.181.130])
        by smtp.gmail.com with ESMTPSA id v13sm18136526pja.44.2021.07.04.02.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 02:24:20 -0700 (PDT)
From: fengzheng923@gmail.com
To: fengzheng923@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	mripard@kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for DMIC controller
Date: Sun,  4 Jul 2021 05:22:51 -0400
Message-Id: <20210704092251.40734-1-fengzheng923@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

From: Ban Tao <fengzheng923@gmail.com>

DT binding documentation for this new ASoC driver.

Signed-off-by: Ban Tao <fengzheng923@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>

---
v1->v2:
1.Fix some build errors.
---
v2->v3:
1.Fix some build errors.
---
v3->v4:
1.None.
---
v4->v5:
1.Add interrupt.
2.Keep clock and reset index.
---
 .../sound/allwinner,sun50i-h6-dmic.yaml       | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
new file mode 100644
index 000000000000..0cfc07f369bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/allwinner,sun50i-h6-dmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H6 DMIC Device Tree Bindings
+
+maintainers:
+  - Ban Tao <fengzheng923@gmail.com>
+
+properties:
+  "#sound-dai-cells":
+    const: 0
+
+  compatible:
+    const: allwinner,sun50i-h6-dmic
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Bus Clock
+      - description: Module Clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: mod
+
+  dmas:
+    items:
+      - description: RX DMA Channel
+
+  dma-names:
+    items:
+      - const: rx
+
+  resets:
+    maxItems: 1
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    #include <dt-bindings/clock/sun50i-h6-ccu.h>
+    #include <dt-bindings/reset/sun50i-h6-ccu.h>
+
+    dmic: dmic@5095000 {
+      #sound-dai-cells = <0>;
+      compatible = "allwinner,sun50i-h6-dmic";
+      reg = <0x05095000 0x400>;
+      interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&ccu CLK_BUS_DMIC>, <&ccu CLK_DMIC>;
+      clock-names = "bus", "mod";
+      dmas = <&dma 7>;
+      dma-names = "rx";
+      resets = <&ccu RST_BUS_DMIC>;
+    };
+
+...
-- 
2.17.1

