Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43786210C2C
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Oct 2024 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728642525; cv=none; b=t5myRf4tCirXXciyyqDvyKLYfoxQD9qS2yR/uFLIg3TENlu7pt8rp14wJkMk6dnEEr8sWwfVRmCMnF0g9ElRYgTieCHio2ANZRH04cngS1cS06WlVzXcULJxlS1S2Rhiit+CcDmhQlHcLevrMJzy12JUJV5V6C/1SlMYSgYCAO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728642525; c=relaxed/simple;
	bh=N+Zbm7Fm7DDc2Ynl23djjTgsVJ0SADNhJ3fgDS+rKOw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YJZ4Ea4xQrTQFr6h+VJG0g6ax6sWuPUtJw06Ng/xsFhqv3pyGC+LclTq2VQHcsy9AfTilycWx6r2FLsWsjiWdbirPPdD2yTe698MW7rRYU/EOyQqTKXrAl75aPuC2TJ4aFxYly4hXDR5ohSz4XfgRwwqYD3R/0VJcxn65U3zpzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EO9Dix48; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EO9Dix48"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539908f238fso2290228e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Oct 2024 03:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728642521; x=1729247321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DNNq24d7mxFNOs2ke3D1b/n+xhRg9qtLvnTihNfsp0=;
        b=EO9Dix48zLCICwe8Y6xP/Sv3srDofLEwYso7cB3EKtSFemgZ3qEzAH5ikC3ODGJOOT
         1n/F9dr5Iokys+oQgNHyVXGvSnhKsBGYxLY+K5AyQWEOQjByjoeDXeBpfLWE+xw7B41q
         HW2TAmzEUXkKDlW0Bwku23YLsjatGR7pfKl6qNJOxvd0m7XYlOaTvu0HrlejxdnNr8F2
         HkgD7TmNPMzOzZ6OzXCdJgxe2qAmVGwK9Eg1mzBzaB62rUbCt6EDx2GcNEqpCEbaCsyB
         vV/e02bvqNvEzHRru9ena4KfD2T/eIVLX7bwPKgGOabMGOu8QARcuZUr6bEyFJBZA0d9
         J/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728642521; x=1729247321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DNNq24d7mxFNOs2ke3D1b/n+xhRg9qtLvnTihNfsp0=;
        b=MKL8hSHJcW2D90oriLtMaoRaAOY/7eu5xYA4b6rsAb5aMer4qIs3vUgevJ/HrnARmR
         2CFGd6jhcuWOThjY3Qp7OI9Ph0KmvCWnFSOmCVq9wDINP4gjmsW8F8j27pe144njJWhB
         7WQFxbwGT1/NE93lYDI7M9EOEFiVnNXqD4elVY7jjZ+LdVbiaJVEpVKKDNFNAEHnXnzR
         IbRpKs3tBDEMkTEZlQAgOhdF2iR4KbtrIqE3FjYwcxgWmuLh0kjAD8nKCSj5C92c1RAH
         gzvrAN29qxO1AeztRfMiQSaLHAo/caXZNcZrj+zuIVzuklQi907SFr1IK9/wYnJA8mZH
         iPdg==
X-Forwarded-Encrypted: i=1; AJvYcCUCq3JLVpX4P15wSaC89nyWlXHY+heBU2UxxomWhQwW6x6Hjlj/oKBnnsQPjteMFdXweqMx8qcr7Ta3CA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVHCCMEhYdRZcJrsMRc3GSOUqBlPZB4Pqwuc5tGeAuRMVdYBXO
	sXCRPGUbEmvyaYyIQ2UyT9u5MQ4MWw9MtyBcmxXXf/XgsXPq3TQ=
X-Google-Smtp-Source: AGHT+IFMNNoCDYF8m8Ghh38lXDuoCreUYDVAlm+aLxYvwQYlU6YMgn3EwdgcqNDHaUz7gFkp3wfTew==
X-Received: by 2002:a05:6512:1109:b0:532:c197:393e with SMTP id 2adb3069b0e04-539da3b2351mr1172966e87.11.1728642520999;
        Fri, 11 Oct 2024 03:28:40 -0700 (PDT)
Received: from localhost.localdomain ([188.162.200.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb8f1003sm552534e87.233.2024.10.11.03.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 03:28:40 -0700 (PDT)
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v10 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Fri, 11 Oct 2024 13:27:32 +0300
Message-Id: <20241011102751.153248-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011102751.153248-1-privatesub2@gmail.com>
References: <20241011102751.153248-1-privatesub2@gmail.com>
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
 .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
new file mode 100644
index 000000000000..89cebf7841a6
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
+            const: allwinner,sun50i-r329-pwm
+
+    then:
+      required:
+        - allwinner,pwm-channels
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

