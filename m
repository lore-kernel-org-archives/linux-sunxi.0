Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84B028F6
	for <linux-sunxi@lists.linux.dev>; Sun, 31 Jul 2022 12:53:33 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id w17-20020a17090a8a1100b001f326c73df6so7775956pjn.3
        for <linux-sunxi@lists.linux.dev>; Sun, 31 Jul 2022 05:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=DzHtnkRBwr/rsgQJS9iswk379iAxgE7fvqZVo9n6FYg=;
        b=jgxy6pTTAixT/+kQZe+3dEJ+zjdXTWuKRz7BUhZ4TSC9T6MBVRU/pPgjHCq60jT8sT
         lH9Oaj90hKq7G5x/pSXBfCswSA+89A2vyC7tyfalNKYaLJSdmGns9qz1gK35RI1GSsDj
         272fV8u7tprRDbKyH2np+NT6KB1Eh87xdT0Bzgbo2EASpEDRdYfxgO5Tj8JN+J7Ji6tF
         aarKmpT8v8IXoEn0goLzUEUf9CC4We82QoiYklXObpzYItN/TDiQrYjb7IEtWcQ9BRkG
         xoFZUXUI4qR8Zzkn00JnUubJxeMNUtq3lWgpPtiiIs28bHrIRASjnHIGCYj8Ye7Gk0EA
         aD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DzHtnkRBwr/rsgQJS9iswk379iAxgE7fvqZVo9n6FYg=;
        b=wZd1CoBLDJhfoDvwR5CXx4YjwkXC/Ml1aRxGNfb7L/Sp980piuPcF5E56ko0dRoTO1
         qmM4xl8iisK4wXaaZ03EmoMaMeA7ZGBqSCSz7ScG6i9bl/HSNMpPKZHJMIKl6Z5MesWf
         2FVuNcAXWTCU8BRl0ecm70mohupUIthRHvNg0wc0t1E9PBDKgCJr8egm8fkJETWwuJ76
         b0XvQC4YK3BFJp8xghTN9fsvYKQD/SUepVkxpETAqQnrKLzFW/k/kFUyTW4eca9s1LEm
         xGMseRmWYW9F0rQBgrv6zelmx8Dphg5HYjTmuqsv5h2/fxO5zul1RQp+SBCU2Y20oetr
         G1kw==
X-Gm-Message-State: ACgBeo1JICeLg66Zblwd9w7GacewjNRFoozn6/ITYTHGjErxFOWNorrX
	puOdv7Ps10vYdycsLG/63A==
X-Google-Smtp-Source: AA6agR4QGkSx9ttNE71bEI1a8SsSn4uwmlWQ6l8tyVtPsC+7hgjVAX7l4rLsJ1cOgrpc9LjYka5wrQ==
X-Received: by 2002:a17:902:d546:b0:16e:c70c:fdf5 with SMTP id z6-20020a170902d54600b0016ec70cfdf5mr8711788plf.100.1659272013371;
        Sun, 31 Jul 2022 05:53:33 -0700 (PDT)
Received: from localhost.localdomain ([116.30.110.208])
        by smtp.gmail.com with ESMTPSA id r1-20020a17090a690100b001f4cc17b451sm3485818pjj.5.2022.07.31.05.53.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 Jul 2022 05:53:32 -0700 (PDT)
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
Subject: [PATCH v7 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for DMIC controller
Date: Sun, 31 Jul 2022 05:51:01 -0700
Message-Id: <1659271861-3481-1-git-send-email-fengzheng923@gmail.com>
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
---
 .../bindings/sound/allwinner,sun50i-h6-dmic.yaml   | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
new file mode 100644
index 0000000..185d3e4
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
\ No newline at end of file
-- 
2.7.4

