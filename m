Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B5D2DF144
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Sep 2026 00:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789000018; cv=none; b=avKL20y+OUrmL2vbfPMwrdvGvrc1ign/57lGhwNncQZl+uqlaQqRjUwCjIF5qcKmytheVfkxwlMoAL2Pguv1oMk2fcIb8MDiooWH8tyuoTZRZiub+WHz2j55RBHZGLtFSDK28PgA8ATyWnzImuWAudMMZIwRH2X7EGkvP3MuSnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789000018; c=relaxed/simple;
	bh=LUDT1kHiXHBCnePbIaYBUJQHAxuAaQl4Sg3kYNxuzRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N/2g6Qvf3tlUX0Rg4ievTXgdFAszxtYvBo61p2eBUZTP0YBt8nTRou7owPkRm6gmGjbjzeUKEZ3Y7+AlnkaVusZ6Jdflo4lp3gZEWP1y0vC2JKTyVJZkAAgJR1YsyHQslMyjX8OXwvVBfC4i7srP6KzMbNEUfh6qSIFu8r7x8JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDwNq6Z3; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDwNq6Z3"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7ffa69b7462so2357873a34.3
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Sep 2026 17:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789000014; x=1789604814; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTa0efMcyPx+a3sRs/5/R1BWxQ19AFGAD7UOiV7rwak=;
        b=ZDwNq6Z3bzvpDR2zuIW8Zmdf3OX3SYSb9AUrtMR/BN32hn1Z+tvRWMAj+HsRtxbzdL
         3pAYQl32g1dYtU82dX4aQDvJ3XSKPu3nE3FYcbQEHF3jcbzYzEV8I3T1nnrqhtfPPFtA
         4WM4AhynH03kQB5iIirTOuhe5eD+9GRkHfVsWM4SYwfdC7YJtAiPfdVW79bCueiZyKFh
         7KEtlLf8bL6QvyaGIs30OEgWikvEjKcgwTDaG3uS8ntANKPVrUtFsWfya0+AIo7fmyxO
         yPxwduoEgaQZivcBoi2JvNW00E9rwAvamJk+wUkDmXUNZAeTafoczhFtUUfP1/wAja5q
         N5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789000014; x=1789604814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTa0efMcyPx+a3sRs/5/R1BWxQ19AFGAD7UOiV7rwak=;
        b=VURTfK6EDla+3wqeGqjub2fJCI+E50WncEo9nGiAR/zZsUfX5a0ITp92xfW/p6JDzb
         xyfK/5Q0DStSsCEDy/+tgwe8CFl3NJCfwd4djTNUupymwo6msaCmYz9TzVe22FNhWrWN
         8V2Ajyg4QLFFRKwLBBdUsLIQZqU21vjvw5saR+/+jsu5SPgABB1EYA1ePhPY4bahQ8ck
         WvjbsmncVbCFMuKPedX6kz9qm+Z1Cr/g2G+/M919VtKNdLaxtkF39Djpp17zht7wOcTK
         /axAqA1F5l6qK4JLkJijFkQgAY/h6/c4JrNUt4eVhbV/4DP/SdxvyJbuZJqEYvIdfrbj
         crkA==
X-Forwarded-Encrypted: i=1; AKwUvBxb20U7v6TFsp0OPR5qAHiMIHY2sqzrBv1FXJCE/J3ZpPKZbAFgbPx+pkNkilmdodA3vQ8IRq/CBhq0KA==@lists.linux.dev
X-Gm-Message-State: AFuF++kHojIfA0KxwSjiqXnez2iEK1P+o+wXC3I0cvkMMHD9a+g83mvU
	hcImMu6EV9jO59PyOZSK4jJ2NC/vSJ3CirFhXWwJtBS9706nTVbaH8YC
X-Gm-Gg: AYBFou0wSpGjWqR3jynBMWcx828DtOB8okQLuZ9qqBo3gGwMd7vEWJYLnAN9sARypuX
	iB4tVcUxfCx35qqEir6tfqBmzChkhi3wZr3KcV6HEHwrQaBizSlWtwlFujoK4EXDgzawNl8su8s
	miJVo0hcx/yhMorIa9MAIbGv+8anNDabzbkQSqS49hBq35qqe5I7Y4E6ysgxOZUA5QERkKQSysk
	ZUOPZKlW6tvX0/FDVpSwK+T6JV6hqcXZknEdEaiy+GK7iEZssMZwY1TLudOGc9bD5UDBjFwxDiW
	W+pkn26Beo2emswD3g0lxmUA6jfRlYIOhE64qoBthFdan008Lgu5zg87MLlyAy/VzSe2ebFK4Vk
	ft6050Xfqo/FM2jNQzHwnGNFd/51gYWS4zNjJli68Ry4TPnAITUh6UojBG3czLfnJ9lx+I846te
	Cq9pnPl8jFoO2DWWWw3k6Gw+C6GTQ2LtviO1P1rfxCLpas4qPfgkrVh9oM+9mGsexe3HbozZxir
	mDu8OsBwnKkJR7EPsFRg6SNtCPVE/CGpHiGXmjdM4AAU+JcMBEMG8STlO3uJpq7kW98TU4A/6jy
	nkS2P8A8Os6yw+WW60qWMI8MmVRVtFKUdlDAPXGnzufYMJgSI2+7ZOeNiwl/X52S2k9HMWyZ1KC
	GVJ++lZUSFW8zqFsDMMHsuVU4/DSsSsBY2h69CBt3
