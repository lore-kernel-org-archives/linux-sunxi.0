Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CAE613F
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Jun 2023 13:28:23 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f8d2bfed53so5338215e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Jun 2023 06:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686749301; x=1689341301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b77Gx0dzvWdL2Ewt5vOqBtzy67fgg8OX+nEzj3LcNxc=;
        b=eGI3aVXPIExyJXocmigotKZcTTF+2K07Awv16Ea4pLVi1nZXq3IWbUSc62UAcRGWDf
         wfo3D/BRmZwfbThLYbHFSQ8fj3Rko+ILaamZ0O76grO8EiOqCv/Ri0gH6k496St542WU
         4DWeldP131+b7A7JWV6BEPATdcdBDMlHM1kNDo+/kxMUSFS8nIWI7REwDHf0xxTkp5Kr
         2RmPCacCTF7E4OQ3FD5LcdSnGXFUvi/IKHPbdJzmtM4VV2B+i6bqfKgDqBPVMu5vozfX
         T0RFmq5PoZuxJTPrbZWYm+YpNbHLjeSxBLA8mUbTUjQuB8Ye8ObY2v0IFYLOgUnO4S5H
         GDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686749301; x=1689341301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b77Gx0dzvWdL2Ewt5vOqBtzy67fgg8OX+nEzj3LcNxc=;
        b=ApH+1ChFtqJ3yjJOwTNxRnxoNqQA46Cf1/pYfAC3jePGF0jiQoXu+W7lEIUD7y5vYp
         b3Yih3vY1lXW/tJ6p6BVIOnrL3rtfXUFhaLI0oU4QWo2FHpsZcbfosZBUzLukU7dkMzh
         WH4zj6XmS+cgQ0NVxmR26v1jf1Av7aAit/0bD6ps2hYXZ5LbPRFY+KCAS6ZawmXOsfNm
         VrLMyJ2MZl5mlFQvCp1b/qvjpQajz35ZdU8dTccweEN3LAoQ8ARy/1tdtqTPvcEy4iNq
         VDAUJFQgO/bsaHrb4A7Ci5samkUVV5fUo/gA6lv6Nckj/wmopDznS8lW5rxpzL5vgkjJ
         ivlA==
X-Gm-Message-State: AC+VfDyGdU+vUPYy52I3/wsCMk0xnsnGbk9O95HkN2DWuXcroI6+kWqV
	gk5EKEXsHnG/ABRfuZaPy+U=
X-Google-Smtp-Source: ACHHUZ4PW5hwIltSw2AlRcUvhdSuuPFBq2RV2rxrZZ8MBHLc3PORtG+ybj3h2gADj3GHmqAWVGc4SA==
X-Received: by 2002:a05:600c:2281:b0:3f7:a20a:561d with SMTP id 1-20020a05600c228100b003f7a20a561dmr1619452wmf.8.1686749301236;
        Wed, 14 Jun 2023 06:28:21 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d4bc6000000b003047ae72b14sm18295017wrt.82.2023.06.14.06.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 06:28:20 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Haibo Chen <haibo.chen@nxp.com>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v6 2/3] dt-bindings: iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
Date: Wed, 14 Jun 2023 16:26:26 +0300
Message-Id: <20230614132644.699425-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614132644.699425-1-bigunclemax@gmail.com>
References: <20230614132644.699425-1-bigunclemax@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner's D1/T113s/R329/T507 SoCs have a new general purpose ADC.
This ADC is the same for all of this SoCs. The only difference is
the number of available channels.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
new file mode 100644
index 000000000000..23c584f5a6e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/allwinner,sun20i-d1-gpadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1 General Purpose ADC
+
+maintainers:
+  - Maksim Kiselev <bigunclemax@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun20i-d1-gpadc
+
+  "#io-channel-cells":
+    const: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+patternProperties:
+  "^channel@[0-9a-f]+$":
+    $ref: adc.yaml
+    type: object
+    description:
+      Represents the internal channels of the ADC.
+
+    properties:
+      reg:
+        items:
+          minimum: 0
+          Maksimum: 15
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
+required:
+  - "#io-channel-cells"
+  - clocks
+  - compatible
+  - interrupts
+  - reg
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun20i-d1-ccu.h>
+    #include <dt-bindings/reset/sun20i-d1-ccu.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    gpadc: adc@2009000 {
+        compatible = "allwinner,sun20i-d1-gpadc";
+        reg = <0x2009000 0x1000>;
+        clocks = <&ccu CLK_BUS_GPADC>;
+        resets = <&ccu RST_BUS_GPADC>;
+        interrupts = <73 IRQ_TYPE_LEVEL_HIGH>;
+        #io-channel-cells = <1>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        channel@0 {
+            reg = <0>;
+        };
+
+        channel@1 {
+            reg = <1>;
+        };
+    };
+...
-- 
2.39.2

