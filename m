Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91FD15ACE
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Jun 2023 08:24:04 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f875b267d9so5950261e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Jun 2023 01:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687854242; x=1690446242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UR637DGW7U+8J1v52/3DiqPM0xg6ESr2sC1jjmXcP0A=;
        b=BLDWoUFtt3Bo7ljQfBO5wWhIJ0UQ+3mJWwUnIuj1QstxE8M9wCvdk6Jwe7Jexayq6s
         NOaJj0eh7j+IfOFIGatQd7NG8+2z5bbNyq0V19seJ+Umk7Tt+PnycA+dYggdsH58q6gq
         xRhpDRXCfASOONUgw7UqeoY+fYWrQzPqUlBScflYOUPXb4KRr580QFiaWzwOiWFMH2Bh
         41iGVHf4sWkdAkkC3onjqB8hNJ9kaS8Bp8VQc4K24+1xN+4qC3fVxiX9GzQmaSuMI6hf
         FqYY1+S8qhrDbuBaabF+blZVJq48f21E8x536x7kQSe00BMrkvxHzZ0/eAtp0L2f7J+R
         Yrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687854242; x=1690446242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UR637DGW7U+8J1v52/3DiqPM0xg6ESr2sC1jjmXcP0A=;
        b=i/I8y0GshRDn8566hJzNoDFJtwQT/j/NBdCZOuDul5v/pxz9W0UyH7pQ8QkaKX8TE9
         t1NwTBL34v+xYO4qG7rl3IJn03a1suiZ87nJsbBieRKTMoBV2bXSuYWfMgTOwC65yqxK
         Sd3kundQ91L1uCqCKvNFz6uqlwbmwvKOcBoINMDfx3B9YrqcYxJx/fuaCJJjfCjIOS5t
         /N5qdBpcgDsm50A59pGBwTzH01ybgPSB82tzOjZcNiZ1dvPCCKQdOSDqVBV6279kHvhQ
         wuBb850HYQLdkpe8ZMSwxIwWHcTwLF9zCbGiF+ssg8f6eQu3Lh6cwRv6LSqmViZeA0Cl
         D6Xg==
X-Gm-Message-State: AC+VfDy22+3MVwKYXGy4uLuIgWB7FNzC+XAbnV6PSzoWt8waGBBEr6Lq
	+UiIAeDBjbzbYEWRI9N+CA==
X-Google-Smtp-Source: ACHHUZ54diBm0xcGDbn6+u2ecv13BQULswvrHhNEltJ8WhUHoJS0f4ce4RpKx+kLppmCy2ddaOrRKQ==
X-Received: by 2002:a19:5057:0:b0:4f9:5396:ed1b with SMTP id z23-20020a195057000000b004f95396ed1bmr12121804lfj.28.1687854242296;
        Tue, 27 Jun 2023 01:24:02 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id i12-20020a056512006c00b004eb12329053sm1420673lfo.256.2023.06.27.01.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 01:24:01 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Tue, 27 Jun 2023 11:23:24 +0300
Message-Id: <20230627082334.1253020-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230627082334.1253020-1-privatesub2@gmail.com>
References: <20230627082334.1253020-1-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
controller witch is different from the previous pwm-sun4i.

The D1 and T113 are identical in terms of peripherals,
they differ only in the architecture of the CPU core, and
even share the majority of their DT. Because of that,
using the same compatible makes sense.
The R329 is a different SoC though, and should have
a different compatible string added, especially as there
is a difference in the number of channels.

D1 and T113s SoCs have one PWM controller with 8 channels.
R329 SoC has two PWM controllers in both power domains, one of
them has 9 channels (CPUX one) and the other has 6 (CPUS one).

Add a device tree binding for them.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
new file mode 100644
index 000000000000..4e6eaa18f342
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1, T113-S3 and R329 PWM
+
+maintainers:
+  - Aleksandr Shubin <privatesub2@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun20i-d1-pwm
+      - items:
+          - const: allwinner,sun20i-r329-pwm
+          - const: allwinner,sun20i-d1-pwm
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  clocks:
+    items:
+      - description: 24 MHz oscillator
+      - description: Bus Clock
+
+  clock-names:
+    items:
+      - const: hosc
+      - const: bus
+
+  resets:
+    maxItems: 1
+
+  allwinner,pwm-channels:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The number of PWM channels configured for this instance
+    enum: [6, 9]
+
+allOf:
+  - $ref: pwm.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun20i-r329-pwm
+
+    then:
+      required:
+        - allwinner,pwm-channels
+
+    else:
+      not:
+        required:
+          - allwinner,pwm-channels
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#pwm-cells"
+  - clocks
+  - clock-names
+  - resets
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun20i-d1-ccu.h>
+    #include <dt-bindings/reset/sun20i-d1-ccu.h>
+
+    pwm: pwm@2000c00 {
+      compatible = "allwinner,sun20i-d1-pwm";
+      reg = <0x02000c00 0x400>;
+      clocks = <&dcxo>, <&ccu CLK_BUS_PWM>;
+      clock-names = "hosc", "bus";
+      resets = <&ccu RST_BUS_PWM>;
+      #pwm-cells = <0x3>;
+    };
+
+...
-- 
2.25.1

