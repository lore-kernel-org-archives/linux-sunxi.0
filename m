Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA673C8731
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Sep 2026 22:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788733862; cv=none; b=MA/P2ICbiNYfj6eylbU96Jn3RkSMeWKuLupxrW4ikLufcjP2KClT3z+k2atuqMUeIBuCbNlCgSVwHtDtrXIS/df/9VYBm/ae+rRnvlAaIQ7OYyAyVRAUn60BGk6MnsSaw+a2/I4kgSK0HqPonE9Dm9VjwBznm9LAp+kF+56tWPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788733862; c=relaxed/simple;
	bh=OGsCagdTQ+zJAJGqKzDMI7cJBz71EXy5YSri/vMsPgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nQ3QX7tV9id+uP4HUaWDFtJMEUG3Vc44MfgAI+VdRTlOjbTranCTQg70rp47nVs3+yCeed8lPtKb4mIx546KSxSoFTFn0YmaCV19hEw9vnIUkOYQkleDxmuZR3KGqAc+mu1o/MJFpnCzblkrBqdEO043VQOcW+SJyjRUWANmDUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7mvTQDJ; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7mvTQDJ"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4a45b3f0becso2158681b6e.1
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Sep 2026 15:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788733859; x=1789338659; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CukfHUjzOJRi0Y8QjR8TlAI+njW1u2VLACWncIjF8WU=;
        b=U7mvTQDJz0VqSGYgBh49QSgNx1rNB2HbxCyGxnDEzNuJcPhC/8V+vQnm8EpSMK4uls
         mRAQ9rcXoDNRGy82nuWRh241A96CsYcBTIJHz7vtsG+75ihErVJ+EPwk0LosMJYeIReS
         UiD3dvOsB33hKqKROvjA9YDQP250mB/ZMPaKYd0LLh74E/9BhjTPfwH2diBZCL2MI7Yd
         qiQfMOpOPmXuDyKUq9/j8wsCy2LU03v98060YNQPsf+SLH1SMd6A5bCvF328TKi7cJH5
         Xu6q5CXIs0iK/EcLDIn+99RWvJAC3+PgrjN0IdDI9mXNxJH2A3vdLBSpIXUTAw5d3kdn
         zEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788733859; x=1789338659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CukfHUjzOJRi0Y8QjR8TlAI+njW1u2VLACWncIjF8WU=;
        b=W2F0FmCLtiLqnnZNfRpYDrnCqgIQOsmBuRJOb+UZEHLwlmOOmsAbcAR33Q9flWeuuK
         UaHfkz26cpYtUxtgLH2NulgA0ehjw1/ZyLjAey+ZSD73Ibgg4EQzcG0l+mm635+Dy1Vd
         QNssAYeWBzgYDW+9sU3LevXOKYunQDocGDFpnPU/LefRcyZln+BWK6nxB+kMhpQUtr2J
         MPLraB9Kc4EBJB1Qi3dvQGGmjTVNDSIaJQlupX2twKRjde0CZvfWqfzJfKX4Cbeva35n
         J1ZL8vELy7lroriVRCOgvPLK11Yxf/oSXue/XMlkOitdRv5cOt6A9KSBOl566NXLDPby
         RA8Q==
X-Forwarded-Encrypted: i=1; AKwUvBx01h2mO4pHPz+z/x96+5fztRBbgEHdWu9tsgtmdd53zZGABzmLkAdef1kmKxm6JFG8HIE59xu1eXSnlw==@lists.linux.dev
X-Gm-Message-State: AFuF++niOV85sic1C6CrqsAbxXonMuRa1+pJKsTsIDnWZyruvmDTAr7j
	FVBq23POSQKJKM8/70Pi3A+kb4UahnQzne8tGo6/Ycu2TToxLqqnsrny
