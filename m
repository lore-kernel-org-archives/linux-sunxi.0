Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F335377A8E
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Sep 2026 04:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756487; cv=none; b=UYaHhpRkQTwJ24ndla4T5htJylSGcca0iWicm98rXMPAbHGhYRLUskGrwhwoDdi7pjs8LSmyYadg35l1O4Ef0VcKt7ehARwqrnnMtbrQoKzkSdutC2fJSCWRVGkoJks3rR93li6UWcHdCwNDSXAQ+Pasd/LvD3C/AB0gST8TwTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756487; c=relaxed/simple;
	bh=cc+qS80i91e3iF+LZeQguwZtW8X1bfrYw7jNSRlkhpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QN/DoLogYS4jQeku7+JmB8XF8/SPZ8JXn1StZO936FkOMLOPXtLJGRSTXOQ5v2nOoJcg2cMKiZnOtmKohpj+gMF/Ym85ksWrkwmNUp05a5mh1/peqkyT0XLOD+HGeRIsgrHpRrV3VgZlI9JEKr7sxNPhwRx4+ceQBNSi00nrXWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cS/eLupS; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cS/eLupS"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4563ac048f4so3204977fac.0
        for <linux-sunxi@lists.linux.dev>; Sun, 06 Sep 2026 21:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756484; x=1789361284; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K28+i2/PlfR+JETeUlifhNXKb2RdSy48tKswPz635Jk=;
        b=cS/eLupSxBGMY6wKVUx+ap10Ij+eWnSZEBeCKqn3D3zXSwlZ3i5hiMKq/6l/Zm77u3
         F+pMp3OIB+8xnyX76lMbqYvQB8lwnybkCZWfQLNRnVe1NukrkVDUWBcV8+vWPEOy1Fs6
         k5eTb9Z6A1RkwXy/b3TuG+sDEQIAQgIdWy1XJO1JyA1jO9tNwjrhGcpHw1wH8yv0YqHu
         ReyhbvmvEBT2wGHJm7bcViwmH2fu6HWhEl6hWfKhNrR9l623+9UixAxGlAaypQu1yANe
         KhxlMajgGIDAaCGeAWTp0hjeQrn8nxOm2k7w7JFd7TgCxtr/wJLQ7Ym1XVOCAkS1yT3I
         j69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756484; x=1789361284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K28+i2/PlfR+JETeUlifhNXKb2RdSy48tKswPz635Jk=;
        b=W+XYDEuRHkEdURoHgw9emXWDjDet18ov9/fzDnUj+uiXdGEPgLitKiu0vFJ+RNoaOP
         hubOCQrnajz4g4zN1HIaF3WDpCt6HFAO529SeTuifd1OVDGQ9N/e+s9BWJhmJ8GmDoVa
         qCkoCb/pXpUJLn7uaJy9hyiEdlOCk+4cycEqDEcNvGxRhE4rqQxv8JLq0VY1MReRH/91
         kz23KwSWLEQCYUJyVvspGU/LSbwFhtqh91dU7LvPaAvRUeRj2d7gRGmlIh0wTb5/CBVr
         h5i/obcvR5y/OfJYQ3glh6mLjtnJ/pfKywstiSdr1L2eqYeQIs1O1aP/M8RkX8AKhqto
         FYgw==
X-Forwarded-Encrypted: i=1; AKwUvBxpz2liIolioSvSTSFTv8QpoiKr4Ngp0v0xaIsW8aKgq9QRsa2uVzeOK3aMXnvTuCsMsDymr7jNwMI2uA==@lists.linux.dev
X-Gm-Message-State: AFuF++lwpvzOnZwQSgDM8pyK9vcUTk+Zl9k7u02JD65AL+Mz2quddh5s
	5W0lU8gdJ9EGxrzUp0coVrQZsXMIOqOLUG6am5Pwkk9RTsWnmFe7AgFA0bKpeA==
