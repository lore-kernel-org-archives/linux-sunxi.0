Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A210107A4
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jun 2023 15:44:17 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f122ff663eso4634682e87.2
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jun 2023 08:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687189456; x=1689781456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aL5sq5Lugahi7hv9X9W+s9NTZzWQgnxxieVUqmZWN4k=;
        b=VlMXwrYDrcRTxXvQ1Ol2PWCQ2fyrtvbAqE/t+vlPR8747qVBGnU5d9Tv/hKHVIuXJA
         7SaDhGQx5zaACLBAc2UyuvIFoyMZJSERYb4Nu+OOUxbKKViBqRmJ5lb8tibqiWq//7xV
         ajhMtYeXWaV0YPrvL0SWxYanEs8/7JT5gxpCbIqjZtrQ1oBBm/VycFQRjMcMZsK/U5+F
         jJT0lpx4HrEPZJDYZH9PZzRtZPb25jnF1WjgL/V08hsoN08ppO/WBak4mHw6Mo+OkPtU
         C7CXB394fmNmkMvPB6p2PS96XcTYrmlpCtwoqpTk8N1VxqD5fBrZQ7GbyULFHIA/4wTz
         O0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687189456; x=1689781456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aL5sq5Lugahi7hv9X9W+s9NTZzWQgnxxieVUqmZWN4k=;
        b=kqJ9zigZaNlNTDUL8GOuVAcaqjGFyOM5ygs40E70ZVf6fbbw5vL6nrWxcP/kG2fiGG
         kzDpK+QOGqraxh7wQZxqoIHaoK7+380vPdy08UQxTxFAeEuoGFpkZf2erFcDlTjxS+hq
         mKJD7A0V8Rdjn8LSqEyCzzcBSgKRHX/rbVVgOcKcWnuvchUr+qFswZBhBquYXCM10RuX
         AWUKogGPwsUm7LeCTc0hrRpjswu1rnhO0glAzz3aG/+ZPTw2NkpXI6yuz7FPxRIhC4yD
         Fq+lNrifHaecDk5yUtwgNoRIE/o+5HjU9czivNnyY9BoA4JBYr9q+MFSK5IJne+WvcjG
         uk2A==
X-Gm-Message-State: AC+VfDyvkLVkUf+q8l70IamVVyhygZB+s3rVe0lmx6JRlSmKoxXVCzvY
	bMByzjZWRNv3M86HdrebCB0=
X-Google-Smtp-Source: ACHHUZ4Dv4HGN1j4+laQB9t9R+Su/3+4i4db+7e5rU0DHCTVsgQKOUMFnDc/XZKjypM1PqixorU7ig==
X-Received: by 2002:a19:790a:0:b0:4f8:417b:c752 with SMTP id u10-20020a19790a000000b004f8417bc752mr5353354lfc.44.1687189455711;
        Mon, 19 Jun 2023 08:44:15 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id f11-20020a19ae0b000000b004f85e53250bsm1207144lfc.191.2023.06.19.08.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 08:44:15 -0700 (PDT)
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
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Haibo Chen <haibo.chen@nxp.com>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v8 3/4] dt-bindings: iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
Date: Mon, 19 Jun 2023 18:42:26 +0300
Message-Id: <20230619154252.3951913-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619154252.3951913-1-bigunclemax@gmail.com>
References: <20230619154252.3951913-1-bigunclemax@gmail.com>
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
new file mode 100644
index 000000000000..7ef46c90ebc8
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
+          maximum: 15
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
+        reg = <0x2009000 0x400>;
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

