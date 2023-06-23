Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FBB8BF5
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Jun 2023 15:09:28 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b45c289615so12810531fa.1
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Jun 2023 08:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687532967; x=1690124967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmK+X4w2JDt7glvIU2n/9UBwkvorFsOPkeHF1PBbMl8=;
        b=IvRKddzWyRQyw+xwk6MbNTRvVVi6IFdH2WsOzX+v3ReY4ucJBb4bLNrbjUhLcD2bda
         5f/r9BDmvzWagtNO5tiXRcvFWZh48Yj+Gt7YKGwB808wB2FXIWpSylNrLR4Gq3/GmWEY
         VtdQXQaS/TbbvpRjBv878UBY4h4Ac0+OF997CbjGLi+iCwFxhzYXrTbugiIglF5Cj8Qc
         QR+Sb262sKTcY8bUWBZwePGJ7WleW8EzJqQDoAq6lrUYusjpGQDCHVCXzEpjAgJgGfLR
         17ylwWzxLL6KrEfnh6JqARk14YqWkARMEd09K0fvqZQG1qjgebcssghv4/D/WLRIBP3r
         yBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687532967; x=1690124967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmK+X4w2JDt7glvIU2n/9UBwkvorFsOPkeHF1PBbMl8=;
        b=In927S8dX4+rvXl5fS5eqKSXW0QftfMl+9tzCP1w0RlkZ18pGIW17VKvAZny/zwwI5
         M6fDxcBrZPJakpDuc6BoKJni7jVGYBdxulChb+gxwqnXC7pskdji/cqDj13iyfGkwthE
         049eqHHrZhP+cnDkqah01A31luD8LPyu+i03wF4YqE0I+WX1UvviMGzyhpezNTPTJSmP
         pu4m360J5dl69vG2jmK/0MN6x1ihZ4nW2VqT6RPL7TrmL1es2YuN9j/JA2oI74BVP2BD
         MdKI0ZoxmWX+HxdlGtaKTxAvNiCtvdZEj58YKZ8rxiw+yq1gWyVoyfkbLnFPU9KIosNV
         3uDg==
X-Gm-Message-State: AC+VfDzZKsepGUrkNL2y+7R1n6JribsbM6jkiABxlcQeAG52AfOgo4NF
	P7DKXdLsM76NmuGGYQzPaQ==
X-Google-Smtp-Source: ACHHUZ4LoRzy+5sPqE6JMcDN0cDwn0H/zfZeH27FdWAx8idJttRwTlF340WczYLJbLH4AGq9ZAjRmQ==
X-Received: by 2002:a19:384a:0:b0:4f8:5637:2cd0 with SMTP id d10-20020a19384a000000b004f856372cd0mr12315046lfj.26.1687532966416;
        Fri, 23 Jun 2023 08:09:26 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id w25-20020a19c519000000b004f842e58d08sm1465686lfe.84.2023.06.23.08.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 08:09:26 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Fri, 23 Jun 2023 17:59:59 +0300
Message-Id: <20230623150012.1201552-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623150012.1201552-1-privatesub2@gmail.com>
References: <20230623150012.1201552-1-privatesub2@gmail.com>
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
 .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
new file mode 100644
index 000000000000..eec9d1dd67c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
@@ -0,0 +1,83 @@
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
+    description: module reset
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
+      properties:
+        allwinner,pwm-channels:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          description: The number of PWM channels configured for this instance
+          enum: [6, 9]
+
+      required:
+        - allwinner,pwm-channels
+
+required:
+  - compatible
+  - reg
+  - "#pwm-cells"
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
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