X-Gm-Gg: AYBFou2jQcV+duu6FiZ8SfH2RKA7QeCNZmRXiLSirJIEecQyoWv8XujqBBmjKswqOQ2
	QYSlhSU/pZ+gq4dYWkPT8qPWBhRylgcQgJN59G4ZWKVlXZapviGTXeNLlvvus4L5WMmqBaZ5OZi
	fpWWG2KNEBDCCX+e/lXbx7db9WggRXG+RpLsx+yY8JxGdPp0ppdqamoiO3zVnDH5BIc/uO10dY8
	nPjd64aP95zkWygNrc/2GYhxvgD80Ld7jyo6r6NZayJYWJktaa1+SADZIonTMKiaMVXQwhMWtba
	mo87XW4WGllRJm9aHQTixxx4i4gEGpV3m7sDwVJgnemcXuKUmbIVdcZKcKFnceeV5l7QlPf++tn
	34487iAnlQhUuMZreIT9w71opTtEh4iW79ONFLgRqzq4H2huwvdXQlpq8sL+maOdD7+dTMZ2AaP
	ycf6wlmkZEjzUoFP0ef6WQsqqFB8RG7ftdNy9Anm6WRwLbkKca9i9+qIuK/9rlamoGUePIadt+x
	CC6s/+evL5ykvwD1M+xOmzZ0OQXZKVuvxOzJjtbsXIXzgA2bUrueqmDekWrmayUmdm83YQ7fsEn
	DL9EK4MO7E/VYdkmu8UXedxorqO6Lk6LlRL2T5Wl5smhA0u4+zLLujzWiCyjJ18xjy8RkcKJf/d
	kcBWMvsIRxu0RoKlQ2F0=
X-Received: by 2002:a05:6870:c245:b0:465:2bde:8b5e with SMTP id 586e51a60fabf-4754f496d93mr15224468fac.1.1788756484281;
        Sun, 06 Sep 2026 21:48:04 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-475501412f2sm9013503fac.0.2026.09.06.21.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:48:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 06 Sep 2026 22:47:46 -0600
Subject: [PATCH net-next v10 1/2] dt-bindings: net: x-powers: add
 AC200/AC300 EPHY packages
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-submit-acx00-of-dynamic-v1-v10-1-dd272e03b547@gmail.com>
References: <20260906-submit-acx00-of-dynamic-v1-v10-0-dd272e03b547@gmail.com>
In-Reply-To: <20260906-submit-acx00-of-dynamic-v1-v10-0-dd272e03b547@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 =?utf-8?q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 linux-sunxi@lists.linux.dev, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

The AC200 and AC300 contain compatible Fast Ethernet link PHYs which
report the same Clause 22 identifier and use the same link-side register
layout. Their package control paths differ: AC200 control registers are
accessed through the I2C register interface of the companion IC, while
the AC300 control range is at a second Clause 22 address fixed at 16 plus
the link address.

Describe both variants as Ethernet PHY packages. The package reg value is
the link PHY base address and the child supplies the documented PHY ID,
because the identification registers cannot be read until package setup
has completed. The AC300 driver reaches its control range with the PHY
package offset helpers. The AC200 package instead references the companion
IC described by the separately submitted x-powers,ac200 MFD binding. Its
I2C interface provides access to the package controls.

Give fixed hardware variant-specific compatibles. Also provide an ACx00
compatible for systems which can contain either package, with one packed
NVMEM field containing calibration in bits 3 through 0, the AC300 selector
in bit 8 and its low-calibration selector in bit 9. Such a description
contains the potential resources for both backends; the driver consumes
only those selected by the configuration field.

