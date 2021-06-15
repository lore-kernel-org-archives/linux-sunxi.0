Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCAA2FB8
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Jun 2021 13:07:44 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id p13so13257225pfw.0
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Jun 2021 06:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B6awZixPEBIc1khaAEYvB0eLqjgA3TvS8zRyCjLVg8M=;
        b=n7x038lnwlPdOc1w4l4gFub8lJPwPclJPWsYqMy1Wc8MbjD/zVwvxANPeRHHjVosGh
         0dVfYRasW68lEiiA7i0f/fdIigTDl9Nj/D3O8zZ7E6W76uH3SXj0bMB2tYcFEAA/yWPl
         1L7C6HpLQJ5Rj80ZWdANpc+nccdfD9Ai8XIxrp2+w/2rHFZ1UVbiMLeAA6oEV7QluYWl
         CziCGByCjnhSp4pNfuZ+8TLMh4AHd+JPzFXYYR7pIsNd8QxzlBhBK/K/NDuYByReGWZq
         ha21WkCl0P8csN/DrnXO4QNBXtIJpsj4C6+tQB/txwpBD3vxXnKt9xvxoBMGuPK3liu8
         YZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B6awZixPEBIc1khaAEYvB0eLqjgA3TvS8zRyCjLVg8M=;
        b=bKN5Tcp1OsOxhOwfRWTJt9sJByi2T/PVkpsHEafVEOUvkp6MUKdsdbzyaH7fIr1I0V
         KSIRwINlpWZaV86UNwkC65JBfeNDGhHgNhuWsAE+NodsmM1hgrqsbRN2NduYyKzah2b5
         i2cLQpwV/3aBQqnkKkYZrzhqaounRHcnNc2xLHseMyq1+ywqZSdtiQs3oiHEgd2wf0hb
         NKJ/kWN/HgB9N4ezIysucp1V8LRS312hW4z5z+PKH4Uf9c8+jnKFuOv01fkNpitUD6y1
         DpI9M/INybieOaPZA8f/4kC+Me/zl4HZIQyOmTVsk5btLRtgHdS3rXT5MCM1J5gEgn7i
         62aQ==
X-Gm-Message-State: AOAM533QXbcoDNQV6y76Rmgyy1M3CzHn6MguVlhaWKsxXlJUnxnrUn2M
	aO7N+4vspQazmJDVQzDtIQ==
X-Google-Smtp-Source: ABdhPJybqEKw7feR8dYi/lWxFb3O2c8qqo8a+8pYqsq3Gq2My0PZ0nz16HwDobhs4XvfWtt4mW2bYw==
X-Received: by 2002:a05:6a00:1a41:b029:2ef:9721:879e with SMTP id h1-20020a056a001a41b02902ef9721879emr4352418pfv.74.1623762463956;
        Tue, 15 Jun 2021 06:07:43 -0700 (PDT)
Received: from INTERNET-129.allwinnertech.com ([223.197.233.48])
        by smtp.gmail.com with ESMTPSA id s4sm15218877pjn.31.2021.06.15.06.07.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jun 2021 06:07:43 -0700 (PDT)
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
Subject: [PATCH 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for DMIC controller
Date: Tue, 15 Jun 2021 21:07:37 +0800
Message-Id: <20210615130737.2098-1-fengzheng923@gmail.com>
X-Mailer: git-send-email 2.22.0.windows.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner SoCs feature an I2S controller across multiple SoC
generations.

Signed-off-by: Ban Tao <fengzheng923@gmail.com>
---
 .../sound/allwinner,sun50i-h6-dmic.yaml       | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
new file mode 100644
index 000000000000..81d40c374e44
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/allwinner,sun50i-h6-dmic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H6 DMIC Controller Device Tree Bindings
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
+      - const: apb
+      - const: dmic
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rx
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
+    spdif: spdif@5095000 {
+        #sound-dai-cells = <0>;
+        compatible = "allwinner,sun50i-h6-dmic";
+        reg = <0x05095000 0x400>;
+        clocks = <&ccu CLK_BUS_DMIC>, <&ccu CLK_DMIC>;
+        clock-names = "apb", "dmic";
+        dmas = <&dma 7>;
+        dma-names = "rx";
+        resets = <&ccu RST_BUS_DMIC>;
+    };
+
+...
-- 
2.29.0

