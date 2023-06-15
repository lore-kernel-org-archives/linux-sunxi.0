Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2412F125B6
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Jun 2023 14:44:53 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f649db9b25so10564371e87.0
        for <linux-sunxi@lists.linux.dev>; Thu, 15 Jun 2023 07:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686840292; x=1689432292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01rML8QNhx1meW63X7YOChbwA/I11tVl46mShxzno8c=;
        b=pvA/+HLk8vgyap9cUCFXxWzeUdNPB9Ek2np+gXBneOchgcRWdGUWKuRKGNmicfLkYe
         nZmfLMgNIp8JoSlcrocdAVKe9CJ4b+2qcF6UJyPJuVcHgivOfeCZ5ZxczOmUbI0r4v3v
         nsuRvyqRzSdalni1iFMt1adUhZZ1MyfTVKmQPX/GseW1tjDCDMprOVtMZ9CJQ2IbY81+
         Y1zZKj2Yisrge/IDvfWds0v5868fQ+zTWWQpeU13l64gIRQYJTx4+XkSiLxR87/XyA8O
         juOlTX8a+vBlj3qzIIU4zQJ9UdlN0lJLv69VnMZm9rAy7oHxRNrxZ1tMn7OyG+++oFp/
         hOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686840292; x=1689432292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01rML8QNhx1meW63X7YOChbwA/I11tVl46mShxzno8c=;
        b=WVDFBF7yzTukd1+ldlIiu899/b0Nk0EUz5MFELnE5yg3uwEr4lXuYwFBC/sv8tYJgV
         2Aw37jtZCT/O3DsG841SzB57y7ogLo8S3qAORMwDtDX8ud6S+j0weqAT/XezdL7mw8gS
         Da+cxIhKWSWr3EbHRj8XKLyp2na56WsxzsYCqKuadYzVGwp5Al2PsksYDyut1x8/CWb3
         nUagJMib3iGcP1JSUV1pYCLX90E4rZ2rZ9OxVlcxs4uz10y5CrYZvwRMgFZ5L7ypv6mJ
         QcMcwjCHC0low6otoLUlgwiyaEgvsZtnmQZP+4PYQ5QpcErdQ/apNF6U6j6gYIMqtA2B
         669A==
X-Gm-Message-State: AC+VfDzPtO9OKjTvcFOzT7BUDtiPudJxEI2lz0JzKNXKCbmjNBh2EsEd
	IfrxcLyyNVsWSr8mu9naOA==
X-Google-Smtp-Source: ACHHUZ6/hm0iRAbwO9RB4MJBdUYxGo5Dp355lzxZq305nEDV93dKD4eDiVGsuSNkZv6TfnO+Lpc3Qg==
X-Received: by 2002:a19:641b:0:b0:4f8:451d:d2cf with SMTP id y27-20020a19641b000000b004f8451dd2cfmr1301114lfb.69.1686840291885;
        Thu, 15 Jun 2023 07:44:51 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id h7-20020ac25967000000b004f13f4ec267sm244451lfp.186.2023.06.15.07.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 07:44:51 -0700 (PDT)
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
	Maxime Ripard <mripard@kernel.org>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Thu, 15 Jun 2023 17:43:56 +0300
Message-Id: <20230615144423.828698-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230615144423.828698-1-privatesub2@gmail.com>
References: <20230615144423.828698-1-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
controller witch is different from the previous pwm-sun4i.

D1 and T113s SoCs have one PWM controller with 8 channels.
R329 SoC has two PWM controllers in both power domains, one of
them has 9 channels (CPUX one) and the other has 6 (CPUS one).

Add a device tree binding for them.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
new file mode 100644
index 000000000000..e5f9cb2d5c4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1, T113-S3 and R329 PWM
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+  - Maxime Ripard <mripard@kernel.org>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: allwinner,sun20i-d1-pwm
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
+    items:
+      - description: module reset
+
+  allwinner,pwm-channels:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The number of PWM channels configured for this instance
+
+required:
+  - compatible
+  - reg
+  - "#pwm-cells"
+  - clocks
+  - clock-names
+  - resets
+  - allwinner,pwm-channels
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
+      allwinner,pwm-channels = <8>;
+      #pwm-cells = <0x3>;
+    };
+
+...
-- 
2.25.1

