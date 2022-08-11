Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAC53222
	for <linux-sunxi@lists.linux.dev>; Thu, 11 Aug 2022 14:52:44 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id 17so7762590pli.0
        for <linux-sunxi@lists.linux.dev>; Thu, 11 Aug 2022 07:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=DguZisXeggmcnodf9rWUz8dzLtbapr3DGYXX0AfN5WM=;
        b=jgKPpn3DQhYyGQu4S8TmtKiJN6q16/RsGdTOp4TGGsmd2qWDcpc1T276lrRPpcIamm
         RKtiksUIsGP0mpiFkcKWhJbCjPjOhc3CU5QfSVf5eK1Qudnl800D8zhyMkflY/fusYJb
         qopMypW/QSXnGNuX4jAOspKijWpTApfZftWhr6rok60/jy9/QYpAVc0RCIQpWKCW+RTz
         GadcjtRvdRqEQcYbajfM2RZIscqGOfgH/3mm4WzqPOn1JuB9iVdPc3cslBrO51tzY83O
         cGETDK964/JSTKqquiHFN9Zk7mYIfhOEhjfboBYQth9L5K30grhOpRDSBRb+5MZhcy2f
         9vtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DguZisXeggmcnodf9rWUz8dzLtbapr3DGYXX0AfN5WM=;
        b=gPa2lCpkmOf/odaYr9/4KDfgyfT2uwd7c2FfHSlc25vnioapx1pbg5JZmIeYjOU81r
         BoUG3Np67T7ggDlZIVEN0hy9Ro79KLTqWT+iVH911MEmBMgbJ0CEOaoSY9IH/rdB9KCf
         yvap5CYNOHw/+RGWU+6ao/J26hJ7vix484RYRgwNljgS3noL71t4C7XYTxnQ7618ngbb
         ibj/EkhmQJEALcLbTYNcn2M+9TGDzITwjwqPRZTLHdZSoaDPa3OcFAs6P+rZMRSFvjz/
         tU/jx4S5oXECyfWwCthN/P5YwRA1ZUz626OVklNqUlaFioD/MH1YBZxWTzwqGxJl51T5
         EtUw==
X-Gm-Message-State: ACgBeo0fepwi39Gwh492xh4hp6KB6eXG1brV1SgPGXMMDiExiZHx+ZGX
	ZYcKnC1dANZsC4khXBzeLQ==
X-Google-Smtp-Source: AA6agR4bItMMhS9eAFSfaBaDda5yHPWfGM6CGxHDWRY14bkP/YSdATf6aRaBayvvf8Xeb+0BXucshg==
X-Received: by 2002:a17:90b:4b04:b0:1f5:2da0:b2f6 with SMTP id lx4-20020a17090b4b0400b001f52da0b2f6mr8940766pjb.195.1660229563750;
        Thu, 11 Aug 2022 07:52:43 -0700 (PDT)
Received: from localhost.localdomain ([116.30.110.209])
        by smtp.gmail.com with ESMTPSA id h8-20020a63e148000000b0041c30def5e8sm11597757pgk.33.2022.08.11.07.52.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Aug 2022 07:52:43 -0700 (PDT)
From: Ban Tao <fengzheng923@gmail.com>
To: fengzheng923@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	alsa-devel@alsa-project.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for DMIC controller
Date: Thu, 11 Aug 2022 07:51:31 -0700
Message-Id: <1660229491-15068-1-git-send-email-fengzheng923@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

DT binding documentation for this new ASoC driver.

Signed-off-by: Ban Tao <fengzheng923@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Maxime Ripard <maxime@cerno.tech>
---
v1->v2:
1.Fix some build errors.

v2->v3:
1.Fix some build errors.

v3->v4:
1.None.

v4->v5:
1.Add interrupt.
2.Keep clock and reset index.

v5->v6:
1.None.

v6->v7:
1.None.

v7->v8:
1.Fix some build errors.
---
 .../bindings/sound/allwinner,sun50i-h6-dmic.yaml   | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
new file mode 100644
index 0000000..0cfc07f
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
2.7.4

