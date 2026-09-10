Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382E429D294
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Sep 2026 00:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788999347; cv=none; b=MGFI3xxQk6sg1o7D9kce/zqwpeMLALXP5dLtwtwANjuxXhZNffy38niLZzgLpct70vqVFm878zlVZBOWpwozd+YGf2o/Ih8Gn6tSUYJC7MWPvt9H8JrVV7XqKdWHylkWihiM2SaKQ5UWsGtMXU+c4wLRyPk86AVU3MECWpGIZZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788999347; c=relaxed/simple;
	bh=xLPiA0DBmtmDhP4JFN6i0AdhaVLCSoeCypLXVz9mbq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qt5ROWJ7VXJjKMMo+2TLTC0HqS+dWgKE+SFdpXOyNVsxXGmU0XQn6YvW+xBFq6qcZbuDm0r13f1r114SIw8q9MgxPFvQLaavJaAXstvncYzfMi5otQbbl5WtU7L6Z6o/wKz1KkmZKS+qOsLVTBvK78pBa/uuMwdinfuLEdmJ8cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=As3I9L1B; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="As3I9L1B"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7ffa69b7462so2351637a34.3
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Sep 2026 17:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788999344; x=1789604144; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHq53JNthhgN14GwB6JcJHW5rTqBpPDjiEjix8XiDJU=;
        b=As3I9L1BEzQmIPXEM79IXWoJaO6I+wamH7zbfH1mv7l45l03NhfeLI4qPQihVv75OK
         88Q7uzk+b1u0TAAMRTdssJPIti3mti085SEC1deeTbCBrwye4FjNZ3gqap6AWkxj7sAY
         c1Fgwf9w+99Xntbon8cGdW+x/Nfw1adqD5kUFD9RFzRg5sUvTMvwcFN2S2asGQ4uivYq
         bvNmfBjhKab+nDO7nHhHlWGBTFz7/7oyf5Fjn+t3vTYnJiWTCmKOHgXhn+vfNQkgB7+C
         C7qypTZ0gfi8mzcXQRIl7vamxfSmxx34h8QyJNinsVIeVf4mNL539ypsGzSenZm1pfxM
         L+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788999344; x=1789604144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHq53JNthhgN14GwB6JcJHW5rTqBpPDjiEjix8XiDJU=;
        b=W4dfU3yTq0xTRL1EkUG6ifjI/ONBYwJNM7U2XZgiG/0IY/kExpSJEYhlW8Vvx+HECO
         SsoDYU0lZYKhrw6EYz3AcxQYDn+q85Vm/ckJLOjpLZAM31KMzpEc5lOT/szrTSeF+F09
         eNfTpD86vpqpRGZ28CBj4aN8ZbM0aM32Y2cbJ9f3Oip9JfJolzsfrqm+32I98S/a609l
         tzPctDFUzItlKF2DPsek7S/Jwut0Dd6kCHzze7sHAf8K/hhPm5ScFCiyAHxi58q0E2yt
         5BZAC41SlyVj0/EFWODKMoUWvE7cAmnKrg8Y3k1nZ77FU6+DAuIenbPWZ1YfLRa0naZ5
         VKng==
X-Forwarded-Encrypted: i=1; AKwUvBxJfLJ0dfqZhUIsaXK3nXNQlWBkSgFDvXf5ioUPZ07UWCLz0d7UVOhekKoBMied0or2N1APGM9RsXJvFg==@lists.linux.dev
X-Gm-Message-State: AFuF++ntWbhrYtIKZehyuH2RE7MVKmGuiEE7HoIrnLBkXn7X69wGVqVd
	l+Tx5vyCL8w74FxlIEgzFrSplPYxqptY95VWhleuWpFhoX18/CKWZ2a3
X-Gm-Gg: AYBFou0FM6RNMUCvTo62+Qq991hITyMIAcHsAsOH8XZZygvHbRmZL+Mo0mpn3CjGzJr
	oSo1QR4QAKfzcbRshha8yX4pWx8i53z4JrFVV0umix5r4zvxQhTGYFfrdcR2QL/r1L33DuH0Xhx
	2+Q2rL1+pi4SGRWc07qppQdC2f9bDiv0ndgKIg5zm9YU3BkOtz14NMJdg8shvIn5fEDh59vKzWM
	nuBqtn4bGMGgFxtaB0xQUc7L5wt+SZzgmDesvQDFpjZv7GdSNIslA0HzZx5eJVlJ8/01zjV4j6A
	p/jUhN06O6v1TXwkHRezR4zH1H6nRsnP1ctBOyL32mzyJ+hQnfuvaFGfrDxXnc2+zX6NPdRhtrw
	N2Ygz1kz9GDDz8qZcZqCBfWbknAp4M2rfzwShmL3Nu/oBsjibgf9HaG0aFkWYiyI6y/6mwBIRmk
	YaZ4xjOFY1pctTSixW4qmBzR4ZJp8VhLl5aDO3UoH9eO1+QqeAdQlNSj7TQ9cBIRGpLo0J9G/IQ
	8ufoaHazgZpLWjsOfX7WtmvCaX4Pfb1nvwA2OMlTIKBBdvr7j7103fnnANx8J2NkuHNNtTHuewV
	YQMRWOtjubdmcbTO64iXmUWiHkOm8K/6w+T4glQ738ImIpo8cu0PJtBSq/Pa/tLApQJ3ThZC8UC
	5kd4OvMbt7CtPieXiafKoDpEbRo0VgQ==
X-Received: by 2002:a05:6830:348f:b0:7fa:ac4f:78e with SMTP id 46e09a7af769-7faac4f0e60mr20603797a34.26.1788999344089;
        Wed, 09 Sep 2026 17:15:44 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7fc68d5ae2bsm12468402a34.3.2026.09.09.17.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 17:15:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 18:15:37 -0600
Subject: [PATCH net-next v11 1/2] dt-bindings: net: x-powers: add
 AC200/AC300 EPHY packages
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-acx00-of-dynamic-v1-v11-1-eb45e89ef918@gmail.com>
References: <20260909-submit-acx00-of-dynamic-v1-v11-0-eb45e89ef918@gmail.com>
In-Reply-To: <20260909-submit-acx00-of-dynamic-v1-v11-0-eb45e89ef918@gmail.com>
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

Document the little-endian encoding and two-byte full configuration,
while allowing a one-byte calibration value for fixed AC200 packages.

Describe the package clock, supply and optional xMII receive-clock
inversion needed by some integrations. A fixed AC200 package may omit the
NVMEM field and use its internal calibration copy. Limit both the package
and child link-PHY addresses in AC300-capable descriptions to 0 through 7
so the control address remains in the documented range 16 through 23.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/net/x-powers,acx00-ephy-package.yaml  | 170 +++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml
new file mode 100644
index 000000000000..781695d9d9f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/x-powers,acx00-ephy-package.yaml
@@ -0,0 +1,170 @@
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
+      Packed little-endian EPHY configuration value, with the least-significant
+      byte first. Bits 3 through 0 contain the analog calibration code, bits 7
+      through 4 are reserved, bit 8 selects AC300 when set and AC200 when clear,
+      and bit 9 requests the AC300 low-calibration tuning sequence. Bits 15
+      through 10 are reserved.
+
+      AC300 and selectable ACx00 packages require the full configuration
+      field, including bits 8 and 9 even when their values are zero, returned
+      as two bytes. A fixed AC200 package may provide a one-byte calibration
+      value or a two-byte configuration with bit 8 clear, or omit the cell
+      and use its internal eFuse calibration copy.
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

