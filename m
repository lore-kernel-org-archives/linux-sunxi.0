Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F9E79DA6
	for <linux-sunxi@lists.linux.dev>; Wed, 31 Jan 2024 12:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706705990; cv=none; b=QWpcRuouARDCGNKkzn+aY7Qj0LvH3RUDF2ashh7H1X/XO5edxJ5uPg2aQXY21gGfBnS3sB/6rDeyPzZgw4xdKsjC1soqhe0f/Wp4KLo8uubD8zcuKV+hcI0fhcYyePFEjALoTORK5MwreA3fZcL7niGMRhNSirSotFA6ogkFlAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706705990; c=relaxed/simple;
	bh=aLyVaR3VlTqu1yreTEdjOgowwX3EMmNbGcznpWFuzsA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L4SWdscYdqd6k+SrR85RqozqFWRnVwGAo+xd4bL77jQB1og3yMauyIpQtWMbYDHs9Wt8TZU/sveLybguMr84wIjt0AzXl2x9x2xBBFwI1T7zI/DDnCdB+Fs0W2klqUbbi8WEjSrvHl4CCeE96dvdgLFQ1Jdsf34bPc9u2e/KqCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxDMirMu; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxDMirMu"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5102a877d50so5820713e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 31 Jan 2024 04:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706705987; x=1707310787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAfvNX5JYKiOP5F5+HHWWQpkc2VYumz0VDstxq+2dC0=;
        b=VxDMirMuQarou6ftpVWZHtYIDVRF4DFSXrR6oJWZS3K+WmB4JRuUANyKJyRiDstBcj
         zWhsMF3Dfs7tBpftloFTLT02bszic0gTumHmov0cbljv2NV42+yztKP/tu/zYaeJi1rP
         nzEe3V5I4FEZ2zxiKC22uATHk/tdDhNWS/bkH8/pJSCAN9snOY2JRnYw7oAUBbP8JnsK
         4mWScYgIIkzpiYc0pwaUY7+1SI8a/zZmvNK30JGm0lODZiBY0Y7F62Nm1Oz4uTzmKLYn
         bnK7/MXZ+NpjUv0tWsHaLWh2plC3zq/xDRE6EGyt8pkET++NleHFNqqqwWnaCxm2MPA9
         uaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706705987; x=1707310787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAfvNX5JYKiOP5F5+HHWWQpkc2VYumz0VDstxq+2dC0=;
        b=wUHMZy1DF3cluZlWSGetaqLSbybVJIg+BAFxosDpHLZYm2iKOOshewMzgHqQxUCOfq
         YFXg87DCkVdqb71A/dEwbCEjmt4EmgjXluwaTqw+sP6I2GrDzAXEA5riM7mwusPRZE7M
         8pVHMa0CYVM1Q/FqHfkCfvbLlnXb4/PSayw8d2GoaSlKFyxk19jOKzNwZM2sXaE+ZziO
         qhCl2NHxgGFcJg2EoBwYy8VJfDxP02iSjf6u+Qbf0WDPPyhO24XLxgR/0MybAm16vhbj
         G+8LlXwcTctaXNq26r3OvxzgDvwtHPaOrGhsgKytCeLtfKcL1uaDFxlugAIAyVNgB5kz
         zJpQ==
X-Gm-Message-State: AOJu0Yxn7qMBF00EnYtWN9s5lkhtKsAp8uEkfItrcVI1AfA0DhZUai2z
	lbetNqt9rAHFu/nTl4hVj8EnqK9KUNlM2700CzxrXqO4Wf8KqxE=
X-Google-Smtp-Source: AGHT+IHozbh85wcnYCXZXYDLJCLM9XGLrWwtHro3SkQvoxBuxVb086cAn/J1lYCBdkXRqYub3zJ7qw==
X-Received: by 2002:ac2:4950:0:b0:50e:9355:a24b with SMTP id o16-20020ac24950000000b0050e9355a24bmr1003200lfi.22.1706705986343;
        Wed, 31 Jan 2024 04:59:46 -0800 (PST)
Received: from localhost.localdomain ([188.162.49.60])
        by smtp.gmail.com with ESMTPSA id h25-20020a19ca59000000b00510faaa62cfsm1361135lfj.222.2024.01.31.04.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 04:59:45 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
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
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	John Watts <contact@jookia.org>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v8 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Wed, 31 Jan 2024 15:59:14 +0300
Message-Id: <20240131125920.2879433-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131125920.2879433-1-privatesub2@gmail.com>
References: <20240131125920.2879433-1-privatesub2@gmail.com>
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
new file mode 100644
index 000000000000..716f75776006
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
@@ -0,0 +1,88 @@
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
+      - description: Bus clock
+      - description: 24 MHz oscillator
+      - description: APB0 clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: hosc
+      - const: apb0
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
+      properties:
+        allwinner,pwm-channels: false
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
+      clock-names = "bus", "hosc", "apb0";
+      resets = <&ccu RST_BUS_PWM>;
+      #pwm-cells = <0x3>;
+    };
+
+...
-- 
2.25.1