X-Gm-Gg: AYBFou1EAtQc+GmUMd3BmnVp6yWWzEyYkInwEGNRfZEdqBT3SbYYfSLDMc/TbybkxOJ
	pBlCXdsW+E12BrndcrvSoG9m6zng9WNrn5QtX0D/GTfrSzSrohoni1ZhNmI2d/vYc4k00KE7Ihl
	VizPS8E2DyRMEoIZ3dq8YXzxCCoUtVjZQGeQiUgp1JFvoK7SNBoSPAHOzSAoZuD+HvIzrCyToHe
	JFsrO5hwI8UWRdLSSkSbhdy6+FlINPOTEeKQbCybIAK9uMIMR8R+YnBGfa7I/hrrMIL+K99YxzC
	Vex8UrmhLKqwl+d8G2iZs/oWNIvkwl/nOYvSjQss0U8hj6WNTCq5LIE+/2Y055Fq947sp/aLKAo
	q66SR/ZcQsC7bjAwlUS9LbXyISBFyzNLBXEJe7T9SittmKW7NIVar60WGFGF3/Ovikc44LBlFPE
	41HG2RGrpRnJhZC8e7N/hbC+pnQkMIXitZluMA8tuCWYaX//b/7Jp5cmPTpgr47IPUaoz9aMb0U
	vXmIStWNnkqmltN5Vqt+HqThxQ+Ao2LP/9x0bOHbrIxXnWbOKQwRFnHaJEkc5y2fLchmLnvKzg4
	2f7slOWXRR/MmPELTrn0wIWFB/lSCvBAIyfvCGstH1ixvyzgA3+oZwpfTqFyH9+JhDNx9x59hZs
	j+T5DT/1qpwaQh0mVdws=
X-Received: by 2002:a05:6808:e8c7:20b0:4bc:3b8f:2a38 with SMTP id 5614622812f47-4bc3b8f4076mr1825276b6e.43.1788733858893;
        Sun, 06 Sep 2026 15:30:58 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b970d200fesm8701910b6e.3.2026.09.06.15.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 15:30:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 06 Sep 2026 16:30:46 -0600
Subject: [PATCH v10 1/2] dt-bindings: mfd: x-powers: Add AC200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-submit-ac200-mfd-v10-1-f522e8dc2bd4@gmail.com>
References: <20260906-submit-ac200-mfd-v10-0-f522e8dc2bd4@gmail.com>
In-Reply-To: <20260906-submit-ac200-mfd-v10-0-f522e8dc2bd4@gmail.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 James Hilliard <james.hilliard1@gmail.com>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The AC200 is an I2C-controlled mixed-signal companion IC containing
audio, video, RTC and Fast Ethernet PHY functions.

Describe the parent device and its shared input clock together with the
audio codec and TV encoder child nodes. Keep their analog supplies on the
function consumers and describe the TV encoder display graph and optional
bandgap calibration cell.

Add the shared interrupt-controller properties and interrupt numbers used
by the TV encoder. The Ethernet PHY is represented by a PHY package on its
MDIO bus, with a phandle back to this device for access to the package
control registers, so it does not require an MFD child node.

Keep the INTB connection and TV encoder interrupt optional, including when
the TV encoder is enabled. Cable detection status is readable over I2C
without an interrupt. If a TV encoder interrupt is described, require the
parent interrupt domain and its upstream connection. Include examples
with and without INTB connected.