X-Received: by 2002:a05:6830:3509:b0:7dc:c749:ade3 with SMTP id 46e09a7af769-7fa1deab695mr24907263a34.3.1789000014269;
        Wed, 09 Sep 2026 17:26:54 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fe2fbf5db8sm10182789a34.25.2026.09.09.17.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 17:26:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 18:26:50 -0600
Subject: [PATCH v12 1/2] dt-bindings: mfd: x-powers: Add AC200
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-ac200-mfd-v12-1-a44d6bc30a4f@gmail.com>
References: <20260909-submit-ac200-mfd-v12-0-a44d6bc30a4f@gmail.com>
In-Reply-To: <20260909-submit-ac200-mfd-v12-0-a44d6bc30a4f@gmail.com>
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
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

The AC200 is an I2C-controlled mixed-signal companion IC containing
audio, video, RTC and Fast Ethernet PHY functions.

Describe the shared input clock, audio DAI, TV encoder display graph and
optional bandgap calibration in one parent node. The codec and TV encoder
do not need separate firmware nodes.

AC_LDOIN and TV_VCC are distinct 3.3 V supply inputs. Describe them
separately without requiring different external regulators. Require the
audio supply when the DAI is described and the video supply when the
display graph is present, while allowing PHY-only configurations.

Describe the optional shared INTB connection without an internal
interrupt domain. Cable detection status remains readable over I2C when
INTB is not connected. Include wired and unwired examples.

The Ethernet PHY is represented by a PHY package on its MDIO bus, with a
phandle back to this device for access to the package control registers.
It therefore does not require an MFD child node. The input clock must run
at 24 or 27 MHz when the Ethernet PHY is used, matching the rates encoded
by its documented clock selector.

Co-developed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/mfd/x-powers,ac200.yaml    | 168 +++++++++++++++++++++
 MAINTAINERS                                        |   7 +
 2 files changed, 175 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
new file mode 100644
index 000000000000..75dafa7c1071
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
@@ -0,0 +1,168 @@
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
+  The audio codec and TV encoder are described by properties of this node.
+  The Ethernet PHY is described separately on its MDIO bus.
+
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
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
+      The shared, level-triggered, open-drain INTB output for the TV encoder,
+      Ethernet PHY and RTC interrupts. Omit when INTB is not connected. TV
+      encoder cable detection status can also be read over I2C without an
+      interrupt.
+
+  '#sound-dai-cells':
+    const: 0
+
+  ac-ldoin-supply:
+    description:
+      The 3.3 V supply connected to the AC_LDOIN pin for the audio codec LDO
+      input. This may be the same regulator as tv-vcc-supply.
+
+  tv-vcc-supply:
+    description:
+      The 3.3 V supply connected to the TV_VCC pin for the composite-video
+      DAC. This may be the same regulator as ac-ldoin-supply.
+
+  nvmem-cells:
+    maxItems: 1
+    description: TV encoder bandgap calibration.
+
+  nvmem-cell-names:
+    items:
+      - const: bandgap
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input to the TV encoder, carrying CCIR656.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output to the composite-video connector.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+dependencies:
+  '#sound-dai-cells': [ ac-ldoin-supply ]
+  ports: [ tv-vcc-supply ]
+  nvmem-cells: [ nvmem-cell-names ]
+  nvmem-cell-names: [ nvmem-cells ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
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
+            #sound-dai-cells = <0>;
+            ac-ldoin-supply = <&reg_aldo2>;
+            tv-vcc-supply = <&reg_aldo2>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    tve_in: endpoint {
+                        remote-endpoint = <&tcon_out_tve>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    tve_out: endpoint {
+                        remote-endpoint = <&composite_in>;
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
+            tv-vcc-supply = <&reg_aldo2>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    endpoint {
+                        remote-endpoint = <&tcon_out_tve>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    endpoint {
+                        remote-endpoint = <&composite_in>;
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..419340093c9b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29504,6 +29504,13 @@ F:	drivers/net/wwan/
 F:	include/linux/wwan.h
 F:	include/uapi/linux/wwan.h
 
+X-POWERS AC200 DRIVERS
+M:	Jernej Skrabec <jernej.skrabec@gmail.com>
+M:	James Hilliard <james.hilliard1@gmail.com>
+L:	linux-sunxi@lists.linux.dev
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
+
 X-POWERS AXP288 PMIC DRIVERS
 M:	Hans de Goede <hansg@kernel.org>
 S:	Maintained

-- 
2.53.0

