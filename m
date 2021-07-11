Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A20370
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Jul 2021 12:49:20 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id p14-20020a17090ad30eb02901731c776526so8717837pju.4
        for <linux-sunxi@lists.linux.dev>; Sun, 11 Jul 2021 05:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mIxSmufWuDTKwlxgFXvm/s5Rjq6omybGQ7A5dLknTx4=;
        b=B1hyEQpkq0+TBnqVNyJV0dgFXD20LT36fA/k3KQPRS3hUE/zFKjBiCGUuGL6mzypy3
         hVqvKg6k7Kxh4uLv7XllrVeMs6/ZW9mmVFINbSGM2lAwUCQT7279OIen1pVwVymJvow/
         nuV6+Hah+K5vel9DXkerdfpirZnewPI68CKv7OoMFIb6VOAA7L+t73HvRjbS5I4YHROZ
         /N88JZBxtJG6ZS5CLw9kirsAEj0MGHT8dwucIdCfZtrUqZIAGXzLcXOgJZn/EUZnStEH
         iYrOoOyV2tNrNvmJjb9Y/A8NTCdGZP7elTZr+1y9CYiK32J1NfZA8ZNyMIQz4MRHsTWX
         hLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mIxSmufWuDTKwlxgFXvm/s5Rjq6omybGQ7A5dLknTx4=;
        b=c3t5LK/KedtNkBF+o+7lNu7JApzc1z5GD5oPR2QXm9zJ9wWTPMnLhi6+yTdoCRSiw8
         tsIYFQdU+nMSXLwgvdXQsumVmmXwUaQxZV/V3UVpLOwS5J262ci4TAsp++yo8fVqgPNE
         RT+TNMQ2cbPijS37/PPjBbWrT2dBz9eXfSIAEkX5I/E4O34AjkVDHNRRnYiXqyqmJfwQ
         njCq/Dp0IDUCGKPBg3G2zbDKXsmkY7iV0k7jiA2mD1vcDvPgV771Eds7yh82Org5dTtQ
         lORH5p3cwXd/6uHzA5mQJzxxEwHrzyqeoVpZ94WE/0fFCpiTXiDDuPaG8J/0m/Z/E+le
         VczQ==
X-Gm-Message-State: AOAM532P4onoUY39BZGQeS6loqUjg4AvTP3vZYpCo2AOEjjVgUGK0zM/
	vjpgZ0BMzt9KMRjcs7xV/g==
X-Google-Smtp-Source: ABdhPJxvFbvViX+F8Vrs22jIs658qzk0Elx92cNANGF4OQD9QFj1l6fZgMamKh9cIhVwhNlshf2Jew==
X-Received: by 2002:a17:902:a50f:b029:11a:cd45:9009 with SMTP id s15-20020a170902a50fb029011acd459009mr39227014plq.38.1626007760610;
        Sun, 11 Jul 2021 05:49:20 -0700 (PDT)
Received: from localhost.localdomain ([113.104.213.237])
        by smtp.gmail.com with ESMTPSA id pj4sm17717343pjb.18.2021.07.11.05.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 05:49:20 -0700 (PDT)
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
Subject: [PATCH v6 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for DMIC controller
Date: Sun, 11 Jul 2021 08:48:26 -0400
Message-Id: <20210711124826.5376-1-fengzheng923@gmail.com>
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
v5->v6:
1.None.
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