Describe the package clock, supply and optional xMII receive-clock
inversion needed by some integrations. A fixed AC200 package may omit the
NVMEM field and use its internal calibration copy. Limit both the package
and child link-PHY addresses in AC300-capable descriptions to 0 through 7
so the control address remains in the documented range 16 through 23.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/net/x-powers,acx00-ephy-package.yaml  | 165 +++++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml
new file mode 100644
index 000000000000..ee90c4ffecce
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml
@@ -0,0 +1,165 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/x-powers,acx00-ephy-package.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: X-Powers AC200 and AC300 Ethernet PHY packages
+
+maintainers:
+  - James Hilliard <james.hilliard1@gmail.com>
+
+description:
+  The AC200 and AC300 contain compatible Fast Ethernet PHY blocks which report
+  the same Clause 22 PHY ID and use the same link-side register layout. The
+  package control paths differ. AC200 package control registers are accessed
+  through the companion IC's I2C register interface, while AC300 control
+  registers occupy a second Clause 22 address fixed at 16 plus the link PHY
+  address.
+
+  Systems with a known package use the corresponding AC200 or AC300 compatible.
+  Systems which can contain either package use the ACx00 compatible and a
+  packed NVMEM configuration field to select the backend at runtime.
+
+  The link PHY cannot report its ID until the package control sequence has
+  completed, so its child node supplies the documented PHY ID. The package and
+  child use the same base address. The AC200 driver programs that address into
+  the package, while the AC300 driver derives its control address from it.
+
+properties:
+  compatible:
+    enum:
+      - x-powers,ac200-ephy-package
+      - x-powers,ac300-ephy-package
+      - x-powers,acx00-ephy-package
+
+  reg:
+    maximum: 31
+
+  clocks:
+    maxItems: 1
+    description: AC300 input clock, running at 24, 25, or 27 MHz
+
+  vcc-supply:
+    description:
+      3.3 V package supply. This is connected to EPHY_VCC on AC200 and VCC1
+      on AC300.
+
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Packed EPHY configuration field. Bits 3 through 0 contain the analog
+      calibration code, bits 7 through 4 are reserved, bit 8 selects AC300
+      when set and AC200 when clear, and bit 9 requests the AC300
+      low-calibration tuning sequence. A fixed AC200 package may provide only
+      the low calibration bits or omit the cell and use its internal eFuse
+      copy instead.
+
+  nvmem-cell-names:
+    const: configuration
+
+  x-powers,ac200:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the AC200 companion IC described by the x-powers,ac200 MFD
+      binding. Its I2C interface provides access to the package control
+      registers used to power and configure the Ethernet PHY.
+
+  x-powers,xmii-rx-clock-inverted:
+    type: boolean
+    description:
+      Invert the xMII receive clock inside the PHY. This is required by some
+      SoC integrations, including the Allwinner H6 AC200 connection.
+
+patternProperties:
+  ^ethernet-phy@[a-f0-9]+$:
+    $ref: ethernet-phy.yaml#
+    properties:
+      compatible:
+        const: ethernet-phy-id0044.1400
+    required:
+      - compatible
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - vcc-supply
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+allOf:
+  - $ref: ethernet-phy-package.yaml#
+  - if:
+      properties:
+        compatible:
+          const: x-powers,ac200-ephy-package
+    then:
+      properties:
+        clocks: false
+      required:
+        - x-powers,ac200
+  - if:
+      properties:
+        compatible:
+          const: x-powers,ac300-ephy-package
+    then:
+      properties:
+        x-powers,ac200: false
+      required:
+        - clocks
+        - nvmem-cells
+        - nvmem-cell-names
+  - if:
+      properties:
+        compatible:
+          const: x-powers,acx00-ephy-package
+    then:
+      required:
+        - clocks
+        - nvmem-cells
+        - nvmem-cell-names
+        - x-powers,ac200
+  - if:
+      properties:
+        compatible:
+          enum:
+            - x-powers,ac300-ephy-package
+            - x-powers,acx00-ephy-package
+    then:
+      properties:
+        reg:
+          maximum: 7
+      patternProperties:
+        ^ethernet-phy@[a-f0-9]+$:
+          properties:
+            reg:
+              maximum: 7
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-package@0 {
+            compatible = "x-powers,acx00-ephy-package";
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            clocks = <&pwm 5>;
+            vcc-supply = <&reg_3v3>;
+            nvmem-cells = <&ephy_configuration>;
+            nvmem-cell-names = "configuration";
+            x-powers,ac200 = <&ac200>;
+
+            ethernet-phy@0 {
+                compatible = "ethernet-phy-id0044.1400";
+                reg = <0>;
+            };
+        };
+    };
+
+...

-- 
2.53.0

