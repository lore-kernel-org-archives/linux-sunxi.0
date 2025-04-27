Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016381B423B
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Apr 2025 14:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745763922; cv=none; b=UnuxEs486Py+L3AhAn5OISTaBoK9RHwThqY/+H0ieEXiwy9e9uAvR5vMOGO+EVNeH6Vww17pTVLwWrIuxjSx/2m16FOdZFBMJsNXedlt7j5tugWoIDR2zW1Kdk32MYG3eGIup24O6mECTmT+A3SwfCLPs5h0fJy/YjpuGdGurJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745763922; c=relaxed/simple;
	bh=8R/7drFls+sUFj4bK9oIhMc0TsrE4kzlmhIGxIAwqCE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iMU6dyX7QAn0JoZg8wj0sC/Oqw6nZDobzoPZVwNyIt/qHb9MqhLXya4zq/CPPY2+DAEmO2pugYy7+JtDVzylCBRpLOG8QYXGnkX6o87LDjN19q5SqEOqY0jK3VrRN8FqFffHIzxlo4B+xQGzDbg/+XYr8CxRfBVBh0bRCjr0M2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzDz+Z8o; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzDz+Z8o"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso41258871fa.2
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Apr 2025 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745763919; x=1746368719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwcfEJKJXKQ5UF4yDTp+oj9WuQfkbNaZErmbidvOOm4=;
        b=ZzDz+Z8oTlsvg1ZXCEjUxV3z0qzUGMDBCnLmfe4OgAZ5oRZtC3l72iiq0uMfznt9o0
         eS+KJAsyAgZUJyrteLGqda3WE6CyoftHsykyGbHQJM7Dr87an8FZKWGDj+sAQddgc36U
         hHWJwBNMWHY2K+hHXG//Wk2v94OEitDeMRTK3NtwseOgmUhoeKVHDVjpnhDchnL26QLR
         Vbcp84/w9MdoSZYftKoJkprYNkBLIrbgiZwkHxA9DU7FRz3o2BG4XeviyZRr6RWTmSd/
         dQmexCrHYXqe3VkRsnGSEenJySzq+h6GgQt6l065hJDphS4IYRhPAPkwrPgY4D4Kd8/e
         DCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745763919; x=1746368719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwcfEJKJXKQ5UF4yDTp+oj9WuQfkbNaZErmbidvOOm4=;
        b=O3yhPE6d2km7v0dJZBCbh1xp9ChQiDWM4SXsItBuLOEUziYOq5DeIJYF0+YyVdCwqT
         VRg4R+neQ5My+umIEnHYPmtVFjbCzn/hBdgIvpNMaRXKr4vk6uLQni/BwWnmqI7v/AGy
         za/wpJpd7M59PNgz6ICBqHL9/Kv3YvfjLHdaSpy16zmC9Dxsjl0wjJdRsNw6lwFXb/4S
         siiUKj9E9v64u8XjOj0U8jCLq/wUWHkRYWIQHe36+kOxp4+MFJTlCra57v8CGCWEU3SL
         KDDgOM7M+/b9D+fqo7eyvIvJtMMVwl1uk9JZwSTc3faqu4zW7T2+NOs38f34eUz832kw
         Px9w==
X-Forwarded-Encrypted: i=1; AJvYcCU0V74Zyp6GzKKQ7P7iPe2Tdaj0OBtbmHc2Dv1YwlVujrynNedw6iPPu4rE0X360T0VlwfEvzVTzYUP6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa4SbrTK5lN3BUfx+PmdR/KC62wQF24z6TcBPsV33Guk4PW1L3
	OycucLlU/zlwb8gjdorJNQ/PNs5jN3M129XDGUfZaiNIkEyw/mQ=
X-Gm-Gg: ASbGncsKYeekGnUh0R6EDz7i/mNYe2q86OppoFs0QjdU6tHfNgxVYc54cJAGN+YeWFk
	Y3cRNi5xkGhDn+WoVLUN5AWm8heyMI9AgaSaQEguiaT5wKDan1pfACqjAQwiMbIPjTUs2wZyuAJ
	Lsk7fgKkGEPJ/hLskDcZ/rgonLHOn+olWdujpFDpN/BX/j7epbi137spIQZvI+pa1xUr+mbi0HK
	waO5M7NfPxfFL4JF4WSlk5WOmiYcgGWez/GES5x1FrG06qziCf4MLxFPGx2DssXSboltRPBC0uo
	6HWJXYNjOw6f8ZyKLKCnHpY94YMVLEXsSsbVvwXte3gH102Q2b8HaVGw
X-Google-Smtp-Source: AGHT+IH40FyLml70Ii4+KAHoqq8gBUgCUu7aKtYSu3EIPb7DPGagejX7iuNwaI0UDK2ngyYpGXmoyg==
X-Received: by 2002:a2e:bc94:0:b0:30b:f42b:72f6 with SMTP id 38308e7fff4ca-319dd1c2407mr17109731fa.32.1745763918681;
        Sun, 27 Apr 2025 07:25:18 -0700 (PDT)
Received: from localhost.localdomain ([178.176.177.108])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cfb482b1sm17659191fa.29.2025.04.27.07.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 07:25:18 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v12 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Sun, 27 Apr 2025 17:24:53 +0300
Message-Id: <20250427142500.151925-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427142500.151925-1-privatesub2@gmail.com>
References: <20250427142500.151925-1-privatesub2@gmail.com>
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
new file mode 100644
index 000000000000..4b25e94a8e46
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
@@ -0,0 +1,84 @@
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
+  - Brandon Cheo Fusi <fusibrandon13@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun20i-d1-pwm
+      - items:
+          - const: allwinner,sun50i-r329-pwm
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
+      - description: Bus clock
+      - description: 24 MHz oscillator
+      - description: APB clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: hosc
+      - const: apb
+
+  resets:
+    maxItems: 1
+
+  allwinner,npwms:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The number of PWM channels configured for this instance
+    enum: [6, 8, 9]
+
+allOf:
+  - $ref: pwm.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-r329-pwm
+
+    then:
+      required:
+        - allwinner,npwms
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
+      clocks = <&ccu CLK_BUS_PWM>, <&dcxo>, <&ccu CLK_APB0>;
+      clock-names = "bus", "hosc", "apb";
+      resets = <&ccu RST_BUS_PWM>;
+      #pwm-cells = <0x3>;
+    };
+
+...
-- 
2.25.1

