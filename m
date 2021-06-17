Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E15471
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Jun 2021 13:10:12 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id k15so4969020pfp.6
        for <linux-sunxi@lists.linux.dev>; Thu, 17 Jun 2021 06:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UOFgVdq99sW7T1eG1SUViNQCGmp0W3yjcis3mlNBZoU=;
        b=skyBd/9Dm0thru78YAtGmq+L1MBQ0RUmLGkFEkX1EZEbMRT/LDpNvljdVdFxpsTn3N
         FHZVRTubNZfKAO7tbCe3n0D1zA6EJyKbbpfuTVHMUC7RKW2NBMf/N0Jj7WkK3L2Hr5cy
         npad/1H5s8g8JJ8HJ5WUwDBuy9Rr25DSbjnhmRWdjEwtwLjagbLbRu/SkC6YXcyvcihz
         H9hmpaI6FoS60/ak5RirHYtQGd6m67pQT+/c8xXGCrMVcd8VlCEWrFcw4hmx/xToku2k
         H5QpPJNf0++ZFzYfZv4HihmbzG32Fs4cN3tj92SioJAg+zjT5BsEEfP0YYCBmI2zK0CS
         zarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UOFgVdq99sW7T1eG1SUViNQCGmp0W3yjcis3mlNBZoU=;
        b=FLIpzSpYzjGt7isS57C3KC4vBkZYEU+ElxR+SU2E4LIKoZ5z9BW7h5oXZy0psKQc89
         lcsgqWUzkx69KYRg6NHX06Ux81NrUL1S6BMkdbticCjWTINx2diLqyeyoLeAh89Td3Xh
         wH6NU4iS+8SNK75yrhbg3C24ABGWkf5CNg7G8RbliqPrLUvBYxZUIg6XynTxuj7aavpz
         3iykr8u9WinldNdZofdXmlqdWupgDdLE79xVv7JzssMWhq5QYOLC7hUAY1JAHl5x+v2h
         5W/Qsy3pN00CFqd19bYN5zOPC4XwET78D5tqMpW0fETsRAR4Ax7S/5S+50cUyC0g5RHb
         eKAg==
X-Gm-Message-State: AOAM53315XWokMDIKYXe10HzCmwIuDPddSpBywEEHckpVix0RvMBL9o0
	G7faQCV9wcwzj5e+eos7rw==
X-Google-Smtp-Source: ABdhPJzSgU/A5ZxjBlB9fG4bdYO+g/gurotFxuMeO7UShx88LpKXdA45n8aWt8qOFxjac6QNRWmcCQ==
X-Received: by 2002:a05:6a00:1994:b029:2fe:c076:8359 with SMTP id d20-20020a056a001994b02902fec0768359mr2941921pfl.24.1623935411872;
        Thu, 17 Jun 2021 06:10:11 -0700 (PDT)
Received: from INTERNET-129.allwinnertech.com ([223.197.233.48])
        by smtp.gmail.com with ESMTPSA id a15sm5426754pfl.100.2021.06.17.06.10.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jun 2021 06:10:11 -0700 (PDT)
From: Ban Tao <fengzheng923@gmail.com>
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
Subject: [PATCH v2 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for DMIC controller
Date: Thu, 17 Jun 2021 21:10:05 +0800
Message-Id: <20210617131005.2416-1-fengzheng923@gmail.com>
X-Mailer: git-send-email 2.22.0.windows.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DT binding documentation for this new ASoC driver.

Signed-off-by: Ban Tao <fengzheng923@gmail.com>
---
 .../sound/allwinner,sun50i-h6-dmic.yaml       | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
new file mode 100644
index 000000000000..d7af66775e86
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
+      #sound-dai-cells = <1>;
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
2.29.0