The input clock must run at 24 or 27 MHz when the Ethernet PHY is used,
matching the rates encoded by its documented clock selector.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 231 +++++++++++++++++++++
 MAINTAINERS                                        |   8 +
 include/dt-bindings/mfd/x-powers,ac200.h           |  13 ++
 3 files changed, 252 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..0f2e6922fc4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,231 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/x-powers,ac200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 mixed-signal IC
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+description:
+  The AC200 is a mixed-signal companion IC containing audio, video, RTC and
+  Fast Ethernet PHY functions. Its control registers are accessed over I2C.
+
+properties:
+  compatible:
+    const: x-powers,ac200
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      AC200 input clock. When using the Ethernet PHY, its configured rate must
+      be 24 or 27 MHz, matching the rates encoded by the documented EPHY clock
+      selector.
+
+  interrupts:
+    maxItems: 1
+    description:
+      The shared open-drain INTB output for the TV encoder, Ethernet PHY and
+      RTC interrupts. Omit when INTB is not connected.
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+    description:
+      The interrupt number, as defined in
+      include/dt-bindings/mfd/x-powers,ac200.h.
+
+  codec:
+    type: object
+    $ref: /schemas/sound/dai-common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: x-powers,ac200-codec
+
+      '#sound-dai-cells':
+        const: 0
+
+      ac-ldoin-supply:
+        description: The 3.3 V supply for the audio codec LDO input.
+
+    required:
+      - compatible
+      - '#sound-dai-cells'
+      - ac-ldoin-supply
+
+  tv-encoder:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: x-powers,ac200-tve
+
+      interrupts:
+        maxItems: 1
+        description:
+          Cable detection interrupt routed through the AC200 interrupt
+          controller. Omit when INTB is not connected. Cable detection status
+          can also be read over I2C without an interrupt.
+
+      tv-vcc-supply:
+        description: The 3.3 V supply for the composite-video DAC.
+
+      nvmem-cells:
+        maxItems: 1
+
+      nvmem-cell-names:
+        items:
+          - const: bandgap
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: Input from the display pipeline, carrying CCIR656.
+
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: Output to the composite-video connector.
+
+        required:
+          - port@0
+          - port@1
+
+    required:
+      - compatible
+      - tv-vcc-supply
+      - ports
+
+    dependencies:
+      nvmem-cells: [ nvmem-cell-names ]
+      nvmem-cell-names: [ nvmem-cells ]
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+allOf:
+  - if:
+      properties:
+        tv-encoder:
+          anyOf:
+            - required: [ interrupts ]
+            - required: [ interrupts-extended ]
+      required:
+        - tv-encoder
+    then:
+      required:
+        - interrupts
+        - interrupt-controller
+        - '#interrupt-cells'
+
+dependencies:
+  interrupt-controller: [ '#interrupt-cells', interrupts ]
+  '#interrupt-cells': [ interrupt-controller ]
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mfd/x-powers,ac200.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mixed-signal@10 {
+            compatible = "x-powers,ac200";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+            interrupt-parent = <&pio>;
+            interrupts = <1 20 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
+            #interrupt-cells = <1>;
+
+            codec {
+                compatible = "x-powers,ac200-codec";
+                #sound-dai-cells = <0>;
+                ac-ldoin-supply = <&reg_aldo2>;
+            };
+
+            tv-encoder {
+                compatible = "x-powers,ac200-tve";
+                interrupts = <AC200_IRQ_TVE>;
+                tv-vcc-supply = <&reg_aldo2>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        tve_in: endpoint {
+                            remote-endpoint = <&tcon_out_tve>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        tve_out: endpoint {
+                            remote-endpoint = <&composite_in>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        mixed-signal@10 {
+            compatible = "x-powers,ac200";
+            reg = <0x10>;
+            clocks = <&pwm 5>;
+            /* INTB is not connected. */
+
+            tv-encoder {
+                compatible = "x-powers,ac200-tve";
+                tv-vcc-supply = <&reg_aldo2>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&tcon_out_tve>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&composite_in>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..1b1dd57cc419 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29504,6 +29504,14 @@ F:	drivers/net/wwan/
 F:	include/linux/wwan.h
 F:	include/uapi/linux/wwan.h
 
+X-POWERS AC200 DRIVERS
+M:	Jernej Skrabec <jernej.skrabec@gmail.com>
+M:	James Hilliard <james.hilliard1@gmail.com>
+L:	linux-sunxi@lists.linux.dev
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
+F:	include/dt-bindings/mfd/x-powers,ac200.h
+
 X-POWERS AXP288 PMIC DRIVERS
 M:	Hans de Goede <hansg@kernel.org>
 S:	Maintained
diff --git a/include/dt-bindings/mfd/x-powers,ac200.h b/include/dt-bindings/mfd/x-powers,ac200.h
new file mode 100644
index 000000000000..cc59e2ab4912
--- /dev/null
+++ b/include/dt-bindings/mfd/x-powers,ac200.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Interrupt numbers of the X-Powers AC200 interrupt controller.
+ */
+
+#ifndef _DT_BINDINGS_MFD_X_POWERS_AC200_H
+#define _DT_BINDINGS_MFD_X_POWERS_AC200_H
+
+#define AC200_IRQ_TVE			0
+#define AC200_IRQ_EPHY			1
+#define AC200_IRQ_RTC			2
+
+#endif /* _DT_BINDINGS_MFD_X_POWERS_AC200_H */

-- 
2.53.0

