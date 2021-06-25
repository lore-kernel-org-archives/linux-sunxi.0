Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BA76D0E
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Jun 2021 09:08:00 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id a2so7052176pgi.6
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Jun 2021 02:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=DgY/uA2fSmwxzscKqJL9b58zNu3n2nv6yZ9uNShIrNs=;
        b=gUKyO9dV8cptaXVWZlyd0CU3fRLnVW+pv0gJgJTU79nzWpC8B1BZLpwxryEwKqcuGu
         nP4vXT9rNO0wQAZYK7rCQlHMh/IDIhkl1qXpxWbWJrjSAoDHkyTu2W+/Z4Vwq/EHIEaq
         Z/sN9hmHln4OotyxLYgMpqgqKacEuKtXMAX2W0G1nkuHnilw1vTCh7Z6JaFYX2JMYse0
         lSlzFP6H6jUb9dmhygX9+UBL68YK6DDCZ+l5oz8dOIrEI2ToR6hr0jl8VgBwyJ4+FiVt
         iPzHYawZNyyUm/X1AocoCUhvX0PfBHXezBMs7reZtKQEJBR92O4YR/hvUtnrjSISCrk9
         5Ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DgY/uA2fSmwxzscKqJL9b58zNu3n2nv6yZ9uNShIrNs=;
        b=fC+5schAqSea8uEAZ146WuTCjweE4bopCIJHJDPRlAzDeR1suXprMF7niKcbJ2NbKA
         ZCjgG0aFGN5grvrGiNva6d6B1sCngfl5qjWKRpaguDgv6ab8s8ET+kyMzm0taw0RXxsz
         NNUo7gbfDekNRPPPO/QRWCX2WG5M3LEiuvUqk349Eu+BM0eo8vQaeOOBYWYLL2IY8/Z5
         R2jB7Q5FaCgyp+946gmyjSBNIUxt6Go4rGagVUFyme7UDZtOWQH62G8Hgb6Guyh1I0nJ
         rx+JOaXj0NRCCWhVYuY4SqZKyYQKy15mV9Y9fe3/m8OroySy+21tWo865CCrFrSWn3Pr
         g9fg==
X-Gm-Message-State: AOAM530qIsoVgEaIdTm94wMjrzRbOm8TGcmtIOR8Q1pDpw8KNPYvvkKD
	xVl4hEt7M0hbH3AUGO4cWg==
X-Google-Smtp-Source: ABdhPJxYeAIkRsA7qJaQpgBPopWQ6ZDT4WqnjdXVrD19KKTC7j3DhKE1WfmeaZp+sLUSj1CPkDsXEw==
X-Received: by 2002:a63:e04c:: with SMTP id n12mr8705624pgj.239.1624612079925;
        Fri, 25 Jun 2021 02:07:59 -0700 (PDT)
Received: from localhost.localdomain ([61.144.175.119])
        by smtp.gmail.com with ESMTPSA id m4sm10279142pjv.41.2021.06.25.02.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 02:07:59 -0700 (PDT)
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
Subject: [PATCH v4 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for DMIC controller
Date: Fri, 25 Jun 2021 05:07:21 -0400
Message-Id: <20210625090721.6183-1-fengzheng923@gmail.com>
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
 .../sound/allwinner,sun50i-h6-dmic.yaml       | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
new file mode 100644
index 000000000000..d9107685b78d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
@@ -0,0 +1,68 @@
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
+    dmic: dmic@5095000 {
+      #sound-dai-cells = <0>;
+      compatible = "allwinner,sun50i-h6-dmic";
+      reg = <0x05095000 0x400>;
+      clocks = <&ccu 101>, <&ccu 100>;
+      clock-names = "bus", "mod";
+      dmas = <&dma 7>;
+      dma-names = "rx";
+      resets = <&ccu 42>;
+    };
+
+...
-- 
2.17.1

